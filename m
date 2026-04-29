Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7DBFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=; b=EWxYmHEOSJdSpHhn3giHDOk4U0
	RVX3Wr7ModrkiM+pbhCkFU9VJV/G3iYJGFV5pqe8Kov6D2qVABE7SaMwPXYVrhhwu2dlYA9oG6sn6
	ozc2HchXXZ1/jz1+7NE17a0G2KO9Y8phnvncLtJ+YZthQ5r87OqatAQI8tDq6vhl+NMM/H/ngllVy
	k7PY603/OhmO8rfkfhOcdS4WxmXs7A2XLahv1nWI3NwSCaSK496kIyIAuYv+WuuU4VaIlejp7+314
	R+QG7UXYZ3wSWEQY0an2HR6fO+g9lh5AgG3+soyY0yz3xs9pEm4oLNLadGya87P8rEdE8j6+fuskV
	W3QIZHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydQ-000000032Vq-0FSp;
	Wed, 29 Apr 2026 06:43:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydK-000000032SW-13AI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:42:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2mS1W831361
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=; b=ZOIJzAjHV124E0r8
	vvAd0/8TOxAb3YmeRSYjmBBYHwmr1tdXxZ+6rSHSwilKkIEoZtCYY1ogZsZ3+Q+g
	rak7iJtYKV+/1AIigcUTM/mKoZ4Li8O0hHA1n6978Uz/FAFBm7I8EBvmIYSf9i5K
	s3YfaAUupwv/NSIT76p+I8o0yZKugbp3YmssvFXrntMXi3k0EIg0MCjXRWQD+UEm
	wkKcLgzalGOT9wYjBOtgJPyZ7mQdNFZ60HLkUU3GgNRdvbkJiXO8F9FBoBh/kK8D
	mgoSGkJosl1ybkhlClK20VhOr1r64GNyLEWisjKAi21ykoKRmA8RhRqX4aefH7hF
	/bzGMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqaf07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso584000a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444973; x=1778049773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=;
        b=KGMeIDNMU60RbYQVE0EGmMinvl75rjhSilh0Ryk/rPVSjmfKWX/cFQf7qi3CgLuSci
         q3busC1TSAJROXgS/Akoq9tz8h6dk6N//svIvD/WEQN3bWMc/XR11APd7sHNtds/x+hb
         8EEy4RfVDOwo/aW6Z7JcPDZwxH3YcgSvXqR0rF1w5BeM5JCrTuZOyraSqWhZcTC+Zz3U
         Rmv0pk/UXbrBZ0MUdAUzNmKBWl1hSNn6TYW2mRbwBEwLY3AQr0xtZLamjmsIE3weG/2Y
         WQm3uTDXmRazo3WxYNYsjEd+ZCscHGn1s8ZArc4+0a4R0t1pHBSPIwENiM8J9Z1Rxc43
         7ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444973; x=1778049773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=;
        b=kyk5TMhm/IQdaLDge/OA7a8Kz5tw8asEXcQtS8hCbM0Nu2rYeaBzPTqdRNvlAuQ5SO
         hYNoYnq2g9iPrOHbMW8qDa8jfs8LKHV1Dplimj5D1/uzv5w06AxM2fy1QX9UFMgIzt6U
         qfnP9W3bUUMeNgYKEyr5zpKc6Z28aWmnCIJgaqAqWqgVVVMY8CsslcHpd7xMN6R1ZM+L
         h0oaT8AvX1EoeJM5imLDGDa1LaCiwUrXqoIo3hUWrB4HvziCZ8TH58hQp/PGDl/0WrUf
         w+6N44oKUuRCCvlddJWdz02AZDFA6b51ZnGFMSWVWLpnt4uT2VAX4HmdwzPurWgrGLhc
         TCYA==
X-Forwarded-Encrypted: i=1; AFNElJ82VgVUmmpQHkigqlDwlTcfYXwcY8q4knU9NpEAj6KIQwZG4h1fB3LycUYnfy1UgpXtDweZipgUcDW+ue1Mgz5n@lists.infradead.org
X-Gm-Message-State: AOJu0YyTiaFG1d8Dc9dxiZ6EcNJiItBFBi2rxPsNXy7FXcFO7Z3VnKPV
	sRBngex8KwdeFP5cKv2Jt0p2uJbX7kTzRrI+Kfp4R+A26wsZ0iTZsP/KzphkFWAtYnZQbCH17Da
	vIt+TV99x4XJxCTq9rMGTyG2lhCM9ia4tmRjiEeicvbBxBe9Uigd1wDSDgHkinQizbYDJtEt0s2
	haEA==
