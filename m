Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E367DC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KWL4m/EFr6n6ot4qcLyrUWxpYxLDQ9RhpDSRmmL8fg=; b=4YLIMYn0My438MdiN6Slke5gNR
	OUM65ArUQCLmHvjlojXX80IQtPn6dDKpi3w1oBMYMvZxYwLY7wbycCTYpSTQ/2dQ/GGaZZ57DMuhT
	lJBht0jwgiUbaAIz1PbER/awXr1mTc0TjxHCnK4kAudox/ro0geobFAdahBlLNZI+OIXNPr+wZLbd
	xNG7gmxq2e0MHEEZz19NeqBPj+PnANW2hvGQ1A+IOtPRYn3/ZLQPapcE4Z2yftjiYZwC/CQaz2WjB
	/Y8UAzrfjKWgV098G1PceLDrBK/bIcswrf5oDX2rNLCVDmoUbd5olzarcamNGfyLsguYK4KWhqEOg
	ZhqzsORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubals-00000004TEx-2Izw;
	Tue, 15 Jul 2025 08:12:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaaR-00000004QqD-2dVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:00:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6QuSq018413
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KWL4m/EFr6n6ot4qcLyrUWxpYxLDQ9RhpDSRmmL8fg=; b=Garz+ZLwvzyfzPed
	4Kvavb4hmQWfKqCSKYnExKffLzt1yRQsqabTlb6IHByvel9pOjKXkc94sKE9flbl
	RM85T0tuy3yUe2/EB/HaZMr4Zfa4NmCydXZtlX2Kh4WkNFbfVP93ckwJ+VYSPsUt
	GpGLnAovobWN13rMycNPLkCSFw7YuXCZ3K5Bk64sGyUxwirYro93OZ0jw4Qsjcod
	t1Y681HexS08k948qft/urcqy6FV/QpdzlOnq9GW5Bu2m5amoK7CzanEmEC/uOjK
	xROUEr8WB2BJEHSm9czWFHTHw/6GpcpoFkBDVT0diFcERnrDTK7s+oNQKcrXldIp
	r9UUMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37yfex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab878dfc1aso3917151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566426; x=1753171226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KWL4m/EFr6n6ot4qcLyrUWxpYxLDQ9RhpDSRmmL8fg=;
        b=Sqnzb4AlPYvB7Fi7E30BJQmj6Ced9drfTRToohVpUE9N0ZLN0srzEiSk0afCU7tpyv
         rDc8B15xP/v0OzrisvxCAOtKipBPghrSBoNL3dzEHmHMTTKgFOViy8vRiYRamdPwPaxg
         dLOiPkwIdIS914+mScJ1o9t+2YM5jueIZmtrI1c5TqN7XCW70QEZ6wVtKuR8gdJphEun
         WPE3/IDNkoGA+F+RNK1HsxJk0JSFl8WU0MsFQOMjdQye0DAkiJ7tRjoSuWx06bDXr+8x
         VlclhAlYXSUSpGbkhpxs6ZBI3RIN6aPCFGUMCgfUJ0jRazBIT7Tb/yUvMNaWE/P13Kps
         oOqA==
X-Forwarded-Encrypted: i=1; AJvYcCWEp0+jFAij/jh1VdulzByb0yklgWS6JQk8sEnSZGt2mCeQMe9iLEPgvDVpTrp9Iy8PN5glp7ikjjxCf88zz+Ys@lists.infradead.org
X-Gm-Message-State: AOJu0YwvnsWnCg2kQcnKtmTKS8Xf3jFQrCXhuBHq7YygDD8va2JKc3kN
	ZQaI2RXku29CAdzyNPnzfg9slpf21PSa6EXAks5wvwBPlp6CymSuf1Q1Rd7fBD2pHpEWFNb+6Dt
	u+m4CKzBXstmcxT3ISHxGZzHUIkBxN+yLnQehXruYkiK8OGbCxSKw/Loha3IiwIrmclU2AMG+zf
	TscQ==
