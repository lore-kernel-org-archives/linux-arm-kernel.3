Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40611C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGHHR+uNEfFdCXXFPbcs/TVSIdMadA0x9xw+TBaaU40=; b=HMrlLqIxZ8KFlre255bRHNvrVD
	2xYbL59JJGDIdLA66bX/ZsY75+lvaQJEo8TVPsj+4a/RwDy1f9E3Y9g8pmFGJttnLHEs5U4He7AXO
	sOpX+O0QygqJD6q2LEh6Ry3V8ut0q9ZIoNB/1pzUnJ9UTbEWDrpTkn/gMOtZ4s37DM29JEzAY8sSK
	SCEiyQn0IALX2Skx/WmjPW6JJ1TDO5lsyb2IBpX+NgekXgGMfoYJ6n8fnQJZhT0fm9fjnYiW1qXrs
	i7Tg4OvdHxLzYY0KEGUHM+XjtBKJZyFsPHWIH+zou0prdhB7KW3m47LbRSGmcISRugzT+aDteKAsn
	6Bb3iD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmE3-0000000E4Ri-3KQe;
	Tue, 11 Aug 2026 13:09:03 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmDy-0000000E4QO-48I1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:09:01 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BCSPTq1521602;
	Tue, 11 Aug 2026 08:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XGHHR+uNEfFdCXXFPbcs/TVSIdMadA0x9xw+TBaaU
	40=; b=lJKe88jTllf8d1tuPfw2l3Zec3lRkDiRCTIAYuiS6z5tddbM5dIinzY2I
	apxh/ghS2O8pS+VL4FjuJs/cfp6TrXW1kyJJGYEpH1rOVVNUMkHPTVNSfjLOQwMz
	zKnS9wJdrvGKX0OiptgMSTzqmd7Ej/SdxOatQpFN2NGHH44YZN3CaosLeMGHosFu
	ZjFykhnl0IvvZ/D1kBcYqNZfxPLzzYQPS7BfeCNcaRVSj6VOE/da7w5trqZGCR6R
	M7z0cKCPFV2N19TlYeT+DnVEtZY32lq5cJMzD2J9hBd4wmoAHlSSBEOXF3OxvwZp
	tSLmLlUZSMsyPuArdJIVYd0F3auVA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g02pb8hmb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:08:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISB8KHWu/HIfbkoZhGgtTfNtZAx5U+S6y3zUxcaWZfwLSKNfXDtMZCu0WVu+rvxcKwzTktwWHF6J+DlXxV4w9JeL/j4NQLqA7kmqQdBvKYPjrtHEi+22uuPQQxXRBzLboPhNGULp9OkKP/tSGD9GbsEN5mdtoW6pM0BMHa6rrGw2TfhntwubXkX+5R/WMDX2W4J/FdUu/gZLXWip6rTORA3Dov++kFH1cAANGnS8kJYH+hvSm1ZVX6jv/M20Ml5kTJgVT7N2O8ASpUPfp9pwVlcOzVWlGoWAlWf2NCiofqunbuv3YNpVH6e8aeBJ6mOfx2KQb1x3CN2/HtOQ5BtA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGHHR+uNEfFdCXXFPbcs/TVSIdMadA0x9xw+TBaaU40=;
 b=fP7ecKin//Lqs7lMUxoxXMgzxvFc/sODY6FjSOiKOQ/H8gESE0xxGTj43hLHzeSrA/IkgveUfZENGCTcHKQN19F+K9TFIvQ+CnDvx2jhuLoC5Mn9oIyx91Mqe1s5HtPLzDaENOOxSMDvI0TviJ1Qxg7p58wFMRzBy+DhM84A3oBE8MGjRN3X+szN0DPfJ3+7CFWuAnBEmyUs9r/+H/osyiT+XE0CVWyFbDr5wGJzdTb+qrWxSx7SdRBXWomykwaWB3mmzHVQmvB84l3H/OnBC9yBmUzMcMX3Di0WuA326oavQLlzL3IcvMn5BpadsdglS6wxp4M+D77/ycixsF9H9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGHHR+uNEfFdCXXFPbcs/TVSIdMadA0x9xw+TBaaU40=;
 b=exr0I86+7W7CF5oIPgK5uMcoD3m+SiYdzBZYDdtqd78z1WHR86of85IpLlr6QinAMrklyuqAZGh7BWLLiAt5Kkx9XHPABd1Wxfqzo6dyae6+b5QPGi99ijL74VNvz/43ykSVFr306nS7WUd/1aa2rCRfIY3HfIDMq8c2NHTd0Bk=
