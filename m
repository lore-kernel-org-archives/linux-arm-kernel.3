Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C5C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sexHOrDpbd/h7EZDwghhGaeo0X8cakgDd3Kmpze7Y0=; b=0pGXoKabylywxuxAVhWc/MSJb3
	89q2cNwpyTRpfERw5zEw4Gr0nmfJ8SUO+o4XVr2m5uJEt+OFH9c5ydkNOnjMFnmEEAjkk1ZgRBZ7v
	dJq3kdefNjnME0Xld/Qr8KC7nPLi5c8CGFc4ZU4bHYiDLRhCyeIKplrSfea5tsLiSVfNJWCfcuocI
	Vxn3OKpKro4lBJ0j9OY9etKDWsDvV9+sHWf/s5nBxobReS9s1EbxswZFswmTKGD45Jv4QQaiURsF6
	CcRxEq+EItT88jRrez4n9aesNIH8UNahglG/9lB7L7m9ImRhkV1zz7vLpuHqwnTyj/MZNI5i0CqBC
	H8qgqHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn1-0000000AX2Z-2Tr5;
	Wed, 23 Apr 2025 13:05:23 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WcQ-0000000A1U3-3drq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:42:16 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2392504241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401331; x=1746006131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sexHOrDpbd/h7EZDwghhGaeo0X8cakgDd3Kmpze7Y0=;
        b=dl0/NESiTzpXLXU1GdPZaounC34US9vfhUbIVV4rPyQffc1RS2MdXxyPvQem/kgBgn
         fx+AcOA7ngiiez5GCKY2XH+WGqZvc206J/psxW2zxULxQ7eV8a2rZNZVGY68xu6vLcwg
         TVdva6q97YHmpWMN5CmjestJ2CaSTIlL1lDezOt5JHeauc8meMYrTttwmobfvwHTFze/
         5rkNBN5yw2yrsXzq9otdKALL132L6kCFxupqmcopGLNxNqYqnAgL18KZIM71WGKlR7r6
         KaV1iQ5Vb9TkZB6948C4u8A8Gv3T3zuN168K9FfxbEQzOlRgI580LWa4JKswEOam8a0l
         1uGg==
X-Gm-Message-State: AOJu0YwryYjJC1J1rToFNQ2NbRUrH5k3CMsNzDLWfw4Bfl67qnhisxxq
	8Q0/R3seYgDtZYa2aVLpYe7GEoastujLcVe8iKGalN+gPL86KoyQycLKnd71YfE=
X-Gm-Gg: ASbGncvlTNvFBOGBkHANqk0Y3YPvSQ7V+XdQHtWZ9XBGMYvxB02smNAoOomg4JyK1wX
	xjRW0wWqpWUMFC/lWU2Hl55Hcd0LN+bcmzsKSEbliKoxioNrnbUe47eMJNqptJI3DpPclsmjJYh
	r6gm6mTZFJDa3dSRMfkBHzPBqQJlC8Jr9whhVhaQyNUBn46ELzgFTp/hLA3L73xjHvblbco/0+Z
	RI8D7cBiLovRc6m81h7uMo69JjVlhNBP9hUQFHazbs4Eh80E6CvobzMd5Dx3Gh+bjKHndu5QA9F
	P5vfMzSyGv5C3oJolaIylmtXv88K1JnEJIfBEtwfsGjPWO61kX0wgV1ZUSC7wbGjy+f2tCmF5tS
	ORcE7N0U=
X-Google-Smtp-Source: AGHT+IHPl1DmGUTeDiINrMgb2dUnkHuoMGzAJjRIww9mHeOddaDWte6XX25Wjd7TC9KrjG02tzNIFw==
X-Received: by 2002:a05:6102:458b:b0:4bb:d062:430 with SMTP id ada2fe7eead31-4cb7ff26975mr11645410137.0.1745401329624;
        Wed, 23 Apr 2025 02:42:09 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4cb7ddb214esm2582000137.8.2025.04.23.02.42.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:42:08 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52446b21cfdso2505086e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:42:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6b05:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4cb8021c21bmr10743406137.16.1745401327693; Wed, 23 Apr 2025
 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org> <20250420173829.200553-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250420173829.200553-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 11:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWu2TazTOE0voDkfYBsC=vvrCimPczQw3VYuJyvhV=1Q@mail.gmail.com>
X-Gm-Features: ATxdqUEuPwHtM8SgzzaD_wTTn04FsK7H3Ks6A19VPHk2n156ixPkKd_kaH6fcv8
Message-ID: <CAMuHMdVWu2TazTOE0voDkfYBsC=vvrCimPczQw3VYuJyvhV=1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Retronix
 Technology Inc.
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024214_908050_1EC52DB5 
X-CRM114-Status: GOOD (  14.27  )
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

On Sun, 20 Apr 2025 at 19:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add vendor prefix for Retronix Technology Inc.
> https://www.retronix.com.tw/en/about.html
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, will queue in renesas-devel for v6.16.

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

