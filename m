Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D85C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIlOuZD2sFILwDfe377Xj9XrVUCfYenFT7MvEeo+JmQ=; b=TAERAkyMqB6kb4DSfhtvqMTRkK
	2Bxc98WOZJAwaDboINIib/LEd+cWkWy4dhuSls6MjSym0ECnrRuZa+SK/Ay0tub9FbepHej36a9kn
	2aW2Ky/fcaXSMUFJeVosxkWCpJx9Xu2Eab5PWOKBUZh2vFkgPQ7BosaF1VB7mQ3exX2i00Y//iirI
	Ky3NdXmQsmR3q3pTF15Vm6XojnYG0zoDuYHNY1/NGZB5f7+8TyfP4mW6TgbWnavT3zKynfSkboTv9
	8mtBXya6Pn+WY76I3j2TuiFXeruFPxJ1wT+SQXZm4A9KhMYrUSX+lI9rBAEjf97bMn1W4rceEk80G
	zg9hZaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAuF-00000005vcq-1oyh;
	Tue, 08 Jul 2025 16:10:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAH6-00000005op0-2ifX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:30:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B751A153B;
	Tue,  8 Jul 2025 08:30:15 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 686463F738;
	Tue,  8 Jul 2025 08:30:26 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	peng.fan@oss.nxp.com
Subject: Re: [PATCH] firmware: arm_scmi: Optimize notifiers registration
Date: Tue,  8 Jul 2025 16:30:24 +0100
Message-Id: <175198844540.786463.17262807646940735306.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707144220.485365-1-cristian.marussi@arm.com>
References: <20250707144220.485365-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_083028_729280_ABF32018 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 07 Jul 2025 15:42:20 +0100, Cristian Marussi wrote:
> Some platforms could be configured not to support notification events from
> specific sources and such a case is already handled properly by avoiding
> even to attempt to send a notification enable request since it would be
> doomed to fail anyway.
> 
> In an extreme scenario, though, a platform could support not even one
> single source on a specific event: in such a case would be meaningless to
> even allow to register a notifier and we can bail-out immediately, saving
> a lot of needless computation.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!
(with some commit message changes)

[1/1] firmware: arm_scmi: Optimize notifiers registration
      https://git.kernel.org/sudeep.holla/c/b5daf93b809d
--
Regards,
Sudeep


