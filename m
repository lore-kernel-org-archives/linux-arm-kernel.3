Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B5C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 04:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU+48ZGdizWwg6Vf3muLEZWn/Xw0qRfPL7KyFAHNY70=; b=HTKt/Q/SniNHwizjnd+5/wQc37
	vhVzH/fHi8buqzzhZ/fHNG2qAoQNRHNUk6Tj3fiS5tphtKlFdUqrD1TtX8BwDlByERcsW3Jw1a0pS
	rJTLJULV2UV9UM6SZpyP1Hs5tayEClBCgiPOCPlgIzTsotM+taC7JJZV6vyELNpLwO0GVZjqrXTZO
	vMO/fYHgbPv15T03gAX4NW/nlfcLTKxTJy3by/NOLtw7J7nHjZMX3/lTRCpetcLbL/8JOCuXl7dgm
	puNfr99ZzA1N2omKRrVD3CRDqjgobh4t7jiNhXw4pkYLeys8U3u7dbnccf6UaFmaDKR77RQTHOtTq
	2In+aKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7S1s-00000009CnG-2kc0;
	Wed, 23 Apr 2025 04:48:13 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Rvz-00000009C7G-34ym
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:42:10 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250423044201epoutp03c8b8b7ccfaa40575903a265be23f9ca5~42OIeQPrg1326213262epoutp03J
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250423044201epoutp03c8b8b7ccfaa40575903a265be23f9ca5~42OIeQPrg1326213262epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745383321;
	bh=GU+48ZGdizWwg6Vf3muLEZWn/Xw0qRfPL7KyFAHNY70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5KzQvT20V75nF++sqrZJJ4gIpn+DN8lcpRhmFfTeKGmQzqShEY+7G/vmtLYzHrTQ
	 S4WlABprJT26WOhiErZjN5diFaDLCb0og1VLLNJwoD2pkjYoz1KdPbd46m6IAt/YL0
	 grBcqooXa/xZUxS0K3/SP2GDGFNwCONQYNt5RSgU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250423044200epcas2p484f196d630ab8125d4e7e49a93876bae~42OICNB2g0898908989epcas2p44;
	Wed, 23 Apr 2025 04:42:00 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj5zr3BwSz6B9mH; Wed, 23 Apr
	2025 04:42:00 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97~42OHAuRGS0820008200epcas2p4y;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250423044159epsmtrp1099ef836f0bd87678ba05c666c222b79~42OG-2F1u2437724377epsmtrp1V;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-42-68086f97e343
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FC.04.08805.79F68086; Wed, 23 Apr 2025 13:41:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epsmtip1ded9e7298e017afab48bec3f749c3067~42OGxJC5D1228512285epsmtip1d;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add cpucl0 clock DT
 nodes
Date: Wed, 23 Apr 2025 13:41:53 +0900
Message-ID: <20250423044153.1288077-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423044153.1288077-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnO70fI4Mg55bahYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKaFsoU3Cco2LLtBWsDYzf2LoYOTkkBEwkpk6Ywd7FyMUhJLCbUeLo+0lQCQmJwzMmMELY
	whL3W46wQhS9Z5TYdfMPSxcjBwebgKrEpt/yIHERgbdMEsv/H2ACaWAWOM0osfOMDIgtLOAr
	cXDFbVYQmwWo/vvE62ALeAWsJeavfs4OMkdCQF6iv0MCJMwpYCMxs2EX2F4hoJLJS75AlQtK
	nJz5hAVivLxE89bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93
	EyM4PrS0djDuWfVB7xAjEwfjIUYJDmYlEd5fbuwZQrwpiZVVqUX58UWlOanFhxilOViUxHm/
	ve5NERJITyxJzU5NLUgtgskycXBKNTDpCrXat04+u+CowoY3CxbLrdN2mnd3+mz3Sc9t+c2V
	22Vry761t/aXH9wt/G1z3fY3Vf/zWAT8rp6+xhXjszJze4zYcym2X6yWu0Q4JodG3VesPut6
	rTf6TW1YzY0L/JtlD57qunZf3vKKvLukg/JPteAvL19FL74d+aLdYoa1kBpv46+vk1kVk7oE
	85IyD/7Qf7jm08/6E/UHXW5e+/aC40f6WSfva42tqrzPWdffqJsaFH1KM3zlynVNl1YVnA9J
	fqTgeLo1V9emjWvr5neRfo7iN/6Hbt+lfizTSPXAp46vEiUHewNjltflTcsu/s++2nGOpGrj
	9wzuucZsIv4eEdKd9iLza56/OdXE+1OJpTgj0VCLuag4EQADtUwW/gIAAA==
X-CMS-MailID: 20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_214208_404661_9F14DF59 
X-CRM114-Status: GOOD (  13.55  )
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

Add cmu_cpucl0 clocks for switch, cluster, and dbg domains respectively.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index fc6ac531d597..23f077806db4 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -582,6 +582,21 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		cmu_cpucl0: clock-controller@1ec00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl0";
+			reg = <0x1ec00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL0_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL0_CLUSTER>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL0_DBG>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster",
+				      "dbg";
+		};
 	};
 
 	timer {
-- 
2.49.0


