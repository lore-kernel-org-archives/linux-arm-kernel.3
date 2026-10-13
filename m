Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95A3CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=; b=GiCXIM8g+M1zsKWrcJdKg8rUpk
	QE9Y92C5qqJ+QMjXhQWDK5xenmUWmBZpNT2CfJgqF63R4AcYIZDlRFZV91iR/OqKfKoWDdvWyoW0M
	nAgCBfY2YoADCMIK2L/ykfLXX4MmWcpq/7UvuM6s4sf4VB6ER0eD/nqkIXCpKgNJV8B4KNOfwDXBk
	cbq/8048vfUa/3kJfhs4oJCeVpHxK79Y4InhQEvaBZSp86PKBWkNLkaWIivnGugo61wfEI8sbi+uK
	9bEpgzcCBj1+0xUAjjxEM0JgnXW90BepcN6n2honYUZMBwEvHMKt6pcF/OmBzpL+THJAUZzTu3GjC
	iEZ9cEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiAP-0000000DuoY-2InJ;
	Tue, 13 Oct 2026 19:28:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiAM-0000000Dunh-27qT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 19:28:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE49GS009645
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 19:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc
	8Mj/rlXA=; b=jqi3ZzIAx1kO09gO94XLKJ/BnI0sCk2YdIqPZu74a7GkhcLKnqt
	wVml33XvSLmoqwMCCjtKWT9fIR9mdsVTDRJihJgFsOBU7lAZ8tdFiXh7rNsLx9GU
	G9zEPU+8HprJ4zMNJI+6GP6m86SwdkoW5aLonjTQZJhSIdSWDzeZBoP2Kzmy+lkA
	B4bfjDkvE9YKbbWR5YJbYjQ21bX/KU5gjEl2Jw0ArUzCNb18dfr7jpoe0B9wnVVq
	shqJe42mEGJxwSTMOQGN0vGon/yaakxcie8XmBDNPNy7gOhMIshQOz0rSb0bQGhM
	FmY0fdJpv5FU+h/qK6jqKGpv4mW6Zz/y/jA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjkf75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 19:28:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso642008eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791919681; x=1792524481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=NWGgHIWxe2tWyt+TdT8/Gdjv+gObwplZ0Hd7ARG73+DUcWEx/hkSAOVAVIorfFI289
         YaA1Dqfz81/dNyeOzxlnI6lE8aDNbIa4bbp8sfJEnk0smP+bZhWxMW0MuGPedtZF2FQk
         BMFPPgZbrJw99S7jRxpZGkumYHaWifMEXDPuzpjQ6bpPpyLGdO4RFCO3O/61tBvvWrcq
         BQyxfODeV6Hq11zG8hSdUoIGrLOv0HK+Bin/ofu8D8DQA7wWJsrqbv6AyjQuXNt1CHTa
         UHgfqRp9Ph2pEHU5yCQFvaNl05oo3ZFv+I8n9UgTeMrJa+6NfCNmx+63M7M3RukTx9b+
         IC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919681; x=1792524481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=jH7+6m1MM32+AggngzUhswG98IptaTJfUZazTYcmJ91Hh/CFVLtAQY7cDTW8hE3pBZ
         rjulDUyUQQyyIsGM+QWX7GGO0OUwW6upDW46Ek2xp9Ng+XHD462szbzusBbbNSYC17eF
         KoPyJvm95aRkV34Aa8uztoFVLb+BNBcmrauhA9e+cUmbSpbIj1QNzy86j4F3Xy8rUqPk
         nBH7dfi1pDTYsflGVRjnCtIMdPouRHJEe3nqQsRY2ELFxfk+FX6PHGI1yH32r+xdb4jk
         vKqSvZ+CcQpt3hYqfNF5VEy3JW2rY5JggHNZwmBTdarZ+Kj3gy5J3GWthK5zwxoyrpBV
         RQFg==
