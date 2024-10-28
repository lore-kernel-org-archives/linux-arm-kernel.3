Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAC6D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ive04fAUcHY56no938UnG0QkakG/JmOK4QV50mkizYw=; b=DkZFnORMnTJcJ4NpvWoXU9iJPR
	OVmUS52EE8njiLJbe/MfRxJUuhK7febQ0ERqZeU76vjDIbotf0CxJdP1sLH63pzVy99BIf9F/vz4A
	+pbPnzfx28z81L5QpXURNtCT5Ez7aRQD+R7fZHzOqqeYPRmBbMs1QU3gZlklOOCHaADgJR5KnegLZ
	kINOC7A9dAbXrgA4liTsWNU4/LLC7HtCIL66oNNDbANUjotxWI35S/miij60ov4nYYs/GQ5hnsWC7
	NUomyILCb39ZhHqP5pj+j2q5vlM+QWXJ49bi/KTTl1lIzoVu3fJjSMPWCwCyulMkLKGz5BcyFV3Jq
	clq0ziKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rn7-0000000BKlF-1Q4v;
	Mon, 28 Oct 2024 15:36:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RGH-0000000BEFU-043n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:02:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B897E497;
	Mon, 28 Oct 2024 08:02:55 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 093E23F73B;
	Mon, 28 Oct 2024 08:02:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-msm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
Date: Mon, 28 Oct 2024 15:02:19 +0000
Message-Id: <173012760863.2640678.4629591944887916314.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
References: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080229_211887_845C508C 
X-CRM114-Status: UNSURE (   7.10  )
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

On Wed, 16 Oct 2024 14:13:38 +0800, Xinqi Zhang wrote:
> The scmi_dev->name is released prematurely in __scmi_device_destroy(),
> which causes slab-use-after-free when accessing scmi_dev->name in
> scmi_bus_notifier(). So move the release of scmi_dev->name to
> scmi_device_release() to avoid slab-use-after-free.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
> Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
      https://git.kernel.org/sudeep.holla/c/295416091e44
--
Regards,
Sudeep


