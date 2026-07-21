Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD98C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=239TG1Rzm3EBPL0ypesZlNY1dJdKy7b6ptNNd6SwgTw=; b=CTyFa4srhHX7B/Rr6G8uuVofuT
	0AgS+jEb591FPDEBgf17bVZndXu0mS70XhUVz0kr88HgDBa8I77sXa3CjQeThK880Hgh7AIbwg77F
	Gh5TK90p3dJh0LMF2sAeevYcnp8MIYZpGHmor3xfEotst9nuI33cVyMdmt+L+v7Kvr/tTLBbQEfH8
	GwNmX2sMB2w/MIKrCampLkt27BytgtkUI1NQmNuWWNsj+s+7OG+6Fc/EtBqWjCLia/Q2Prf65XNCG
	DGyWm33TFK4pZ/lP7tSzc9ntd87ajWCmyNS4VUBWyM+dzFMg9hyWl/aVnTm+75cCA+s+N0VIOrDx7
	faDYyzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3k3-00000008UqO-0Rl0;
	Tue, 21 Jul 2026 06:14:11 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3k0-00000008Upq-2AVH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:14:10 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L65aZg3420325;
	Tue, 21 Jul 2026 01:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=239TG1Rzm3EBPL0ypesZlNY1dJdKy7b6ptNNd6Swg
	Tw=; b=iQ+jq0roEhJFOrMIkovRKWSLbobn5Cr1NODoTuuCAyEIqNKM8ogM4817Y
	KF9rkBG2il4BdTrkoUJIDT17wkzPsXNGmS2jI6HNqyG0RA6Yxl8GjH7W9ha6RZ28
	+I4kzV9RJ8gpqtmJ4uDqJN003Ow/61hY2VjZPWMfs8Q3H2w+oZEDU5cX0YLB7+7Y
	BdfPlkzTle2Q1TPkURp+AWCmx5h4fK8VtH+r3PkOGuZqTh7OqC2Ywr/odTe2oFPe
	82dYwnvbHE0hZf7aVZ7P39sWOssWY564Lt/3PgW4LFsyZpeudfRASmLpPizv4XmG
	2oc2gnRaYfBGLSz//w7y73ser1kcA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhk19drs8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 01:14:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBEXggeywLb5mNlZL1a7978woZ3Dk0FIEqoYJZ2+jkXtQzdeutqBkakwmnFEDdtS6U97y24ZmF20kR6g3s8CIyHbCGXxPup8vyRPXNypfYuJr3z4961IKm4o1ZiCIq8F+GiMWNXSOZ3E4GJ2ZBRtbdLOBzO+8amAxlSCvfxDCESvIOup1I5rBiVl24j32rDu5mKSVRL7NK8YrBQMV7ARGZs8NcQPIeMoEB6rU/BFGKFmXzHZs510u0XBwjU7wLlUaHP/3+ObpgpgP3oigJ+zIrdtNAJPH5qFAimb/tASSDEP5PRPx224RLBvmbI6EUe6SEiJWwpWTq2dYnIKAg5AZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=239TG1Rzm3EBPL0ypesZlNY1dJdKy7b6ptNNd6SwgTw=;
 b=eMkbDyKyzuYK5+zOPtlNwvq1lwUcktrAIiyIigu2hdd0dawfOyikmZ/PfWarTNA+MCOAdsr/zxxK3dKoiW9l4Jq5st3MEsaO3MT6f/yEjo7dksYbMba1bloDViJtoD+mVxt+sfs/mxzORP9b+J8Nj2t7YV8SuxW2Vfm6oyPNw0KE6/OjSKcqMdJyPgzEHmJTEDREJWgotSo+zSj+5e5I17PK/ioeXAQlcI9dmF1mXzikcKTZz5QU/c+cxJHLmK1gUXEqToXbnsx7oEC2gVyxpeytqKSoSixC7g6THwLrJYYIFGtbL1Mrz0ZphRm0q9kSauWT6XfOQ+jHvyGm4yoHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=239TG1Rzm3EBPL0ypesZlNY1dJdKy7b6ptNNd6SwgTw=;
 b=uWPYsK+nU3yncvCvfc2nC7mGF3cJMDXNApkmKt3+YfZcHOGd0SPTG32GVIfllvgVMsxo91CWAUe0wFtGMxXnLMI8vZVPxoofxpjYHuucI2O7pY7nnEiFGyEAzk4hIz1k36Qa5n7lQp1MR5x8SGKiZHOEaoqBLuxS2kwOqRtqHP8=
