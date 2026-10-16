Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918DCCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=saxkIlCiRm98oCdv5a136rITpS+jtk+TC4pNKPpq7zU=; b=2sj3JJa+4BVkEV4iAKDDBYxon0
	wppXQDfRRA6BeNhO6HgNZ7g75WMozHdmlfY6efc+HKAmj7H4mp9bvtM6Lyt55BuwzejguadXNnMYq
	eElqGrMDXjXCbaczzgBRxtlS2n/B/+GKQ/0W59thycm8XUZ1/mOb5gbOJpvCKx5sngIOV+4H+EAoY
	2WIWdtc2WpBjeGBD/O09h1QHmCUZkfEgDsdFKbk5nyAUvpYLt09EoLTDutE1x34Y9xwCOBBqnvcrs
	Tciu+gqDZjI/D9hlToYiau3iAw5hD535/nFg6jROWXysNCZKANSUmA9h8PpgexWvrj4fXiuPQiH9U
	gpTX8ecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnlB-00000003udz-1VcO;
	Fri, 16 Oct 2026 19:38:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnl8-00000003udJ-00QE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:38:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE697Q2455449
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 19:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=saxkIlCiRm98oCdv5a136rITpS+jtk+TC4p
	NKPpq7zU=; b=d2BVoisPlOZmnH6iLwLwxW7VAC7W3ceH0VXWd4e69HaMaMRqp2I
	mx5V5RNM0BPiaesoWwMd8/Uew4tqIe1UNKiVVu7VNLjNPw8PPHWtENow6ei7hSXU
	VFOaZoJMQl0DfRsndwgZKr/Gp1mdU1vPPZws/taJ434nK/N683EPHIJGQ8ejQnj5
	xigJNhQVaTDzTj3io9yLMvU8azSrDwba+occTC5CuvdiAsq4+EA4VCiKclLu2e65
	U3tpFn1SKwHbfOcjnkdHmQ1aLn0lleOcimoN6CgUXaZIXx1kcseRwoJtPD61206C
	e+SNhZUhBZ9az3hdB9QyCsrfkxbyyPmsgJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5ytkb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 19:38:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso322196eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792179507; x=1792784307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=saxkIlCiRm98oCdv5a136rITpS+jtk+TC4pNKPpq7zU=;
        b=afkEazE6IwRGkV4H8JSw+AZn0D+Lx/goHQxsS72glfRjlFd4zWRylwSmdf14JyGMGA
         1AeTU8m1yd3q5OguKfn9P7DuhGcXA1oQ33Nq/KnX93jaJe33iaxY4gdPOO5G2BFBvvwF
         WKBlrOvQHvVtDNc6C+PNkTRYvhJ30N3XXzaQF6ZzSukUOHo8R3iLWybyyupmmDOGReT7
         YaCLDMaaBXb5cj42TdZ0LekeJYYj3YrZPysVVAxNq4HlC5C7DipyX0yq5wzMXtSdAwz9
         KMg+Zo5oArhx7UGSLoq8v+oQ/Bjhvwz4itKCj6iD+BVbyl8pHn5f1y3fxsuFFaV0Aeda
         Umfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179507; x=1792784307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saxkIlCiRm98oCdv5a136rITpS+jtk+TC4pNKPpq7zU=;
        b=GuHC9DZBqeWiwBMP8BRy6ZmC50JTPx4ioO7rcnKoWL/z10S2mDRzUt5wY7tJtTHur0
         3BPwxlrWe9rcNt03rSMqGcxM0AukOHE6U3T0HHj/uUYmNj1s3KDzs+W9rPiRGZVTi1VP
         l1a+k9FGo/4tx8UwTDJxtVcRYeFAYlT5h02I2zhx+BDddWPdY57JDcXyiIGYEunF+vdA
         yzk71MhWG1Y/JNVGYsm+iXf6NMLWAZwvUsTzg3XFs9kOdlq+l2msvaXBM5IvIPY2NW0S
         8aU6ClfBh2jvxha7oQS32o2IqfCTeBpu4D4xBfsONjV+CX0q+xJGQsiVk3ufvl8pwogq
         2BMg==
X-Forwarded-Encrypted: i=1; AKwUvBxD4u5hqTCkg4C8S+qx2GO1yuuIwmafZlh/f9I8zQUVU42RVTWl6xQmhJ9QAHEFCJMBAtL51DszYEnb5TeDoafP@lists.infradead.org
X-Gm-Message-State: AFq9FYIHhEFRfLbKU9PpnHq/Zmk26eCfP9jioQ6K1j+xN42bXoDmrGWF
	lLfVYiLm6h8A7xQWLupjEYZkqPVdsmp9xtwcFnz7Loy4558FCBXMWbhvpDSK7mGI1bpcs0vqkpy
	lm5obBfK/4gUoyu/7JuiUutG4bqgCfzMmzSd7nfizDpmtJVPvbRiHVybjEkGQ+iYI3UfVRFD5FF
	qqBA==
X-Gm-Gg: AYBFou2Q2pmYKTun1IWqik9+kjuB3pxHGYdx0UirU8Hk4pp6GJw7rPR6B42c7bj1V0E
	IRC+qnw1rBP28H8TgHapSiaGJDOQZCpCfSZFMA6t/yOIsrJPLZBk3X9Ap/cCfRdj9dTcy9IkRj8
	dP1WAW3/Eqcxt0t/AQO7cQ1sAC13ZtQjQrMYrvWc3cZgq/LYhGZ9WSpbJoyl2NmV9OYykynKjsf
	SBAhfZNWk98hm11l9jVfSDiNFT8Ml7hJcqPEpuUV96wQO9SqpdwVnJrGv3fi0GXW1j/vKVBLM3L
	Ze0TMATx1iO5u8MuX6zoJsoPsLLq8FXxbOQLYfyXI6wda6G8nwT4N1H8lMnRcAG4MoD4Eq6fi2D
	yTOx63C/uVuN9CgtVaLtuTOl/SRKU0gBHwLi0YIZR7ujlaJ7ZqaQMyDEBqeXGZi8=
