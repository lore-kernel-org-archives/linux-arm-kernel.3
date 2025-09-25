Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31998CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emDBLi0S/XbmKkKrMOpftjZrfm/X9R0ePHepVQNumuQ=; b=gcKQ6NaKDjQ5NhXAYC/j6zZIIJ
	aTPTCOhWmoLop4XtZJSNxTihUB/WuD8yxusSWf46i/9FaFRVNUiXqsP5/bv3ewZy/yBBGgsKSCa6H
	lDMiTlVI8PZ5HrEb6iUziQywS6fXolM1rr4HhWDHJMajb66j3Dg9DoxNTHA3LlzJA/RItF2w75CT5
	V9sDo2OAuusuTL4S2x4PkwbQI8Yp6ITwiaL6bx8gfIfyK1mIuRtwRxei9uYGzcI1lwzvP5xAUFutI
	Hyj17fuuaoyKOH1afiOB0HBlqyC+TczM3T6h3CKzxg+illIOQ1Wp3EyaKr66W6zK25aVdywidyFT6
	p9xHyt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWb-00000009AV4-1AMg;
	Thu, 25 Sep 2025 12:56:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWV-00000009ASf-1Suq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 12:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=emDBLi0S/XbmKkKrMOpftjZrfm/X9R0ePHepVQNumuQ=; b=f2iC5jOKD45mPEOdCA0aFhsTi4
	9CbnXDPdTTWQxziDlt3eXp9aLE5X8pnhbm4W8eAqW8ypsfx8xOi5k38fVBTfW+hI+oUK+gmRksfId
	C2zr3UvWsMaZm+il86WjOsIWzmS6EwPEx0jADWGl9YLgELlO7czrFSa6dMDbL5zV5oqTpc/xZNfN2
	FdUr3K09HfvduSYuzij2cyirZb2C6V6HnB30LjmwK9IP2uQHYZMbE6t2+I5L6UQ+H2L5J7weXGf8F
	RmBggMFZQYBfBR50KBZ342BaR777KyntD87rLEZ3/GL+lqMHxffu8VZLSCAEx2oJjkibY+Tika9D6
	1N6yFZVQ==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWS-000000098IU-11vW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 12:56:34 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250925125626epoutp037e10a2e7e4993722098d61ecaa17bf63~oh9EW141I1425214252epoutp03T
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:56:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250925125626epoutp037e10a2e7e4993722098d61ecaa17bf63~oh9EW141I1425214252epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804986;
	bh=emDBLi0S/XbmKkKrMOpftjZrfm/X9R0ePHepVQNumuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtbQxVaZMOTNc9SnArQhy8kECydiSbgkE1EbrdK/+rwbFbGzjCGWD4WyQVJPmIlUX
	 HItoYfWfS7m53kw74lLQ/vxWMdBbAaEZuFq8/sTQeaRXWDjfAeNEL9P36pCFVF+COD
	 nhuKf1d36jWfm7Jr80YHl992P7YbebM9tAJq8YuE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250925125625epcas5p102b8b73d66fa1c644f6d5253a6572ba5~oh9DtWlVI0620606206epcas5p1e;
	Thu, 25 Sep 2025 12:56:25 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cXYcm6mD9z6B9m5; Thu, 25 Sep
	2025 12:56:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609~oh9CQvnaO2772627726epcas5p1X;
	Thu, 25 Sep 2025 12:56:24 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125620epsmtip23c875d90d5ac17a4285aaef1ddbd0109~oh8__yXQ-1425914259epsmtip2k;
	Thu, 25 Sep 2025 12:56:20 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
Date: Thu, 25 Sep 2025 18:34:57 +0530
Message-Id: <20250925130457.3476803-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925130457.3476803-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609
References: <20250925130457.3476803-1-raghav.s@samsung.com>
	<CGME20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_135632_713314_799670C2 
X-CRM114-Status: GOOD (  11.96  )
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

Add required dt node for CMU_MFC block, which provides
clocks for MFC IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index d19d71faa6f8..6ee74d260776 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1449,6 +1449,19 @@ ufs_0_phy: phy@16e04000 {
 			status = "disabled";
 		};
 
+		cmu_mfc: clock-controller@19c00000 {
+			compatible = "samsung,exynosautov920-cmu-mfc";
+			reg = <0x19c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_MFC_MFC>,
+				 <&cmu_top DOUT_CLKCMU_MFC_WFD>;
+			clock-names = "oscclk",
+				      "mfc",
+				      "wfd";
+		};
+
 		pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
-- 
2.34.1


