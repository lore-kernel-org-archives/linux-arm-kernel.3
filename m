Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF78E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa/eRmj9sytyxrud4O4mAvjeRx/S9NypgThFLDmDcCE=; b=zFexwU137/sCz2cN7QYtOaxL++
	Ibl95Er4FAhnBySx1SPE7hVzG/XvoeuDGMnrsr3M8utnINAQz6dI5ZtDwFdUvr82tDMdyisMIPerR
	/Zzs3a1iUlIC4JnyifTWG5CPbJRVXGlnWo9I5FUj0V7Y9BT3LCM8tc9I3a09HydfdGoRjuLjwXY4v
	dnl6uO87GqXRerLyodU8WIRLC+ZVlFkvzbK4TtXYPT5fAfQ6+cHgkLvY3Ozea+zqlgwGdtopByqrO
	aWB7UxNQBUGjLyWYPXK/4O9b+QgncoMuX8PECeUxOQbtZ4HEHCV9ot8M7Tki/VAvzt+NoJgwApQpc
	WRA2dc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg6f-00000008S9S-3WGc;
	Mon, 09 Dec 2024 15:55:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg4i-00000008Ro5-0oYe;
	Mon, 09 Dec 2024 15:53:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733759610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa/eRmj9sytyxrud4O4mAvjeRx/S9NypgThFLDmDcCE=;
	b=Ykr7ZkxqH+rHf85Xrj7aG+Lm+COeUJB7sSvEhIQX7r7g0TwE81qtfgtCxTODRzFZ+NGi7D
	+SK6ikPzhzfRcle7vTYH8T3Rz11u4xVeLGYboZuoDf/GtrUW0YWdKmcbXyZiuuSPB/i/Gs
	0cYTX0XvY3sw9SlgygwKpdp7QkhThC5xVdcppxnbCVOAc6QJ5/o5BckCrtPd1O8PdQ8opn
	mz2pVwzYBL//F6pNBm4DopJCTDMseN2OsoVWmDyqxoa6tFQ28yshIkhV9mPjTD5hv74ERv
	HOoCreIJah+0eKDO6mwPcDMEyXHV9TUvoyB6Zi8LEsLa2WRxH8P6hGM7yFHS1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733759610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa/eRmj9sytyxrud4O4mAvjeRx/S9NypgThFLDmDcCE=;
	b=mEGMYqFqXVsV1WU4zD3oERVxJV8xPiOpwHIShLDSIpc44nxTYpe8IO6Y5H/V3ZQV8ipTLT
	/X781OAzFoM2DGCw==
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
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
In-Reply-To: <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
Date: Mon, 09 Dec 2024 16:53:29 +0100
Message-ID: <87r06gq2di.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_075332_529764_93B2C9AE 
X-CRM114-Status: GOOD (  26.45  )
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

Anup!

On Mon, Dec 09 2024 at 17:38, Anup Patel wrote:
> On Mon, Dec 9, 2024 at 1:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>> There is no guarantee that set_affinity() runs on the original target
>> CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
>> by some other device. If it's used, you lost as CPU1 will consume the
>> vector and your pending check is not seeing anything.
>>
>> x86 ensures CPU locality by deferring the affinity move to the next
>> device interrupt on the original target CPU (CPU1 in the above
>> example). See CONFIG_GENERIC_IRQ_PENDING.
>
> I agree with you.
>
> The IMSIC driver must do the affinity move upon the next device
> interrupt on the old CPU. I will update this patch in the next revision.
>
> BTW, I did not find CONFIG_GENERIC_IRQ_PENDING. Is the
> name correct ?

CONFIG_GENERIC_PENDING_IRQ is close enough :)

>> The interrupt domains which are not affected (remap) set the
>> IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
>> setter code path at all.
>
> Yes, setting the IRQ_MOVE_PCNTXT flag in the remap domain
> makes perfect sense.
>
> I suggest adding IRQ_MOVE_PCNTXT usage as part of Drew's
> irqbypass series which adds a remap domain in the IOMMU
> driver. Unless you insist on having it as part of this series ?

You need to look at the other RISC-V controllers. Those which do not
need this should set it. That's historically backwards.

I think we can reverse the logic here. As this needs backporting, I
can't make a full cleanup of this, but for your problem the patch below
should just work.

Select GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS and set the
IRQCHIP_MOVE_DEFERRED flag on your interrrupt chip and the core logic
takes care of the PCNTXT bits.

I'll convert x86 in a seperate step and remove the PCNTXT leftovers and
the new config knob once the dust has settled.

Thanks,

        tglx
---
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -567,6 +567,7 @@ struct irq_chip {
  *                                    in the suspend path if they are in d=
isabled state
  * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before start=
up
  * IRQCHIP_IMMUTABLE:		      Don't ever change anything in this chip
+ * IRQCHIP_MOVE_DEFERRED:	      Move the interrupt in actual interrupt con=
text
  */
 enum {
 	IRQCHIP_SET_TYPE_MASKED			=3D (1 <<  0),
@@ -581,6 +582,7 @@ enum {
 	IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND	=3D (1 <<  9),
 	IRQCHIP_AFFINITY_PRE_STARTUP		=3D (1 << 10),
 	IRQCHIP_IMMUTABLE			=3D (1 << 11),
+	IRQCHIP_MOVE_DEFERRED			=3D (1 << 12),
 };
=20
 #include <linux/irqdesc.h>
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,6 +31,10 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
=20
+# Deduce delayed migration from top-level interrupt chip flags
+config GENERIC_PENDING_IRQ_CHIPFLAGS
+	bool
+
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
 		return -EINVAL;
=20
 	desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_chip);
+
+	if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
+		if (chip->flags & IRQCHIP_MOVE_DEFERRED)
+			irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		else
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
 	irq_put_desc_unlock(desc, flags);
 	/*
 	 * For !CONFIG_SPARSE_IRQ make the irq show up in
@@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
 	trigger =3D irqd_get_trigger_type(&desc->irq_data);
=20
 	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
-		   IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
+		   IRQD_TRIGGER_MASK | IRQD_LEVEL);
 	if (irq_settings_has_no_balance_set(desc))
 		irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 	if (irq_settings_is_per_cpu(desc))
 		irqd_set(&desc->irq_data, IRQD_PER_CPU);
-	if (irq_settings_can_move_pcntxt(desc))
-		irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
 	if (irq_settings_is_level(desc))
 		irqd_set(&desc->irq_data, IRQD_LEVEL);
=20
+	/* Keep this around until x86 is converted over */
+	if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
+		irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		if (irq_settings_can_move_pcntxt(desc))
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
+
 	tmp =3D irq_settings_get_trigger_mask(desc);
 	if (tmp !=3D IRQ_TYPE_NONE)
 		trigger =3D tmp;




