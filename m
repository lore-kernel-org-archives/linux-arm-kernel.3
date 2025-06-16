Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA26C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=; b=TiwZAvNcWjoHEOjwuI045b2IH+
	7LHmgOGifSoBbRM8REtWcAr9vVqxoa+veGTlMkc2IUmtIS3LWBE18qbwtz/bMBlljBG+icjdEnoPE
	Dv9cMHvjj9hqnaN4Cw72zuXJt15N51w8Bne+MqrQ2e7SXMnTx7knz/K+8GBn8q06HDB4g53iAQ9WU
	xeUTe8ksrOdCFxZK5W0ng5MRtuTFT2Td42SJXB91m/jeLaVlcgW4aGj4gedtHp3cDzGe9xpDlsi8z
	QLx7D+ry2AMB0h18qnCwZVqU47peTMtftPL82JqFLVLvwcWZ64u79GdzXwJyaVuxWpiS+1cHSNBuj
	km9Q94Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5PK-00000003pAl-2yQB;
	Mon, 16 Jun 2025 08:41:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4qL-00000003jxr-1HeP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:05:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553c31542b1so546925e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750061123; x=1750665923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=Z1kyVY/P0EWgihwiPxIjg3qkOg/ey/hQraR44bbrf6RIAu4AWzhwNKWKFsptCPVJCZ
         MjIFoVSXVVSuEaOTbqqHCRyRq4NAXLyUKtg9wV6JzsaKk8GvWx+v+oG3+B2p9lVR7t6h
         ug8YC18nizE/XVISLlTDeIZU2qKM7Bb0Dr+aPYtEodjFNkGu5VB/4/MmJknL1m7Ymk2c
         59gfrxbsv4kljHeOruX+nmNDadPFX174AfgoCUo4K4L9JwssZmmBy2haF1mW1lpVKLca
         NdSyPBanF3mSiM8sMuVSimZ92JgVWstfsyGApF0I0z0TbxbF/fe7uNsp/kkjpjjafWQt
         YX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061123; x=1750665923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=Vmzr3my+vPHl4zkbTG1Ftk3HsaiYvtFWRCxUumxE8hw8BX49o3FVI8kKiDmebxLibC
         SALl8SW9T+JShZymmce9Wa3g8MPoQKHIvfwMFlH4CF1YMSliVfdHPGNxJLywh0QwNNJk
         I9wiFG/+kE6/yJCWv1VmAflvhFlYvVkDBMsnRxCMp9SwW2Lz9tkhLA7CM6raMJ4RNbrJ
         Mz3L18UdHli3shiwlZbU9SW5Rejiq7EFu00Dopzh1ftkNoV7qvQetyr6JBqtETyJU1ne
         HgrS0XXfBe4nMbC9owS2XRZe2FlMyFlEJy+MoKtj0OnY/hbzyCmbxOXzETDIwwQM8ELQ
         amvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7LVlzFSPNhx9PW/PzyA7tQSuUJl6TI3+iqKiXad2465jvH1rkUvo1o31ERoyOAyPtCynd58v3b+e5hUoAPAlF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz0KwtY6lsZKvd+93calyfNbBRdaOHOlRt0diPPXK8cVIQb/F0
	yI+zEYPoKGUCWAZpHD0/uLdZSVup3DprEeraV+lpR8C88T3v2tpNNeG5Rcfkpq479M1DW29ANud
	7oMSzxiQRBcM/HS/o31fI29+7HZ9odqDpVz4FheKIjQ==
X-Gm-Gg: ASbGncvNeJq+ha195GdKlVMN9m/VT7aQIwbUsukL5rBue0qbFkZ25iH8DQjf06rJ1D/
	qJpSwh++gQdHL0eeFB7XyuGnfSxNDRFj0xIfxGwUBiSSh4Vjpy75dGOYG0yCpLlqe8EUgnH/UzK
	/XfUzx9QY29Dme526CLY/01KAkojgcFSGhOiCtDlusVo+cOYD8aBe0qvXRx+bQoZXj9pwhfrTZF
	t4=
X-Google-Smtp-Source: AGHT+IHui39rGOe78ZVv1GL/qozjTCuN+gIRPTaD2LzbbRuwGK+ExSJGXv1lf4f3l/OzpiTJL7GG+3gb2jdEJtZBUck=
X-Received: by 2002:a05:6512:3e07:b0:553:2fa8:8405 with SMTP id
 2adb3069b0e04-553b6f4f34bmr2175898e87.56.1750061123552; Mon, 16 Jun 2025
 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 10:05:12 +0200
X-Gm-Features: AX0GCFsKseF3x4tMXUWhM7GW0aQJySrNOOS0VJu19t9Ohnme0LPMU6-HMe9h4i0
Message-ID: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_010525_386503_12A481AD 
X-CRM114-Status: GOOD (  16.41  )
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

On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:
>
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
>
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> ---

[snip]

> ---
> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard
>

Patches 1-4 and 5-9 can go upstream independently. I suggest taking
patch 1/9 through the GPIO tree and providing an immutable tag to
Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
with that?

Bart

