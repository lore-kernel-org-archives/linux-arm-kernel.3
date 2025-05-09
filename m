Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358DBC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=9orThWdcg4TfeCb68m3fWgyEG197G9T1RDce0h0a5uA=; b=CusxQ4HxsvZl5e0YijEbRrn4/5
	DEgFATM51rQbZVX6RRBGtwGogy8IQYWeUuTLro3LTZEFqzhPuoGeZnORCnAHLLMWxezbLYCLQj3DC
	aYIH74E/37mZxBtNexmG7DdzSU3EYgrcKPYnUBVhITddttdPco30l7lyeu1XwyAGB/v14UNkHCD48
	aHXYL4RSrPfaHG3VV1CS4PPaQ1UtCf72aHqP6FhyHTDNM9hKhPH3uDeEMT23CRHb6Q+bzd+6gyq3f
	Zq8dxOpJam0Cmo4+l5NOWHx+r0SiuZrE/IFyx25iarUa+kMLIRv9PkEWiAWqmZB2JITSda5FrZ+E6
	h0aRRhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPAk-000000040cc-15Hf;
	Fri, 09 May 2025 14:57:58 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNkm-00000003lFy-1RVG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:27:05 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250509132659epoutp0221e574c7f61229f94458c6433a5fe772~93tDYQm462005320053epoutp02y
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 13:26:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250509132659epoutp0221e574c7f61229f94458c6433a5fe772~93tDYQm462005320053epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797219;
	bh=9orThWdcg4TfeCb68m3fWgyEG197G9T1RDce0h0a5uA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HBGd+7RXyKFZPhGvlTXAm5cLH6As1zREh6WO9+t7dIApqPCHKfLcy+30BYezUeWPH
	 xhCqFqcyLW/3JtRR48IF0PrMyf4rkiPZBYG2MT29EuZFWyr3Hbw7zasKCwHJw4x4k8
	 RrlIUVJ/ebH6XBnHcNxBAMUKcKpsXI5X21zj5hdk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250509132658epcas5p45a1007cfff2905bc97acd87677fa5847~93tC9pACw1072010720epcas5p4g;
	Fri,  9 May 2025 13:26:58 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zv8t85sWWz3hhT3; Fri,  9 May
	2025 13:26:56 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250509130035epcas5p36c784dcbbdcfb708c12fdfc67eecfb49~93WAlvygu2907129071epcas5p3p;
	Fri,  9 May 2025 13:00:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250509130035epsmtrp1d9f4ecc86751fc60e10becde7fe6b153~93WAa0Kj82367023670epsmtrp1D;
	Fri,  9 May 2025 13:00:35 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-52-681dfc736428
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E9.DC.19478.37CFD186; Fri,  9 May 2025 22:00:35 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250509130033epsmtip17d7ab81490e1f620e35079b1228d4163~93V_qrznF2009420094epsmtip1k;
	Fri,  9 May 2025 13:00:33 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] arm64: dts: exynosautov920: add cmu_hsi2 clock DT nodes
Date: Fri,  9 May 2025 18:40:16 +0530
Message-Id: <20250509131016.3173048-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnG7xH9kMg5NzBCwezNvGZnH9y3NW
	i/PnN7BbbHp8jdXiY889VovLu+awWcw4v4/J4uIpV4tjC8Qsvq+8w2hx5MwLZovDb9pZLf5d
	28jiwOvx/kYru8fOWXfZPTat6mTz2Lyk3qNvyypGj8+b5ALYorhsUlJzMstSi/TtErgytr+4
	yVTwgLNi64/v7A2Mb9m7GDk5JARMJO7vfcjUxcjFISSwnVFi3cQXUAkJiX3/fzNC2MISK/89
	Z4coessoMXnjF7AiNgEtiSvb37GBJEQE1jBKfOybD9bBLHCGUWLmRCEQW1jAW6Lj8hs2EJtF
	QFXiyoLfQM0cHLwC1hKXrnlBLJCX2H/wLDOIzSsgKHFy5hMWiDHyEs1bZzNPYOSbhSQ1C0lq
	ASPTKkbR1ILi3PTc5AJDveLE3OLSvHS95PzcTYzg8NYK2sG4bP1fvUOMTByMhxglOJiVRHif
	d8pkCPGmJFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTDtPnyt
	z0nUPojzf8HL7Y+n3bh4QObYbYaGWJ1aubp5F+8q1jQt4/OQ2hbI0PhQ9AjzttdnNlxNMhZl
	j7tbofJe9sWDPXMY/3jPMbC5LSh2ol7VJzHx46pXPVETbT8t1/1rtHLf6VVT/VjNTWIzXh6/
	9uXlwcc3vseuKJrmZvIoMdLhn8LO5Tu9g/ZVuv/cs4YryVfl2oKdt9b1Szh69RlcfBd49ffc
	R7l73p7PkrE8G7BvR1wh4xzvTiadM/fkjtgX/LwvaTDnzI0zrvInzea7T7upMHG5z3796w89
	tkzIe8/De+9MtN2/CRPfeGyS31H24eUqlbS8m6dkm0LzlJWuhe2a6iys2bmT+dIk94NF/5VY
	ijMSDbWYi4oTAQE3KkDeAgAA
X-CMS-MailID: 20250509130035epcas5p36c784dcbbdcfb708c12fdfc67eecfb49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509130035epcas5p36c784dcbbdcfb708c12fdfc67eecfb49
References: <CGME20250509130035epcas5p36c784dcbbdcfb708c12fdfc67eecfb49@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062704_687631_0F106A51 
X-CRM114-Status: GOOD (  13.08  )
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

Add required dt node for cmu_hsi2 block, which
provides clocks to ufs and ethernet IPs

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..7890373f5da0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi2: clock-controller@16b00000 {
+			compatible = "samsung,exynosautov920-cmu-hsi2";
+			reg = <0x16b00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ufs",
+				      "embd",
+				      "ethernet";
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1


