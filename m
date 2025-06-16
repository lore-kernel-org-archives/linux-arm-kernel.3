Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B311C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=; b=1UqB1l5i4qy+OCCD2dTF+T6v+N
	l10RApgJACKUhXt510AgKowjvwjOMsilA47Kc7DHdF3BeaO/U8kFogXRax53y9eRH5yZWv5fhFCAh
	2yejyVGNwaiFsvko2koRUVw5vDvI/cSBt+MRpODE8ncYhNn5dI2Js9oEh/Z4oy0gsSzT8GVYsPD3w
	B60ML2vRDHvKj699N7o6UVEOdTIiqxlXJScApDgm9iaEXPheJ7BUK730FjvKEe/N4sSXWH7YhcrZy
	cMkZGsl/R+Ov6KrfkAnKf8rgHHuNunLegvnkoeRJsCMkgUrds9OfwTLSLQ4eAJCz1ORCfTCzUvDP5
	5T/6Gsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaC-00000005Dwv-3Ahx;
	Mon, 16 Jun 2025 18:29:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCge-000000050Fy-3Rch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:27:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a5096158dcso4099674f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750091274; x=1750696074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=avmBJAYXUVjMU1OoUyImypCoPjwK5UvjF2T1OccAqR8BIZMNCLVyzLgiwaJCAs69fS
         JJhcuUxWq+ocw12qXTwcV6dfupINciQCpUgvYQErP8bRZo1z3WLXTyzN0r92X5aRhzUB
         9Or8IjoEI/FIb+fQNLHIIFzRpMUGLgpPiOKQ4gGXH79gNxVFWRB78vNJQMfL6x4N+PXC
         WyuY/ElQWG9fNOMOLkD0qIevT6rZZWdoycPs6EC5JkGx0p5SQHAoCYZFvcHvWDDVVSQt
         55Frjx/dUEhyijA5KkYA/aBCQFNXu2QR3t2M3qS4jVt1tQcaeuYxVrv/L+sk3tsMIvR2
         IGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091274; x=1750696074;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=XlWhDjiSx59ZLeMH85f6HA8wrM7ZBImR6CZ6ceT2IuZPfW6lu+Ew8qInAjQQit9X/q
         3oFHr+vJlpNc/xABLJQ+c8L9qAmd7gcVZPxpav09XqFmcTbMnIpcLaAvAGkb+sfynF9O
         Ji20YTlGPXY0B+6D+Q/DF+PLGssy/MgpmhZD+6G4ItstdPA6rZYiJEcPFr7Ihv28Lfhe
         s3T49C4sIpoGOGNPMD8IBHm+NE3ZMjJ3JgBszvNfS1U/DHFi3u2lHeE7dIXh7e/FLQ5b
         7CFBZks3bPjucjXR8pQM2Ti/8Uzc3z2BJ+x6VTsh4ZWWNmG/1EVDQJJAat4cuFbUKmOs
         K9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl/85hlR85x8+oKjy5ahh1VcWy56yIFKb093NASCy+TYwmbmr/hXmAcnpTtlyb5DSA/DWhOVKyHuvvsx894JCl@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3GLRWugSfDaz8jkL2Up4cwW48/1uSRLSO57WNQbv93e4NJEE
	yrqxasVrPur/IRQ58Gd58vwAHBpxLSIf5zKDdQhBWqxmv2i0fuQKQTZgGRDjEZWksiQ=
X-Gm-Gg: ASbGncs59+sJQHfMmoCCDJWeWjBTuxoKROD/DH86KY898oM5YJvjddcziR60P99F/I4
	JsmiP5d/H7gStFdBG4GgyAkCkJKbS0+MFhPoNQK2YGGh3oGgLuvXPBn9Xpg7MxC7I1/cufkQZtZ
	oBTEdPv1pZEPLACRRswg/6mSPQHAVkH2Ri4/F4Kokkvl7PbJUFMHuiRHCC1FrKMhHR1zM8ANTVJ
	mJe2ojUaPHrK0bwiJnXbNqcXXOOm7NjJdhe7CiCcBU8QX8BVs+xWfSvTEKzBKOAHDJRdVO9zuJd
	Jw9rEZ5EBbMLIGQhX6CsX4wuJzO7kArHEgB/yVyhMSVcRsEOlxbvMB5YM0F4Lg==
X-Google-Smtp-Source: AGHT+IErBlsaj2oMz4KGG0U/n1iHZhnbyvR7L71f4kcmN+NZni2stWVZL4S2bu1UJwMFwQlCqMCesg==
X-Received: by 2002:a05:6000:240e:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a57237dc17mr8397766f8f.23.1750091274515;
        Mon, 16 Jun 2025 09:27:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1866:9357:88b6:f1b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089b5sm11356238f8f.48.2025.06.16.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:27:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <4dd25114-212d-44d6-938a-63871750c292@amlogic.com> (Jian Hu's
	message of "Thu, 12 Jun 2025 21:02:00 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-5-jian.hu@amlogic.com>
	<1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
	<4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 16 Jun 2025 18:27:53 +0200
Message-ID: <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_092757_106095_989F13E5 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu 12 Jun 2025 at 21:02, Jian Hu <jian.hu@amlogic.com> wrote:

>>> +
>>> +static struct clk_regmap t7_pcie_pll_od =3D {
>>> +     .data =3D &(struct clk_regmap_div_data){
>>> +             .offset =3D ANACTRL_PCIEPLL_CTRL0,
>>> +             .shift =3D 16,
>>> +             .width =3D 5,
>>> +             .flags =3D CLK_DIVIDER_ONE_BASED |
>>> +                      CLK_DIVIDER_ALLOW_ZERO,
>> What's the behaviour of the divider on zero then ?
>
>
> If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when registering
> t7_pcie_pll_od.
>
> like this:
>
> =C2=A0 ------------[ cut here ]------------
> =C2=A0 WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140
> divider_recalc_rate+0xfc/0x100
> =C2=A0 pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> =C2=A0 Modules linked in:
> =C2=A0CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.4.283-09976-ga803e94eed88-dirty #91
> =C2=A0 Hardware name: tm2_t962e2_ab311 (DT)
> =C2=A0Call trace:
> =C2=A0 [ffffffc020003750+=C2=A0 64][<ffffffc0100e3e3c>] dump_backtrace+0x=
0/0x1e4
> =C2=A0 [ffffffc020003790+=C2=A0 32][<ffffffc0100e4044>] show_stack+0x24/0=
x34
> =C2=A0 [ffffffc0200037b0+=C2=A0 96][<ffffffc01130a2e8>] dump_stack+0xbc/0=
x108
> =C2=A0[ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
> =C2=A0 [ffffffc0200038a0+=C2=A0 64][<ffffffc01010c5f4>] warn_slowpath_fmt=
+0xac/0xc8
> =C2=A0[ffffffc0200038e0+=C2=A0 64][<ffffffc01061d364>] divider_recalc_rat=
e+0xfc/0x100
> =C2=A0[ffffffc020003920+=C2=A0 80][<ffffffc010624e84>]
> clk_regmap_div_recalc_rate+0x74/0x88
> =C2=A0 [ffffffc020003970+=C2=A0 96][<ffffffc010616a54>] __clk_register+0x=
62c/0xb78
>
> so add it to avoid the warning.

That does not really answer my question

