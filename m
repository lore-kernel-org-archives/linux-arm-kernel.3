Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97CCC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=; b=SPr/YT/I2plwaZiUV6Zu9QDaBZ
	k73TwD2wsjUVa9v0+miiXAQBoNjjpsTLFMp23YroymXDq20gYDLsNcMH7SCen8YWWgdxcfrNKfp+V
	5UxtUunKDRjRYM6gLhin1MtuFajjG0kV5jPAUjJIVAMMr68KydfJdDjy/lghu8Kjxcknih4whx9V5
	OdvjBU6ryZssyH7T8ceWBT3MXCuWzxzDRnZDfSdJTB2qIL478s7+lvXb6BdnUYxk/E0dvqmxqYTO1
	Zy6KlIX/1jPRJH6kIuxPB/mI3A/EIdVJVE50f54YZmvvBGPWy8W2SzfD7EjdLkm4pf7xEQT44cJdA
	p2bTaCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuatm-00000001R8e-12l2;
	Thu, 13 Aug 2026 19:15:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuati-00000001R8G-1Dg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:15:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f71156e1aso78364f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648524; x=1787253324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=CG/8925c03AWGY6BNRsjxm2bIfkBwxsXxJ8p8LWqkw/guhrWPiQV2Ggq1Vn/0ZjBl0
         CSvdZhUG7CDaIZWWVB9zkLaVRkLNHWGvo6cts4AzCd0wbjVmaNns/MdzRzK5o/7ml0f8
         jxqR+B/v3q9NFZOrz8m3f0wgVlDmsMvwOkqcBtqW7pgntPexFHOZYgvly2QlKPR9uD2D
         t1OPq63EOUjro+U8xE3yIzprsOWUp0qs1GZx7eJfJerMsO+6Pz11xbx/iD3s/9GpkYzp
         M2pnk7iguHHLreIArEXyL+keyFwi7hIs4gpo1OZUNLa8Cc4MjvskiN5tYA8WUuULnQFA
         51bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648524; x=1787253324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=aydPdFh1MJhJHvIA8ro6nbgr3nFXQbeU2msUbVXHaGZxKixeotClZF/kYy4mLY4Cab
         KyjtAuKGyZr1+YmMH6x17+rAXgrbH49zk5ER1GqrOxOrxIjU8MDqewIdEcdcldx5NHIT
         +/qCCIFQl/RH7bBJ6oRkUZDqnEnd2Fiur8vNOjyPdA8UMfFj2jqbzEmZ07Cajcskp8zF
         IiwujPEuIZrrbiOa69Q7ttl6xLsM7x1kJD9AifeolDzNuHwTuWbUjOQtw16pNLmVl2lR
         zo5yIgBSg2YTE0HIEL5mEKdpCgsGiVjgTi5+pOQZE9vvnhPA7f33PCsRPuDgrbBKD8XA
         O04g==
X-Forwarded-Encrypted: i=1; AHgh+RqeVNbWQ7b+qwhX2NtX6321uWLQ/dXtwsFlJCH9AoLPmrV71WabXTZ3BaoxW8O+Fn7v25EQcoJH75lVlNSNJY1d@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlv3K1Edg/QC3JUoGszMnyK9Xzg+jvcmgB/4unODD3IDfFEYsk
	0UpkUA/qz9PIdTnCMyfQLwpA0nWV3RB2BsPS5bma30tVilmITqqs5hHE
X-Gm-Gg: AR+sD13GejQNtdzQ4XKczIyONDqkQpL9XwhKDWbA6+K7svJ7Km/AYL361+HL7KfZ6Av
	eiqVTnI1jQZLNRaMGCFsS2nis76WOBPhog5s6xpFJ6m7VYZXX26MCIKN93ozrneBNHkQT74lMIp
	1fi+eKMx46j+yb3f0HSwRkQMYaPcOxBxZgYZsmEbG9XmuwONDwrJpZVnC4Is8tiE+XIvBvXARNW
	WQ2ZLHAwp7aFe9HN0gZAknHb0PNnwLeaAL1dDW0p2pt7qJvU4kboUF0ErE18Cz5BQK2TGqd/1gQ
	bNKLAb9ebVBnrpBpBHJsME4qXHe7xmDCVTpZnipNc7tCewC1O6BMpa+ulHrcYWL/72G18GBMDPD
	9IJN7tcUP3kF3PBR65n1PVH4VhnHgUEArPBXmbKydufrva9EPsSyPR+XEYtW0cHs1Hk7V61Zary
	c8+APienYVq+t7mAyvrQdVE8hLNuNqEBQTLBrpgXI1xVx8LTekZ/4eppf2iv6nyKF/hw==
X-Received: by 2002:a05:6000:38a:b0:481:5276:e4e3 with SMTP id ffacd0b85a97d-48160748b69mr654934f8f.19.1786648524165;
        Thu, 13 Aug 2026 12:15:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm1618261f8f.1.2026.08.13.12.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:15:23 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 21:15:22 +0200
Message-ID: <20260813191522.2334974-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
References: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_121528_120781_8429A45F 
X-CRM114-Status: GOOD (  10.19  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Fabio,

> What about the latest mainline kernel, 7.2-rc7?

The series is based on it, the base-commit in the cover letter
(3d6d817622b0) is 7.2-rc7; the 6.18 mentioned there is the LTS our
reference image runs.

To make sure, I have now also boot tested exactly this combination on
the hardware: 7.2-rc7 (multi_v7_defconfig) plus this series on the
Colibri VF50 on an Iris boots to login, with Ethernet up, both PWM
chips registering, the microSD slot, all three UARTs, the carrier RTC
probing, the SODIMM gpio names in place, the EXT_IO pin group applied
and both transceiver hogs holding their pins.

One thing unrelated to this series showed up on the way: gpio-vf610
has no get_direction callback, and the gpiolib in 7.2-rc7 now WARNs on
every gpiod_get_direction() call because of that, so the boot log
carries a number of identical gpiolib.c:431 backtraces on any Vybrid
board. I will send a small gpio-vf610 patch for it separately.

Thanks,
Mehmet

