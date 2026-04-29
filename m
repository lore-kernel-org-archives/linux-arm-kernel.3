Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A28FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=; b=zcaRCv3kRQXko7AzM3OI0ySVGm
	tH0oh+dT1ONA425WoK1vu95GSnKte50OP/lIuuFTF4qZwDmgd/w3/pc3iR66uRMi5GrUQm3pxfjhF
	kKg9OnBsnPY+y6qDwKRu1pK5sz4MK9l4do5YHZ76nZFll9snqg5ZtFx/l07toj8DbHIxiigYm+wJK
	+OIiPCcABbaQC5tmtvgUuislxq9be1S5i5MgVsNbpjZ+fscztciyBUG0Yct4yHhNulzmxwZ83EzAu
	czzCUU3NW5gD9DVb9ishi1Hkef3rL9Fu2yux+zZ9hlTxMmNQtHHRjCJnI0WMXJeFlKuh/DGRF/7ms
	gmY58nrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydB-000000032Nx-0NKm;
	Wed, 29 Apr 2026 06:42:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyd6-000000032MN-1GVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:42:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3Xtnu2985120
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=; b=Fj8FXeYM2Cstey0K
	Z3EIT74accNvl+0ym5DPRKWQo+XgSPtmbafml8RbE12SJrdtRQV0KDvjc+XxvJuO
	TfjWMxgsZCyJ/cF8y3+FO1dmjfCkmFAFMaVYewWvX2fl/110Lo3fMa3ynJUuBmzy
	2GYDn8CsMFBLwxpc5I9n4SKpxHmZ9XtMLuV7Ti4qtqGSLmVIutxXmN0LTCLbiZ1m
	Eu2bmXb8zeUkHZuYJDqfEkiz0DLWK65MNx/XpqtkWinPclle9TUMqyIPmXjMMtm/
	S/1UX2kwBBzpfvkqx42vWfPxLQ4BVhFZU7Eq7dpeHrwCxyhFMnjQcZDuiXkjxzyy
	kUZrmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1tfga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so23508794a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444959; x=1778049759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=;
        b=gkAtjRb4lajLs4NtUJZ6ic+BKMWqPy2Vs7o3PdrhC5VeDPGhZsi09e0rRKw7QjUu8T
         BI7Iu88K4Gz0l/OEezbAPd9N3aMlQC5Pdl1uehG9IjgNjfHXFibFy8clMmgdd7hXOkr4
         IsPwVWIvSzJhI4aJJQ5vdbZmqTDAY5Wm5Lb9xzzGaM6+p0LQAgHlwTNr1hHaGeKvvgnm
         FBntd6H6pUHT0YTY2EOidtKwbo68qSLGbc1Uesid5Tp/JGIueoLt88To03Ug6JiD/F7J
         ZP0Me3mKCmHHd0qS1isT99uIAaxKP/khWZGiw36luAr+oYwHr+SazAroNXY73+nDo55f
         D32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444959; x=1778049759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=;
        b=R/ZLQAa0fw85aaswwJu7GAhLEp44ikVh7aEtJH1UzRLQ1caXoSAFcjW/KljbT4te5e
         p8S0tOm3tUJs1gNVkS+MvndT0cAURZIWky8t9KRJbqaWBFo1ydD2cwi861doDBS+LOva
         sWvcI27nlLLAEGoOcf1MwHxif3uDDla+kY4/lEwwcn+/5+NgCqf4CHUPZK1ICLjptdf2
         IcAk9y/jXe7EH/jsY76iTjVn0sGWGnLKgNz5Hj3HpcDDHfcdE/lnRmIzooCn8b2td7II
         ENKWW+cx2qUzBE8pJlXlYgXvlqzDDYNFxsu4mF937NkaQVOcjRT7TlzpS/T5VhrhqlQL
         RKPQ==
X-Forwarded-Encrypted: i=1; AFNElJ82RdEMWxsE/m2mxVtM+uOArb1ueAcMxL+Zw6Zh1mz2e3iwc2MwQaDCJRBc1f+rYLjOw2TDPtP0TlQw2k5Zc6Wx@lists.infradead.org
X-Gm-Message-State: AOJu0YzlLlAgiyGMWTg8sqp4GkhSGN5L1MFhwNcr9K4a5ksfwfKCj9OB
	WEorBd+2IbVXUkBuQJGHj+24soKa1CJ87i7hGsJ5yC7WBQ0D7+o9SHb6HcWBnXDuR0sqe1yQmxX
	pAfwwHh6kJ0OFEcaF7yUmPEGN7BsuPJyK1+dT4E1y8LsH/Fyn+8KAOrH/i2i3JQKQfO38mMZkbB
	672Q==
