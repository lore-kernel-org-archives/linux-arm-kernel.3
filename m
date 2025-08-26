Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B50BCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S+31LDF1Z2WhM1uyqtnd3y4W2aDT6M/Q5pg0v1GbW40=; b=xP/8u3h3ggNeQFHdeaAleX/kTL
	uGY5ToJJ1fmura5wbAB1blgFHuNbuxTyvRSUJ6fnQ9GiaHW5BcVfw17z4jpJA2xL3nCkQRxdjEBVg
	lawvIDfot/1Q8YgUAyGVFcqp4muSiwuwIISKnrm51L+1kfbF+0OXtHvc1aaGjtiQyRCWzSsjzHC8h
	6YyMmQEl8yqCIya2eTfn+1B835mGdE7GmC9fO1uaMi4F5z7b47t7p9ySHuudBX3c5NslYY3EshIAl
	60x0kHi9jSYrxvE0Q2RdjKWQmfHt7HgDC+5eGxSAMjmzijH+zMMkBQ0t3NaqcOf07jPf4KeiPVHjp
	xqRVGz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrq1-0000000Bm0L-1pS2;
	Tue, 26 Aug 2025 11:27:41 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqp4-0000000BcH6-0bHq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:22:39 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8lsM2001264;
	Tue, 26 Aug 2025 10:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=S+31LDF1Z2WhM1uyqtnd3y4W2aDT6
	M/Q5pg0v1GbW40=; b=lbgXN7I4bJecbfq5XRvTpGgxj2mn3KosAiOcZH2cecWNC
	r5rx4EJimO0JbMI6MYG/2wrW6m5NbtZEXNfaTcShKugT1udXEf386JtMHfkkwlhT
	HKrIt981KqUIs2L0kLuuksjluhwxYETMCFlg2f6EWpOtDoMKUigsgf8qpZJ1zjJh
	WDXFMX73+n2iwbLynE7L/XpJlzPUa45y9TNTjIq/yufzLTiyRB7hBlLtsCIicDZG
	TruwIbX6EzbuhMw1i5tUhD0+MQTj8JYbPALqPyFhbfqFK6QIaIcj8Mgf6U2qHoW/
	a+xZYykqn9ZOIrLeS3vnQb+a6zU1/Yo+kRl5NK2RQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q5pt46pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 10:22:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57QAIxI8004960;
	Tue, 26 Aug 2025 10:22:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q439hy0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 10:22:22 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QAML6S028589;
	Tue, 26 Aug 2025 10:22:21 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48q439hy0j-1;
	Tue, 26 Aug 2025 10:22:21 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: david.wu@rock-chips.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
        mcoquelin.stm32@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next] net: stmmac: rk: remove incorrect _DLY_DISABLE bit definition
Date: Tue, 26 Aug 2025 03:22:15 -0700
Message-ID: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508260091
X-Proofpoint-ORIG-GUID: A1rNZuMOzBCLBqP3JjLXHJ8H1V0uDCAP
X-Proofpoint-GUID: A1rNZuMOzBCLBqP3JjLXHJ8H1V0uDCAP
X-Authority-Analysis: v=2.4 cv=EcXIQOmC c=1 sm=1 tr=0 ts=68ad8adf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=drNr5Ij397O-Cq_uu80A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMCBTYWx0ZWRfX3TR+YKZXLVXZ
 xl2yVtGEp/AIv0M866KYyb+u8f5fb7ceY2nkPFimDfmLd2nqCucW8HjqC2dbr7rg1V5Wf9ShqOa
 04A2YOBt96ozsA5MXyWo7qDXPi61+qrgissBks4ME/knlm1W1S6fE0eggX3UjipTE9Vl+ecnXBa
 qnwHUtEqxhWiKrhahiGKHu5niwRjcdA7zrTL3+HtV8FU/y8wLVwvuoFh6PleEtG0ITNy5PAoCJ1
 CwKGoMj74OgW3g8wxykn52SNhGQFTTk+REiQCmMjgoc/3ZSbmwaJXiLgk4IgG+n14/Q0Vt+5MXF
 KTDIb0e9zts1Sl5HFr9m6vISoThoZPb6wNVspCBhrU9p9gKhM3Pe0sbmrP6govHmvUaKYGB/xvE
 gGcmYWt+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_032238_308151_A6955DE2 
X-CRM114-Status: GOOD (  11.25  )
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

The RK3328 GMAC clock delay macros define enable/disable controls for
TX and RX clock delay. While the TX definitions are correct, the
RXCLK_DLY_DISABLE macro incorrectly clears bit 0.

The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
in the driver code. Remove them to clean up unused definitions.

No functional change.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index f6687c2f30f6..9e9ae8525720 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -557,9 +557,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 #define RK3328_GMAC_RMII_MODE		GRF_BIT(9)
 #define RK3328_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(9)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
-#define RK3328_GMAC_TXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
 #define RK3328_GMAC_RXCLK_DLY_ENABLE	GRF_BIT(1)
-#define RK3328_GMAC_RXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
 
 /* RK3328_GRF_MACPHY_CON1 */
 #define RK3328_MACPHY_RMII_MODE		GRF_BIT(9)
-- 
2.50.1


