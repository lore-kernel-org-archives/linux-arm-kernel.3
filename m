Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2ABC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=; b=ftje4sDTGjPTUueEDFMbwGC+zX
	oUwK4NuisH6sesxhJsFzTeHBz+KY9+CO9U2ENNzCoKM4pv5p1yhHOgJYuUitkXTS824S5/FOAddQ4
	p6q6VwdfraafVPFzSeTHTEM8wNMaYkjWafNsL/Yj4pa22vSNUBLPaoAzKLX/LtLKBiDvRABRZgrvv
	EcOGdi9QQGX+XAlrz7HG87eDxTWbh8lwmu3FVjbLgdbC86uB/R0ZyWKcPHkUqYQGb+cJD6k8RSSnz
	vJoKK658Tpuc8mp/93xsuEwQX+GSXowUjAirFJn2026IaST1rHNzzUpZFCp5Ibe2l3wbC+EWnCPxL
	RtNJhlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuVx-0000000AYvI-49Zw;
	Wed, 18 Jun 2025 15:15:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsiL-0000000AH2z-19lD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:20:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553b60de463so5347800e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750252827; x=1750857627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=zkO+wtLdW69l93aJ7y6PzqsZAut+BAyNpuoEYKW3ICnnTJS8Op7KE2TpJ81/1MPns0
         j1+TlLQjJDhZxsD57aihWuOjWZkkVHwO1D5li1AkPzRkE4MhTq2ePZvb583V/OBZmgDS
         NeBR4OViB97eRwDCiKY8JLMQngfEUwp5jw15ko2KPtQHtdNfc6CyWJ79a8hz/VSPco+H
         Y5miWa8Rpafwwk3Ps+f6Fzu7ee5Mdnd+fOvBEvARy6L9wZa5bmS/zzPBPQ+PMdG2fiqm
         lP2b2EbiZVsecNHIgoDlkw08fWD9LwV+PuvuIYYrVnJKYv/Hmyq1q/CD1FY6/+U4vl4t
         tDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252827; x=1750857627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=GM75v73QBhRRPKT8375Iy8+NbVL2s2cOHwQVf3vRq8ifpy/d5ZyeVxtsiz6A1FNAAT
         JPPfgw3Ehr6Hj8QbS7MFQCDZ/1UFoU3g5Vr6PD5SBryF3G3G2WY9FM5WuDcDDy+CyEVg
         PBgqTvZP2dYvlWQ4d/XNPFfRbOPnu3vJvOsGP++0F8RU9CnrTc2DoyCSLDcI4ykWuRY8
         xoNENwtr0tSZrmbW9f2+K1UrMvOTUT7dT0IA70XqBKTqmWpNoLFOt1KSIsClkapeopmi
         kGKcm2QA36fT5d8XFloR2ZZNIAo0EA/gkMEiCgL7gty2IG2HxycFDK1fc1UxjNbIOlRR
         0i4g==
X-Forwarded-Encrypted: i=1; AJvYcCXQKvfffHKQRTEDxwGEmtfLDo5vBF9wsag18rDO/Gv7J/NkEbqHLwPDhrhapsURCtZCMeCyREXzoqTha64M6bjY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ldr6NwldX7FUOcOBk9QaCj1/9AzGfGg6g1gzEnwA8Sp9Swu0
	XT4GrRdk2WbJiS9jOpBLA9KSz4F9hlCmDhtAontwyNyNSAt5amce9esneEOK3IfB8f5ONjmvb/r
	JMF+XBSHuI5g6d7sgl0zhKsiQa7nWiRao4OVyGwhhHg==
X-Gm-Gg: ASbGncuysZVXGVyJJZi9E/tj8GIE/WYKGD9qAV4FMh/2ub6kTvDjsQ08zucc+7W5L3p
	dZedWmS6t/YUG+HVqI+iZ8L+rUd3yXCugJdB9BINZxG8577R1sGlJSo565Xsv9QMWAxTco15GoD
	qJFzQkdTB8YoVF64nd4aSj6gyDePjTS1JX3UDcZqV14d90jlLnbxX4dX305j1NzAdmnrH3p6rc8
	g==
X-Google-Smtp-Source: AGHT+IEnYD8c9DRu+sgeZ4/zra50A8zvr1u0tIjWrrYY7aXbyZM2E14drwd7rS61sdCTAqyts6sNZw5w8k+gQFEYycQ=
X-Received: by 2002:a05:6512:b2a:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-553b6f2106cmr5254173e87.32.1750252827241; Wed, 18 Jun 2025
 06:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250618124319.19220-1-kabel@kernel.org>
In-Reply-To: <20250618124319.19220-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:20:15 +0200
X-Gm-Features: AX0GCFvPKxznhkvAPEwnvWIVZ6FbwqZ_QWUKHDjPShs0JKLfijHXyi7OUR-B7c8
Message-ID: <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_062029_312535_57E5B8E4 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, Jun 18, 2025 at 2:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---

What's going on with this patch? I sent it a few days ago, now you
just resent it without changes. Who should pick it up?

Bart

