Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A76CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=; b=mEXTRsnqyDnG/Tf7vYRfn4c8Cm
	pMu9SZB+2mTP61UZ1EecXhfzi1fjqeSxUneJ/X9gDUAtm6SdrAG+/qZw3+bdx2JoplT8nYyOJjoVU
	HFnc8LLxapMfRIy/1S926SGvWiSQHlvx06WFxPG4ikcNmC2FwprydK/Lg5VPi+UcqF98shA6BNfNh
	sCuy8Iso1Kyv1Sa88KmyFcO2niod6ktvofY7YMqduHRxUYmfPuHZ14ssZp0fFt3Iym/s4xnno7pdZ
	GA/PFO9XiFnBbwDKED3goQZDL6ta+7RORvHRXNl618wg4kOKglqqhx0ir/+H5XEbFiWoH06DtfPbX
	m7HG9HeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FUI-0000000CrbG-2kP9;
	Mon, 13 Oct 2025 10:09:06 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FUG-0000000CraH-0pXM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:09:05 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso43399921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350142; x=1760954942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=al6mtLWSSe3o12wplLJf4KV4DKTQ+O4d0yXO7OeT/XweIMrHfzThUnsjaRuHQ6CUSm
         ZowLS6zVrqWRV6Kglz+wR/pdi3s9IYg5YsjllQBJWIBI1lbVTmTfLxk3qd68dnHzE2nh
         cp8MA9UW3T2H+SYWIsD7qfmXYIQg0HdzKEAchyrQLdLCrMsSFPVaN/V6yE7LUqqC6jz8
         8qIkaxXYXS2SMe/f/6AZBF61/abBctKKNr/7IpavW8ZYeYyVEaJzRMUqvE0afxnID9e3
         YXwJ5icLTDmmAbwtEt4HUPh/jzZyfPfKAeJPk0T9G0g1Y0HtQylTH0GBC/5LSLMPBJqG
         IwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350142; x=1760954942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=mM+MvztCwV4TuVWp37gvphMDf9ikA5HDyg4o8cth6mDF0+MzCSdl0ut0/+Mz3L+HFK
         2cj1am5ss+eRyOcE8OJ0J+o/+vgMv7uPXQtrmK82RUITfWmDyQuhcAAleDvMUd5TrQ/e
         q6YGBYj5xK+JKqs6vQom7dy/m+MqL38JjbTtP4tEf5oc8qr17wmuj4xhOUVDAJ31waGy
         ZtD0zUdM5gQ7w2ZujdfgGEzH0ovnBsJCa9zo+bj8scGbsqvJOI8Jyh+Idvq/SXEDZO08
         YfiEserBQaZqvk421xusRsbG/ZPJTHsC5VYxywYTDZvAHismfdG6ocjm/n91/nrOQZ5b
         cxRA==
X-Forwarded-Encrypted: i=1; AJvYcCW56aiRMd5r+aUWd/sSn4Kf4dCdy4//kvdTH9a5FErpcTN/Ohk+NIwRsRCSrp0O+kBf6d1UxF3BOe0XPydeaElt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7QlhisJc1xVXtyGCcclJ37J22d+UGWpJjBHZ1K3390i6oyTvE
	ErobT/pZSJztJElIL2F70uc0SxK2Fu+xdTf6RMbNik33GzznO0Xn3EbaYSloe+IfT1zcOJOFQ82
	kdEIFpj/6Y79emyFGzs96Tcnz574QMEd4EQuzTwUUFw==
X-Gm-Gg: ASbGnctog5VymTC7gr4evY66nIPmwcHUa1j0bxvWG3QXhf6mlMXhjJOYopunTyd6N/V
	Bdmwa+eh/c3wpXmlnrBf6UVep/R/hqRsLYlXhNuBV4MSOpTbyHS1NrCKLkOdupmOJ2+HigAGA9p
	KoOrgk2uklpmATol9XOeZrt6sVKRGCdymPW53j73u/PG8obEHgherdUG0+DdOGhvSda5XCYdkOi
	cmAAUtvV+qokK/Y09dRdLb9tMZf4k+j7hh6ei3N
X-Google-Smtp-Source: AGHT+IGw5FBPHMZY98OuHAGpmxfzqUBjohFZCP4Y+3ye7G2Bxk75SIlnTIXF/kp1jPOVfGXssHiDF3M9kkzcVBZy+WM=
X-Received: by 2002:a05:651c:4385:20b0:376:41f5:a709 with SMTP id
 38308e7fff4ca-37641f5d53dmr17660371fa.48.1760350141633; Mon, 13 Oct 2025
 03:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:08:49 +0200
X-Gm-Features: AS18NWBxwqEgY4X_LszokVA-g-bopo-7ZyTrk7rGuaWxNocfJ07lm54aMEbkhdM
Message-ID: <CACRpkdbvTfJOBKOaEjje9dhnnjMXr1NqWpVBspe4Y8_WphaPSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for mt6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_030904_244293_14E30E1F 
X-CRM114-Status: GOOD (  10.77  )
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

Hi Igor,

thanks for your patches!

On Mon, Sep 15, 2025 at 2:46=E2=80=AFPM Igor Belwon
<igor.belwon@mentallysanemainliners.org> wrote:

> Igor Belwon (4):
>       dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bind=
ings
>       pinctrl: mediatek: Add debounce times for MT6878
>       pinctrl: mediatek: Add support for MT6878 pinctrl

These three applied to the pin control tree!

>       arm64: dts: mediatek: Add MT6878 pinmux macro header file

Please funnel this patch through the SoC tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
FWIW.

Yours,
Linus Walleij

