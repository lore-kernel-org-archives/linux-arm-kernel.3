Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45C5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP5V8h9bz4N4y+UufT2Bd637DqN1KpVRAX/7F9z8sMc=; b=xlWJPgoG+VAXe6tgmLeIAolOCO
	XXolswQCRVaG+CRDbHF3pLjaUSqw8Dt0zOS41t2f9x6fDKbNVRYsIZCdl8VCuapZT/tTiRmjJj9gb
	/DDENrkfRITufu8OvvT8reuWgRgJYWGqjoUR6JGz5TECdtm44V3Pqg7ysKF4nx7ZbEkc7VixWQVsE
	C85UYHe4NxXaA5Qx2Itcl5SfMX4A5vuzvEg7w73MLB6Y+hL3a/PkDz/HcA/pA5JD+vJXjfgls5fhd
	WZ+Rbz4XpZxGZg73/a78qrZEp+kWtbHIu9yORJH4xNwIxmBQjgDwVOxmfptfZ74DMU0cMgF9Pj32S
	eR55lMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYL0I-0000000EAkn-1uoS;
	Thu, 16 Jan 2025 08:13:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKz2-0000000EAPy-0gwr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:12:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737015125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AP5V8h9bz4N4y+UufT2Bd637DqN1KpVRAX/7F9z8sMc=;
	b=cVzLE1Hh6gWDZEJ7GeazV4QKljmFr7aSPP1ZM5v2l6SfYH6z48oOEjlHGWqaLrN7BHeAS4
	vUhSk8ki3zrxFCgsEjPooHv/kIZwjFfwHlCFDI71QvugzHY6HH5i5CtcIaf/POze3oemPX
	ImnbtU/x2dabRN4rlhJgKeiQaImkJYnZt+2MdlWO6vnMSiSCaSTLCFP7T9VoqnMKs7dV/T
	HxP0BJWxw/uBeLFnrEX44l40SsbhE2gqqgF38HopjjGGTbX9P490pEAWNwhLwW1AR42mgl
	3NYxBgbBsrjlA/LuwKMrXCJKm3dKDIb9m/uZtYmSr3FRAVz6D5pkEcolPIEMPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737015125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AP5V8h9bz4N4y+UufT2Bd637DqN1KpVRAX/7F9z8sMc=;
	b=cYfU2YjK4EiPkUKB+SIf376TOC73FmI4Kkle9mwlGMroMpmlm56SN+vz9tPQPXmpZbUgG+
	sXN9CdZYeD3u4TBQ==
To: linux@treblig.org, florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, x86@kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Dr.
 David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH v2] irqchip/irq-brcmstb-l2: Replace
 brcmstb_l2_mask_and_ack() by generic function
In-Reply-To: <20250116005920.626822-1-linux@treblig.org>
References: <20250116005920.626822-1-linux@treblig.org>
Date: Thu, 16 Jan 2025 09:12:04 +0100
Message-ID: <87ed13b2jv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_001208_341771_E4D6F3AA 
X-CRM114-Status: GOOD (  11.67  )
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

David!

On Thu, Jan 16 2025 at 00:59, linux@treblig.org wrote:
> Replace brcmstb_l2_mask_and_ack() by the generic
> irq_gc_mask_disable_and_ack_set().
>
> brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
> ("irqchip/brcmstb-l2: Remove some processing from the handler") in
> September 2017 with a comment saying it was actually generic and someone
> should add it to the generic code.
>
> commit 20608924cc2e ("genirq: generic chip: Add
> irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
> one went back and took the brcmstb variant out.

That's too late. The original patch is already applied and I'm not going
to redo the whole branch for this minor hickup. I've converted it to a
delta fix.

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

You cannot add my Signed-off-by to a new submission.

Thanks,

        tglx

