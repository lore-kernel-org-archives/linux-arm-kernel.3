Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6DFE68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=; b=3ZxBwNPaVA2hsCvctM7w+nXmHv
	+ApqcbRttfxmJWikgJf5nMA7so1zpTfb9itca9aZT9Aue7W9iSAKyd0aUTvrtD7pe3GpBDnyCac2N
	mTbH08KNMBy9CEG6/SlLNPT7E+mMdyba7hsgqysn3JTL1ssDQWKBeij5kOQvSzxvEHp/Ev/ScHrBT
	xtBVcbg6xor+PWE9TqtXVCowIqtfAFXs1QSU7VIU+fbteELkgbY7hB+P3nZymN19345lLH9mEw9Xg
	EjDiStP8LvyTNyJ4SyPCTTAlPwzjgBKO2aPbOL3TmrjsqelqrkiCKfQYaI3dQxRL1Yqhaef/ju9M3
	zszk8n9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ6z-000000086FT-1fPJ;
	Tue, 17 Feb 2026 11:19:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ6u-000000086E5-2YAT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8Ljnc297047
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=; b=k3PSiT1OjH4lMZsK
	+eJStrLWQNnGTjQxrrzum5yleG6R/pbRQOk3HKjaeliZR8CeCGIHWhqw2z3k3bYQ
	USF5E9nG8AWGv8jlmj93O8aRkJRjeLizSyozjlleznp2+O9b3yv1saqmxrQMg2FC
	N/qkrJsVwYHeYpmma7tFZyYhMV+K+BsOaegRViSUHbouzg+5vtx7oRV6drSfvvkm
	zdEoZKS+YE3zzc/oHOlWZsbx3cqOBTzHNeTWRzf3YJj6/gedtas/TksQzm51ougC
	4Fi91+ydf5BraeTdIcZiprOoH/Tta2VJogy3Fg1u07M5CiAqeBA8LKju4wysg1uA
	ACfM7A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t3hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82442b44d94so2055877b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327158; x=1771931958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=;
        b=PsXFUutlwz8N6L8fw2Ktwe4Hvr6Deg0O97BY7tKPgbI12w2itwE8ZNLC3J7EAh//p/
         unfMXKeCMq0vghIYaIk3dnoJ1/R1upr955Ow3wncJG5DzqYaduyR8NhwzluVCy82b44l
         fhgraROeEgtMhK/M4i9h1y3pOW1TLTawjjW1ivyXdppa6vjF/vILfo6ZiSQfvu0OehFM
         GWHOluFvfmcp5Ttct6hySmxgiG9W7fh16sTXXyTU98aV0//X+Sqesei29k6AeT181pmo
         cLxY3Y0BM9Kl1MY/cNJ0LVfZ27RYEhy1eex4rmijZw8M4eWU56Wd3O8enamsdR3V7JWR
         HZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327158; x=1771931958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=;
        b=rBLGPaHeS1Zq530fM/218N3eskt4hmAQCN21x25v/TTDWDtPOjeu+cz+GB8iLXkGgl
         GBBHWO0C8eiGH8UkeCg47IZplcSWyQ3xIhDRisGFtyV019UhkRgloOH8sYm5m9Ot7zPT
         HenM+PUFnx5uOa9E1FOBFIywIUkK1om/yKHiqIK3yiQsoF1YJhidhqSIibvHwC1Xl0Xa
         JaGhvBRCRhKYoeb3KT5WTE1hNr0QAnmjQF3pYCh+oTC9DDOULdWui3sA4uSdfNYY53YM
         3QLS9Xv+YK1slxjBKPkoE0wDQdcBO0yDHNYsCewMiWsK8cNNvCf18awloG8beOI3OFKJ
         M6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWfgsZL/j9+3i3aQWVkKzMfagRYDnseDfSK9VQDznmDx0kV8djAFmRJW5OomKGikJtwbB2E37jX/AkKd/POB0zS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy+0FkCimE3e26eukE4RmTdEZytUaprxfozP5kwLykE1coB4oh
	/p/rmYU8pFtU/gXMggDNs9NoUC7h8Az5PLT+2nWwad0k8axi7N3LXsp/jU4qMr1NgoYKTVCpRQv
	+G/O3YeEpsqzhSs0bA+NHx2ldRxAdN1ZjYN9VZdP9snM2u1dHkmaO+pTpBbQSAxRYZN7nw+NixY
	e+7A==
X-Gm-Gg: AZuq6aJATLgMexf75Y78z6bDH4HUc2//iXb1GFVYj23YGpAxDze2tt5hTHSuX7rywnX
	XTym18EnmLIEAVVfR+CHKb12RH7Rf3kOIXrmJkraaqLLFpS6WYUsZefvVfqD/xEYv9Xmr4LjAga
	GDI1PCYOrpirCTR9eaOewGwCnZqhmANeju/4CshqXNYJP0UGFr/nOZszMha6L95VP5SuWNUVXqg
	/d/bRyJ1IXnUarv+rF8gm7LbEgxqEogLmy6Brys+pL70Queov2TN73T1Io1unk9ShJfzRpcTj9J
	lldP4Rpp0MUmyyzOP0TlSNFqiocguMGH38LV2rLk16sA/nx9X/Ia/Sua7s3IWNISNMJWLD00H48
	uDNWwhnn65CsW9EPhmBRWpIjT0S1bvHApkuVWeJTHX8BuT0C/9QkHtB65
