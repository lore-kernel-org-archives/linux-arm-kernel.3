Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AEBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6JppIYrmEDWEBmdblA7ULIVxZIHJ3mliKKCj/J+dUc=; b=NgdB2PZRhPyzDjLg1M41Qg7R/Z
	o47GyUe80GcNqpheQD0zRmkx1zLxwHoy0w7k/H3OxlmnKXMtfM51D6D9aC0qXAkq+P9XoApAsMLk9
	wRjJnV4/DwSLIoLFIG96MMBsLlFREA0uI6boQhXuLzthuvZjs+OyuMkR89VcLN5dcP+Ea/Y867j4L
	3Ll8i/XcDFJtXmosirgKXk8J2LoXKFgvNrACag9ZQMFjwJnfLqzkx0qwUZ/ReVozAIJlvmB9wFB0c
	XLDimmZDSFVV7TLcnMrzKDO8b8jcKxfVCTkjBZJT++ctMwYYF/JIyV040hmXZpBvg3zWVe2kCSeYW
	Yz/bDvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRLR-0000000GVtc-2z4e;
	Wed, 10 Sep 2025 20:23:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRLO-0000000GVoV-406P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:23:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757535785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6JppIYrmEDWEBmdblA7ULIVxZIHJ3mliKKCj/J+dUc=;
	b=asz8WCyf9cnS3BMBwtrU3ZqPWzgbaNDidcLL/dq7mwu+tfHouh4PlTUSVHH2aevv6qaiiH
	mrFRl4Ffda2v4nbsGVWwJpSXd0AWFZS4ixEpY0w2s/zsJ3CwVjx0fUwb3xYY6doaOYPBCu
	7TWTlLTtVFU3GodRA0gVBSJS+wFyBAohRtGm0EegZuo5JtvQJ62TslVKJ53vNaW7K/ZKvk
	FwzRmBtruktBOAwqctDK8yB4IPdPQPIL+unA31zsjlybTc1Boz8DuyopiK38ghL0h+nfpK
	RagXnDR1bh3kcMMvL5+xcQBzmejEh9UxWpC4rYNhujuDSu37sn/bfrcuqOfPmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757535785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6JppIYrmEDWEBmdblA7ULIVxZIHJ3mliKKCj/J+dUc=;
	b=N7gQndas+HW+vhHMKOorVfZL45dU91oZcvccxJZRsxCAxGlqVlCitko6PEVkq+D+6Ov6Q+
	hATZLZFP+SUt2cBw==
To: Guillaume La Roque <glaroque@baylibre.com>, Nishanth Menon <nm@ti.com>
Cc: vigneshr@ti.com, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] soc: ti: ti_sci_inta_msi: Enable module
 compilation support
In-Reply-To: <0bc124c7-55af-4a25-b02d-3bd9aabf0266@baylibre.com>
References: <20250812-timsi-v2-0-90c8500f3f18@baylibre.com>
 <20250812-timsi-v2-2-90c8500f3f18@baylibre.com>
 <20250813152610.akcdxrzhev6e2kfa@unturned>
 <0bc124c7-55af-4a25-b02d-3bd9aabf0266@baylibre.com>
Date: Wed, 10 Sep 2025 22:23:04 +0200
Message-ID: <87ldmmrr9z.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_132307_155515_75BE103B 
X-CRM114-Status: UNSURE (   8.73  )
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

On Tue, Sep 02 2025 at 16:40, Guillaume La Roque wrote:

Can you please trim your replies?

> I will resend weries because something look not ok i don't find serie in 
> lore or patchwork.

>> If Thomas doesn't mind picking the full series,

Is this actually addressing my previous feedback on this?

   https://lore.kernel.org/all/87cy87zx87.ffs@tglx

>>>   config TI_SCI_INTA_MSI_DOMAIN
>>> -	bool
>>> +	tristate "TI SCI INTA MSI Domain driver"
>>>   	select GENERIC_MSI_IRQ
>>>   	help
>>>   	  Driver to enable Interrupt Aggregator specific MSI Domain.
>>> +
>>> +	  Say Y here to compile it into the kernel or M to compile it as a
>>> +	  module. The module will be called ti_sci_inta_msi.

I doubt it, otherwise this would not exist anymore.

If you disagree with me, then have the courtesy to tell me why. Just
ignoring me is not an option.

Thanks

        tglx

