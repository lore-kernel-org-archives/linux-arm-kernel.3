Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DCACA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6AaiYBuxXs=; b=ydSWP2J9xWiI2sQQCvoYozAMHa
	d9gcKhpbiC/MNmo3/UoyqTISAW2dANViCy6LzKTz/HDFniX6HKeAcaeqFQYniI58hTaPfnsVW4OrK
	z7qinpY/fHEM7x7ty374O+pg8HGQUAhmMeNEEi+JJ1HxSb5lU67rbsRKk8e0d3+z1Kls/rpGfGw/X
	iZ/S/8pcd3gUZAm3WmQLcTdnaaUn93JvslONTPqjv49TqL9hYmtAbVYCFIJtRCxR3cOcd3QPN+M0y
	LynshVBFzmtfcKcCdPRaqul7M66GI0li78JqqtpSZQQ2lLIipFhAhaBBqIFkSHezweDJvHll+eUyZ
	19Yhx4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWXo-00000002y1P-25NB;
	Wed, 07 Oct 2026 18:39:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWXm-00000002y12-1mnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:39:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBSJO1494589
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 18:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6A
	aiYBuxXs=; b=mPPZ1+pnO/DRbWx2a/GGFz+B9YxyfdzSVwmRQekU8pvjx2cmVCT
	MhSSrVJTxnFswZJyBO7MeHKUT1YQyP9GjiA7KKFlbJikQpYun5ZfKiMcsvRGUQu4
	iKgA68wvAPxVPlsDuF7RO+JsXLQyDGZGBc0u+tHeITZBOpQRrg6O6LVLlpEt7VnF
	8nCJGQHFgk08PnDd11JWlD5L/TrRSVohe7flmydpIMxiSU8AUpV7rzaJO691cIJ+
	PYSV60xg8ECFPRxHBOsIa0ppbiJEH1WvCoXreH05fp50bkUAf4kJ5/E5+jM+rHXB
	+2JqsNTPmnwN9zOb25aO2t5l6A4FmUUtdSQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5b0ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 18:39:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso9256315c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791398348; x=1792003148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6AaiYBuxXs=;
        b=jSBpCNSp+UdkvDCNeAtgrNfLzk4f+oxTiGhyiHprVUvOWCZqHdz1Kf/c75zYWxFvLt
         PzQK0xWcU3/9j1FByN23AlzUPtjx2IQv2M1aEWMcDIL2sWoF4IwI1gABy6Md3CQpIruI
         kOE6Dtv7MJMeh5x6vklevntiWHFvQdPhABMya4fyIqKv1sWVBVHa0HE/S/NAvEnCgGA/
         FTuC7nsobBi8H0EW1bOXcvYiB66Oq35TJLJITdi5ALYWw6tcaLZvk+HEDrngMyt/kilf
         3ATNZ44t7ykLpalh73YO9O4fCuSQbGxQ0VkJE3ocJ9Ze5EJyvPPCyW8A0qtjNneVglxl
         T9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791398348; x=1792003148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6AaiYBuxXs=;
        b=GUfCaszsPWGCTRlS7VXgjXL+AQt3a3Kahcwb77vuk3VDe7PF86Vg+b9ox0OZzp9OzJ
         WvUlOEYNPUoPZK5OtAVs09HP+uoBB0PXlm6cvlrDGXfidrx09xXRIbDp4o+OywYAIkCD
         4m5GVgdtMjVVSqtHDMolEY+OsKHHKjno5G36Y1nzjdTfjCLI2lZ1Cgigr1x+LAs6r4gP
         NxHtWDjtAZmT+D1r5nzkNCJXUV6K9gc9m70BN550UtKlx1+SP1KKb+gDyksVyTWw3yTB
         Xg7GG4P2+qvsH82VQDrNPwQMRRdY05qtf35WhEAYWTBpzz00w9YwyOa/0zkZ5PenBxR3
         bvZw==
