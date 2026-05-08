Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55025CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH7GgBsf5gFTyU9xaGUtTh5y4Nb+5ISn4myl/WQLiQI=; b=fmPGRVuMYhZHBFY3gZtc9lSsLH
	bdD9uG/M6PxAnwb9iW3CMfFriw9nwg+VSSsTow2oTgsSsFQlCjP4LRkuqDTp9LEm9NlKAceLM8Ha/
	Ksh5KC6ejU1n26flSaeDdd0LjjTBV6py2eH6jPHZP6qrykk7M/21RIx0+6T1Q0RP6wGja555wsP8J
	umXt+Jl1uqdIXgtFoiEirDwMr9X/SM5Dwjlk1cnsQXw5BgAWV7uxsWWcz98kLp3E04zmq9TyAdpL6
	Ql4XFuzpC/Aa80VW8AsMeT6EZfgMw515Bwyqw7oUIrX9PKBXEj0MUcYl5Tdl50ZHzr1BedPaZ64zD
	3vxy9GQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQGz-00000007IQV-0DnZ;
	Fri, 08 May 2026 18:50:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQGu-00000007IPb-3XzG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:50:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba17c8cfacso23862325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266199; x=1778870999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DH7GgBsf5gFTyU9xaGUtTh5y4Nb+5ISn4myl/WQLiQI=;
        b=EXpHiySX9O/Ql6/N4nboE+bfjASR42bVjAq6NDjjXE2I9C/A8RJ/TG/PgB2S0E16P5
         JtVjWvAUHYS3RK17xfQDoUzgdnAOa+ohCe3R7FgfTNXQxBqcQAxBkgiAtU/76x1uCMu8
         NZUCFbbEYpSXUwwYdxSV8AaXqrQtAN4EByB6ddqLV3bzC8TqGucIGj60Ecb2+kJU8L4f
         DTBCwnUwAOHTvrHRWDYyvDjv2E2K482wUHDYkyFY1eE9P5KeberBURxaNT/x+i9zexTs
         myhCwOuhTaoLD9bHAnfHFTOHglXVI/nshDejnwkkfSD67sa6Hx58+Sn78cTOEBdwHlEb
         3oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266199; x=1778870999;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DH7GgBsf5gFTyU9xaGUtTh5y4Nb+5ISn4myl/WQLiQI=;
        b=jZwjSRjo2ioUPaIIXlLODAMXIoT6FH0tLRFWvg36AjtJZH2CJe0ZXcEKcFnGN1vSnR
         eK/fSnbA0sr0Ib80PdklJ9GfLM9vJczfm4Xxsl+ukM+lTtKeK+Mt6TtSK1ZhHvtah4sf
         hqCiaILrgyxobaOg0AwiVNvTlOJ2IVu9/AqVxSFCFvuewCzTg0SK2nljclzJDJRd41SV
         3oRh0S62TRsCydOpOWVQDxSY/tQitGnPl9rjxBsOR23ti7gp4g9WIasZro8ObfmMYIvs
         ixotsoYDKfI619itTAYjgbtHDpHH6ySz8ljdBvAQWZrdeRi6OKhAKZDeXbv8YvEuep9+
         +XtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QNt6ba/puO4NvHu/zVueWjXZaP5qI5cHQAzgcyOIxcV9f422PagxeWU/GlS6y61CCee0qF28e8Yemjtrpt+ko@lists.infradead.org
X-Gm-Message-State: AOJu0YwkWvMRCVF1KPVwvostjbP32ptRS5knR8OTNrvLgOZotlAapzlW
	4yzMWIVDGFzJfCdA6t4AgM3z2OMvgNRMxst234Ab9FQuqJf+wu7ove2v
X-Gm-Gg: Acq92OGkTAwSHCHcKmADbVyFG0735bnfyVU7c35c0+ZPs5WyJVMtRYOpT1MDOToROr0
	XFSmYMNQNyKU3Tt2nk+Lf3XotnbJuVY/qqWPO+XDF3aBt0d38HlTtEGcbI45QO5766oJeP/Cueo
	ViA0UZxiP/WYFAJQiMgBL1bI0fwEf47nCO9uzHtfggpWQCxu61mBdAn1DeekXajZQaJfuY4H4Kh
	OEi3gzUuupgC9NZo9ANLvXsbkD6t7CqT90mVi/pxYg1yhCK/3X5TCOr8UEJtUiZZQiauzgEAGGw
	vVltj06vVrCovfk6FQV0RgZds0jKdpn8xtroCGlghVI1ju4Z+wcGzMEF++JupzDVcGX5ybqmQrM
	B6o0qFv8h63K7p++a6+NS1649W1qv9VSY2u7NC1ADn7QuZqG9lqjb4qyCaBGWApkyJMQe/eSI3c
	vYzhbg2xGDGUzOK/52UfmnbRqzPsqwgnFVJM0iX6+rXcxDTw==
X-Received: by 2002:a17:903:bd4:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2ba78f63cadmr106621905ad.4.1778266199122;
        Fri, 08 May 2026 11:49:59 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:7928:da7:2db6:dccd:ce49:67cf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ebesm29892475ad.43.2026.05.08.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 11:49:58 -0700 (PDT)
