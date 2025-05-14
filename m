Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4704C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21Z8hzEVWJ04VpTjQEJcND13ywzNHRDWhqyQdMqHOxQ=; b=uNSkC5KfsZfx9WajWE1WEMzuwX
	v9mcCW8AVrPtCxxlAm4GgRaLe1NE2GqOqYK2ZgVBlD4SG5jH9nvcxtUKQZcPouGPk32VM9ySXz7p2
	o0g9alniwEXPnA0WuikVaGFMyO6ZkLEM5DoE1CxCQUHbHxiJA1Yl9y3oOo0KnOQG4yrg/U74BpbQY
	KUiBQ/QCmgDgS4xkBAQ/RWgWu0EIRyfqdB8tVGzBeZsYXZbFJFypLEfwBTi9AIkRAcs+LZo7qrL74
	HGcLWML4SqL/rtEuSY28WxKYDidqevt4oC1WgGx25QfoqJqDSitW/kHC9YWrmtGTIwlsAmRDWnaWW
	U6yrfFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBk-0000000FuER-0Q3L;
	Wed, 14 May 2025 17:46:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEgV-0000000FhQ5-35fB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 16:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=21Z8hzEVWJ04VpTjQEJcND13ywzNHRDWhqyQdMqHOxQ=; b=QPvPXqyUzq/oiYupwoSIiFwT44
	wvpuNapzzUeSzwPPhO2DiYkPVNG6qYB4X7M6RPvSBDjwGKnmIfz2n/514bPNFwmmAzQwzFJjAbnfI
	m7uuanKGucTFba8C9oy4Nvxfpvpmu+WQFGs0B4NOqCgKzT++TEwoM/5bcRVab9r9VPIhEKNU+3bG1
	/cPuBVdoNuD+fxWYOp8VmFYG4EJBEBn3wwF+iSLLJXc8jzyjTd5m252hiF1DoGFBjhtYEofizxQmc
	SMZ4RCKuFoshuEhkebN+Om+tsN/Xmcn0mZJIvqVIJ9cAl0yMM97NtBY2v9327TyHjpxaERx5U7Moz
	3+fH5yzg==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFEgR-0000000HFqn-3w1U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:10:18 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514161012epoutp04c7877b7073056c7e9c193ea08b4cbe75~-cJ-h6-ki3098730987epoutp04p
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 16:10:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514161012epoutp04c7877b7073056c7e9c193ea08b4cbe75~-cJ-h6-ki3098730987epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747239012;
	bh=21Z8hzEVWJ04VpTjQEJcND13ywzNHRDWhqyQdMqHOxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cCWUmzSImml8DiJBbF7PRt2U8YTyYSgKkQWNnfluCMpWXbH95Gnqb37k8AY+owWHZ
	 OG1l67QdoCP3JcwN8ERYj/YbDg60Tz7BByu10qd1RcWaOp2sQ/v7yc6VhsAcppYvTs
	 6DVmP9RiGXKxPCepnQY+nkyWQJzNLygVFWtkp+X4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250514161011epcas5p2158bf3817d9cbaa8c0b2bccc843a23e9~-cJ-Dxtqw3255432554epcas5p2E;
	Wed, 14 May 2025 16:10:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZyJGB4g0xz2SSKX; Wed, 14 May
	2025 16:10:10 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9~-aWhrpWc50678006780epcas5p1_;
	Wed, 14 May 2025 13:57:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514135757epsmtrp1a1dc0e4541e07c3fdf57b665c492725a~-aWhqyoWD0052600526epsmtrp1i;
	Wed, 14 May 2025 13:57:57 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-b2-6824a1659b32
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	19.2D.08766.561A4286; Wed, 14 May 2025 22:57:57 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135755epsmtip2402140e03afcb2fa688801985af7b03e~-aWfYM9t80096800968epsmtip2u;
	Wed, 14 May 2025 13:57:55 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: pritam.sutar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Wed, 14 May 2025 19:37:41 +0530
Message-Id: <20250514140741.415981-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514140741.415981-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSvG7qQpUMg2Ub5S0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6Mc5u+MBUs4azYvPMNWwPjRfYuRk4OCQETiTN7DrF0MXJx
	CAnsZpR4c+8fC0RCRuLRtI2sELawxMp/z9khit4ySjQtfsDYxcjBwSZgKjFxTwJIXERgE6PE
	kRUnmUEamAVWM0mcnpoBYgsLuErcPjUfbBCLgKrErOsnwRbwCthJfH95lw1igbzE/oNnwXo5
	Bewltr+azQIyXwio5shSfYhyQYmTM5+wQIyXl2jeOpt5AqPALCSpWUhSCxiZVjFKphYU56bn
	FhsWGOallusVJ+YWl+al6yXn525iBEeQluYOxu2rPugdYmTiYDzEKMHBrCTCez1LOUOINyWx
	siq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QDU8Huve9qn0iertdW
	ec3+P3nSKu3nM99MO2016YyItfyxjV8U1hz4z26oXmVjqHdydub0kpWGDw49FDKcPD/eYFKv
	4Abuaq9tUS4tXxpV6jzClczz8/9c7LjCWPpfcQdb+h5Z++YzL0TWFqdVODUHVv3lzvntd0Rs
	uoLm/9izR2UKWaqLUlcfyJTzY9qR/bFHleOfi1Ru3tu6Ew82aDzUdpftqF1qN2m/w5Nqkc0a
	O35u3Nv5NbtAyXl2yxKPmtPdpVpdIVwWM/16BcpmbVliIGfKX5gfIL9HOCEx73z/wtt7H7yS
	zH229/2v1WLcvA/6bjksdBGdsItnizQ3+5tzbRci035n7X06//dHxWMBSizFGYmGWsxFxYkA
	6qFTzQ8DAAA=
X-CMS-MailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_171016_692259_615C8E42 
X-CRM114-Status: GOOD (  14.97  )
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

This SoC has a DWC3 compatible controllers. It needs "ref" and
"susp_clk" for it's operation.

Add required changes in exynos dwc3 glue layer to support this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 20abc6a4e824..a8f97d2b31ae 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -187,6 +187,12 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynosautov920_drvdata = {
+	.clk_names = { "ref", "susp_clk"},
+	.num_clks = 2,
+	.suspend_clk_idx = 1,
+};
+
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos2200-dwusb3",
@@ -209,6 +215,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "google,gs101-dwusb3",
 		.data = &gs101_drvdata,
+	}, {
+		.compatible = "samsung,exynosautov920-dwusb3",
+		.data = &exynosautov920_drvdata,
 	}, {
 	}
 };
-- 
2.34.1


