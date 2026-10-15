Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81731CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=; b=TS+De7+YDZwIt3mhT5tkAvgXAs
	XAriir6NjKmO7I1lwTBxnGosSRT2AKG8cg39q/Dh44t9hNbUjx6j/GXn+yMtNbuO5YfYfVT0CRQer
	35eUcw3FLQHuGelSA/e7rL0kiCvoGRK+l+6IqrJrBJ7+IoHO6YXpDro9ainUiGEK5uFMXpetGX+ky
	k0T4n4ZBgcRLl7oHoP/ktb+MbA7vwaJ7haA4Oq+J+OLGrKg+aNkK/RLTS0GpG9D0iBbQ29aqp+7Tq
	LdAqU+t6KhzbFbgP/LZoFbzAh7+5TzCGjtn8tUYlRIZQiLx0hymK05dzjXhEicFrUY4I120w2Hm2z
	Doao4oCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTgV-00000001Tpo-24jT;
	Thu, 15 Oct 2026 22:12:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTgS-00000001Tp1-2arc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 22:12:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI3PHq406122
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 22:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi
	6mYstLnU=; b=G6I/SeBLHeLwIHth7W092RYE7L1QUYlqEuJmyHtVKHMqbL/00ia
	esdHU7vX1BUoDW5ejTzl/ouqW1ce9bCYI91Tb/ja4PWECTxbn4tncSjGaP/SrkqD
	J7ymX6gzRbTEPpyBoKteUVarrJo8P9m1jcOGd8E5BCw/XNR9tkDmAgjBKw2S36MG
	pVUBeSwCbqYbeoW1AtCrFggHlxfJJcuIHXZWRytT2RK2NbmB744donNB2pE5CZPk
	oZKR+CxbLKzvCJOsETdTpCwICawJy9D5dWSYAh38eZHEJbPHCdnMTF3wc/XmLSdV
	VwspqVRAVMcjalQkE9IQJOzEKf4ATpVfgbw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa0wtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 22:12:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2091868eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792102338; x=1792707138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=LvL5gOtiMhwGGvBUhek5F7Q90ybWEdJXDJW+rQeYdTLxAzUVKnwIljXM8GL8Gjuu+J
         Qp+O8NrVMEEvUIxVHvqNLI8eGp/j1vyTHKHjeaY58HZL/OA7Wlt89sSEnwRUEUa5SKN3
         19oCBdjDpUkDV6JGFwnTdb8K3R7D5L5EeKYuHQmSJYh12IKc729DQR92owQGOJ3MGoAA
         l99RZ9njx17yiMw/+GN9eA/EYZlGDDkRWTcMrpy4mKtE+GO2+qsFCdrBFdO7u04kF2Td
         OlYBv760/FyQ7ArM9y6iJZOQucFUExFStmPAxIm/x2MTaxUnUnsD1EoOdq7rhebP/ipx
         aBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102338; x=1792707138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=xyIIZJzjW8+SCbIKwVrBiCinW88nd59oJOKuVDEZJmdrH3VWuNfeWczPW7KVDYHyXo
         Fa8Ox4Zy1EqA6GSY2gb8bIRboim1nQ6B9x+ayKRGDMtkZPT5DDD0R0FHR3fdYOeHt4lm
         fDqfOQ+KE97UAQElTkVi/uJz5jiGXnBKOXiWbl2gW7XavXThJV8XpgO8lZ0aHOYYYaM5
         W2+afGBMFyQc2/eUrl3Dmg6xwp05/BchePhQ4Q0dsmfMxpiAoNoDZIHuRL0oinHRLF8c
         t4wxuvsygvIMQ+jOfntiVrD5patXZsP1CGEhf5PRwvsczNKarRvypmVUG1nXU/YQI+MD
         L3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzbMZeDDNftJyp6WIyegcDdQ+YlUHSxxbE0mUBlN2cUCo3izR9UoogO8oDBrUeF+jMvhPoyb51kC8ro76LbrZU6@lists.infradead.org
X-Gm-Message-State: AFq9FYJrmRFqd1TCuRJnE49b6qKQz+czaSppzBtzBJ2cZH76LuEQMYLB
	OUFkIILu7cwLo/D5l6QFYPOBLNWKipfLCPo1igOTKPpcrGpey10wDSZSkFHemsVGkCZZV+srP6Z
	yLFZPiz/g3CjvCt9db0WEAtPmcx2q2IbaOmIrYg2Yf2eKUPq/TIIYVwT3eiuft+AoJ3SyWHGRLW
	p+Qw==
