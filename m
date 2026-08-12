Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8A9C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=; b=VHWNj2GcBfHjMYLsjU2TLbn6DL
	A5Fbu5sdWvIQ8bSY7cRYpDYUehkf3HaY7nkRz7Z1OIgh+1noPp6B4aVQ4i8uGmyDHeySM7rF16r4f
	sUVPgs+yueuHfMHOK+ParuZc0kIX0DJmO4bIGk5YtcnascdfNrYJk0rgySu23yS4/lGPnb0/NLSFQ
	8Nuc+MTpI5wArwr3cTgSpiGBKu2BzSrcmuxTcLGpd3tFDILYXrhgUiPjIEzp7e7GQYMffAC1ra3YJ
	9lnIIPCXqPHcF1I3wCamjXGYS1zfBCotrYLZmbLEZzGnpn2TUpPivNPOhUCR1olCZwMaohiPqVoB+
	brG4As1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHCw-0000000H50k-262p;
	Wed, 12 Aug 2026 22:13:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHCs-0000000H4zj-3HoP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 22:13:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49553515a8bso20739145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786572832; x=1787177632; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=ZQI5vvH6Pn31axJ8Aly75BMORTZ1BWKwgvPcnv8ko3ULSbw/jl13/TxL6HcL7ii8zR
         brdsqqREmH3WpdtkMEeD9IqrGVZn45N08mYB6BGaLVS3Yxd3hx/1P+KkCVTwtfe71UAj
         pI5guVswcF/jw1K80lHnHjWTAoxPP7Mint02lbm8T5HUXg9R3D2a47Ki6+1BSC7c6f0r
         UdIqA9KydT1NMN9DhMQY0zowW41DXyyDhFlnWm5Fmh4WQImIm+MsF71cVmTzAvRE5YVE
         y272vqhX6idjXrwSXdFYNsS/tKMgBWKCQ16vNh4Cxt1Icfquf1tyt+PIVHHjm1riXBR3
         3O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572832; x=1787177632;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=i/+otlF/3iXEKJ7cumRVVp7UHZ0HC1SMBeDQvke/VwGNYrYmNhM32rzikZR5HZ7+Kb
         6JcrPSD8zH7q3KPTu8SRuPy8JK9FN1pr7xOBpPG8XgsK8vSkU8Ub0N2TZqX7CdZ4Rgu+
         xXdK2t/n+ZlVQkguuOAYemRdXt5VsTjUPFs5KDCd7s28CdoCZoMNei8y/Y+DlagPmYDx
         anu5K75cpywnhAA4eQIBbpzj7RGVx4mZ0oQLMvJYVaMIl1cXq8rN84XElxo7baTZmctF
         aJToY35aNaaz9MntbsSzF8Q4NRt8KEgl3wxKbEfFHmQJgDMqSepf2707hUIKBz4Ooy23
         6Xvw==
X-Forwarded-Encrypted: i=1; AHgh+RqmsBplK+QdBw8wej81AoUGrejQaji8vBFWiEcKeXXzhAx23BsUjYVowm8RdFPY0Mq2GhAakwMKtR2ybLgothFr@lists.infradead.org
X-Gm-Message-State: AOJu0YwMdVGnp1OGBtKYpfXfGsAZxuMlxj2OWBJfu7T0fFUsP07Jcf84
	+p3Ga4P7Oj4lX/+H3FGbiZ0B6OJWc1DSc6KGfCVNofBi66sjxitzuPZOKaMLI1xk8+E=
X-Gm-Gg: AR+sD12NB+c5Ngul0Xp3WzfizHYV5NMv62RYPMhaT5ee1+UhvzMirBFY7S9itC/2aBd
	QgkU/KYengMgOwxe1/tO5u14aAaXaK5AGbYmoE+u1e+Eu/rjW/V82uMtZXe+MFiI3dZdcKK5+0A
	toGrmiw/mv/AJ4GPjCeWXYGEWpSSuuxNl2/THo7/nQAoTA7lzLmPpNwm8jlXDgj+HxQ4al8zcgM
	adTEA1qN9X+ynMMODtBLW5TzR9a3n75ansCmwreYZyEraf3UWlj57MBUGJUy36HRmwX3QNL19or
	OoSgxbh6aKWXdObK4PDyVp91QWb2ehlhRx09oZ796a8/CTy9N2hwVwQoIrQEK6Aay1NHh0h4DtQ
	mHtFaR5og5GOLGv0LRX+Jqzgm08CqFbRaDWynmKGXdvHqa79C21q7AdIhtluc1Wk28qbTmm+Th6
	AUFQSULNQUbscjVbr1so4yCtHtFmPkJe2lLVxyl4EOrk3nUke40daaYQvp460=
X-Received: by 2002:a7b:cc99:0:b0:499:8157:c03b with SMTP id 5b1f17b1804b1-499821c3215mr5493765e9.15.1786572832486;
        Wed, 12 Aug 2026 15:13:52 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.120.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e3f154sm9263805e9.4.2026.08.12.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:13:51 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
References: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
Date: Thu, 13 Aug 2026 00:13:38 +0200
Message-Id: <178657281887.546910.6599899262272389101.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O15VxwWMBRkqh9kj9wxsTvc8k0yZaEomYA9y4t+CbTM=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk1H6R2Tw1wDm9iMRbpjtPXOv7ae33YbnldzmMHQuPa1
 +39xFLbUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIlYcTEy7Pbg0Wz+mCPw+djj
 DwUB9nd1BSLvqty2MTzV7Sa+aZfrZoa/Itu/MGzJnX9y5sFJYoaXFx6z3jT/8jVzLzEVq08sG1n
 +cAAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_151354_836605_8789EE5F 
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

On Wed, 12 Aug 2026 22:50:34 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
> aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
> to be exported. It should be static.
> 

Thanks for the fix!

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