X-Received: by 2002:a05:6a00:12d7:b0:81f:5ec1:8bcd with SMTP id d2e1a72fcca58-824c949ad7dmr11646614b3a.20.1771327158019;
        Tue, 17 Feb 2026 03:19:18 -0800 (PST)
X-Received: by 2002:a05:6a00:12d7:b0:81f:5ec1:8bcd with SMTP id d2e1a72fcca58-824c949ad7dmr11646592b3a.20.1771327157470;
        Tue, 17 Feb 2026 03:19:17 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:17 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:06 +0530
Subject: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=3861;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5VNrPa5yioPWFjGZOM4dXOcXPUPcjXAmODnXjn9DUOc=;
 b=eGsMoCR3RnwpV+cX/R2irzRnKPCBzeZrOnIZldX5d22y4OrPn6w5R6++P63dUeOwPgvwRrmBv
 y0NjhBhmG0cBIsIOV98eCu70NW/22EPqp6zbz0CTKFQknsolsw+70aE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX3XWsMGOn4wd1
 BUF1vUxKbsUvhW+UfNr+Sgi+A/oivpaC2erHlimZistfPiGwXTof2Pdm4NTIA1cfKyRLhCy9Wgu
 QotvieVzQ6jS0lAlZc5BqiMu9OglzGhAgntKVwQmkrvZ8ojmswQKwvRksD7b9GJD+NpXCwIR5MX
 3w5pRWYCXT74tVDWIpxy//yd/2a/CSxGAsIDRRlAAd3uzvqT0QbpEVyWIloOzOShPJfFdp8VMk7
 r8ySvkLdv3l0fSZEevFJJuG5GaUcniI9RWLrbuHzamHqsC3C4WYBtXQE2soWmjYL/vrE8eyk+ri
 +T9zVXediaqCa09GsEyeV8LMYdfxGDEC/HKs9jL2mGv/chfbnexxOP9UYNfh3MVKRE/s58Lerq8
 T93ZX5rqwV7YLLyELFuR8NA2GXlqNa0xu2zgXOjeE8zB1Jfw3KC4Sxldf+L4CUoebBjPc2fjnyi
 PzGSqLaf4kgMlYrRiKw==
X-Proofpoint-GUID: 8n1DgVmsm8FK6SPClUiQWTKcDtwmXIV3
X-Proofpoint-ORIG-GUID: 8n1DgVmsm8FK6SPClUiQWTKcDtwmXIV3
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69944eb7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=R0UKu0mhgHHlQpweOhEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031922_378004_FAFAAAC8 
X-CRM114-Status: GOOD (  19.97  )
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

Add a common helper, pci_host_common_can_enter_d3cold(), to determine
whether a PCI host bridge can safely transition to D3cold.

This helper is intended to be used by PCI host controller drivers to
decide whether they may safely put the host bridge into D3cold based on
the power state and wakeup capabilities of downstream endpoints.

The helper walks all devices on the bridge's primary bus and only allows
the host bridge to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. This ensures that we do not power off the host bridge while
any active endpoint still requires the link to remain powered.

For devices that may wake the system, the helper additionally requires
that the device supports PME wake from D3cold (via WAKE#). Devices that
do not have wakeup enabled are not restricted by this check and do not
block the host bridge from entering D3cold.

Devices without a bound driver and with PCI not enabled via sysfs are
treated as inactive and therefore do not prevent the host bridge from
entering D3cold. This allows controllers to power down more aggressively
when there are no actively managed endpoints.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0273a349334071013c 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
+{
+	bool *d3cold_allow = userdata;
+
+	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
+		return 0;
+
+	if (!pdev->dev.driver && !pci_is_enabled(pdev))
+		return 0;
+
+	if (pdev->current_state != PCI_D3hot)
+		goto exit;
+
+	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
+		goto exit;
+
+	return 0;
+exit:
+	*d3cold_allow = false;
+	return -EBUSY;
+}
+
+/**
+ * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold
+ * @bridge: PCI host bridge to check
+ *
+ * Walk downstream PCIe endpoint devices and determine whether the host bridge
+ * is permitted to transition to D3cold.
+ *
+ * The host bridge may enter D3cold only if all active PCIe endpoints are in
+ * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from
+ * D3cold. Inactive endpoints are ignored.
+ *
+ * Return: %true if the host bridge may enter D3cold, otherwise %false.
+ */
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
+{
+	bool d3cold_allow = true;
+
+	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
+
+	return d3cold_allow;
+}
+EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
 #endif

-- 
2.34.1