X-Gm-Gg: AeBDieuxniQnVRQXO9WjF+NLMEoeNK6LpYKDLitj4BtpAGrgv+8xuROgdvIwmG7VnvU
	cFAKdA75fqf2JFC4A8pkwwwbt5vZel239KgqxlvxvTUekBS/JOpZFw8BTxBlNJnZ5aZdY8fOj4d
	rXTJr1o4dTRF+BxTRV+qeZm3RJh2EQobyRyWhWB/hd7AUIgexh7uBJyLS96KNyZR80nc+2gk0az
	D44wpREOphtkOg9n8Bh2H4y0tNP5uvx/Uw1ZXNI2iyiU1n5KrxBXTSxS5C2bJwjewoAzgF/37hH
	vfkJhMZINmgcrjy8jtR1B+Xb/8r93SCS/DvgNpo49pd6CpeBdnGRgSX7DkvpuiUYZ1lfCXUz3qr
	1okPL7JuHVnaaC10DVrAUUpiKNJunOs2hrCDcLTYALdNSLmO+jjnqJw7z5C02jPcn0Ao=
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr6831512a91.20.1777444959041;
        Tue, 28 Apr 2026 23:42:39 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr6831479a91.20.1777444958505;
        Tue, 28 Apr 2026 23:42:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:23 +0530
Subject: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-1-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=5116;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FM8NSfNkcJ+OAXnXrK/t/KiNoyaQ6US4QTFzM89JCZ8=;
 b=K3LQ2ALmkEnry3Jpnx3w+lm/fygqHjFpyXjjyleGf6Vb/X5u5okUeTqsxaRl61VwYCNLUloXU
 eLbSzw5GJe/CPBY5JRnFaa88MzYlPV6NajQg6GWbTCoBPnJmwpMCZva
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: xTmgSPsg_xQyPsSm0RtcO1kdY-sWxqJY
X-Proofpoint-ORIG-GUID: xTmgSPsg_xQyPsSm0RtcO1kdY-sWxqJY
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1a85f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w2i6tlqj-xX_7Oe5WM0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX8zcKlOSNh3XZ
 WIPY7O8kBaOCLSwjEIaZyIHlarRtsrPnSqGJIEZlvG1SO6k2KarOsYBXg7Z99x2hiHjR5DlVDhN
 Sc48ZCb+Yh52Sd57XuuJ63nfEBiO+p98fZ6eVTmL/HL1546FNhwROjC2lwTgFE5fugF1KKiAF9d
 /DAXARrI9itVgTt71cxofQvRVT0fRLHw5/zCPvQL3+mw/WRcy/jJlImIWnlBZ9yRLMTiYPJRLyH
 OPs0vp92L7kkrI2FphcHqgUHuUjXaVuZKQbNJ50SHpfvhcWLvENp5uATxfCWGSXQOOfAOCYT2yK
 b1lnZDgYYY+har5ZxVUwGzIVZYubT/emEG7fCPQr4WTSOkUQEzFLIUKXlJ7sqUCkecmP4LmihmK
 h9ADQT7+r0yZrnIlXcMKb8qfDBvLYEdV5QrtXz020AH5zH9ZU2DhTMmYr/aE4CcU7PWVdymMmYI
 CujBjeEryh8QOO94L/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234240_360955_8A415B91 
X-CRM114-Status: GOOD (  25.15  )
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
 drivers/pci/controller/pci-host-common.c | 71 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 +
 2 files changed, 73 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..09432d69175c 100644
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
@@ -106,5 +109,73 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
+{
+	u32 *flags = userdata;
+	int type;
+
+	/* Ignore conventional PCI devices */
+	if (!pci_is_pcie(pdev))
+		return 0;
+
+	type = pci_pcie_type(pdev);
+	if (type != PCI_EXP_TYPE_ENDPOINT &&
+	    type != PCI_EXP_TYPE_LEG_END &&
+	    type != PCI_EXP_TYPE_RC_END)
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
index b5075d4bd7eb..7eb5599b9ce4 100644
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