X-Gm-Gg: AYBFou3lwnXD4wFJWAHl7vwo/+TV47AMbU0SQ5zHfNyoAF+HwW29SA0usPCIK3y3EcV
	cfd7Zv04OoXHNgj6OezmSbL4hGouICA7JMgidwODmpQ63kTZhepr82Ds+NGk3kERJU9bFf6e4KS
	w3QEXWNuGP/k1iLbB4/dLAtWQPZcxfepolYvKjmeV1llc6ALNJF2cG5qvAYelxDhhhVXn35rdoS
	BQQP9+RXJIwrFhdtEazcLMnU6VZcEaDdJLuwkA3MLGKsjeME4oFgvRgErwZKo3oIfdPRhtT6T6Y
	DwvRSIj78tK3Bjy/w/MWmF87w27SqcDjs7uYldVecZ9ZANraDn0KY2pA926XGv+JqJJQTZwiZww
	7/9cfv7Uz/1jYN/2eBB/V9UylBmy6cEVUMVBBSZ2J/08UkPXF3VjA/JbqjfBkyw==
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113752eec.27.1792102337754;
        Thu, 15 Oct 2026 15:12:17 -0700 (PDT)
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113711eec.27.1792102337152;
        Thu, 15 Oct 2026 15:12:17 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm810987eec.14.2026.10.15.15.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:12:16 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header support
Date: Thu, 15 Oct 2026 15:12:15 -0700
Message-Id: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfXzmYyWkV88jOF
 iUHmqqxCbWghHEnfzCxpeEibBL290Q/HPowQy+/f4pAHmm6LxOVp3rHd/7VtdnQiqXr8aMx/Xfe
 nWRQdkJE/wWnG/Zyixnpxbfe7j0wnv0=
X-Proofpoint-ORIG-GUID: DHtCN5xnuKuFR7txQR145QwCUHgNynQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfX3SKBTPSlhq2c
 OJr1FAoyqtSI6UvA2YDLqarAg8FgJrA0J7IyfFr+jH9vWau/2yXKShs4VpJYMj1yHmXncnlK2aY
 8DVNoCSAVt/5OGsaDYBYMNobpsGIiJ9RqVA3DiKphp5F+5RSTcjZALDtW7zv8i7xEQZorXkQwzT
 R6Ttszzb9L2B6YTWZj2QCQkTj/UdRnMbbTU+OOePrcQR6X5oMaxcPucVPaOABdDXQQKPvZ83E9U
 dxXHgpojS/OJb+wOHuVRd4pDRO/kJ45hQu8NINM6ukNa4ZxbQeVwpyPw9lwmc8NYwxAcTxTdwRK
 JUg1QQdv/FKZZI9TPrrt5Qcvu07r0TizEbaGcsIQqRbBUmKblEa3xadNlLHZetdD9d3Sa1q8b6C
 CUBtOMcSDdO2pez6a7SCottqU5nTi4NJVm1bExv/ETRe085Yh3bMPbbcGD9JymWn11cGEl8qNsU
 Jn+wYOyvVzJKTxc5N3w==
X-Proofpoint-GUID: DHtCN5xnuKuFR7txQR145QwCUHgNynQ-
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad14fc2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_151220_792396_7D6BD542 
X-CRM114-Status: GOOD (  18.64  )
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

XGMAC2 doesn't program the MAC extended configuration registers
needed for L2 header splitting when split-header mode is enabled,
so tagged AV packets can't use the split-header path. Configure
split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header")
to XGMAC2.

Also fix the RX header-length calculation for split-header
descriptors. Per the XGMAC2 descriptor format, the header
length is only defined on the first descriptor (FD set), and RDES3's
L34T and L2T fields are only valid on the last descriptor (LD set);
on a non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length only on the first descriptor:
from RDES2[9:0] directly for non-last descriptors, and via L34T/L2T
on the last descriptor: RDES2[9:0] for IP packets (L34T set) and
RDES2[9:2] for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
v4:
  - Only read the header length on the first descriptor (FD=1)
v3: https://lore.kernel.org/netdev/20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   |  9 +++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 16 +++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7f43a0b17083 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x00000140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,13 +440,16 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..b28aa39f9947 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,22 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* when FD=1 and LD=0, HL is RDES2[9:0] */
+	if (!(rdes3 & XGMAC_RDES3_LD)) {
+		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+		return;
+	}
+
+	if (rdes3 & XGMAC_RDES3_L34T)
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+	else if (rdes3 & XGMAC_RDES3_L2T)
+		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
 }
 
 static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, bool is_valid)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f..0a9c787305a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
 	writel(value, ioaddr + XGMAC_RX_CONFIG);
 
+	value = readl(ioaddr + XGMAC_EXT_CFG1);
+	value |= XGMAC_CONFIG1_SPLM(1);
+	value |= XGMAC_CONFIG1_SAVE_EN;
+	writel(value, ioaddr + XGMAC_EXT_CFG1);
+
+	/* Disable variable preambles to keep the L2 split offset deterministic. */
+	value = readl(ioaddr + XGMAC_EXT_CFG0);
+	value &= ~XGMAC_EXT_CFG0_VPRE;
+	writel(value, ioaddr + XGMAC_EXT_CFG0);
+
 	value = readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
 	if (en)
 		value |= XGMAC_SPH;
-- 
2.34.1


