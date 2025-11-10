Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FD8CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZFprYnk3afJ7bXwWWifURut5yD9UujyFxRDAYwHR2A=; b=UHIe2GYBL9sCV/vngMlH/GsR9W
	SuW3Y2t4tL7LB+iXu+W+cFJ6widKa+CNlxrtnHLAos13EteYiMAwzXO8MvYPjeSHFvxeFfePf3i4g
	sueXOEoW9V2gEOJ5ddHUTIlwyTjxsWn9dSK2U6TLuv2A12zXWZkFhw9BF9v9by+kKqdD9IxEy+he3
	zwbvyUw0ui2RjQmdRVo32omyq72oYKXoFGscTOp/oOdlimJjIY9zZ3k5OFedE0fDYOComNT4T4OZ0
	aKt+9POMY7argjbbaZE9dCmZiGjGXyVR5Ls/sE7bduQFrGjL8GG6HW8Q3dDyEPPbZ6gtRtuesHeQw
	Rqp+Vciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINvn-000000053mz-13Ie;
	Mon, 10 Nov 2025 09:11:23 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINvk-000000053mI-0wRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:11:21 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c704bf2d9eso593632a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765879; x=1763370679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZFprYnk3afJ7bXwWWifURut5yD9UujyFxRDAYwHR2A=;
        b=pX/DdgKNAN1lkuo0yvdGd9QbOao8AEpwFFUSG1y1QXTdXNtDZVs9iNpLm1OybcGJJn
         vUWbR7hvO6NqU62lFtWpsiIlbrwGB7m5nfGbMdz1MVaOCwVFHxfspYoeuvfPL4S7rqDo
         Cu34JQdQ+xXY7vUqJBW85myunjSARJYicGSCUlTqMeuNOBMT4iYiV9ElU65GOoa3xhzo
         0EuRkQySC8tzyhvjviaFPEYrj1HvBZP/YIGi9w+7LAv9316+fXN7bwsOLCjBSUgcGqKu
         qhzdyiHeswCTI3TlE/q6fiArDo83MP2dd5kgq/yRw+OX4kiI+RB/X8ATbZun0pRY/pV/
         0NEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtWMMfxapL1ONRm/O1KU7SOBl+RvC9esDVFeoDrp/esGtOkC/F3EFU9J+r7YF//FXyhcdOSOhJZjYCqqquW0NF@lists.infradead.org
X-Gm-Message-State: AOJu0YzRttOELrv4uf/XJ55t4ldp5hwyqYyqEbsKiN08f/jTEjIEwPDD
	vM6jUICVRFNre9fdCXg/8Oit8Ozf9J7esU13V14VQiczDwoXMdraSE5/ar/ZW+GL
X-Gm-Gg: ASbGncsWyfcS3Ta2DxCwZaP05095LriXoCfZEDqb4Zagc4kCqexylJWlTyixpt92QFa
	v+RD6JuozZsvgsLITbhgLMAxzaEgdFde10IFxjcL0p/w647WAFiwRTRojjbL3o1nSjumBswP1Hb
	kl3kfHXBFZ0kE/lKtLbGmoJusB9kIxEj5HreQLLzSWwWgRAdii/7Z2FuFXkdVMzVohx+beGj81l
	gT+DSBzkaEtp5lOeWVZFvSexO92LknKYae/emjlToxHAUTgHA1m+IPLFQLC9A+CMPx3CKtVcjlV
	3H83CB9kdELol7FfPPLLf4p9B+LtVgQaOBzUPhTmYNbtxZKutV+EJqNWTJyae+o93LXRbE1PP5r
	KEyCD7UC0Z7bbRQi18q/cJmeiM7OIYGND0kdRh+V51Eafp/A4XZxHDVVARj6DG2fjNdiinvyUbM
	GcCbjAs/LGhjVfKdMPSr088+6JhE9SZGkW18tTTD98Fd/mNtOk0uxy0J7W+AOJdiM=
X-Google-Smtp-Source: AGHT+IHSGaEmvhLfxLVoHurvww0jMqbAqTuODD0tSkqYYg5OOvcrCXewL31GRHK+yfDolgLXElekGQ==
X-Received: by 2002:a05:6830:34a0:b0:7c7:e53:d780 with SMTP id 46e09a7af769-7c70e53db9dmr1499993a34.26.1762765878944;
        Mon, 10 Nov 2025 01:11:18 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6f0f583a9sm5422858a34.9.2025.11.10.01.11.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:11:18 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6da5e3353so2145681a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw4kfuGTxvYOSoHk/Oxfr+KXIL1ld0zviA8yJyABITYvTim6ek+zM4jA0eX2Mz+p1cezDyU5iUtFb1Y1oVvs5t@lists.infradead.org
X-Received: by 2002:a05:6102:c54:b0:5db:c9cd:673d with SMTP id
 ada2fe7eead31-5ddc4751f8bmr2299299137.26.1762765446858; Mon, 10 Nov 2025
 01:04:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762588494.git.gaohan@iscas.ac.cn> <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
In-Reply-To: <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:03:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
X-Gm-Features: AWmQ_blbgQuyL2K-QWPxMEybBZ_lWHdEHYJOPJXLh-zobJqSsJnJFWv08QlcdnY
Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guodong Xu <guodong@riscstar.com>, 
	Haylen Chu <heylenay@4d2.org>, Joel Stanley <joel@jms.id.au>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_011120_293597_83366BBE 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Gaohan,

On Sat, 8 Nov 2025 at 09:21, <gaohan@iscas.ac.cn> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> These options need to be enabled to prepare for v821/v861/v881.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch!

> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,8 @@ CONFIG_ARCH_SOPHGO=y
>  CONFIG_ARCH_SPACEMIT=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
> +CONFIG_ARCH_SUNXI_XUANTIE=y
> +CONFIG_ARCH_SUNXI_ANDES=y
>  CONFIG_ARCH_THEAD=y
>  CONFIG_ARCH_VIRT=y
>  CONFIG_ARCH_CANAAN=y

Other subarchs handle this with "default y" in drivers/soc/*/Kconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

