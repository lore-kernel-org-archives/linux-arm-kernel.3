Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2F4C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBYMysOBsG3Mpnztt/jp8rqcUrVbJ5vmIz1uOCkQQ8k=; b=mSKaYkhxJacHfztQB69olcbCkl
	dauNPBrS+Ek74Spv4sBKSGmXwLmfT4a3tYMawCwtGrq7oPY7iSIx+JIteZ+yn0C+v95WCURjOqJTj
	gXOA7Gq1PgcftWpbG/7VQd/lncu5SY+aX29OL9UsAmw4EGVtVITaHFdGW5nsbRtOuDfaYsGSLbsTM
	55tDqOgQMW66jmyO/Y3nkUKs+w/5ijcR+4BLqpslaktY/XQ+HUtwwl2olqmVc1DOmJdXBF082QZvs
	7vqhgiEb1rKy3c3gnhgSKgm/ceJ/pNwZSrAiIvsbL4xxbGk59AjxQSxMKEK8HhrFUWQZdFpxVwXC7
	nqFOe5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tju-0000000287C-1i1d;
	Fri, 04 Sep 2026 13:13:54 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tjp-00000002845-3rdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:13:51 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684AHJ5n1941784;
	Fri, 4 Sep 2026 08:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wBYMysOBsG3Mpnztt/jp8rqcUrVbJ5vmIz1uOCkQQ
	8k=; b=iZxEtp72ZxquPGYexV0Kn+/HHZYWLVqr8fChAwozSBn4Tfky4ludAlOAz
	drOlxMZU8TrJG0rnLat93T/yQUZTwlivbw5Q9bens/EgMqR3KAj2E5fhN9oLNOEo
	Ucp0E3+4IIUe3NKY7Hs/ibVzZ2avEBOuDEinJGKIAfQDxOxqipEIKlOFEJ8XkeOX
	711V1R/83nzAmsPl3fwHch/cWhjUNdAgq+lCS2UE6A3+xh2m/8MDRsR96PMcTXcA
	lSKCF4S/+lsG5tQsdsn9fI13vMq38UHusZ9VVPZCEH14MTSJ160TkZeP/a+L3Sia
	R39CSwNDXH8mLlH72w0ayoox9Dk6A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfrs326e1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 08:13:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUOKLcNEcjK+AjgajFbKBimCPyJUIwQlamsv8enP6dN1+aO9zGhxEcLlHVHHZsu4uev+d3RyxKo+1dOrslveWbUq7J7Ow0xxZvZNQCb2zSYmLFiQAoAmKSfPa6uq0JZP3YBAGVCoKkj5gmb+pJmD6yzOamkQ83mrhmzpOavdZlqER9IR/ihVoEfdzVZq9FZbXL8b2+XxPeEkUpRmZ1M7ngRBcoMC+A37XF9oyWOKTcNV+gtGJky0IlFvy0qwfEmQ1s7j1nVfvQh7EnLT/kf0HXq1r+TEf6TTcDtpabFH5IZa0rXKoknX9NY4noM3R+hbWH0h/wyOpEfENgNLsFRAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBYMysOBsG3Mpnztt/jp8rqcUrVbJ5vmIz1uOCkQQ8k=;
 b=xXmstLmkrOKvBiBcwKzvudN2BFTga8CzPcfvLOqIJpDjUxdI830fcq/SILIGx87GD1odjrbNOyqt/FijCBaIWnbZXFdrgkHZxwKErKKqoJwlZLYCZFl4UnFoABDGbJThZO9XVTCtOjp6u7hc7dcDpAocI2MM6GzcLbyc+M/8u/WQ4BWDkT4OPhOaLvlTOtOtL+UfRcpkrgcIDlqHfQC9gLPE/qgcxhSXg5b9/qZ1foBn9qDpe6ipoCEcmAmTcc4KKqBwydjx11Bm+2mpOMBDFpHyUCaUby1UjHC5DVLOzZ/sCtAlttmtR+HfSAJ8JWTF4FqgdUFWvH398ULKvnEjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBYMysOBsG3Mpnztt/jp8rqcUrVbJ5vmIz1uOCkQQ8k=;
 b=tXHdJDSUsSo98hYulpCOAj+yBBbW3JGGU18RmtmCaLAxcnBq+/4YHjfhQoJGYSYtObF4zFtVe6w+9Q/3vdyIebKRU+B1/Lsz1NpRzfaMOf8WGqBM9EPUL+Nc1FERkyL7I5AaVcb6018J7s/08nZrWgD9yrs2/juJINWScSrMucY=
