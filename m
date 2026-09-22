Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D76C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR4kzIyyPB14jR+KByO6pBrep7keh8c1sXOzdXhQNjc=; b=WO771dkM/czCTXh+Ya40y1ZQ37
	yjQOjqNmb1JuiwyYWQ+T+2aySM12WeYkodKRs/qulqJ6Apcx5Qf6MQoXnUiFP0cDVmkVGi46ZW2h7
	bhTONPAIS1KV4TjmuVUSRQvPChJy43swUI2BrfdbV7tsx+tYeRwLpCWIGbKSYDEZu8ogcMy65cri+
	cPCJ7VR3kwP4namqSLsDAULPrJYPEUKhjnAlf0Q3+9UolAwLEMbZ4ThNxkMUejZmiVrfI0mtzAHGg
	iCRoGQinbl5x6uEN9ow1rngOgxxNsAAzB1K2BkGdRNiXwCDIOZoooYpCtgnUruPaN+EFK1y2QF0xh
	UBZigxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91TS-00000005gd5-0tTo;
	Tue, 22 Sep 2026 14:27:58 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91TP-00000005gbc-17OV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:27:57 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPeQp2560601;
	Tue, 22 Sep 2026 09:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aR4kzIyyPB14jR+KByO6pBrep7keh8c1sXOzdXhQN
	jc=; b=FoO4HojBmgzheKRRRlAEWQMOwiIxm6O8e86HYNN0zIW9n9CuV+V+hEvez
	yJt+F6bZCDhgIO2NJAJKsXftm4ty4EpI/niPVibF0HTTVkjfk/4W73tyqyVq7QdV
	YO09HjOiIwmj8g8lQSlVuhEHDVPaJ2Uby7/MbSMYYlPMOxFy7L4+3L7vZYKJDyBo
	N5Eh4xrO82Uxfkqb/uf4jM1hJxZqk9ifWypvh7OX6FKICORgQEc11jM+gn6RHVbj
	njxscMOEXcvWUrQpyNnYuA9tpprqDeHtWKU0jxjCwfywRLe4jfN8W155pGJg78S+
	J5qe+QnwKE1Qc2+6xYpJeIoD97+mg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcsusbq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:27:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcsddMdqCcbIejOldyoitGvJJkKI/dqvPUTmp9epYp9hRjPM6/HRRrZFQVosPBd9Vlu884LHutuaB0XHzK1WiD5zroYS5m8RMkdC46P0QNH5TT3Tp1w3X7UppnWUVwEtCrd8tPEvTyTIhV4AKkq4KQZTi2ikCYmqWGQtFHuEwzaLiJqHiYBGY79hVVWeq0qGukqzqwfQHr47KMVk+ypoELHwEXWZw7+sPhjWqpyqh4DUsqfw+h057lCQLRWOFqwwZhEv9Sftl/6+CTU2RSRlKjCcGb3Fbm98MkC70M1dp9SRDB9PrS9nawIH1BgTb8vSZYQxDrm4+LSoMizSQjsYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR4kzIyyPB14jR+KByO6pBrep7keh8c1sXOzdXhQNjc=;
 b=d5VA3ApIyQ47QolGmUd+4W/oJRJ+wNL9JY27VVwnMo60gDzyWlPGkTtKkdBbgO4JzBn3CdNAKA/3JCcL2vcohO/ZuiVH0X9nblA2MFBq3YYyDvwQppyAvC0b8XPk+BLJcAQV7lH8yyNKkcxdU4jAPNWH7k1AR97Zj6lX10bHSDtq64jEZ0WPHPNjO2WF+uBGAM8xB/u3SsAVQUndId9N+7B4yfCLjBmZwkes/2Oxtv6hvG2Wh27ZIuvoE3M5q7yIkOdm6bwEnbkSz4/059GqAdel2J0cbZiFv44Yks1y7HERy2u3afIca+8h3bGPcI/Cf1+OBXQtJJAZcqeWuFqq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR4kzIyyPB14jR+KByO6pBrep7keh8c1sXOzdXhQNjc=;
 b=lVttUtqRiZDRbtQ/HfdUSgF6SAeYHXpJJ5qPPthp9t1jAN4a42fUHylnULnz3MpQDw2/EV25GxU5ojriWfT1sfm3P66Bw0HVGp2S0ud1yRuv2P7O9ayFETzh77w/5ZkwihlQelSKVvC6Bf7jox4D9TSETI3bbnS0tBqdDXii1ak=