X-Forwarded-Encrypted: i=1; AKwUvBxh8o5PrZnffqY9qvqJem43hkUiqWcg4IHGaSFrdgxn2YRz7KYX1vV3agDB0WcfYMSqGEkR/tySe061iJPoYkCV@lists.infradead.org
X-Gm-Message-State: AFq9FYKrESVwky03PocahAcLtNDrhx6Z9DQqB4CKN94qpfq65YYl6X1j
	AVBa3bbtoUg/Di+R+yntpbbEly+un6bUxc27G6CytGA7Uej1xCnhf+tgmU7g4SPySgkVwQFaSoU
	XXIS2ddCR4tRYXCNMo2Y2Dx6d1hbee5hkxBvz+9SBJiV3PdTSU3biqEa+1+hzS8Mu213CpsABKA
	u1Iw==
X-Gm-Gg: AYBFou3oBkqUPzq1UJ0NcUm1j57IjB2+po3/FeKvqPWRyAR492h8knmx5fyc9z+Zmv3
	6G4r8Kspadxqb3GCDTwq9rrN9v3K5+g4VxtzESB/HEhO/Lul/BR+dgIUz9k3XoNCkKPGVuJhcF8
	H3GcEM6fivQW8xXaRpKRw4mAQLnfeca9mTp5BME2NzFW7nfazmyrPDxVFUXQgxr3rQzs4FLc/hC
	Il03LxsMKNDMdtQhg12nxEim6llDizkCKafyw9KK1INPMIRBTm6Hi+B2bAjI1oO+aga3BDVpqAQ
	pZKm9zmAoNKd87TUL29Na8uyuOIqAQOEUogbGAcE1PKt3nnVhlUpYXlI6idY7WwpUGzzFA/YTKq
	al3SaYvYBfBJoCmxU6VNkQUgLRkZKnuqH3cQy6V9dth+x5dMrsAYKm6PJSYQsFA==
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096822eec.17.1791919681013;
        Tue, 13 Oct 2026 12:28:01 -0700 (PDT)
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096776eec.17.1791919680365;
        Tue, 13 Oct 2026 12:28:00 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm60000008eec.9.2026.10.13.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:27:59 -0700 (PDT)
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
Subject: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header support
Date: Tue, 13 Oct 2026 12:27:59 -0700
Message-Id: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: puNgF_OZOFPeKKRc3aWJ4tEd21Q6p6nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXzkwj0L1Bp1CZ
 a5TXdqI4RmqAxyeDsF1F7/VQcUrsYW9lHkkxvrii5x33wBJQPRgrPAgXiurla56XBMSMcJxofxW
 pLKmehD8SWs9OtDhtCjgotQ2PXokimGxEx0bMgSQLwemhMXEIBrsjuc04MhjIplrau0ny6UQ6xZ
 poRu10ltiDkwRxG1WrwfHmdsTITTdVZ+LEBHwWJdM5l/9gCcZ95nvvHnbQgbNY2FaxBe0TACj32
 /wsq0mxl8ISsg6MBBE8LAcn7J3suXt5cYj4UebBIRIRReEClJcNvZBkdi3STFyyC4x7QeR5QUO+
 azLRUxd+/aJHo3Pdnk91BgktcplSP4zc6aDwfX18cK67t2J0tjGzcQPZKP+t3qmA74aT+8qwgvf
 MMa7z57gkZyb3fe2dZTP9YofpY0fe8rW9Vvqdk/G9LhkkEnFJkmRjIUwlsO5zE4oENLgLTO7G55
 QFq1zxuNVpQfGGXJNag==
X-Proofpoint-ORIG-GUID: puNgF_OZOFPeKKRc3aWJ4tEd21Q6p6nk
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace8641 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXxJgoPofGqBX2
 gVm4KkfxiH0rdU5ILw0zXu6ZCP+ljf6rZSw5nvf+ygrl/W/DblGSKVBlawvWxP/keVrPK/7yNSs
 rfc1guYS7f1AkdtFxLqUIqAZPcNb7JY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_122803_831286_FF4EA790 
X-CRM114-Status: GOOD (  18.55  )
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
v3:
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7d1a7802a131 100644
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


