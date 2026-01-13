Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A1D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oQMGTyMi20OxWQa8x3f8sz8cBzKODyRyWVPXoBWeNQ=; b=YCGRbAh1+R5chgxu4pGsE00fid
	XQ5fF+osrixcyiGsSIKa1HkfrQfj/nDLktjKcp0hlIqZh9tIG2tRhW4s2mzWRsey6bpSX5W0nc/n8
	d7LSLtqiAcDME3n3yzmGWOzg+aK+fXtkY0welgMyScjNRubaYsySSpOpJ6tdW06sdyh6vJ9KR5ExW
	Zn+zDBTMx+489p6X1Scuy7bQ5uJxvknNYs1+A0Oc/WspcYp35uzt/mqHVoXyL6zawo6BddLGDZPAB
	ax8NKQOkm6Fw1w+WuktrPULBEVdg1TB5/5zi7eKBQSCHWt4tO0eJYf4Iq4iSkYZpbaL8oQJ/Eqxyv
	qydJPH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7n-00000006wfK-1VYl;
	Tue, 13 Jan 2026 10:59:47 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7e-00000006wa6-0Uje
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47796a837c7so50675085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301976; x=1768906776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oQMGTyMi20OxWQa8x3f8sz8cBzKODyRyWVPXoBWeNQ=;
        b=ApYv6XEp0QmvUGzfhVkwjnt6D2CymCyWbO1hDawOpkTlitmFwZxFAmu0Psiu9m730P
         1sbllyizLKXEXpCYxw9DqEGTRAQrY8tQMlylHwVO+fwkbeHI0NDzwOE7vreMI775Wlw1
         LxTYk658rtxE+Q9Ft7eR5KtI7Jzs8BDFSAB59+2NpxVADlzPXRfU/9sQyBaUxdoBoki4
         pgKA4tbTTziy1hPrIWP/xsapL9qrNNUtxz3NVOQ5v+rBaxck9tK3aqB4iut9NeFk+lpZ
         cXMVKCSXIqOdsAS1DUqcUnX4EitiL6HKT5+a6HW4ltP7y6wP+Ji+O9dnkGdkGO0w2MqG
         j/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301976; x=1768906776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oQMGTyMi20OxWQa8x3f8sz8cBzKODyRyWVPXoBWeNQ=;
        b=c+PWlf7hzM/9KgwuRUl7gIya4mxY1N3iZt7nN+eGsirbE/e7ZS0Y33sugjXckJIJ0y
         aSSQKAv9SxSoIE4pOwX9Gkab2mynzRLoJcpRrJcPm4+GBlgbvQHn8hyNx+hT4HPiQq2p
         OF2WoIpq9rdwJ4vxHw55I70Nyw6LAmQg456f8sx1nyCG2muiQsiJlZ7J1++4zIVUQcJZ
         soHPIMAucwI9JkVfoQ/l7/Shr6hzcNSatPFz2F4LmEhZjX2WFiDoyeWGcPrEr4yt9MaE
         MhmxqdwQbg28YAIqWnGObHm6PwrQllNZg254DXvW6dbT6cULE2kRkstiMFe2eY8WzAtU
         KMFA==
X-Gm-Message-State: AOJu0YzUBACW06zAsa8Pk3gZnORjRP72OoGzD0MbMbTcfc6vP3JFQidN
	OrePsVllIo2f9fN7Iab9DuCZKKm26u4ExE+X8Jy1haScvq+/46EMV++nKJJAd3VMvEU=
X-Gm-Gg: AY/fxX4iBohReMyNGwsjbzHSEQll4jMw2XgRfNe03nUmaA+Tl+nQW7+cIjGS+ObYvFo
	a7j1JYsfFJTFeBo/IhBik6HhQBA6+qZZ27BI1T7ppA/n9CT9LWTijbcg1qMKecwHotzBYJZFLOF
	H6tLndu1mO6A9GSODY4SIpLKDSp47rKi4rpGYbsYntEt6KJcREIhc2BVM1ydtRZYUAkOqDIlpc+
	mmMHpK5PIl+L5Y65r8TGRPLSX7gaCevspwwi3dWiTZOqZpe1obPLIqiYTL/MaUPZCu8G53OlbEC
	ZWfxC6iCTxLciKeGMQxf6t6NvvO5P19n8TmNkZB/uVChkZtc7CTL/kjFSzVchK/D7pSDkxVwKwU
	u1Kt1Oc4HbHeW+H+jiZJ9OYaSeQdvEyLqXfyGDpple3z4d8knbS9v5LcfFxUnyWz85p7LQ49JAC
	SsewmjHnRwyNLmv6CsugAGFTVMaULVAYY9kDbHOPn2RQg=
X-Google-Smtp-Source: AGHT+IFn1dzqQ/D+0QCf5k/jfSxOt6mGZYAi0NlFjRq6667iKCclfMYVXNjtvPWRLhP0JCbSG1j+yQ==
X-Received: by 2002:a05:600c:6815:b0:471:1716:11c4 with SMTP id 5b1f17b1804b1-47d84b61379mr229758235e9.34.1768301976084;
        Tue, 13 Jan 2026 02:59:36 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:35 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:59:02 +0000
Subject: [PATCH v3 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-5-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=WUdMAX8z4QhtVQSfFhWdE8LzEGj91H8aYjzAX8V+ueA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWP4MHYOnVwKJEasNjKHdnZaE44GyYpHQ0eI
 GH3W5ErJ/uJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljwAKCRDO6LjWAjRy
 ujQ8D/0egS4XV5yKcYX3dsAb/ybBt7n2mTIbl+uUqSkgvnQZ4m5Z72v80opr2qbajInKVtXcyIh
 Jy+EKJV/MQ8kUT+Ptz6K9lt3BGqpy/ENLkUpoMjRI62kaOEYMC4NbWoUBh2hm26kW+V78zO2bwK
 yiuMYKmrlxrH2Qwl+JOSGIfrXHuXfVGGe3afw1hqcSD0e4GQ9zh7zWQY5DsyIt0GEGx/HInusG/
 MNVzUo+EgdqjsLETTL1QCGQ5krRshz0FwxSCzMr7B6NYmpq3uKQpFHed7712dMqirj4O+R1KkKy
 cE66+RPBeHYdUFSa4R38rYgs1IUOTZcPoVeBlOoZFt1+bGldxxdWpvqownj8/iyxRXACvPX/dn8
 IxrbtKDgzsIOfiukT8wt+8Wu+ziVTOLPI+EyL9NObwqKaSDI5GQhAj6hZ7o3TzG4nMINEv5T9Y/
 MuWE0zWmQCqWzDVMAHoQXQSVs2Aw8bl5mDs8YxWkzSs8OJi9khsmtsCqP/AikzP+U3p0u/IZnxW
 I/LFdJc5Rx/AxGlxcXwUHZUR5F+QZUnMI/EoIyhkZb5FqWR0juEfUzntE9T8NhEtHuvlhHPJjFk
 Eqkvrwkt0CWt6izsAwwvdftnn+0Dmuv3JvmY0CIpEekqibusF7gU53gw20iP6MmSU0RUEzmcfYf
 fs11GbJxI6Ibbzw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025940_838552_EDAA5F3D 
X-CRM114-Status: GOOD (  10.01  )
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

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48f3819590cf8c05d6bd7241cfed8720149c7db4..d085f9fb0f62ac2f57b104c20880e64d885d0bee 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1815,6 +1815,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			status = "disabled";
 		};
 
+		cmu_dpu: clock-controller@1c000000 {
+			compatible = "google,gs101-cmu-dpu";
+			reg = <0x1c000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_DPU_BUS>;
+			clock-names = "oscclk", "bus";
+			samsung,sysreg = <&sysreg_dpu>;
+		};
+
+		sysreg_dpu: syscon@1c020000 {
+			compatible = "google,gs101-dpu-sysreg", "syscon";
+			reg = <0x1c020000 0x10000>;
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SYSREG_DPU_PCLK>;
+		};
+
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
 			reg = <0x1e080000 0x10000>;

-- 
2.52.0.457.g6b5491de43-goog


