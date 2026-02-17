Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2267E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=; b=E4y4/ArjpeMvPu1VdSdd8R0rGJ
	9HjtC62kfAEa8+/U9QuSjuSW7jow/4OGsmht4Ylk30b97GHeFvI7g3WzYRpsaZhk6w8KJSBCQU5VM
	3rmLfKwTRvppPn+V1VahBFdRuUt6L808tDsWF3H51xS7Q+K57P7tpje8UZNYSfV+DCvT81dc0BLaF
	85WUUBXi+ecs2yrsEMqv4MM8JStSz0eabtsEi36AdSzIo8TBJ+BGf4d8QsZ/V93Dtqsr2MSlh3/4g
	lINGRtx4pLX2B5xGb/q5Cr7mLpsyir+aLHz9+smOVitXB7hVF+QjNe19pyhmD0+WQTPTM24rHIMcp
	Ei70r+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ71-000000086Gd-2xjA;
	Tue, 17 Feb 2026 11:19:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ6y-000000086F5-1UNe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7x27911039
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=; b=OYHGcIeHtSftBEjf
	JAIxbkCxa2n0CVYJXJgTn7akXtjzV4q+UW0WJxImaqudghK8tDhl3NVscWsw28ul
	9V4zi0MCRnvmi5oBje9o5eTTIR/UP7e/8cVHYUMj71WPZzE/R9Rr0/9ny2aNDqoj
	R4UfvrVt3a4z7NUknitxrCDn64ab6HOdOY5RLPlfZHga2BW+vxZv0TGtiJLJL58E
	T4E75T+y7BUYxAsz/E5gqgxx+VBiqMMyM4UnoeYAlU+weKugg19LlFY0sx5gZbc3
	+9M9VIAstoxCZuhKHDOJodR31csLsAvqn/JhweNlvJdd7AlhS2TmYBy0rQSVyFYJ
	yKn4rg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t3hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8245982e538so1856686b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327162; x=1771931962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=;
        b=ij2xrZ1dttBDokpOjaNBKPNZs9Kl8ej1swKHTClX6dx7mrHAi+luhJfMQuhIml0qFK
         9vQsjqdfpE5RmstINpBNs/c2ohOXvVUXFqQFVVegG2y9UG95bUPYRt5bLikxsO2ntulw
         p8aF0lbWwLSfah2QVnADSa5orDfgF3QtoeZVDsjlSdcQtFHsaWs4WiNCrRf/GDd34Kp/
         BYTy1DKQMa9v2iOB3hFN/sNaK7an1pRKDoVymoKrph5MY+kW3+wo85hutp1jX9jqnqdZ
         A6JIXR6JhYXqW3ZLSgvDwg3UmL/LtNspSY1pHcDpI8YCAnsFb9UKLIZQQy26TBL1Prrn
         OMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327162; x=1771931962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=;
        b=obutUmIFOx5lTVbdD7w5qiJrR3D+OrC0tRiiivl14fF4aK0x06V0YR/TXfShVFAfPa
         hNPXDap0yfCcuo/UPtdCpNCwg9r3tKQrgQO2i6qbj9wvSSNSnPdwCZvUH1WeTwBSe3RX
         I+IMN9uAzuYahjWHq3tdgIR3RHGbByEUePTxpsPh/erwdnx5nG2oLyLYDTctSlX5vPxy
         atExJEJLZvpfr1f66I4RIQp2PwyPD+6cQgQNCxOB55eGfjUe85m22CLnZ67yjfM7Ey6w
         /A6Knk+vwD8oxKV06zKTMdaRSTGkanIQTGmA7jESaczNVyoCMpFpjMlTG7EnFYz0ErYP
         NmVg==
X-Forwarded-Encrypted: i=1; AJvYcCVKHP1r76JsQF9xT3WmLXnz6FpsTJteFIJ241Yu9oYoFiaeayu2UOeaJI4frR9BwRv1tLknpKz0OCT4Lc8H7v71@lists.infradead.org
X-Gm-Message-State: AOJu0YxuARoEqkg0WKZ80OPE6Z+Yk7r6UDV/yV4+uY84g82acOh8rvfK
	qJoB7Wctl0txI3aNLiwugsswXdSA3p/Z+IqXBzS7p4fNs+iN3UMyRffjDBayteWy5vOsZrdrFkD
	m9SNmorZDOW8ZYlDCiCZ7kgwF8qWyuRRC3uBCLfGtcV9QGy/+XXsAd2Eg8+PS1QUzj69RZiuw3O
	t5Qg==
