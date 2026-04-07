Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68D0FEEF33
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aQXCO2yyCZ+oTPzSKSvjrummEe0+JiJFnwfrGu6ciE=; b=0esetvQO2g+8v9PxdaL8m/S/Pp
	101xZCcEuHP9U0jyQjH3B+ABK/KdHIjRw5tBo5z/0lVohiBDWLSSEVVaioW8ZFZ964iNF83LBzGD1
	CMiqI9SpoEjOp4eJz+R6on06TovCjlLbL8Wg7DXH97oodfPuHhplYHMViZfTNXD7PqzaRAPD7nGPR
	2+qiWkX/ZfKqhGbuKqhKSKhznJZdSUwDSEe1cDo/geo3/iA7o5G7Axu/VM/017fgJsOEE2ZN7bJZr
	hLBDQR2FbsIpsrrmAH8+pmsFRwHoubJzgKqf1dgRTaHTxnPIWG5o6VDfqHiesCKaeXjdI7BMo4+YD
	fX9ytINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65r-00000006TUh-04lt;
	Tue, 07 Apr 2026 13:03:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65o-00000006TTd-20ZZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cwa1P493201
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aQXCO2yyCZ+oTPzSKSvjrummEe0+JiJFnwfrGu6ciE=; b=ZiIApgK/+yc6CkXF
	zTDxjb5yYtlLxm2mIu3jnHCnxW1Wf7FV8XXSykWVv1VrOcNgsuUOvt8SRdL1PD+k
	VTlc4TwID0X4zeboZ55PX7JSygwvRMnzYL+2mo096F2JcFPsoqHF1MIkRxfCOzVQ
	U71PaiBwMVtbzgLLB/M/sGpLSnoC5/api0/wudeOCCivarkAByAFamJaX6xosVlx
	ctsl7axMgQtM/z/Jsboi4VO1/4pbnsMrSuDDbMlJR9ytKugAC8B1ytE6npAfnJyS
	lGvVEUSWUfoAG9LcgzWfxNihGPAPb3BaA1+NJjivyb14ddzK8ah5SjDGA1hcbSbs
	G8VPGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8trnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b0aae381so52530475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567023; x=1776171823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aQXCO2yyCZ+oTPzSKSvjrummEe0+JiJFnwfrGu6ciE=;
        b=GdK3rrBx77QFu03JbKHvzyxhfMJ5Du0WilYDFy9McWGic44mIycM3wY2AMUVJidbZm
         bzeTQRz2tiApCxb/YzVpxxRPN/GIdAHEjnbYAwAmai0kw3WhoQMvCK2QmbVvuQh5/IoZ
         QLF+HdBSeELTKCMCE7pnmzi3Z88AmJnmp0hjyJiJa5q3GTXenwvVEheVS4C3V521TzWd
         BdjolXFYbegrYVvtyoAFQEQ3Y1Z5Nhj9IDV9rnANBRzNqRrrtY1QDzlTmlcS+r7bB0bf
         gZTqsZz2kkfnjvGmYqcODY4Mn51G1wcVexhNR4esNeQIrUdtkXh7rRNee5Mo8I1gVuSr
         yxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567023; x=1776171823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7aQXCO2yyCZ+oTPzSKSvjrummEe0+JiJFnwfrGu6ciE=;
        b=HSezEgNC9NxIpfO5XaeTfpGpbyfvpZkhznEGDpqjbTG7GrEEtASbNad1QX6T73A+AX
         DJ9c/l8Rkwg5s0oLe0WD8cCE/IDeEmaIQZr3FuXWGNLkbay2uTf1CE5U6JRPDcG4NOh3
         J9TSLZf/TRVQtiKuuGKHjKvXBTXMHImMf4SDRc1d1+ptD/Lo18iwTIR6rIciagRjSyda
         gWek3nDzrFY6akcfO3sfgFFvCyC40MSMAxlE1kg+slTYgolkDuGQh/KKVTcTM2QELl6P
         7uN5CeJlPuCJvBePaBqMr+rRIzJc6fIqIBlfCWLXO9A0nSF4gx1Q/JH1b+T2MzsxlqiU
         Aq+w==
X-Forwarded-Encrypted: i=1; AJvYcCWIQvFQQOgNx1ExZJ7fNLj7/nSSub/1m7breawxJ4Scs19heZssoW3tahVJDrKT1tPb/o7hlXke4YJ8Oik88NqV@lists.infradead.org
X-Gm-Message-State: AOJu0YyuGm8VBJEe/7SobPDyqGoo1Pe9bk8/6BXAj9KDoekRBAr2AieE
	uemFDn40hkq6r/cswu7gCUyKfoosbC/XK0QIyhyySsR/kB8OUNxB+aMzReIR2Bcj5fMnO6Y9T72
	X02IknnTp6/lcF8nY6jNstr7+yi8Z88yTe527wR89xfp4T+qXUl+co0gWgKh+/DkJe4n1nv08mE
	yHvg==
