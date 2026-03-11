Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77D104BED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBZoQvcumGpdfznzcBnvdbJ48xIvFXfaJ4VllTrdJNA=; b=kNXFbrrGWXoQdgnBxxKZn0jBWF
	6238UeZRZifpnZen+fZE7N79uZYai0AwYtRSrer5Vj61CYgfhwJW3d+oMrASiDXqULSDVYnGw4TS8
	I1SrKvt9w75Usy4MFUY3+AAjLkcIgBsG0JBGEcd3Zu0DmIzJR737xp4ivx1jUgPWguNTuQCZKnSce
	hgVEpNOgSZlrAmqH6deSW0jO1paHF65fOnDeYhw1Hxivrf5i5NzSzclAQD665MT8EWVw5sudDeeHQ
	QNx/ZuG4iUedsxqrQjrVdqeg/eoqrgN8g7XMbqgrWqAGpxPgfuLC61OTISwRqTGfsHuM+8x4sE5Ms
	PJNSlf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmO-0000000BQIv-2DA0;
	Wed, 11 Mar 2026 10:27:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmL-0000000BQHN-1Go1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:27:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9nmkk3893470
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBZoQvcumGpdfznzcBnvdbJ48xIvFXfaJ4VllTrdJNA=; b=aDyg6H2by9l2qQfT
	8m4QMgH+Z8CgsOPLtW8JnhK3oCB0eLQUb1HMX9g47ixWYpJnqNLEH69l8YdwIHPl
	tWZpOsj8C4i3hGgz70k+84l2UqRLSuFX5BI1l6AhuDqOHCCxUOos4AnC+u+cFKY1
	aKQfExmDC95gpK+JNtFJdC7HodVA9v+NHkA9BbKV+Qapa2vG3KXG52hl/2x7rBja
	cPtrDyLGPvFn4l9wwE9Z7ZwkOwZ7kVM9ClSgUguFM+tbmoSzpQGWZyqbV5ZoaRwL
	s1dyFxeeLSeEQd7yzs5pZzjk9Dfq+uqSCGwYh9Q0TOZlSOHwuiUhpfz10rzGK3+K
	8JnMag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyvatx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae669a8ff1so430728325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224820; x=1773829620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBZoQvcumGpdfznzcBnvdbJ48xIvFXfaJ4VllTrdJNA=;
        b=Ksu4+N4whCNBg//RInk+RJmm4iOUFJVKurJjhSgsLPkahNOEsskupy8wZs2e7jlaja
         HZzm0XgXoVHs11Fukr8IIi0tjavqn3e5un33Sn/KxL6xrVNmDlvhYEXwoTeJEaCRPSN2
         d5f6Jc00ngWRv2F7DA+2WTIab3S+VGB2/lCW03pdu5h+RSR+lkiVdSG4bBqLoJLpwf6t
         fGZpAOBIRYVy8AJ94LmdoRQIphen+F5RXvc/jPK9+USqdSMiKOfXdhDJtoAFBoUFAanR
         C0acQ62lAgMdyeIlJvx0WHQB3MuJuGLCr1a1iBLaszVhGuvomW4sDuj/2TDNzdFzzFLl
         TLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224820; x=1773829620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBZoQvcumGpdfznzcBnvdbJ48xIvFXfaJ4VllTrdJNA=;
        b=DHQ+ga7tcmBJzqzlihyPTdVq8kWuVtLdY9Hq8f/CrHavcPA9kg49fK5QkhUVRmdioZ
         PP60Q9JTkUfhr53B8HYQdVlQPr/a5Nd15NldMwTm1nM0Q31kUw+RVaqAXIWP3bD1fpQ4
         8T6g3k1leLkceW0eJK0SvFdvkSWAAwSdJ14RHwkYvhMPAm4a0O9g+/3Te2Wtq5oxaDGJ
         KFv5y4uWUhjGhiSnPRqL3zduoSMPKCi6UPi1k+c/9SQKtm7cLX+2uJWKpwpEJP8D3q2P
         bnVOH9E87cYiltPcwSI5gjUIsADjXDCVoQSlWQKo6Y+4oXyHyK1eH6KMfH0bvFDmE8WV
         1CcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41NZTctj0xkz8vndkJy5Q0J3C4R09T4IhC69pu5A0OOVwiKIQ12hXX/ZR2gUFis+mSJ+rTxg0oDthpuqTig5c@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwl5iUbh4oMdGqdg+1VdjrTEktOfFAjR3tVfaQukQHWLt+Wt1o
	Qi8MQpWEHQpAPecYk6yRCFsCc2Hvjf5Lr+vi3OzdaQnDp1y+9OS9yQ8VMzyPGCOXZOqNhkgG2Qj
	GMTOhDo0rIJJkLEv3m/9QXI0itucVv3StEkK0UCgDuD6bEzU8EmSqaHII+SRD1B+9MMfCWG/Knl
	h+Dw==
