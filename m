Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD007C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=; b=OXZprdCl8hNNqMfxFe0Knp6Yxd
	dGCkFrRQ43MWYY75DZGN0n7UZY/RXpKrQab0QS4vxYqJqS9D94wU9V4sdIU0/VVUvnKiiYi8VnAmA
	ofyDs3pqvTGtax/OK0Oe4elOW+FQ4HFqWbVdZPCKOihb8zd5jV3UUanKEHirTXVPGLjZY5SUqD35p
	ptDIqF2KcmkIr6cumCR9nFIWxsfKSDAKeN+6bLVj+jlcf6LlAk5iiHMz5i/sE+pV+zOl34elF4deZ
	adDk+VLOg53w0B6g5yqRrSNiyJEeojO/U3mN+DJOJa+q1xEvcbp8A+iHMFjHVRmG5DGQPUXdWQOiv
	E2YzxX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ca-0000000GtbH-0PX5;
	Sun, 20 Sep 2026 04:57:48 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cY-0000000GtZa-1Ads
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f066d8so6965235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880266; x=1790485066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=ClusIA3DQfq8u+f2x5hM59d8YNeRID7LGx5SOAmaq9asyA77r4DPpiD2gRxCT4bbeQ
         ZNCBd5aEs7WynrBvNFqrxnuZ5Bj/iVHRQP2n/NCHcNEiYWZ6LAucwlGq8D9iaEGyeyYu
         0nHx8HX0OePhwG5WhrDj04OMHzw+JqxjKtDV+qy0oW3dSDxQRJpvH0QJhSJXnuCapcxs
         OXBDjFDKLPHLO3YeUbM/ydDr4MtxrDoSuvFivNfJdiiGia1ZUBbZinb9kmWzczvjiYGP
         cUnL6Nde1RokVUrm/iUdXeYxoHuVjOlbH+xV3JV0zx1R87NMM7+jMt4UFGOWtyfJrIMQ
         tkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880266; x=1790485066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=UVtuX11ifrWtCCGk+AUU3G1AEHOPkDWDT9qzwddN9mrultbQ20ToPpUjmvRvZx2FFD
         j1TRmqZnRhLhyVxAxhPmGrsRhGIVJiuFDS/kZK7CCGW25MRQksGeWQD91RXzH1O/jIqW
         4PgF6Q3tZkD139iN6GER1NaOnCl4lhlWy7mxMAe/TbGxuHeDcmR0yoBvxsCPxPrMs7Lx
         akRPlD9QgKnX0MI6CUsOB1XPjsp5tEyCWY/1/EY+v2IIdBD7RYj4Ui6ABU4wenU5HE6q
         kgfea4P1nyO9lj49QJvJPvsI/jHqOTnpDMVZgGdUOESTkOElTfbiqVv73iW97UU9eTmX
         fPgw==
X-Forwarded-Encrypted: i=1; AKwUvBxlawOysrkN6PS+2lrRgyzIWClNXC1X+QJ0ddrHhATla0g1WCypB9pEj3U49FNHrk/4vdJNQegpf37nLqHk7x+M@lists.infradead.org
X-Gm-Message-State: AFuF++l/lfGakxj3SKiX95H3UmaVpLYZLJmZlCBvCjjUFWcNzAxlNKdY
	my6bAx48zgNH7lpgpaHMCKX76tVwvdRMkpYLjo1P6i82jIutACg7R3kB
X-Gm-Gg: AYBFou3A3pNDIAd4oBfJ5xQzCUmYMq/BIcucrAcYRARLMeZK1wRTntqBKp4/hdNJl6w
	lCVaQVU1nVIFBrA5Z8Nq158HyCwZVICa7+3GItxsWrLiWrcAnPGFuJ2OAT15KZbIz2dI6w/tk6H
	fiaoVyMbvNdYQl0I8B5qxu1K6Gj4J36zdohSooANXKLNuqMkxfwh2IfAvDefcpya9/b098NQwoY
	PE9Q+24NCNQz1LrPo4L278qnKSK2KQ5FVjKETIlZljlDtm0ARMU2h7VV4ni/lhy7ERxdMm8cPWc
	pDE/Uhi0fWZu+z6BinpMi/0FQEtmEVIplUyh/lcs6lm+pOud8d7Swc6raOfbNUQtmJpGZOmuv5b
	txEyDnsQARygi8ARhed7/LnB2yS3X2VVCeJH8cxdTGaDYpDNuag+IyOnZQ5f/xQk5OWoQEmLJ6W
	7sOYLS5M/oKrrU+nBzQdBACnEwIDBlSwlKhp3Vnne7bqCuZrWIiptt353n4w9ZjOeD/La8Nn0ab
	s6N8RD8J5h59gAgtgZIBtlI1yaCJWjgxYRfqDu+8ZJ8dwNQOPcOtL7gyAINQIdXnZ3e8I4qxXFQ
	OrI7SCVUrpTclSE2t1zPCwK/bHUdcJDCiDtJSDkI9tUWLb7m
X-Received: by 2002:a17:902:968d:b0:2dd:c100:2522 with SMTP id d9443c01a7336-2ddc10025c8mr27195935ad.43.1789880265641;
        Sat, 19 Sep 2026 21:57:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:56 +1000
Subject: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXdco7N+HGOUWzOheZGiRfnWExFhb/cm2C20dHE7
 VzbsU+rOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtvpqRYf6XsGtTFtTf6XP59EMmqiisXvPxPqbFIjOKGw6XVD75d52R4bZnwxJ
 Fn0PT4412Hr2i9FaFwzzHdc0UvkJne44aZ/lbnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215746_325263_274DC7F4 
X-CRM114-Status: GOOD (  11.42  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..4b30f08eaac0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,64 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio", "apple,macaudio";
+		model = "Mac mini J274";
+
+		dai-link@0 {
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.55.0


