Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F2FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=; b=Q81DHMofssdeXMHV/Hc+S5gMqv
	wtUYfVrNsOvfVolBgSMwV4IYSIutq1gTjc+lpO/HmADePmWdRv9lx78kdAa054V/iWNF6PHbwSvXP
	BE1IPpuQ5+URg47+Jxl0qzTN+zBJus5wZrsAKsOeTj4ZQAMDvgd+6j+2aCc3jbi8kPzYhmk7f44Yx
	RbMy8+BX/mJxFGxRRPlAgDX2KoMrgkbpKsq4WHmcN3v3uOVTv0OFc8HWC8v09ygWt7nB+xTiLUp7Y
	eNj3cIh0g+dMv4pftLwQYk9qHuvsJ5KTAk0Hf0ZxWf6diTCg7FjVCqiMcBE9i3pMPsz5A9Em6CvU2
	vkZ4aspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH173-00000009OLj-09sL;
	Mon, 19 May 2025 14:05:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0mx-00000009Jr2-4BH9;
	Mon, 19 May 2025 13:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=; b=brghd4IJBB86FQK4rduTxNZp0B
	oEtkE5GL/D6eHQmVcQsQlFUoZpM9R/0a2J2z6zTA4VPHHyi4oxE8SRlI/rbcv4CcWa3v7ytM/prdC
	dF90OXMEMFViAzJf/f9ldfgPbioiz/jTxf/P1PytKaRA1Fgr8iX9cQtmutwpr4TGpxJc9Ptw08QfB
	ey8e3PeBWQjSaOxNqXeOmVa0o986E/mczKXGCdTs/akuQoUXodseg4YjngWHBQROsTprHJEmLIMfZ
	qi/Vuky4+LAFI8OQ8kF2l1BW0rQKyXU1G7Cns1Y3LCnCc9q9Yzxj1fHuNhDoNd14MCVYJ6U+Yhk+z
	/tY6BdhA==;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uH0mu-00000000dlQ-3UUd;
	Mon, 19 May 2025 13:44:18 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso29562665e9.3;
        Mon, 19 May 2025 06:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662255; x=1748267055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=j1HSsPUaaq+/BV9a+2PTwoG+9rQ3kTxPPBRw0DmdtLzPk5rzf75TVVOQt/iVHyREUL
         EkCMS8mDU8wpYV+Op2fadVMUjnhLZezsz68c0uNiCE7YTSZKCWlX+2h0jqmP3MtfnX8l
         PP0BYsWAixcWRsDJXiZrLCttY+t6zq56u6XwXd9xQO2jgs1N5wORv3PpztoF6c0zmMwS
         kBeAc3grhNRYZEXyg+BOhELp7ZKBNmvQhyfScYxxl4zMw1sPB8dcULqtlrL2WgSEdOdO
         rO18m4Anv/Y9mxJ7qovjczkVN2thchu5fgxXPsnAIU9X004opte2iGF4KOjRExH9FPfm
         /UkA==
X-Forwarded-Encrypted: i=1; AJvYcCVl6r4HGF1g7GSMUKPyFU0MMk90XOOACV8hGNr84ksXB6bdFfcn41Pxu+eWjAZbxq4MH7caP0lzBVsuTDkROEA/@lists.infradead.org, AJvYcCXh4+Hm7h39uIKGFj8av6L8+bo3CFka5dtyULYTkCaq8KrkZ6eSBS6eQaSUMvB7+GJVWESY21zhXmXlUiDV2FM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK2t1/Vc5ZbPi8suGiIm94kwKHmcj1pKv7PkARJzJWtOPhPzl/
	ujpk3brZZqglMv+shuKnKnHOfvTv5pHa3b0BOf4xcQvDs273i9cA42Cq
X-Gm-Gg: ASbGncuFuwjdFCrGhUoZ74i/GF2zzUSmy+U7cP/W1oc8Rqo+zpdtri2+fz3sRpT8ls6
	p7He5P0AdeTL8As6ewl4Ji2FoKriJC6JoonapMoMv4A7DM/0o4OZMY0c5oyJvtO1PrWLNTaRzYT
	Gnbs+a+7ezcPo5ZneX/nuqUlqKk4KQ4PgZPOYY4Ldts6VCOYE9egFjlchhmo6qeLFNNktNZbQ2U
	VwI62myRkMh8zNkTQ4Ob+sRiWlO5J0NU+fMjXDZOnjK7iquisCDlGK6l3MAFuTQsQqP0d1ERGCA
	esoC/TXk+MKH86P6X0oVvl3fktKDTuUnCNEpqVbfTvWhofdqzF0svZhO8jzQF6uDCHCDpTgSkqN
	DRJJKJXtw3g==
X-Google-Smtp-Source: AGHT+IEWSM8pwbQ+eewtaNC0pityD3poeCoFUie9piHQXV3RLcUMbKhDhTRCudb5lKuMqUm4AA1Amw==
X-Received: by 2002:a05:600c:529b:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-442fd5a347emr129006045e9.0.1747662255196;
        Mon, 19 May 2025 06:44:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:42 +0200
Subject: [PATCH v4 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-10-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_144417_441063_804A0049 
X-CRM114-Status: GOOD (  11.58  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -316,6 +316,28 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -440,6 +462,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -500,6 +526,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


