Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A11CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=; b=g7XSBQpchQBXdLTtD0H7dksCF9
	uoxVNGHYPZuXeYbRVCXIVODLcAN5/vTqyRtlaWvijA4pBmlEWtu455V3RcwirX6uwu34ADPCx93ag
	F0Dv9FujcU8f4BQKm2cTfWkWLq2UIfBUUWI1yLNoEuCvfKyasDAli6zFzUJEtWc5sB72P37ekovvD
	b+VhlAYNqH4qxAZ57HPDCV46GDTIOFXQo2R/1R9GcZBYmS2y42dfseap4/9Y1VoXaeT30SfHEL/Ft
	je1fAa8lt9MAseCAu/0B6Cl8iKbmHEzNddsRxmFpryiR0savalrIlj0tCfxk4ZQLzYwYa9/oDjmcS
	4BiGsVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSv-00000003oim-2QJG;
	Wed, 20 May 2026 07:35:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSs-00000003ogV-0Ka1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:35:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48e82c23840so36344895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779262536; x=1779867336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=bsDxUXYfRERbRgvW/LyT1b/CvcJbvl5qCDzuPEZtaGA5f7rnIzB6Na+k8bOCP5azxK
         O65otBHZzcO0+Hb1fFOxTys/3mTezn/ueagwrwjc0/yPV32pbEA12pRhKaVtp4atXsHi
         /gg3p+Exh5qNINWrz4LwdC4X9TGi8CitM0yxrZfbNtO46fZsALspWIc/Ar/OZvnge+oe
         UiG6QIbBvoKUkn/l8jCmBLnr4a65YO0emEp5T1UVLcEJ3e35Zdvxrbj2YSFPp5tn00zS
         TF6AgsSSVHYZH/4nHccS52fTfAOPorCf2IlRNzipz2dS/gryyfAbjZO0ciYPZPKFme1r
         m33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262536; x=1779867336;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=giYvAst/ygmoZu0HMAhhby3ZnutH9vQXMVdnVKFlnST6c5T7opII7Ap/iFZxpdRVF4
         0Un92VV+OLujbNKp6FpWHrssKvsMXN2bFoy9kiiUg4Y3GMbzUvYvtBnFnxQnm9jLpc6b
         Ggn4L3Zt8JDkh6fHVJymscbnIXcxO9FyBbxC+GQhWwiRJuy3jRY7Xx3yEN5e3YDTHPPz
         aYTXDL5cHUlP4cTFNVpFEX73ki1+UHYOk5pCqy/kluZJ2OAvpdrU0DBIoBVb7erSa2u4
         3ysoUz0Dqhohv77Kg7dmLBVA8kbSmalA0jVAblFUcloJ8sBqjY7Ft8vXuH/wQc879tyG
         1G2A==
X-Forwarded-Encrypted: i=1; AFNElJ+ALPE3buu8jWL6NL2ysULw3v+teH/kqWjr6QYpwL1OcmYzEQYSQHhSMV5ghjMpBVRM4Kmegqgym7aRUSra1hou@lists.infradead.org
X-Gm-Message-State: AOJu0Yw67OSUx7SqwTc/IRt+UuE2X7OqKKma9WjhKLh83TpViXxPegfp
	wPnJv/7y3B9HMcHyrzaHMBEJxH1k+zNXix7ab7bejvVO12JtWAUlLAZq+lNcAdiCtEs=
X-Gm-Gg: Acq92OFGOnFHp7FzwYx6l5v+APL+cyoh4gkZpOyEmXxB2szpoIbnrwWUnBHei3iVUuF
	F154ZohmEIasojIjQirJ5OlFlyoloRiNv9jy2E9jHfeAVxTX8kf6KJl0wtZE+hIGhueePRs3j8Z
	s62/+1uiHVFB2GdEsq84CAXowkXK/SEV7gbEvFEWaFT0CU9TtGJkvHyKSK2bHh2nuz1Hj2qKqEK
	UQt6wYoaNrBQrOUynSVDKuW7RWhlftklhueBVhkzaEpUIcd88SRcjSw+9yIXvtyWvKWcQiADDvj
	fBUSRLudCWO97N1N9EbDvRVgPPIvmEUQHMgGWIQVxFu/nO+l/ubcsAXeiUIxBQKaocgUWctTaxg
	rvnAyRFGXYWp7b/zLADQDqU6rj5ZluUObOSAuWCFs3vKkBzAeC+EJMNZ2AAlYfZtie2UDcnKMJd
	WpC1nwcEIckTeAWFWiggpv8Q==
X-Received: by 2002:a05:600c:1384:b0:490:2238:4021 with SMTP id 5b1f17b1804b1-4902238403fmr70491165e9.8.1779262536295;
        Wed, 20 May 2026 00:35:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm52671515f8f.33.2026.05.20.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:35:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 13:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:35:34 +0200
Message-ID: <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003538_128387_B27E9F00 
X-CRM114-Status: GOOD (  20.01  )
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

On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlo=
gic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>> duty cycle of 50% after predivision.
>>>
>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>> pre-divider division factor is 2^n.
>> I understand what you are doing here but I have to ask why this can't be
>> implemented with independent dividers that already supports power of 2 ?
>
>
> If we use independent dividers, the n member would have to be removed from
> meson_clk_pll_data.
>
> However, n is referenced 35 times in clk-pll.c, which means we would need
> to modify all
> related logic across the file. This would be a relatively large
> change.

Yes

>
>
> Moreover, for all Amlogic chips, the n divider is an indispensable part of
> the DCO clock.

There is hardly a justification here

> The difference between SoC generations is as follows:
> =C2=A0 =C2=A0 Previous SoCs PLL: n =3D 1, 2, 3, 4... (linear divider)
> =C2=A0 =C2=A0 A9 SoC PLL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D =
2^0, 2^1, 2^2, 2^3, 2^4... (power-of-two
> divider)

Yes that was fairly obvious

>
> Therefore, splitting out the n divider from the DCO clock might not be a
> good design choice.

I'm not sure I agree and you've only stated your point of view without
providing any technical justification here.

From the datasheets of the different SoC we have, the documented
limitation is always the DCO output rate range. Nothing related to n (or
m, or the mult-range for that matter). This is a legacy problem, we
started with monolithic driver and slowly simplified it.

As far as I can see now, reworking the PLL driver to be a simple
multiplier driver with range output rate constraint could actually be
simpler than the current code. I would also make simpler to accomodate
differences such as the one presented here.

Unless you can provide technical reasons why going in this direction
would be incorrect, that's where I'd prefer to go.

>
> [...]
>
> Best regards,
>
> Jian

--=20
Jerome

