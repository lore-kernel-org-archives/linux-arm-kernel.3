Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47976C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geZtNYrj+XD0JEXtVNjIWNCgJMc3ZKET945SuPJR0hg=; b=alHJ1B790nekM6956dhji/lcHD
	d3kk3gqaojaFVYS3MSDmIEPHpu9Jbloh6lrZSnoqBr6kTIzj6uIMpe8fqN5R48z3cfZZmR3G5lIZK
	LwotfNOX2l+c66aER5c9gzZ8/tYESAl9qgHDeUkuiJIlI1myFU/CzsBREvKg420AvOdTy53/Lnkzk
	dF7ivA4Iyvoqt3Dw68OJDz5kqJ0Y/ZcByLMLWz/elWzlKtyxJSNbFhGIPOLS7jqAZBkaACKSsmEIJ
	1Ldq76ycpmBUdc66Kw9WiEwEZ2JAvRIirbe9rzSVxH0GeoUAfMYOEOH90L1Ro+dt+c4Td55lW22cC
	6BBsTvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnawX-00000006yGN-0xuv;
	Thu, 27 Feb 2025 10:16:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnauz-00000006y2J-1Kb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:15:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 292AE2BCC;
	Thu, 27 Feb 2025 02:15:16 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FCE23F673;
	Thu, 27 Feb 2025 02:14:59 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Explicitly cast return value from FFA_VERSION before comparison
Date: Thu, 27 Feb 2025 10:14:57 +0000
Message-Id: <174065123542.2364600.7340078100778272878.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221095633.506678-1-sudeep.holla@arm.com>
References: <20250221095633.506678-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_021501_794617_00EEAAE3 
X-CRM114-Status: UNSURE (   8.29  )
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

On Fri, 21 Feb 2025 09:56:31 +0000, Sudeep Holla wrote:
> The return value ver.a0 is unsigned long type and FFA_RET_NOT_SUPPORTED
> is a negative value.
>
> Since the return value from the firmware can be just 32-bit even on
> 64-bit systems as FFA specification mentions it as int32 error code in
> w0 register, explicitly casting to s32 ensures correct sign interpretation
> when comparing against a signed error code FFA_RET_NOT_SUPPORTED.
>
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/2] firmware: arm_ffa: Explicitly cast return value from FFA_VERSION before comparison
      https://git.kernel.org/sudeep.holla/c/cecf6a504137
[2/2] firmware: arm_ffa: Explicitly cast return value from NOTIFICATION_INFO_GET
      https://git.kernel.org/sudeep.holla/c/3e282f41585c

--
Regards,
Sudeep


