Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF5FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 04:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=; b=05LjwsXXBXi5Req9Iz74eltwNc
	FdHUvpx0oHdkbxSe85RSSlIYSB7/spEvSzDxTakZ/RlJa510B4w5NnJAXsVfFKv/3CgtF0YkqK9Tk
	OQO4QfJZ/D8cfuFWCwDYUQnOIQkjMD2PtQARjH0VteqTJi7kRgdtwaHg5AzIDTsmd4tI6jL1qV7gN
	mJRyKiMzKWlqCqB602YNLHAxkUbhmDruPZAZ+YTEzJEJBRGLHj3ZnmYpWZ3rEbfMVaWnp7rK+AJAD
	PunXnxPLeoOHXPuHuWYQcmHzP29JsKRGWDV4uRs306PuzcvbH38rS5ZJAjfVTa3rKBQmCoo+YV0rb
	+RvUKz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsoT-00000003FKh-3l3v;
	Mon, 17 Feb 2025 04:32:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsi0-00000003E3i-48pt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 04:26:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7ee6f54faso462043866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 20:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739766375; x=1740371175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=DmDiAi1PKcbBNrGCQImS2i5pvZOirJfB2nw/Xp1mpNn76whB6tr6XLmEtfxVR1ITeI
         ls9/Io0cjYHUSSPiRUHpTPxGYZYmF+pflKsZXBE79dZaMESIbr4PpwQx7hPxRW+nzkik
         r4rWtSWuGDbg6B9c/hOvEsL3UmLmkHuIxGshmrmTSvtE+jE/tobx2OSLTghYfd5ELn1B
         xOOYX0nO/hRTJ00xW9r9lvAe6GiC0Kb3xzFwsMwrPyZWXXO1dnsFt27yyRGtYJuLNNlN
         deFNbb8b3E887MzTxgS0Zoz/GncvO4srnrhLUWnfE6Xzhae1V1jAnVkZXfzOIt1eDfx6
         FAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739766375; x=1740371175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=PdAPnVurbah+59mUNTIbGSUwWh4sOxyc2qG0ZL5F69dmr37WA7DBQ+ttL1Xyu3kWJQ
         NLfFfNTmsVCZHfUi4Vpiz+yjLh+T9IybU6/fPGfqs5hko4vOCTsVZ2ZeWeclOVoCTrRd
         fwr1jBqmiOXqyXQ+3rpQk1ix2VHY30wFdVA2e4NhML2QKwUFZawsxb8GVnQ0tvOd0zJO
         nrW35T27viNpEzDBwJ2HnmEl707RtvPEyMzKTmMvMNKbeFxCCK/Tcu+UHUCB1oPhzvHx
         cQioYn0QsWRoFt+GX/1p0oKUrHDX4rTlytnzdDVNc7VD/vEvI/hgfy4S5Cro3+qxhgFV
         n22A==
X-Forwarded-Encrypted: i=1; AJvYcCUlEU/I8RDghI5o7KKL6NiWQDpVj1SqjurbN5CY5HdmiDl+Y2OH+g8zs/+HnS5WhTkeogCmKvk38tkPjNqgx5MN@lists.infradead.org
X-Gm-Message-State: AOJu0YzAyHU0qzxCF2t+ZhLO3IWHKEm6TsajocJj6vcqIspKSCQUHVRp
	6jeHPV0mfxlAMBcqe3mpGrgno5zrs5wVTGLae/mwpZXfMLYGpp0ZPXH9RHJdtpfOx+ysWwMPNEP
	7kh4Ks0ZiAWlPTVbz/g7x0iQu0ws0B4xOv+HimA==
X-Gm-Gg: ASbGncvTu+d0TwU/EZsCaHqiHOmSBqiiHtbi20OvTeEvLs2OHu2sK5ysKeGkWn080Gw
	mXlJ/kfCTQKBbjYxeqR2K5a2wXWNZe9TjFl0Zpb6Ghxr/TYR4/yslLelvQxCEDAyafw8hsQXOJA
	==
X-Google-Smtp-Source: AGHT+IGqR09ncd7RtDiYCHnqel0IwA8/KPIVmtCxbKbZIlJpbL6zVOLcVJ6dwuzAFLdjeOGKZ9qI9z1ate7AXjr0ds8=
X-Received: by 2002:a05:6402:5201:b0:5dc:d8d2:e38f with SMTP id
 4fb4d7f45d1cf-5e03618307amr20113776a12.31.1739766375048; Sun, 16 Feb 2025
 20:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20250209041655.331470-1-apatel@ventanamicro.com>
 <20250209041655.331470-2-apatel@ventanamicro.com> <87seoijb5q.ffs@tglx>
In-Reply-To: <87seoijb5q.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Feb 2025 09:56:03 +0530
X-Gm-Features: AWEUYZnsLDuB-_3nJekaV0ZQ27JIbe7lpoXoicZXgPN5kJR_Ra7fWK8_x1q1rco
Message-ID: <CAK9=C2UyC1bOaRuvjUcZ=YWyOGhne8Yt5X7aYSAjQUPiUUUX5g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for
 IMSIC base
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, hpa@zytor.com, 
	Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250216_202617_026630_AE077B7A 
X-CRM114-Status: GOOD (  11.38  )
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

On Thu, Feb 13, 2025 at 5:42=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Sun, Feb 09 2025 at 09:46, Anup Patel wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> >
> > Instead of using imsic_irq_set_affinity() for leaf MSI domains,
> > use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
> > and use irq_chip_set_affinity_parent() for leaf MSI domains.
>
> This clearly lacks an explanation of the purpose/reason of this change.
>

Okay, I will improve the commit description in the next revision.

Thanks,
Anup