Received: from PH0PR07CA0117.namprd07.prod.outlook.com (2603:10b6:510:4::32)
 by SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 06:14:01 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::af) by PH0PR07CA0117.outlook.office365.com
 (2603:10b6:510:4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 06:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Tue, 21 Jul 2026 06:14:01 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 01:14:00 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 01:14:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 01:14:00 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L6Dujr036940;
	Tue, 21 Jul 2026 01:13:57 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vitor Soares <ivitro@gmail.com>
CC: Vitor Soares <vitor.soares@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: ti: k3-am69-aquila: Add display and
 peripheral overlays
Message-ID: <178461426052.886571.5412276648888584537.b4-ty@b4>
Date: Tue, 21 Jul 2026 11:41:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SJ0PR10MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 792767ee-a527-4c1a-d64c-08dee6ef4203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|13003099007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: aujyo8eFe5d0nYxCatdZsGprdpO04U28pm4KwnJXS1nVwsr5zN1J9E8VzZYUiFxvfdKDae+IR+fI5+Fp/c0hRlyylv/46lGPjD3RZVR+RfOrTYW9gxsA7ygxdL8EGSN+M+BHNete6C6VfTTmmucqHId3o4iWVdgfCok1Lq2yxUv4j4BUSlIbO24g6/3/ik3bjsp2ft+UOckypSeSl9eI6cO/FhJ+u5T9ownfck3kVbcI1lOzELnxrXLvvL6W9Bpy+yBCUJ6yBuHDrq3ayw3q0ewYkZA0CmKxcXOwcqDT34g1hmD232qKjeKV9w3SQtUQu/mu89T4KK7gz0Jp3DOuc7gyvWdwiAJZCJYr7QxEHpA2rxZqQ28jFaXcXif10IhBg+ojuK4EFU+7rVI7Nc4TCp/OmOW+c7RNUk/sueZiPUc7mjTmH64Vub2d7eW5j2D9L1mx7JIB3hUt6ww3QlqwURjcv+KZnyn1StgTUUosr3xESPIZOj/coQ6L+1+UA/xTnV6pbmTsf4uXQqTS/OP32ecApJfgsnQNooAu33ctYNYPzvJwCSBjviQ177VqJGy1qfPic71Ud8UIG5Q8SewmzCNAVpl8X6fI9I0ndirMmXdxFlM0TREubHIcu1l5tpr5CRBvB5FUVFatBuOEm3Hl0bpIzvnli/Jv2Kkto9fNgF05JAEXqQxCKqYRYeE8Mt3ViGpoItFd8ISNYlasLy5whg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WTviBTqrh5rW6hh8+do5VgIKglrHdt7C5mtEWz/Yse/FVNyIdb7jl4hyaVbFBRdUMIaPa3QrMFfJiTC7feOvNkXY1vkpjikEeXHgr0qNm6z2Uk2JCKllbV9ReJngj6dnqB7/+/f+rzLb2DNyzQo7fozWFmB2HPhXVn3vO5mZAao7CgVmw6A21EhMifZ+vSUEM8j2nIRf9O7YlCcUwW/mYnfRtbSRRqi4Nu2rxki1R25mnGkqa5AKRkqWiNKibLfZ4y+Dr4j5dNoKaJ7hdVf/EPDbid5Gvm15ODNk2QGSzlFLUZxGSdGL2fjvEuEjj90PD36/TMhqGXIWwmxtdyJQEJzN/t2k7ZhB36cDBbAtRQQ1H7hzfyQd9L1ecnFQHkaBrnKrdq6YJ9sDyFtJJo/UDoF5wd7kBgN1YGGZ/a7poqhM5R9aQWK+JmNsDfjwvjX6
X-Exchange-RoutingPolicyChecked: f3wOK1259tuSrDe3bl43dxRzFiSPpCIQa8ReZD+F6hPB5VhiEwjQDdO+ocTZF2qs+643O/vJearcUIvimGLEw8XaCE0SXBLi4FvSKsutOaELd55uI/u9Y0vlp6hLDNE2mEN0rWEJb0jDEJoLKsqxDUVSJbdSFkqPQb7KaqHjJtOjlaD7LHXNed5qzCVSQcsOPwmhpq6z4aN5QMdHOWy37BDiU48k4xxVh/bNCOjCAyq5qnk12vhpAfEhuMbhhwvaZOe0lVpsLMU8Frp/jfi1uJJsiCTD7UZxuQjS7nD9pLJtM975TvrHnAlatku6FASDyAoz5BGLVjA+pw+wsRw8gg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:14:01.0980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 792767ee-a527-4c1a-d64c-08dee6ef4203
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX3xqvS0uSTHY5
 cbJyhuD5iEH4FOkhUSkAJfMtO3/Q4iPK5cvY2XpiOr/fRqx27WY2LDYTEpKLVSYsrHThPJR+2jG
 EG0/opPJxheq8XBl8y7r04Na4cb+YxNNrLIJQ0DZc9PSMuWXxUa9TsjbpbUqoJ+GN2R2dfs1dzB
 vDDvL/MtA56S+I+PoIuZV+TAxLbLFVAe83FWpQ8jPSE/5XX+dHFd0vhSMaJ62eWrwdWOductXXS
 7rFwMuk0ag08a3QdX+AYiSqrcpXVbFIFJBTYPG8W75d0o4Qn68IUnIKuIHA2s9QeDCsuJ2CUxIv
 jKN96y8CA+4BGC/3lU2/MwLuYx+bSSm8eQk6yyPoMAjMG8hQfSxtOkSSxPmTKTo9NKWpWBjkEb4
 rlyBUPUdvTf8TA6ECQeEe4FBlZeNo1GU6LHivpjsLMmzRK0V6NEezTaGY32Hnpx8cE2PRkVFw89
 XT/H+fQOwM4dkRs+B2A==
X-Authority-Analysis: v=2.4 cv=I4pVgtgg c=1 sm=1 tr=0 ts=6a5f0e2c cx=c_pps
 a=2WPJyM168hjBdVADO68ohQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=m8ToADvmAAAA:8 a=Ms95HSm5-DtX0BCDy7MA:9 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: D8xTYhxbn6vaFj7bWiR4s1Fhy7YJZsAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX1ROMbgNbuWaM
 qG5PSck86gGFyVM4Fijys7eIGtXFliUnF8kicC5V4eTv5VM1vXKgEa843OiSGYC4xA6v3hR372T
 YUQNNsMA5UnWFHoBrRgXEA0yiYENLpY=
X-Proofpoint-GUID: D8xTYhxbn6vaFj7bWiR4s1Fhy7YJZsAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_231408_812540_42A9BAC6 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Vitor Soares,

On Tue, 02 Jun 2026 12:51:23 +0100, Vitor Soares wrote:
> arm64: dts: ti: k3-am69-aquila: Add display and peripheral overlays
> 
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Aquila AM69
> platform. The overlays cover display adapters, DSI displays, and OV5640
> CSI camera modules available through the Toradex accessory ecosystem.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/7] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
      commit: 9199488ead533541b8720d340c3887f33902e650
[2/7] arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1" display
      commit: c428a42a0caea3b6c17e460ba32dedb707f264f6
[3/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI with adapter
      commit: e1df722d2b56101ec8f54ab99f3edccce631d2ea
[4/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI with adapter
      commit: 8490a1d1918dbe2e571649ed0d62244367867278
[5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI
      commit: b1bd0652f6fef8821128dce05aac70c5066ef7eb
[6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI
      commit: 9adea5f8411d447d386315297886e323764f7c28
[7/7] arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
      commit: c43c1b16c61cba5020424acdff38d5816a1e0801

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