X-Gm-Gg: ASbGnctZdTpYkypAJpVFlai/u5Zdsu2sBU0lhRu6li/6e6ZdQgKotvknU08CheXh//O
	AFdweGmqAG4BtXu0aJmIgr/C860wUr0x/SGALcbbU6MZ5A3oAmP6LuRfSp1SvmWaTmvOZ0/35Su
	srTTM8ipVnv/CLdpOW4hU4nyqEwoIqIM0cXSM28wPrF5er5XL0ja9qMl3d9LjF6ur3r9hxDU0cq
	PeLCqrH+IbRl7sijEFNQKH9EtL9yGTbY7nr9gB3ayrvFYsC7hjMPZ0PT3FXH2Bx7kSvgqGgyPyj
	hlmYTLiyWtgWuMTEeoVZC0Ef9aIdoqV+Axn6E6uHY1Y3gCV/ONc/NwffBQgQk8a0PRwl8A==
X-Received: by 2002:a05:622a:1927:b0:4ab:66f8:7792 with SMTP id d75a77b69052e-4ab66f87cd5mr147319911cf.50.1752566425578;
        Tue, 15 Jul 2025 01:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGJPmUVXgZeF5AcyIX9Qqrf+IeLmaw1JN/eZ33zIxqduI0v4jQ3JZp+JsOcJoFG7UWh9aXHw==
X-Received: by 2002:a05:622a:1927:b0:4ab:66f8:7792 with SMTP id d75a77b69052e-4ab66f87cd5mr147318561cf.50.1752566424935;
        Tue, 15 Jul 2025 01:00:24 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:19 +0530
Subject: [PATCH v5 2/4] PCI: host-common: Add link down handling for Root
 Ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v5-2-26a5d278db40@oss.qualcomm.com>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4883;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=bQfWv3vYCXDQc/owgN3CgX4ivA+tRgVs06LKIPOsp4c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqB2xPasi/oXJF5fD1eJ7ErEJqtZ8c+4Cg8H
 jvKCy+In32JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9e7vB/0bdWfb3I/vAbI48oVnp2STavW4KBFmPK9O6UMoMuNKz+0WHn0wwQjy/MZPsbd79DMHo0+
 RwNXTjRVVIMz7gPMPo+GEVVIAFSb2C0sGeupmWPiQjEJ0ytJ5hypEzOol6IUini3JLdLZnBo7zt
 c1dxgLb2aPlxagby3h/o912ipm5XtZz27KATzIFDZrVJG6dIZ2kC506n8CbtODN8pIaYMCFQZ+Q
 zfU5PCKNWdObaL62B1n/Ja1e6BM+EONVws53xZykzeVMhg1h2PAc9WlXc8Ez22epwzVkSDpIWYo
 j9PzTRtwu5SKxo0WY3+cQYLmucA8fBJOKidKSyGfxH/Ff24t
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX93Mepr0QoCyr
 3JgpjzI6nWIVV8/vBBwlpyobcNZ3jNoVJ25GsEIq1yEO9SXAq3KTExDpBrfLIO6phUInFB4gNuG
 Mc5Ja8fKBJFm6JUlG6ngjkp0LQqZEMfa1OmfQVXgk3Oro3n47KxZIMm+iXqYreaXlbMxiFTujEE
 jOY3hD1EPcxRG+4JkwdbDTVRYBPvwynN30xpkNRzI3usbwKxLwNIR1YNPvg0rbThPoU9d+N/xnW
 Z5pSqRU7czT+Jh6Vp7qnPUiYmnjsHN2Ovu8jdak4S6t7dUOD7n19pQByPofwrk8DiFBQjTjo9sM
 36IBEkOMa5SQ4fUHtnadK5J8zv14cue2Uh2X6TXYCGio9l/8hAto2KtpTO8jbyqyPnL6PBueJ5R
 qAVr93ZSEdSnnrmZX2DjuGKEsmZW6lzWtRzy/U8ImsqjXCdEwYqUW8jKgu8lxv3pJ3Mtx85k