X-Gm-Gg: ATEYQzyUcqiEFee25RmIbHweCqcK0BBhrjYlUDoNuGyIiZedyoQ72n3GlJq6Skltk06
	gkOO4i40zWvp0udQ45E7eUVekd1AK6yJTYopK478JIF7oHvwg3NOQhhqSJv10CxVABcryax7uMJ
	hK4gtOhR89nrSRnA3mKyaYiqdHkQ9wSrtmgYk8YJ4SxS6M80WzwoUw+3y1kbHsVXemf3itO8fPv
	RR19IY3LcZcPphDjBK7G0j/6z6s5QTqO4McIrxJbrIUwVX0tSUD3TNjtS1Mn2xaXvMz2qxUXMsI
	3TWNVLLSqcHUUsQ2nylJ7l+kFVoVj9jDFZaZH6XaZcNzrvc2WFVwDsQTem37ufzg7ytA79TdwbS
	oPtUi/P6TRatU/lAIXGSt9QJsUQnn5EfTIvudyF8nVXmCa/USR+qwgz+3
X-Received: by 2002:a17:903:1b4d:b0:2ae:3a1e:3490 with SMTP id d9443c01a7336-2aeae890bffmr23536615ad.38.1773224820067;
        Wed, 11 Mar 2026 03:27:00 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2ae:3a1e:3490 with SMTP id d9443c01a7336-2aeae890bffmr23536275ad.38.1773224819581;
        Wed, 11 Mar 2026 03:26:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:26:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:46 +0530
Subject: [PATCH v3 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-1-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=3882;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=93ygZdeQRqHkq5ovyiCONEu23NLO7pmiNx5kC7Pbml8=;
 b=fX66UOrcHSNFF3TnAdV8GYPmQS5WtCr5vzQSqYKckneMe1mFqHcZX55g6QyMI+wwv6zKXww24
 EA7Oo9L3jQVCD/Zp85+FhQ2kcVkPZBvQpjLkoNDQpT/3nPFMcA4gR9J
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b14374 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R0UKu0mhgHHlQpweOhEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NBFoXVjvBxwHCiGChoHUURImVh6lc--B
X-Proofpoint-ORIG-GUID: NBFoXVjvBxwHCiGChoHUURImVh6lc--B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX7CP8Ekg4rQHS
 kIy+o6KmWynV+wADELFZjphSBBngvLMiJvy0b+BFUjwLt1FU0UQR3U6m8OeOC7vurVQL5ODCijl
 +0pQVzf/GV7eVVZpGlCDQjFWsNljz/8t3FAUQzyrQp+8tF1sKIVYj/4dfb8Ywf0rngQDQhCdVwj
 bsbgVAnwH8hRAUDBWVQHrRDubipYaSXBAcHUJLJCOAFrlsiYoOp/Z+NcZBCnO2vrvxGgaHiei+3
 nhfRfm+nLX/hcqbR6p+Zice7wCfNRmd4ki1nOWQ8FKDuPBl4+cCzaqJmsWYvA2l1KYbKNlFRfKU
 hlSrhR9NVHu15k3kM9aYXDIcYo/p4TnQ+dowciOmYri7N2jBodLwkjRz9H4DI3AziX2GqP8gecP
 TSC7GPqJfbBdSJvUJAR9OhmWo2UAoSjUPSMwFcTeT7/1uJ6coKyLG0e8qOzv3RdOcjWZ2EBebP+
 5amywuVmofPISx08HHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032701_467225_7DFAF581 
X-CRM114-Status: GOOD (  20.32  )
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
 drivers/pci/controller/pci-host-common.c | 47 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..bff23bcdb5d032d2781d963eebe4a3fac0505517 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -106,5 +106,52 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
+{
+	bool *d3cold_possible = userdata;
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
+
+exit:
+	*d3cold_possible = false;
+
+	return -EOPNOTSUPP;
+}
+
+/**
+ * pci_host_common_d3cold_possible - Determine whether a host bridge can enter D3cold
+ * @bridge: PCI host bridge to check
+ *
+ * Walk downstream PCIe endpoint devices and determine whether the host bridge
+ * is permitted to transition to D3cold.
+ *
+ * The host bridge can enter D3cold only if all active PCIe endpoints are in
+ * PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from
+ * D3cold. Inactive endpoints are ignored.
+ *
+ * Return: %true if the host bridge may enter D3cold, otherwise %false.
+ */
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge)
+{
+	bool d3cold_allow = true;
+
+	pci_walk_bus(bridge->bus, __pci_host_common_d3cold_possible, &d3cold_allow);
+
+	return d3cold_allow;
+}
+EXPORT_SYMBOL_GPL(pci_host_common_d3cold_possible);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..c0ef2a2bf3994ce66686b3f8eae25538f3a902b4 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge);
 #endif

-- 
2.34.1