Received: from BN9PR03CA0105.namprd03.prod.outlook.com (2603:10b6:408:fd::20)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Fri, 4 Sep 2026 13:13:42 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::6) by BN9PR03CA0105.outlook.office365.com
 (2603:10b6:408:fd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 13:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 13:13:40 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 08:12:54 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 08:12:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 08:12:54 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.126])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684DCq54371029;
	Fri, 4 Sep 2026 08:12:53 -0500
From: Andrew Davis <afd@ti.com>
To: Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        "Andreas
 Kemnade" <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>,
        "Roger
 Quadros" <rogerq@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 3/8] i2c: omap: Use devm_pm_runtime_enable() helper
Date: Fri, 4 Sep 2026 08:12:47 -0500
Message-ID: <20260904131252.2126353-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260904131252.2126353-1-afd@ti.com>
References: <20260904131252.2126353-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6d8da7-8e1b-4bc6-6cb1-08df0a8656a8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OMXtockAohKig/PmM+LzPw3h827LNhOb4MQrIKvYJfsUj4+phlppTxv0DXMkf0Dr24xQsMW0CkZPHNKqZlIHoPIGnosjFPemCsG+5GBuIjrIQCp/5TZENRJ/a7zxrLqQI2boBaL8ncr3DFQGv1WiHU6ycWvd5CYLLLAtSj6mY1goAT//A35x/201rIjKQ1PtcZRYt4NuPSekMdLh6f3Of50a2qNnY/juTFpWIrNS3HEB++cwHE/OfET/H8OqWDp1ub3gex96Ye9SgNW+Y1FFxXZg0nmE5vMoqP4LV3HPXEWueHduh/GEbMXKw4r1/T2ZRe9U2DikftljeNHWNj3PncikRrvjtn7MnosrLmUyT3OmCL6hJhTnIWJKQWVOKvFuYKsm3xlX0evkQmvu2cf0C4HgiwPwftrYX+AVILgBqXC2Cch+NHLooFTqIvv0ILBn4FKTr9s98RoLr/ojS5yxOPXVJUfYFW9/j/ydYcq2V5FC3RakjTKK1qhZv7m1vkf5cX07X+5V0qYdSBzmNnl/ERXBG519f6i7RsYII3qG2mzCgbo0DuXIQV4quu0JaxGW2cT6OjWWpB1ZD4eccT9aPcy4qO8yq0grzYx2Lxo8x/eeYbs+G0s7byZ8x3PjYsoYwYepcWzqQjQ+7p2Hh/N4KnEB12UYuasenSd15LpV6XaRfaGZclwAJQgC06NZ+7hoaEOV77wBWlyPvNNSJjHXWg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OoYpMWt24460MXnMQMY5dHGw+t0RVln0BLXIN21MIqI3WuIA4I7C9obt2H9DC0CIxBkRvuJsN6FIEtIKW1gUwUqwJFKTTcAQ1R64A8qdeJ3nDCQOUPlPxMlJ0/+Ae6AsslxD62s1EVYXIb2klJsPPjV5hBNEkISnYpQAJqMDLhLzgE1vKthcKcdz+7hWLQPmf83SU9+8Y8OVD1/SxXCBDxnvi1C9LODtADtz/HEhoAyMxB8B3H4ixSeFs/ES7dxYyQYPzt87cj76X92qTvGE3JA6VEoX3r9FrHvqkcJGiErH3cwg7oqJF2LTkc72hzKEa90FluWCQm6PYFw3A+M+ZpOuj51hStDayi9r+P2PdltPtE7N6JfnrO9J/xGH4FnqbG4ac3yD4C6nst9Bk5gpo99fJk08RBT+zzfvs0+4y7RCprPp75gpr3VFG4ECOqNO
X-Exchange-RoutingPolicyChecked: ThjkPAWFolfui4eJaWKlFf3qQo6Ozf1Cla6IQcSkRaGO3q93SQzMYFUplY8YCKfiCx6VMM7SWQyArCOswkITw/Gx09QmUNiDnbU7/lnTV3VJUY2ek+070Y+LlYrV2OZUrq4Em4jqiHAoPRjBOxOTrgWsiK9WjXxsqhl/JigiQSmDbnbKyKE6n40XLPgAN7RTsUDLXmC8fKJm6LmrXCcba1jYtcyN6TcvDaB6A3DY2P2/9BOusglK6cXr84k04PCsI37lVFkdlNrQQtcLoUdtEG3p9lN2N8F+TUZzI1qfa510NiVYBSLwTG4+rE2gfujwJw4SKd3SYf8Q1e7l4qrW8A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:13:40.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6d8da7-8e1b-4bc6-6cb1-08df0a8656a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-GUID: DnA599IKDjSM7LNx0UF_hwGZDNi6rz8N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExOSBTYWx0ZWRfX4a9LxXqNFaln
 dyVtD/lmeZVpHnMlmh08/AShSFknugfSu166IHxQ/Ip5i4QezBWZUELHcDEPGp1OZhrJ1mulY28
 c/lOxSO5Mx7CwJoHMf8/JtSvbWRv1x0=
