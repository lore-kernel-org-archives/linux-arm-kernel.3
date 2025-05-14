Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CCEC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=; b=aMZaPfhgTdctWeZeQiv3dPuhF8
	FZtNxwCSvrClb8g3466hXw8vB7dG7Ofn0WIsAmtd5Rx2xKnYYxF+H8tpFgk9TD8vt5hTlzZInW6l/
	YdJ9M0Zl9GkYsB+87cshteSJyF/aiHpPjOfHY6nlhsn5WyWmWs3I1EM1EahI6sptiBBl08VTUG5n4
	r5/H5hxbvfvfh/87v5aYmkWPclDcpEf9Ezu3IQ720LUXXf3bqfQnugrITfz4wAvSZarPIit5RppPV
	2liQfb1625c6HKhqMeEQ9DiB4bCeafe0dPWXXU541KNl3FxZLhny4/eOcfeVfNTFH2xCe6FkNOEZm
	pZxGSMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDKK-0000000FSER-1IO3;
	Wed, 14 May 2025 14:43:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXT-0000000FGjk-33E2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 13:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=; b=jARUt1ksGpklSAQ1bGKH80shwo
	9VuJhlzhxX7xuS9VYTj2DpYHipcorYvjlJansu+vaFLOz2wjpfoTdpgwUGFURfI86LJHJhZPfu6F7
	RvU5Ydc8XV+lGolHnZdaVyWfn3mg3oGgwUNkKkn+00dc2cbaE77pr4rmM2ylNnFU6V3japZT7DVLp
	a0L2rtwAKCwA6snUCHxXdx/FMt17Lk56tJSj1kUU5kwuZHlxw+twx5ZuKXI8rK1LbAsRF3nFUuPxY
	Bf4TYqG0y1+gTveFX0Br2rXOsp7RB8LU5bcRB0Z9FiHCthaO77HKSMMIA8Sw5oTVnjyq1GPXZTf6E
	GtGZhl7g==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFCXQ-0000000HCF0-199k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:52:50 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250514135242epoutp03de1b18e959f9b0e073229c4584317931~-aR8CbH2H2840628406epoutp03Q
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 13:52:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250514135242epoutp03de1b18e959f9b0e073229c4584317931~-aR8CbH2H2840628406epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230762;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWHXu7GU4DodhpP21c0owWh81IqdK3akqHsSTo555BlTK6RSln4LIHHSVH0bVf+FJ
	 0b+/niCp/EE4DH/Nslvd0KkURVvHgenmh3kfh5NIywxvPsmHACnlF+nfYTAl1I+aL4
	 DtyVhBBhJ+QoUc4L1LJC3fBMg7CyNtAhLWvO1kLg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514135241epcas5p1c532029629ae732c7dd6c2ed2db26353~-aR7f6P0V0362903629epcas5p13;
	Wed, 14 May 2025 13:52:41 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyFCW6JtDz6B9m5; Wed, 14 May
	2025 13:52:39 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88~-XAZkOEZN1927219272epcas5p4H;
	Wed, 14 May 2025 09:52:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095242epsmtrp1cf1ae3b2305367497a64be3bf5ea5ed6~-XAZi_ipV1927519275epsmtrp1a;
	Wed, 14 May 2025 09:52:42 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-73-682467eac1b0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	11.9B.08766.AE764286; Wed, 14 May 2025 18:52:42 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095239epsmtip24e9d87979a0f3e94d227111f61c1db9a~-XAWwEijB1817318173epsmtip2M;
	Wed, 14 May 2025 09:52:39 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_HSI2 clock DT
 nodes
Date: Wed, 14 May 2025 15:32:14 +0530
Message-Id: <20250514100214.2479552-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514100214.2479552-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXvdVukqGQet/E4sH87axWUz4EmGx
	Zu85JovrX56zWtzbsYzdYv6Rc6wWjTPeMFmcP7+B3WLT42usFh977rFaXN41h81ixvl9TBYX
	T7laHFsgZvF95R1GiyNnXjBb/N+zg93i8Jt2Vot/1zayWEw+vpbVomnZeiYHUY/3N1rZPXbO
	usvusWlVJ5vH5iX1Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWxf3InW8EDzoqrvVvYGxjf
	sncxcnJICJhI3Nk9jbGLkYtDSGA3o8T2PU+ZIRISEvv+/2aEsIUlVv57DtYgJPCWUWLFixwQ
	m01AS+LK9ndsIM0iAl1MEuf+vWIBSTAL7GSSWLleAsQWFvCX2Lj8MFicRUBVYt32PlYQm1fA
	WmL9zC8sEAvkJfYfPAu2mFPARuLri8vMEMusJVpezWGCqBeUODnzCdR8eYnmrbOZJzAKzEKS
	moUktYCRaRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnCUaWnuYNy+6oPeIUYmDsZD
	jBIczEoivNezlDOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJx
	cEo1MK3b/HpX2G6R0pszorWnbry2MKH1zKIbQQ9WiE7tsorvD/4puyXq89sc/wtdNiHThDel
	Wu1++33dg0XKsU7LNWRWdkrft9meu/oo+z+rllnXFwQ/P9+7dOW7mVz8tzZJZ+Ye8BNebPaw
	/qO4nUT+vGuSfwRiZiuozcgzUz5XJN/vtvFp3WGh+eK/ru2XS0+YtuKb7Xcd05ZnzE9/aTlv
	Fbi2bWpJq8oiRq7983rkWxWzOd5G/Tntbt33zsvzuETqbq4e89vAuCp++6eRz/f3g5hF9aLt
	QtY3Gn9vFKheONP6Eee77+8+nQv7s4J1yS+1XS8m972YJHvnpZy9x8PuzVuv1VuFfdZcvusN
	41sPvTlKLMUZiYZazEXFiQD/aOo/IQMAAA==
X-CMS-MailID: 20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88
References: <20250514100214.2479552-1-raghav.s@samsung.com>
	<CGME20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_145249_171992_C367F656 
X-CRM114-Status: GOOD (  13.44  )
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

Add required dt node for CMU_HSI2 block, which
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