X-Gm-Gg: AeBDietppB+AM+uvWMQWA3mOywiNV72Ruhr3Hwo9Pjfwe+iChTGCaRkbcnzx3DqPEMA
	hjpme4qu3PHkCmrMTTEndpiyVxDA/W4WyiRlSgflKl/Rab30OwyAlF04dUCdtbUZvJv2VxoqU7D
	fiLP+lVuTzTvdC7o4CiT404xVP/Cdmd9ZlqvGKbauSorkHSVtoY2hK5BlNUh9v5tRpjyKr/3MQ9
	W36h87ZR0Mg40khP7+hHDzpUeoD43u9AA0Jz73ahEcGSAAorbkG9abc2wLuPjAY97JH0BGdwJkX
	UtJ3B7P78Tiq8fKsYO4SEBDbgGD7JT2xgwH4IQj9uRJ8fPtcFIqF9VejS0l2KQcbYA2tmjg+VzD
	+jGnQ0UQjfPfhUndFN1T0uZLa/UBuz7PRsoPjscortE/a8XXLUJxncXln
X-Received: by 2002:a17:902:c410:b0:2b2:4862:78e9 with SMTP id d9443c01a7336-2b281687c7fmr191332825ad.15.1775567023123;
        Tue, 07 Apr 2026 06:03:43 -0700 (PDT)
X-Received: by 2002:a17:902:c410:b0:2b2:4862:78e9 with SMTP id d9443c01a7336-2b281687c7fmr191332045ad.15.1775567022518;
        Tue, 07 Apr 2026 06:03:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:11 +0530
Subject: [PATCH v4 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-4-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=3264;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PWGUXyr+GtnyzoUhMB9V3ekI1oFO0F8QmYYXumVt7Kw=;
 b=SYyzydNs/xfRblTu6iPrQSA4fMH41W/iB9N/GrQWpymTxH13o3VAyw2wznzKk6+5Owe6OlR3I
 qZTMEZWhJEqDsdL6LeSIjDaj91CGvrIy8scrP0kmGcdSnWG7Whu2/lL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: w9U4cJTLYY3nuGyKk627p43ecdRPNR8f
X-Proofpoint-ORIG-GUID: w9U4cJTLYY3nuGyKk627p43ecdRPNR8f
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d500af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h5qRVDGUHOPEFS6InpEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXxZeeJXoIJW6y
 rKBMdzCi9HF+e6q7u/4VMvVgoEYO4xWD/twTDwnbIp4pdAsxuaWvB7nqfPwSwP5RiEv57kHco6I
 J7jWhUcSXE2RhieOT7lGCbPg0c+mUwT8HByGgI+hLr8Ja6/OU9z/gsO+wHm6t9zAx9O9er6E2MZ
 TZqK3fDoOsoAUCRpvs54nOWFkxAu3WriYdHIbWJ/U1LpbCO19Ze6olswx5ZBv17FVKF5f16XH3v
 Tqls7ekPeoxJ6uzH0lyPm0VAL9eylKiLNgRj4hCDCg5opLPZePxY+Sfva2GGFCH2D/3lTjPEvE3
 NkreOTIviZGYqZBg71ZUDHT21+J/EOplh+FYQD3iXHYxxMHykf/QnGaAAHW9MoiyXF3Botdiu7p
 tsI89t8Ik0AVOS/DWLOaUa9XKiu2iAzFC+MJT9Ig4El2e1nk8QJFiTyJOEgcA+pq5IFrWYwnO1O
 e/KmexRYLIIsxPcGcyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060344_540217_7E8AB96C 
X-CRM114-Status: GOOD (  20.58  )
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

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the devices under host
bridge may enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_d3cold_possible() helper to decide whether the
devices under host bridge can safely transition to D3cold.

In addition, propagate PME-from-D3cold capability information from the
helper and record it in skip_pwrctrl_off. Some devices (e.g. M.2 cards
without auxiliary power) may lose PME detection when main power is
removed, even if they advertise PME-from-D3cold support. This allows
controller power-off to be skipped when required to preserve wakeup
functionality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 11 +++++------
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a9021c99ece17504834650debd86b..ce3093cfd1608f1616001cbf5f541a4dc3eafea5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -16,9 +16,11 @@
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/platform_device.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 #include "pcie-designware.h"
 
@@ -1218,18 +1220,14 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	bool pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
@@ -1269,6 +1267,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	udelay(1);
 
 stop_link:
+	pci->pp.skip_pwrctrl_off = pme_capable;
 	dw_pcie_stop_link(pci);
 	if (pci->pp.ops->deinit)
 		pci->pp.ops->deinit(&pci->pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ae6389dd9caa5c27690f998d58729130ea863984..0af083018aee29c1f0f4385dacc6e878c8d040de 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -447,6 +447,7 @@ struct dw_pcie_rp {
 	bool			ecam_enabled;
 	bool			native_ecam;
 	bool                    skip_l23_ready;
+	bool			skip_pwrctrl_off;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1


