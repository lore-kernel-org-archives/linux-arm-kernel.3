Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A4EC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=; b=M+xu8fSAEDQZMCh5sVv9AZdg2v
	JkeUFPp99AcCNvHeLKCK1ZR1aJDCHqsOsR4kDuHmYEyAo6cB8bO3vW/rR8vWGXL7jHgaG6nxkrfWB
	RDflj8rYmgNUKMKbFnADVINsmICzvVD9Ap7Xl0FHAVPfZtdf4KA8uFCSZDpDbW2PKwWbxLzemdWY/
	Ljdm6X0j2SOtj3s4CuXeHrUpGVVG3TVwy9dzRCURiMJ94vYGc//VhNNL3ywCQxhB774ahdQgl+nmr
	dGI67H7q2/LixS9j3rpPKL7B43JA8kFpuUuChLtA/7wxxpumSe1t1k8fnB1fHKBaK25KW2W9/vFQO
	LhSD7VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj8P-0000000CqJH-0C8E;
	Wed, 04 Jun 2025 08:06:05 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj05-0000000CoU4-31og;
	Wed, 04 Jun 2025 07:57:30 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso5106152a12.1;
        Wed, 04 Jun 2025 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023848; x=1749628648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=iiWo0gCjK9sDLDNtA56gU910a+u1kYJSyAejda1awjC+l2ORUSm/kWCi/C0a4JIrVP
         0EoBSs+ctjyZAn7y+ntV7vPw1wsmpdm6TP8haD2tHIiqJnvO9TfdLXQ15b+LjdRLKl81
         4wDnYJ+K+nL5aSo9HkTmANyE9qNqBS6o3YrREvyzk1drFVIYrJLMlNBS5rWZm9QYNVrE
         eGrL6zzeOQMOT+4AbEN2YaaOTQKbcqIhVE8tSrwBpmj/Tfk4kone+8+gp+6uJ6+ggXkO
         0mu8pfJwQ2eAjwCutbn5EbB+wrcC3QbkC6vfsSN4+aGoqyH1c4StZTnBTNwWWFl6Qqzk
         br5g==
X-Forwarded-Encrypted: i=1; AJvYcCUeX/aIGV3pndTxAInQo1BrzswRME8DYFaUpb/FSGjV0TNxthe5Zai8wORsvRTHPMxKwKNQaMMtb+ukfWqfEvo=@lists.infradead.org, AJvYcCVvSu3eDRTElagAGtcvcaJgzCeNdVjp/v7jDH839Aq8fmRxLqEo0iVy4yvk5gG2EAQPP2/chnjUd+XN3aHN6WME@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/I1WCso+2RT8zBSmyaCKP5jy8RkKJpcJhZFJ5994ierKBPeOM
	plxWOVirFu9dn9Xe0pnFHMnCkH5J2U2KxRgUuqVVmAsdTxBMu5kW1AR07qc2j6WE
X-Gm-Gg: ASbGncv0UV35VPxGMn2oevYbBspikoSTQJp3Kj/caQYumygNzeSd+Fhvs+d1ieNxWpb
	rlOmIdIWYKzdv6H1dBve92XD6mp3tgf8LEDA6xn6cgi4Nr8p9dzv2OZMBQQl2pK30/rEoHGE3aO
	9jnprGlNdgZMYG/MxicDnCCHZVAHoUzg+KWLknveEVjmAxTnE7jX+0CifwfWDevDsF73X5pvoUK
	ndCVegeddV4QAacHvkMw1nfuyUJsnmGei3YlWSHE+/FxYlD2mmknR/vkTRgQlQwIU2P9bWVnlwM
	sao20Qyrovcb3zorurgujWzLyuvV4ErApeP+07Z0IEXCPHW9pmPXbqi7eIfLkrukrGAzGuPSxUy
	TzlUljmKhUA==
X-Google-Smtp-Source: AGHT+IGEU6JSHhOsqaZUgh9IRrRp0GWAjJJWZO/9WRDdIfgcT6aiVd16m1f2gcnNK7ZFqAce+m67Lw==
X-Received: by 2002:a17:907:1c26:b0:ad8:8529:4fa5 with SMTP id a640c23a62f3a-addf8fdd025mr150851166b.46.1749023847871;
        Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:16 +0200
Subject: [PATCH v6 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-3-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005729_763948_CD1ADC4B 
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

Enable the nodes added in a previous commit to the rk3588s device tree.

v2:
- Split nodes (Sebastian Reichel)
- Sort nodes (Sebastian Reichel)
- Add board regulators (Sebastian Reichel)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90bc7970418f60276 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
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
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