X-Gm-Gg: AeBDieuQ00HKycUHUvxMiKAyY0RUAOSHGS2j5ZeU8NuulLETOjXBjDdU97ba/dZ8x7e
	QarR+mIdyJlAn13TS4iNgUoc9qGymRMvZXh8aPckJG5lGvHKQoqA433LP4gOlBuhlZ8Eq70/Jwt
	SUgWaLWoW7zMQqihshCgFjl9VT9zOn+suArpdmxiByTP0o3+fhuM8vtrOyWHfiIjHUfmeB2RZSi
	j8R+xYJwyT9Mpkwcb0ED7Y4MV2jLiWTaVUOqT9XDqdz+NL8RFryx0MWgnt2UR6fvZcAi7HC7PTT
	XoLejKYLRAhkRmulfvIEunXkVK3+jDWbDmoletIE3B8zkgcJakGkNIHb5fsiSgcYnEOjnHClaCC
	0bqATOGYpOWV84l+ejT9Xpj4oc16V1l1qaHuSqpuqpLQCRkVSA7r1GfTzBXtZcfn8tYM=
X-Received: by 2002:a17:90b:2d0e:b0:35c:10e8:1a72 with SMTP id 98e67ed59e1d1-364a1e91ad1mr2070796a91.7.1777444973106;
        Tue, 28 Apr 2026 23:42:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0e:b0:35c:10e8:1a72 with SMTP id 98e67ed59e1d1-364a1e91ad1mr2070761a91.7.1777444972599;
        Tue, 28 Apr 2026 23:42:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:26 +0530
Subject: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=3749;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5PQqOmdR5OOC75CCpY/aytMD49zycczPJnqwX7jwyag=;
 b=w+R58IbthfJ5zUxuVUnEnIOCN/KuwhYjhFN9dhYCENxXhUC/7WxDiftz3Zj1nuozc4k/w19wj
 NaeGrMJzDtkC/fvBKOymfM2HEcyFt57ItD5WSujJebuWSV9kTuvBwYA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: _kx2ctxtxanSx-jXK0PLWQsAoATwq5SF
X-Proofpoint-ORIG-GUID: _kx2ctxtxanSx-jXK0PLWQsAoATwq5SF
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1a86d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h5qRVDGUHOPEFS6InpEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX/zxluDBHyWX5
 3phucz0EnIu9FGDqvjH3uvxkq6DDgMODN3v3Ea6achwO4OZivFr3n6yEC2Hud3OhVOZ6UkJ/mgm
 Wq1g6IWQm8xZ7V+0ViihAvlI0PxRHwqSwg3Vmp2jeeH+L1CVX7/DJ1qRnQau3A1U/BQKXSYJChs
 hpGPyEBubXc62p3oKbNHns6DXICu7f8fil0O1qGOucvCP99dbopZr612BIquDvdOAnn2cYrbXY4
 rkXI+ee7cW6cr40NhiSXsmRMR5Q4Fk7zvW612Gx2yCDohNhKm7TrE357m5M+eiWB5uc8O7GUrV5
 HssLadLm7t0DSgWo1zMMPKu5vt/uhKsCS3M2kgkA55YI+gwF54NypJdk/cpNWxE8xmZt7UnvXbB
 fmMLYr2s9ftEU5U9yD5igCJg3HwNXyNMeB8KizU8un93pL43bviyqRt8w6uAynEEtLF387pk/5V
 LYfdVKjDeI73MIkGUNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234254_327427_E302B51A 
X-CRM114-Status: GOOD (  21.85  )
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

Update the suspended flag in dw_pcie_resume_noirq() only after the PCIe
link resumes successfully, to avoid marking the controller active when
link resume fails.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++--------
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index c9517a348836..9e409a1909e6 100644
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
@@ -1273,6 +1271,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	udelay(1);
 
 stop_link:
+	pci->pp.skip_pwrctrl_off = pme_capable;
 	dw_pcie_stop_link(pci);
 	if (pci->pp.ops->deinit)
 		pci->pp.ops->deinit(&pci->pp);
@@ -1290,8 +1289,6 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (!pci->suspended)
 		return 0;
 
-	pci->suspended = false;
-
 	if (pci->pp.ops->init) {
 		ret = pci->pp.ops->init(&pci->pp);
 		if (ret) {
@@ -1313,6 +1310,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (pci->pp.ops->post_init)
 		pci->pp.ops->post_init(&pci->pp);
 
+	pci->suspended = false;
+
 	return 0;
 
 err_stop_link:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3e69ef60165b..e759c5c7257e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -450,6 +450,7 @@ struct dw_pcie_rp {
 	bool			ecam_enabled;
 	bool			native_ecam;
 	bool                    skip_l23_ready;
+	bool			skip_pwrctrl_off;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1


