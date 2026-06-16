Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C9CD98E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=; b=RVVU9TKBOQFMRqdic70QGoAteq
	CjkzDcFMGQ35UJ6OMsc12XdxpGTGMKuSWnuPTLtxLcTpvoy6d/XQ3g/gjOW7eV1vehPEy7X4wGozo
	jGhjRORkG/cIfuMnwjVxD7SxRLLdm8/mWFd+M73NY3lBGj8xnHhTezpZh3M0TCkFPKlP97dXjzNju
	v2mED2TkEg6tZ7PdeYEuPflYrVoo+pzvaMcdYA8sT0s5qwg/xkvHjCBjI0bYpcIcVVkvK7rqgUjSZ
	x4zMm/nBT2/suQ4fIURIiiGax804R4VjbzriuVdf9XbC9lOMV37PvcERYvYZdwUtdmsnAhQ550Wfd
	hYEcxdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOaT-0000000FOl5-2t4E;
	Tue, 16 Jun 2026 07:51:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOaR-0000000FOk2-04y5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:51:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490ac10e337so28691355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781596313; x=1782201113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=dRF7lF4O3rRuCa0DjFawaZIHgUMpq1M565ZanQ9KrjDjGaRk5bJuvhIoaN9cnWX5Ja
         hZaWNytH4O5AWufHqwIJaHXfYO/KDGcUM55nZeNQn/ZnPudoGZAthTmRcP9evyMZDUiZ
         +BKjwTbgGFjffc9kSop41cvMOB2yQowxfiRLAMzfErr/bL4tmZA30equowozSha8oOIJ
         w7iHTSZgoNilhSfvoyUYLizjNhZD2UIusIvNqoHcxOomm0nOzNY8CISDO2jIP2SjM/6N
         PTza6GgArJZjF+mR/gB8ETCwbVp3FHIIZxwYMZS+O7jOZoeZ53KFtiJmXk2GG6MpWWUA
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596313; x=1782201113;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=smmcLaNBjjQGkvA+vIdKDIzR2CrGJq6EqL2hKaBVjyFjCYhvDNfz+n7KFin6xZ7w86
         bUW7EWmEToHzDXYvkVjY5QkYuUv7QH6AI0+GtMUrG7cUjHROumENwrtW2vvZ18WtxR+u
         IVI3qXBtZpAMqkKO41oQNuFOOJY9nfKEYM5W/qxYAJD22dndP8sOYXAicL31VyZBZXyo
         APcYkoHmWhB0Y8YrP0IzK7KTfZu/RtegswG9lx44MduLrFTuA5fmTcf+9BFINXuAtEKi
         mKL5N0STgvCK16Ln/8PX4R3DCKIgzLZQZt1qz8suRWSgKtqbj/PH5VuawXtQeSkLErlq
         AGOA==
X-Forwarded-Encrypted: i=1; AFNElJ/PfsDEZA32V7dtmWz5pGySy7G+aNo2vGYdf32QTs/sm+vZEFzI96BKMt07fe6Eug9JUvjjDsK40L39VJjVvQeS@lists.infradead.org
X-Gm-Message-State: AOJu0YzTBEe4/08DMySMr0e01039cnhgggxnRHsETGUWaDNS3Q+FA3AF
	YtIhc+liqJ555YTcG2HHtZICv/Z6PFb0XreVO46tazjdDj6Xi3bI2iNJ2Sghgv81psc=
X-Gm-Gg: Acq92OEqyLkahT6B9Y2LocaDkdpR2k7yU0Ph6VsP8TtREVT0uDsvC32Bz7r3tqYLJDW
	9Xhm/+o9MUay13QbvK/TaiyVM3QNLunQDLf2J2xwdi/0ln9e8aaI3kzSo1MyPUffrCLbjrx2bOL
	s/Ko3jSkb7a94YvJgfX7NhiXQoAPKrzXnlcDqHIMtm9gDiAKuKiOjmJbprNyUE4fhQnSlFOfUA8
	RtHsYmAJHJmOwk6YnUf+hvFC1FJCb2kHbqsQYUhuCvpeHd4ylDi5AirqvHWflLS1//jO8NRBhuD
	HbIxtU9tofXEj+TZrzsEZu6kcpBfig7IvbbhvFoYUW9zSHb8zd4Qa23nM7EDRk4wVCTWoFmpzty
	D9Q3KHcq7j15bhlpIiiT4ihKJPhOhPlzKrS6UBOeBAvzTSC3ZSOXys7qUaMUeoYRUrfoAcupAXl
	+RTC5/ZkVgge3Ron/wvCtj4Q==
X-Received: by 2002:a05:600c:e547:20b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-49220061ff2mr123752675e9.12.1781596313269;
        Tue, 16 Jun 2026 00:51:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9756:c1bb:8271:9937])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49230a8ebe3sm30950255e9.11.2026.06.16.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:51:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com> (Jian Hu's
	message of "Tue, 16 Jun 2026 14:12:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
	<1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
	<5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 16 Jun 2026 09:51:50 +0200
Message-ID: <1jpl1qdisp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005155_104314_C67BD392 
X-CRM114-Status: GOOD (  17.65  )
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

On mar. 16 juin 2026 at 14:12, Jian Hu <jian.hu@amlogic.com> wrote:


>>>
>>> If you think splitting it further into separate helper macros would imp=
rove
>>> readability.
>> One clock per macro please. Hidding 2 declaration is recipe for
>> disaster. For ex, here the first one is static, the 2nd is not
>
>
> I'll split it into separate helper macros so that each macro expands to a
> single clock definition.
>
> They are defined as follows: (Excluding struct clk_regmap)
>
> #define A9_VCLK_GATE(_name, _reg, _bit,=C2=A0 _parent) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &(struct clk_regmap_gate_data){ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D _reg,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bit_idx =3D _bit=
, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data) { =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name =
"_en", =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_reg=
map_gate_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { _parent },=C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>
> #define A9_VCLK_DIV(_name, _reg, _div) =C2=A0 =C2=A0 =C2=A0 \
>
> =C2=A0 =C2=A0 ....
>
> static struct clk_regmap a9_vclk_div2_en =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 A9_VCLK_GATE(vclk_div2, VID_CLK_CTRL, 1, &a9_=
vclk.hw),
> };
>
>
> static struct clk_regmap a9_vclk_div2 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 A9_VCLK_DIV(vclk_div2, VID_CLK_CTRL, 2),
> };
>
> My understanding is that you would prefer helper macros to cover only the
> repeated initializer fields,
> while keeping the actual clock declarations explicit.

I do not have a definitive preference over this but I do want things to be
consistent, at least within the driver, globaly whenever possible.

Look at the other macros you have already defined in your driver and do
the same thing, including the way you declare the variable. Apart from
this, it seems fine.

>
> If that's not what you had in mind, please let me know.
>>> I can do that as well.
>>>

--=20
Jerome