X-Gm-Gg: AZuq6aIxSInK376uAkhzpOTk43dm4lH1BWPmhNqlL2bU09L05I7x5TWDZ53w2OLYzad
	+Wk1I92cRR103mW7JQkOUlEwX5Ht/3D8ShdcebtC2/YwY+y4aQaawWgLyfCZiUs8oza5tZ0NeY0
	yjN9d8V6YOvC5vlrvhhwCuXL83FYCyTqk00uChnc4CQ713x2ij7Jq0FyOGEQcQPVLiCC+J2t791
	oGkkUNrsuKpS/g5Qri3V9i6AkU6zhlL0i6ugY/uJjUART1Ju6qFiCt5WwzZTBaNqeWUnr+FZzEs
	Wu9s8gr2nRMSECRMQXxDUsv2a6SF+ZLBPrKa3AeBamet6xNGhIrEHulH2r2ALpkz0wjZNyNsWYG
	JELNWHDR9XLY8cFTGYt0NUjy0ST+b/e2Bvncw/Z+bzZRBjTQpCLiXNiMV
X-Received: by 2002:a05:6a00:2444:b0:823:ec5:430c with SMTP id d2e1a72fcca58-824d5eb79a4mr9451777b3a.29.1771327162384;
        Tue, 17 Feb 2026 03:19:22 -0800 (PST)
X-Received: by 2002:a05:6a00:2444:b0:823:ec5:430c with SMTP id d2e1a72fcca58-824d5eb79a4mr9451756b3a.29.1771327161858;
        Tue, 17 Feb 2026 03:19:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:07 +0530
Subject: [PATCH v2 2/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-2-89b322864043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=2041;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TtbJw2QxkiBmLJKp1okcAfp6LW1NcrShntWzlulImc8=;
 b=YWmGKKIDBl3wYoKkpN/uTl2ahJVwSeE+5nhAt6wtBrGX2sN86iG3g8H4fNwHYNFYCQvszbMOM
 qBFuDArb0YoDjIliFHrt0hfLTqnbaWrwXLZ4WkXsz6TBpW+1rxpcmoZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX/0o7/YNbL0yi
 NE6+5OZwFWadGlZcHEh/DO29f1s5YoHKcE3AVyZEIeBukSaDxZIhk/mFTMme44sVk3GDNOQQYdM
 iiPRDxjBal7S1afmvRsXjT3TtjOingjWiJ8VbmkxU4PVir8ijTPrB7zUG2SKNK2rZ5zbG3J+S1e
 hFSQu46CnYxqiv1smdVbhD55iJce3xBCTnrYZIVQ2h+bfdBxybwZ1hw5WWsLNNKgwN6wGp1ZsRw
 ZDjmrydmEhdMPOmCfgu81jns6B4usVMpXxNONn5P0AX5SxLwcA29FkULLnSwSANmDNogREByx67
 q6UufPBVraLeMrvyaaIOu4orckrUcSqaF76SedzkzAUGqlfPFXm5+LM1sQgtjLykdJUpcvs9zD4
 x2BkxfDY4MRv8NkgC6vo52iewtdb8Rs7H1QDE4D7b7EUjhSnrSUDRoNlqwIGQw9+M+oTR0ClVgd
 wwn6dtA9t/g69wy6bmg==
X-Proofpoint-GUID: HhbbwKNefq_lgHG1bEYP-mg5dNv1_eKh
X-Proofpoint-ORIG-GUID: HhbbwKNefq_lgHG1bEYP-mg5dNv1_eKh
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69944ebb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ir7Wv4stjHWE4dv3774A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031924_599676_00406202 
X-CRM114-Status: GOOD (  19.18  )
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
the shared pci_host_common_can_enter_d3cold() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a9021c99ece17504834650debd86b..713aa64553bfc988717cab2936935bb43aabd72c 100644
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
+	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {

-- 
2.34.1


