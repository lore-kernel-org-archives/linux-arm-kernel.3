Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA07E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4H6UDEVI47G82chzxwybcsE9lJCkY1PdBcOb/KEZExw=; b=Nybaa0sYhez2OOHXlyzRXNTFHX
	3HMznaUOQ+Cbh0A9gU4JMaHtRyEhvSgutVz9qx9ZrKmGCSsPmzagNVfzdwW2q3x7lIbjGy9lLwwiU
	CwjJKdpV/F2YIgas5X3T0cu6svTl2/0KVzyHTsUKBzqKFFTqu4wwFNvRuNQsed3o7kwD2zdNrIJJ2
	REHuUHB8+BOVtNobe73jm77Xrsd3Qb6agdrRe38ALQpExAo4GJ3jolyYK5ZhC0kyS+VKvZm8f8kPm
	ljuItDR6jKGu7Wu7meeGtBuOIPGr0yp1U/HchOOj2hiXPFBCHTtmLtxNeWd80yYRTp0fgZZzl0DCd
	y/IxJRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQwR-0000000BHjF-3Gf9;
	Thu, 02 Jan 2025 19:33:11 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQuG-0000000BHUh-1PFl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:30:57 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51873bc7377so3646488e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 11:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846254; x=1736451054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H6UDEVI47G82chzxwybcsE9lJCkY1PdBcOb/KEZExw=;
        b=CfVFOHxJk237LU9PNVDX0JU4tAjzwpEGruiNFu+hjgMZLVSMBIwlx2hqGgUCtumnzq
         LbCmYwb+MWaeD3zK9hlXYRzBQdppiipFrQakNOT7Fh/wc6LAXF9/DsRDsUiftWzSQkcy
         Uv2qP0tljcbcO/aqi3e55EYK9x94sV7LTpd+01e91FfRWZQE89Y2ZZ4kWaTBbeHBnX2a
         3vhUIASyI2JlqMETGgyX56MCV0B79UnPsA0+Q6zVPn448qseuuSlkLFxsnE2CyigBCv1
         u6bvU/ND6vMIuJPBmDN/iYy+vjqnuRxks+2sCoLJ9AMZPtqveuv4CzyBGHktKTaAb0kC
         9aJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJiyUp0+yhcs4iEBBFeCKyYmIwDLRGVySx7OwMyeIQaF7u6xu8WlhGhkf68kH/gif1whqEOVs/65007bepHksP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ckuXI3UX0MtBTB6Kirr8dXl/aUgeVNunlI06zigs5ohQGObm
	IiUwtSTyNcPqfN407KbKvXfd+3+oFwvS1JTR5bTl8wLYM8VnwKBZWemaajM2
X-Gm-Gg: ASbGncvh46ZrfgA9k/Oqa905ObAblmVUV5vNuDqDvdqH7GcXieraWHJHe/2eePFYfck
	OSyqmotZHOv+mE1OddNSFp9VOoFOPGRW28CBTS0EOBRONUkR0TNll8iNHyKy/F6BkVlivPouOJT
	kfi/LHl7mAS+k5FgCw3j6dwFsi0ZjGgo30NfESoJquFATIav7LEfCGQL3FdQFRcWrmU5cixSIKb
	UUQ+b7MG7A4YBMdSMh57P9zFZS6rJna87lvoQlhc1axAhskW0MNBbKaeN8ETRH1X5Je0BPCM/TZ
	ae2MRd1rXzY8jl7H72g=
X-Google-Smtp-Source: AGHT+IGTCzX4smjr4WUn+dZ/mfXyL3mhMFPNFcRqlksQnyX4Z4DDpfUzXUPbvoEVCsfdJy/lQvrmcA==
X-Received: by 2002:a05:6122:1999:b0:517:4e40:6838 with SMTP id 71dfb90a1353d-51b75c65272mr34644386e0c.6.1735846253826;
        Thu, 02 Jan 2025 11:30:53 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68be78dbsm3091262e0c.23.2025.01.02.11.30.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 11:30:53 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afd56903b7so2898500137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 11:30:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZjxoc1ACRoxHFwjy7MqQXpx6a6PKUtq+0pyiAd8C36HgoqvjKT5NxQMId5reGfVT11nG2Fbi/ZM04OFLTfP6g@lists.infradead.org
X-Received: by 2002:a05:6102:1625:b0:4b2:cc94:187a with SMTP id
 ada2fe7eead31-4b2cc941dc5mr37385276137.1.1735846253100; Thu, 02 Jan 2025
 11:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20250102170359.761670-1-rohit.visavalia@amd.com> <20250102170359.761670-4-rohit.visavalia@amd.com>
In-Reply-To: <20250102170359.761670-4-rohit.visavalia@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 20:30:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
Message-ID: <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: xilinx: vcu: Update vcu init/reset sequence
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, michal.simek@amd.com, 
	vishal.sagar@amd.com, javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, 
	u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_113056_377354_09D4F3F2 
X-CRM114-Status: GOOD (  25.79  )
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

Hi Rohit,

On Thu, Jan 2, 2025 at 6:04=E2=80=AFPM Rohit Visavalia <rohit.visavalia@amd=
.com> wrote:
> Updated vcu init/reset sequence as per design changes.
> If VCU reset GPIO is available then do assert and de-assert it before
> enabling/disabling gasket isolation.
> This GPIO is added because gasket isolation will be removed during startu=
p
> that requires access to SLCR register space. Post startup, the ownership =
of
> the register interface lies with logiCORE IP.
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
> Changes in v2:
>   - Changed patches sequence to have patches with "Fixes" as preceding in=
 order
>   - Used dev_err_probe()
>   - Moved warning to dev_dbg() and updated print with more detail

Thanks for the update!

> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
>          * Bit 0 : Gasket isolation
>          * Bit 1 : put VCU out of reset
>          */
> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset",
> +                                                  GPIOD_OUT_LOW);

This requires updating the DT bindings _first_.

> +       if (IS_ERR(xvcu->reset_gpio)) {
> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> +               dev_err_probe(&pdev->dev, ret, "failed to get reset gpio =
for vcu.\n");
> +               goto error_get_gpio;
> +       }
> +
> +       if (xvcu->reset_gpio) {
> +               gpiod_set_value(xvcu->reset_gpio, 0);
> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 33.3=
3KHz */
> +               usleep_range(60, 120);
> +               gpiod_set_value(xvcu->reset_gpio, 1);
> +               usleep_range(60, 120);
> +       } else {
> +               dev_dbg(&pdev->dev, "No reset gpio info found in dts for =
VCU. This may result in incorrect functionality if VCU isolation is removed=
 after initialization in designs where the VCU reset is driven by gpio.\n")=
;
> +       }
> +
>         regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_V=
ALUE);
>
>         ret =3D xvcu_register_clock_provider(xvcu);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

