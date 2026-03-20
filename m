Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7E21093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=; b=sIXsT8E9WLwJl7XmIUZX94Ldi4
	cBve4Z1jBfAUOQI1STQba6gyAYXcKGQ4RYjwk/kn8vmeyF8IC8IpQBHS0GK73m90vB4EuwSJd+H2G
	ZlqBAiaRazYCpnbAkZ832Sq+PGmz9WERULik/TnYywofzUaPMDhQ/jO88i6I3OvKAgsEt+AUHdxeM
	o5/y3j/+cCTxgs7L6e963RbNxImFAXppWvtfo+Pr8GeowSP/PTIyb6AfzkBVQ1YRs2BVnqk9ETuSX
	pQ2cn9Ja4bYSxdYEPMdi2s0mgthauJV4nqexMUekNdADATtgJHMo8ajgDnsmjbjwR8luRJSNro9mq
	kfpMaaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSm-0000000CNjY-42mo;
	Fri, 20 Mar 2026 08:44:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSg-0000000CNdZ-44Vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so22559855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996246; x=1774601046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=;
        b=Uq86WpKUJ4lg/31sVwu9xr21MTtoqbWMggE1P9UiMigM6IFbTPqEc9gkDOhVbCGevb
         hUOoo6Z5jeNTOgt8SjcMSs8/HuUK2fsMq4sYqYuQVPRf0EAwGigxBT1CsgioZ6qrirtZ
         6XvZBeReCIgopMciIFCPG5GR3/bnDRGatd+og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996246; x=1774601046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ri/BYxZDRrhTzmVjBatU57hJrsLsmd1gL4sNMRhZY8E=;
        b=e3n0JZq6kqSPymsAw+kRMJ9wfqjzVaaJA6aLezVPBD8nto/Tlu+lYEeFnlJG5oXGzv
         Pp+LOhPza+9+fNq8tHeekSRJ8RQ6ZD6fUJox8H1b89gUrQoK+iweTcvNcVVip29xBEFR
         4VzB/KGIkSXgLQIY0bOJuIo8azoEioYi8e43KC4kGH5fVuviCvEK0BUNak8XQ54wXnEk
         lNGUduqpbYimcuIwq98mOlSXYVVPD7kZrzMtAzUynQAUoMW6Gs+zd0XJOLkHw+y+o3uJ
         8ttjvldmRU9MtfmfQaYHlnaD6ne4Wbp77VVEJpXvrBF39yPuZ+r5zdVJ2bni4NFI68o3
         ogVg==
X-Forwarded-Encrypted: i=1; AJvYcCWLAvwgu9pWzkp7LYPoomeCFtZj/0PToXHLbsUWkoEjN4puY3z8TKvRPg+zz3b21NlLMsLQEJgtF3hT213UQS0e@lists.infradead.org
X-Gm-Message-State: AOJu0YwPmEYeg6w2Ciw7susQLQKAizH7beThL0IC0HQ5gWLfDllXY6hi
	4FDdejUV3sOwe5V1QLzC3D4kec/3x2RWm+AINX2OqKWyxKNtf4zislUeKBIrWE+D6g==
X-Gm-Gg: ATEYQzy5FgRykPhAjifsVhAoCnO4HXLZRsQ1vBtNZd8/kJHF0H1vOqIfOZCWm9X81J+
	hWyZsDZBxfJ7ypxmtlaxLplNSKIap7/SC9LPV20Sv8Y+V4KDOFU1q9n3BfO8w6X8g1eLUfkMHyX
	uCJhmMB1wq+WZ1rumgv2+UpvL/DzsFdjrod3xq4dV4DUcQGPQE3i0TvCusbZVSFkjJDYFJeFE/e
	3IjpmMp72O26BoUWArjB4fYXfX2xNLroKgXHfjXX8zT/+NpXg7Gth8W1yLhZk6bVFUaIA3hk8XA
	97r7sfHVQfeL8FbZ3CQFb4ekjamDOwsaa5hpBiePVVTUyPGWZFfIEBb2u7nNc1IbeS9Lc0OcAZW
	HKZbuMLmcnpz2jyi6U6egpDHrEEDF2A/lzotDKUsx9pWdLr45KevFC9iI28By7c34lQdc5QsWFi
	7hfRgRx77WJ0Bc1JlDcQM8/+eclMV5bs5ffGSG+aH3DWari4cQqwba6Kc64rO9AwDpLE+sebQbN
	3cF8+R7uR5Tx/8LCZ4=
X-Received: by 2002:a17:902:d4d2:b0:2b0:5923:515f with SMTP id d9443c01a7336-2b0827a905emr20186985ad.35.1773996246423;
        Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:35 +0800
Message-ID: <20260320084351.2461060-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014407_020181_1D52FCD7 
X-CRM114-Status: GOOD (  10.72  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d22c55c3abe0..d16634e9f342 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -550,6 +550,27 @@ &mmc1 {
 	no-mmc;
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_g>;
+	vsys-vcore-supply = <&pp4200_g>;
+	vsys-vgpu11-supply = <&pp4200_g>;
+	vsys-vgpu12-supply = <&pp4200_g>;
+	vsys-vpa-supply = <&pp4200_g>;
+	vsys-vproc1-supply = <&pp4200_g>;
+	vsys-vproc2-supply = <&pp4200_g>;
+	vsys-vpu-supply = <&pp4200_g>;
+	vsys-vs1-supply = <&pp4200_g>;
+	vsys-vs2-supply = <&pp4200_g>;
+	vsys-vmodem-supply = <&pp4200_g>;
+	vsys-ldo1-supply = <&pp4200_g>;
+	vsys-ldo2-supply = <&pp4200_g>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 /* for CORE */
 &mt6359_vgpu11_buck_reg {
 	regulator-always-on;
-- 
2.53.0.959.g497ff81fa9-goog


