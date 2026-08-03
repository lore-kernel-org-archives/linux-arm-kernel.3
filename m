Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FCC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=; b=R6r0/jcb03Bn8bFWCZ3vJ3qXyl
	1BcxYORw4zPn9W7KZQ+F68QeXJzo6IcKTN6sFKTdUBswQPmF0fGGGOltEqQJGVcoBFi6yFqoKD+nK
	MjbRfiNCmDg/I+HJcMfWXBZXCqKBMmtQYcsR4D+v4XRLnaKVi4AnsPtbKHdLTs0nZgiBJt3XPuckU
	bhV6AqDWkrhmjf/F6WYCP7laCcwEdHgH2HSj8RVmQei+wlJWmH7m4xikmekfl8OTNddBaywp3U9aK
	zY/BnixT13x5q/uuxPdsU5ZRyVva6Ck8IuIIFRZqv8vt7L+keVrLCn2VL0jjd01p5p6LyuLIFkEl0
	Ii25p8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqn0X-0000000GW7N-1Ef5;
	Mon, 03 Aug 2026 07:22:45 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqn0U-0000000GW6T-19DD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:22:43 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-74ad03fa605so1747484137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785741761; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7BsRZR9lqV3fFtmCXXzJzgfnfhtebU5gIsEt3dEHqN7HyAgh8V2duG6H9edTV8DeY
         u7S+dDWw2LYL8OH18enryrOmZl21BibNRPGRTWX9+LR1LC0XxgGnggBWFtuY4qgHU+jL
         Xq4B2N0ZA64Ycz05WPop1LaNzFigu6M4vV7k8/P69iD/K2IksTk6UDw/0B+MKy+SZqyE
         Y3FoWISfr/HnNzwi1CR17LI5QTlMv8+pl5x1mTxm88gCxJ2sO3z75yOMGgzrcBbf7MvO
         wqxQZS5gLPc5oLBULvnldBeQOxOkgTrYKNBmGW/JllbmWk/y/3hbbUZyS6Oih56h9L+w
         jpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        fh=NzNmtBJZE5AHiapMaAngy8VNLehe+CHy58his8HzPoc=;
        b=eAaJbdGphsKsDb5FHRM79BsvxU3gDplMZYI48JQTgC5NFS5MveOC3+e/lrI6jn/R2O
         FjYQ+BMai7Y/xdCy/Rc4vHGXo+g3WM6Act3+KR3h2vZybE38LGQmnHVArn+W/EWFqti6
         W0R1+QenyQQ3d9jZVptu3mnTP6+bbgfqL+L9SJgpAYZw2AxV9QU0DtKMkDcRC4xDbNVw
         pH10tSej6bNqOKyVl2AtEGQPvdOkfiX+bBJh3DBvFsAmOjOI8/63vxotV21Xl9f7a1E2
         33kPOe6rbMOUU+O+YzwuFS81+kKfE3uOP7vC26lgUp3JH5f4H37vf6Q2TKQhc4cBXehB
         cLhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785741761; x=1786346561; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=hkiHYJdDVzGjaqFwjkd/vbfHl6OQSs5HZb0TgaH1DlOUOwPn1onnN0RT0VYACYJaBY
         FWF8Z0sZSsDa8lLTjSK++Wu4aKA13vJLjpPdsv216ho9DBuwNNTCUZUraSU0Epv95X69
         TZTKNGsXlckdqpml+vxM4eIEv2OBFxPUQgPIkdmQnwCfMyx8odJVrwbXPRSY2PzC9N82
         B0VnCzKIEeeSy1Ntdd6HeFncwOYs0uB0sEGsLISt4rS5Pp21XTvlz+aNU1MoTEG9u+3+
         trzc9A8Cfl3lil5jm3/kAEcRAzdOlLIU1Ago+msrN8NTmAqKXKk3k2f5DquehiPkoJWd
         kmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741761; x=1786346561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=JIlEp3Tf068kweY1OTrNIWGo+X3kvqGNs4w6ek4n5+qZCnA2uILAUgcYSPwUSWYsfQ
         3wGHalzrxnlY8rYkYfDVGwImRimKZ8kbc46cxQ8osUuTYEvcdp+8RTGGS9iJ0kTAGqGw
         1AHGk4ZfatJtxfL/iB8ys13xQhVfRKR73tXwg8hxcVW9WGA+Q4LTtJpRfSVLfRchTTXF
         4zZ9CnaFxBt+iICYdU6vsLJ+a6dnjTctf7zOsE1UqZlnaYQWpkw+D2ZdYbzp+bBALdXd
         tJbhETwi1GEeYXGybD/SPwKh2H9W/nChV8m91qO1Qtj7U81VX2pXJjIvwY7kXYXmiumW
         zI7g==
