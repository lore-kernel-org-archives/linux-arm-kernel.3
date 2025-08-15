Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB040CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=; b=lXQOkGDSknsQiSr+UdRp6x+UAM
	ptfy72rzgbaqg2kCp6ZDW9Ay4d9AhV/0KdW3q0+9KsM5hk5s/531pzycIS6x2Dz2TyGdD20spFHM0
	6jInM0PAPh6Vt3nz1KBm1+zOrcmJPSBzc3KWAA6N9yTeCKlnY2gx0E5MFBJfaWlY8jSwBuFgtm17h
	cQpAioYi+N7gOVjmsWYchLboQUfWLLB6oN/iLaHhdHvxY4uk5JJUFDHIbhspbEekIIa0iO6XtGZUG
	NojR7IyVGv+YaI1eyF6d9VaipICWnkGGuR0QmQ4OAHhSibS1jwn2en3Uy5qkyDQUewa/Mx7dR0Pve
	JMxqT0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkm0-00000001FaB-1UdE;
	Fri, 15 Aug 2025 03:06:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkjR-00000001FKU-02Dg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:03:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce5097493so1625387e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755227031; x=1755831831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=esfbJXg62k9CrF2RJZCIsRu2Xm/TA4n/EzPo0PuB9mG3Q0KnM+nN1bvONoMnAda9Mb
         ilM5pxPFXS/yVyeipE2IPNAt/+JH1fUQrHHk707yyvg/dQgFiYyJR3GTLnwtNfoarv4X
         NO45xKNPwRBgbDHyDaqRSdaQAT0id4IKNftz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755227031; x=1755831831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=VdKBuWHC9m8GbDU+pTdFqHYAE2LZEHodYWP2H4nuedwQ+ekWenWJr3qKpvZD0g1NOT
         quPhEf+LiDsObLn4CuxofyAFOYqzLkiJWVbm78y/FK/2ldR7EYvUbRdVD8khNqhPRXmH
         xVBVDV4waA0OQGdjGWyidntGkNuFTBu5lT/Fyl79hSWqkUK6YGcWzZmfO5ZIOnuksLgp
         S5WF34dtRA6FzBJR5AEe0VTVzdfY/+npa28MZemqkrBkgxIu6+t4fkQZ/MDBcczzrfwW
         abPvd3EgeDi6XGg/lknygsCJJXpo1M2fAf1wopS5vXFL2nWT9h00x4dMCcHmvXzZ4uyc
         Zllw==
X-Forwarded-Encrypted: i=1; AJvYcCXkMn5y26HhPv8nfHiTcVTw08/1JMpfvCaPenY9P2SVT7rTGOnnALV+JzXAupwvNF2jFM9JLfutTHZ2nKOnhdg7@lists.infradead.org
X-Gm-Message-State: AOJu0YwbpUlJiEfADHKMVXPMsKP/odTCaAYRRtbO2cxX2++OGwIOk7yW
	aFRy71gDuvPo7KDEtyU71MnEhSI4ySxnXTLC+U7Uoep7jrh6Ey4IvNvxKbGDJw0xwPDqOV7waBm
	DtVOQVEz+rJI2tXBe4FY24Gi5+FZl313gk8j13spg
X-Gm-Gg: ASbGnctcl4DqTrEjFNPn19AZJbZ6WQjb5I2Lq/aukAkgM6xgEFOaE2Luz1sGLn0KAdm
	EwA7SYyw+rOs9gF3O7MIQg9btIsL+kO+SVTOqDhKaP+uzbi1eiSunXFk+8w4Qao+qWoyloXjaGR
	2Av2sJqC/SuQV4z5wNkszKGfwnObPZTmXYljeuNfyTL8OPVhIL8NNNEElQK918foy7j7Y2Ch74k
	PzPZ+1ECcgr1lBUZ3jR+hIiDKE1TGB+cQpPLA==
X-Google-Smtp-Source: AGHT+IE5oudoWOuExXFcWc613ObdeU+xcba/kkjYM4lQww+ElYzSmi2/gSXFiaP7UzcFCgh/kx+W9zwxu3OJ8SIUDuU=
X-Received: by 2002:a05:6512:1104:b0:553:a9af:9e43 with SMTP id
 2adb3069b0e04-55ceeb906demr143594e87.53.1755227031067; Thu, 14 Aug 2025
 20:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-2-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-2-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:03:40 +0900
X-Gm-Features: Ac12FXzlE2kni0q5NyqXgX7d170kjvAVh0V3KwwS63urIxRRXRRBW2zdHpmR4vA
Message-ID: <CAGXv+5GDU45O46A+mpdu1HQ_sfT2Su4fgFCtr4xPjoRPzwOWmg@mail.gmail.com>
Subject: Re: [PATCH v4 01/27] clk: mediatek: clk-pll: Add set/clr regs for
 shared PLL enable control
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_200353_063515_4B23D32A 
X-CRM114-Status: UNSURE (   9.25  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, there are set/clr registers to control a shared PLL enable
> register. These are intended to prevent different masters from
> manipulating the PLLs independently. Add the corresponding en_set_reg
> and en_clr_reg fields to the mtk_pll_data structure.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

