Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC4C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgygbIBrIF/o9Uk8a+yyGUQdJ0Ego6UNMmxTwfuAtRU=; b=yD859k+YpPium4SwvuZcX5Ktjb
	7s5IB7kucdsO/dZtDTrZrhpzIyki5FVds8diRmz++gwmG9ROW4dJqRJO5OwU/38/0ywNyMczxT7+I
	iHmprhnRw/kkaiIp+kgtO2qjo/HcqD/K6jzf30X0k3leFZG0GvIgJ4sBgLXzTOrKSqDEG315M79vU
	x/OUU2Dp2Omqm4ip+bV5e6WxkpP0VEw6OdlKyVsbeXk6hA0tIY5HiwG89ZHf6Vob9hODkw0U+H/H4
	QdYXLZ9MjQFwyGiHwJu2686IjKoEJmGapaMGrQAgzh3EwO/2oJtqO8AZYkeJsdos3xNsh57q0oLZp
	17MjpSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tRl-0000000G0MN-1YPK;
	Wed, 02 Sep 2026 22:28:45 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tRh-0000000G0Kd-41qk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:28:43 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHWjv3028210;
	Wed, 2 Sep 2026 17:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lgygbIBrIF/o9Uk8a+yyGUQdJ0Ego6UNMmxTwfuAt
	RU=; b=URIWO/JGCUIyWDdYsOWEpeLqPOE6Q53/TLP7APYKPLzNCiW72x6of2nO3
	VT0tqdILNp0YX1/j7S0AE97WB/j1a1W5f7PRvuH7ipSonutjYqtaD+Je2LDg9dsx
	BTC79aWJO5Jo5BL0QR3NzFgG7Ko5lp59xEebMQn6S5D+9kz1Oro2hOGsO98dfPel
	NDMHR8fbUDPidviUBMqgu8PG4XuRT4zt7U/WMkOYN110kt2C7JF1gftyTs8F74up
	Zl+7ppl46lhN96pUmWE4GMyoplnmKwgEE9PnumcZo2kBUNxOtF0zzQdwMMB5Gpx7
	Cop48x+S9IUrhWA5i6QMEtSxemxIQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013034.outbound.protection.outlook.com [40.93.201.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gec5nejgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:28:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Slb3/1EGEP5g4H7NBVkstw8Qf5TYsTEJwoW8RuUeCrwZWid4GtCu+K41uwdsCztpVEsnBqJMyIf/1atDkMAa2HDkfG2V/1AH1t9uEm+fQhoKVnCWwQPd+DgECQ9pHfEQOze8QOLXB9IeHsAg2cbDbnZuCjGAjSc5iIdl2j3+pDsKIl5So+Ez+K7Bf9lS0DP5mLcK9EF4/Tbzl8vAPvAQhKB3idmtooHHPgrpJgYy0UFoC+iud5FrMN68ncvu8OQrUmXA4ofyH7u5vb/vcREGhx9AiHUGtlPZu1Tjb5Fkj09f6f8aSBCMabRFAOffHajzydM5GZzQlMtpPX5JdbrKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgygbIBrIF/o9Uk8a+yyGUQdJ0Ego6UNMmxTwfuAtRU=;
 b=H1oALsl61OlVG/JfAKe81awmwD2gVfgN2DQmtMMcTPvKRxb+5GetUl7d6WKsbQxrtTeugeAB8s+6FkIoYA3gYh7/zCq0Z1OencCXbilQ8OUf5qV0IJLjqOfpu80VYl7UyBz1ocInN74EqVirhLW8EGtZ/YU9Mr3/GR2A6lIunSqIyMgais2SS9hLahQq6DziH+kYHSnn8gVJfiMC4s7/8O2x9uuPA1dMPmDmuqaqJiynFS3D7QnnpNVq8Qhldo1zebgvt0Di5SaP5wco2RD6uajW4EMbBV6JQBtW5aCPcmf5npR6NxtYsPVzgb0XoEmoofh2W5sIAucCwAjo7rRi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgygbIBrIF/o9Uk8a+yyGUQdJ0Ego6UNMmxTwfuAtRU=;
 b=FQsxjgN++qkOzM4SVxdJ+IY6g2Zh4xwYrIGK4jT5XUJupcbN4cLRcij6aevFK7S8jVGTo1ZHe/oV3Eo8Mw8gPC56wUqJEe43HDqcEyxevNngdXGx1Oqa+G115FgmG3+ytA47PUZR7HVVCcOaffcvMck+SPDnLmtHwUVQMfs16+s=
Received: from SA0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:806:130::24)
 by PH8PR10MB998088.namprd10.prod.outlook.com (2603:10b6:510:40c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 22:28:36 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::1b) by SA0PR13CA0019.outlook.office365.com
 (2603:10b6:806:130::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 22:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 22:28:34 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 17:27:59 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682MRxUQ1403959;
	Wed, 2 Sep 2026 17:27:59 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Date: Wed, 2 Sep 2026 17:27:58 -0500
Message-ID: <20260902222759.736124-3-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902222759.736124-1-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|PH8PR10MB998088:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5354ed-2a35-4732-7f9c-08df094186d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|22082099003|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: xlXxVyE87hhxad1hmBKkzEhnPiWJTLtN3ZvureSAHrqRoTgn0/EBdaq0dFUVTt1Z6iVbvaU4la1x/1vjbIfWBKqogtNj2hOtd7h+pX5tDXKl9JslL+r6tRpGe2K4nsBxVX03rsNLn5Zf0yBRE/pr0J1t4tDZNOo3bKOSj0/c2bAzDyQmCIcEBuFQMHAyfpQ1o1gRfiFVa7dqxS53qijCOLzPjndqmIUmBcEVj6T1jfVcBPjk7rlZgPlqDO0wWuolIgyfhhVg0Zz+tPXROj7wNwHQKI76RuQ1PX9Tjv/KBcFnBwBqOp0D7ZMsK/kcm8KjSPv3m1+oOQx5BY0CMJi8ojbJBI8LDiNN5SxXmjY0+imUI1nSTPrTT+ujVudnhBUgdLfhBmX7g2TPrmUZFy7Gtr+0Qpq0xjDeH56iUrmO7Tc5hx2sTCFzNW1KhQHlcLrSXiutsEWLZGq3pTek4I9qX+v2W+gsrh2wLS3Iau9tVmyJ4ovxcUYVmOR9zpEVam7xUkWMKpmwOC9cM+BAFzFxbh+KeiT9OJdIAA+p7oBLvz+xdwkki5yXsMhBrLYiu/8WbTmvXPCscSyNG7O1B8Yhu1oy4CezzW+sltRdweoiT9IsTkUWVXD4Ace87iXumPVtPU5vDbJFB1gH6BkeBO/E1GEc3BC7h/v1urfkAsrJAlGSExQbK6iw730tjR53H0cXr1/UBC2f2+CuXePqRHThXw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(22082099003)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jzzuIAza0EINwBDPRyDthyuAytlR5bFXk6WKse9ZqEGGx31kI72SG/cC4Rn5AiXLnZRffs4sGWkz71Hw9AP6u7iu7TUuyU2R+XaRkiUk5os3P5nygc6FdjSLHsI/0Vt+KjdvoVpKSP4bEGmaZkzS0myZfN+PNQvCTwUAxR2TLR+f4OIxudaKLqhFQp+mncULv2erwYvuUhk7JpAOxr22l+Ez0dVMSjUFJJOAGI6Be/vBRsq9FRLCYK2sKcisKsPTAZ9YjWsz1PsTmgYiVH8u65FiD32MosiWBQvwutQYnb6jTp65B5TMf3R2qLrH2MOKhfXs32mR/kRJ3wGNkOlL6XK0g7thIDMeNryChhG+DTQkZFT333i6/yY7obdNiHHr8k4g0JBn/q8wL+SBO3lKHifZB2E61eKmnzolDaqBPmBaJXJsMGAhnF3YWaDVVtLB
X-Exchange-RoutingPolicyChecked: lDr7p3ja75WefaCDkaZQPWsu6OyD39orGpdLxm5QMhkfFc38xgmW4xzfln29/6uTlxfTBerYYpLfv0zOBJsPQUvdt1kia/ICUGD2oZEisOFmiEQBuAdTsY+ErSBmkuNrhb9wxNCZkWOF5dlPXlASuLscno/RyC6gcylrjGDLwaP36mD1nU/n9cu/3JWTAQnH3izx+KIIvBDfqDb1entzPxjm1V6qcMmMHfa5RZ0l4xX5SHErTOQARhMRJBHQcBSrNaFcMwaaPQfjQson7vwK8N6uNXL2NKrk1IhVfTs/jbqwZD+NYRIaHCuSSf7yJEijlal148JRoFr+/uHhABm1cA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:28:34.9133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5354ed-2a35-4732-7f9c-08df094186d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998088
X-Proofpoint-GUID: z3ODUydatXeKLuUbqdLII1CotET7xRCk
X-Proofpoint-ORIG-GUID: z3ODUydatXeKLuUbqdLII1CotET7xRCk
X-Authority-Analysis: v=2.4 cv=NPflPU6g c=1 sm=1 tr=0 ts=6a98a317 cx=c_pps
 a=5W5/h04s0UwUCg87NMYX9Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=RKf-SnHdLUv6J_xuJ0MA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX2JjVKOc61Rpy
 7RSKTUJi2UI8xkihgBLosZjyEdtKi19KFpB3PHMFtW2P/2Uy2+KC+JiA7zSLKf7BQwfLSHvgp8q
 jrhXxNBlpUwQxG4P1xlM3+m0jnAYiRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX0xpdrHu4E01E
 kZx5Keyb00bt8Lqep2NzHjrt4eUaGG5brvOAg2Vj2SAiWLLFjjebk+H6trDcN9YsDPvCcVD/Za3
 Ci9hwiVyiFw3PMQ4GdI4WTsJqHyhvBcU7ZGrCG3SqOl9JOwEyn2+24JVbDqDEaW18Ord9c5MAJv
 45o34EJHnaigsIb+97Wgfaf0UGfI4xLzeFN1z14k9i32a7eu8Mf71SnXBfo5Va3kjJcZdDI37O/
 72f8e1Mc7M+wDdSCHY7xJQrqUNMyvuh9kHYFAb/rvW7MHvbnPA6DmGk2VdorGwbrvlxn2E5RB3j
 HmjUaj9Dd2VJn7XdZc5x/qX59hqzyMbyIVrWNlKBkndlPSe+boOrqy6fspzLJc0Rm9PS/3OxrAG
 9+eSN3l2Bq9TATfrxf2PMlwjLy0XQtndCep5THAhL7P/L+nrt0/66ZQuEFXQ4BS25KQZz9v+zrl
 0lZb5251BOeKQe85cAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_152842_112654_980066B8 
X-CRM114-Status: GOOD (  14.38  )
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

Add ARCH_K3 dependency and set to always build for K3 architecture.
The uniphier-efuse driver must be builtin to support early probe of
k3-socinfo during boot. The k3-socinfo driver requires the efuse
provider for reading silicon revision information on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/nvmem/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b7..df65e7ecfa212 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -541,8 +541,9 @@ config NVMEM_U_BOOT_ENV
 
 config NVMEM_UNIPHIER_EFUSE
 	tristate "UniPhier SoCs eFuse support"
-	depends on ARCH_UNIPHIER || COMPILE_TEST
+	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
+	default y if ARCH_K3
 	help
 	  This is a simple driver to dump specified values of UniPhier SoC
 	  from eFuse.
-- 
2.34.1


