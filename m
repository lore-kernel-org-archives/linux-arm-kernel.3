Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D69CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=; b=W3ACzg7fzC8UU5V/eIdI79RXoS
	2ThtTiDOSZStuV8MmMhuM+7pa09qRx/KLoBMppLApFHBmyFy7CXV73Ace5nEeZxG35Q+vaY3o7nGg
	bBlFaltKP2tFi99+cqGe1URSDFNjhXVJ0NKo1kiUExtMu4OKGZ/lnLB1RaNPSKQJqvp3U14hYiIM/
	4zP4EHWeV8f+0BXZXdhUPbCi2kNlwfDaQN+gubjMUabIeDxEVK8IBB+1fzrgwm9txrMZrPAcslnU4
	b48EH5b/BuIjbMAtDkwg4LIN2wa3UnQr+t6gBvGQj8xb8sjX26NFvRJaJNpA2CpfwIpARzSW49MhR
	iNMRz4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFME-0000000EO5Z-30LB;
	Sun, 04 Oct 2026 06:05:58 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFM9-0000000ENyn-2BiJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:55 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso207484a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093953; x=1791698753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=Dsvm9zj7XPGwzVKubrf1A7I3+R/CR02u77XXInDriW6Rc7ZHFoeNlO2SPJDuIx5zb8
         q1uW1dnHjyuV/dHGoB9scf1TWHxTVRAYe5HMMz1OQThN8kCw2bCZLfCBkqrH23enc5fb
         enqFDZlDhLFfFb2jNHjeqc6qT5fkG+eXPX7cO/nsgZIDfLCDWNjeVvnm7n+expDzpzmL
         unPw29PE5Gks8knHjKAgF1geh1ZpN5EMuJy9JOegirxQB4jKXKlnb2RJmADnCpThuIEi
         V/RiTjIAT5/hwlZr84N7YMu9enkQtN1d4PcKtXDYMO7gRWSOLTI5mBoawJcAbbvqFlLP
         k8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093953; x=1791698753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=CCzVmAJepv2RFDUtInfwS+02JrKlFjDVNdszEjGpuDKY75X0/vADc17iUdmE1f/QI/
         r3kFVxyQWbBN/8BPnUbYgsUpEtxwhkY9C//6r/lK8R3u617aIzz6wuacHr2EsbqVoNuZ
         V2UyhnRIgjn9OtIlOWsupOZ9pJDvQ7JTkWlhTHkH5esyveTzhKCqiZ2nqeotD1xY/LZa
         qOm0lmGPcGuacVSg3+4QyMxXbjIQFkiRazL2i7vEr197nnaLRecV9nTUtK8YrZkXUsT1
         uWQDMljuHlV1ePBO0IW4542kYHC1gbCWLac+qgDRAgVcBN1MXwGZAfVAHIu1rx4uIhD2
         3UIQ==
X-Forwarded-Encrypted: i=1; AKwUvBybeSb5Cp0HYXViLsxh2GARgSuvGaL1pK2oN3eP6RL8oGjbs70azsu3hTivcTrRKpwcdZiuOh0h7HhLxoQqSdVs@lists.infradead.org
X-Gm-Message-State: AFq9FYJZWV7Rw7bcOBwrzEOe7KiEM8n2fkOlaNo44coMs3lub4kt11pA
	wL7n+9yQUxzGJ+oKaBV1mz06+hpzHFYCwzKAOtUaBYIejq0LzU9+7Fl9
X-Gm-Gg: AYBFou3c0RdG3bxVa8p/+0tbZrHA82KY9n+PgIjcA2TrgR97gnNNdkLdU0SlC+Ft3Ld
	v5eLsr35YRW94iOFdnXaZTW4JmPL93GkoIDbghcxCaerWJ5s494j/u5cxMAavaS5jcrNaO30s5k
	+vktYK1se0JdVyugyYJsCNoPScy2K2qcNNYg6TRLNvP+rvc6AOQo65ZOl/HtKkcMOLpnLDn03H+
	uocpc09oPXuNIGk7IOwclzMHnTywHLJPfuU/os1F3KJdhWFb9d06tT5sChoR20fmWDdj2wGbYiW
	eJALbPVln7tsoZVz35vs0feNdC2l4aKsfDx3pia48xOC05e6FYwxCxlEFkJnFlhp4Ll7gtdr615
	yjH0tKTzRJHyMpTBqMjOvZpTIi4Bt98D14UuYdYa7iLDT88UzDd8PprPbwPkw/l9PAivQu+zByr
	BJt9fkabbkfcT6lr0194hkVDKO3Xqm3ejRUa1F8CLML1slyMfkHz22veNXjkFpmDnRlO5QQtJ0g
	EGPfDVGRPBCtKAR8/gEBxPD8wVXbwwntArKzdQK81MW0n0qx5e2AxiATMqpilnGy5j4xPc9rRb7
	3SaAt9DC7vq8jMOJyaWe+lRwcpVKcNSDM3bq28qIhatRCqU=
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr2965260a91.49.1791093952798;
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:37 +1000
Subject: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QWXGpdu8z133+eZ64Lnup8sujus3zwc7tQzqf9Y
 uuKT+Ws7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEw1Cwsjw06nGQ5barf4Td6WU/r7ituvn5LT5msFFjB0rn1gLbuwazsjw+w1bTU
 7D/Zd69RfL6+UNX937tHpsh2djX+uCe0/ZhtfwgQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230553_604088_F7302710 
X-CRM114-Status: GOOD (  10.60  )
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
 arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..6121e3a89a0f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,71 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
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
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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


