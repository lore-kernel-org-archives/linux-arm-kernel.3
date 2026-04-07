Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFFFEEF33
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=; b=fvKFcdIqcSF/c/WNjkVkCfu6s1
	s65XfbeYt/LEPynBkLFeAxlU5r6KyGcwSGk4m64PIG9F3Fi0XNwtJmdM5YXVU7V6/Gp9NXepCvFtH
	aWqXV5M/Sc6jPhm7m3A3Lv3Z9qa8tkmkgwbjX18stvyPMNs7XFm+3joP9nDmnWzh7z+oKqZtfa8BH
	JOMPOaaRPi1++58KQ4WPBbNt1/ZC6pfoAqgrBhmDM38bsahUu5L95Om2w741vUtNja9WJ5zyDIMSY
	Ab1HK1C1SM5rI8saaD+p9f12RlLMijTkPpM1eBJlSODTZzzoJ6+tJZd863hI7ZpSthutlBWPAn3j9
	fDnf+Wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65Z-00000006TNq-2SWC;
	Tue, 07 Apr 2026 13:03:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65X-00000006TNN-0UDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637BS6rJ2550302
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=; b=IWO+Br8juXfi2GMw
	0IKkHEoBDywwCfX6efs6+f1+rQqegHIh85G20uAZ0uuoPeRiYz2n40wE5vaCMBXS
	ar97iG62w1tGd+Dh+yEQGMi67d6zt8x/scdL5surl/JrjnDqd4WVZaoRq7QMg5xx
	usIhv76hAZYFh7/3l+8ssdpAv0gqZ0qGSEuBsJaKCuFsbrJL65cvqC7nJ654KUmP
	npN8/89e96MwZqJPhv9tX3AzKEgGbYhKmexXkhG4r39seWlGDFfOTrtyfnj3YC4B
	WbAq0DdY//I94CsYUXpawV7xoKKXyXCW3nw1GZERMlAnGc4RHw9vEiQ8bult3+qB
	7/LClQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreatgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso120595855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567006; x=1776171806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=;
        b=O9p8E4Gv3hb3TY/1ZyhS0wxXcQjAI5P/+IsRqDhLERVcmZhovPAE+jVzhGafG1AKsg
         h7E9PSN1wssrALbe4awedKUyHLiJMBWjDTAtF0SE+VPdFkkVB4x7XFve+F0ZbWMPSic2
         dzUWJpA4kpnkmFKTowE3SHhGf+I0Bw9KXEUY+DZeCaF1vzimblrJGfd6LHd/UlA0PbNs
         daJ1m5qo1ZNzu1424t6fRa1o09Lz6cmTnbB7Wig7o/xNngAHaTr1NesVyL4nSiVyj/Kd
         ktEwl2y+cC71sKfFnCiDZpDjQlTzFPUt0bACzE69uukjYooojlOohlDP94lBffa448km
         6vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567006; x=1776171806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=;
        b=V7GcNf4k9K9ZO2MoFhlNtMunpXeVBY+5OH3qCTZrhZcXNUow5674+xgspkDUcPkAGh
         K+Td6WkDb05f3Ay6QpBPrgOy4tfTMRc/U/sGcjej4WXzZwFyumkJvkO1XbAgWYr/pSIU
         9jcQ50cs1mIZuTiqqNXNhOzlI+HETyUDm0Uuq64zXgJzCA1PrxR6n8616fOM9mOYQ4N8
         nbTgE83Od0zfj2E98AdWh7jQ3Z3JyibYn/iq9cnZA59vPPudA02js+R3OBE/tF75r55I
         NdKI4yXxh9EEmCViI4R6OVVry/LkbYoc/OcLdgEYweRtpjvpWFOPtkmYu8Nib6hLFtRx
         HVzw==
X-Forwarded-Encrypted: i=1; AJvYcCWxXvEESOkZd9O7gn9VkgEX+VlbEi5eCE1yZZzlr1mOWnLic2iDdXZAWruZrFVO4ZzMVWBhVCYUFQyXDSH2ZDaE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk6XjlZ1G2HdNrjEXSS9LldaxIhHiDCV0pVbcCyU5lnNIysHbo
	dLpuy/NeyTHAIj2hKmu9CERcaZddmEB4r6qAA9Cp3GI8xFO7kcbC1OS1vUGDJVfk0R+AEr6piL6
	RkABY2unPWHtAQeHAH/rHmMzHL7GUyilW17UJeKpDEWRIqHYXZlFJq5Xy7FpLWYoMzccPi7npUO
	BORA==
X-Gm-Gg: AeBDietbvti41bIni8pacEL7SDHadlTH1M575G1hXQXFangGX2MniBZHNceUxQBpVgS
	NeEvCBhrVsMtuSEnoQxgF2dt1s1fneIjwy6dXuUbBRb1lNnaI+SU/ENpgg79+vpX/8m4GUQIyqi
	pJVBOZbl3iQpZyr2XQ687PIwIcpIG0GPWQyQoVQS+fqpUnf61kqdqNBm9mE6whPMPOuhIapa/ep
	KJGYYsmFgYlIgxdj3F03dIQHyEzRXkAfb8YQV92Vy2ohbUcwX8pgqFU3pF7XrVtKqc5yfqKdC5Z
	ILHTrjaA8rK6l9QOJ/jchPx4wYQ1mTzpoBhn0el1Y4nilckiwmqt8isCwYlnos4W3PidoCOmONz
	a8m6swXgnD1nxefjm8+w0UP2OIiKllNozatzfUqC1ws6Z8JT8NWqT7/2/
