Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E76E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzQXlCMvZYlcQ30sew66mc3WfiRkkiYzr+TVO3BNZ2g=; b=JWyImluJ5WJulrX8Bk1v69pJqy
	7FPlr4FLH+pEEkVg/EMh3dEIPQ+jvJoKvgyb6WLrPFmr/d6aW0CxL6Gt3+c6sNmoG5fotbUzYsM//
	aRwV3XNqdoP4Try/lEcMTMY+H5OoSj9Pt0VlECSZ5lkWKMoXwWY27KEGAIiJNe0x0lzWAnkPIf8M3
	9GjhO2BR3aJ7EFxBHoylQj8ZctEwYGzGhhHx/nmacnD2nTs+DwTsDOf5sn+cQIVlvPRLzEmTD4G3y
	eN6LTU+kyr378kFn3OFR7SRd6fIZgcl7aP1cm/q75x69mYyRQL4xcoUVgywGQIfVwrU6mubJt6wXu
	A70p3Uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCyg-00000000b5p-2YjL;
	Fri, 27 Dec 2024 16:14:18 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCxB-00000000avw-38Oz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:12:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54021daa6cbso7668620e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735315964; x=1735920764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzQXlCMvZYlcQ30sew66mc3WfiRkkiYzr+TVO3BNZ2g=;
        b=oKkQqsK33gQyQ55kZ5GdChdNm3zoV5nBYpaewwAx6XyI53v7o+mPnl0+Nmfx79CLVz
         g/81iAJxdlnYihR1Z63oFgjfTLCG6dwBffFSKWymUVldGEN79Xlr28vyQiwZ/QEe5XMM
         z5lSSWM2YGygoG6hZeUbDcCUf5VzkNQBueyKdkX0vUiE+JSeqVZL83AM/qISrlStxEyJ
         XwmV47QPYeUsNe4ockXAixXjRC5Mw8kCAsNs340lTI911dFC4gpSnXz9wXHzxuptZXpJ
         gQgaMJ1qEWfOY/D4knMdTlIERDfWe99l/EYMzmDNU+Zl5nEwj/0FHG/kOUZDPbUNZ69A
         o4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735315964; x=1735920764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzQXlCMvZYlcQ30sew66mc3WfiRkkiYzr+TVO3BNZ2g=;
        b=VXgMHgyg+2aNew3Ntt8ce9b4iTHLhQJKJO7btDg0XPvmnOkDSYpPM9d+92npyzMrEK
         dVJ1Pt4VT5k1lfdLsbNb8PUMoMnWSIhhEqTPd2kgmqivAe2xFnS9N0q9kcy3x066b0Rs
         oO2R9+FEPmftYMGUdArZKochIl+XovXcaIwiJ9o+1ez5IEBL7GwfFEsFtSPJuZ5qkc1t
         80Be8xKCf5aAGVqTR0hikdACd4ydKPbtmyUqGtuxDzpSgCZKao9pLv/VF5DnOjxp89Lm
         tznTDYUo+9LZfhouD+a2woXrR3m+F7OehlynGfSnle0VftCoGU5XU8nNi9Tb4h4l+pup
         Usfg==
X-Forwarded-Encrypted: i=1; AJvYcCWlyfEfUF4P0YlaQbkKQ9INlDQWuVPIWHv3UlGdoE2M2OlP9KxxoQ2chnE0U19Pyf5tKT+ry4kRK3NGpW/byNvm@lists.infradead.org
X-Gm-Message-State: AOJu0YxbJ4bHBv+fasz+6qgH65lVMEAEeoLrvoeiM+pcL3FvUzN9QZgW
	+lO/6rehufWqEdTEPh2URkheKxBempVn293JekKvdWkqNvpqYga2XQ4znva9Qm2WoHrmcohDwdf
	szimuHmqZig3ZY6mmZRaNKGfAvvmpDrx55TNDUw==
X-Gm-Gg: ASbGncsxTZ7XznR7XuzDwlJ+S0gZB39aXtC+CO7T8NyiTwgQIDsy8Uh1IQr2DTBeerV
	dJN1d5gLfkA5qMsqwsZjbPP4gbJWuxb74V0Ck
X-Google-Smtp-Source: AGHT+IGgqvSjw8IZLAtptQ+kYNS2mbGIGCLpPSBtwwKp1RNQR/Kv68IFbhALSIDwerif7lmhhOtRxJcClxaw78xFeNU=
X-Received: by 2002:a05:6512:1592:b0:540:75d3:959e with SMTP id
 2adb3069b0e04-54229524793mr7805320e87.5.1735315963490; Fri, 27 Dec 2024
 08:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20241224093620.3815705-1-kever.yang@rock-chips.com>
In-Reply-To: <20241224093620.3815705-1-kever.yang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:12:32 +0100
Message-ID: <CACRpkdYnV_M0EyQXpohMdGrxXq6aupppbPsMaq8cZDFhONCgVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: rockchip: add rk3562 support
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_081245_787972_D2FDFF2E 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Dec 24, 2024 at 10:36=E2=80=AFAM Kever Yang <kever.yang@rock-chips.=
com> wrote:

> From: Steven Liu <steven.liu@rock-chips.com>
>
> Add support for the 5 GPIO banks in the rk3562.
>
> Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

