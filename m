Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC61C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 04:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20h/blP4DpGfQB8X5YxULqhGQUlzqRoRbSDnfofs7Xo=; b=UMmSrcpx33V2BnVsmVDV0v1L8d
	UV67JRId4X+IK5HshTRH5DNrM2aHFgEXN5xn/zTJleHzYUXRsXxGvLFoCAEGXFIF1S7RfznFPSIMr
	RXJEb/Lz9IPm0wvQNya/LTRyErnh9myWn0/XrIHIVf3mug0U8S80uMbBhalKjGt+medYUi9vb1vr/
	MP8Q8ROIBaREN7gMdgcZDZdGNxcVwfT30mckbHQFWzgAX9qkp8lECnZXgicPf42OpRCEnAZbRxOoN
	xZZIEHoOKlLzBLfMt0bZO1UcASfXd0B+z5KsqU99r1zYofmqYveEfReq9oEMANCGulWqCZWmDClFX
	PuPUhiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2YW-00000008P2p-31CD;
	Tue, 21 Jul 2026 04:58:12 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2YR-00000008P1d-0jKM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 04:58:11 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCIc53420448;
	Mon, 20 Jul 2026 23:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=20h/blP4DpGfQB8X5YxULqhGQUlzqRoRbSDnfofs7
	Xo=; b=j53qyaawcpiyzNWPccOKfMxuVqwPT1KS8qlKcGN/gRQkU7FSptE1k1PqW
	wy8w21f7SdurifdX1mChATeQgSUtGiXEeojvNl2U+mAvjlHu0xffL7QgrTa0LRMa
	X8hTjushME6TsHqpn7JXNwTK6SnKXbE3B17A4o0QHtoYRZKWhQH8/q2J4G8yLOFS
	BdojoU3yIYQTh6QnfOB/417CYxcK531CtnF34xK0cHzmKoZV4PcX8CuxlWSnB9Le
	TQHeIBIO0O/H+OncHb4AEIY+WrwzDh5mbU6coF5+xtjRqJeq8A3ZotkYKoWnTSX/
	HPtoOj+qzwfxZRfEss34eU/d0+rEg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhk19de22-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 23:58:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjdE5FixfrmIip4RCWP5A2XGW0E1FmApcSd5UsWQu+sjXq/Nvzwxzhm5lkTewq6wFUiaUBs31NHGyU1OOEnyn4jyyppC6EIjt4D65ly1FJ6d0CxJxUsBY06Y5QwIon0BXOVeY7Unjudqzm4VJYLe4K1vp0tCVw+gVPfwkm0I7BFA+iJ2LNnLEYD4WlcOHZH6+gtm63S9dn+dWJD73YpuLCKOW5PfGTI7A2Fnnp+qt0KvbKPYhujGk6WM5Vif5mwYawF4BWyQqQn/ekM9jE+Liol64TLcVeDPDb6XVnaaa2ijWjQQ/Bo83lnU5LGW5+RL5W52+OibRE6PRkEK7vQ0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20h/blP4DpGfQB8X5YxULqhGQUlzqRoRbSDnfofs7Xo=;
 b=yRQPLMou6ljHrL/o+pd79NzjxDPhqvdtohJRc8mxE3Y9IfbMbXhAgxulSnmqMXkvmw5pc1bsyef3HKYnTO6//aR7Ad0sqMgkTnwoZwy6Fwomzbsrz6k3GZHwH5QqGIafyk3FR50xD0RViM3/yXnxJfdu3+s3RzoDdpG+jDt6swANmgNCitjvFSa9k1+UXrdP9FnUqhgyUmcumZDqLwDaQOlx96JCiV8tHvQZ19T1XlxGypLQElO7ABO/UxemdqvuayD3bO9UbQ9nQbiS0HlStQAQDVfVtirtTdRGysFrU2CJZLAO8fGXCKejBkcnTA2oJ1OA+3LXc8x6rT0pRq7GZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20h/blP4DpGfQB8X5YxULqhGQUlzqRoRbSDnfofs7Xo=;
 b=BecYFim6N2IT1Wco8EqN5NV/HvsKTcliMyZaCNvD8yTt4tWCALFynpOyFnw8wcpHQ2+pujZOEMB6zFVsw5zz6Lpq4F4rwS+4VH6MwwEIVpk3tW5x311N15Pfts3Vzz4wt34Ud7KrtEWhMhHmgyo+h49j2sOPvFN0OH0OwMAm3HE=
