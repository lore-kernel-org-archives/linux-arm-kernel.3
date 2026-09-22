Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81875C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cAYxd1I2pI=; b=KrGB4szpVfoeJANb37uLReToas
	A9ARQ9pOt5oIGKaiwo3Qegz6NpWR3tWoCI1LVZURV3CghePZDBz97VqALcBLKfeJf0It342ceF8Tw
	kLTkbHu/Mu2sqV+wnuOtPU3IVJZ4UNP8xGMqUwpH3L1pBQL9pByKY02aW8l/5QzsUujbB13Vyxdw0
	6Gmd8ZWV9uhatCMPmTVkYdETnl4NbbVPfynM+uVULIjr0kj2s8DMj6b1CsYylSca1pebxuoNMjEQA
	089BYHlz1pRcRTPBYpNI+VwAXQZDHJC+R+MpkhdCjGTrgi50wsD9vw/oPaPpN1T5mcUQsLc3Gc697
	phGXw8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99nf-00000006iza-39yt;
	Tue, 22 Sep 2026 23:21:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99nd-00000006izE-45Ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:21:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNtf268284
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cA
	Yxd1I2pI=; b=IJvRXpf1WNoAkaZX5n1A6aY0t73YP9dAGq/Mhf99BKMATayiJrJ
	zzeXNMDEHxKDXCFVJxj71TujtMcbtVXYNyqBbYYsPYPixcE0yXWV57dBopo+YsPL
	wBUM1fBmoC5+M+To7bgbELKW9mSSym23RdaPs5a5/xNXkiljRr0zTXLCFoWL0Ftv
	zAn/8hXFtYSVuK1xQ1vySdDnTbuMWg7WQz1tpXhE9yCVlzFpIdgkk8mXL0OIDSSC
	EyQ4g/CqrOZRWyBXmXVyWpdHOBd1++23eCXYvnztlOdszlS7/wWAtJQZmJs2HWgJ
	bURuPFnjuUQVDT5aUBGifDJoURp0tM43qhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c178b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:21:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1173011eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119279; x=1790724079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cAYxd1I2pI=;
        b=iaRR+i2xKN+L4V5qt4cYJU99Xpy4UK6zWS/MqH3HI61Oiz7hzKAlR8TwN33mePc22E
         3XU1/ISU9ZoXjCDPqlp5m3f2eMwCL37Z/vBYuDaw1q4bzDTsWhGd1YSNAsBK0g7uREmU
         HWg79K5aJgHwLeCm6JRLN3dIp20HWzAepFGja0XpD+XNVHIulI2jUWjE1V0zejtMbEor
         uv6sKAryJU0A1/z4rUxjDhsaLnfn2Kl6j8+pdjtU0bYGI6QmJPD2Sq02v+PfFSUnqEe3
         1MIAk9BgJOjMAZ476rIv+yxDZGfk4ACnB8pP42U0qKq7FAXhfzjh2VaZljNewW8O8mGP
         3/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119279; x=1790724079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cAYxd1I2pI=;
        b=WMXGgO3iJqowNZ9slWtIIGVP82kq4myoPdItL1Aq9ZcOBkE2rVE2+QJphyN3K3lxMn
         aETN7N7L68oLFGQ/FVXQa7wPvMsR/Ka5gwlz+Dhprc0+HEWXzGf0jMSBymFNRAQFSHpA
         9ppF9V7y3ooe1ARnOiIzDqw8ssJjdQX87BVSWbtYBxsXVleS8WvPRC1CCl7koB9wYgDq
         dLEc8hI0YuaWVsKUJKDpJAHAkFBNeJmSkiKgZ81O4fkKJgfx5wBdHJK/0qK/XGYOrZLg
         zM9rfIa7SDMwTLZ0r5eKokiB0N4aPbYT+LJw5XmhUn9KtanWE8W+ooXZQpnTyyh02cdU
         CXTA==
