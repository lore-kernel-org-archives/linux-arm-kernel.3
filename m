Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=; b=imCWyF9m24F/vdP49NsnDwKi4i
	kEQsiWg3OSXOlFJxVMH2x28fE6/TT4oPrZidlgwFe8t7auX3/15QYM9PHhbi2yG0JTip+OibKi/lj
	8obxY9r952M+eDGG8A0Jiom6+T5dlda8hcSAnDXri8ZiurpEBrGXTjL2FAJGCY/0NJfM7N3ivEYOd
	0UoyPW0TBJUozk0O1oKeK64C/vQ4uNVi/I1pTSpWTDHf6RAWf0gZZ+Ut67I/ZU7OodBnYb3A/N60u
	OS5+2JcSgexbXf4z7rIfbzNMfNJNwvoc8m+JMrqz7L2IEH0ckbjIl7R7NXGg/X39MPYO9UryXbBu8
	EWmOnE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVqy-00000008hFN-01dV;
	Mon, 26 May 2025 11:18:48 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVoo-00000008glg-0uXA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 11:16:35 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3111a219539so1114805a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748258193; x=1748862993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=cck7YAAA9raXl4cusbm03f+/2VPfzpeW8/E4B4Xjlm1A19qEtxBssgWD+wJnfHUmXC
         S68E/asxOiYODUjfa/U8TEGmk1uso/1NjizP7aT1Co6cdaRjnlnPox4ODU7gzDMvTGOn
         XfiK5x8GCdwM8iATB5CXC3Jo4EBfumW4eczlWLwVJXICp6NnEMb9Ti3+rJDB2+xFw27R
         KMl15U6HqXxEjQf7l/rTBeE3Xh6Khi2xd3qRQTUr/Y60bihgvocqEVr3EBqD74RxE/T3
         1SibgW0BPYsDTipd06Onqw9A6rnzG2Gy/2VTPNatqwqHU+9CX2yDv5V+j+X4pNaz7VGo
         L7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258193; x=1748862993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=TWWx6vULJ11kqA4Rp+Zarhd57TSKgH6jvgOW1RLUOsyDnPhlMWR8Hile+LhAtS7INh
         7HA7BXwayqztdtqv7nGJ7yEkfvYIHmV7dblH00wRrx+x7I+AqGi67PzMnzWUSQsqdL4b
         2zkHyEXJHfe3E0ppSdBWaISmneYafnazkYDTEp/vNmdAb2S+wsMzlk8Tvd18JzK2KN9t
         LwMlm3YYNCeeoC5GBJFzzVVsIsOUgD+T37MKxRpUVDMhCGeUEBgHBE4hS73rRmId/Ais
         OVCEZeu/jdxghuIOjwU3Wg+N71T2n2dTgtN/7Jgsd8Cy1zXjY7B8lBVIVPlD8rmAxYBc
         sydw==
X-Forwarded-Encrypted: i=1; AJvYcCX7V0IZD4ILUt2NInNjA+4IbbvH546HEhAvQWutJRYsho0vymA0nQYRicjWXO5vvtvdROWMlBCbHPdXIkbd9HCc@lists.infradead.org
X-Gm-Message-State: AOJu0YxLM8j8nrSUQR/V9uqn4kEdYafqQlC4GvN2x/m2aurewmpeuVzs
	CIdr8TCXCqyRYXAVXAA4yLGRWa6tM1dM6LKk85iN1XlGbjdWAVWFSpC8HErTkPnPPSIe0XActRp
	ISU/zHodMauQJy3XndqZKHlP8tBDMkvgcfnEaOps=
X-Gm-Gg: ASbGncthR24GaeknJxYBy4tml/qKUzLsV6BlMJMmm/fhQR1SV/KKveHTzJlhpO6tR/F
	Vr0euKCBP82PFV9E1Grn+fkipSrhgnOPPSq5UEPfPxo92z7Uvb1CJKYy27i0rdGCvKejxiEqmoB
	wS/Ii2GLVDNO6rBWkIkrIvLiNJbKLpYw==
X-Google-Smtp-Source: AGHT+IFtzvYREQF4e5RGyWZ3F4MYtqkkNGOvg9UsSWp9ip8U8N2Jl9OoCM3bMnVLyNovfB23/E5xH1xXxzKgvocOJGI=
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr14756973a91.10.1748258193279; Mon, 26 May 2025
 04:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de> <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:18:15 +0300
X-Gm-Features: AX0GCFtcQ3gPsieet4uz43pbRsMbpHjmv7-rKiXRxjWLyoqRErH-OX-1hcUkpwM
Message-ID: <CAEnQRZCn0bBgn_FHS1Dn_p_gOraoLzU_1pLiyKoJTrbdD=LP3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_041634_259647_692FE822 
X-CRM114-Status: GOOD (  13.40  )
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

On Mon, May 26, 2025 at 2:03=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
>
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
>
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Hello Fabian,

Can you also add the original S-o-b to give credit to NXP
developers who started this?


https://github.com/nxp-imx-support/meta-imx-frdm/blob/lf-6.6.36-2.1.0/meta-=
imx-bsp/recipes-kernel/linux/linux-imx/0002-arm64-dts-add-i.MX93-11x11-FRDM=
-basic-support.patch

Signed-off-by: Haidong Zheng <haidong.zheng@nxp.com>
Signed-off-by: Danwei Luo <danwei.luo@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

