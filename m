Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D3109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=; b=f38wHLMqwan0sB3NFek7HS8IXV
	3GNIHkKgbmIEOuwElO/DeeG4ddV1sO+r5IKj4irV8eph0PKhRT4jBMtd2BCszhCoSOzMtJOtdi8a3
	U+lecaG6egGxv06Wk6mIJe/iGgV8WosEMR2ipU9sHLbjArhgY7zvPYq1E91PAih0cvVh6+Ubx/pau
	pGOCHmLFrITjt5nKh4S8XpCUO+9YqMXA/UC7EMKq1nMps9FbHLkQW503Llw+xwHOEyCm4S7gftJRp
	kQdVSEl7kpvb2fRpCS+qcHvkLDZ7hIJjOPkGjMb3wrI8f6ovYyPz9NWIJRKEu/VJQ19KEKZyxsln7
	LcuWgUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTQ-0000000COS0-3HHy;
	Fri, 20 Mar 2026 08:44:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT3-0000000CNz8-3F1U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:31 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so588083a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996269; x=1774601069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=;
        b=mTrbfSroaLfEDPZjuYm3oJBrUqX5lwRHOQ4hnaXs1Vxz4UfmKg/IwayAArPV2nOKCi
         mh8NrO4DZFLIG7o4T3bxCbY/eN66zW4KVsrucvYeFtZLjsP5VczBb/caRwK09YGadYfS
         RH9ThzGFIqFQkGGwqgw+pOBav7XXoUQuPCnkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996269; x=1774601069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=;
        b=fK2QoqybWA5GKYtsl1aLn2Q1+//ODhN8sWffobkyTXXXGF4o0jpn4Oonbdp3C3bRZi
         B0XtyOTHCglIDig+CPubhzgsUX+maLigHLVex9vSp5nY7Ew1XlpxLV51kPp7sLXJrEbB
         ls5Hjo82O9OCcENCCdqMWOvIujmBCHjQ8tV3JVFh/pwmHPU5gf2U+UVowf+NvqolWg3e
         P/HhzRG5Q2O6rxS48504ddticOhWFzCZ+bTjNpfy14weN0ntLbknDiCNPo5/y7JtxJ9a
         y6UKqhZMol9318wmJUVhSCeo48U+TStd0yN+ub80Jhw+Uv0/FyMiDw4LhPkJfeNyPG5l
         3bag==
X-Forwarded-Encrypted: i=1; AJvYcCVmvkVhYBeng0FiwVtZZSiTJHrguJiga01/0b7BTLReoeoKX78vnc1RUXr9YReys7VdpfMfntokhd34ADlpk8ko@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9uExl7t800XDNTiZjn0fvaEqsUY2bxmwm+jf2u5UGW9+zTMnv
	046KYwEra4xSFPUyiS25Eqv6ptjRZh/RCGBDcPua+4mkSr3t8X0sZ34QLqdKQtaX4w==
X-Gm-Gg: ATEYQzxmEu7mEhM8Kb/SxouN5dWjBGA81s+CtypJZurBUsZySB3IwSDLlS6NydyjjNB
	Ubju3lu5TWq188X4ZKxEWAVMM+UfUlqbWKd7Z7qXhWBVflQnN1oxs+bZHjoEPLeZZnwxg0BTwDj
	mfIbZN+7mlwbMYhk4av5xfqqZ6dqLHqpZwfXWkSd67Ae14c+D3VOuQ9W9fNepFpcIjygC8DYo40
	/sORBAohTwlGK35+m3iohnATUlz6ezsR2F8WiIPL9zHxgazMM4gDCVjVdQP5KKZrbmlS6w6cy7T
	TyyUJt2RaiRCinIroVwOemTsj4F8BWbYazzBbFtOfZzDsF5iRcm49R3Fu635GNfqLGnoy7+wQIJ
	eg5VXT4zjQ8IXbA1bhdLMS2gMCzM7Ilm2Ip04vVCbuGHdjwflw8UeYAVk6nposFW98/FRtlZiaG
	J0cUxyvdHOvqoeG+dEaMbZs5bZcWAbsraT232EQjI8SofA2lfpR3KsFgo0DQOkpCNymy72I8dRX
	XruH5vU
X-Received: by 2002:a17:903:183:b0:2b0:5654:ff00 with SMTP id d9443c01a7336-2b08270dd85mr19846135ad.9.1773996269206;
        Fri, 20 Mar 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
Date: Fri, 20 Mar 2026 16:43:45 +0800
Message-ID: <20260320084351.2461060-14-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014430_023897_416E53E5 
X-CRM114-Status: GOOD (  13.57  )
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

The device tree for the MT8188 Geralt is missing power supplies for all
the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
is currently not working in Linux.

Add the power supplies for the little cores.

Supplies for the big cores will be added once the issue with SPMI is
resolved.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index fc84dfedab03..7108bfa53ad0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -217,6 +217,30 @@ &cam_vcore {
 	domain-supply = <&mt6359_vproc1_buck_reg>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
-- 
2.53.0.959.g497ff81fa9-goog