X-Forwarded-Encrypted: i=1; AHgh+RrCPwcoFH6aRh71MKhbF28NJZaH8FAfjLYkkK5Kbjkzz7r56M4nRIZvaY6Dp0kH8SDyYB4MNU5iiHQ2ORR2R+P5@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJ9Tzn9spi3cxhkxM4P8ItvudhNf+UCyi7SwQE3zUwTXbqEG6
	rrGPKXcu8JR1lUpy5Mbw4X2DA56+IMenDG048Gl31tDv89aCtjexkgD6cJhgwsM8+Qe6TbuOGUm
	fhJW0nIesq0o1oAYX4tLwB8IY0mJIuzE=
X-Gm-Gg: AR+sD13vUQBhfthmwdglKtiUQGYtCTnHD1Jy1bCt6Bg/MHNrMZ9jg+9xzwslHe97lp0
	2ll9huM7u8y4urkb50N4XtIf396RHaLD9jsPggIL/6AUaKcP/Jw2qMU7K3ea9t8Y3s68dy0fRda
	QmN5bUYVjrkAMN7IKp83Itzk4Sgy5jHub1H1pqTqrKa8c7d0fComGpp9SEReyVVfcmiTKSj/a9y
	CpeIdZpVUlFsDrnVwWjr585pEQl7OL35AR5K9Cuh27vqR3iOvfwWmCXB2UrdtKhep/wNiQiCjln
	gPC5A+W87wnRCzDvScNjqGHvn752ztJJj7YpE8hMezqQY+gRawDymdOupzfDgV9KxLi+V4kFe5G
	VR4W9SGfeQ/3dgmnDkbMAM/1L2MHsQHSpf0IocAUHWbxVP7OK42DaS0H1dp8Cl7ig6xb1FOe7C3
	Hldrn+spxS3qPj2WhDZjRa6u7zlXg8+7nWxuxy
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr6459811137.5.1785741760783; Mon, 03 Aug 2026
 00:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com> <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
In-Reply-To: <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:22:29 -0600
X-Gm-Features: AUfX_my5qRz2h8yblU9_NUKeJ1t5ekFC9VrjQ-ysDEg0WGg4G6m5XNTvE_CWbqw
Message-ID: <CADvTj4qg8Yjwr=6KVO_J+r+tEC=6TDrU3o_8YG7vuEdDA0ZpTQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_002242_330971_CFD9CF9D 
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

On Mon, Aug 3, 2026 at 1:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > Build the H616 PWM clock provider, AC200 MFD, both variant-specific
>
> Use full names. Is it Samsung H616 PWM clock controller?

It's the Allwinner H616 PWM.

>
> > EPHY control drivers and the shared link-PHY driver as modules. Enable =
the
> > netdev LED trigger as a module so DT-described PHY LEDs can use hardwar=
e
> > offload.
>
> Why? IOW, which upstream board needs all of these?

The Orange Pi Zero 2W for example would use this along with
any other boards using this copackaged x-powers ephy.

>
>
> Best regards,
> Krzysztof

