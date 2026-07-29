Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B81AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws6jekRp725+CUB/ik6VEMYjaMqurDpFHylb+6nQgbg=; b=ZC6Gz6WXkwZdCgfo5HJReQze9J
	7wUpjYpcaPSNSBPD2ayKd5sGdEHkqnEzUoRMAD2Xj2fuUc0Jjr+OsGXhd/HPQqG6ZhcoFAmAcTIXG
	xHwSPYFpBDUs1LKqoIjATvbViKQe3DiDDaokHw+aLDopP4BIl+uK/Xbn7OjrHgSF8uMm17kTRKHs+
	5xDN02MoMn6KP4SqiAUfOMZNPtGwKUYDkBURLS+STVjOa6Nj5DDNm0eVwgRYPEvkiKr4UgnhPLsu3
	tgH9Am9ECFdVevV6EfCvZnVo0mkcoT6H2nQ8h0aE0yp/mvWUULgVb/nd9h908oWNaszWjPMsV1ffl
	TER0IJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp130-00000007RiW-2fo4;
	Wed, 29 Jul 2026 09:57:58 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp12x-00000007RiA-03gj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 09:57:57 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ggGd1823318;
	Wed, 29 Jul 2026 04:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ws6jekRp725+CUB/ik6VEMYjaMqurDpFHylb+6nQg
	bg=; b=gcis+qdHSIM5zJxb/9C+i0wlfqrLVA9vRr4q0XbTMriji+kUUVW0bQZm1
	oe3+tRiWPN4Yyp4vVVp9EKoQepQV91cxoxrWI2tSUG8AdUbpVm4zYhMphm3AtTcE
	hn1KcUJPnFUXN3JZ/Djso8WbOC9yzOs820AbSivT44Eld3OTesT0OJQFO0C3btUM
	IntOzoMaMvNCbjjvqqhwAuBjzqTluksSkIMecg+xl5+TgeH9Ou7LTaLCNv689vzg
	/MZJzHbFTwWsk6fdPRtHZbTEzrFRL5Rgc8b+IcxpQedbEfBBVZPzHt1XZrdKbxww
	urwyaXdPs8Si48w1ntABlxUwiGzaQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexq4rg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 04:57:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAIhqz0ve+5wWnOOmyaChIwVNSZSEioNcZWZSjz0YnIWqdvuUnZyJ0Upikhx7WBzyU5nWkOjaKAVGegWZFlIaiWw0nUWQC8xVAPTAVi0Pauag4+6mPX2NJ+tj6MWcCkbJ5NOO87cqtWy6eJQp+MHBphQJq9DoHDNq/9SM+jyFIv6giuh9AZYgZGZxr8QRxHnXehdMwaYRy9vpQY+p5xR1/KKnDRSgONWmArbQqsZ/ViS1RDeNDSoTxoCmQMPW/axTCYSeECnK9QnnkDiTWe1qcqG7eYSDiwXb5ZV0GWnuRKcfbYRCdp5SLvQByq0+42t+E6yeh0i7jl/WraHdj8Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws6jekRp725+CUB/ik6VEMYjaMqurDpFHylb+6nQgbg=;
 b=XKZdGEjt5vH7/p2mrCAUEc1+Hqqr71vZRGQgtYdzb4tXltPOc0Ly58TBom1bxMEBfp0hr765NO3PUV/ErDgD5/QHWEWbCsvwvtAqvIFO3xvPWy6TrzUwppcxJA4BGOjEV00fPY2Y0gw+fDqPWvk/cFcx5mOsoa+TtpsHvaM8ElF9+Rdi8Bf1rjswSefuDw2f4mFCCEny0ilDANsHpqQn3QHh5hQNsSfat4lAzIIxMHmZua4nOsJyzIC/v8hSHfi+5KplF1zcmWgFHQ3bMyNj7WbwR+4cTOvV3PuDpRtUeBZtmS69c5PYebX5/8QffgjNabIbiIx547IeH2HAjFM7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws6jekRp725+CUB/ik6VEMYjaMqurDpFHylb+6nQgbg=;
 b=smMtaKbApB0DNUfTnlIy0kA5kQJMClo60ZH0/LD2rXJ7PirzuUHpG6MP64Ju5+LDKJw/fLIWZIrK5OSmm/vJbXsdqChFtZCKtByLdnm94R6nVCx803+HTN/yzM0WxnsKTkHcK+r1ai7OMP8ZpG3FtiOvYttI+0sMFp9eN3hRnzI=
