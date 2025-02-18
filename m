Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4325C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUH/gVIYdS7usUu/YYtWnHeCWJpWFyJYlpRENFuRIOA=; b=TIIuOLKhpfkmBp2vtvPrpHRb7+
	mfbod4M6g+daNRoPs7gMJ1D0Guxr/f47q5A1oF7sdz91GwNBKkYDWkV5e3PY0nXIm3xepprfQQife
	ov5TYLXUX/fHxdlux0D/7/ARn5rzbvxGOsvxd2D/iwqEhRuuFx1KD4klvRl+U8jWgsp+Wa91pgFBC
	9L12yhIzrt0ucgU145zKtH50KiXFIx/Jq6FmdYaU4vQD9Rpo4XCnGk4yJTUTYqNIv6yf8po3z8+tR
	VcwyJm3Fd2VBLWVad3kdEO/g9gpc4as/ClKjc7GAvCm0Xau/lXfA9vKuXhdjKxW7sj+duYFhh/qfV
	aRtWKWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP04-00000008dyZ-44pZ;
	Tue, 18 Feb 2025 14:55:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOia-00000008Zjt-2DGo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 250DCA4104B;
	Tue, 18 Feb 2025 14:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A12C4CEE8;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889418;
	bh=tFuYQ9hrj4YzCLAMjMj9Ggo3laAOabX9PZWDshZl04U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pszX8grxihp/7mTiGj9O8pz8rQ1k+07jvdS3INYrRoh3U7bORJ2SZveFgjEDgsj9V
	 AfWNvBbizaM0LQEk573CsQmsAGfj+C0RnwlEmlIdXaPqP2wF/6Mp3DjZYgpf3svsnZ
	 Suiw0HbXZnizmOjbzFXPkmoKFxXIrDTMcMhZv728dgt85VRxHWLPpBSTTdkjw0hwqL
	 Gn5xKdSdhB/AvWVhLXHJOnHXfXdKSj53j5hEpVm7q7Okcgp+Ug2XLEdP/pisusgxJj
	 v2p31cmm7uaPUtQ9QOKhShu72VB7/NaJemVat4qLlChbNXfPYRIId03b1IohDKQVWl
	 WaGD/oCyZLZIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40353C021AF;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Tue, 18 Feb 2025 20:06:41 +0530
Subject: [PATCH 2/4] PCI: dwc: Add helper to find the Vendor Specific
 Extended Capability (VSEC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-pcie-qcom-ptm-v1-2-16d7e480d73e@linaro.org>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
In-Reply-To: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=M9WJthaTZXknfPb3HtwggK+nN0/yT7ulurjEGVuJfkQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBntJsHXKdWE8O15AQDIQdT7u8m2BaEWqY5eK3Yl
 IKQcIeh2riJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ7SbBwAKCRBVnxHm/pHO
 9XHjCACSV0ixZHMt4QHkcF/ELFQt95Op2JM1tNpLmUbnyo2ApXOsLFfNkA7/nsPnqeWXQuziAsk
 SqQHgeFy27PnZoYMJBmsWnAeveButQMxWOEWuvVLBeGGEiBV1EH0gCzJMnmjifXjjir2UECSk3p
 /3nFFGK+gDqJdVFOtCPl3C1dlgdS+xYRQjni0GF/nE/iAtk4qdA4yqZTcjQoovF/P/mJTb+RxJV
 uto/1ekr1p0Zb3djsHB+RHTSPhF/K7rxOnEk6XxAzos83BHAbq9Q6++d2X1nw5msgEK5Pk+spJh
 qtsgWY/9PikvilTHIsvk4nSQo8wB6A+sK1i+1PK32qkFxHC+
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063700_703942_D364E5BF 
X-CRM114-Status: GOOD (  11.74  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

dw_pcie_find_vsec_capability() is used by upcoming DWC APIs to find the
VSEC capabilities like PTM, RAS etc...

Co-developed-by: Shradha Todi <shradha.t@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 145e7f579072..a7c0671c6715 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/pcie-dwc.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
@@ -283,6 +284,45 @@ u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_find_ext_capability);
 
+static u16 __dw_pcie_find_vsec_capability(struct dw_pcie *pci, u16 vendor_id,
+					  u16 vsec_id)
+{
+	u16 vsec = 0;
+	u32 header;
+
+	if (vendor_id != dw_pcie_readw_dbi(pci, PCI_VENDOR_ID))
+		return 0;
+
+	while ((vsec = dw_pcie_find_next_ext_capability(pci, vsec,
+						       PCI_EXT_CAP_ID_VNDR))) {
+		header = dw_pcie_readl_dbi(pci, vsec + PCI_VNDR_HEADER);
+		if (PCI_VNDR_HEADER_ID(header) == vsec_id)
+			return vsec;
+	}
+
+	return 0;
+}
+
+static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
+					const struct dwc_pcie_vsec_id *vsec_ids)
+{
+	const struct dwc_pcie_vsec_id *vid;
+	u16 vsec;
+	u32 header;
+
+	for (vid = vsec_ids; vid->vendor_id; vid++) {
+		vsec = __dw_pcie_find_vsec_capability(pci, vid->vendor_id,
+						      vid->vsec_id);
+		if (vsec) {
+			header = dw_pcie_readl_dbi(pci, vsec + PCI_VNDR_HEADER);
+			if (PCI_VNDR_HEADER_REV(header) == vid->vsec_rev)
+				return vsec;
+		}
+	}
+
+	return 0;
+}
+
 int dw_pcie_read(void __iomem *addr, int size, u32 *val)
 {
 	if (!IS_ALIGNED((uintptr_t)addr, size)) {

-- 
2.25.1



