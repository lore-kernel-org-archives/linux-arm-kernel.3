Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A99CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=; b=sD5X+ggDeLuJuWO1KnhC7PgJeL
	hEIf1eTha4uiTx4uhI0oKcX28s+DabQqANi181XnY0u4FPcfBHSYX/hNbvoynl9lkVUKRWOFX5Sxc
	ozAnb5ACj3xNqwxq2oL4LHTcybDZKePB5gGaGVziv6Jx7RnH+B974DKZsaCuYJDN6Nv36L8yoe7eh
	fChQvKYJ1bk4k94uudf5YscJnXWCPi7uxGkUWL1vxKDDbPbG+BtijHMO9V9vWEiPOUmbN+xwbBk5G
	6+/OZza9PcNu8bV/y6gPjpchH0pY5sszNt2N/tzC6IGIZDemR/6ty3MZ9WKZ6PkZ9i8OxwoSItZ7y
	o2+smhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtP-00000005atS-3zoM;
	Sun, 18 Oct 2026 05:57:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtL-00000005aqJ-21kZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1455471a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303027; x=1792907827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=OGX+5E71NW9STyd/MXyFEUs6F4AYpMnFkgQwgVRT+xEhh00sZmYZzYNbdGrDu3So8Z
         kpAzf03ZSTjhK8BqDu+rnPneCEdabVBAOLPpCGiwvgkSblwzFK9dmISZYDvSy9TfKXjg
         DqQhb66oYAr4+alFRKU+KQ+0ysxv0j+dmnin2gBTAP+5VHTjlsNkQ64oM7q3X2ZHQ2ZI
         weUb8OkgipvxchNxHXp2C5fwHz+0zKs1jC+6ZH6l+qBn2JJxzuTVJJ+PGmyVAQgP7ULJ
         VOZllxA+F9c6vJM1/9w8hGObMgDv+g6P97oJ9X0C02Ee0DFMJ479ZzcURNkjaTlziVw1
         FLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303027; x=1792907827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=Ox8gWn+hkoG2ApeyFtZEIhD5HDB/miW99Vr9GjCS/3f9xy/Ol069xCXjBVVEAKbNIX
         l6waThtBNbcSHjR0JOu2uD6ZdtgMk9EqKY9bADPTdiYeba9ltl+Qp5GGy3zq3cyMuQLd
         kWj27UQ3mRKu2WgJLgEWJSxL9mbe7beuRj3to7pefl3o6yVdVtl5/s9cRtuOq322MiYG
         4jJkafhq1VxpbA/hfFJ7ykG4yj1PFgN9ooKA0rXmL8I5o+Btw8rE8m+NLDR5lUYUDJIW
         Df0UVQJ7/IG5IIEALt0aKBW6zGArqslN7WeB13qPOQ2XqsEWOy5dg5qR61yseCD6whCn
         /9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdIDKoJsA+SYNc2CVzaBf2MREN+W77epGl/biMM9YjgVRZu4s4M7RDpCObkBzzdVMLom/EoB4myVQAZEN3mKwN@lists.infradead.org
X-Gm-Message-State: AFq9FYKkUWrh0XBuGsLyurILwZqzgVzWHAw6aIxV93J0WKcGI7RTGVvU
	Mb2pdHl0gCAB/l5hDkh4eK7mh2Dv3uiDHlTgLjqsrK3ILcsG4yqWVSCh
X-Gm-Gg: AYBFou1LC7BtjjD5ZCTjZECYObQGcFEvTgpgL7yEEJXqtsc42WopNnTFp1oCGYax7Yq
	u/7TVz243cstQ6iscBWv00wmWzE4L5Z9uYHGuMuwTvqav33cG6G7i3Z8bVbMJyQq0lDGTWhAkpy
	xXCCxrJEr1pbImylKQgpov/8E5dKI2nZ6HUsfs8H9HidfSkEleUaTesrf9lZADvMwxqYrHqS443
	4Ti9AXTuhfy5kb9u47v5EK0tde5chBwKpWAZs8vDl42C50vVp7GgVUamb6DeZbM8nPhzQDN1fJu
	3iSaLhuS/kughheloxM/cdviYR7MZE2axnHmC9XxHacN4/G0O5m6XBhVfyZzSn2cXpqqowRLb3p
	53VJEgFhR088/Negp0adlu5b7yn9piEnuq4qRxogPKNEc+k0HRmm7ZvHmy1xJHkI5nDiMmSGBCE
	40ZeThxZ8j5qaKgQESMsABGFMbGix/yrgmXKFMeMrMGfOQG0AP7OGB9TbUvEoRt78Tsf7jic+9Y
	7dcwZuIQ4aJbUEN8TsOCe04bJHaFJ2VtDNUJMIzFSFpguE79liR3SSEQY2eWqLVA5gte5IvM7K0
	iHY/gHPaJgizqlfzBMQ6qFrRNxVO6W1DSukEMH8xB9vOtw==
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr2608414a91.21.1792303026863;
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:10 +1000
Subject: [PATCH v3 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-16-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vk0WW5rpj6bePiVjcsp16Lfqzil65TuCy+bap0h8
 FSdsZW/YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVR9xn+Z0QrbdPOTf875YKM+dsJj+conv81Y/chW//Ml2FFBrda2hj+J3+ffyc
 oeWGv1wFtZbaWyhtMj7/sNUw98ZvN44//Moe5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225708_988356_FF600A1A 
X-CRM114-Status: GOOD (  10.63  )
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
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0


