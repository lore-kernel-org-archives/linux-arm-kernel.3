Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6338CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 04:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=; b=YajituwzanBrX53ikFYF36iWIm
	efRaZGC62MAlG83ayiWzc/QRSwtxyj5J74O8Q8XaClL1iifBtZR+BlRuvVHO6woz4knHleAZyxdtE
	UiTmtRAb4LyTAezGrU5K19QHc5FX1r65qaautY2H0KX6x9BkaSI1x28T+d15bSAC1kQItOPcpjiEF
	UFGsgW4V3lYLCdq1D0Hv3Fy3G2gN+uTDykqaYiueqSZ8Gf2wSJznbqLcrGPaO5b2j8L/kKHQEcuOB
	qzb7jme7PrFhyj+saK6QRzBBJm2DlAFvjwtk+BV+XcESC78JYxVDMG9S7CblXYUil7rWPz4bwHPTj
	jAa/laqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fz-0000000747o-2nBw;
	Sat, 01 Nov 2025 04:30:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fu-00000007464-2wit
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 04:30:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A10iSdW141883
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Nov 2025 04:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=; b=RecnS/G3GBUtr5sn
	0pgi0zH4N0oEH5hRWMkSNXc/6hZzq5ceyfpRNFy7Nt3gTjsVNCYb4uAFFxZZkkzU
	o3vUIkg6nZ3oxH9EIgBrYqKEAaOJbkaRquqZgeFNSNvweh7dWRkJBqcJDl1DJ3V3
	5qw+dTA0Hx2N/wrctsew1WbkBVhWpcg1oLhX17KmPwXugMUvr+bpYiD/ZgOQ8x32
	0AKKl/88Ju94SEkZ/xaSqWhzWd/e2GF78B/06lRImmUY3OXRNO5a8ce7j2VXBDw5
	SZSDZGRUJ4UE3vsCoWtgfsdwA+hMyGEZ2aDsBaLaRkDmmbWtfszTkaEqklbGvYvD
	/vfZ5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57we892x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 04:30:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso2941174a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 21:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761971416; x=1762576216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=;
        b=TD/qice6k681RNy7DXMz6wAMNc2JrjwrGGkGOnM264OZZkcBznC1xbj24ovVbjRo4/
         G+d0EiSqzdKAWIIo77a16DoamX/RXAxBZ0Jv4ANN+t99C8HKXSdc2S7WsQ0YYLcNs5pX
         Rdh7JCEkPSKTX4y1wi8ROIkLsuRTg/FJT5EtpWar0ceKPVn7dphfPBFLO5MLO7snJgTp
         jGQ1yoaVkXch2y7H03YmuvWe9+GknbAM09kjjXBnFBoI0vKp1B/067Nj+GnvMDXRkJ7N
         qUzVQRSqUbu0GCk3HVWemWtbExR3DfvbQaWyQacPPM1k0b1KV7GAz1pBYX16c46A+PC7
         1T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971416; x=1762576216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=;
        b=Z3ibPqz0eP7HGZZYqMxwezfC4bbOFi08aBeT/rPXR18z3cIclhRZXoXpe7YRHk5678
         5v96Tnr4GWweCnivQCJu22ZlvuUOAhrS2Fs2DVlST+vQsTnzFZZsWmBko4EmdkFLmY+N
         Kur8wck/rnwhvoaH8K6ccCN1sLwGpzkK8iov+p3DbxGycQkLI6bmSiCM81OlmRjfBCHE
         NFnF/hzSB+1bfAYAP/y04CQUoT39v2yZcPwppLQCDt36kb6Flq293cfniBX5srUAiP6b
         CywohtFwb577Wu9Jhm3sGuoR/smgjc62haf1C9CTzlYBNYDzVGcMQw0jWNgOwdbqRr6J
         dD2w==
X-Forwarded-Encrypted: i=1; AJvYcCXZm/doPcS0Ib8jqkGPsbAljYJrRmgo8bb2yrPGFyxIJUovk3pTesq4BB0zAN4LeSr2qlQ8dwxPUDgTWT8adDGV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0BETBz4N3gXPARQUevSyXY9/XHrQytHhV/26bWbswnACQ+FBK
	+I7Vq1mHIQIFxvNU9qYWYxo0BvfesVgReBNNRK2Dzkbdt64ZZ/0VGqhDMHwiKJz65F1ZyHec6z2
	vFC2Zwep+0KkrWqM2KEewfqLn96M95wo+y8JidFZJP2ojjS2mTIOvr81WXrXs5zTcLXkUsuR3dB
	xvRQ==
