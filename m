Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE24C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k27fO7henKnq4UPnDJ7hnHW2OVYLSMfn/J8w9qfUsF8=; b=sYEXTELzqptmL6iEvNWU/hrLjK
	DKomlD6VzNr4w8JazR487bxTioXGmRYeAPL9paGqyXZG24Ln+wNEBqY2vYuvOhnw7c16smm4snv00
	AAeVHZGoKvkJhsuVuumlknHa3Q5cv/OVro8YYQ/bXSXkVuYU5uK7EEPrhcKU+FJP80x3Xg+UMpHHg
	V8Bs/RsMGeg2dVdtzi0UmgHkarIn+3QrOdAtgekdcf1gmxXUv6JAC1sRrVbkxV80WUETx/EPJXvvD
	reFFhBKzQEXH1+4WYYrucU/hcol/DYQh1DlaTV+M4buFu1+DqhPfp4z2eET9UgCpwqWlovatBc08j
	i7TY+56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzkT-00000009Aqw-0cwj;
	Mon, 19 May 2025 12:37:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzQU-000000097Nj-2fTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:17:03 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747657018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k27fO7henKnq4UPnDJ7hnHW2OVYLSMfn/J8w9qfUsF8=;
	b=MjjivDDYyJR2hfCPEDkEYDfh2V6bEly/UssS0T63VB9O0C+TM8a5a6ZetMdVipO4btpgsp
	69psghpmQ28ifE+yzLBrcOtMju+HtY9Mn9iXU8WLrLko61Ee2gxVBDn5urZxnRPkMAlOa0
	i8oTOL34hK0uHCEtZRq6kN/xcJlP2FdB5pzQ/FOj1+KSr6hiDjKkUKkSZOPUtX8MnrM/CA
	+esaRZgcHJ/lKAMZro0oyVZlCskiE+zR7W5RU32S5IZib7HO6ZT0AkJIK4AtCWlQx/Amy4
	Pg8lnPrb061e1Gi1DdWyCUNYSTBIMhe1YtvLXo6fsx8n8IYToa6hjq40EgUKUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747657018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k27fO7henKnq4UPnDJ7hnHW2OVYLSMfn/J8w9qfUsF8=;
	b=WB/Q5r8EZiZ3SPP6wnORvG2F0zUMrX+ovCj1NeKg0YpcoPoen2Rud3xa2bKOqMiknxsge0
	8Zg7ET7P2j+trJDQ==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the
 prepare call
In-Reply-To: <86wmacewjr.wl-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-6-maz@kernel.org> <8734d1iwcp.ffs@tglx>
 <86wmacewjr.wl-maz@kernel.org>
Date: Mon, 19 May 2025 14:16:58 +0200
Message-ID: <87zff8hk1x.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051702_813980_D58CC3F2 
X-CRM114-Status: GOOD (  14.30  )
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

On Mon, May 19 2025 at 11:15, Marc Zyngier wrote:
> On Sun, 18 May 2025 19:53:42 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Tue, May 13 2025 at 17:31, Marc Zyngier wrote:
>> 
>> > Now that .msi_prepare() gets called at the right time and not
>> > with semi-random parameters, remove the ugly hack that tried
>> > to fix up the number of allocated vectors.
>> >
>> > It is now correct by construction.
>> 
>> FWIW, while looking at something related, it occured to me that with
>> this change you can enable MSI_FLAG_PCI_MSIX_ALLOC_DYN now on GIC ITS.
>
> Maybe. It is rather unclear to me what this "dynamic allocation"
> actually provides in terms of guarantees to the endpoint driver.

It allows the driver to avoid allocating a gazillion of interrupts
upfront during initialization. Instead it can allocate them on demand,
when e.g. a queue is initialized. Of course that means that such an
allocation can fail, but so can request_irq() and other things. I'm not
sure what you mean with guarantees here.

Thanks

        tglx