X-Forwarded-Encrypted: i=1; AKwUvByyQniZK/Dx6VxawTwN3wBxVL2FJK2G/K7Uc0FCL13dG3Z4+Ss5/djHlI/Wb5lesExpnWtBSZhrdsCAeqhqftId@lists.infradead.org
X-Gm-Message-State: AFuF++n7BNHsSU7NYU6GK3W3qr0ns4auQNktWtSnuSfEVn5wHo70QQEo
	KN6gZIwqZXEv6m0zpzcNgqFVftAnonCQ3z/CKWYO5BxohTZ+BfURoSBT88/jaGOJUohcEc36dz/
	sNIIc7KLHqEPdJHSDNBwleo0nSzgFigPQc0qBIjuY1pugc1XKqmvuJAOChii41SGNrsXix9admw
	PAYQ==
X-Gm-Gg: AYBFou3iU/hcm4kWLbQsZ0eK25odrfIgkze1ApYZEkDtVYLPV6tetlFkWSmn+nQpe8T
	cde5Yo4faLPzTh5SFPk/mBlHj0UbMQy1tKRm3/O0VkfXiRjaFcul5vK7KRDBC3q2sTQG/QHqJVZ
	CUFXSKcIpC0TEz13XEYGcXf2Z6hJOHGmw/n6NYx93bSYYHPZhvGL1ZFBfhta1RJT+XqNtXjv+cC
	GjWV1V35qv4nh3XrLhEyEqiL7Vja4xPPF/oH+6FQEZOGWEUD89+7ztvgnXvEU+uMxm78TQ8EIw3
	uqA/E1eYLFQll0tMoWs2LcaEuwOUGnThObknFcCH1BclFvUqqoBxnKac7ZPLTgBXDD6G4/eGuGf
	YNnVGMKtdGGNrBVCEKJCKsD2tsrrkX5d0M4vLZhoym3m6Vk9PFypK03d19IVt3zQ=
X-Received: by 2002:a05:7022:7e0d:b0:144:eb46:c3f with SMTP id a92af1059eb24-161fd7106admr3845786c88.2.1791398347576;
        Wed, 07 Oct 2026 11:39:07 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0d:b0:144:eb46:c3f with SMTP id a92af1059eb24-161fd7106admr3845740c88.2.1791398347007;
        Wed, 07 Oct 2026 11:39:07 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161684ba3fdsm8156055c88.12.2026.10.07.11.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:39:06 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header support
Date: Wed,  7 Oct 2026 11:39:05 -0700
Message-Id: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3NCBTYWx0ZWRfX4edWTc7QWQpD
 UJKp2vBqmBYQtK4hoMYVeDIdYF/p6HsNHY5QflTIT9rduucAq5CeUcaYsAglY7QXVQo5GQQ2a6Z
 r3b/XphfB0L6/R4govRpiHzbI8MfXE0=
X-Proofpoint-GUID: w_u27xY2Dccauyxdqx92tJ9OCThuL3lD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3NCBTYWx0ZWRfX+B4ioIqR1+ef
 +4PzU4C4YGEdeS8HQZHM+a4q50Mt6raYyU1J2eBUNL36nwRiPQjlElOz92rMBmm1HTBJlnZxU+8
 ztd3s2wOf43DfxIF0AUNGZi6znGACA4/ider6fdAbDe+NBaAKQPUofrzpsm/vRBZh0+lzMP7ZO+
 X0VdaW7bGxcMerSkU5UbbyiGZWkufnZGuSH6ul6tDd1SyvLKam530ix1kS1caN/YHKyhRJUdx9n
 YJrxE1LkdHJ9A7mA2/Gtry2NGliXgUxaDR1OwKd0UnHHJOT7JD9xW+JsE+qPFOl+TXE3C5+/1iq
 9e0bYS81e9raBhJcVjhiTfXTQC+meRdiBkGCuQDisp3vpIrnFfK26+SqEuG+TO6v58i8dx8MeXm
 iECPaYdD5NuN/tbDeU/y0hSuvBsk+2NdzZpNDnMTqZruRgNQO8nxeAq7MjPaZ4I5UZyTxYpkAmw
 li8dj5gH+DQR9x+A/BQ==
X-Proofpoint-ORIG-GUID: w_u27xY2Dccauyxdqx92tJ9OCThuL3lD
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac691cc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_113910_491000_8E2049B1 
X-CRM114-Status: GOOD (  19.08  )
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
v2:
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..fb29dd489714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,6 +440,7 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
@@ -441,6 +448,7 @@
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


