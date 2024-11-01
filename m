Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7470BE67495
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4OJP3dG+b6jMtZirVxAkm3476iD1/vHph0fe7hIxNE=; b=SBZqEie3j6W8UzeGjA29/p2Vvy
	TM7p55+6vhmGqzYd7UwqHp8Xppl/tjm5OWzfvL3t+NQzIREadNDOTQw12s7RoIGsCwxfREkjojoag
	x8R8MT0T0C8hYlyhjIny/7mIAX9hkmW/3Wd9BvwSczmBy7PxAYZLFNXEcDn3lLo+w29eeP6J7+l4h
	Ef5Ew+ofRFi2WSs89gSxgTcAj1ew2cusuHH+dmiK4mvfSG2qBHXbxkKdqtJg1AIZSTxt5Qy0G0gSh
	VAWYapyTORANSH7cesOjCgcrHZRHiDrwjoUmdBob+kPQwWkyc9XFvdtxSwGHoSfIDmnBhQnVbfu1A
	XSUQlAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n3O-00000006HTX-3M3o;
	Fri, 01 Nov 2024 08:30:46 +0000
Received: from mail-sh0chn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::722] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mx4-00000006G0Y-2YAb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih+s83I2zICJitjMtc/HRAt++70j4MZE/nqH9KJoDQsYc6lAaNHXuMgiRQZGGSQ7Lu0kJ88f7fyeG2hjI5SrWlsPnUrnFjF9lBh/Wb6HDLAVfLtRYKJ9ti2VOXCP+C5UJIx57LguwdeCcqzqv5ifqQtKN6u09dKUe1HQDfj41/P4HAFXdJOfXX+YF7F7QK26RlxosLhW8XeGgQP4S+IKN0LHHTmP1seDm0HsSQXBw/8BGqNDRo7Fop/whuuRh/eswLhUwapYPXSgWjo2X67eKGKfOD7kzczp70LZ14nAbfq+DjeVrvh52YuakvVgoG2uR/ZL7O09Ul+qSNA9D1+Fqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4OJP3dG+b6jMtZirVxAkm3476iD1/vHph0fe7hIxNE=;
 b=bSzT8fbWL4TmxQPmN5JLDMXfv0HD6ETw+3GbMtlBBwldrZvg62Ky1KB46Prb94dDWCAiu+envqU0bID1zWMI4au/qdzkfOl+mJ5N9inaACVn4QAmpoxYyuAAKH9oGsI2mLkOeWXGjtC8Au8GYvbv+VM8r1pTy1HGIZs7jpZ6wEB1wA8rvTqjHPR1pj27lpNMVKqUuZRR8hDsmeIt87meAfnthCc37fgsPdjDnsdoWGlLMrKyYRbIK3PjrjLh486fCwjP1brOse/6VFXoz3KSwEfl5tOcv754IWnZgYRzMZHWqVPskj0KlNnCGuHpg3P4FWp1uhNy6aLDFJJjXbahUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB1107.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 1 Nov
 2024 08:24:04 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%4])
 with mapi id 15.20.8069.016; Fri, 1 Nov 2024 08:24:04 +0000
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com,
	leyfoon.tan@starfivetech.com