Received: from CH0P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::12)
 by CO1PR10MB4772.namprd10.prod.outlook.com (2603:10b6:303:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:58:00 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::6e) by CH0P221CA0037.outlook.office365.com
 (2603:10b6:610:11d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 04:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:57:59 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:57:59 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:57:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 23:57:59 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L4vtvj499605;
	Mon, 20 Jul 2026 23:57:56 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Anshul Dalal <anshuld@ti.com>
In-Reply-To: <20260714-am62lx-evm-dfu-v1-1-62b025bea71a@ti.com>
References: <20260714-am62lx-evm-dfu-v1-1-62b025bea71a@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Add bootph to usb0
Message-ID: <178460984912.873002.1040953444080042518.b4-ty@b4>
Date: Tue, 21 Jul 2026 10:27:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CO1PR10MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 749f9171-2175-479c-b568-08dee6e4a359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 0C1SjOyehXeEP/oqSU31gpagXs1SlOLxm4mo2/4p8fVicAYGPBSPp3XvpGq2a+aDF7huxAq3wJC49XRwSIYYqldfRW7T8zO4vv2ZsiB8cxCj8dG2gt8R+7Z/NTLrgnaUiPbO/yXbn8q2/YdlRBHgDuMavUJsKDKeHC3C1Ex0TrBzUBBQuJ3qpj12hTnhqh/IfAUy02SgHuGwZl+jS8kjDJzx+pzW1ArynRC9zMroPM80HuHLZiquvj0MysHzVVXqoubST4x1YYl1DIWMPGUxZSX8UufXxOi4m8POKsDq2/38Pj3AGNMMzVVIo517AAYxPaTpy4nmiP0ANx8yqlvEyHtea6cYzdLlKVvEeUaeR9FYXHBKScUk4c2RRwoOn89Qe/SFlEdfD2VutqA1AKCFbL4jS3ZoPDgHzV8O1IhNn7TIbPKyKD3MjY1DCbDBOuCwncZuiRi/yF+MmslRL2dkZQYgU+QMrEDrKPKv/g2MZZZ4xFKlR7Wk0UZexAcosBB4SCoaYayWZ8H+FvTr9BzJwZPNlne7OL5ku6lLTGOd1GgA4L+/1vteDhdp7uZmWU5HFEZ/+zV0aCutNrCphzTfLmYc3nFaT3H+yAp60o3aaYgyKSX26rPkGMDipERUGVuMVuCAFXn7uw3xphkyV0LUt/ewANOamHpTJplSkbNQ7hl5w7QAOrTFO0/SrKF9LQWb2vqTBL9xfCtwNLAJKG1C+A==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ODDsNSNJXp2B6u198qZ5AqUE1O4XKOs8UBcS4EKMjWvOyFr18i1yvt9Y3woM3NqLY9cn+8KwZ6xNTLw08NzlCfqkEf+CTZxs3gu0NMlSfGwhHa0qdaeCF8Wqnhz0+aE4R/ArTFXxAMGJ/YcX6YFLlah5P8yERZoULLSXdHkLAwHCbCCI6pPuTJtRP6e/ISAvlm4FvyxyBNpwDJenGfr9bT6MGgyDRxDaAV+TfDHz2vI30SwCitnxAvnmNgQDkT/M9lOVYsoo8tOoPHBRIHolk8wheJZQCazdLJRFhj0Uswp9Rg3ZBxMP4rl5PunBfMG+kCm0cLE6M794whI4gmO1OjqsZjNfkOi2eecoe/lHl9lsVlPHYuaJEXJS5c7y/oGXFB+Vlw61bJ124fAS6Fxk0y9wQnLFuU91Ccs0nkxe7RcuxEnBw197+5vLy8ClT8EG
X-Exchange-RoutingPolicyChecked: gTBA5lfOFBPEl1Pk6kWbSGpyKmPmRGjJ8l+cNPcy/wP21xzfl4d+aoAvpB95rRWq9G5FJaHUcLKKAAgsdOOxIueidwfPybRCRg+AD+B3QillBkgouv6GNFwQHfCxWHeg5beCRfaPbxI5gCqzoQI0+LiTK5D2vu5u+WIbGLusro17Y+u86/UMPa1j5Azu+cvy3ZkcapBNFrs+3PgtdesdC8oJeki5fUd/WhLvESNCusm5xkt8KT9YC3Dq7NAphtsVsCrNTog6GWuT71yzlDPxrHGZwwsldzE3eNJPDBlycqDLHYJ4rZ+QBJzTdFksvu0MhobV9G5MCfyqXvdRPr7Hjg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:57:59.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 749f9171-2175-479c-b568-08dee6e4a359
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXxe8bU6yJ6uwL
 mwllnFbnNFRbaui78pXNqha/B4F5VbabB+nqGZUZIurniqPrSs4CboIh6JqjOFcGa8Zn1z/U58A
 cg52eyljsIebBHGa+bqGT2iMqkwlP18wW53GlSN41JJ9hqiL/wljFyZk41uEW3TxbHEOIGDylAW
 iuu0/dqpG32KKST2LcbFNUj2wDC/vG0pk6pBtg6EWUF9U7HdatUUuU86cQCiFP7q9iGPz3ZvIyK
 q8fsJFko+1V6TLzM8w3xZqIG6UzMEYK0Rbwjh+NYejWYJ4l2wJWhbom0sQ7HV2dtcZ01fRXFULb
 AdQVpqHB/R7nqvx0g8EYeOd0H7VjIZcn5jW8x271vtxDN3eOu3O1Z24pOgrfzoHlDyQ20PB2FBA
 mqN+wbm7IlLwyqNrGO5zuajO2Dw1wEd7UrgjqL9nZFnrq+merboE0tcMhrdc9etPeYTo/pYgyQ5
 3k9PiTqUzYczbusuDbg==
X-Authority-Analysis: v=2.4 cv=I4pVgtgg c=1 sm=1 tr=0 ts=6a5efc5b cx=c_pps
 a=XYxO6LlR7Df2C67LKP0s0A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: l2z6CYfKAr5eROKmiOCaHHZLHV8DcqtC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX6JuEpMfcrlR8
 5oXInI2xg73pN9liZExZM8ej+tDjz5R30j0ziQ8sB6uruRku7IlrKVUMbfC2zfbcVpXUluIn5jK
 FVr7FBTMoTcO5s59xJtHH2ttJBNNhjY=
X-Proofpoint-GUID: l2z6CYfKAr5eROKmiOCaHHZLHV8DcqtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_215807_350886_2B12E3B3 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Bryan Brattlof,

On Tue, 14 Jul 2026 18:05:48 -0500, Bryan Brattlof wrote:
> arm64: dts: ti: k3-am62l: Add bootph to usb0

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62l: Add bootph to usb0
      commit: 43aa380f66fb97a5a8233019b62e79183c4ae48a

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
Vignesh



