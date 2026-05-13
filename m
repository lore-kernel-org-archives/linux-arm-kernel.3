Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F35CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=; b=QrJsXNeaM+hFnluVVr/40O6Gl7
	HGOBo5MByt6Z4sr2NbKGLoZvZs760/u63RQq2ipMPKGfblbK86I4UtnZe7GJuHJPbpMPk7+i5rjYt
	88xw4fLs62u67On3WheWCc+8f9ZyKZHnIeF/m93Iwk5bw/DjocMetr2Y4VY1x6Aj/G6zinhVEuHVb
	CCZw38cF+skaTh7roW3s9au+RusFBBXYLVGLBEU1NUQtf0nDmB0l8dFV4bm4DgS4pfubfCO+LVowS
	MQvVZO7euUKHdPVuKDF4xXRA/7VKAVbR8ajii96PZqv94Cf63/HXedw8lHCNptIsBd7Ntoe3EG22l
	syBlZF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN80f-00000002NTA-02mn;
	Wed, 13 May 2026 11:44:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN80b-00000002NSS-0PbT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 11:44:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-366330b6751so4430929a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778672652; x=1779277452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=RQN8v1vDLRQ/PCxlLdC2hOYbw9RPXUN+FQmN+o58d7YOjrRFmTngMyIKtAEkHRrEjc
         Ea4yANny8W9Bhy1tSGv339Ue2tbBZaRBcI2lqygV+clzMK6ey/j/yNOcdBkSk8+i2KFQ
         4/qXs8EiYbqdaHfLI8YpoA5yRcu5PwYCOZk3U+tdCJjq1Hd46jCd5f3upxZXyLvsnp+m
         K8QB5V2Q771osgnhbs2nMHISfXhEZAKSxw+7+i5CEv/Wer1QBm0taeUIeC/6eUirBt2Y
         0LUnlXW55KBSjv3bhXxBcMqi631enz5BXFEiAA1IShyigrq797T/hlLOo2OUdIqaEX+Q
         XRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672652; x=1779277452;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=AbVqG5/HsrlVMz5xZkHWT66MVv1zmN/Y3skDD1bY2XDPo8Q0gY7SBBUNfilogzpxLa
         UNusrLdbAuDv30LRV6awA/iKb6VNypYInlOU9s8OWzGVBLq3njBQx05h5L1C8iWZ7ymY
         X1MqPfFNcFlFfoD/2veaUBngm19o4hC1rco0bTLk4FA6i3JTd0qa17tE5DfMLnzSB3NO
         ojJZ0629XtnWYrzuoQ1PkrxfB8L3bwo84hcBlHvM5WbvEK0YhE3JzYVJJwRdWhmz3LPF
         n10ak3duUXJFF98738n9+jhnC6s9tvVU4ReIXCeub28KKR+qAAD74aWEzALrtzKxIczl
         rY7w==
X-Forwarded-Encrypted: i=1; AFNElJ8g0aEm8L+64HoheM9RmaoVWcHSDTxWurCG4EOU8aiCTptaKHmcT3IKnDOt/DtrpTd9bE5vL6FBQAbzWG6Z4zt7@lists.infradead.org
X-Gm-Message-State: AOJu0YzxIKFsRGzanzT5WcAyUesk9i2yGDmfBas9yPi42ozOXYbZx+3p
	2iYvEU3tC+vJYQlpFxGtojYDvFNNY6BhX4s7SvjpI+pdniAEl6giUgy3
X-Gm-Gg: Acq92OH5gcCxSF/516hQ8p/Nwg42rCFW06nD+bhv8rzI0M3v3PuLuS8hpJvMtSS23di
	t8Qf5pGENgU/VtFuBVGqpbG3zZ3jhzVqKiUrYyGFnBHnktjZKvr7KMSWrIG8yb1DdSu/bnwG6VY
	7JtNZNM43N9tBIoKHf41xy1ZOWD37Gl/voafgHAU8ZwidIkz4ZXMamYEWT7iG6r4HkLXkjsWgnj
	DH3nnEBmKHt63G9P4br8hNh27rtvJm98yT6yJ5GKl7PU8izn+2qCFRYDJJgAi3Pk6cqlc6gbMww
	xhN0rzW3klQsMbaY3qZWD+BquD/mr2AbQaPoS78ghgysleMuimYHZxYu0UewfXfGm3pmkrQMgja
	UhS80mOjzE3TWSqhm1jsnotC/IyrBbFAvcBkpuzb7PaWVH7e4aJHKZl6ws4CiHa3fw2PvK5YWZz
	rtC2iBAisUN7FMEdG3dmcY9jSUEvheJ6TDui2VZInU/Mc+2EA=
X-Received: by 2002:a17:903:9ce:b0:2bd:56c:97ad with SMTP id d9443c01a7336-2bd2ec5abd3mr25711825ad.0.1778672651705;
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:ac0f:c362:ceaf:f4a4:19f1:7e92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm204870005ad.36.2026.05.13.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Date: Wed, 13 May 2026 17:14:05 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>
CC: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
User-Agent: Thunderbird for Android
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl> <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
Message-ID: <A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_044413_168027_47063C2C 
X-CRM114-Status: GOOD (  14.68  )
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



On 13 May 2026 10:29:43=E2=80=AFam IST, Michal Piekos <michal=2Epiekos@mmp=
systems=2Epl> wrote:
>A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
>clock and module clock=2E
>
>Change driver to enable all clocks=2E
>
>Signed-off-by: Michal Piekos <michal=2Epiekos@mmpsystems=2Epl>
>---
> drivers/iio/adc/sun20i-gpadc-iio=2Ec | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/iio/adc/sun20i-gpadc-iio=2Ec b/drivers/iio/adc/sun20=
i-gpadc-iio=2Ec
>index 861c14da75ad=2E=2E3f1f07b3a385 100644
>--- a/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>+++ b/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>@@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
> 	struct iio_dev *indio_dev;
> 	struct sun20i_gpadc_iio *info;
> 	struct reset_control *rst;
>-	struct clk *clk;
>+	struct clk_bulk_data *clks;
> 	int irq;
> 	int ret;
>=20
>@@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device=
 *pdev)
> 	if (IS_ERR(info->regs))
> 		return PTR_ERR(info->regs);
>=20
>-	clk =3D devm_clk_get_enabled(dev, NULL);
>-	if (IS_ERR(clk))
>-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n"=
);
>+	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
>+	if (ret <=3D 0)

Thank you Michal for the change=2E

Have you validated the changes ?
It looks while success ret would be 0 and it would give return error=2E

Thanks, Sanjay


>+		return dev_err_probe(
>+			dev, ret,
>+			"failed to enable clocks or no clocks defined\n");
>=20
> 	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> 	if (IS_ERR(rst))
>@@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
>=20
> static const struct of_device_id sun20i_gpadc_of_id[] =3D {
> 	{ =2Ecompatible =3D "allwinner,sun20i-d1-gpadc" },
>+	{ =2Ecompatible =3D "allwinner,sun55i-a523-gpadc" },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);
>

