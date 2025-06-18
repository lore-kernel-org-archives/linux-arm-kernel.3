Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6AC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=; b=OyaluYejvNwXf9zBd2Pe8C7PkT
	TewC+hEpVU+iYpABAF+ldXZz8Wum6DZEqB309nWl6f+7zXPxRUYZhVGLiZPb+gO4jcg6Tk0fepcRx
	G1fxHBWDGqwiZUYK7/Fl97y+ILjknjfaZEQTf1/rwYAp3NGzuglh/6yj0PLZUsA9rNZjc+NonfWwo
	QH8pAAMRFJuDzDI/BTBJt1n5cHJKkldu2ebilyAF0f0k7W1xGq1dn6+mkd042gqzWB5z5l2C1Vioh
	MIUVLEHidYeTBR7TQFxg5WBO0ZWN1efiHV0qfKuK1YYhn+D0KCF5s1l83e7pCOOJ6h8wa7wGGcArQ
	YsiTP8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRulP-0000000Abi4-3XNe;
	Wed, 18 Jun 2025 15:31:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtQ-0000000A7fg-3hJC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=; b=akTR5l3rPnX5biQ4gRFFdqUg63
	88Dvp5LHZVhnmTYejKXJDqEVITrIjKVeQWpUPMbj/7lngniDJc9hSqdAhc0KpDXzuBc4V+xfeKerX
	NlzmgYeZm1p7x3lpLNaQu1HMgQk0iyTgVhHU/tKHci3Y6guWexG7/YKQqbAo5DQenk6tZC/uiwGIX
	1s/Qf4ugD0aMQ02uVgyzd/t2sN8NSXUFy8LFD53ZP6qdfkd55BdkwEfuCfxECCs+J0a/Z94cYCWSA
	kAkC8pWfHnYeGSMKNgUkmQepB9fTGeMQJ10cOV+f8kzsO3pcZ4SxLav7J2+r0+5E7MLF5FsgecpMM
	nYnJK+1g==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtN-000000041zk-405E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:27:52 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so4705811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249666; x=1750854466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=xUTA9i7lMZAPnxkGdPxmhZV8mzNrsnRaRHERsbNsoTVp0ntP9MV9eUfkBRKjycDMKh
         j9VV1EM8uNpXh3uey/9VIbG8xBtYBrFQK2hGDUFiHIj0HIXIzfpWwU28vnGyF8xI0hGR
         suiYVIQkOIcSeav9B9JWvZLor3vkdXETTKsZTrbd1sX/1AxxpJ8Vgv100A2P/WqZ5gsq
         eraKUXprFeqtGgefbZPu4f6nrriV8ZAy8UcWV9Aun2/fwXqgARtH21TlyQy07y7QyaPA
         0s/5i5KDkG2xFWJIx2bQqktH3M5ggMmNbpf+uKas+Y/WetlWNG6C/7V7vNYIsWf8T5Mf
         3yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249666; x=1750854466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=cWPcRFggtS+ITRkzwfXTY4GXqd0P7qT2VH9I/1thL7QtcqSajWJ5H75dl6NkwqTeTM
         UkQpT2ZqyPAupH86mKP/7GtJoLXfPCMZrslW8Tome/pwhWwsOb6d9pTfUeEfF/71PVQe
         CuEpsHToeLdXBAbqbBia192vFNbzKaJbRMTt3htvW871edBz2+5n3kuYVi0M14onKYUI
         6KBJ4Qrl9Qg+zU+UBL5Na+3QrRgqMerPZupse9lhfveI2PvVSAnuqX0QMbc2gpC/XMsg
         Az+GgxZv522+BvqNCPCoywx41GeK0B9ztAd75bcjil4FzylTPpbabJhd9x0F/aZhXF2R
         AGAA==
X-Forwarded-Encrypted: i=1; AJvYcCWIKo9hZRzaIjkdYwgXgFzfmy5OEEaMtaYTPpTqjxSIGytKN5xd4bcYlCXGSmAfSr2cdN3+VRHYu1fB9jRM5PRk@lists.infradead.org
X-Gm-Message-State: AOJu0YyBF1XqePBTAzhc7NMBDaZ7KsrQnNoQs8MO8fmXAZz31DjAxmNT
	Gb+XaBx1CDYhw4xcjLEm6iDGERxxyx36bERs7MEtCYNxZ7QwAR9mF2lFmxMhRlFx3TBkZ1MLJtk
	SLiNs1SOCM1ZySBdVKvSj23rFAhUoirfbeprWO56S1A==
X-Gm-Gg: ASbGncvj66Zs1zDNGvv8pburZ8PQL1HIqC7aebiSFPcTzpQoyVtKf1AveoxmYnjW9VZ
	6fauk/XRnlMoohNac2YaWjKT+FxkWHmjw+YIH3fU9Dw4JwfxAvA9cSFuSbCsGDFUf2ZAdpeDjJI
	eCvTEkQs/MUyktYARWUaDqV0Zlcyqd5J8dgjPfzJlzUDY=
X-Google-Smtp-Source: AGHT+IEO41Nyhls6z+tYoLHnOV+DOmxEURxkPhjx4goE9pZdzx8ZYG8pWoqgfu9hnvxH3hdYq4NmpJCLdC/k/NenFbc=
X-Received: by 2002:a05:651c:169c:b0:32b:4441:e1a6 with SMTP id
 38308e7fff4ca-32b7cece005mr6055841fa.1.1750249666214; Wed, 18 Jun 2025
 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:32 +0200
X-Gm-Features: AX0GCFudNOYMyXLJ7vMaeO2dSvhoaQWQJroQG17p-nXTR5Iec4T0QKmapC2D9eA
Message-ID: <CACRpkdYJ9O_y9TGTOw8mzf1=LvaxYCE463MPf12YaXUQCKaLzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132750_217138_211FA164 
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

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