Subject: [net-next v2 1/3] net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC mask and shift macros
Date: Fri,  1 Nov 2024 16:23:34 +0800
Message-ID: <20241101082336.1552084-2-leyfoon.tan@starfivetech.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
References: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::9) To ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a34ed3-a266-4c8c-d4c3-08dcfa4e8ba2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info: GRG4iQHE1R7vsdiUBqeW/0IP2SX9LxilKEIRaucZV9PxgFdQGYS9c5sAYZgbuqTDlufrM0SRD4GQPPJAVBzkrNGSP7pfRkamH4BE1zgas6Jd/2DlyVC1pq5JnEjFzvcVSt9/5rIV9rxNCcelYeKy/YuHp5pypb9FdFCYlRhUTSV4prhDIppvcsIOw+n+aNivEghjiRH42EwGPIz73K5PakdBF54nLG4pw4Whofe4oe9GtSI4klvX4NLmk+x7WwtgEnzOEcfqEKBNaur5ycd7b/OVi2JNId3gI0KUfC8xf3qrQhnx2ORcjKr1DAIdllXOqrsruBmE5f90vQZHHpv94dZtARXL1bJ13sis6ezsBJOoIMsaFukZXlY2aRGqtYDGhcP3jrYja0izVcktmhOvvfgpFaHPg/1DG4Et/RqQuDHzMxmIQTJoLOSKaJ2Adx8NC5Pi9eXbDhvFbslJOqSJUyOW7JVoViADv3xI3DUcPpa7fHyWgZuKgWbGZaCSmoo9NH/jr2SX94hC1HLtT16vEK+uc7ZCT5P/3Aj2LN/Bm6Cu9DolQZ/CCXnklKXPhg0EVorkCBFBVrMIqMAmGXITx/5xoTKvLHLQuxHNviwijiJX+mQoPwaQN4YNyMBcWKMj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OK1t4ju2az1svnSksEF0BX/gGuneBXTiRazlhlLES7qm1LsB3j4WEn294p08?=
 =?us-ascii?Q?qCBAsyLBTVfAwYJt+HS0eJ5Tv9y3GChwopstwJRgUZUNiQLQjbSLwQ6C8C77?=
 =?us-ascii?Q?hJZq6QafY/KT6PRNMuunzJHIJfFOhHDqH7DpOf//iGeJPvlvWgbMHLv8SK/4?=
 =?us-ascii?Q?rXevej4PsfrD78GKTxRdez3hCZPct12v2ggIt9+pWCzkfg7EAltuU3Mv2c/J?=
 =?us-ascii?Q?E0DFWev0vJYpWbAC/Q1AEt8g/qGPAvyfwGr92rBIror7ZkYKreg4ZS06mEUz?=
 =?us-ascii?Q?RjIxY7ZHGFHC6qnQOfhOns9c16kAJYz1fiqvLjoYNcF6AWaOq93Ew2usD+Jh?=
 =?us-ascii?Q?lYk3jaIIIz9W7dy4Yy9nnuSryb57bSeNFmE/9DMLuod34on8IWk8fF9uSTV/?=
 =?us-ascii?Q?QAqri0AA8SYRjujHAlCuGln5jYC1QjCJbEvX7xwEgLtgE4s8sUH2JJK1YDhD?=
 =?us-ascii?Q?nv7knHpy0RhJEjoAGyk3zTV7w6ECUERaBB2w60tHKHBYf2p1qRm6c9mBcRS+?=
 =?us-ascii?Q?bpnIWFOQAkh7KNHFeIm312FMeo/NYNQMRlVSM9O5hSSFj4cBP87I3WFUOWlG?=
 =?us-ascii?Q?R3sIeSgxeSP6MO0ClC0MOR6zjZ8Crv0HwDwkQlc+0wli1NxG26Vqr3CGP7yD?=
 =?us-ascii?Q?S+tlUDvtrYNLJ/YzjtIAL2vgdW1K7Kc4BsYfaVyFNUh9t3Jsnww/AkAdotpL?=
 =?us-ascii?Q?21KCHs50JMyGoy+AA6K53LiWp7YcW2eTRxWTIoMKPt1tqseUV62jMmFQG+m2?=
 =?us-ascii?Q?EGooKUFWTEyN0yr9pOB1X5JhpphyjxLcyqcmYcQkuTLuC5ft8Uez654s94/M?=
 =?us-ascii?Q?RwDA/OYBm9kBBamhAMcyFit5efnWmnJxMtZPas5oc/fRHRKvlpggN8YglEcI?=
 =?us-ascii?Q?vmB80O1Wo76PpMPHcMAcDhDJmzocJeb+MkF6zI3Uf8aF2bokQzVNx+kRKdkC?=
 =?us-ascii?Q?sqpQEuW8vE/DS/ctnILuXZ32Gt735O3GnrI/T4h5LFbC9VTKNutub+6Ht9Bq?=
 =?us-ascii?Q?hqvJrhDJXmgLkQz3v99tqAbiZMgdUaCI1Zh9n4JdqOjBVcd0GR62qUE+TujV?=
 =?us-ascii?Q?xf7Ia4BJEG8TRKuKMyqawq/Xrv/+JevwNrT3mfQP1zQ2qYnbpo14TjUdkePj?=
 =?us-ascii?Q?Tmy5LmK1o85Hd3ez4SC1AHpZb1njmc5jEcBOZnRQLDk0HlhSzAsL051QeHJ7?=
 =?us-ascii?Q?fZ/aRnIla6HFsr38jjyadDL63WG/B1aDdjNuee1cYTDjD3XwFYhEITI/vMgL?=
 =?us-ascii?Q?+oa14Rjkgpg7e+GXwRQETWU168lZ85wDFQVXLhy5WcSGXckrq+QsHSmrKFPG?=
 =?us-ascii?Q?TxMEj8WqfTewwkFtVKYkZcpI/Z6Y4IHo5Iq4aCWyJzm3/+DpER5F8CW5aqC9?=
 =?us-ascii?Q?Gi/mECy3bwdlPfErPimtTtpNXdaLkgE6go+XICZNZMdVw5bdmSnqxbrtr6I7?=
 =?us-ascii?Q?1LuH4EGWkqATlXzdlFk+ZKsnY0MchQrS9OPF5UGy5wppdg82B7JsDnYExOQB?=
 =?us-ascii?Q?3ThNpLckkBbwFTcx+nS4dlaj/HmQiayE5n1it4ZYMk6FltYMp3kEhggAETg1?=
 =?us-ascii?Q?ZhHcTyRUuRIzUGvfUQ/483jr+auFK2wNRCadffsolC7+yrYPvR9D6ugxQSc2?=
 =?us-ascii?Q?exZbw4tEh3V5KfFm4wHQPTE=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a34ed3-a266-4c8c-d4c3-08dcfa4e8ba2
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:24:03.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hFhLD9lsl4h5hBRIXTtvRp2lXwXfieQekIsK6tqwmibz+H6FEb3jks76hW/LdsyG7ClINrQjOuIe5HAH04M+chOuiChhxxoecvT9wmzWto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB1107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_012414_692505_2C166C67 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

RTC fields are located in bits [1:0]. Correct the _MASK and _SHIFT
macros to use the appropriate mask and shift.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 28fff6cab812..dd21dcfbbab3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -394,8 +394,8 @@ static inline u32 mtl_chanx_base_addr(const struct dwmac4_addrs *addrs,
 
 #define MTL_OP_MODE_EHFC		BIT(7)
 
-#define MTL_OP_MODE_RTC_MASK		0x18
-#define MTL_OP_MODE_RTC_SHIFT		3
+#define MTL_OP_MODE_RTC_MASK		GENMASK(1, 0)
+#define MTL_OP_MODE_RTC_SHIFT		0
 
 #define MTL_OP_MODE_RTC_32		(1 << MTL_OP_MODE_RTC_SHIFT)
 #define MTL_OP_MODE_RTC_64		0
-- 
2.34.1


