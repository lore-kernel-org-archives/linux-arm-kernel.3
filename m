Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B64104BED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=NTS12hx3wZnsuqtOqDQC08YwTC
	m/K18GEAKLTov1TpR6U44lNHuNoFD8gvO9orgj0QdYssZ+PQx5mUWMoIxv+qqhcb8+/oGGojS20MP
	GJ58BHLfeGcar/tiJgiy/ndnef+q4Kj+mAFXC5AURFyLzPKkoQNxtGNkWFw9eHQKZ3IU4pWfpdzWh
	Rb5iuetyy/x1QfGl/p7/wSSqUOgF2tFJFuu8h3cJ+58+wkWR+cYVFiXOeIk+Ie92r1sS2FloWcXnp
	hXyR4gzQMMU3lclkXVtQbrXEdImOypNiFuRaxGo7XHJkvK7aKxj1F7Dci4wiGaYN1se6sZMuZdZ0/
	HS4ZgXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gma-0000000BQQn-3yyk;
	Wed, 11 Mar 2026 10:27:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmY-0000000BQP0-1n1c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:27:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9Wc30613987
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=DlcRurO486QsnPGT
	h78PTY9h5G2h8sKgFQa7VBbU7olOipI4V1IhJ5V8DRvom9fQLrABODFNC1hipbBI
	QrTQ9XM5v+4Tg50qGo5gCkyZs9A1TD4vDrriMCYFKk88/iJXUjmOjmetjscUzmm4
	n3+wfX8Czu1+Q/2yQzeENwoIOUo00bWBPz83ckiHn4oHDP6g6uaQ1yWqaVuCsEft
	ZZiY1ivYySfRlgiSBPbs3zdHUYXlp16E+slReDOyckU5lsGHgm7jkvwjqvjcBmwN
	zRUTXPfwtO9ZR4wIBy3miPN0KDQOnW0AymX2j580SWkhIFZNhYg/xvOKpKhm7A6m
	nvGOXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf1fcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae48a21d12so75529295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224833; x=1773829633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=Bxyo7XiLWhrvvqAX6gPPMzG4Vbv6eOqNlugcPmJxkUhQA3cqRpPYW/4VvdlnHvjoE4
         +H0xu1Wd5KUfiKVFE0pcOOuT6CbhHq6mvBPoeCc8hzcg6WpvHX5ooRTCAkiifxXiQ0S+
         sKamTJ2rkq6TzoODUT+oC4mtuyFqPFvjhTW7y2vxl4Twe8U70+4FZmNXtFwn4icMQTtw
         nz4XyoJSREOTjdzPCj5a8WgmNDwuTQvWTz8OWEdNLg/z4/PG0wC0+kYey1TcXhIIFr5r
         B1BK8GfIpUFsbZiy+OnN9RwZh1Hca3iCE2+3+EX1J+AFVbuKd1eQANHRNZCv+R6eLs4m
         bXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224833; x=1773829633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=rlGk7taaO7AB6UqvlTn/0v3scY7qpxBuAMC7kGHrxy8xpEOiGubLIHZE7shcp5fWbl
         ZxQ38UKQIIj0MAQo3b19OsA01ZfmFFB2odRZTVWiSi80bTEZ9Uqm1AZhVqt6U3O1rp/b
         xNeOkUqYjaFR/wvWJPSaEsx93taXS6FErUhQkqDgcR36qgH8a/yVdn8hZccvUqfjczlT
         ndxeL69ETyHNP57xjDyTXUqcvYWWEykp2kvIlEeD/O6f/ejuLt0zFyrhStJKZyoPjSo9
         th6g7vD+ZahxkdgzPygaSkKQX9NAGo3ys8N2/XS5uXjamAqEo91iBM74HDcFWzlZSEda
         nOKg==
