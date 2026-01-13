Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD1BD2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=; b=PKJCY65VC3GyQm7eMM/5/WuvDM
	4txKDXMEb54mVK8lNpYFfGj1yIHFIdlHOHKM5aSBJqgmOLTGgnv0ZhC1tysSRlJPGOp/k344Jfftn
	BALCV4Dc0itOIyaMmTvVGQ0MzBvkCrwd19gxsp0ZbjfJM6wUd5czt7uYpVEoIPJ+nC3gAgLDhXtd5
	eaRZGuIU7OaNksDgXe9p4/Q/nuEgDNOOK4AgjZF7ULhbU0aGpL1sDUI4zGiNGlpD/Q9ajtZx2w6/n
	rpPZkl/VY3TpJGkf4b2JKhinY3CBKOnS9S5fXIClxl+7+0AcZQtMkeoJKjPoSji0I56+b/zLI04TG
	zRA/fXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRp-00000007Y9I-0ZaO;
	Tue, 13 Jan 2026 17:44:53 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRm-00000007Y7i-1NK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:44:51 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b86f69bbe60so397052966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326288; x=1768931088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
        b=IdvvnoRrAuwJY3xR1eNy6cwDmvji+xcZrZWdysFHVut42c7IZQ3gkWjCZZ1qvYc4ha
         S6AFgZ57kV+gMwPBrY0wZ3zmlU7jzcGbr3v64XJmeaG4hAKjDvxbILM9DMa2TWG988T8
         yGC0qAXK4VDttcLKDijiNr73UpBOgjBxHKPS8XOzRGtuiTs+PRBqL6DVl8BL656SSRfI
         ZilkHt8giPsEiFcRcIcNexdMlfttLLXErX66whGEishe1CD8r8Z1TAsNXXMHTH03/sAo
         3KYT9FfWfQiZRtJ4Xh1ZuCqla+LILXsRLVmuxNloRi3HMBRnmMjMkmZ1qrppPCnnfVkL
         c0sg==
X-Gm-Message-State: AOJu0YwAgkGOusGkyxG5GOS2hNoXdGJjKIZU+Qoopaj7MnzZ9ZWieMEI
	sRxLkT2/H1L1qWRwnK+m+altVU5YG0Tov45uiSXyBOHqWt6VJlzLxbujuu+Hxg==
X-Gm-Gg: AY/fxX7dGiivotgzxZWJKlU525v6N3cbK9td0Tlcx3YbKktTaK0jgXsMcEPSUu7u+B1
	FtsntiKzCxNawYM3sjrnho+t1vujs6qrgPogMGQ4R2JySmU3bhG8tdGUtfVE+KM2UJ6ECruZeD1
	qOV3esNLStMR2lDhQkTD4cBdnnjWAOeT09uuC2u7d1S63Ks23xKJN+xBaxeo/01fpTxduH+fo9b
	xS5JBZcH3fzD7KDVfiM9HA4lZrqL9vKKk515n4E4Y0uEp0CzfhGDC5q1nDNW3gxvGxt9Lg9NTBa
	oBVDV3d1qOog06mUpivFKHwTFwagT2QOLcYQzh3F7RQln6st+Rr6TnSPs4O20VNpZsk/mdPMboo
	IiwtddC0fKFkX/KEFCShXdbwa7xKzQ4W/3c96r8aIBhKxR3R6RwtcGlGlqvcpW7tVJq5fxsNbX5
	/Yw5P8EsvHTrab/nVfGuM1A0RgL9gIm2Nrts/06Y0A1OXUgQ==
X-Google-Smtp-Source: AGHT+IE2YWlpMgqpFTSUm4yiwlEdYSG2L29zcJaQPD88F1bJ4MCCWbGfpor4ndxKjRsmJ+9m366jmQ==
X-Received: by 2002:a17:907:7282:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8708930758mr832434466b.38.1768326288113;
        Tue, 13 Jan 2026 09:44:48 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:47 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:35 +0100
Subject: [PATCH 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory
 pool for DSP i/o buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-1-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094450_381690_F45F7925 
X-CRM114-Status: GOOD (  12.63  )
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