Date: Sat, 09 May 2026 00:19:46 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>, salih.erim@amd.com,
 conall.ogriofa@amd.com, jic23@kernel.org, michal.simek@amd.com
CC: David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_iio=3A_adc=3A?=
 =?US-ASCII?Q?_xilinx-ams=3A_Replace_spin?=
 =?US-ASCII?Q?=5Flock=28=29_and_unlock=28=29_call?=
 =?US-ASCII?Q?s_with_guard=28spinlock*=29=28=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260508124513.17752-1-m32285159@gmail.com>
References: <20260508124513.17752-1-m32285159@gmail.com>
Message-ID: <F98D1BE6-7B28-4A36-A372-2431EA151E1E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_115000_903387_7539038E 
X-CRM114-Status: GOOD (  14.32  )
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



On 8 May 2026 6:15:13=E2=80=AFpm IST, Maxwell Doose <m32285159@gmail=2Ecom=
> wrote:
>Include linux/cleanup=2Eh to take advantage of RAII macros=2E
>
>Replace spin_lock() and unlock() calls with their RAII macro
>counterparts, which modernizes the code and increases readability=2E
>
>Remove "flags" variables where spin_lock_irqsave() has been replaced
>with guard(spinlock_irqsave)()=2E
>
>Signed-off-by: Maxwell Doose <m32285159@gmail=2Ecom>
>---
> v2:
> - Replace guard(spinlock_irq)() in ams_unmask_worker() with
>   scoped_guard() per Jonathan's suggestion=2E
>
> drivers/iio/adc/xilinx-ams=2Ec | 20 +++++++-------------
> 1 file changed, 7 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/iio/adc/xilinx-ams=2Ec b/drivers/iio/adc/xilinx-ams=
=2Ec
>index 124470c92529=2E=2E05bf1444ca7d 100644
>--- a/drivers/iio/adc/xilinx-ams=2Ec
>+++ b/drivers/iio/adc/xilinx-ams=2Ec
>@@ -10,6 +10,7 @@
>=20
> #include <linux/bits=2Eh>
> #include <linux/bitfield=2Eh>
>+#include <linux/cleanup=2Eh>
> #include <linux/clk=2Eh>
> #include <linux/delay=2Eh>
> #include <linux/devm-helpers=2Eh>
>@@ -414,18 +415,16 @@ static void ams_unmask(struct ams *ams)
>=20
> static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
> {
>-	unsigned long flags;
>-
> 	if (ams->ps_base)
> 		ams_update_ps_alarm(ams, alarm_mask);
>=20
> 	if (ams->pl_base)
> 		ams_update_pl_alarm(ams, alarm_mask);
>=20
>-	spin_lock_irqsave(&ams->intr_lock, flags);
>+	guard(spinlock_irqsave)(&ams->intr_lock);
>+
> 	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
> 	ams_unmask(ams);
>-	spin_unlock_irqrestore(&ams->intr_lock, flags);
> }
>=20
> static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
>@@ -1060,9 +1059,8 @@ static void ams_unmask_worker(struct work_struct *w=
ork)
> {
> 	struct ams *ams =3D container_of(work, struct ams, ams_unmask_work=2Ewo=
rk);
>=20
>-	spin_lock_irq(&ams->intr_lock);
>-	ams_unmask(ams);
>-	spin_unlock_irq(&ams->intr_lock);
>+	scoped_guard(spinlock_irq, &ams->intr_lock)
>+		ams_unmask(ams);
>=20
> 	/* If still pending some alarm re-trigger the timer */
> 	if (ams->current_masked_alarm)
>@@ -1076,16 +1074,14 @@ static irqreturn_t ams_irq(int irq, void *data)
> 	struct ams *ams =3D iio_priv(indio_dev);
> 	u32 isr0;
>=20
>-	spin_lock(&ams->intr_lock);
>+	guard(spinlock)(&ams->intr_lock);
>=20
> 	isr0 =3D readl(ams->base + AMS_ISR_0);
>=20
> 	/* Only process alarms that are not masked */
> 	isr0 &=3D ~((ams->intr_mask & AMS_ISR0_ALARM_MASK) | ams->current_maske=
d_alarm);
>-	if (!isr0) {
>-		spin_unlock(&ams->intr_lock);
>+	if (!isr0)
> 		return IRQ_NONE;
>-	}
>=20
> 	/* Clear interrupt */
> 	writel(isr0, ams->base + AMS_ISR_0);
>@@ -1099,8 +1095,6 @@ static irqreturn_t ams_irq(int irq, void *data)
> 	schedule_delayed_work(&ams->ams_unmask_work,
> 			      msecs_to_jiffies(AMS_UNMASK_TIMEOUT_MS));
>=20
>-	spin_unlock(&ams->intr_lock);
>-
> 	return IRQ_HANDLED;
>=20
Hi Maxwell,

Thanks for the resource cleanup change=2E

Overall looks good=2E

Also, there is opportunity for guard(mutex)()=2E

Thanks,
Sanjay Chitroda

>=20

