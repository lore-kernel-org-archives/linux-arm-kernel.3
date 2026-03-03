Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889A5E67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 05:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX0VLINMz6A6FQc/U8nBqp0XlDLDKfuR77NNnYDj7+w=; b=a55lZzHOQLT/+U3w6OJd15xxv4
	uZdSmv2CNMhaHHn8rfYCUl6374OD5vBJcsjmZFyxutunFaq+zoVBs2CgfT96D+yeKi8ptYgwIVCI3
	VQNs+v97s83zqnOh6qvd2TUp5ZwL3Uy68haVBKOsvGbJ/85gmMU9ULkPX2raKZ152fnU/AZfxiaMr
	8d5uu2G5WV1b5LkXDnpcgFPsNr1bvo4GH8njWnkOZ+mk7E07AxeqtllxIyTFqyjcLI5i3bZ2Zs2Cw
	EsF+So3k+fncaAkIOR2MAhqIBU+F1M1QrxmnYyEXxNY+ZjcSdCYaSOjEspVjffKVfiBEZLOXjd2Oc
	QHiQIO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIlE-0000000EZr2-29VX;
	Tue, 03 Mar 2026 05:57:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIlC-0000000EZqH-3JWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 05:57:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so3801502f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 21:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772517453; cv=none;
        d=google.com; s=arc-20240605;
        b=h80IK9CSt0DJYnPc/S/K2yapnReBDoJkypmjoennG2ZPa6s4uwiC8ZQ6ztZNRvX2+x
         52/7HzWKZKHmPZxy8axu49921iusc3iZpGipUrBSr+HJ60HZbzaA4oeQofhIGt7NJoMW
         fOInPjzDpnK52bZbOS5h7aukg6idMbTGmcN/IGXuZeo3Zhi9SvpJJu5MgsnDgrVEDiZi
         9XUJvkInum/tnoD4176x0iRlwo8JobkyxYG7N17NTVr1UkDdc7tV6IsjS1w17x4fDk6R
         9DvQxGZ948n0/Ry8utIZkKgZN2Tkd4cRnphl1IG2Slahpm046MX6kFDROPn+ZBClMIRZ
         SCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pX0VLINMz6A6FQc/U8nBqp0XlDLDKfuR77NNnYDj7+w=;
        fh=LJD5Vg901LrRfTPHLeZ1/FBOXdvJ9mECtkPs4c/5rXQ=;
        b=FRKhYwY3ZefaQqUdu5T8mUrHBwJicUWrE3IMYITy156msVKE9l52Ha2nX6tj+XR8S+
         f14x66CkxuUXy0juecruAh5BOQD2RHIIpRGT8perkpDiT2u+6LW5LWDD5kL8o4IAs3wX
         CYI1gv9wwzGngEhMG4k6/0lo7qpfBpsDjG1yosOmZewoPpTDCTl8i63CHes+29I/QcC5
         +2UVBcUMZmpKhKXPhZIFdpfXq0VDfHvy2F26mZp46xNqotQofe7h1sAqb5z32i+UdhPg
         duW/RNFqb9tzuj3jmC39ZnQlGIaHM4gAI+g4U9jN8OItKgY5PTsJr6pnjO2cK7N5I1zY
         SHQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772517453; x=1773122253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX0VLINMz6A6FQc/U8nBqp0XlDLDKfuR77NNnYDj7+w=;
        b=gIEyySI3qgL+LA2XM6Kb41DGddU31JBf8zL3THpuQTYZ6T7JAk3vLjmi8aotyA8z7K
         G8sw0eTX9DSEY5aGLfQdJ8gr9Dz9ZA21hnjbwU4WUlY+xN1eMuQGc/+m6rikHHV4mQqO
         pH9WSWB9oN1R7mb3/H0Igo6rfUPb+tU0Q+PIgesRWi2KIHFY1O4RqMyVC2VBl5MAcbjG
         L+Lgm+9bZXX6XQO91HDQm2ue5X3gw2VhdjfqdMS/gy8P6JZQZOjK7Bneynjxk81yeJhz
         i1bGd0oIAgPem2MWjg/sVpKaha51qEvw9D6oZJmbNWNyrXZy7XB54C7pU1UdUx4PnQc5
         1uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517453; x=1773122253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pX0VLINMz6A6FQc/U8nBqp0XlDLDKfuR77NNnYDj7+w=;
        b=gPqOYh3g5/qOAlgLUPv+SxIjIOKVLFmgXUJtWd3iNNVCozDAx8gN40zwrtzkGzjz8c
         05+PlVkfHQOGKOsQFEhqPnnjPPLVSDSUjaNe4Vh/4hs8L5WwAFCXGnJJ88mldoUsaX8y
         x84e+9yy5NuVODwh+gQh6JOMGYbk8YBeTbIRAuncxXCOKMDKbNl7gH7ue9aHKXqsC9l8
         MnipM6lSzNyskqIZ+N6VFdSe5fBkcWdMTSYg71mBEJXzLDwScEkgtIKmA5ii15q6qqGy
         t6owkEqSHCkjf8N/VDPrS/TySlgURgzhiBc9pPjj5I5lPhbvVms0lRVWo7Y7AwLaAuS0
         3VGg==
