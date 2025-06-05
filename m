Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D979C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GUAkxOIFy9jpQLSmntQ+q8BrdugRJdUj6yz2GA9p8E=; b=kN+9Av7qouTa5qOfPWgwTgTqFB
	Ro5zVC1udRjmrq+2gd2snnzNccJYjZRqeUTnz1xAN53I1e2F7rRu6OGyEuAH06Z3QJaGgsUFhtR8P
	WuZRgpRFqjG53aCuyvX9SQxViD18fBQh/ajgRmsFKlHdhAt/wvIpceqv1UqTOCRDGPE32pXkvvntL
	ZuwVKqzWWRRRoXVBgbjdO+37J6fd4ScgLBLqvvdzzDoCdS1C0TOsx16OQL1Phl1dd5X64MVIVu3+z
	098frTa72q86tXeiHFjTKoIhYVbTO2GRtxn6Is8kwXe/xeFfFaJM0TupjYcL5VLsmML1varJt2W9B
	RSmnkf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAxi-0000000FhNh-2XxB;
	Thu, 05 Jun 2025 13:48:54 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAeh-0000000FdtV-3Flh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:29:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5534edc646dso1074257e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130154; x=1749734954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GUAkxOIFy9jpQLSmntQ+q8BrdugRJdUj6yz2GA9p8E=;
        b=vT+EECDP8cxkOypozGRbfqzGQiNOjm694E+dF32z9ka6T8rhyhIMdaSS81gRUKab8G
         YkZGXX+IWkaBksAsO926dPCeeikYn8mUKfnO4TlhwMgq2OJ4HI/WAs8Z4hP1jpyRRrDy
         ncTrRWxMlZUcEn6TWz6nqcxTFofC7Gwgh4tUM/cilenecDJEeKPJcMn+E9s4q9NweTAF
         dGVxbNBzWb48kPYpircdX/afEyr2XzZSB3OLtlczEFQD9J3ueFm4w+Ci3cQAlKbqNpGw
         6RgY10RIvZ/5YcmHT4eXQr/L6dzzSHFU7UJvyv/l+5+4pLa6EfKwgstiBJj1Yf0YXDI/
         xjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130154; x=1749734954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GUAkxOIFy9jpQLSmntQ+q8BrdugRJdUj6yz2GA9p8E=;
        b=TWbVQiO7uSVwJRlaYSzgbrKxsfLL2QzJWwsRwREW5SWFBw9uoNkIwjhj6pRrCvqjgW
         3wnAvlXAxSTDXTn4LCG4efX8ihf/YpU1qsNreNfSPzBm6VExftmeueySgpbRwIDz9nVV
         mCULhiS3BF8UDR4sZaJYgDegKAI9QZKGf61BU22dD+iGFcXL6N6UIPSu5JpF1hCJykXa
         LbXc6sRqifI1fLHEevZHKEA/MWPfEYuSfJ4XuS3QteCrYnPDAG0EI0sXxc8FMy7FMQm6
         lEm7M7bVOsAU7J+7mL5g60bbq2NNRcwO10GFK7YgSHX1UC2pXUPESfHhcT3dc+lMcF0B
         7edg==
X-Forwarded-Encrypted: i=1; AJvYcCUiGQvnyUcKusJtgQunCpq2T1KvFvY21bs1J1hpHhGJNYf5htVYsgz6cqNlsrFOUdNRPAiZmA9RCzBrHavA4dDF@lists.infradead.org
X-Gm-Message-State: AOJu0YzvR8Bi9cKEFA3c3SKbZ8ZzVQ28Z65Qy6Je8FWGzovFOrXbhOuK
	vOtV1tNc68eUAm4sYYdtJSSoh+PqR4C26BrYgimG8pDd2zd98jvrbdSlUH7gwCTVIOi8DxINH+D
	RFlZg29fH5x6WNsVgU+3Y4aZ3boXPUkU5yo+EiSSCiA==
X-Gm-Gg: ASbGncvbnNMpHkV+EgjnFKwr3qngjcq5B0AGvwaqEh+d0VIEfdgYDy3gdvAfaKkuPXo
	vRpvs/2fNASAdtl3vbum0Dq9DsxzNg/GpiTkWqnKz+Ja618u5MJS5kZguEOz/i8WOVpOfxdbO9Q
	uKTebWHc1L7faicyaQCQSGZgRv1zvmTvIe
X-Google-Smtp-Source: AGHT+IHQ5la5bmYfspb0z+rHTezHnXmn8S0sJvRzX+sgZ7IiaN7ipgyy98pOXOBzrw28bsqpF2v0lH7bNQ0EOyTmIHU=
X-Received: by 2002:a05:6512:3ca8:b0:553:2a56:2e8d with SMTP id
 2adb3069b0e04-55356df1dd7mr2038017e87.40.1749130153902; Thu, 05 Jun 2025
 06:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com> <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
In-Reply-To: <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:29:03 +0200
X-Gm-Features: AX0GCFv01J_2f7I-yQlAWEluILmgAXhjV0w8aFTFPw9c58Y0wmETNUPszWxuq5c
Message-ID: <CACRpkdZRjLFa3Bni=wMG1LBoWnW+Zenj2FVP=_2s+U_1eykt7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: rockchip: increase max
 amount of device functions
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, kernel@collabora.com, 
	Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_062915_819530_BAE2EB05 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Jun 2, 2025 at 6:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:

> With the introduction of the RK3576, the maximum device function ID used
> increased to 14, as anyone can easily verify for themselves with:
>
>   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
>   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
>
> Unfortunately, this wasn't caught by dt-validate as those pins are
> omit-if-no-ref and we had no reference to them in any tree so far.
>
> Once again kick the can down the road by increasing the limit to 14.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this something I can just apply?

Yours,
Linus Walleij

