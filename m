Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5DeqBZU1L9QeN9+jSLCKVus5CfdrhjiOwXPQY3ZMZs=; b=oKnZ+xlBf4btVXwoV9W4WiLWSS
	JQujBJjgz18uahhMqpzhL+zILjUPtS1rl0sIBeUjlcqq/kCQHfpY5ouBzdHoBKiV9ACmmIta7FAgf
	PhaQidnipdjIFOLXl7OF/Qh4uCm7GNBt3VkCtxRmzcKUJFngqDkXuFDNnis1Ua4w9XcU+M1wYZEze
	f9Ug4vDaZPBbz63pH6qwDnOgJN8AmENO6CKT5b004C31cbqmZZistWWPvKhoUWsYZfPYxKt4jtHfp
	PRFi7MjmZMUWeNUzvMbg/lTrUmELn+oo89ztELseb7qPLE90qK3HYwoSAWAVr76NbgtE2wtKj9DX5
	4zpNtuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIgk-00000000UsJ-2rzP;
	Tue, 04 Feb 2025 13:10:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIfQ-00000000Uih-0bp1;
	Tue, 04 Feb 2025 13:08:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738674517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5DeqBZU1L9QeN9+jSLCKVus5CfdrhjiOwXPQY3ZMZs=;
	b=4XCkX00gNx2wQJKBGnIkm5Orn7cKaAc/gnIn3rVSJ9P/cbTwnQ/y2YTjbwPByi8sgGthTn
	h6VDvqD87nlQqv+SsDJPPG7vz3qhlYMdlHHhIf8snhVJ72kLNmfH49PbgSpPCbWWjpFYad
	yVSiR9T48gxWZSj/+r96aCh3usUiA9yVS7QOdjrIVA7xlOr7vS4V+rQLfw1Yud8IoUZ/m9
	ezGfQqYAIiO4fjXW5hCOEYm1eCEOURVm0BFOEghdww7bpPVDXp9wU83ZLlVQiHvaRf/0ec
	1Q/ijZyMac/8zyTHHYh6W+v4Z5i0hLNJGW/lFlRGV+gGGu8gsGScBesa0nw+/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738674517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5DeqBZU1L9QeN9+jSLCKVus5CfdrhjiOwXPQY3ZMZs=;
	b=l5jNDgfoExDvAIV8gfDzxRuGhJnYeLAIb2W3ik0rpczuqULHv9Mk0dEXvrelr5BiTIAHCX
	/Mlcexpsp2eNEWCA==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
In-Reply-To: <20250204075405.824721-2-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com>
Date: Tue, 04 Feb 2025 14:08:37 +0100
Message-ID: <87frktoo16.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_050840_321889_15C6830B 
X-CRM114-Status: UNSURE (   7.66  )
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

On Tue, Feb 04 2025 at 13:23, Anup Patel wrote:
> Device having non-atomic MSI update might see an intermediate
> state when changing target IMSIC vector from one CPU to another.
>
> To handle such intermediate device state, update MSI address
> and MSI data through separate MSI writes to the device.

As pointed out in the other mail, this intermediate step does not fix
the issue. It requires that the MSI message write happens on the
original target CPU so that an interrupt which is raised on that
intermediate vector can be observed.

Thanks,

        tglx