X-Authority-Analysis: v=2.4 cv=GshyPE1C c=1 sm=1 tr=0 ts=6a9ac409 cx=c_pps
 a=qMfGPIaByV4ZnHoTJsbowg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=c0zHu0wbgw2R5NnQJfYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExOSBTYWx0ZWRfX8CV4E1NRrYxS
 jS0NlaX2LI/xaH/hh30y8GMb6ooOoWeP2Uu50cd2fhlhX8Rr54trp3d+xcfpaTfbdO5V/Jij0CN
 KavDH9GX+3Mwui8pLiwete6sAKBqFgANfenpsdUQmXOxoPLDrEN4Zs/heOrUagZci8yUPKh0JFC
 npvchc0yZKVCUDmu01jEGl2+otGtdUzPDQPsjm6jUGrjizmgqLrTl8JdCWW6wu6z2Q6jBtf0uTz
 7E5pqtTLUPJ/Bpoz87OYdOrPuCjnbiQ1xvRf87rCVTJq4cMDW2/MKZiQ7ijQARhqF5n/BZumBCD
 6uTnmt3qUWEfyqM1ALTlsa01PDrkJ087ZXnHFhf/JvQiBtgBf8NmsjJkh4FXC4RR3zclTuaDKqp
 vSYk44RXGXKw2D4n9dotj8cKHxJmN0s864jzEyrXX08+BgP/DVfAwWyyS98V6DyYHfvzTOq4x7Y
 Rs/TjOZcJjyukEYp2Xw==
X-Proofpoint-ORIG-GUID: DnA599IKDjSM7LNx0UF_hwGZDNi6rz8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_061349_982891_CC4D13F9 
X-CRM114-Status: GOOD (  12.75  )
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

Use device life-cycle managed runtime enable function to simplify probe
and exit paths. It will call pm_runtime_dont_use_autosuspend() for us.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/i2c/busses/i2c-omap.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 68b0a043f1e51..e03519d939755 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1376,13 +1376,13 @@ omap_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, omap);
 	init_completion(&omap->cmd_complete);
 
-	pm_runtime_enable(omap->dev);
+	devm_pm_runtime_enable(omap->dev);
 	pm_runtime_set_autosuspend_delay(omap->dev, OMAP_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(omap->dev);
 
 	r = pm_runtime_resume_and_get(omap->dev);
 	if (r < 0)
-		goto err_disable_pm;
+		return r;
 
 	/*
 	 * Read the Rev hi bit-[15:14] ie scheme this is 1 indicates ver2.
@@ -1496,9 +1496,6 @@ omap_i2c_probe(struct platform_device *pdev)
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 err_put_pm:
 	pm_runtime_put_sync(omap->dev);
-err_disable_pm:
-	pm_runtime_dont_use_autosuspend(omap->dev);
-	pm_runtime_disable(&pdev->dev);
 
 	return r;
 }
@@ -1519,9 +1516,7 @@ static void omap_i2c_remove(struct platform_device *pdev)
 	else
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int omap_i2c_runtime_suspend(struct device *dev)
-- 
2.39.2


