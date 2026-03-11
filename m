Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CEA1049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=; b=OrG4DsNR1gnAv6c5UCMJOvGfkP
	Jl5AfAb4PogjIFYBgYtkVqimCrlx7S5Om9nZ9P1GZ9NJxbH51l71ZbdE/ff1XNnySdjewhU/VuoCp
	/AR8rY/gyU/pbztVUTZKsGy6QQ8600hOgnrdQ4Ip/F/f47jL7f4J7YoN83I4Oio5DZDdwY1/zYpik
	BRi6EwqlKengiz6H/vm1aKU8h+XKrqpvXPp+XbHVxQgOY/MGtCiYWVbgQn05PVbXa6Of18/dPIdXM
	xQ7GmqKnhX1Z1N/b1IMxhPyqQiNCJ4wvR1klbvem8Z7XqXxuO6MvVl5x/q2jgQ+kRKQDTYyDrReTp
	nqsti8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmS-0000000BQLG-1HBe;
	Wed, 11 Mar 2026 10:27:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmP-0000000BQJQ-1V4J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:27:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6h58X2676239
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=; b=NWpqu4qpYeNdEAU2
	Zw3gI9JLNRKEHETOmCIBhcuoVhKMbGKAWXNtnSWM0OxhA88q3ej//Uh4Ta5BTV4/
	bUy4E6SFuSoX9839JDh4zR/WIN4gEgGhML3vvEZowhHQpncaGfcBByAZG7tUvbr4
	WGJmCnImw+ufB38vvsHNde9b3AVFOwwzu5/ML6N68HBmWfOooBt1z324dsLOMe2t
	sM7yioQTjr9B9dINgnlOLlp3AtdvjDx53wU/TyPiWyoMIU48pbtg/UkyfynHP6rB
	ANJKJ+VmF48zI+EwqfzTYb5xzyrzKaFNDJCysN2Ya1n6wl/EVv2hPQhnLLLomag1
	H0rR3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0vva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aeaabedbc3so79964795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224824; x=1773829624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=;
        b=GQrytk70V4I/588JdEBqtab07ncj1qnJgzO5d1N4iICtOMzUZs0EDWAflTJ8G5ZKEV
         dRLYOyzqGvdpir4PngCJ2SCPgbS3/bgQp42GQ9aQ30lAi/1ZRa7REoJuByuONrFWuwpL
         ITMk5Hh5QAGaGaXlrRx7FY8SpRKFmx0WWRVeLwc0/iqRuPmOHEp1tnDrB+aWU8yZUM97
         Y5tucWtayJP9fXzQ7kfwaLG2n8N/uEpZYZEdYMn1ES+jQCvikmB8zmHuZYnZBgnM3ATP
         ul5gq6RVHWk3ilRZfY3jzjzWLLOFFyoyckQXhiDfzKqEfpjQ8n7nUdAnAm1cegIWlnh4
         BDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224824; x=1773829624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=;
        b=Nc44CidAcDbzYYOQsrCpidhT+WloqO+N0ZGqJZxbU6arv+Xqq3VavE/iahBTa6KSBl
         sNrL+q/H0d0zbkQAauwXmhSTEGVom+vAIwV75uQuQkdnRjCEvalrh/AJn26D4OSp3GNc
         whyVRSrtb6czBkMlWhtSvDmCn8f6BUmCTVSd3jW+14cNeCarIZwntkJV3vI1qCWRHay1
         lOSbN+fPLWgLH3U8eGRBCdfrhohPOEPqcwlIZrrRlr62sJIE+bukD0YKcEeupT3JtAmu
         knNyBG5pDRlO1k8hT/KyV8qG5LciyrFmR6BuJllOexzGjKABJwS8IbV4HepHoEDjESe2
         Un/A==
X-Forwarded-Encrypted: i=1; AJvYcCXFohxKV+fcw718/38T92NSOzGc3FfchgEbpj4ecoR13vv4H2IgW2JLPD7jzQQpWGRLOXz+PXdYNCZvN7YDfaPS@lists.infradead.org
X-Gm-Message-State: AOJu0YzOFje7mYQ6HDYMyzaE4gfEaqjXtT55rbk2SQLqFbxfDpt2dFFg
	RODclFfZW1/xoJzt485Sj+14vH96t5Ofuj9FgN/soiE+mBOmyTcKjQ4mkgCZCqJwwNdfCokU2/y
	xHrekc5HEEx6f1XnYmMv7cwScYgsR79lYvd9v+daolrAH3VenJwSitzvZ0S/RISi8+Q0yeU5vNx
	Vk+A==
