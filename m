Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45332C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=; b=SY9ZoletNBt+813jZrcYs+oLF9
	Z8Hg/ZQ1XPnpnIa0eyUB3Aes+Ay4/Ok8Udy74JZPdWraObq2oZHWSld/DbU7vkXaU4lv/5Ph9Keex
	74UM7RocO3UqPDUhgGt8UKPbXFkhgOLlAssdUoWxLySiVhlLP2gcFzpGwJybZIJBeJNnlfuXxhO8L
	ygb+5e+nnLBenARuC6RIsbkwPCFuQe2cVZxZGhWtG6Wj4XmKAiIIxYDcsdxlu4h8Wnu2V2OhIrm7n
	U1REhjiyZlB0qdOqebvBAvqWAH7Ti3LvbNNz0bbA0X8RSz+fX+R+Ztp9H2Mmfl7NCLVMYTh/JqDpc
	qOPl7aVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc6W-0000000DnW0-1kBB;
	Fri, 04 Jul 2025 08:49:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbME-0000000DeLj-3Hmi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:01:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553bcf41440so810846e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616077; x=1752220877; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=EqxUH8WIjAu7o8C4flf0hRdxj3wfr8TECDAVdmP8aDgoo3CzNEpqdopLhkF/4MvJtW
         zYfsp0pwqPIl+IebK5nZoU3rR9h8loS1h8MUd9vMahj2ZNvSEO8fVMb8/k7WkJdqLTb0
         Hxc7d6JH3bD2jczZQfR7Wodf2m7WHJoFNDBaFYkLb6ZH0g4sweXaLMbdcohTFaVPOuGI
         BE7nlEevXBG/+j1SPeod2RZ3JKaEegazaEmMIE3DjqBJP+CF9OYUAJrSkKFeoWMmzFCo
         aYJhNVqheUan+p8WxeHE5qB09+CkCCk3oGMnaQqwJKtVXVdwVzNZzx90JWQ+3e0RTmGs
         1P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616077; x=1752220877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=sIIs6Pq/ZiMuBdboeXgdAULllsemp+MCiWl1z90L/895MNz2EJ/x4OklVMLb0GvaiQ
         IptotkLyjbDQK4XfLQGTvSVC/2v2jgtLMU2IQPAsPaXqD3dSn+vdkSRQV6qVOJCHKyv4
         buUp4vVKr46hoSD1tbvZbdxRzzNkKZ9iZ0kjlxD/7HzP0pztjWLH3dwOmpxcaEDvLTF7
         i5KkDB4qv6JtiJ+Pvlft+U85oLdFJPuEkYRBq7qtWQZp/VE1uJuUA1s5ApgtHVtnhgqS
         CWMiq615uXUlTC0dHH98hb/mthWllIKvVwfQFKPhj6zEQs66tHFYPm1xRx2tOgrDYPYI
         LCZA==
X-Forwarded-Encrypted: i=1; AJvYcCWdb1KrDyTTO2voA6kgOQYSWkMqflnuHQk4OXRrfLgqr0RldUEYd7GDbTMYigYL8AHLq75tTgpsURTAMAiFy2Qe@lists.infradead.org
X-Gm-Message-State: AOJu0YyLno0FfEEMR3knODesZr1bMqLOtJto7WSZdB47dQESVDum47Ln
	C96VERj8H2tgJRS+xGRz1xf3D3381KpjQdIk76pUdfxn8Dp1y3e7pe8scKlAm6zNVWy4ch7J4gQ
	1IBDzMr+Yc5fNmph+r4GZjWvA/nvaRep4ylRTh5puxg==
X-Gm-Gg: ASbGnctqPrhn5FgcUx1SeUZICBxZIxYpzQss98CpiuUWZafNCh0RUI49PE/SxFwviF4
	kFGVjf2aTo43JWOdgspopGC8pwdzqNivaYpf9EQKbwnvy5L4r12IgfOWFTGOnlIvqPopudkjDSP
	8oTTaIhrWj9PxJntJRVVO7fDLwmKclc5loU0kITzHSINc=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_010118_846949_1F38CB78 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij

