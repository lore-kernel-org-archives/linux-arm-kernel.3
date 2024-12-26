Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73086E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9Hxi9sszYSp2cS3KRHvqcLvWwaE0E5fecrWh0T8tms=; b=0XCS0x0n6gjgj5fer0QhTpXGXI
	e8ueVfLN7zIxWKX0PzOA/Q+JC8BPraR8pkgx1JV7Id7OWzqpty9YrqQ3haeN/RrW0KuMRpE/HuExz
	HvgVjxuZiGgmsirNknJ3QogrP7BreAhNYfahKF7cu13biX3Je/oEWe2CSvLpUCZ8BcXKegDDfqe39
	5TmM1M8dhL41s/dRlFkSAm0rrgGZfrdhhk5ZqRm2CAp2w1KoVbY80Px+rGIs9kG1Nbu0a3wZUL5gq
	wkqebg1VgxNNg1lOgXp/QQvRyOBOwJDmMs/O/5kg2Xr7U5wlsiWYdbSnRIpcyUsxnQ5XEgUgepumI
	eT3KRoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrqk-0000000GA6f-1Jxp;
	Thu, 26 Dec 2024 17:40:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrm5-0000000G9WM-3Osy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:35:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so6573280a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735234552; x=1735839352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Hxi9sszYSp2cS3KRHvqcLvWwaE0E5fecrWh0T8tms=;
        b=VvkE275gwm4j9dyv2CNabbGiMxN+pYIiLo9rlKDeOawIbssQfpsZhKE0HU84iMoTVd
         3s7TNl96hiVRiUygVa70YxDojqVcaTm6D+gNdlMfpP303MLwVXgds5izWbGYV9cKN+mc
         twcUqUzjmSArbiFgmkvBAmsSVhsLwXO7nDg9piGFoFmVfgkuoV3prph1JH+tvtnTl/bs
         211kE98YVj+diojP/1dR7s71AK1qK9jcqYNOCt+Q52hpaqwMjpIhB4m1O9h0XYmY27E4
         SiMDzfDhD4eTL6lS3RrzCY5m1EUGFo4THSXelxkxOStUV71qs2oLj4Xzxhh4FawddpN7
         p7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234552; x=1735839352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9Hxi9sszYSp2cS3KRHvqcLvWwaE0E5fecrWh0T8tms=;
        b=WJYGgK5alQrkT4KN9nJrVGaC9SMdTxtoXyiHTCK2TbNBsC3EmW9tBwYhVJ8nAH3ID/
         5KzGTyK0R8Ebiyd0us/p9Bu+zGtX43WcWI4CE1lRo8JVLidumj4s/QA97CBgIB1Oj9zQ
         62aJahB8Uf9SJNPgRWNP4luQPWgWgTrZ2pPfO2r/5Em6owExQhdl5gdZmHAMxGnnG+j2
         nwsEkuPTZOKT3cSqV9js/zsFmuUUrJ4ihnwaI3N/J8kVsXb5oS+pQHWLGcmJeER0M8rb
         5zzj2FuC+2VxmVeopfe8aeTGyao5PhhSJga0oxoadsPEDIaWyKslnrapIKEeSrX3PesW
         dfBg==
X-Forwarded-Encrypted: i=1; AJvYcCWZYXQzQbMi2iD3is2Ihsom8BTzf8xvI1IPLcIYeG9Kpe52YejAfBSw8jG6EFrtoFc9/5N4w843Kk0kw/S8vUQ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ZjSB0B+zfv08ntR9tUwoRslPHerLxtUnCVF/zW7vVoBrrQh6
	FV21ucdZZ17UzRSUKJO7SvhKq9/yOuWoj7G5o45KAn+odccsCvvjLcsRLT52Kog=
X-Gm-Gg: ASbGncubgxF9FWOsS6x1P8BZlRf3YuO7i/ft1hZjyOiz7n2REgzGQKJUMJPTmtkcMot
	NnwkVCzxodf+bz5HnvS2zbk2d9IcI+GRrGsowDXOw2ZURUP82grCJAenkdbmPepYcgjqVfCyVqo
	0tSHBq8OYmqlZOkqCjTWfy5c/jo/qIgzueN5pdLGNzTI9ldCKaEAUofTV0t1ZGijDbjwg7lzC3q
	WhsoPCPGwWXf7ZdiyS0FChqPFQghnEu6ZRV95ccOzFCOuJGd33SS+9qrpyROaiMamf16wt4
X-Google-Smtp-Source: AGHT+IGR8b1qFS8O/216LzEHsL2snOtTt/JUhfXE7hEdBOQDqshwj0GgvqkF0MIY6yWqZ4cmqEhOag==
X-Received: by 2002:a17:90b:514d:b0:2ee:889b:b11e with SMTP id 98e67ed59e1d1-2f452ec3775mr36227157a91.30.1735234552633;
        Thu, 26 Dec 2024 09:35:52 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([2405:201:c00a:a918:ba33:f9a0:ac68:19f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm14281147a91.13.2024.12.26.09.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:35:52 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules
Date: Thu, 26 Dec 2024 23:05:30 +0530
Message-Id: <20241226173530.37037-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226173530.37037-1-jagan@edgeble.ai>
References: <20241226173530.37037-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093553_850024_7EA76A4D 
X-CRM114-Status: GOOD (  11.24  )
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

Edgeble-6TOPS modules configure HDMI1 for HDMI Out from RK3588.

Enable it on Edgeble-6TOPS IO Board dtsi.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../dts/rockchip/rk3588-edgeble-neu6a-io.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
index 7125790bbed2..4883b31ddeaf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
@@ -4,12 +4,24 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 
 / {
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	/* Unnamed gated oscillator: 100MHz,3.3V,3225 */
 	pcie30_port0_refclk: pcie30_port1_refclk: pcie-oscillator {
 		compatible = "gated-fixed-clock";
@@ -81,6 +93,26 @@ &combphy2_psu {
 	status = "okay";
 };
 
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdptxphy_hdmi1 {
+	status = "okay";
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -275,3 +307,18 @@ &usb_host1_ohci {
 &usb_host2_xhci {
 	status = "okay";
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp0>;
+	};
+};
-- 
2.34.1


