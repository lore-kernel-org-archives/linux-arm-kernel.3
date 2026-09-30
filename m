Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3408CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmzZfGHoDgoAyrR9m4mtLd61BdqL6boC1QSPlsKB1BU=; b=X9xBJeqOs1J+BAVr2iCMpwE6bR
	kaNtT0DvYTgRuWurvSOxwOxBZhyXKe6PXo4cyfg8yjo/Xc5qja+2UOiq3lMnWo2x2JeVwkGY/lv1I
	Y12MicuTDA5FAuhqiawPC3p//3td2SoVOJrAK3pYyb75qT+q8r2k0/M2IJ5V3/9vBtJoZ9rd5qOnK
	EwaQWu4T8WyY4oWrXi3Z5JvGe4aOETONqxrKh1rTylnAkSq9/LA6iRYK8FNiSxXYNiyc4D0rTAaHr
	YQRx0H3PaB9tS2Yg4ZxdPOwthJRZTxxBqLBfHwUM9TCl3RPCp6ZiteyZIs/MM3rSbrb1RtZqJFuy8
	+osqVkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuM2-0000000683e-3lyE;
	Wed, 30 Sep 2026 13:28:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuM1-0000000682d-3eTL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EEC743C0D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8404B1F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774893;
	bh=GmzZfGHoDgoAyrR9m4mtLd61BdqL6boC1QSPlsKB1BU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IzH1PSXY8/0oM/wtjLZqOcgTL5usqsaiUZN3/ApGwSaS2xyj5OEg85DPdwqtTlSje
	 iEDeyyTR+NF2EZw/9pcdPRliTndfjUlqeUuDggGVYxFnpWCDLm5lhUFVCan0cZNhFa
	 4mIQToGL6gbqb5FGv/CGzxerjo3+isn382/UdV+Zc7Sz2DeH4Fij+FcR9TIDawfPo9
	 FsKMW+4z0FE3NJpZFGECYY/22XVSEn3JRQX5vRZKeppzLlpDuJvAdZELvdML6ua42L
	 /U239Zz4jeq4Vx4yzGsFKsHh0PBwc202MdH7PVegzc35K6xBpti0lWToDn87daHRDy
	 pCPQjuqGgyqxQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ede3ab7aso1735244e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:28:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVmIE0fHJwGe6Re5mDwuzZOH+EIqdEgujRZDK68c1U7bAeKWiE869VrRsvX1bZSLu+hCAeZ3InjMiYdXxLmSY9@lists.infradead.org
X-Gm-Message-State: AFq9FYIZCC3hzsO0q4J7bRcofDnAp6n5vlCYwdLga+7sMDFznsSmey9e
	+yq24YXIwhm+rujTHfBVEDO/+J5Rpma+LEiCknAAmbTXzxZXdwFPrB44LfBwCKFzVkb4+VTKBmr
	EAlJq6Kk4Ay+yRKVS8mHpzpFg3waW+tQ=
X-Received: by 2002:a05:6512:3b9c:b0:5b8:bc5e:b574 with SMTP id
 2adb3069b0e04-5ba40612645mr526612e87.44.1790774892330; Wed, 30 Sep 2026
 06:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260918095853.1348694-1-congnt264@gmail.com>
In-Reply-To: <20260918095853.1348694-1-congnt264@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:27:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmc6GJP07DJQxH3OGJ1i-6+ksMu=1gEeWkr4JR4xvh29Q@mail.gmail.com>
X-Gm-Features: AclHuK_-hjzb_iqjk__PsBqyNlJIrjqhdhCusnJbaUiZ1mRhmBrwCTww1yq5FOo
Message-ID: <CAD++jLmc6GJP07DJQxH3OGJ1i-6+ksMu=1gEeWkr4JR4xvh29Q@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: stm32: fix clock leak on pinctrl probe failure
To: Cong Nguyen <congnt264@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 18, 2026 at 11:59=E2=80=AFAM Cong Nguyen <congnt264@gmail.com> =
wrote:

> A failing devm_pinctrl_register_and_init() or pinctrl_enable() in
> stm32_rtc_probe() returns directly instead of going through err:,
> leaking rtc_ck/pclk -- and since -EPROBE_DEFER is routine here, each
> deferred retry leaks another.
>
> Route both through err:, and move the pinctrl setup earlier (right
> after stm32_rtc_init(), before the RTC device/IRQ are registered) so
> disabling the clocks there doesn't race a still-live IRQ.
>
> Fixes: 16ad2bc09efb ("rtc: stm32: add pinctrl and pinmux interfaces")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260914135401.373D91F000FF@smtp.kernel.o=
rg
> Assisted-by: LLM
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

