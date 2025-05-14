Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71421C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV3QvTlWfQTkDjPmndYOu91G7Myw8NKGakZkfON1fQE=; b=Acmfiw7+XWAOYb/opRop6xwyhu
	tAFwrUzMKL1q50FwB97ijcbhJJYSa6AJ82c/D9IRcFQGuaMncdYITO9b6uHRNIYilBeRh763UpFne
	B4l4pa/KUWzG3ZnD7SwmSJtOiHaB4n/Bgi3wkLQaOLITfrz5Ft2/EP/EGzuec6I9mjlMj6QY5MiiY
	HkCR37L1WUmRxaECZb/6tGE5s6SbreiHD0DfCNHvL2CleXR7f8LXgNCQ/5kbsMh8fvJ3BKgVWuPrw
	7hxskp52MnYro1ySImpHRVNQEB7FKqrxCJ/gPrNI/fZTe52svMDsF+Ypyabb59uy+NtLj6SkhWWC9
	101FHU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFE1P-0000000Far3-49gr;
	Wed, 14 May 2025 15:27:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiC-0000000FWTK-2FoD;
	Wed, 14 May 2025 15:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RV3QvTlWfQTkDjPmndYOu91G7Myw8NKGakZkfON1fQE=; b=T4T7ZD4XZpkFO3OTZEVDpVyfdq
	6zstRzorNbhtOXb+YQdUdwsOf6W2apZGyQmrenNvDrbQL9Uf2t5Pz8uD8FDEjrjWqioF70u6CC31d
	jV5MZQAyfLPYTg27Wt6WuZHp4aI9lZ4U4aWm/oANnmnDoeeAotdxmD+KnPe7mTc5pyxlhiRQUVt7Y
	3i4brT1vxjTGXbVf/DraRqBxaJa33L48JRTqkVe7SQ8SqhNHZqw2CKv3CQQt8FcuA3YtM5R5xgv3U
	Wz3LmukYOud+EogMll1tRRkZTyg6IgZzt/+BpaX6ObE5C13MKJ4Y2eOCUKT5zY4y5JryZ84VVBS30
	e836DqCA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDi9-0000000HE2h-2mfQ;
	Wed, 14 May 2025 15:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RV3QvTlWfQTkDjPmndYOu91G7Myw8NKGakZkfON1fQE=; b=U/5UTl7kW20dUxg3as4vjPS5Hm
	MoFDma9yUdEFw3cV6sSdF+lfu6QWthYj+l6rwQ2DaExqVA0ecSq+EOuoHCtCEKCcbEVusodO6Iaie
	DWJaWssg0K9QRJG3jZQLZdwQYpbVFEjaEH+QXh79P/dKODWx8jHtN0o3gL7ve1FWtaHqk9pAALaYf
	/ZtEMjZiNtO1gtZjntKoS29tV4L1loKXlwsEXSjpnmvocwQvkc/dnhN1m91jrFr0M8XUI//Xgihnt
	R+VEQh+gnxibHZKXW6M+IUFb5LIiOfk8KyKltOZSanQiM5LkWL4D6JqiZ0Ggg6k8POdt5shFsz+Dc
	VMhHi8Sw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDi8-0006vE-5C; Wed, 14 May 2025 17:07:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4 1/6] arm64: dts: rockchip: add basic mdio node to px30
Date: Wed, 14 May 2025 17:07:40 +0200
Message-ID: <20250514150745.2437804-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_160757_936450_CDAF89EA 
X-CRM114-Status: GOOD (  11.57  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Using snps,reset-* properties for handling the phy-reset is deprecated
and instead a real phy node should be defined that then contains the
reset-gpios handling.

To facilitate this, add the core mdio node under the px30's gmac, similar
to how the other Rockchip socs already do this.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..feabdadfa440 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -985,6 +985,12 @@ gmac: ethernet@ff360000 {
 		resets = <&cru SRST_GMAC_A>;
 		reset-names = "stmmaceth";
 		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	sdmmc: mmc@ff370000 {
-- 
2.47.2