Received: from IA4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::6)
 by DM3PR10MB7912.namprd10.prod.outlook.com (2603:10b6:0:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:57:45 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::b) by IA4P221CA0008.outlook.office365.com
 (2603:10b6:208:559::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 09:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 09:57:45 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 04:57:45 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 04:57:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 04:57:44 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66T9vfHr1057433;
	Wed, 29 Jul 2026 04:57:41 -0500
Message-ID: <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
Date: Wed, 29 Jul 2026 15:27:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO
 improvements
To: "David Lechner (TI)" <dlechner@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Robert Nelson <robertcnelson@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DM3PR10MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 3720a116-1419-420b-7309-08deed57d6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NRRY/3FWfBvEBgsNidEV7kJjY32iZbIhcNjsaDstIcJSbAcc+ean3Xtz1Ow0HpzzjqcIVIfxltDguY4hEQF4GEGaCFnTbDWxplF7hpRdMKQrBPOhpnYJsgou5Bgxo1m4la+eIpQTo0zEZ6QVIMnzQN37VbvgqTpsnOuoVR+EvBVHt6v08To6M8OTMj6r9XEN30WGdbNXn1d7JOSKLIoNi8Tjr6CWa+ia7G6D84TdgTvKPstLL48wS4ek6jrBWZF1+4RMxFVj8uR2Qwt8wVl3VaafK4R3mysLbGEC2KwIJE+VFiXge8VoHZdgkNjoK8AqaF2HgtfsEBHw+wRLbsKjClm2WVdPCH3I/y1h3F0ZumDDfK4VH70olmEdderv2iC8IyLYMypszG5+KAFQQy1FbM42X0dBRWg6hPYzkWhaUuE/KoUnblfGZUu7OBlQCDg85U6GnLBFQmvS2amhq97atroJaCnKFxufuimF7zy9UlIgfgY5Ko6OH5f3eGMS891r05JBlkwtKjiByFnTtE3l88DfibrkR1jq+NuTtahVRnpHLfD4rvOZGcqe51WvRYG0YOUL2CV+Na2bGDDbAOLgnVASI51oIVyB6iG70n/BAPfMu9pLI3aLzFzgjTKPVXk132uMdqf+V6h0FmX2f4ch3g==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZvVEmD1/2v5SKBdhq1mP5FZTY7fV2WniKUPwzrgKHK9zYwTomA20Df2ulKF18WxFl3QyTRgV3+GnyRw/7xEIMti42hnZDsFlzdsvdtFlM879rLvlDFV4Xtv0YDrV8cC7z/13QmgA3HGFnE928+kGZBy8I2P+PWOM/5MjOjDpq1k9R/+ep0AqgbI590ORGotpQikZsGDD5xcMosGJQvF/wCFCyq589pZOm2m+tTdUTapJqYfm5g63lSs4sqq3qF86Ux3oZcXF7uB6q2ybAFzt6rzcR7bOa2Hbc3DvGQpsxdK1WrYCr5z+gCnSnfDiE/LuKNtuz7Yv48kUR6k/b78WTXn3UYAE2Zc/pubudmcEBOYFR9+mk9Xq9LyGNb6PkTBw12OKwh3pxjjJpKkT39NC63BQnOJKLvudzoY73tMkNF/wAo/cx4tP5JQKcuaQJOW2
X-Exchange-RoutingPolicyChecked: q52LG3n5ioArBB5swSarJcMCLPHHzqv+M7lViciCfbNzt3Vs6Qn+/WD1EMkbcJcRhRbbdr4Yc6x3R/xuNCDgN42VCTppywOCa/P9BeA01qpGVDfjqgjIso3lVWtodpwj1CEUWFFXh9EQO457jf9R09z1RrO8XZbDGfUqV1IKEMecLmjvQvFVatENjIuWe/qhKAk/tuI/h3rmU+XxxChp8NTYFndcWNdY3ZxZBOYOyuBGg7zwumHwxJnoqEQ1xCPD2AW5awrs8m9vO2kooD/7zqnQMOBL3psI3B+rZTd7F2krAni+ZAHZb1OMLQJcMDyRJC2GhfFvKjfTeT8vMiKH/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:57:45.4689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3720a116-1419-420b-7309-08deed57d6db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7912
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfXwuQVgUP7i2au
 9OkXej+Rv43UOl3JRrB+d9s8OOv7iiAAyjJnIyhtKLtFookag19Dai3K7M3tVbeV7PbYaqeksWO
 ultK6hpRrkjhX6wocoxt2CUu+ux77ZhzkkbmzHeBeWzR7UlqY9hthHZ9X8SEd/ZPxV8cSHHUsPl
 fdG3axVRMKi6Ur/+XZHQTvcUJVNNYuND3nP1oNfaR4ApcJkBPiN1XkXNbdP3YmSGbnUAfvBRdup
 g5zg8DoX+Npg6dLamAH1sTEOwXoDh6B3NNfuoKeGPjBrdo1+W5nTIzTBC09tPleBIKuox16HQqe
 4VbjIdMz0PflqhxaaG1o4lELfYP/z3vqvHhQoN27Y0VFQ4cmMquMX7v0R3tGyhcs7HG8psVVsFv
 Aw3W2cYpCwvlUtBBZ9F3XGa58IEGzUbHBhaTDk0u6VoN+94pTwwvPTfHYtSTNMP4R8Hdq0XKXNu
 Fu/mkDgLBiesJavgMMA==
X-Proofpoint-ORIG-GUID: QlK_KfppBd7B_udbcupHYfof84bSGZrz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfX7OQhRpTtblN5
 qQ3SG+7JljtYW0DhbbPqph5/RI6XD+oEIgEC8kcPhdEGvZROLmHJ4CUQArsF+3KdENQtjyKbpQV
 QQYWqg1Co8BDyKH4MxuUTNIWITenK24=
X-Proofpoint-GUID: QlK_KfppBd7B_udbcupHYfof84bSGZrz
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a69ce9e cx=c_pps
 a=OPuTCcLOD/60NKbq+Taa8g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=xVOUUHzFAAAA:8
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=IpJZQVW2AAAA:8 a=tpI_4JZHAtK4UwZ1lhQA:9
 a=QEXdDO2ut3YA:10 a=BFkDlhTjP3qpOTzr41qL:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_025755_286238_72BDF4F6 
X-CRM114-Status: GOOD (  13.34  )
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

Hi David,

On 29/07/26 01:14, David Lechner (TI) wrote:
> This is picking up a few downstream changes from [1] to make GPIOs
> easier to use that I missed when using the BeagleY-AI with a mainline
> kernel.
> 
> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads
> 
Above had to be reverted due to reasons mentioned here:
https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/

> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> ---
> David Lechner (TI) (2):
>       arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
>       arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names
> 
>  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 45 ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> ---
> base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
> change-id: 20260728-arm-dts-beagleyai-gpio-info-793ed8b4d55e
> 
> Best regards,
> --  
> David Lechner (TI) <dlechner@baylibre.com>
> 

-- 
Regards
Vignesh
https://ti.com/opensource