X-Forwarded-Encrypted: i=1; AKwUvBwv3s9XJKhRRLGJXFrth6nmJYxk+JItvbULQb3LI+UHjJXa2gGd6TzRS8QovoOpNtzHtPFMxXnOVfqN8ZvOHq0V@lists.infradead.org
X-Gm-Message-State: AFuF++m4+CIzLQqgP55xClFXkKplxgQDct9Xt9VykKRo+gH1Bqs82PKC
	wIOOUa/0J4ZVyOydrK+NiCH50gShbWzawIC+Rib63nj7J/vube2to612nGYk9Orc07MWgCYCQAi
	jvv3JE863AeIAwxqWWz122YJe5yA9yMebLA7mhmCTsyhLb+GM9l1Y4eZLvGJIrlL+fGG9drZanw
	1xUQ==
X-Gm-Gg: AYBFou2SWpPffTpbbO/maB5b52IB+WZFE/+qHCXeDGsyP6hk1sgqos9iqtJ/4LlKolb
	icfhi0VryjpViwbRnLomxD8ghmEFe3LQ0IXt5Tl8WynC3dv1x+HWn05xqcpTKK1hf4nwkHVWPgp
	k0a5ZhJL6OtCQFCSbNfjWW/tG+B8tDbCOvMpKIHYcGARNTAbhQ95x2Qmw44V108ZXROu3FeSpLC
	y0LKbqqZPO1STN3RE3uBx4wBPCAIorpdhgChSSV4NVGgXv6VPTbwtnwdW1O42F2jz7L2TeqkSL2
	QhYgHAGssrNn8HOGdeiZHLAq6nXStujJEq6tPHQ4AReqdGDS2f48eV5jRc5URHPWsO+yRu1N6p0
	JzFcWQglmAcAZ0+bisTCbSDIRWllr7wBP4NNlijB4PoW/ixLWeZyp7d17c/vgaA==
X-Received: by 2002:a05:7300:4715:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-33e8c53b8a7mr892276eec.16.1790119278473;
        Tue, 22 Sep 2026 16:21:18 -0700 (PDT)
X-Received: by 2002:a05:7300:4715:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-33e8c53b8a7mr892254eec.16.1790119277903;
        Tue, 22 Sep 2026 16:21:17 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm1289746eec.10.2026.09.22.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:21:17 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH] net: stmmac: dwxgmac2: enable L2 split header support
Date: Tue, 22 Sep 2026 16:21:16 -0700
Message-Id: <20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sYl44lEO7rvGu_b0fRRxsJn2op-3B3HY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX/lUiEFjn6LfH
 aT9qTecgjyo60eme34Q5A6iCvy7pIBw+nUWeoWxm3amNQ8NO5m8rmdpfpn/2gTCB2WlBa4sPGBQ
 ZqASujSafzUHi1BcyLjZSPSeZIJab7Q=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab30d6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oyhHvXrwYuR4Cusx70sA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: sYl44lEO7rvGu_b0fRRxsJn2op-3B3HY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX2vywfhmHrL/1
 +Liky0A7B8XsjU4J0C5LmB8l0sBeI2jXYvMEykCm8kXOlfJ35YmVChvmnIEffdr7y3yfdl5jEP8
 rKCQg9CrSuc2Ecseh+VkbROQO1sVkKGgI+rHsuOkSWdnR25PXETRbPKVrW/RVSCQfW8ECkyJauK
 jN9R4JNsYjmaJIVGxiX3dbtTnzEzdPXRftYlwFH6HqVvekMQUFhnT3oF3ON8kGgYiEriDKEl/KT
 QoS77AtBjftVaMV645xxrQnXsdmIBWPzIdXsFaqIbU/CYNxf+kTM/Okoh5J+jGnsHqogSN4+SkZ
 OsxJGAfbmsQV0X5FhvYxFmBven0lnj3XKoeAMRroqytQAYf6B43Nh9BgzwSri68irL1pCXw4T0x
 2vkcLh9eAe9qgvxeg3YIvyGzXRIsU549KO3CK7dIIE48oY22xAlHIa8BdU+QwSYaCRAIelkcot9
 YrqBKTuQH14pHRjvWXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_162122_149667_CDF663DC 
X-CRM114-Status: GOOD (  18.90  )
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
descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
L2T fields are only valid on the last descriptor (LD set); on a
non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length from RDES2[9:0] directly
for non-last descriptors, and only consult L34T/L2T on the last
descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  7 +++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..3ccd29ea7ab0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,11 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,6 +439,7 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
@@ -441,6 +447,7 @@
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..65ac5403ec58 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
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


