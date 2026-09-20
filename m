Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECACFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=; b=2m5SyeIFiFkYFEAX866SzNrG/X
	jgy6oIIVAuc1AMCCswEPJ9xdIb22u7dbnMzXZ9CRPuSlks6EMGBhvxtQi0aOX6EnA3yPhxXwvhvOa
	GhBXk5CxILy48EtvIQsPFyYI69wPPwgZNmnRcVKkKs+NFW1z2iIeJprPL+ikNlu8iDt8xI3m5fxe7
	rawpk/n0HPMawjhWEPtbsHf41IQ+yCVNeSh+BRI04T5apQzmCh+sNNDmiK745FpZGUoL+Q6M+A2rZ
	l1oOlGku1FS3apx7SmFZ329Sdljfvdn1amPqcJ45z0vofA8KESbEykNtig3iGqvTtcSiDeIZyXrsl
	napu3w1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dU-0000000GuGx-0zaR;
	Sun, 20 Sep 2026 04:58:44 +0000
Received: from mail-pj2-x28.google.com ([2607:f8b0:4864:39::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dQ-0000000GuE1-1pQm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:42 +0000
Received: by mail-pj2-x28.google.com with SMTP id d9443c01a7336-2d8fdc579daso22635715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=tJHEsu16cyPRJNUA+B5TWgwEwafWotRAVwF1EvSgXH7WkTF9l4vOkUXmiqsTrdhPiX
         gY+NSX/hRvOK8INROKSGUzJCtNG2zrtS4xeDl9mKDil9Wyu+Mbdc/Y/Erz2qX2D3hMQA
         PJ6ug06iJPfaTTOKIrc3c+aT79hZw0waK3Z8fRxgCK+W2MbT1ze1AXk0lBuVGk6XzmqB
         IZRvitLGMT3ny70AS8iRaDgcvKxyTJw95gLZG/GxKuPc8SrMsMO6dW7QPpSKOQk9BecO
         7kQFONE318DgRzN/+3azzCJ/VcMNpeK1Oxn9sOK5QcMtLtde4X/kU+VNWltTCs3+sW8F
         CNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=IFqjmRFvCJ/7Llrp5nchLI6uXDHzC1bi/sCkPqQJMLT8N/46fGy7DGqcepocWnb/5N
         xgYC/rexGiWLNqHpYWu0utn/bm/PbsCi2sPxOkGGSKKjSnRCf4JnpGrXVbEfNGyTRARH
         f28DNP8Kw4RZD1I3ltniYA2HvoN3KeTi+p9tvIhOA6bdmc59iHRARGzKftkt4+XNxS61
         XVUdWplqcVaEzOC4Bv4fKE4+RUSQCYBVPiKpoDNimBsQlA+NHytvBf1JeaegEfS+gMV3
         ko3i6WpVWMDwD+AxxP1WjNqZPbsTn/dG+hEbUDuBajy59nZYr6O2X/vj8K0lf9wF7Qo3
         yXMA==
X-Forwarded-Encrypted: i=1; AKwUvByexZKNOm6XFqIHFm7ugbtSUXqWUf59XCFBbZ0xr9pIeUFzPmWbCCOrUS2Dasm0I8fjEz6tAI6waANNR0MDeWq6@lists.infradead.org
X-Gm-Message-State: AFuF++k03QUhxC6r9G1EtdgiuHuXGaM5FWAJd+H1LGxPXLqSbNFMI51b
	AhebpSPrfugTTC+5d0f6iVhvq2dRIP2ogpRZJioKi3ampidPlVnqjggL
X-Gm-Gg: AYBFou0RDJYb67g3/E412Vg/Dsc+Wdqu1Vc8uXWTzPGh25nLUiHrWAsYZntWhRgLILz
	9AVrBwNo2SKPzBZOr65M9IwaOgkEmQKHDI7CE+77bwoU0cmRp1x1KrHWZB8/r8LQA0vCybZyA+p
	8f+VjcX74cojcZt7bQ+7svI4JP6rQAtN279KAyPvaKwklmZMUfI/mNzIvqp8v059C24C+yjq8rk
	oYIDnzSJY3qj1ulFVLBFA9JdQYAbLoJQBJMqRCAFdnRsRxJsYAMa0cJAgHloWZ+GEPPVSh/2rQk
	DGyCEcHgTR8n5XWkvqcZf9dEssg7ajBplG0VclXGv8Mt+6vxDey8k3KcgOWP8xwMjQatzcIGVL9
	7uLW6Uzb9j3x0Mx33K4Lf1okll6ZBVwHfXZaAKvg7z9AJcVCYmXqSOCUpCDGyTcQuVbCUr0U8PN
	UX8oWi7swWhiuFkH0z+1FwIE4wg83UmYOK69YY37VOquCgQtjtNNG+2YrWpEP1H4OL1/qVPcT81
	gnr+EAtb0/xNQHMjc7qOd2+rphsSZxrNH6FlOjDpazFlhJMcdcjALBnp/Jf1hPOjhJDBWibYrSA
	W92fHuNmHty/EF44zK7mZ3Knk+dAIYleU+ktG77XU4h3qLU=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215840_514859_1C131A25 
X-CRM114-Status: GOOD (  11.30  )
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

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
+			link-name = "Speakers";
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


