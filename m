Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18404CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=; b=3o3sA6OoW9iTEj+jXdAv5Td/18
	SQsqg0RM7fcZnYzu/j7f2YsLE0bvjTYzAn5LBGg54aqgZ+zk9t7eXwFXdsTc8AGMHwiQ7uWjpYpJG
	neWHkAw2gHbwC/ZcZTdTaFQ8p3YR8CR0vAGyRPFcQdg2Fj/HisTzyY633hhfiWGd/XTOiNim9wKbV
	fKZev0aPTf114NtLEKviW/dkBJcCC3faT0DXFQNoj5oxb96uJ2rBmFkaUqn7Isx4ed67Ta8Ufdtbi
	xaD0DwbwgVMVBDdDmhmCfa7MgpODT4qMPtP/V2U84wFLb8dk6VF7JXCywt2n8dS3iLngH2UFut5M1
	ELHtnJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJuC-00000005bS9-1YGD;
	Sun, 18 Oct 2026 05:58:00 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJu6-00000005bOc-2VCH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:59 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1017663a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303074; x=1792907874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=luSfvi2WrraKI6FpcQtcWMbKoADsJHR9tiCnDGrB+xmGrGDtqao1Kmag91cZLkDRK+
         4SlJUxq0BTRwKjHskIykv4RGHSmbuIXkhrTuX8SV18MJFynsRPUe3u8oL1myiXLwdUiC
         9S4xJUEXia7katrgBuBIsCQW/VpdB8aR21KD+C4S5pW8wBJILGI+q9N3UeFAEtGrHybf
         7HbCE18/L3WJ3srcyLVVYw3WzMBBYzoQUfz0VU1PV0JsdsyK9Ta9YBZ2F977feKb8vpa
         hSwHeYhQG92Q+oU3P/FTh8CSrMrpQ+tEVqYoIN5PJIm2e3l8L/+LuVxsI+hANvMhxlbi
         Ly2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303074; x=1792907874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=QdJAGogUdnTXLV61uY9pGgePc7OOJtAQiMblVXkX5CgxUw6U4/aXDuhgcsrz6jra7w
         JlOnZkE0QIp60KLtx3vjQNq/Wz3unbDxMN1mlx5S+BwloPT/+FGhzDAAHkDySVYdILP4
         OJpR33DtT4p3boMr1Bk1OYL9jJ0NcXF24DJp38f/PFCmtjA0Y2luQrPiufNpeQvtOGYN
         f/Hw57qcyY42M2KfKDehdiFHmdw82zAIvxOPaD0HL5UvbhxfFW5dl1F28aJs3uRFXqaT
         t6GHp9OchJZVynpTrieD92oup6T9qkI2YwUBLOiamq59E7vQsO4XWbNclmgQJyr+6kAw
         MEaA==
X-Forwarded-Encrypted: i=1; AKwUvByPw4E2MU3qjg0KnMYIF9O5JDlddYEB3Yvp+rdR+YHpQqPFop+s2K6PL4fFex6EtSkejzq9gqdGNwClFgEfyFUI@lists.infradead.org
X-Gm-Message-State: AFq9FYI/3bgKrlEEXsh8glQETMmo7oR3pB9bf1po8JvIC5siSOO9p9Rd
	ilircBt/VHNhIl2jPNkEQLmmUvZhdX8ukzpOim4n3yMQWIrGCE3nTBwB
X-Gm-Gg: AYBFou3nCl0MMDHL4gY1b/bmvTDbwwaCLf5PRoeREXI2CFCBI7pJdJ0sjTG2+Gf24i1
	aj3z+jAghm2vD+QwUyZtUVjrta+3rLZPlf8wVwQ4OM7T3wvtcfEjhGiGpj3kg3FasdyjM7oXzgb
	6Me6LE/O0xTofRIzfZslYRf15BMRf5dghzJrw7cdKu+6LbhHlFGv4Z2wBdrPGct/F3zpGb9C2Bq
	D9rVBOXTrFfoEaWLi5Z47CMMrtuMqrNef66w4cWmCzvoSIlCQCxwpi6Fqtgt3Y8soOVmnmtoMhn
	vJoupeTk5ENC/2+cz13hyFBQIxgTAj4UUhgcLO2ZxxcDR+jI1GfTMyPb/QrbLDyAyIsyfOePoNS
	/w1kfFwwXv8A3tJkrmmN+UOqIYNLDORcpGLoa2J5cN15BlNdcgg3lrn5AhRi3GVdKfM5orluw6M
	FpqT2QCl1joSxFSc5UOWLQqzJlzDHr9Exy9Hno26BLEBp8aabUphJ7NhTn20nvsGjAvaGMxNG+T
	MjM/gKyBoy4IEuecJDQb2ggNpEDs3ZNGklihExvvN2YMyYHETg+Eoia0psLOxz9jNJf6LgWmmwl
	iXlA80yukfCBFDaoe2Z11UtWxeTjeW1Z+tVTJEf4xAHGg+8b2LcE23Yo
X-Received: by 2002:a17:90b:1d4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3acef3ce33fmr3975115a91.55.1792303073667;
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:15 +1000
Subject: [PATCH v3 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-21-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vnkDzg9mCoWcqDjxoT0H5LPMpd8KQzJi39uzituw
 3EwIuRfxwQWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKonzGZkaH696/E3gdUNqtv36a7ffLLu7PqI1sLuRZn5AuecV22J9mH4seAo+80
 gXbd9iRv3zVguMP3KCd34U3KbTt6Ojz+emHaHFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225754_642043_008A6D44 
X-CRM114-Status: GOOD (  10.67  )
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

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0