X-Forwarded-Encrypted: i=1; AJvYcCU6c0UCcrD0x5c/mhvpz3AF6Kv1oFejoE0phRIY3HqzD2rYesQT2SAbNDGc46zNiE/GbnZlx0RzaDwQl8g3VyrH@lists.infradead.org
X-Gm-Message-State: AOJu0YzdRAxQbm6RcP7lTAgP488hF4QUR8FaLGz9rS/hLq20Nj/EEWkl
	BJNIBkpZF4O9PDlI9HIxSguqnvlF5Djr12BgdKaFNaZnhLN66Xssy93QblXLiX7VwWZc1v6BBxo
	XU207OiBmULPL6OFi0VHVCZ4OSZrL8/vuoNbmC79Ctkx770db5xn+7qgG+93CHu+98RHK2cOFVA
	r25A==
X-Gm-Gg: ATEYQzy0C0mK5k5q+BoYGjehOfpB+kolriKhgkYgSaD3cxmC4uUXPavD0h536H/1cTk
	iYwczktFff3Z9wmsmMS6Z2V3oq3J3J0PvUq3R3KhQJq0pCOBPii8rkU9gcDTGv++o3Hum/ana6R
	4LZvZTfrxtL0HPyOEN148AO4wh29R7ipcbJp4Sh4Y6aoYojtrrMBl4kAcYL/m0okdqT4w3aqmKS
	PpIZbOklXyAssi0D4UAC6hQ4dkrO2f59zZSzaCZAr6cWcTaKiDk3OOluya819Rux/whKgnnzVY2
	S/qNw5hv9dB98STrMJyqM9wmZvf4387d42RZyZN2DK4rfHG3q/V5DX+7ZgjWq9nuxf49BkEvnfQ
	s5zdzJYoVtQJnqacVy2oyrcG8J0cTntSEn17y+5EG1eNNzBCaRnaJYeK4
X-Received: by 2002:a17:903:2b0c:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2aeae7cfd6amr22264815ad.16.1773224833110;
        Wed, 11 Mar 2026 03:27:13 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2aeae7cfd6amr22264455ad.16.1773224832553;
        Wed, 11 Mar 2026 03:27:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:49 +0530
Subject: [PATCH v3 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-4-4d85dc7c2695@oss.qualcomm.com>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=4739;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
 b=z1UX2znW0tNQnXQikEHUVz+yoSQwhJ/CfsyzJwxDof3560WJyIXchPHVP9PSe7GbW4/Fkm/sH
 wyPufFOw5duDoya2OYCwIK8uUeNk7eCIVU28b7Kz+WNeSKoelULm+KV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 9P_Tqg-sDBlo_QoHX-oAW-ytZ0QiNSlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX+u148UZIc3Qs
 G4r91+AkwFEeaoQbNqqb0piTugv7YmEy/SnFRVggNub5xoN5DPbhIknKAOBqA8Vf+2T2XxjvdtL
 ltVPfbTIMTGUEDI/2Y7Ep5rDbMs3tW49XXqkqJ9n2ZltoPKy/pzv1A9YqFPBzZoaIZf/GNvmS4X
 SZmm2Hnc4fsckohdk2cyjS13wRsYh1xEDA5G9+tD7tppyo1a/7knMcHOusy/DxL9c32PDfskddo
 3nmh+fvjakLqB40Pd7PRKA68YkkCpmK2W+TnhwMZo6jnf5muHC14axnzftkvYKxEKH1+/OoFhRK
 8jb+JT3zmfVgs7gochxiq9cloys+PhjCWfazhb4Xl0K17CGxCBp/Snln+5xkUIDFIfvbHs4iCgB
 arvev41KV5E7Y30+CyZdNtb1WODxAn9tht9zTvqHh0qmDGgvsIVoJymdrj7aQw7kUTfyNIARYsf
 HxmjrOg79tl7z+UnJmQ==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b14381 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S-wDCh2AgS0RhsWIeBgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9P_Tqg-sDBlo_QoHX-oAW-ytZ0QiNSlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032714_473456_28BA772C 
X-CRM114-Status: GOOD (  16.25  )
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

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b00bf46637a5ff803a845719c5b0b5b82739244b..c14c3eb70f356b6ad8a2ffe48b107327d2babf77 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -899,6 +911,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -994,7 +1007,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1078,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1188,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -1209,6 +1234,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


