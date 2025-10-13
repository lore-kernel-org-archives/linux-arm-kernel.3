Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB14CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsvwD+Fi4syTXky3R6aiFFqllKikijYJhVHTrHzkF44=; b=BDISd8VHOJdeAM7OMt74P+LIqp
	Txtd6FzjfPOaNbloxQNS6GBgoZ/a8H/QYAR9h+IVSgYii2DqtTzuZcqx34s2qh0WA49mcpAqEChOL
	1TF97JZz6WG6l3+ZWJkwE3kBYamm3EHADOEOF5qhtzze3QKevsNZT0UOfV3JmT++QTBW4h+bsyyRC
	ewDS487ZDMUECJv7zR7eJ4fdUqnjvCMVHSIAuoBgOYZHcqLzFk9oVy0zbW4LvGr88cOhvAUcFR1cS
	sZKlT3CMqf61/ee4C1BBGFHSb4ejqmxHkJ6VafQfqgji7Vv31l9JVDwtReqh/U1AocuOBVuyitINM
	1SfM9QJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J8w-0000000DIZz-2Ky1;
	Mon, 13 Oct 2025 14:03:18 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J8t-0000000DIZ1-34H0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:03:16 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so67944956d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760364194; x=1760968994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsvwD+Fi4syTXky3R6aiFFqllKikijYJhVHTrHzkF44=;
        b=izMlENl8W63woSsXhEUcvBePix11w+Te+D63RqoxDzkI6xGVMVgMBxlO4+Czzi43RG
         OXzb+hnEEVuO6K553yCAWE6Hh5dkJpJqOSBF2UHB6PaHGvY2ZDwuDbdriNv4uxJ5B28k
         oJ63XQV8ZIO2wtqwWfxyBcIpRZCRs7qnMVOlOmT1AIXhD7MLxH6gnpXwuAGPvkqQhs2l
         FdS+sYlgPejtD6La0dtqxGz3oo+0bZJ5GM0khuN0l0Y6uMTHM85/sSueZfFSZ7BoK/z6
         xxM1U+VH9Q7Dl/bv+taPWBLsx3wJJwFjz56oBW/smQdskEAb2I96KTPRm9/jWX6zjvBV
         xlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364194; x=1760968994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsvwD+Fi4syTXky3R6aiFFqllKikijYJhVHTrHzkF44=;
        b=G2MJ1WHQszX/bHpEMNk2GvDo/537NTRPWElzNTJl4BFE4iiFn+EaFWYVIZs44hAKwc
         yBM3pymCxIKTuzeqJ9dQyQe4p0BevHsba4cmVU4X/RPpvo3Qgz9bCoOBZbojnUcSX3qv
         ZEsTKPGTQjkr/Q8hpEIiTMdveuNJxU3AJAZC75F2Kh8wPui1HlQ0YX/Z9ASvHoD7Uy2t
         8ksPKjp8sJ6Cfqz7UGq1iali3y9pdIURr8aRjrAZTGQgTsmtLpQxpgEfd8aZGbhQc1AQ
         bF++WapyU9mzdQ0vhX2pvXbXTYPG6G804s718XjzkbVhlP4IS0gN7qRfNofB+X2uKAYm
         iQmg==
X-Forwarded-Encrypted: i=1; AJvYcCVwftX1ro6tXEI2U0iMCLZzkrNaplhxvnBm9Lt/0gyviO5hwVS93lAVoF9reQzh3f/vO9Cc1MhijS8gQWXFt+P7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/u8keOi75oCGVQ/KXw/Qnj7ePgmx09OqUnj4ICghjlMGgJnt2
	h/114mTIG2PUyIR8qn+vTzG+zOGhJ4wSsuOLEF93wudHmwGoplU/C1wP1msghx5+n/ikv5Dafxs
	jVzTGJE6kHbD/Aw18o1ePiUz/wKSFG0c=
X-Gm-Gg: ASbGncs6PgQdqubBN+MBgloTCkCkelPREnJr+XEyY0WL0PqnUmVMayrw68HfAthyC/Z
	St0ZA30C7yiWXbOUdW7Z3kL81Lrdz3w8qpRjTI6uLV7PaScI16lpPAJJA1mojKw01AyLU7efnWu
	N6g+zdoTbOd07nRhT9lZRf6y5h/aaoC7VftozFiska+t3lugqvNH/KAh72rUttqX+sL6jPo//XJ
	t9YC4ETx0RNBLQNwAyH5/h2HBWLmpKkutbqDQ==
X-Google-Smtp-Source: AGHT+IFvq5k1EuebtHjH8NtC18O9Z9IQYxbVQCJ9hJgUzNYb51sqTyvtRgLwUZEROHyWBv2AmHidhVXrKQI11wj9UYk=
X-Received: by 2002:a05:6214:5018:b0:7e6:7392:f7df with SMTP id
 6a1803df08f44-87b3a784170mr279102566d6.6.1760364194107; Mon, 13 Oct 2025
 07:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAP_9mL5=GmtJF3nSbfX6gRzPc=fAMrTOfMuOLyWFwq5D4OYUFw@mail.gmail.com>
 <20251013130010.143271-1-amadeus@jmu.edu.cn>
In-Reply-To: <20251013130010.143271-1-amadeus@jmu.edu.cn>
From: Liangbin Lian <jjm2473@gmail.com>
Date: Mon, 13 Oct 2025 22:03:01 +0800
X-Gm-Features: AS18NWAoIMYqp_P27rsiPm63GVautCNYpIalpnf8xGliTTm_E7ySNqCl1fUxC1Y
Message-ID: <CAP_9mL7eaDBtVE-VUEMojG9wz34Cfa+N4Ekorj165M=_4zpPbQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_070315_791621_4A76B60F 
X-CRM114-Status: GOOD (  11.50  )
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

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2025=E5=B9=B410=E6=9C=8813=E6=97=
=A5=E5=91=A8=E4=B8=80 21:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > +&pinctrl {
> > +     gmac0 {
> > +             eth_phy0_reset_pin: eth-phy0-reset-pin {
> > +                     rockchip,pins =3D <2 RK_PD3 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> > +             };
> > +     };
>
> Leave a blank line.
>
> > +     gmac1 {
> > +             eth_phy1_reset_pin: eth-phy1-reset-pin {
> > +                     rockchip,pins =3D <2 RK_PD1 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> > +             };
> > +     };
>
> > +     gpio-leds {
> > +             status_led_pin: status-led-pin {
> > +                     rockchip,pins =3D
>
> No line break required here.
>
> > +                             <2 RK_PD7 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +     };
>
> > VBUS on usb2phy0_otg is floating, this USB port only works on
> > device (peripheral) mode.
> > phy-supply is optional, so this should be fine, right?
>
> Yes, if there is no log like this:
> supply phy not found, using dummy regulator
...

> > VBUS on usb2phy0_otg is floating, this USB port only works on
> > device (peripheral) mode.
> > phy-supply is optional, so this should be fine, right?
>
> Yes, if there is no log like this:
> supply phy not found, using dummy regulator

I have checked the log, 'supply phy not found, using dummy regulator'
not present on usb, but present on gmac.

