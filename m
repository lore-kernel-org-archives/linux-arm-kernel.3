Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E156FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=724QmPNpSoqzzfv//J0Nc9L9weI98uMGfhESILwM00Y=; b=yUGasvAznF4gk7fMvvILK6guC3
	8eyhVEWYFHMR5tNPHT/jrw0EhaqQ5fNlHLOkj4tyjg1lvu0Ub+VktPLoot6DxU/5L4i+v2e7XOSUF
	WGoxa5jUaJBowCl9CwkSl0xD8bs5/O3WgAraqOnZjRWJrdbzPJ4sCBhYREEa6Cl6c1dRQfgZV1uSp
	aLXf1/WfdVYKo+NCJ/14fKkqWaK4juW2dlcX4eiCEKXgiBm3BzH1L1aeLPndMbmwbQk8kQ6jWYkg9
	mZ9ZDRG/1AA9kqBogKiE75y3bouSopf+O06VVLjqjcp4HZBY5XGf+VRj7entppblzgY0K93TNNt4p
	kpLxdahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqnm-00000002v6r-2wEs;
	Fri, 16 May 2025 08:52:22 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqfw-00000002teQ-3hpw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:44:18 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250516084411epoutp025e19b760b8808edc630231fe1288f386~-9XIwRyxF2239422394epoutp02F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 08:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250516084411epoutp025e19b760b8808edc630231fe1288f386~-9XIwRyxF2239422394epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385051;
	bh=724QmPNpSoqzzfv//J0Nc9L9weI98uMGfhESILwM00Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uh2OE/LPHhq+gAGuYDtL0W1CT9XHI8cFuffGPPH/+ZSIZxuZU72FZfjxaPuFiv0Gc
	 oWekol174p/FBfJ0OV4Y31nx/8tU/yOauXIBjQp+VeNdeTIqQHq9CZgG4Gx4AjLEP+
	 mWu77xL0nj7rhmO/lEYVlXiGX20fe3BbMw2Lk/Xc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250516084410epcas5p213d64ea27fb69d90dc7df7bae82de199~-9XIMlsup0158101581epcas5p2w;
	Fri, 16 May 2025 08:44:10 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZzLGc4txZz3hhTC; Fri, 16 May
	2025 08:44:08 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250516070441epcas5p30fe0e218557940026f54f92b90666b3a~-8ARZjask0363603636epcas5p3u;
	Fri, 16 May 2025 07:04:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516070441epsmtrp1fb84e7519a60bbe8102eab8313fcabab~-8ARYqkIF2490724907epsmtrp1M;
	Fri, 16 May 2025 07:04:41 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-e8-6826e38957c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.57.08805.983E6286; Fri, 16 May 2025 16:04:41 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070439epsmtip28e6402f83e1abc9740249f18d3aa62ef~-8APHKTuV0739207392epsmtip2I;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com
Subject: [PATCH v3 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Fri, 16 May 2025 12:43:33 +0530
Message-Id: <20250516071333.3223226-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516071333.3223226-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSvG7nY7UMgyV7DSwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MqTfPMBZc4Ko4ND+6gfENRxcjJ4eEgInEzne3GbsYuTiE
	BHYzSrzoesUGkZCReDRtIyuELSyx8t9zdoiit4wS3w4uZupi5OBgEzCVmLgnASQuIjCNUeJI
	w34WEIdZ4DiTxJSVzYwg3cICHhJLm7vAJrEIqEpcXLgXbAOvgL3En1O/oTbIS+w/eJYZxOYU
	cJA4+uY1WI0QUM2cni/MEPWCEidnPmEBsZmB6pu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5
	xYYFRnmp5XrFibnFpXnpesn5uZsYwTGkpbWDcc+qD3qHGJk4GA8xSnAwK4nwXs9SzhDiTUms
	rEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qBaan1p7CWI3dDH81l
	+5kr68hjtd15hd+F7xfnLdUtKxSbfTCy88vBaVMEjRvuvf69++rrFcKTtGaY9JipGzze6nlt
	9alZfj27Vm4KP1rDLP19k8zln7N/HDj/9eASl0U3neInNDfsXlq16f8FLw+uQ67rjrovidw9
	3zLwu8ftq/2fpdnueqiJNhxhKngjYtixVOfKz9rmfX/Stm8QijXmjGO4LOJ9YQrzfZUj3buO
	8gSb2AhXPU396/IljvFaQsWyF5xeJv8WrM/Xs5ojeWnK0ljbwjN3H27V/rKxzq3gnPX2q9Yu
	EkePur97cX6H/P4uS9nX1qWz9yut4NeV2Dh5niafXNsFgeBNT7lF5L5OmaWtxFKckWioxVxU
	nAgA6ynISBADAAA=
X-CMS-MailID: 20250516070441epcas5p30fe0e218557940026f54f92b90666b3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070441epcas5p30fe0e218557940026f54f92b90666b3a
References: <20250516071333.3223226-1-pritam.sutar@samsung.com>
	<CGME20250516070441epcas5p30fe0e218557940026f54f92b90666b3a@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_014417_235743_278335D9 
X-CRM114-Status: GOOD (  14.34  )
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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 20abc6a4e824..e934f94e8fd8 100644
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
@@ -206,6 +212,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,
+	}, {
+		.compatible = "samsung,exynosautov920-dwusb3",
+		.data = &exynosautov920_drvdata,
 	}, {
 		.compatible = "google,gs101-dwusb3",
 		.data = &gs101_drvdata,
-- 
2.34.1