X-Forwarded-Encrypted: i=1; AJvYcCUqyr1/r+3mI37mbgMS6BnOW3eSQYdPFfizHz5SHQcAkVfmqgraKruoikfDz3ZuPhOGhmF2PtvHeMzB9PogQVsF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt3avdUoXB9Wtzcn74S2MSjS2tutyooUzjnzcnxzddwlIf6cNC
	QJpAWJAyTtMVaFDO4gKeKBJkoYtnxYodHXbgPQaGwUAtMaVl3i2JIxwxf71qRLP19jmW4t19vln
	SDDZzsdM27RGEXLakIRXXCuWiOJzolwE=
X-Gm-Gg: ATEYQzzNz26rcw9Uqp/6uQ6kqsFaks2wjsP186SxjL2RwKegIoSgk9sl9t3aK1evYFK
	pOpPWKoH9WnYM3JblwcyGrmOwbEOrzN/8f0CbDC+cVkFY/fJmW+RDHkv1l8tSmT38llYEe0Jt/8
	9it+IboZG1ddD7SI7t3oSmWxTH4hD9MfmfGZKeQb/bX/upF/ATuqPhAnuS7qywCREyTtRjacSVa
	DHKFrkxVIq8AiLgqXD9DC+OV49aT6yCLEzcmVKc1C/zJu9J3imsNJBIkR3PJVEvjfKhdCjODtz2
	LF3s2OwQAE1zwnhAmQPt01+kvi17Pvdo03Hrjs8=
X-Received: by 2002:a05:6000:2001:b0:439:b4c9:9061 with SMTP id
 ffacd0b85a97d-439b4c99198mr13341273f8f.5.1772517452685; Mon, 02 Mar 2026
 21:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
In-Reply-To: <20260228205418.2944620-3-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Mon, 2 Mar 2026 23:57:21 -0600
X-Gm-Features: AaiRm52w2RMmTSSLdZHxtEjWYjj6N6MGUqWIzppOn89hLbAKT7zZ6KSUnyUL9Z4
Message-ID: <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_215734_842802_4C6580B1 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Dennis,

Some curiosities below,

On Sat, Feb 28, 2026 at 2:54=E2=80=AFPM <dennis@ausil.us> wrote:
<snip>
> +
> +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> +       /delete-node/ pwm-leds;
<snip>
> +
> +       gpio-leds {
> +               compatible =3D "gpio-leds";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&leds_rgb>;
> +
> +               blue-led {
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C6
is muxed with PWM15_IR_M2
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +
> +               green-led {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_ACTIVITY;
> +                       gpios =3D <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C2
is muxed with PWM3_IR_M2.
> +                       linux,default-trigger =3D "mmc0";
> +               };
> +       };

Jimmy