X-Gm-Gg: ATEYQzzmDZyjRToyZSIMC02KrKbkU8rP5VKmS2Gr6MM4IFv4E5fw9nZ8Wm8GpTc2tDE
	l7JZJ9mKnB58R3Bqy3g5D/rCi1HsUcFaYxSO3yexoH2vMiR8JQJTe/V63rvC0lnvP9fe+LF6C4l
	ToJZoWGtUvdtfm7KvG5708jZxEcSKS4PqtY1aDF9ZH2ASxAL0hGScDl51xWy+DLebo8TzET1DLY
	fkzDwhR+U2n0ncJ+HhdxwKUnq7tmerswEJ7WBD0/+2EWK2OLOSsRVdaHzlD+HuxvWLGRPuTdcIt
	J0sCZZ81Aaur13J+OwiNR+X2gpDHlmuWH1M5TTBM5PPGZ7Hy7c9drPLV2/qvDfleDbKlA18A7c4
	GGybfsTp1TWbsp/0oh4pvv/9C4t3R0qPKUAA+CV0OYFI8gzPh37gDBeae
X-Received: by 2002:a17:903:1a44:b0:2ae:5c3d:b07d with SMTP id d9443c01a7336-2aeae92201emr21189715ad.57.1773224824341;
        Wed, 11 Mar 2026 03:27:04 -0700 (PDT)
X-Received: by 2002:a17:903:1a44:b0:2ae:5c3d:b07d with SMTP id d9443c01a7336-2aeae92201emr21189435ad.57.1773224823861;
        Wed, 11 Mar 2026 03:27:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:47 +0530
Subject: [PATCH v3 2/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-2-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=2039;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=fy3UTBHOugmoB20oZcj6up7VhBsfAepWi8HvjyVSVZA=;
 b=X9FyPw8OeaPRkbA/4PgAqOrpJ3qLGGhtZbOFwSw2LAoBmZPgdHkRAjhXRnMO5NP+6NqQGzOj8
 tWPIdnBqR/FBxj4CKR+EFFQiJMwA06TT1HHCWG4Qqad+24waSRSQhTl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX3tbLNegbySua
 cEKncjxSCwwMMh/rnBuzFmu8imY0HCCV7qVVE8mhreqQGqW1gn6fR5DZFTfb0LIjw32/4qq9z69
 HfAIXfGcpCd3fX2lUM8SxFGL+rtfMw5nYB8C0XWT6jwX9GoWtqB5HkP9CMLmlD/o1OBorriLygz
 dqLf6LO+sfvqVUobR2iAGUaVntLiVoysBDM1IZk9cUXts9CCDxFy3i2FvbH53Keztud7W3Vzma7
 oSA2GYE7xw20EqRjru3lybyoVjz9+1it0/+r9rV48ZAaYftMpzyAnyeDqmkgLWcVY4HuxSdyxyu
 pn331v0uWLvvVoQ6Z4i0AwLH8d96KgcNTZfqZRSaLidB1GM5AL2Rycnh9aRVmQ29J3UtHAFQbaE
 DN8vGWFkBfRcZjRZNhEaf0W95BuzmVTCpPGOwOP+iPGA/s0zYK284EfxsTmc12wbXVv8hENBc4e
 915cLahlAw+Ym5w3wnw==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b14378 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ir7Wv4stjHWE4dv3774A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T_SPF1yEyMXMkwdICarUpN_ePgMxcMAb
X-Proofpoint-ORIG-GUID: T_SPF1yEyMXMkwdICarUpN_ePgMxcMAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032705_405318_2DDD40F5 
X-CRM114-Status: GOOD (  19.34  )
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
requirement that all endpoints be in D3hot before the host bridge may
enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_d3cold_possible() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a9021c99ece17504834650debd86b..8e81f0208c76fb22aa908de4e1ff379ec0cae2ff 100644
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
 
@@ -1218,18 +1220,13 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_d3cold_possible(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {

-- 
2.34.1


