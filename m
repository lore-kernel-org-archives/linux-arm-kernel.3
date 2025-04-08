Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9927C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=; b=mflOvX42sUndVabEJHHmSk3HHf
	daRZM6zOcZS5jrYA4Om73Xd8ZXi9ZrzXCW80UELTaDprSIGwxSHXduWOm1RUszVEx37CutO0v9k1R
	Pw2Gyaky9xhQ3pxBETZ1M+xEVoj9PrTSg1wf4iZEBEh2IEpNYCM+cgjC/0VP6+i2WKS3OJPKcYOHq
	pyPEALVraEPgz2uJZ+M5tOYbJrlB32gVaQcXVq/FrWFSEpMpQi+MMDMjv1JcYN7NkWqZa8JpU/9HE
	AXQPDX3O2kOE3d4slymwm5nWjGSJKpBbWWTE3apINCYlUaQCE+R6Gl6DxdYJ5EWULwb5+g+4Je/Mz
	kzIjvhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Hr-00000003Rx5-3hMf;
	Tue, 08 Apr 2025 09:30:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Av-00000003QOe-0iUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:23:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224191d92e4so49159445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744104200; x=1744709000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=VqRzcteSR5MEBGl/6aG0GyFzdhRObtO6YMaSYuBzZ9Hzqex/g7LcsANQIyfArS8fas
         YVw5fhtRwC3nXpDo5WkVLtr7yg4/fwXGllJRPMo9z7JxDu8Ly4PTxdhvBRjomOkFg1Y8
         sXx2+Ypt4qaT8cD/b5bSJEqev0jCISUzhyPVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104200; x=1744709000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=DPpa2cn07YrinJ6jqAXjYDu6uzWf1ANLSpwvaiwyupirYlzYjt2yWen2Ze4c47fbrI
         XxrHxDoW+T94vvfrkMC06MW3FSax57LPcEH5Ad1CLzT/3VgFfTbmGI3JuCZmP+6Ny5nU
         kJaR32yv3cOy0Di97bmoM5KLOriby0lXdXpOTmNbCVRcEcIsSCaSuhPGePfOQMy0A24R
         MNNYOh4bqoL1+2TIMC5i5EG8FEO5mA6V0MRLEuRICq2hpRxKUNdIf5z4anLfpZYs+BOL
         eBcTEwlkFBVUpDrXWw7TyxmcSoQL/BZdf9gZ4YpGzAPcJl49BgxWYOrxILuCZkuCo/s2
         WQoA==
X-Forwarded-Encrypted: i=1; AJvYcCUBc5ksPaguewtkNNzJJsI4Al1fN19fI04jL5GYY59f1hYjB1KJfztgrH+VMCKgnvj6dAGXx/APUjpJaATHLnuI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxit1UjoU6QabTT2AZrf8NjjcUQhAUygYJJ+PQ8Xd5/e/uZaGkR
	ySoxS+Afez1cyBePgIH2ng/b/hQf5vtu8lNMwgHt0b61w5LrjmPq4N2Krt01rQ==
X-Gm-Gg: ASbGncskwWWLVQd/GT96eJ4467NZM6P+7cJJKHJgzirGqj9OMbeqiZktLyTid9O8ovK
	59sUH53g1jnmmq9736mSXibI3Jik9bzfhmBu2BRFlbROyZMCwPWan+xifAlbwRVstFZefmrkQXb
	+4P8xgT97dUQ4W9AynqxTTr86UwzK8itNbgXJ6I+Onln91dId7/nVgNfw4LTTw0NFaw0cgsg5PM
	z7ygQs3T75sGDPrw0imy7RBNfdQ7I71xb51Fy/7a49WgIiO6O/T+xfE3/0qyIeRAAAXiBwzAV2R
	J3w7pLVS9Vp8lp9jTy8xv6dxirDmaD+wSEl67Gfn6/Fiw4oX8FpPvnT8VNvEHHg=
X-Google-Smtp-Source: AGHT+IGPhkSRb5R3PVNGCzYv1a6SJZoNU3t0aIi0QTJm3JWsa/HB1uZ+jzdpdKOIXFpq6puPuDXpRQ==
X-Received: by 2002:a17:902:da85:b0:224:f12:3735 with SMTP id d9443c01a7336-22a8a06b38dmr169101945ad.31.1744104200152;
        Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:79d9:c941:96f6:ac1c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e477sm95651655ad.122.2025.04.08.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:23:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Chengci . Xu" <chengci.xu@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
Date: Tue,  8 Apr 2025 17:23:02 +0800
Message-ID: <20250408092303.3563231-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_022321_240212_9433CD71 
X-CRM114-Status: GOOD (  15.90  )
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

Based on the comments in the MT8188 IOMMU binding header, the rdma0
device specifies the wrong IOMMU device for the IOMMU port it is
tied to:

    This SoC have two MM IOMMU HWs, this is the connected information:
    iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
    iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27

rdma0's endpoint is M4U_PORT_L1_DISP_RDMA0 (on larb1), which should use
iommu-vpp, but it is currently tied to iommu-vdo.

Somehow this went undetected until recently in Linux v6.15-rc1 with some
IOMMU subsystem framework changes that caused the IOMMU to no longer
work. The IOMMU would fail to probe if any devices associated with it
could not be successfully attached. Prior to these changes, only the
end device would be left without an IOMMU attached.

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys0")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d3858..29d35ca94597 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2579,7 +2579,7 @@ rdma0: rdma@1c002000 {
 			reg = <0 0x1c002000 0 0x1000>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
 			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
-			iommus = <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
+			iommus = <&vpp_iommu M4U_PORT_L1_DISP_RDMA0>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
 
-- 
2.49.0.504.g3bcea36a83-goog


