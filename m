Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20376CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=; b=Yz9kea4l27+o5LPlb5lGFX4Rv8
	R23ozDoQIa+vNg+7Wgih4yH/w/6ZbRJ6d8Dd9aLfs6l9bABzzLPp0QS+pPdvcUSjfMQjB7QAn9s6q
	D45qdPQQvlmgdpiTLTkhpo6am+7qXhwaAN5WYlhzW25qP4mVFizgngoJ+R54CIdTPNML8X6NKz4YV
	dhL8dRHFwIOHOwxq72mqU5mzPYCrB7+/dTS75KMx3p8PBRGxk7VSNGgrB2AFE4X+QDdvZrv1gZsq5
	30O4eI3UmdchyAVd/Bdrdt8f1zTAeTxbOk0RJCJaX7nM4ioBEZju3Z3B097yCvZ1CJAN5S+JIIhoG
	/b8+EFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsd-00000005aSx-3r7h;
	Sun, 18 Oct 2026 05:56:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsa-00000005aPo-3JRq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1098921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302980; x=1792907780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=lAUQlDFle5xAvCAOk3R6/YQt5u4FH+xhsyUUTUf3ljGdJh8hvRc7ewMWZlHB8iROCN
         t0arvne1WPHSBvQO5jl+MMFBijHi3HPv7rK4V5DVDyQxFXL7bclGUE25vN+r0TbQPlRT
         mXKDIssueLzAyzHHQSM6dHMUzP/shFgW9TMh9Fhds1Ma2kieP00xpKBmQVo3WCQMH+dp
         B2P6reTXm5byfjkqPq/hYXgeTeCQjxEsvMG/hV+vTuohZYF1vsuLEQjV9yctFqaWnEpc
         nbRzxdaaOIMZCdxhCAG8h7mqjqW87EaXh3IE1pJgwrl9V1iGkYssNc8Hev3wCziVzBl7
         Utmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302980; x=1792907780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=zYquSp4cZ6Jtxkhyd90Icrhywwhq4NbnZ9fOqiGWQ3HD54aQ5/NXLXcuvxMsiVy4m/
         v+MzUqcHV1C11xnOvvvmVZhGAlO5v8lbppZwTRwO3XxdXxhGvBpIH/8gApsDtYLTcZAb
         POSSlBy+pARvqThVIlFq7ucScO7VOvCz+vyoFdHDH6zu7jX/7a7rwAaQXhy+EG1VDMHq
         WePqFB1+LPfW6SJZFzsCpVKrUJf91pChSLJUF/fWWCi7V8Oo1RvPf8dX9rnpOZQpSo1U
         lbHnrNfpfvn6LkbA3oEdgK7P+BTUUVK/Rbo878YRQchp4qv3XoA7X4c4eRaNvgK839Pb
         vIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyoVlNVo5zCkGh6c9HXRshcoI0ncL1hBhOFNBeeLyCnhtJM24QIrHk/NlnUzgrPzhUt/Xt1WLbx3DHf52Bj/2r@lists.infradead.org
X-Gm-Message-State: AFq9FYIsy0/M6TmfHaExGRDTvT5M/O4DmFAsCtOAvgguISZbmC4XcgnI
	Wc8CYn0Hsy/e9NJY5o4MBA2j2xJU3DPAAQB96a+70Ndukt0HNRF40mQZ
X-Gm-Gg: AYBFou2dXMkunxsI4SeeiXHH3F27z7eqO+1H6eaF5RqlR+0Sq6r2yrRt1TJYDweXf0Z
	FJ9fpoE469Zn4MVSJuW3vL0FsLrVgt/xiv97l/SWQ5TUuhQUQOTtlXJJ4KJBOjttlqhPDhTXF4U
	u5hST3YOLkyF2ji2vyblnn9tQr3scfuu2bK9Sng2U+2AzfbyKAvY8miRO7dNNwhGZfaRlkTL1lj
	p8/+hGUlzbn6vglf9mQn31wdV0Tp6yI544Yrl1qD4faFgf2SPAgF8y6+8cXxDABusOp225qO6Hw
	wsmFSvSU4BVclNVpqduzjnRd2zUDPyjrPcXKIOK15X4BLYRh04Dr51LZ9qUKqQK4e5Fow8bEY7t
	yRNUCD+UpTVp8yuR++orSNZOyA+9WmvGAe5WiIGuj0ehlvgjE6Y14XMZO2SYk9wj7RooI0FpixX
	QQJY5mDV9Zrroc3fp7SdGnONxm1sQeRT3xEN3fWA24KPxm5uzmYKAMJoAr3aev+QxQOIeQ6gCQY
	YpG2dh9GQs6WGmpcYmLtYxBElG2IR3ET/j6rH5tCNmq0Fac1/dq+grfQSDZLKXiahpPw9hTs+oR
	T50+k3FPhFn0DEUNIz7QnB1R7iwMezRgfr41Jg8AwzZ46A==
X-Received: by 2002:a17:90a:d443:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3aceefac299mr3428943a91.44.1792302979629;
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:05 +1000
Subject: [PATCH v3 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-11-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HgeKP4GX0C8xVVymnI3UcLA+XVtzd7U2ZKk4pTgAUaI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nmVdrF8n6+zRbKnZNPTcy8WvWZoP/ppXdiMHQryS
 jsdZ1x/3DGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqPR8YGVYbejg82f4lR+LH0cCjC/+bB/2akW8gvSDs74r9/ycpPbRm+Ct4/U9
 PICvLweea5q1v/Rwddvfnqv8punzuZ10LR5ZsCzMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225620_826748_E759AE8F 
X-CRM114-Status: GOOD (  10.37  )
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

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 87 +++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..ed0eb358809b 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,91 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
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
 #include "hwmon-laptop.dtsi"

-- 
2.56.0


