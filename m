Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6031ACA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=; b=4SwqmzhkK966Fp59JDYrm35iL2
	MoERR6uHq9Vyw7YYkJPQa49GRcWqIzyDJTsuwI7vTU/o8uHHqvG5OxZVLsgcgo2oyB71Twdy29E/z
	t1m4lJjS4YkJLvW5+bbeR6lN66t3UYO0G7w41FsmaDkO6Oijsd65/6J4ioNJm/8lrja7gGsIHMO2+
	U71Bskf4ly/pi1bV9J+bYltdeHnwn6uGaLKz1RFkjmp67Z3DtREaPpZjymrL2vIroRn1Op/vkDQVX
	ORZ4R9kj2d/0GxwAOGJ+l/LHNRzMt+PeenKlrgFClm6gbYRdGoCQ3KSFtUPY9AqZGJ3lsG0s1aRx4
	NLWBo3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vi-00000005iLf-3u1C;
	Fri, 09 Oct 2026 07:22:10 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vc-00000005iIi-34NJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:22:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1722326a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530524; x=1792135324; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=CYWg36XLgUZcFwp4aDjg9D5IXRndBGP+P9SzAHCVMgSXLR1qo1LFjkgCPDNHpcgOGp
         mafrINoWDuZhEwMprMxTsiBQE1Fg6+NQjg2ajr+4plTnGbJfiUQ+sJbXg6i8859Wop23
         3YdCA6RcyjINqJ7jgY2bNhNfYcjjSm1O9DwYc+9vXWu8qKH6eHW6O2BHmkQQPe820peD
         c3D1zGf87xdFvM+SgyIPJShmrKFH+CEc7mX7/KxN/ydhkMXrQRDkuGyYqyAI09zjsAoX
         f27f4Gs6L1RdyP4cCqn4GNZ5G4BSo7hSo4JMcsf4GZj+7MsHxh9a0mfKHtLMThZQRREm
         IksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530524; x=1792135324;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=RX0cp5KVwj6MphZK0jGsnMhS6OxBtYkIKoFQegxrCOX6dbL7sP4icupMQDXAv25+Qs
         sTMqddXx+o02zdXJ868wwMem7+k93XhEGZjFI02OQPBR1AozO+io/YmOXaz+WSjRzute
         RFVtScB1NPOmRYEKAYykOnVj82J6Q2Mb2ZJYkbG2SVDZxorarNGsfAz71g7OsNF1PoX7
         z7g0PL8fFeopmak6pxu86hKuN+jPqKdeKZbbqBCL8JjjADbyMY1dCa01n2wpNs8jP3dA
         b2HOoAze5mzS+5XJ4dtHsASwZd4GkNUQo6upptCYW8m35MoQALW+xxMwwXwfqNj8pMcq
         vzgw==
X-Forwarded-Encrypted: i=1; AKwUvBwJQNEcroyNy/B8vhfouaTNnQ8jhaWzPl4JEQfCS3XdL1Our3JNqJ5ZKj07CgQtaRskaglgV7Nk/qmUComihXoR@lists.infradead.org
X-Gm-Message-State: AFq9FYI9kTRy2L5yNvo8m3AnwvVjIQ9QVq6/rw7OYDo0/42II4TAtPdC
	0YmLr6b/8Hte05ydw08gulJ89uDnOjM+2ZDYOUVRoR3xYT0oQv0qfn75
X-Gm-Gg: AYBFou07rHjyjU0NKKjCgNOWRqIsYwoi6UfdYP/5KPEESkxoQd6j8HaICK0RUZIUavA
	bkStVP5RDTxMU3vEVs1ouYJJcM2GBvchWmzLDCxY7aZgQ0M5InxYkaGdErJ9am22MLcuE2OEEY3
	2H0xSjbMPSfhK5tjZltCUSw6idHuzp2An3Y0Ucb7WN1aUrDlujNn6wiQgd8X1j3uCpv7+bKVCyN
	BYJ47U6BGuOV70tKkR8culVP0jfZ5Fph+Gddne4wkMTb99KgLPLBR3xdbOdK9X/rveJ/JooUHfw
	tvIpNPVU3j+kxAN8WQJSiHaP78nWYncQivXJ9GzazWqgzXWLuC0NnhekGNVI1uI5H0lGRp58egh
	QfAeeDSqBiLtNmbDuauuG78s3Li81590BMnPDnEcKZ0Vy/VitgET68qnVYeXaYIqDBl/evtW7PF
	h6elV9jwxu1LmPuNHMtz5a4OtKxTve/Ik47CDgzKm5yygWP930eZBBMFV2dGS/XZxsQytwfeM1I
	n2FPZekQYJbkvt31LPQwZtBdXyV+kJx7Rp+uVrLVTdoLNLwr5lGSoXnl7+1ARPbaadtkX17TBvZ
	xsBvbH5UhpA3a/Rtld8AL3JRQEnwQ3RHftB1FHJ2NKaz5Nqlumw=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr1074419a91.41.1791530523677;
        Fri, 09 Oct 2026 00:22:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm1115948a91.4.2026.10.09.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:22:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Fri, 09 Oct 2026 17:21:52 +1000
Message-ID: <rT1KWd0SSiuQLd7MLQWREA@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002204_783363_C34C3920 
X-CRM114-Status: GOOD (  10.84  )
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

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +examples:
> > +  - |
> > +    sound {
> > +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> > +      model =3D "MacBook Pro J416";
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      dai-link@0 {
> > +        reg =3D <0>;
> > +        link-name =3D "Speakers";
> > +
> > +        dai-tdm-idle-mode-0 =3D "zero";
> > +        dai-tdm-idle-mode-3 =3D "zero";
> > +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> > +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;
> > +
> > +        codec {
> > +          sound-dai =3D <&speaker_left_woof1>,
> > +                      <&speaker_left_tweet>,
> > +                      <&speaker_left_woof2>,
> > +                      <&speaker_right_woof1>,
> > +                      <&speaker_right_tweet>,
> > +                      <&speaker_right_woof2>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 0>, <&mca 1>;
> > +        };
> > +      };
> > +
> > +      dai-link@1 {
> > +        reg =3D <1>;
> > +        link-name =3D "Headphone Jack";
> > +
> > +        codec {
> > +          sound-dai =3D <&jack_codec>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 2>;
>=20
> Example looks incomplete, you miss TDM slot properties.

The machine driver generates the TDM slot assignments for the DAIs
and sets them at runtime.