X-Proofpoint-GUID: P2j-2u-RYq0Wu0uhsNN2weXKiCKatLP_
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68760a9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=i5L6chZpdpk7mGOnbloA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P2j-2u-RYq0Wu0uhsNN2weXKiCKatLP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_010027_797385_5197C068 
X-CRM114-Status: GOOD (  23.30  )
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

From: Manivannan Sadhasivam <mani@kernel.org>

The PCI link, when down, needs to be recovered to bring it back. But on
some platforms, that cannot be done in a generic way as link recovery
procedure is platform specific. So add a new API
pci_host_handle_link_down() that could be called by the host bridge drivers
for a specific Root Port when the link goes down.

The API accepts the 'pci_dev' corresponding to the Root Port which observed
the link down event. If CONFIG_PCIEAER is enabled, the API calls
pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
will result in the execution of the AER Fatal error handling code. Since
the link down recovery is pretty much the same as AER Fatal error handling,
pcie_do_recovery() helper is reused here. First, the AER error_detected()
callback will be triggered for the bridge and then for the downstream
devices. Finally, pci_host_reset_root_port() will be called for the Root
Port, which will reset the Root Port using 'reset_root_port' callback to
recover the link. Once that's done, resume message will be broadcasted to
the bridge and the downstream devices, indicating successful link recovery.

But if CONFIG_PCIEAER is not enabled in the kernel, only
pci_host_reset_root_port() API will be called, which will in turn call
pci_bus_error_reset() to just reset the Root Port as there is no way we
could inform the drivers about link recovery.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 33 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  1 +
 drivers/pci/pci.c                        |  1 +
 drivers/pci/pcie/err.c                   |  1 +
 4 files changed, 36 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b0992325dd65f0da8e216ec8a2153af365225d1d..51eacb6cb57443338e995f17afd3b2564bbd1f83 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -12,9 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "../pci.h"
 #include "pci-host-common.h"
 
 static void gen_pci_unmap_cfg(void *ptr)
@@ -104,5 +106,36 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
+{
+	int ret;
+
+	ret = pci_bus_error_reset(dev);
+	if (ret) {
+		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	pci_info(dev, "Root Port has been reset\n");
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void pci_host_recover_root_port(struct pci_dev *port)
+{
+#if IS_ENABLED(CONFIG_PCIEAER)
+	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
+#else
+	pci_host_reset_root_port(port);
+#endif
+}
+
+void pci_host_handle_link_down(struct pci_dev *port)
+{
+	pci_info(port, "Recovering Root Port due to Link Down\n");
+	pci_host_recover_root_port(port);
+}
+EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index 65bd9e032353827221a6af59858c46fdbe5916bf..cb0a07c8773ec87838164e994b34a62d2c8118be 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -16,5 +16,6 @@ int pci_host_common_probe(struct platform_device *pdev);
 int pci_host_common_init(struct platform_device *pdev,
 			 const struct pci_ecam_ops *ops);
 void pci_host_common_remove(struct platform_device *pdev);
+void pci_host_handle_link_down(struct pci_dev *port);
 
 #endif
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 82c56fbd58ca4aaafac4f1638e7e0225c07958cb..2353342beb9e535cf1291cfa7a60c3e6c8f5bf86 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5760,6 +5760,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
 	mutex_unlock(&pci_slot_mutex);
 	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
 }
+EXPORT_SYMBOL_GPL(pci_bus_error_reset);
 
 /**
  * pci_probe_reset_bus - probe whether a PCI bus can be reset
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index b834fc0d705938540d3d7d3d8739770c09fe7cf1..3e3084bb7cb7fa06b526e6fab60e77927aba0ad0 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -270,3 +270,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	return status;
 }
+EXPORT_SYMBOL_GPL(pcie_do_recovery);

-- 
2.45.2


