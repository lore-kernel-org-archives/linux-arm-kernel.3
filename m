Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DDECD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JonI5tVCKFVj4EE3HntNYMlqngF+zGzezn1FD6cSzY=; b=b2jnWlX836bhjx7MiVdLfh6kFb
	gN7GbxWLH0rp05Abvj9TKXC7zYObRqwr1rakTnmrGtPSxGD52pSmbmR7LtJmmvXc6Z3Z74Fm7rOTC
	f9YyoII9XPDJ89081sXCAj5wqUHOjyoE9eFo+PR8d+yRlCr2Ofi8beOMBnsDHD1WoPzk4HYYVkMIl
	a43rc6HwhvboOt+V4XjspgO7n1Nxb1YdczVcbSsNsNTGtCnn/L3Q+I5eiWa1g2AgTB68I1shf9If3
	OuTbsNotu2k4ZPTc2MI4yBcBZoUfjhr9t4Qso6HoKxgH0H1oZv8V3mh+voUxKBb/tvkQpnxMSADdA
	hQ7Ym/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKU-0000000C1Dj-2RJ3;
	Sat, 13 Jun 2026 06:58:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKK-0000000C0zI-0wCa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49222fb062bso3060395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333922; x=1781938722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JonI5tVCKFVj4EE3HntNYMlqngF+zGzezn1FD6cSzY=;
        b=opYyD/0anCgh1QGGULMp7p2sKvL52gpQhLtI/Jn+a0ETxUNpB0pt65dQnXakHvUpuC
         fU8up8oPry66OsFo40+ZFb2b+iEl3vdO16lUINiVdZ70xxzrdYYGSrXkdlJrOtZZHYRC
         pjyrvyEWIa8zkV87FsbFzkW5ri0Urap1Qfd8jbzzDIUCheIeiz0Yw//pkk5FLFdY2XlK
         qXt9rzJSwgG8xypE3efZ8T3LkY+Cr/+BqMLrLpJ/B7FESPQC/HCl97/c7MNA6/OYyjHY
         lAvO3HYQwL+zDXjCQJkATBGgdGmkV1BNHtbkSiWmHAkSEU/V3Wv3ZzgK7asWB/qYRW3+
         OLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333922; x=1781938722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JonI5tVCKFVj4EE3HntNYMlqngF+zGzezn1FD6cSzY=;
        b=rOX/ji5t3MErHbJMQw1j7uNblOWU0NReGcLGS16yvdeTyEak52ItYE7YVeDMeKXIud
         Ojnzs9UdZKsToPmmEE6jIAH7CVzj3ZlZSpDyy+2s2SfSwpGNA87UHMXArCaPH/dv88ZF
         1I+diOLM0Jeo47RF0jkKaImTVnd/iFje846LQCglK6WwkaWaqQNHPQTU3hnhAlumyhOJ
         s1l41xGFVuyZ+aQkU/HjkNC2rLJudOV2nT/KlhttwKPOW3pPJQsW3QqaElZmNTSSoW5F
         dGiHBxwcd/VwwaA/U2oJQcYtc2gh5HyJN0rZb1tIYyoCl4e9me2MxljMfvbB8enY0VbJ
         MiQw==
X-Forwarded-Encrypted: i=1; AFNElJ8RNtTTFvKrRoIYv2uni3ERR8ttbVt+9UVXHGXxL8qMEC/79qYPMv7SeJQi9p+1vQicpTnlHdH+pyGAviiLUi4E@lists.infradead.org
X-Gm-Message-State: AOJu0YzQTKiFKYl0enDaEAh6cbZAVvcxSrSLaMKP2pFLSyeHUR2PTHw/
	zHtqOj5EicyxRePiUqTNqF7gQRRYcPIOAxVY4ySK0GROrZ4ir7CRtxfV
X-Gm-Gg: Acq92OE0oCY5vE5ADD6BJFqdxaRMqNQih1yP5X6HmpI6gqNgbLtIDQ4nRYWSLyVU07X
	urloQv+7Uk9JsaHwmhRf0zbaT60/WChju6CEFvlzy3wU84rjnakl/IYIy2bvk1SGRgy+/qrXhAh
	SpqmYfADGRaB+O4h7NH3SCK5q10nOqL34oPpjQdKaBYDSeOdnBXD+OLtSu0I4sxqaDt4IQrA6P7
	AcAPu4eKmQC/wxVJVezXXmNXhMvTGGdxKz2dbrWd1iHb+dynEF+YAMe3AR+xMR9DxLyxnibSre8
	f1ZTzJUVpUt8FOPO9X7s53XkqJrfzKHGds5eA7L5faEPpIt0uGHXTVj0HYPr5koZverGle2j8Eh
	koCcSQe0pclUx5dKLPfnotW9J4UCeuMCGijGgYoxROgzQpnju+6f1D0bcbExJeKlPiySuoKcWM/
	ccjNcj7p8UT5R3liUrTEWeYU4gKMYaGN/LukD22kkafQ==
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr40797495e9.36.1781333922475;
        Fri, 12 Jun 2026 23:58:42 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:42 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 8/9] arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU
Date: Sat, 13 Jun 2026 09:01:15 +0200
Message-Id: <20260613070116.438906-9-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235844_282657_CDABAE03 
X-CRM114-Status: GOOD (  12.17  )
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

From: Midgy BALON <midgy971@gmail.com>

Enable the NPU and its IOMMU on ROCK 3B and wire vdd_npu as the NPU
power domain's domain-supply, so genpd brings the rail up and down with
the domain (the domain is marked need_regulator). The PVTPLL compute
clock is brought up later by the driver.

The rail is no longer kept always-on, so pin it to 1000 mV (the NPU's
1 GHz operating voltage; the driver runs a fixed compute rate with no
devfreq voltage scaling) and mark it boot-on, so it is up before the
power domain de-idles the NPU NoC at power-on.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 69001e453732e..d3f9776c2bdc3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -330,9 +330,10 @@ regulator-state-mem {
 
 			vdd_npu: DCDC_REG4 {
 				regulator-name = "vdd_npu";
+				regulator-boot-on;
 				regulator-initial-mode = <0x2>;
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
 				regulator-ramp-delay = <6001>;
 
 				regulator-state-mem {
@@ -787,3 +788,16 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&pd_npu {
+	domain-supply = <&vdd_npu>;
+};
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
-- 
2.39.5


