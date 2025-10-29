Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EA9CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=; b=FBYJ971vSzDw5Pdv94ShhcGfVH
	iiMHgGO27ZDm6vKdL56WWZzG3QPPcgioAcLtwj6oRwmwdZ1NKxWPr93jLgHnDoVNglW39vhbZurGQ
	LB6XP12UO05ADYnL8HdBGLmoFL6ccOGVoJy1PUQkgKuah4a9VPIq8Tvstvq+gXP8IFdhW4tDkIVXm
	69J85iCM3qf0VYNvzMfH3PSQTIxn/SY7GoOkkZQ0zam90aQ06q7QlO6P4s203DQOEIjVB24kTObH8
	muWeeKbuawtNWHfOjcH+z8XJ5U7xkmKlRGjs3nM6Z+Mu4JlXL8SWsi5QoCysiAxHZc/QHMLm/zNLC
	ZJcUjYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6fQ-00000001TCa-28qI;
	Wed, 29 Oct 2025 13:56:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f3-00000001Srp-2iMd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=; b=kXXZ2FWU3Jey/qeV3XH3YeOs3I
	S4MvybxFN+giMbyrs1Co/dVD4UFTyfd5v7NJJgQhyqu8ggF68VW5AyWyUcQ4AFtCkf+4OctrXKDnc
	SKVTp85DGp3uq6VPgNw0i9vKXEaDh49IJNC0ZhZEIlfgyJAbym9ENLeEgCnEOJHm+BI3AOToVKBCQ
	0UEORG4voxm/WvZyr0TJBhYK972d9yXYs5hIZQc77+O4YHz8V4dGOTOc/TE6GzfLpgkyoq5c5s5i3
	lm6OxboDFWH/wIWkIguPpBglhZXgh1FMcMjkCFhz8btDO0Z1fFPjYYfx5tn2J0BFnJABpExZVV7vx
	S1pVwQkA==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5nF-00000006uXt-0SnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:00:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b472842981fso299073066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746178; x=1762350978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=;
        b=PbjhB/fRyr8xGJtvcsvrb7EJ9nEIte7amKhIoNycCr/SIEto1Pq8mqqSCi8GLAaEPR
         oxB/k2buGjfBuGxmvzh8msrlwsWZnRDLp66d/AQRYpiyFU9pwaB0IBj48SIYvzOBRzzO
         fWPEmDxH0aMPJtZJ6GgUn2/L12DDXVMmplr66pC2QLiyM2p8tmIVwgWS3PXacCcm4imJ
         aRGWw1kd8fGx/IGxb8xm1DR/fMLIr/q5xlDhWvqYkCWMsSmoUbsUTdNAVfq201EDMxmz
         A8hr4c5+MPC4xFdqiTOF3y63xiq1Ds9cdQz+3Qo5fH4+chg4O31B2nUc60/1s93f+ihs
         v2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746178; x=1762350978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=;
        b=WBbqP0kJTPv+Tny2YbBmCpz/6uNjbLyj/MY6A4ESUrR9MogmBoxuoy3m4EriTam3tU
         0RM/2E2BzZEcY3ZCoXO+k8ZreJjvq5DXYtI9YMDWzMGyzU79lty+Mm5kNE/dkc9L/k7x
         Q36L9JVnelovhvFgn4I94CFtgjQyua/cjczgL9PVzbk9s8aN/lEGXjNYP18sQ4hUADQA
         zaNgKKrofamm9Nvmkj3UjmsP3uezh5aGGAgReOcN2hdMdS+ZxzTTX6gkjbro3v2c3IGl
         hYcyIkgqUDY1H5cwLUeRAKFUYmizhuMAREKKXMCDvziLG8OSfpa2L8l/cAjZbvtm/2Hc
         Hk6A==
X-Forwarded-Encrypted: i=1; AJvYcCXZCUyj2KUztShTZXxhAOGaa13tNGGYr/u3YJx+iwIqYwqWF5PhfHC84sg868x0wPA6OQbY6RRJgaFtQGhStd2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yznzhkhlc1fXyQToxqhZxCjq4vF6CmJz0jxxUPrWVxGpHh/yRhu
	rb5NgVz75IWTDWr7SEQlOsUXo+xWtANRES/urEilF1ObLFlNnLsSylAv
X-Gm-Gg: ASbGncvfsHEQiJKFtnjwi2sJ+QZcWknogLKqSNo7fG5XcYqSXPAWhCmOwGTvccfmz86
	IemUMlpVGJPyHH7X8uMSeLmQ+g2HOUYhtvtQH1/h7Nmcq96aDsCMyJBmB0JcghA4pEZAKsTwS/4
	oZS7c6unPbfURFRSNDpQuClYAG4f1I9ORvhUn/u2H6tc8sxICrmwIzQxzF57GAE6pNAoU6Txqh0
	JPzO490ZTJ8nxIv1KG+Wm0EeBBLYDa6g3IyqYHvhMnpWRhKVi9KhP5Xmsc3F2H8uxjyTIFUAM6I
	1iUQ79fPYxc9L0QGAKQxSO/lxIXpOIlP2aekGC7XpjZBlas4DJLsTAJWDcVYw0LAdvhmDvBFBfR
	T94NrUNy3pv+bzDbHUWfFNmZa1joWnUqHB/n5pdF2AxgsthZSlpa0dpbMEfLnQNCfF5Vd9m61z7
	NB0Bs/1VtP6ZXU20PL6/kOcEZPdQ==
X-Google-Smtp-Source: AGHT+IHh8OQ9HuceV0x8UwkKlSqVAt2/vQfWGgDAkzGZJb3jVpWZ2ATrrXxIPTpiHa8TEAAPPuvBtg==
X-Received: by 2002:a17:907:ea8:b0:b6d:55ce:fd29 with SMTP id a640c23a62f3a-b703d4d6347mr263106466b.34.1761746178397;
        Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Wed, 29 Oct 2025 06:52:29 -0700
Message-ID: <20251029135229.890-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_130049_260018_96AC5FC8 
X-CRM114-Status: GOOD (  10.37  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "bus", "core", "plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0


