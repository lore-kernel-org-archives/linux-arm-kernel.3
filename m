Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F81CCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKmlnp6soY2/E60kLoIUuxjPFvwpU7GxO46vKOmRRcE=; b=P1HDxfKIhgu5qCCQKOazx3O/p9
	wtCqQKmv4hA9iJEUY/POOqeMJszUGOBASS1ebobDukTQHSYKP3Y5sGBoM8NJUY2cnt1LVahtjZsCK
	aKkDUw4GVL1VVZSemhhUsOtkVw4cy/sUQGbI3UVKngaGOOSv6UyEvlfsZZU1WubN6ZSxpyv+OBlew
	8qjyMqqfS//0B/Z/GL6LbP4GULTUXCpHPWFVVKKQ+1yo/Vz/UWUPICOMXxgSPknn35v5NgZJnGuAO
	0c8hKlOZjd8SpTQzdtvid+ljBRlBdk7+9Q7aIrm76X17f3F84UdyjDHwN+W/gXVVRCNJOiGOd+JxZ
	MmJGtdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdul-00000009Kri-1phr;
	Thu, 11 Jun 2026 11:49:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXduk-00000009KrP-1rHv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:49:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE2B1418F1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FD51F0089E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178577;
	bh=rKmlnp6soY2/E60kLoIUuxjPFvwpU7GxO46vKOmRRcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iWoxSrf2eJBxIUL1UC9eu2rCfEOYt2pmOr3+Wr9TXMOGuZd15Apaqr0KVzB7qEWLp
	 mpWBVGoOa6w2vQ3nn2A62u9t9wunj7eluguHPjiHPNYGFWOLPOe4Cy+PqxRNG4saLr
	 VqVgvZFqxqz83kJ0L+7YiCJ4W7ZbILryg59ck0zhbxrT4qqnlfJFPGopVdEyok09t3
	 rufvsQKCeDb1rw/PVAD/ube97OYxH2e1OQ5xagFAVrKuy4A17J2amuInhxJtoKiOfw
	 cdZQWR4QxGpzf+RxHFYfgDmwJAdYiSXua8YbO8VW/C5CXlxRvfC8GYKWz44Olcu8ui
	 wl0+tXVbBIBVw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa7bf3d512so8066609e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:49:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xoGocwgP1kzxCS64oklErkw9NHxw9Hqrc8gW0MTbF3svuWiBPen4R1qGvRNYOgaKXy2wMcb4pAZut49EAwHB4@lists.infradead.org
X-Gm-Message-State: AOJu0YyuSxkqu/WWgiMh+oI9i4CNxzkGaU4JhzSSKkctqyVAewL/EcrO
	crqW8jxk7HfmcdSVlTsatId3u6SQ+d7LJ0LKwrKX1r5rlnv2qo1fKByKE24qWwMCe6x/F1+eE7J
	A6RhfRK659YiHb3w/B9KcbxC5RPcdzek=
X-Received: by 2002:a05:6512:3f07:b0:5aa:4bb4:1e9c with SMTP id
 2adb3069b0e04-5ad27ab047cmr828882e87.18.1781178576530; Thu, 11 Jun 2026
 04:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260327113006.3135663-1-andre.przywara@arm.com>
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:49:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLmok4GNZHT1_SVxRgOqQpH9d8FX4zgNpQbOdNjVka2Hew@mail.gmail.com>
X-Gm-Features: AVVi8Cfo54uztqxkktk8YLcVPxtQEtZS2d7KQPPjjqOVBQf71Is6FBvmH-Q48FA
Message-ID: <CAD++jLmok4GNZHT1_SVxRgOqQpH9d8FX4zgNpQbOdNjVka2Hew@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ operation
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 27, 2026 at 12:30=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> this is the minimal fix version for the GPIO IRQ operation on the
> Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
> which is a major annoyance. Those patches here fix that problem, and
> should go into v7.0 still, if possible.

Patches 1 & 2 applied to the pinctrl tree, please send patch 3 to
the SoC tree.

Sorry for missing this, dunno what happened. Probably it got
lost by me trying to use korgalore and screwing up.

Yours,
Linus Walleij

