Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4676CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=; b=XT8kixPEVkSGTjn2ER/Lkdm0Vh
	0zw2TUedwp+dZw9IgtqqtWCmb04eGgsNVxaD3W8i8eFaWB0JziV2ezlPYQD73ix8Fhp89o5rW+owy
	4Ojp8zEsWMuBsNu2+V3O6QvCzZZuMDuzrwkxcNsxgwMp8arAzVaMoxaiQQyw30OsqHey5jJ0BljT2
	gA7CBe+EbGcZMZ8q8oqBz68OsXYvUrmsZ+WsbPMQZFxuP2x8SBXDncoP1VFO8JiE2NkBU+U1GlVlh
	KcJFEeejGdVUBr6TL5B4qXftxvkSrfEPdzF6J88SWsDq6XzPBr7a18KBGqOOrj8PjMv3Ph2Gn2ihC
	nc5muq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFN0-0000000EOtI-1uLA;
	Sun, 04 Oct 2026 06:06:46 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMs-0000000EOko-2PHC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:44 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so595904a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093998; x=1791698798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=D1KLbGbsD8xiv/5ExHE163ORHb7AtnmchCbyLa9+rRhZ34IuGnDPb+fVtjniDRmLsR
         cM9F6g0RZb0C5/0j8NQbBHR7fXpbdCOVgAEXAuK9qRaul7GXdUoJNYHlh3X87kCCSuMi
         GG6MX6Sj/QhIFFYJFBs2VrtRfmZnzKteTnbMOc67hUDSy1eHVD8uCsZItRYDjAzjgSU8
         np9hXVKOBTCPSelmzFGHEcWjY/5Yg7ojZf9cFjsYbdk/xuebHFkywUQdVcyWRTJtj2Vh
         u1TWCfWESW8FWNYeyYkb0+jyh9/3b5Oc3WEViAg2Zr23Wfzo6DVdJroHpGniX/FZzrU9
         lQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093998; x=1791698798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=AUgftu5ryIwpgwlKpWsHIL0CwBFVqOyL2fIL3dpG6lYyQyE40z3agpD6YFVBNKeoD7
         cOAK2x33qWRqlLzponhjgL3xZn/S13yk2u7HA2G/OGzY66KyquntJnj9AOrkeojJ/9a2
         EMlBr9jDpERJ+2ZrCRCYhQ2JuvKjg0I1xx9Je07w43+IkaT6pJKCcGeCGXe5wxdNtQDE
         ksWSBIuhfiEdgxKDaJq/qPsfXxsGUc15hOFgUK7q1rFGAupBCGae7oMY9dRHTb64BUtL
         Lff5Eyx6HhY1rvNHLG8jmZ9xm/JwsW28/F5GsiJoB9e1BqQe+/SE4CZQGVPWIGiqR2M9
         6uZg==
X-Forwarded-Encrypted: i=1; AKwUvBxPufn0uOmQZZ1v5WR0afHaex36Q3QP4jyob2JICbSMp2U9d3x3Hxt0N1uDyK4ViTgxmWy0LY+bWejt5XM5+8oH@lists.infradead.org
X-Gm-Message-State: AFq9FYJS2sdlH1rKh8EvC5ONNkZebB+0akhQ7PbwZQDuIsgJ/QelDrZR
	9sVZGFAXi8yZI0pODMd+pteS6YjEWXfa4lrtazraVxwMWIOSK40jHOOj
X-Gm-Gg: AYBFou15lEvo6gFTejk97kz/q7EDKSN2Duu/UMTcfTsmHEb+spf6Y0CtNzmnWkB9Tw7
	/4Xiv7ib9+3P7ZwXIC9De3+I7xT7PBpUZnXoNg4GRPq+i2B1zj8RUFCAhgweY2O19CFOJwO/RDE
	hqPJJ+9BatqnHbPHPZqBCzc9QeOucTl7zuUnI/fZ7uSf5gYutns/dP4xsi72iFu2rrkJcN3mbIZ
	54mqWoH64bQib1FDvTqbuGyTE31/hpmFca5ovP8q/LPSGA4pp68+MgeTf6FHASTMoCYrbyTn/cs
	KcnwTGiy+6lIP8CLTbKQyP5Sa5jiBSGdnP1dLSyV9Al2/8Rxi+8OKFNps79h4UqofGE85YsJHhB
	DWqeSc9kKMv+Q9fymoucJ/HjJkAy0UjeHeljyEW0T7ATirbGs86u7zGclwAiiH2C93vI+OzyWfd
	7yUFwMDLaTwt1hJKSqJC4v4TrdB6WINHBbTv8E39BjcmG7itWi5shxEAGOmhXTVsT4lNutBkTBk
	ciwC9fq+GQMLKSrZWMi6U3n+TrPfs5JRSnnQ7AO2HefpWLwp9Jliq3YyaVNdp8n6/F0c+I233xW
	1wjGueWLOg1/uDxTyWU6hyYdQVSGW2Yuu4Z/AponUXnqyHg=
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr6844237a91.59.1791093997815;
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:43 +1000
Subject: [PATCH v2 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-16-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SpT/mn9Yw/NPxbgufaM0+qi9NObXvIvuFI4oOQW
 a4ZNSyTOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNdL8fIsO7XQYO6x03LbdPLE0oNPZ9W2QWKF4vWiTFNfTf5Jv8OYUaGLS7Obd+
 uv1v7zKW2L1qITXhHtfRz6+jmpDrmOtk7O1dyAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230638_686685_90CDEC1C 
X-CRM114-Status: GOOD (  10.69  )
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
2.55.0