X-Gm-Gg: ASbGnctqrsI/Z0C1Xs7IhSNWdhvYU4B1SrCUUT/11u2lS+NMAPgZ2CjFiIKTb4qE1Lv
	+0NmF5maPhmPYNth6tkXCEygB0CcX023SPkvkAV3kNkH+wCOp8tAWHI1lhBx/VPpV11f3STPf1R
	eAfuiFdmBbF5T4OCpZ/91tASk2cmIZeuF+YH7q2Rp4C3aYVh95Pl1veZq5u4ZhjYhpn8GvZPvVS
	vQMVP3vQGjiWZXIIEug68hVbJpRB/miuWb8P732OZwF1sqcpytNrHbz02IAnYxYa2eNLEylZ8Aj
	LoTZdMjjFRgsuqBrJSsaTXM+5JVJxeGgIHbA3uOSwiq6ZvJiSJJz1BcPhSAm4hyjkh83sYeqfTx
	OtFiZjWS+eEQ6aIe5WTGyFxDv
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2952c8e96d9mr46357575ad.31.1761971415828;
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERXDukIavO9PR4//phPyGJduf0lbjAG/4vEikdn++zQ0+zjHP/5yiGYQHVqvMFXMVQNa2R6A==
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2952c8e96d9mr46356885ad.31.1761971415224;
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:9857:f290:6ecf:344f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm42273285ad.2.2025.10.31.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:59:42 +0530
Subject: [PATCH RESEND 3/3] PCI: meson: Fix parsing the DBI register region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-pci-meson-fix-v1-3-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3414;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=z6Ma1tu8vEZQke3NjkVPJHb01xM4bsdEHhx7cBiREVQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBYy++GDC2FdF4Z/6/YuKrqvsPRDzSYzArhNo/
 +csT538cMWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQWMvgAKCRBVnxHm/pHO
 9Wl9B/4lJRWgp4jLVDF1SYqDPGUDzcb472y2yeMmk2rkFfb2Uv1hlk/XcpOEfQgBpX/u8ZpXBEq
 T7H5Bx2EFq4Soc4HdtjIYaui17kadQmI7NRJFmmxhC1xko8FftZXxZfEtoP7KnqUP81m2N60jRI
 lMArC53Nmr1Sf+hjpHeorOGbMovA2mC7P2H7k9M4hLM015Lj6soWc5ViRjg3fdJyHkz/sZ9YvNN
 uoQp8w6yVTVJW+fZ5JSvDDRb/4HVStZmmu0VCObZK3EqVhOq8mGy7HXd5724d3JaWSl+0Ldj3N6
 zW3Xk0bmCRmxWBjbPLOoTUS+M5L+oB3GOZ2L9kk3WUiDVkYR
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69058cde cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=Zk3OmFfbAAAA:8 a=EUspDBNiAAAA:8
 a=szRsftEmMXlY6Mt0pVQA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Oy8NMzglzIT3TnYzvxbF0vUraBMjMPLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzNSBTYWx0ZWRfX6vVkbL2UzUyx
 xQ1/0rLIGH66hFBh58YbeGyclKKw6kjxsMXDFF2ACtHs10mf9PkTmSBND4sEM1R5D7mZZGRW+kS
 Qud9OxXRvo0blLUAbqGBGuqtRsf3W/rFrpBZNJWRqNNubWApvlOhbFPEKXIxxRBspj+OhlD/JVr
 vua2+hqm6McDuIRVNsz++PrO661c9aGhvXL4xhNCsDFLdljjTjwDwxyGowM1o2mxXeOCQfjTQ6U
 dFFZM73FIUgo2N3ZwM6M5C+Lcz4SyQflQVy1ufaLrkjoHykmJnVR6XwsE2vFbfEBX0s4gcLmDGF
 SmLl9dC5dQc2+u62/tMT8x8bUQqTD4h9aI2vI+hu5f66UCfiB4lV37MBOjAzsXhaQBw5gZ0jgIO
 wr+xYYGrcsCjxYl4LzNR5yC0MHDiPg==
X-Proofpoint-GUID: Oy8NMzglzIT3TnYzvxbF0vUraBMjMPLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_213022_808838_D9DBDCDA 
X-CRM114-Status: GOOD (  20.61  )
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

First of all, the driver was parsing the 'dbi' register region as 'elbi'.
This was due to DT mistakenly passing 'dbi' as 'elbi'. Since the DT is
now fixed to supply 'dbi' region, this driver can rely on the DWC core
driver to parse and map it.

However, to support the old DTs, if the 'elbi' region is found in DT, parse
and map the region as both 'dw_pcie::elbi_base' as 'dw_pcie::dbi_base'.
This will allow the driver to work with both broken and fixed DTs.

Also, skip parsing the 'elbi' region in DWC core if 'pci->elbi_base' was
already populated.

Cc: <stable@vger.kernel.org> # 6.2
Reported-by: Linnaea Lavia <linnaea-von-lavia@live.com>
Closes: https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Fixes: c96992a24bec ("PCI: dwc: Add support for ELBI resource mapping")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-meson.c       | 18 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c | 12 +++++++-----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 787469d1b396d4c7b3e28edfe276b7b997fb8aee..54b6a4196f1767a3c14c6c901bfee3505588134c 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -108,10 +108,22 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 			       struct meson_pcie *mp)
 {
 	struct dw_pcie *pci = &mp->pci;
+	struct resource *res;
 
-	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
+	/*
+	 * For the broken DTs that supply 'dbi' as 'elbi', parse the 'elbi'
+	 * region and assign it to both 'pci->elbi_base' and 'pci->dbi_space' so
+	 * that the DWC core can skip parsing both regions.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+	if (res) {
+		pci->elbi_base = devm_pci_remap_cfg_resource(pci->dev, res);
+		if (IS_ERR(pci->elbi_base))
+			return PTR_ERR(pci->elbi_base);
+
+		pci->dbi_base = pci->elbi_base;
+		pci->dbi_phys_addr = res->start;
+	}
 
 	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR(mp->cfg_base))
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c644216995f69cbf065e61a0392bf1e5e32cf56e..06eca858eb1b3c7a8a833df6616febcdbe854850 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -168,11 +168,13 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
 	}
 
 	/* ELBI is an optional resource */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
-	if (res) {
-		pci->elbi_base = devm_ioremap_resource(pci->dev, res);
-		if (IS_ERR(pci->elbi_base))
-			return PTR_ERR(pci->elbi_base);
+	if (!pci->elbi_base) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+		if (res) {
+			pci->elbi_base = devm_ioremap_resource(pci->dev, res);
+			if (IS_ERR(pci->elbi_base))
+				return PTR_ERR(pci->elbi_base);
+		}
 	}
 
 	/* LLDD is supposed to manually switch the clocks and resets state */

-- 
2.48.1