Received: from SJ0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:2c0::28)
 by MN2PR10MB4237.namprd10.prod.outlook.com (2603:10b6:208:1dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:08:49 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::98) by SJ0PR13CA0023.outlook.office365.com
 (2603:10b6:a03:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:47 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:35 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 08:08:35 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BD8NkL1231536;
	Tue, 11 Aug 2026 08:08:31 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Date: Tue, 11 Aug 2026 18:38:22 +0530
Message-ID: <20260811130822.2324438-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811130822.2324438-1-s-jain1@ti.com>
References: <20260811130822.2324438-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|MN2PR10MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: a39d67ef-00c1-4a06-58d6-08def7a9ae6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Xn3m/vy9OcyJn/HZRuEG1Lwuhi/ev24joW3scSR4S0Pz1zyA1U4zc33oMIculgchDFqEsLcYfFZ8SmhFQyIYcLjZpysIhNLDHpno6zeJK+zWrS9Jfo2LSOd3J+KBQ6iqxMVbbqeRqHrsthUn8H+WQzDVUJEKChLZruOtcmMTdU3NHX7+r4Nl+gUaOodaYdgjzWVyun4XsqdE2ogWRzDHAC1BSTQA63BZ7fxibuS1Wo0H3vx5G3nsCsUHIjBii1H97bEyrxPcTXyClNU56wVCj7noz5KhePoG1aOQ7ZC5bTmCniaFejprAXxsWq8r16yt89eq+LxKbGIWZaepU0SfgIydcHS/ZCUabRgpJFIT92jhlrESBfNnDdC/hYjJRqGkEm1BSDWEnl8AEqkPbnnyz5mZqHvGdUJBVsR7eQS2t5G+/TJXxX84ZA5bbZXRDy6ZG47Xy9WhNJg2NhdfK3FDnck3NG6fOunbwzK5A/OPAZtmxfCobSp89vPPMHN+DiN4xkRov0eezp0LmMqdOkPwOJp+H35i8vAPz1l2xd/PDY4+vqnnOEgAEpdkUF52yjmFWDapqlvc3vF8yZ+QBNtN+RS8B1sXjslG8VVPFa9PMFSudZo2lf3Uz20ctwWSSRupweIrDGJNLCsDMYzoWuZEOXHpR+R9o+m6zdsCJ4pugr8lhyCGWOcuauDNoyyywU0Z/8gSVVfgCQJwx/dB2nPEow==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KZ5vl8zP9EBrdk4ONChUDaUKX/kjJqe8UeCuV6QNtJS+AdLS7F5gcGCXqEijRD8K4ZT2jG8VPo9M2xukXl8CAtuU1lpPT2wFucJBvoFA2uY5KAJK4dcXDkQ5BTyNn7zwlDi/MFidgXoRJaZeRr92K5kKkOpHrcTxO7tJiQ/IouTF+2YkUFfb1dDCjueIZQFCmkwi3dlwzvWblnO4fvmb0lE8kUtEUhQL/wBzIbPE/fZ0t0va6PyzLbrIcb5YfPE/4rLq5zCtOiK1uu4z65PrTUMMOB0rP0YlCCw3ZnTgIXsJC0Gn2aB2BlunsGFfpQ7IynJp+5M0VdAgbGlC8aJGwerNOJxYK5hCAoiIe1QmQRPBjycdUwiruHqMmKkjOHhs8oap0u0EM2mjeIFTzVvl6jSI2NX3SgKU+kmpRISTkh8ROZIyIOZ+cEEDgHok7BFC
X-Exchange-RoutingPolicyChecked: G1BteAllVddoi8NEGoW3/l+BR6eU/957aZe5EbDWQkHZ+6JizWKSw97TkTg7mniAh1xdQyRcORjaY/Tj+ZIP7xGhU1/dlAHKzmHQ+XhwGQ4OP/TySzUOIrdJZC0lda5qdIYczIeZ14W3c+RCt9aboPSAx1yjiYhHMK3XqjhEbDPCDeoBxnpBk4T04tJrb96FfQf5NBwYg0YP+p9e3q6JIWVhy6j65BzFEsWcNaxilPkZBYYz4pjg3tItKEK92kvE3Cl00o5JI83RrK9xSrQUi/S600dumnjrQRrxAYJt/shdhFrIX2Dlk34UINjGX7Yq/Zld0dSSlQxYWi/iTQ6QrQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:47.9703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39d67ef-00c1-4a06-58d6-08def7a9ae6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4237
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX1Y7bEx/BY3cT
 zlkXA0X0Mh5FOU4puU5CT+jYY1q2esgrQuSfMsOyynwSg8ADJ39P2XXe7sGevGAAPEuhUJMC++f
 mg1kNO0dL4nt9hZEbnE2z7yS75FnFX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfXyhzcLrXlKneL
 y70pEGgXWHG1iazOSkGSgX9Ru2eklsss6CkVAKRBQ6s+Rjdbg5vvmF7rx/EnajhkoL+n7ukaFLu
 6DRyJfr+cQOw29JHEi65LVXPvLh3Xol0DJ8RZTy7/MEeq6nJrt+ksaAn9Hv+97elGR0iUL212Tf
 6+cdIb1iPAMRL9Cn70DLbGSXy5x0BMZdVZgAJqiqQeO9R6UHQUG9hljJjI00qJfkBneiZ/lXcmH
 hqjUrW+NDQSF8levazvrEiYrPZOjvVrm7fe/pDZlHn1bBsmJuzDdZeiw16+txnzBxaeRbDRzMW/
 SeTt/YwRueX7BFHkWUDEyUuzelgyXQUY1scpPB+FROpIFraV0H0d3t2eY6ux7TreEOb6XEmpjHn
 DBGpcE7c0+N5W4wJq/hfSgVuDTeID2CCz6SoG8tG6xOIzh2DmecN/X4XyzgT8a84RS6j+7ZUr40
 pOnw9Z891s9QgK3yeMA==
X-Proofpoint-ORIG-GUID: yqYQzxaIss_eqxxPytd_CVGIcH4W-_gc
X-Proofpoint-GUID: yqYQzxaIss_eqxxPytd_CVGIcH4W-_gc
X-Authority-Analysis: v=2.4 cv=Ic+3n2qa c=1 sm=1 tr=0 ts=6a7b1ee6 cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=eranE99uLq95Q5tEyPQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_060859_033361_B116C064 
X-CRM114-Status: GOOD (  13.01  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 95 ++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196..477de9de07e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -44,6 +44,18 @@ usr: button-usr {
 		};
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -192,6 +204,38 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dpi_pins_default>;
+		bootph-all;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +265,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_INPUT,  5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -321,6 +400,22 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
 	};
 };
 
+&dss {
+	status = "okay";
+	bootph-all;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	pinctrl-names = "default";