Received: from BN9P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::20)
 by SN7PR10MB7103.namprd10.prod.outlook.com (2603:10b6:806:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:27:40 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::88) by BN9P222CA0015.outlook.office365.com
 (2603:10b6:408:10c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 14:27:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:27:40 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:27:24 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:27:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:27:24 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MERN25132286;
	Tue, 22 Sep 2026 09:27:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
Date: Tue, 22 Sep 2026 09:27:22 -0500
Message-ID: <179008722187.4044565.13109601678402462788.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914175541.11041-1-francesco@dolcini.it>
References: <20260914175541.11041-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|SN7PR10MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 56398f41-bc69-48a5-9231-08df18b5a897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dnlT9AL7spvsibzMZFTMennuv/ySYlqghzYizbwELU1zd50d6MZjKT2NdIZJUiB3EePsleX5n/rLrJ8Sh5Yijx6rd1994xjYMxLVH+YanqCHQhFMRSC0D+rYFz9Fk40exaevzWpVDwz0PKzypKCYMeo6ey6cemlW+s3uSrB/Fz0TQBezqJ/5iEDQMaEsMoXWee97/4yYnd/S3fIrrXsYnvV0cMCmSaFi9+gCge91B49RPUsSE3rQpQKlh/itLsUv9GlwSaYPUyEO0jRis7fdCJDpGiWOkss6VEEmMypavefCGCWrUwKZnnEkAhTH5CGPKboDK9DAO3Sbla3+G99XXK/OVOIkMKut6CqeP54rpY4we3mtMKljhFWX12eoUwNGPK0QzPeNxki+Einn2kj5iym5r+Ka2Es2SVRX/tp7WEQfEJCnjfq3J1O313d6wSqVoPfAeww52LiA5bPND5VaQKZNXVXV6DccNX0hj0ON2GJcnEYYbtyPCBf8QEmB6TfkLG+oXVag+kTdIwJ2oPToXwfpVwAxsQ/SDPUiOVh05utacwgmKu64Ibmx0aigeR+IBsdmSsknkFEDVO+GBhxhc1jQ0PVFxcmYga5PrWzml4dbmQwZjme1ZaWoSl+YJneqJsIhHNvFaz7KYNjp1XK+uyDKAF3mm+ui4ZWtGKPVPZqWJxGNi+MLxUg+xmRMr4VgYvNmCs1I0PKoZfLw6TWokA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G+XeZlXdpL+y4q7edMzLL83jg/k4TYqK108Y2oFaYrGcljZitcFRMoPGhLtUXjbVPvvpC8JKCni1BGh8WV5yTfqeY019akSaB7MPmcxL6NyHmQYOpEQRt0VAi9iS5fepObeZnCXyWalSbRsc0Qys6yBeRzCpwdoDJs9C/96J1BX70vOGkeDokyFAUKE+L3t/euRUSQMgt5Bf10Cjdrd359R18bNuk8qTnswV+Z35OfTOEak8zRnLBMQgFZIbIBgjpnfjkLkbhw7nYZIRvZY5g0iD4s6CicBwMqdMVGqMAccye6+kx8VU9t4lcx1dyTy8iC+6xMuW4JlXMVruwqknqiQXvbWlOXJK7jKRc+l/2jabIc+ZqrgS0H8R9hgL2SKrbw/GTjiSBHLJktcVvXQzb1upkLo5X8s5LjhMBygkkRsGCtmPQ2jYpZiJEC4Ox31M
X-Exchange-RoutingPolicyChecked: Bzthag7gaqtNJeyGUqfwfDIdXIOxq106FYsEihxnixXij0KXd8+58luMMi9pbZMCpdMHUG3tW5wP9oWj/YkYc8kRVMTf7/51YuaO3PpJ3p7RJUh7Ut4Yfj5NYBVA1xyH7quPg21qNbsxhLBdlq074CrWBMvokf1yBAEhVt0jXSB/Tl2mJdsAZBklmW1mu12noYHCSW4QVWG6OdhokrvLFMftjuBmJW9yND32L6PpF/tZlrF0SiWYp9rcJ81J9mFSwRNb65ury851rk/w04LPVFroh3Xl0c+hla1Pq3QHg1sxmirtCN4z+VLZFkSalf7T+bSWDApp3NjjynivYgCXkQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:27:40.5349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56398f41-bc69-48a5-9231-08df18b5a897
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7103
X-Proofpoint-GUID: MKXKgl4fd13khO4FzsL55R5e_OPcnpjp
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab29064 cx=c_pps
 a=2HCcruDS7e3rZRcUQV6B1Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfXzp4GR9rhN0S4
 6FYoBvr9VYI6uqQOVOp8grsIUdSdZzaSdRhPtiG4839geP5p1te8FJ1WfDxgdP1LBSxyX+0t0Yj
 GITS999nvB3vaf881X4LZ91OyBFSWiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX6fPPez1fcuP1
 nGGgZMgzT+H0iH/Cm6O/TAxgSUHWt1MvL+l8fW+KksgLtG2mC46Q/8gfG0M5LjSSRU0gToaHAXC
 RezOzakCLbH2CCIgtcchEr3WPcnSs46/dN6sVU5PJ/zzvajB56kSubQuSAfNnlLHRb7gz+eg4Bm
 pXvxcHao6bRkkKC3UwfY3WTl9IDL6GI7I84/ko27ZVIUnJHUPDld0g6qR+CsRoZbSgDYyeKT8mN
 7IeuFYq/I3RPDN5uzPIXmiWqIslRDOcpSTFnRW4BeoyzVOlTjk7oj7rmoC253nWiyjckIUZt9qd
 kNDXGKItUYEwiK04epxiWhYln0ciaizMg9czrG8mPc6N+EOPDZzDH1tgFZN70dBQQMybx5s83zq
 RNJgLnKgi2Tgx90PmbVtNRiW8NPz88bTTvcfO7gxWLovL4DTzwXynapO6+HagLOd8mGBkPa2xJ9
 0zwU8EfhPLkvjPvGJxw==
X-Proofpoint-ORIG-GUID: MKXKgl4fd13khO4FzsL55R5e_OPcnpjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_072755_826657_65E017C7 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Francesco Dolcini,

On Mon, 14 Sep 2026 19:55:40 +0200, Francesco Dolcini wrote:
> Add SODIMM_84 gpio-line-name (Verdin SD_1_CD#, used as cd-gpios for sdhci1).

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
      commit: a91c03b1492f05dc14d7e3cb736d9ce17f983ae3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


