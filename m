Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3285FC02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLWASrFa29Q0aJ8RgvPnTlSszHSM+G/gv+i3GP4pQnU=; b=sDNZ2gvYp0MsNQC2Fc8QAK1izD
	QPT/QaPIjZh3gnbHv+LHxn3E3fvRJBHdaIYUcapIv4TfdONWiS4GAmJZHhkBGCY8jGoGR6wrB3mbK
	++gS0Mj5c5itInId7wBdzwMUUE8Ht/O5TFOgUO6sm3LKgEG1+gFStVVR0AmEPNZnJ8eYEVki1zj6X
	3g8eTUnEYFkmNMzC7hAw9HOBNySFUSx9hLMWL15XzVR03SwhV5geQFwWOwlyHBmMJXjCpEcoOzjJQ
	ZWA1yl252xqLVbGbBpyWwj8UDcBhdl+mGIcyAXSeNPhSwTRxM8dIAhgSa30tuDycBg2pJD9GGXRko
	N/K9N+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCB-00000000sRh-01Ll;
	Tue, 04 Feb 2025 15:50:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKz5-00000000qKt-0t9M;
	Tue, 04 Feb 2025 15:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738683404; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jlggb8fTFANjDZEgljs5b4UWgyLLGXCA65os1qnPJTI4UjSZ7/3K0cJyfFjdBPnQViD/yeJyzDfCpdsOWlcEnFc75dxBiQ56G5Zz7GIR4QK6EYI8L8nfkALouAeJKc3qhhvGOhDtQwtCWOIIso8ZbQfMhRKD4XCqsOFLIIi9RGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738683404; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cLWASrFa29Q0aJ8RgvPnTlSszHSM+G/gv+i3GP4pQnU=; 
	b=MV7YLv+0TwJ9R6MT1xauccgHlQL8T5q/8dt/svTxtsEvpIARIA1lvjjCfyp5bfC2nt/kntA6tbGx1llHOHRC1IUySfodxHqOG6jJHWkoZQ8X/fEIk6pJIBw9/EHBi67NYvn0hmzMS+7XIj5IOLlD7m0GkOvjoejyTpqxbUxK98Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738683404;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cLWASrFa29Q0aJ8RgvPnTlSszHSM+G/gv+i3GP4pQnU=;
	b=VqiOQIoIx2bwtEZpqxAWpm4Jya7YhOXf3sPk6rS6DVGtAjTbA8YiZ8mjuB7TI/2x
	zT4bxlSUPoWcSb1nvxc1+77RX+gGwO3awAIV4pfOoUA6GhXokcNDJlCG/VfoyuHSJtL
	1hr8xwdmy2HB5vMpKKvW2BE5KKim0GogLvRpV2cU=
Received: by mx.zohomail.com with SMTPS id 1738683388528327.5051525050993;
	Tue, 4 Feb 2025 07:36:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 04 Feb 2025 16:35:46 +0100
Subject: [PATCH v2 1/7] dt-bindings: reset: Add SCMI reset IDs for RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rk3588-trng-submission-v2-1-608172b6fd91@collabora.com>
References: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
In-Reply-To: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 XiaoDong Huang <derrick.huang@rock-chips.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073707_331488_8748724D 
X-CRM114-Status: GOOD (  10.38  )
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

When TF-A is used to assert/deassert the resets through SCMI, the
IDs communicated to it are different than the ones mainline Linux uses.

Import the list of SCMI reset IDs from mainline TF-A so that devicetrees
can use these IDs more easily.

Co-developed-by: XiaoDong Huang <derrick.huang@rock-chips.com>
Signed-off-by: XiaoDong Huang <derrick.huang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/dt-bindings/reset/rockchip,rk3588-cru.h | 41 ++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/rockchip,rk3588-cru.h b/include/dt-bindings/reset/rockchip,rk3588-cru.h
index e2fe4bd5f7f01569c804ae4ea87c7cf0433d2ae7..878beae6dc3baaa9a2eb46f7a81454d360968754 100644
--- a/include/dt-bindings/reset/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/reset/rockchip,rk3588-cru.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
 /*
- * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2021, 2024 Rockchip Electronics Co. Ltd.
  * Copyright (c) 2022 Collabora Ltd.
  *
  * Author: Elaine Zhang <zhangqing@rock-chips.com>
@@ -753,4 +753,43 @@
 
 #define SRST_A_HDMIRX_BIU		660
 
+/* SCMI Secure Resets */
+
+/* Name=SECURE_SOFTRST_CON00,Offset=0xA00 */
+#define SCMI_SRST_A_SECURE_NS_BIU	10
+#define SCMI_SRST_H_SECURE_NS_BIU	11
+#define SCMI_SRST_A_SECURE_S_BIU	12
+#define SCMI_SRST_H_SECURE_S_BIU	13
+#define SCMI_SRST_P_SECURE_S_BIU	14
+#define SCMI_SRST_CRYPTO_CORE		15
+/* Name=SECURE_SOFTRST_CON01,Offset=0xA04 */
+#define SCMI_SRST_CRYPTO_PKA		16
+#define SCMI_SRST_CRYPTO_RNG		17
+#define SCMI_SRST_A_CRYPTO		18
+#define SCMI_SRST_H_CRYPTO		19
+#define SCMI_SRST_KEYLADDER_CORE	25
+#define SCMI_SRST_KEYLADDER_RNG		26
+#define SCMI_SRST_A_KEYLADDER		27
+#define SCMI_SRST_H_KEYLADDER		28
+#define SCMI_SRST_P_OTPC_S		29
+#define SCMI_SRST_OTPC_S		30
+#define SCMI_SRST_WDT_S			31
+/* Name=SECURE_SOFTRST_CON02,Offset=0xA08 */
+#define SCMI_SRST_T_WDT_S		32
+#define SCMI_SRST_H_BOOTROM		33
+#define SCMI_SRST_A_DCF			34
+#define SCMI_SRST_P_DCF			35
+#define SCMI_SRST_H_BOOTROM_NS		37
+#define SCMI_SRST_P_KEYLADDER		46
+#define SCMI_SRST_H_TRNG_S		47
+/* Name=SECURE_SOFTRST_CON03,Offset=0xA0C */
+#define SCMI_SRST_H_TRNG_NS		48
+#define SCMI_SRST_D_SDMMC_BUFFER	49
+#define SCMI_SRST_H_SDMMC		50
+#define SCMI_SRST_H_SDMMC_BUFFER	51
+#define SCMI_SRST_SDMMC			52
+#define SCMI_SRST_P_TRNG_CHK		53
+#define SCMI_SRST_TRNG_S		54
+
+
 #endif

-- 
2.48.1


