Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403DBC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=; b=2Bee47gCcOMjL5FApjsHLdDKBm
	W/zdXpMPcY3CWT1y16NsmezvOUGZDUt2SG2HbqUd90Ezsdenk/Yyok+UCY1xJsoM6oV4JeUEIYabG
	WTEkG48eozOau5Hji1QJI6CWVJFmC5CHQlTH9NIPMzKr2SFwQ4NYulrUfxxL4H34pz8POxNvqTeKu
	3MpxZmIoLVgPuShd5QKaUNIAf5jOMQJu93BdTfWh1WzAuIE/jHlPDdtJzHcJmCMrZ7EIz3ThVHg2S
	7SUBNUqBaWhayJ00bu25B1o+nHL91Hn92slkyNwzgRJ1jjYpedUIk6F7KO02J7Cthvj1skDSTfJVr
	w/PxFqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MHK-00000008HIo-310g;
	Wed, 23 Sep 2026 12:40:50 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MHH-00000008HHM-0zqb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:40:49 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c294716dbf3so53489566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790167245; cv=none;
        d=google.com; s=arc-20260327;
        b=hEay0dytX78CZWit+Ogx1/xGOl7yYIXPvYvu7a/NKnr7Sg6yhgK+A4uNhM7whlpUXf
         mlyNMxdysNtWjQHjIW3QTXATMX11dfG6i45W2WOnaZrV6BQaawEKact1JKs7q4nGgCps
         IJsB9/fCh4WRmLKL7zl7DMe/+RA+asPlGgiSokzSMm6Y8jTHnrqkmKJgIcQz+kkMjUFo
         8Vs3bqKNpGDT3u2+HI2IwuHVaKIO80iD3UQS8cfSQNPlSK0DCtP62xuvGu7AP0xSuOet
         44mv3ejba6RTWTnSHZ1Hp80ZCwO1/SX+s4z40n+YoymYu9mVgbuthI628uoTyr6NPOr+
         BW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        fh=V72JtWgFtwoYQG4g2rsJCKePq/aBQFPJpcfJPbEtH/c=;
        b=oiaKF7fI/Bu8Nn5N3chRWcRXwwAekDe5hV8v27Pmmxd11txPFjdN4RbZfwqUDcmb9D
         G1FUu7k1cHFrobzXJNhp3z2ooM8zHqvN22kZTj0Q+Wfj+VEfiKT5eM4zDhn9Kh0g+pio
         yMl04xtdjDmjTNT29nLogKEYHC3JFx9300iu5ijghSvYejHOFusIzhY0qom4MfXcvcbt
         Eylx82bKp8QQrTcSEmNflgGxKZnyFOwlhXqCJirXKzTMfW8gvoIsGWwtzzkKjAfyOLRC
         kSU0DzcEmmKQKQuj3LmPhyqmNKakwLi5bGwrFLoiPjKzBg9rvTgC2xU4l3x+e9sU7SJH
         f2YQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167245; x=1790772045; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=TbXwFkiryluEvIfUM1PvVRhthkcjJWHsmVFoMRTVWnIXg9XQ1sWpdkxhm7TNhFHoOE
         yxzL2WOXuzR8aINrapR/7sTBJrGC0xv7xAjuSbUw3v0OEJpNDcQNcUDGc29J8Aa715cx
         xXv5v1DZGdYN50pgqpyEYUNTTrdax+NCwGBNpH+bTxORJsu5Ij6VDGglS6W0YMYrpE0b
         swKulj3paZ70T2l+lo+dvTuM2rAOUGvFl4vo14j6lDEHkfNu+ZS5KM4aQpYqP1yi2Vxi
         DgrEP48lpS+/nMnWzDASSpmciqisXT75AYU11lTL+H8c4SmEd8YIqzOhmiExQNSxB03e
         Brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167245; x=1790772045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=PjMPX8yp//A8MF+bHVXCbRN1msyIDYVGEC56q8lFsdvme76CU21s/4l7Lq2dadtcCy
         rKIsYFsBT3j+8QkxOMyL74ydgtoXJih/6Dpbq1kWUx3M8bfwgE0Ay8n9Ml8bKarC2Mt9
         AOK6KzaLjGVDIJM+LrMZQ57DWLe4Ty/kjYXvdLdIMIKTGRZ9sd0BF4r8ImYuBno7Yvpz
         xgOLOa7/1ahTdPJUKzV13wo00bj79tz9Lr2Usia1F9v9d/a4GDOzMGeTORSUmj4k/e2r
         0/TKTLRjeukezzGrE8+dNUqyhFhfW6IsRxmzc0/KE5gvAJWZEsijJ/ogGAEO185IXdcw
         5xDw==
X-Forwarded-Encrypted: i=1; AKwUvBw9QUiKezbQ341yAc2YiwdZXPAxqO26bpRF2eoEHdeJOpxnQBfZuVtKqU2gRBj1LJ5RdFd3azKsc1Z5AbLcM1tj@lists.infradead.org
X-Gm-Message-State: AFuF++mUvQgS6UiiIr7A9wMdd5EXk13txIk7Pmcr8odgFIGc7TcWRwqE
	kYuBwmuUn2KjsamZR7qG5CNfQ0EIqRXdDEX8jdX96Z67GhQ1QfWfW+mmxprw3ocLg4jOOq32/5T
	j9h4X/satiMFprMUVXj5OV2JCvz9GxkA=
X-Gm-Gg: AYBFou3wbyDLSmBPiT/dKIiH2Wyqpwe1lXk1FXARryttlyobArXkQO8Y1sAeS8UPye8
	X6OQSiLW85P1mNzf0owvnefvR8NJBcTqvoNJTzPwC2roOVq4Ira8pLyVI2gYT1g+IU3SvXRP5/a
	BWP70POb/lu8rcL9lCnMn/GHIfjYNCJBckcvBWI2XhWnX8fI9eST05ugAs1X6jL74h+519QuCWj
	YTsVYPeNbSroN7qgF+njb/hzisNPIjFRNJ82VlTMlpyuEN0xZNGLN9zRkWximsE+aoJ78XBHjxJ
	vZBxFOXrJldYpDsPzFIvhbLlctzVEDGrKauPMT0w4ociiKqO9T9G9dMNiQ==
X-Received: by 2002:a17:907:d91:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c2aadcf4484mr194861466b.3.1790167245181; Wed, 23 Sep 2026
 05:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922195006.79890f24@kernel.org>
In-Reply-To: <20260922195006.79890f24@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:40:33 +0800
X-Gm-Features: AclHuK-io9PS85iIjo2RRKD7nlxq4FY18LSW8xzP9gnGJLLZJesN4MppzV2qPUE
Message-ID: <CALj3r0hH6m7jUEweKMWGmCW9aOxShaqsV0E+z4ztBhXbJ+378w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_054047_321867_51468641 
X-CRM114-Status: GOOD (  12.10  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Please slow down with the reposts.
> Not more than 2 a week, and please wait for the AI review to finish
> and be published before you repost.

Understood, sorry for the noise. I'll keep reposts within the limit and
wait for the AI review to be published before reposting from now on.

Coia