X-Received: by 2002:a17:903:910:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b2818014a4mr185891245ad.31.1775567005744;
        Tue, 07 Apr 2026 06:03:25 -0700 (PDT)
X-Received: by 2002:a17:903:910:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b2818014a4mr185890375ad.31.1775567005020;
        Tue, 07 Apr 2026 06:03:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:08 +0530
Subject: [PATCH v4 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-1-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566994; l=5037;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=77/I314LVY80VJYVakANAJH+wffpPLweMyKMYg0Una4=;
 b=r1GJebOmyKQ4qtkufVQselEhGDrMwX8o8kZA/JGziIc9JLDm5oPUn77lbC9tpF24nWy2xQMbi
 0/q3x7aBMOHBF27p39O+NVYefOdrvXo2B2Lt545T5xRzzwSkpKUXMoR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d5009e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=w2i6tlqj-xX_7Oe5WM0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: z9GB4jo_ZOxuloCzUv2--TUG9La0wUxP
X-Proofpoint-ORIG-GUID: z9GB4jo_ZOxuloCzUv2--TUG9La0wUxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfX1b3N1QeVliuW
 a6fcZy+xORcS8Iw7tXJYV4BAmKX7wiA8ZKBq/F/1lPjfOeG7uxEKyZ5GOKLqAwOouPEF66l2BN2
 cmjXJ3smSf624rwMP9UuYsE+Fj68KS7w20JDNy7n8/YhQuOZQCrgvKUYinUzbP6KKc0nNlTVXR8
 zKGY1DVCziA67v5C7Z15pR5unu2CAXfFwxcaDfkHh4R9+bJ9kgs9tO12+C8/QlY2GDNs2Tt9R8Y
 0KwRCb52jRb+EcxDvsNMM0ca4403bIIJWFMSmih5ye1CCCwDdJTWDkkkVWR6XgSSE7O1fDYCONo
 HN1+e8+BJyYhHRWHYnRzMzndeEDJbN6RDweZmf//1MFXdpU28mGm66QxAtaY7qjixkj0n9DrrTj
 GxThPTCGPsL7sPEz5KVfHu4DYZqzyfoeVmK+e9g+HqHVlk+9T3/vfyEjCfr+orO3LEs7FRjgf95
 8s5r8m1lebhSdGJ1hzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060327_171138_397D86D7 
X-CRM114-Status: GOOD (  24.04  )
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

Add a common helper, pci_host_common_d3cold_possible(), to determine
whether PCIe devices under host bridge can safely transition to D3cold.

This helper is intended to be used by PCI host controller drivers to
decide whether they may safely put the host bridge into D3cold based on
the power state and wakeup capabilities of downstream endpoints.

The helper walks all devices on the all bridge buses and only allows
the devices to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. This ensures that we do not power off the host bridge while
any active endpoint still requires the link to remain powered.

For devices that may wake the system, the helper additionally requires
that the device supports PME wake from D3cold (via WAKE#). Devices that
do not have wakeup enabled are not restricted by this check and do not
block the devices under host bridge from entering D3cold.

Devices without a bound driver and with PCI not enabled via sysfs are
treated as inactive and therefore do not prevent the devices under host
bridge from entering D3cold. This allows controllers to power down more
aggressively when there are no actively managed endpoints.

Some devices (e.g. M.2 without auxiliary power) lose PME detection when
main power is removed. Even if such devices advertise PME-from-D3cold
capability, entering D3cold may break wakeup. So, return PME-from-D3cold
capability via an output parameter so PCIe controller drivers can apply
platform-specific handling to preserve wakeup functionality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 63 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 +
 2 files changed, 65 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..34e4c4c1d8c0fdead3e714525a497b722a41392e 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -17,6 +17,9 @@
 
 #include "pci-host-common.h"
 
+#define PCI_HOST_D3COLD_ALLOWED        BIT(0)
+#define PCI_HOST_PME_D3COLD_CAPABLE    BIT(1)
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -106,5 +109,65 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
+{
+	u32 *flags = userdata;
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
+	if (device_may_wakeup(&pdev->dev)) {
+		if (!pci_pme_capable(pdev, PCI_D3cold))
+			goto exit;
+		else
+			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+	}
+
+	return 0;
+
+exit:
+	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
+
+	return -EOPNOTSUPP;
+}
+
+/**
+ * pci_host_common_d3cold_possible - Determine whether the host bridge can transition the
+ *				     devices into D3Cold.
+ *
+ * @bridge: PCI host bridge to check
+ * @pme_capable: Pointer to update if there is any device which is capable of generating
+ *		 PME from D3cold.
+ *
+ * Walk downstream PCIe endpoint devices and determine whether the host bridge
+ * is permitted to transition the devices into D3cold.
+ *
+ * Devices under host bridge can enter D3cold only if all active PCIe endpoints are in
+ * PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from D3cold.
+ * Inactive endpoints are ignored.
+ *
+ * The @pme_capable output allows PCIe controller drivers to apply
+ * platform-specific handling to preserve wakeup functionality.
+ *
+ * Return: %true if the host bridge may enter D3cold, otherwise %false.
+ */
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable)
+{
+	u32 flags = PCI_HOST_D3COLD_ALLOWED;
+
+	pci_walk_bus(bridge->bus, __pci_host_common_d3cold_possible, &flags);
+
+	*pme_capable = !!(flags & PCI_HOST_PME_D3COLD_CAPABLE);
+
+	return !!(flags & PCI_HOST_D3COLD_ALLOWED);
+}
+EXPORT_SYMBOL_GPL(pci_host_common_d3cold_possible);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..7eb5599b9ce4feb5c8ba2aa1f2e532b0cf3e1c03 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable);
 #endif

-- 
2.34.1


