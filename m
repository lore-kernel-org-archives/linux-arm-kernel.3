Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222F31061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=; b=FLYT3JbXpXmabLturJzTU2kslt
	1KZSQoJBlr3AMgRjoTVM5wsGuneMIAlcMSPRo2TRgC996GqdbMScf9AYc7Qauh0Lg26+mp2KJX3ly
	4pLTs5AoIzYy1YUk9r/KRtETj1e6wnA74xsDhvZTqr8uUGFPBefA9sSN2fTQOeoM0XUam+qUt9u5y
	rn8epzOskHXmZZu9QCtgyWrdkrxV0tfOXxOvoBQKRP+w5y1W+earGwZ0kfutz+Tcx30xbzjNR7K/K
	KH3JI22RWYi7Z9w6Am49Koq9V3gqZ8nEXHA9XmbttPQclQ5139IoCzv5Y9c0dlVFS+PHQEm50Pn9+
	pFKHCYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KZZ-0000000BwCM-0war;
	Mon, 30 Mar 2026 21:55:01 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KZX-0000000BwB6-3MCT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:55:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso1912350a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907699; cv=none;
        d=google.com; s=arc-20240605;
        b=YrEbd7aGTbjALZ5mVwbsPyTtkBjUaI55uUqHlVT++BC7oOdxKQNXYJ0Y0ea8vb06KJ
         v+V6fNKAOLSyO5Xai2teDLnfN+BIgE4lruAMl6uHpV+gXwIIHNd7aC4G4tlHw6om5fc4
         82a/tzX48NJF0nc0AIVHcHUZjsmuw1pmYP9vJItFgl8uHsdKNNS1/77LBWZft+5ayAs2
         mfcBQUseQZMwHKzEQxQzDAWn7cWpHtqgBFFVGTQpiOckcX43Rr0kghtTMLkG94g62rvk
         Jn6dYmTy1mHZhCJObSnNDT6UqTVgNkdSicMxYjs/IgvtyY/nelGmizVUgiwkUgnm60Db
         HTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        fh=aO3V4CaesXk/qFyRuiF9eiW4bWmMTsVGRmu36CfEBR4=;
        b=juPr2Z9oy3gzph1MDD+zql2320fyjhqGZ3zODQo3N30ACVSOm5i/i5O5ZydJeKldvk
         JKI25zk3HVjlNYIl9lAcbqv7vmMhDAFqDLfuJJGJYMetklGThHJg9oTzpbMc0/lLKwKj
         uRyf//JgYhjB/eSIKlWEJiIjoocopasEaFWCRX7BtiwJZ18zDiKeekqRnjxcmjGsvvhj
         ce8kXlFmt0ORex5Zi5z9XYlmqM2Dc6nRtEP3zlCcvn7GziaReX27JVtxbGwctJyoe/LD
         EBFIbWvwB4rDNdkOCgYYdPrF3VefCD/OiHW3hWTcr8DACmP0SN98VMp2TG1xidYDkW+D
         onLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907699; x=1775512499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        b=El7/c1G8YpVwWbKgVj4rm/+p5A8y+mx1AUFocOYqGthqzJwxef+kFFyznCyJjeJppO
         LsSY8RiswFLflhz/wTJYQkHVOqNo4gjcJe3nbBGcx6sRjCpv2+Y7mZ3Jko1bnYdRBYZc
         DkVX0spL6MhO/rP7IoZAtwjJI4x5PkM6odK7RG/SJNxoNtdOewXg4Mx2u6kPloe/VbMg
         eHsKsf8tz0xnn46Fx6c4p9t64sbB8pb0V5FpqX5oqkWJ7IyH+T0Wy547Bsf7lb0vmYsN
         Wz7tD13Kw7z64q0yyS68Zw5MpCWa5P3D0BgPPJDrmogHNBYh0J7MSUqvGZAua7Iu4lbQ
         VCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907699; x=1775512499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        b=gOlVDcEg9Iv07J/wTMsKbVRMwE59PrtJ84asjY2wKILOrYZrGw1TA4WbDg5MoBFhxQ
         Lz1lO8ed2Z/jxZTY2Yp7fXCmwB+SIXdgbfsXUADmZv3Wh4ufEPaUo5qvxumPLuSd1Lbz
         jGMFJVou1O+NNUV4VB/VvEF2fj0AAn4PQi8g67EIW273lFAg7WVwKKSvH5xOd4AVMrAK
         eAptDLvFxy/K+7FYilkOIK3vXhLBpjn8givWdE2djDmuptAfUPpYYgzz9joGtIa0/se7
         LUSHibDWxMKhvU7uQlSAGRp3j/ls9PHaq8tfJDrh1G7hn3EGi2GvBeJe8sxzCtuhV0Ii
         ucvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9b2rcGgsQ65hkXJU2AIHIyVnLgNeFV3VvMjukmg2wVwToXhLW62xOEFkb0ODMdw2Xdlo6tpLt7UTzflF1ZW4a@lists.infradead.org
X-Gm-Message-State: AOJu0YyhKsYYSC2OsQceig/78gFRermc4wSCf8U8aY6xvcOX14y9ApQI
	1avCB0hx4lIvcDkM7CLoaVpIEZAWwt64vnbyxIbLTcau5Cu3ECXTyF4OrsaAVL1VxhatF7yczJb
	+2U6m2mjtmu0jf/YJBMKA7TH48vHfSyI=
X-Gm-Gg: ATEYQzyH2wPtVnVq5pS+YrwTv+N0I6VFrABYJPHStQAG4lPFLfZG4PayO/38uQHUOj7
	zmLIsoMJ9YIyhcg4bdDJQdAsdQmlp4Y4GNut25tKGAuGWeWbpjAzczbgW/ei3mkffulHi5ql7fV
	JDBk5VvNkNKPHGRJsw18nCwGXmj5DdlpLGybx7L5Q/CSvEmLbAPafBcokP4S0vSwcoI5m6Vc+PF
	/BqbDv+d7TeVM2Oy8JiX0WHwO3bws5Jhew9dZkd+IqN2X5Wsi6PYqkAttQsXnXgPj5W0DNyYOXF
	N8XPnPFjaqS6owjmlPu9zlhGSJj4FMjk5uBldChhtUvzqJE/1zU=
X-Received: by 2002:a17:903:98d:b0:2b0:60f1:de58 with SMTP id
 d9443c01a7336-2b0cdcfae43mr147607145ad.45.1774907698891; Mon, 30 Mar 2026
 14:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:54:47 +0200
X-Gm-Features: AQROBzC2-9WP_iYu993gr4kZhNfXgWBsXWt6220pBOvgiFbgiwhI3kcyG0LtR-E
Message-ID: <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145459_837961_14870511 
X-CRM114-Status: GOOD (  14.15  )
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

Hi Xianwei Zhao,

thanks for your contribution!

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add bindings and driver support Amlogic S7/S7D/S6 SoCs.
There is an old report that got lost, stating that the current
pwm-meson driver has an off-by-one error with the hi and lo fields:
[0]
Since you are working on bringing up a new platform: is this something
you can verify in your lab?
To be clear: I'm not expecting you to work on this ad-hoc or bring a
patch into this series. However, it would be great if you could verify
if the findings from [0] are correct and send an updated patch in
future.

Thank you and best regards
Martin


[0] https://lore.kernel.org/all/20241225105639.1787237-3-gnstark@salutedevi=
ces.com/

