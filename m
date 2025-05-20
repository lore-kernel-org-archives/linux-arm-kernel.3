Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A14CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=; b=VFdmUADxZ3YwYSJ20K3eacBuF7
	kxnh5VrT4GUVE9BSoIFqnOGGVvZSpySNK4JJhMYdlDRqjP23hoLeEdad8g1UUe1zJU0mbq0DpP2l0
	nZXzIH+33wHAYIYeYC+P+FvYVSlg5Jc5X6allk45P6iurbLUGltipMSXcrOwKOH109zpmtoXclRGO
	9zPHOHA/UmfP5S1Oq9K30WYMTJYd2bcCadb5STxwPeZZXjddUvLGhb51DiFSggHtc94sJ423PxWlY
	BU2XcjQGlpcz7VblobIzFfGoYxMTK1sZcYJmdHZHjsbqggyS3DMYVup4GzwVHbNiV20WH5uov2DaK
	ek6V4qmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKei-0000000CTF6-0E0p;
	Tue, 20 May 2025 10:57:08 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKC3-0000000CLGP-2JuP;
	Tue, 20 May 2025 10:27:32 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso36495015e9.3;
        Tue, 20 May 2025 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736850; x=1748341650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=ijo84PU3dVcfZ8jHujZ7IoTb9PF6+r8TzTJ1DchssVhyEMdtWAolTBunqmpHqS8MQZ
         Vv1cIfibtw3HxpAGtq6cld6zdp4oUj56UiKqulNcX1XobK6/1pxnecVT29pISSx4Iw8b
         Mz/agEQbZpHu1Z8djsw61psXC2SeEsbf/Agve8sDH7AJ9BRTtZKeNW0SCcwFtUagZKTD
         7ddS9CUlIiLoHZ1xONdg8/cMUDJ7vVZZ/F+7VoKepfp5DMnVzejupvthHJqeYiyTIzlw
         uHaPOgp4YpPHDhM8r3xabtzuCoy8iPBEjr0qXY6tO7A/nvKKSE9TC8SC0yed0dnwCzal
         DP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM71RTho1O5YHHOj5QjgikOk6FA4q8MQyNd2eoiJmFe/geoBPUTcJlnFjDt6Rt2k+wQRuJ+ueSmAbLjkGwswyX@lists.infradead.org, AJvYcCWYx+3yz/Wbb8dojunPNdmbIWuiUekkOB3X6969ucJdTCMFYrvZklvwZFZuZT0BcCxV18RXRiS0XhcXmLePpvo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuaU/Adk48gXAaQHb82jL0+V3A4dHlsz8zPKXkA3uqhk5i3P68
	vLue9C8ZGrvhTrjq6WVKD5JMM/7VH8HWWbjsRbv3gPTlBjQyPXHXrOgw
X-Gm-Gg: ASbGncuuzvAlgjoRAQegvU5vNOsIXKVWDdQyR6Qwa2QtczypWOH2kwwbg7mswLLqaHp
	NdEZW4m/a/HY3q5+1wlajaypdSbiYM9BrjLwIjRa1Y4Q5mKfvPUhiZUJCqC9IVdGiKWsU7CIHDR
	VF1ivXWzHIh7Qi2+v6vOmypvzwDf7hkrGljDB0eDhTrXLJWNkt4+SYuwrR/UOu5of9EK/Zvywxr
	OmxV1gmKZYdkZ+nsicq4iV2YWMn3hbdstH6ZMSltUITcLhIzLnEDIcy2nVs0i7UAcSPAqvdfeAp
	cgNoocQ/A4fV6hNN8Dl4GF0hspce1S9Qc4HfeA8JowH2/mouPQ0vmkyT9Ik6Qq0TVtfI6CkYccN
	ECEDSrsb5Uw==
X-Google-Smtp-Source: AGHT+IFaTNDTTs/HbVoDD7uNt9+VoHIWuf+2KdFCdYZjQ41F12fKv5MmzphIdTQmi2qfd3qs7Ll6jA==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-442fd64dfccmr154018695e9.19.1747736849844;
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:56 +0200
Subject: [PATCH v5 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-3-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250520_032731_597751_1B6A5356 
X-CRM114-Status: GOOD (  10.73  )
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


