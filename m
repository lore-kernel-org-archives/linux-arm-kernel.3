Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04E3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=; b=j/QU86Fv21TvbLXIQxr9ndKBAp
	LavpWAWP/1HAfMpX5bA296kht57ksJYXQkv3oJ3sRzHWsdVDMGn0Nz0m87kJhXkPks5Vv+agTU4hX
	6g7iUiUma4Kq4jz9q+ao3dDpPnwrZ0MQK5l2Gjx0CCFYEmdNm8fEaCiI5opqGxvl+vTWq+IFo6jhZ
	3nxuT64sWn2idLDQ18Ja6mycLTR4chN2uhGexR4E/vYuHmWrsk2pod4xuopVdMVZxu+YHUzFHI9l9
	lxbRn8wEdan1FvVTVh/tTOFyATEN1dHQN5G1TSXor6rolgX1vuTBZKK0MdFJXeW+0bD04JdLgNQ3Q
	jCmIOGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bG9-00000004v4z-23bR;
	Tue, 15 Apr 2025 08:03:09 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b1i-00000004rZ4-2hn7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:48:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54b10594812so6104868e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703293; x=1745308093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=pQkh0gIb2XH76CYFJERnukuaTo+StfUM4Qdy+B4Fisptzpuj3hPZlwIy/WgpSKWod+
         xq6lLftyaWMh7MR9jEwFi0lAz8UxGIOErGEjONyvhCMENjbS/KZrb+UkSvRDipqKeAwC
         3eRojxDK4O/UCkSxFaDAgg13L8A9RsV0dtYFXyGXGMowu9u6b/eE41v7Cwtz81W0AiiZ
         Lel4rQxwQNbtd9r2IDPaHymFSB5uMY46sK5415Nh924M9InkRTuN2tKq0RMsoLyP0yVj
         d97bwuB1BEH34jHFtFV6P1oe6LGju8/OzRXYkvOe5owcwNZH3Vi7MFcHtl4WB6meUZuM
         9ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703293; x=1745308093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=YS8Z6KDYUdw+1ULQpn9cFadZK/IvClmmI4z2JSe3SJtpANCeWm82xWKHW2YxXnrscS
         jwWFfh7ew/feZmyRYfxZ4p8ESpCRShzv2dhEUpU44JWWgKrwdXfcs+21eyehOBxa8XAF
         ARiJy8yFyE5ywTkuVzVPZHfBSWqiixB2ngk8CMFj1yCRKYMsGUwsxbIL69ry2Uk6DRzh
         EfkfmrnqzNTYublV+ExUt/zE6FrFFeIqsrhFazHM42MvVUG6/O4fWprvT5BUVraR8PqX
         U8Q32kDMWje8036mZOlI5qk3LyaPzw+Hc5/XmfeEV0UuOb4HZEh0h52E4Z1fNKNcIQNd
         vyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa3OBwrEiGXmcOyQUAnkCxMPR2ZPHJ/uIVQaBAZLRfOoE2ovVA/Qqdn05TCR0ePaOYGU5NrXuHPN+nxYNM1QD9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiyw9zziYTgHYpQcJi4yh2O7A4dJ1/cXz5+gdbKQg/lf/L7QXK
	0Axh04bJnTlmtvxBfgbHqHq29zO8Mr+NAKzkmAdbxshFV0guzfEI/MfiTUIOxfK8UiIviN0qT3R
	30qbS72Jg1nDJh9A42/8wqBVPutJNp6/NlLBUwO+3JL2nNjqi
X-Gm-Gg: ASbGncsqDVR+ZOhySP6vkdalS8cmkKTMvZvBW24qXjTSHiv5CRmPzr+9tEi7IZwj6Ii
	EbKiDAITUMpslokULbxewDqPhxY+iDKjnGaiIPfuUUQBwATsol9QuiBOorrjKL66u2ccLU2RaRt
	VAaCrrI3Qo1Zw2bu/ckpev0w==
X-Google-Smtp-Source: AGHT+IFby36R+QGppxoSzbZCjMCamLL2J2djIjQfwLtsJH1weaTQ78Om7gEcgpbdZzAsB23OqHqRE0OJYLAWIGrBLG4=
X-Received: by 2002:a05:6512:398d:b0:549:48c6:2a9a with SMTP id
 2adb3069b0e04-54d452ca0f3mr4196820e87.40.1744703292632; Tue, 15 Apr 2025
 00:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:48:00 +0200
X-Gm-Features: ATxdqUEhHhTQTxPlC1zh833yjXc_zv64fmsQYIEONqwjdaMf0Kb9zmn31Y6MG6w
Message-ID: <CACRpkdbSouYkMHvuVoAeFUiqTVvZwN1thzuewqWYUYMuRGYuBA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004814_684074_ED3C3DA8 
X-CRM114-Status: GOOD (  11.75  )
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

On Sat, Mar 29, 2025 at 8:01=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The public datasheets of the following Amlogic SoCs describe a typical
> resistor value for the built-in pull up/down resistor:
> - Meson8/8b/8m2: not documented
> - GXBB (S905): 60 kOhm
> - GXL (S905X): 60 kOhm
> - GXM (S912): 60 kOhm
> - G12B (S922X): 60 kOhm
> - SM1 (S905D3): 60 kOhm
>
> The public G12B and SM1 datasheets additionally state min and max
> values:
> - min value: 50 kOhm for both, pull-up and pull-down
> - max value for the pull-up: 70 kOhm
> - max value for the pull-down: 130 kOhm
>
> Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
> debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
> 60 kOhm is closer to the actual value than 1 Ohm.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes!

Yours,
Linus Walleij

