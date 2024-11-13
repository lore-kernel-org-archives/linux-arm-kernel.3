Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F9D597C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 02:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wrS5V6QqQdjAm1CJE52YfzEYxOapXl5moYDQhB+kuK8=; b=oO6AXJIT/XyI13w5EcymupPAQd
	31Wv13j6HykGJ9BKxXnU8Kmknpak0H2BAEvvARaFVwoMM/eTFLzd+LPA/AaIbhvzwloOnnh0U0MWM
	TK8aDQwHL3qawQR4nGFfOP9PaRy1kJ1o2C8uuh60CxkqmDKUDAdode0hpOtvoV3/Qbh/3wcAnDxCj
	ZDPsl+JZRzocLDLKtq2QI8iPWV63nyy/nE0f6fcQ/0qjnbEJsFOGvmmt1YijTcBOVqsluvCGiHvnc
	hRC1hwcOLtfdvbKFGXhDo2vXAUTNRYThXY85f4n23gTVqt+ZpsE+qH/ZntgpEJQWZEVn6QJ/k9HK6
	/YgAokwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2pr-00000005ZqW-29Ws;
	Wed, 13 Nov 2024 02:10:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2o4-00000005Ziq-3E4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 02:08:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRc74006727;
	Wed, 13 Nov 2024 02:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wrS5V6QqQdjAm1CJE52Yfz
	EYxOapXl5moYDQhB+kuK8=; b=D7hthHVqsWDnTv6qlOeJcLceiYytUOgvmfQQkz
	8tyrVoqr35Y9z4mbzXLzZlhq18ugKPPFEExo4rb8mbm2wMgw9K+lSebo+YVmtuBn
	Z/KZrTHyTWNvpKsOD6rrzZey5hLaH9wxEeZV9shGLYUjmJmVxw1VaMdfGaic/3bt
	UxLldz3LYGxfACFHcVKge8v3KjjGYniqMYTya+RgjbCx+gXbtJvXA6gpaOpVmyxH
	rXKBB+NesYgXQBXaif+0MKG5eEgkGErOgvSdBEf7sPKqdRt5QGjibgeiLsv2K+G7
	4e7CoziDRwiYqqRXeIAXChvzSqAFnqFddFBYgR8cXZqHtAMw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqham1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:08:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD28MKT031728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:08:22 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 18:08:18 -0800
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 12 Nov 2024 18:08:10 -0800
Subject: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAkKNGcC/x2NMQrDMAwAvxI011CZDm2/UopwFSXRkMixnBII+
 XtNxxvu7gCXouLw7A4o8lVXWxrgpQOe0jJK0L4xxGu8IWIMg+60ss0kdVrNqRr5lrOVSvs4Jw4
 9pjtKevBnYGiZXKQ5/8XrfZ4/4ZsP8nIAAAA=
To: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "Andrew
 Lunn" <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JmDc_Ndj2oTaDky6KH4Ep2BtCJEGIwsk
X-Proofpoint-ORIG-GUID: JmDc_Ndj2oTaDky6KH4Ep2BtCJEGIwsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_180832_860585_041701B4 
X-CRM114-Status: GOOD (  12.56  )
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

All Qualcomm platforms have only supported EMAC version 4 until
now whereas in future we will also be supporting XGMAC version
which has higher capabilities than its peer. As both has_gmac4
and has_xgmac fields cannot co-exist, make sure to disable the
former flag when has_xgmac  is enabled.

We want to keep the default capabilities as EMAC4 and enable
XGMAC support from the dtsi based on the platform needs.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa..2f813f7ab196 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -872,6 +872,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
+	if (plat_dat->has_xgmac)
+		plat_dat->has_gmac4 = 0;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;

---
base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
change-id: 20241112-fix_qcom_ethqos_to_support_xgmac-d1a81ea9cbfc

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


