Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJFfe/ReS+bB0SKEoehh4uNo6Rwt0UXw3v3zOYh0SCg=; b=T/2FJBt4r6bEfAxY0JsnDEpT8h
	IEM73/1BcZZMasj8hA2uUyWesG+VMCs1bxCq6ynjI6adbDAJzGFd8Xbb3LVc+ixWFdGb5rP/gqxnp
	Qw6NW5d8HqV4yvzXDQnXKy7+jrcLmlxqGdAGoi9ktldyvHiyugG9fYZ9YqbQ2Et3F8/AVNes+OOWa
	Pd0zE4ykUDiNHtPdIpv2Jvz/5A936wNWWo3XDLkfclGJD9jnA0qTgfk6OMkPVS9xaxKyNLAsoGZKw
	qsyJbuOSZyvW5yh2nVCb3G01+dIGNu2kdXhQYf4GL6cs7jFnre9b7fMQ0ArWPQj5q8Iq8iVyJfLjY
	zjn9NZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taa3j-0000000AAuu-44uH;
	Wed, 22 Jan 2025 12:42:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa2R-0000000AAc2-3Ycq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:40:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54024ecc33dso6903914e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737549653; x=1738154453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJFfe/ReS+bB0SKEoehh4uNo6Rwt0UXw3v3zOYh0SCg=;
        b=eMdSKUw2tUKbQ99KoZjNO+Nqv8t+N2FRboyJ2NxJmG/WNkqclwJp27w3u8b9jJNLFJ
         OFdQWigFoQZbGov+JVc4t/cTdbTDcJZh7ZKfG7lQBvqxbb1IIi5ELP2xa7dOUKGONK+V
         zSM/XGQR3XkDFrFKVUXMRRcDGyO9li9N6WxTGmSwjAmi8M655Avfk2or0UIP0Mh8GxkI
         IGPRfpskh3fXOUxxczXCOZpe/S3OkIT59d8hUe4+ky47Dj1WUB4EYjpxf7TEjt1dm/je
         7i3B63+ETYW3Wc9Uc7iyd/UBAP6q1MtCIPzc6Etfj7N0CISX/6AEq0wZJKrtEHiPoRKX
         r89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737549653; x=1738154453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJFfe/ReS+bB0SKEoehh4uNo6Rwt0UXw3v3zOYh0SCg=;
        b=H4cGMyCoRHklk1+m/TY7Kj8pOSUD2XaICK1sJzApFkRyM8iWZMgZLeM5t7/HWnWHpm
         uzsjROiDwxzMBNWmlzx1vAgA5BH5yL09lCSjm1MOEmQCNPij52hPvhaf+dXgkTjXHZPL
         dYdRKTKrQaY6uGd3NZIX/G57wo4017sbLr81moeXAY46MPBjico6aIxBToxSaRrqfCC4
         ViKMkCjdjPhb8xwDYVUG/o5DNP57cS41S6IuwkT4l2YMXEjNcvXbwNjRyEe8eFI1/8xl
         Ob1hVLxxO6oUU8G5kRm/DNR+fFTb9oFuEN2yXvuMQKSCtwgbEQd7Wy0+4as84bUFkSwJ
         I4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXS3ChJi/E3vIIVZGM5YMvUiMhp9hzRzHL/jCltCY1LDNc9A2F3LIzrE7xSeTOG6HHRhfGdIoo0Dq04lo+6YKvT@lists.infradead.org
X-Gm-Message-State: AOJu0YzLjA/eb5eaTlt2UJaYpmY3foNMr9Yx8HhaBm8mXylZq5jlEQQc
	wYBz6tmNmhuDB7wXxGxGsuhe3++A2k+9qvlRI6U/wnV1inLAglK9O7SEjE5ZitcA0rWHRUtFazu
	Zt9WTYC+X/QD4eGDbuOOeWwWOKjHG2P42PtH2dQ==
X-Gm-Gg: ASbGncsUmVmV6tnPUC8fCZ4w3vz/6vRc6uOgMXmVijigD2IYTNEm1nwGB8EaSY0df+z
	8WghIMpPRbNtAhxqzPbW6YhjY8Zswz6szMrZoTYlshn79hv2MSQ==
X-Google-Smtp-Source: AGHT+IG8x91swQ1/TCs2bNY81sSJWW2iCRubETASwyNlneW1MiOKNQOm+h1c21oPbkA4UckTqWfjL3th8Is1ivCtTMo=
X-Received: by 2002:ac2:59dd:0:b0:542:8cb0:88a8 with SMTP id
 2adb3069b0e04-5439c285ec4mr5563483e87.52.1737549653306; Wed, 22 Jan 2025
 04:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20250115211627.193961-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211627.193961-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jan 2025 13:40:42 +0100
X-Gm-Features: AbW1kvawWKhH0X1YIWMRn8P4MqzemM3g4CZwqQRFd_gIgX8aGMtS5oZnnXo-N6g
Message-ID: <CACRpkdYTXk+U5n2qjBiaWmRPNAbeTR_CO1N+7-7XqjvSU57Byw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: st: ste-nomadik: Align GPIO hog name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044055_904900_A910DAFC 
X-CRM114-Status: UNSURE (   9.12  )
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

On Wed, Jan 15, 2025 at 10:16=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
>
>   ste-nomadik-s8815.dtb: mmcsd-gpio: $nodename:0: 'mmcsd-gpio' does not m=
atch '^.+-hog(-[0-9]+)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