X-Received: by 2002:a05:693c:6311:b0:35c:9631:f389 with SMTP id 5a478bee46e88-361a136acadmr995292eec.17.1792179507163;
        Fri, 16 Oct 2026 12:38:27 -0700 (PDT)
X-Received: by 2002:a05:693c:6311:b0:35c:9631:f389 with SMTP id 5a478bee46e88-361a136acadmr995136eec.17.1792179504724;
        Fri, 16 Oct 2026 12:38:24 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm8960205eec.4.2026.10.16.12.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:38:24 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, j.raczynski@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        cs0617.lee@samsung.com, abhishek.chauhan@oss.qualcomm.com,
        lorenzo.bianconi@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next] net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
Date: Fri, 16 Oct 2026 12:38:23 -0700
Message-Id: <20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TXXJ_ORxaWlV7ciGFejTzz7a6vZxJxag
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad27d34 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=x3-vh77kN9uJXWvyjNsA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfXz9hpmUfQUmgm
 FFhWbgekyhe6BxUaQ2aQ+Yu2/bMxJ6ODMuJKC30yNouLhoZYW/VdPu1AE1zOgT+US6hvdwfl3Gl
 UmsdUs1Jrl/2kn5VoBJHkxJ6jGj12n4=
X-Proofpoint-GUID: TXXJ_ORxaWlV7ciGFejTzz7a6vZxJxag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfX0aaA+3F0HAZD
 Bu18QqqI827AjK/rnY/K76JyHLoVSV/iaY6Kc9WnT4ZCZKzk/uFT/A88wd+FPy9sURMq+kn3RR8
 TSVbrvHdRZAx/sH0EgKe2CCcVA8jvA5CYUM/btW86nZziqVlPPSnzjYzHvDJ+TFsU34bB9dg9HI
 aiOHkmok+W+1kOOetFmPCq2v2Peo8ZivXvdpVDfnk1Qj/BWqQdD3bdjsJ1/YvERUoWMDHQZSUzu
 848M1BRTf8yvF2/k+pJRkwkp+TZA9wQTj+BH9lZqFXTL1EP68HCM/e9qeSz1sFVZTdR+7Wo9H+G
 bpYts1Dra+XHUCs8sK4gAu0py/Lw4NYHRo2QTq3YbZ04RdAGm1Iu7vD9fuNPStyfrTMvLpNICbd
 evxbyQlfvID6bWL6SJWAI1QFkS1ZN6C7V4yu7hsf43xSrVgZz1k4aooAnCy09+SOEndJ7NoJQy6
 PTHa4uYRdKxLVfcIZkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_123830_173020_A6A6E645 
X-CRM114-Status: GOOD (  17.86  )
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

From: Jakub Raczynski <j.raczynski@samsung.com>

New datasheets for XGMAC (3.20a and 3.40a, depending on product)
support up to 16 MTL/DMA queues. Before we increase max amount
through macro, prepare dwxgmac functions to handle that.

Queue numbers above 15 are not valid for this hardware. Callers are
expected to bound them, so reaching the default case is a programming
error rather than a runtime condition. Use WARN_ON() for it instead
of a netdev_err() message: the callback has no net_device of its own,
and a message-only failure in a void callback is easy to miss, while a
warning with a backtrace points straight at the offending caller.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
Patch 2/3 of Jakub's v2 series:
https://lore.kernel.org/netdev/20260601162537.553512-3-j.raczynski@samsung.com/

Jakub has confirmed he will not be continuing this series, so we are
posting this patch on its own. We need it for Qualcomm Nord, a
25GMAC-based SoC that implements 12 MTL/DMA queues. Jakub's authorship
and sign-offs are kept.

Changes vs v2 2/3:
- Replace the netdev_err() + return in the default case with
  WARN_ON() + return, following the review feedback on 1/3 against
  message-only failures in void callbacks.

Tested on Qualcomm Nord with 12 queues: the MAP0..MAP2 registers were
checked to hold the expected RX queue to DMA channel mapping. The MAP3
register (queues 12-15) is carried over unchanged from v2 and is not
exercised on that hardware.

This is needed for XGMAC-based hardware with more than 8 MTL/DMA
queues (Qualcomm Nord has 12).

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 21 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..6d4affbd34a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -257,6 +257,8 @@
 #define XGMAC_MTL_INT_STATUS		0x00001020
 #define XGMAC_MTL_RXQ_DMA_MAP0		0x00001030
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
+#define XGMAC_MTL_RXQ_DMA_MAP2		0x00001038
+#define XGMAC_MTL_RXQ_DMA_MAP3		0x0000103c
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
 #define XGMAC_QDDMACH			BIT(7)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..563d29d72543 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -257,9 +257,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value, reg;
 
-	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
-	if (queue >= 4)
+	switch (queue) {
+	case 0 ... 3:
+		reg = XGMAC_MTL_RXQ_DMA_MAP0;
+		break;
+	case 4 ... 7:
+		reg = XGMAC_MTL_RXQ_DMA_MAP1;
 		queue -= 4;
+		break;
+	case 8 ... 11:
+		reg = XGMAC_MTL_RXQ_DMA_MAP2;
+		queue -= 8;
+		break;
+	case 12 ... 15:
+		reg = XGMAC_MTL_RXQ_DMA_MAP3;
+		queue -= 12;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
 
 	value = readl(ioaddr + reg);
 	value &= ~XGMAC_QxMDMACH(queue);
-- 
2.34.1


