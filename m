Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E05E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=; b=Y1ssuZtq8O1hmSJ8mhYXfPvJAG
	k6ksHnS5wkq5Oh/W4HPAqlSmah+5CKgl5IaPiSIU3VHeQ8J3Nj3LMe0CTGr5npHykthFuNzC2YJSz
	+3VPJZq7D7q+u5f47JTNLxgDYOKWIgC4mwj/q+BaiFC6DdOqqgYrDMAIISfLdpaFvorTS9MxR9gTJ
	cmNtLZmq7X0OxK1gfczRJk9CgrvNN2UI4DcG3V/vCCzoT6fjEeCrLCW186VXM92e7zEUuXvl5uNgO
	/Tu27VNK6ltUvl7/pmgz4ild7PMkQjEf1/FOuAZMwOXC8a4RFGBPMjQvQqoLvkY0PhMZayTrMyxIz
	lPmTPESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcZz-00000007d8T-2HLe;
	Mon, 09 Dec 2024 12:09:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcYx-00000007cyh-2JLg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:08:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30037784fceso23960001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733746110; x=1734350910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=CD3wR5fsoJ07YL9ViWpYj6PLLcL8tFxy4d3IeWnMqQU/6uRpJMrKR+0njjAgSiXJIQ
         MGiptf/ynlADJPckO52eLMVKMK/MjzuKd6MuQyp0vH7c7yJBVqm/+dROz2qrre4ynyF0
         5sz0GYm205zy9O6kei2vOKrLJ34qMi+0kOKVEV27hLkqvBtwThCDNUuIXIiHhCxCH0+a
         k/AOBTpMInMA+xSxHeTo1VvX3l9IYTBv/1N3SdhrzkMaAoDlqMZc0ahlv5miZJweo5tS
         6DrzdXaQ7TLsx7mz47sKqbwTdJvrKdPw5+//Yp+N9B53fZ3uJ3VUKhsAyq8oz9UW1gwX
         Csjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746110; x=1734350910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=OHzu4zWMu8AOaHfoPM554pnRM5ZzkplDWiblrxAyPz/ugRXTk1rlXmZXrvK03VRwFi
         64I4Q/12K2CRosLH67gsupPKgjUNexY9HBzanfXdyECKmHPt7Ez/p9SI9tx4Rn65eci8
         h2L2Q+lhILYq/MQK3dX8RiWvabZ9GTcdmi3DSgI7iYYVETH/cAnf+2ZOnq242Mnpg911
         Fv0m9MKZ3s4Jh0f2PwUDbhaSp/XwzH81unUPxUSAVeaRolXyKaI0tmct6UzB1+zcxkfo
         z+rtYBeKR2fdWuDoSXTzT3HgcfT3Pc5dSLl1g1TJ3iGNx8iLV20RNSMslUyyhpRUh6cJ
         pzaA==
X-Forwarded-Encrypted: i=1; AJvYcCUQiGPJWJ5/NucHy6cy6T7yko8glJk2AWgX7Ej+Gh9s2QcE+WTey0Fgl71Ih269RY1om58QMUj+bAa+QXUxvrzz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl/NF8cQ0Cv+RsMAv74jEAwekobcXUWcy4UjunQU1z+fgErNPT
	qQBLu/XsqMrTX6gsJxZ2HgBHWAVZ9pyEVy8xj+IK0WLXTbqiofgTsBM4a/wR67Ung8y4XkKzlHa
	GrZsxLYmPxMeUSRWmYj8LXrMV68c6+OxysZ6e+Q==
X-Gm-Gg: ASbGncsw0k2zQLoediv06wkuWnWmEcbZdDcDccu1N0NkTn8xy2bDfw1lV8KX0JDn/vZ
	iQEx2pTEjfUsGUkM6s6rViksSfKYlSih95Q==
X-Google-Smtp-Source: AGHT+IE7s57c5CX5EN+0VrV/XwVhMQsRyEe4E1tm7jFdZ3xrCHKp5MnSIFcNY2K88pwSkR5p5gRdx23gp0eZz8tJNGY=
X-Received: by 2002:a2e:b013:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-30033b1f3femr48347421fa.34.1733746109558; Mon, 09 Dec 2024
 04:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
In-Reply-To: <875xnuq6dc.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Dec 2024 17:38:18 +0530
Message-ID: <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_040831_591983_977EFDC8 
X-CRM114-Status: GOOD (  21.39  )
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

Hi Thomas,

On Mon, Dec 9, 2024 at 1:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sun, Dec 08 2024 at 20:37, Anup Patel wrote:
> > +
> > +                     tvec =3D vec->local_id =3D=3D mvec->local_id ?
> > +                            NULL : &lpriv->vectors[mvec->local_id];
> > +                     if (tvec && __imsic_id_read_clear_pending(tvec->l=
ocal_id)) {
>
> As I told you before:
>
> I don't see a way how that can work remote with the IMSIC either even if
> you can easily access the pending state of the remote CPU:

For RISC-V IMSIC, a remote CPU cannot access the pending state
of interrupts on some other CPU.

>
> CPU0                            CPU1                   Device
> set_affinity()
>   write_msg(tmp)
>     write(addr); // CPU1
>     write(data); // vector 0x20
>                                                         raise IRQ (CPU1, =
vector 0x20)
>                                 handle vector 0x20
>                                 (other device)
>
>     check_pending(CPU1, 0x20) =3D=3D false -> Interrupt is lost
>
> There is no guarantee that set_affinity() runs on the original target
> CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
> by some other device. If it's used, you lost as CPU1 will consume the
> vector and your pending check is not seeing anything.
>
> x86 ensures CPU locality by deferring the affinity move to the next
> device interrupt on the original target CPU (CPU1 in the above
> example). See CONFIG_GENERIC_IRQ_PENDING.

I agree with you.

The IMSIC driver must do the affinity move upon the next device
interrupt on the old CPU. I will update this patch in the next revision.

BTW, I did not find CONFIG_GENERIC_IRQ_PENDING. Is the
name correct ?

>
> The interrupt domains which are not affected (remap) set the
> IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
> setter code path at all.

Yes, setting the IRQ_MOVE_PCNTXT flag in the remap domain
makes perfect sense.

I suggest adding IRQ_MOVE_PCNTXT usage as part of Drew's
irqbypass series which adds a remap domain in the IOMMU
driver. Unless you insist on having it as part of this series ?

Regards,
Anup

