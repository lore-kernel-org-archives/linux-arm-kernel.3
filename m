Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB3D31A26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=; b=Sw791myCCTfZ+HC3j+2tkApvGz
	reQKKlu6cUbDWOhdcpPd9W4104n9+nApdNLJeIYVBHKjWxmoiKKIr6IJXq9hBdCza+x1kLEuj58Jq
	3FMIYUdlTobSwkxzF5mEJ9WY42Ebpr6ZM5pvsNA4vfuEr2IhiyrkyH3Xmbs2CcFLwUulo1ZSU9Kqe
	tuwjDn4XiFBZRwaIPfowUbiZICqe3y5CmoOaBbgg7Yu6Cv9VaQeRi7tVHSKq5H4G/fpTEoVeSkZRl
	t4OT7XUdm3fY6rFYrV1eJtY9gixs7vrqapRNLWmvWBlfZq8SC5NlycbThBshyjva0CRr5WbA58AgD
	elCF3SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwXC-00000008Oh0-0BQ7;
	Wed, 14 Jan 2026 08:47:22 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwX7-00000008Oev-0bDU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:47:18 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so13946980a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380435; x=1768985235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
        b=M1SmqHdI6uEalY2w55VkoapuZiAkN6EPC6S8GSMTjMt3+nJ5hxlcQEmmSU3sNOyplr
         uLkDvlTbUzJ5gNf6eVdhIuI4mNZGZjOLS56ubuSUhwARQObH2Mw8haNFqVpIcfOqPdgO
         Tz2Cu+HbhnriAQmv1Yqgh2TqOwxF8xKhNVrKBPstyMxcTE6jNCVQp/9i4bHgl3+CBoUE
         u6Aiya8aF6qtoZW0KsjX2YoCnqPHVDOlnAGzTsoRw93neHyZ0HNJf0ABhXL4z8uGRgya
         JcLgcqat6BZV2wrVHvAzOb8xMjLO/hp/hUDZt8g3gE3BSm93sk5f6MjFMTvb4HaM5fSg
         ZKWw==
X-Gm-Message-State: AOJu0YxTBNg5CfH5aPP6KGRKhMLbDUcDlA6WPcjbwd2ZTs1CBWVRw2ID
	jNe0WHMwPRAL16G0/8ZhJh0KShp6Bomx02q2WdYRP6qTJVpsCHGu3Zix
X-Gm-Gg: AY/fxX7AgNWzBUs9wlVNcqgVV2IhGs8I+A6O7xPdCJ+mUSqvdG3bX2IPkaNlSe5/UWM
	hcNI3Rd4UilqheS7qw8V/0QUBIONVoilhHiwR5tCKv36+2Ugf7m7GwnTigSpGKyv2ZudRcsZd6Y
	dO5yMjsS2XqAOt0PuALHtncE/d9xU4Yi7z0JqhF3v8T6E+BbF9bE5twk+LxEipgptJ+2El/FIej
	Ep0eoQZJ0JYkTll9pZl4sJBRfA51tr8tvGuQStxg6fQ8ZQ7PpgGcsEh8uag24V4TSCYwjhi/kd1
	EUKmLfmUjQM7qY4AIjNZ3t9DLtJWEzcE9Cj4FifCTuBXGJ4dff0Awfuzl6Q2a6ixKTgijTn46ZL
	Hhcyn3abBm6dMXIizxg4KwV/cqNN1/hm7dtvw7crmLXgxm2BDVGO0aiVhNSGvUVV7KFdUE1rTEy
	8lrnQYitwC7DknrpUHIUL0ccKtxp8vye96vFhLzarPLmGYqog9vaGaj7o1
X-Received: by 2002:a05:6402:1474:b0:64b:82c8:e7b7 with SMTP id 4fb4d7f45d1cf-653ec45985emr1298237a12.24.1768380435183;
        Wed, 14 Jan 2026 00:47:15 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:14 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:48 +0100
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add
 memory pool for DSP i/o buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-1-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_004717_179796_F3B35723 
X-CRM114-Status: GOOD (  12.44  )
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

This memory region is used by the DRM/accel driver to allocate addresses
for buffers that are used for communication with the DSP cores and for
their intermediate results.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
 		no-map;
 	};
 
+	c7x_iova_pool: iommu-pool@a7000000 {
+		reg = <0x00 0xa7000000 0x00 0x18200000>;
+		no-map;
+	};
+
 	c7x_1_dma_memory_region: memory@a4000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa4000000 0x00 0x100000>;
@@ -151,13 +156,15 @@ &main_r5fss0_core0 {
 &c7x_0 {
 	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
+			<&c7x_0_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };
 
 &c7x_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
 	memory-region = <&c7x_1_dma_memory_region>,
-			<&c7x_1_memory_region>;
+			<&c7x_1_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };

-- 
2.52.0


