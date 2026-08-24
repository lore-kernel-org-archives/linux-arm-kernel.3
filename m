Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF794C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:CC:To:From:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RojLSTDlqwSAKxy9cn0UzIVrRkMAqzKLFELXCfa/UQk=; b=ub0nUse+RkUps6oP4EDUgOC1KH
	P9rYl9c0wKgLiW/UlGLUvTVyr0koMeaaX4Ai/G+NTDmktceXxLHGYyHf3u4+onrBgbi2XmeeMgKvs
	Od7Jg7sPlPq+kq7hyM4H2LpswHMecT/2E2WLa2jBW32ylnnblPXwBGhJ486hgDXrlIhbMt077YhJm
	+R51s/6h1wVWW+z5KatwNdHamLuDzwSqeXcPtRZ+ESRRKjhlRmz+UiOjO1avY9H4ZWT4fen4apOaM
	W5lcS8QA7tcc6/qrpyyCZGquYUrJLSc4zAcWsfEGwVvMutSSLh8vkj5pvusCtGsRKPzRgOgOGM/6G
	i9R4JjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOtI-0000000G3Pz-0TEr;
	Mon, 24 Aug 2026 07:14:44 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOtE-0000000G3P6-1cAv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:14:42 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5UJoo2079971;
	Mon, 24 Aug 2026 02:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RojLSTDlqwSAKxy9cn0UzIVrRkMAqzKLFELXCfa/U
	Qk=; b=nPJj4FZlisgifX44MYNQCy12rWW54P3ugoTsN0MqO1hHyD0glovLY73wi
	UC8gM62W8uxGvH7QLXlv7DOPTtzXGC6NwUkNihYQ3mpb3uC5Fi7xCNt5PQufSWYG
	u4ptVCU36RhZAkmjTwVEBPcGFnR45rZ+NOf8lFkEMIbdkG/Zl//xH8QBL1K7bzhy
	3j+8O13ac6jFOQa+LiKCT4uh7uqEfNn+yw7m/T39o457LDXnAgcVPouxayTR+VvS
	0VYld48z6050imHpZCF7TkiTTLdNBQmdn9eHkrjkF2A/lzGxYhBqFDNR1+eih27D
	OBxLKXNjW4fLcGuXCiChQ3clsU5tg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g7twq4nqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 02:14:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XffT+ar6lfw/TRig40RXfpz3t/qoc0Cdbj8Bky/cjtlfVceOYRHZZP56PbMTSJAoL85Bdk9WT47OQCjUHppRIWZNJMTnBN52TKpD9RLp1oJKzS9dJldUV0yOokx/z3XkBuYkYTxgKwdjnxxiWpETapQueNoG0NqPHN6tJt3yhA0xHRRkEHGQSCCWh6Zj39pd6zq9W0cu6OyRrCzu7k8MWd1JqKK56vgSp8UHeJLdV4iz+8ETBs0wX1AneHT+qiD/L8KiIzFu7SwSX79RyqoBVHm7M6h1s1k7qEBknvfyEG140uogf7G2WUt972J28Hdrx9T8GcjvWAGuqYFNz4KYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RojLSTDlqwSAKxy9cn0UzIVrRkMAqzKLFELXCfa/UQk=;
 b=F3SvEjwQhi4lmrHg4LdYmWvQUQ3hA+Ku5ClS/5MQRpLGjwaW/vkaT8F+Q5lPJ5WUf6S7/BudmESv4DkWFR3OPlK09bU8hlSI4ebKD2cFPEKJUrjqyUQccd+1SEf7NutHD1NdBGYPXQP8Tg7ILrzZEpTvE2fvPmmENg5MyjLL0AziqfPRNM4h2g+/kyoXl7/CD3Mcwhibaws77JbnaPEBUaMvyD7b0zLz6YjYrrlYlsM1LhcfJoCnPHFU0tX5nOtDssY5Gux5yjaiFjoDRiQh6gYjzyj2HYk4PtQl4S9yVCuBiDys/RJTAkqHDWQkLbxqKqaiOWI9rXFCYiTjs8RShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RojLSTDlqwSAKxy9cn0UzIVrRkMAqzKLFELXCfa/UQk=;
 b=FiE/JhoouqIIML2FdIAYC0y0WjU0B8rSVOyxi07kHlnU7HpK/VZJnqViDsKT25kVDeu2/5Y0jYGghqEVsywY31bF1hgGBqwjM0M/MLWrZIFWRjUKCOIqEpCOVus7OZBsG1Ja+FW9YqlcPWTLedRfH4zzs8FKdK6UwrZEzP20pxI=
Received: from IA1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::16)
 by IA0PR10MB7273.namprd10.prod.outlook.com (2603:10b6:208:40b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 07:14:28 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::52) by IA1P220CA0012.outlook.office365.com
 (2603:10b6:208:461::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 07:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 07:14:26 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 02:13:46 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 02:13:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 02:13:46 -0500
Received: from localhost (ada0543016.dhcp.ti.com [10.24.50.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67O7DjNX2585744;
	Mon, 24 Aug 2026 02:13:46 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 24 Aug 2026 12:43:45 +0530
Message-ID: <DKWZL1J11SZE.2YIUN7M775UBM@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Hari Prasath G E <gehariprasath@ti.com>, Anshul Dalal <anshuld@ti.com>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase
 tags for pmic
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com> <3db98204-002c-4160-a055-d644c4559f33@ti.com>
In-Reply-To: <3db98204-002c-4160-a055-d644c4559f33@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|IA0PR10MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb2d399-a506-4ca3-46ee-08df01af54cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|13003099007|6133799003|3023799007|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OzLPbbUcTlNebGNChoT3QmozR4h6sP4shPd6JPNq8NPbn4Ern3bjiXctD/0tKkn0MvKmnIwxPk0AMhCYeLlLexRO5kZftMyndINQ7Y0s4/bkUskgL1zOcRUmtSu26SymfZ2/CCK66ieWl77Mfrlrhtiy/aI6ZgfzjFLf6mLm9Xzayp3N+eQ4zs9iIqOwNIUCfITYpdYIQPenKICLU0kv0Z9ktCFIpaizG2W469zF3SRVTrg/RgnUKKmhLHjMyijS+6CQaLdlC7WTIglcis/pycSk4Snk07bUnO9QA+9hx9wL2KR9gIeUiDUa2/2lYLFbTIpAoxM9IizCUTvipqP7q8nzYtIEsSlxBNCjA3evLIAB4AX/MAe95u5GWnTNX1Ptm3BBTt3Bz7NP4QwoMNjdgaO2Ig+2uF6vRQgOdonbTn6EdH99QNwmjilG7PJR/Tn2O8ugPpI5fr7TQAMVH5U4acr1K2H4jnLNafGQClmOy+GimlNo3/q8tDVwLZswBFzJ55HG/fP2EAPpPu5zuNvEvfwdOa5N5IUKFDGNzCa7muesfCloPa6hTmqNF4DUW0EhRS93Y23Kw1wWahKmPud2+vUJL5xzC4FmsxaOH01p6lYZjqJKbXSzd7A5GU1mgh4tRvZrp2zV8RD/b74697PqQIF5PZ+jjG+guRasepzhQZg=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EBw8Gc9pNLm/G6709QCwLB8ckezo9Q8uU9JyaH04I7faV7DlJqNiaZVu9as+VY7pWaCDM+2d/aJRUrDTAm2Vacdr81bXhnAsfQ2jJgn1S2r3DiUDd+rMdlsXdtSI7ntek7/13ylq0p8XyzAxYC8vnjP8qpCqyzoRPp6jSAvs3igV6LdimqhViB+7Yn+RidHexYTPjaDYrnWVIRqFze11oS91McFLDDcj9ooLqWizZdfuGywF1Fz6H+mHqJzpr6H+2msIZYguiWLu89GsMh7Gu9AvrYXJOR1xv22YxbJTNpZncyfT4zSEku+U82UytNPn4Jx1IepSqMQ9xBNtQIgxMrrwD44GzWEEJN0LLtgeWIxKsw0kVrYiREwyBcr1cSAEIdfczwr/+s7RilUmsnRvja7trEGNi/miZ5R4l9sKkgRocAPS0IBBJAVgTPVO2+46
X-Exchange-RoutingPolicyChecked: KT7gGAGsuafh3lz//FWM5+iUdI8eFQfan9aq+2U23lirt0yZ5eOiDtNCAz1NMg8E48bRgf96WVK5ey6Hdw+hntaRJzZfW3GQwkf3t8t4JNhDFRLikUBLqlvb8g/Fqg/qRMc+U+6ZGBm277QUcezu2rKIZgyjNsgZqRhkbtpZUco3Sh0GFJ2qpjXodLew+Kvy/+J82GC4jrka02qUs9SXHP+7CM03OglJqfMsisZXmhrLdgSRbo8lsvXMOo4aI67j3nuk9aPYoLGKIgC0THhybt7kQMgL9Y4Y9i/ZQrnn2H5O1Z5JkUldxThfh1qKrAyP3N6Io5Sn39KAOBKW4Sq9Tw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 07:14:26.2164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb2d399-a506-4ca3-46ee-08df01af54cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7273
X-Authority-Analysis: v=2.4 cv=CpOPtH4D c=1 sm=1 tr=0 ts=6a8bef56 cx=c_pps
 a=T1Ebi/dL4O4Qy7Yf5tf31Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=YG64nluAAAAA:20 a=sozttTNsAAAA:8
 a=V3NuWLYg8-sFjmHe45sA:9 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfX7CbmERka+HeP
 UjGSYgHiMEuGmiBr3LcZxy1pIyIuzRPpznMIsdbyGicrZqbH3fAB8olPT6+M3VcaG/oyba7HyLe
 WuOSogajOn4M3gFQt4vXMAAxpl6pVGM=
X-Proofpoint-GUID: 9SI7edf2r7CZjTr68l-G4QmWq_RfP2Zp
X-Proofpoint-ORIG-GUID: 9SI7edf2r7CZjTr68l-G4QmWq_RfP2Zp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfX4A5wKGERuUTQ
 bjGQ6q48ruF2kWml5AfDv1HEj+WCHV1Dt+7NSieTqwBhK9XtcgKSJzQtIMw+DcQKrhUTO9LY4yv
 Hdr2ACH1xIl8oncOW4SLI1pSLD51Xc5cydNRiIgSWbRcZHBZ/cwI19ubK/GKN1J9z8qt5qpWS7V
 889xMgk+0U7fJ16dtJH+Crdg5GaFDLm+GpcY3puah2jpgAJ8Vs149UXmo4W8+lhp4UYIooMilwI
 o8yTThGRB2dXPOXb5bbKYqqf7GIyzqY9vqZy3I4yfP0Zly3J6n6P8wkSiOnDXJBzfaQMN4sgAEL
 MowfP45hZ2a02K9GNrm5bK2fDVlsC72sgjlxvOSQ89WGWl6xS9oX/b5IaMiYtmkkYsk5Gh375Fh
 VTjk3/5QsTbFLqXynD4IOuAyyBOdrlu/Gy/jqMQ/rqbYQzL4Dm7dKeeZA2kShZyu12uiOlTtZfh
 i0l1EuUs6pFuKF4VgNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_001440_721712_3A904C6C 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu Aug 13, 2026 at 11:14 PM IST, Hari Prasath G E wrote:
> Hello Anshul,
>
> On 8/13/2026 1:58 PM, Anshul Dalal wrote:
>> The PMIC regulators for beagleplay are required for booting, therefore
>> this patch moves the corresponding 'bootph-all' tag from the parent
>> tps65219 node to all the regulator sub-nodes.
>>=20
>
> Was there any issue with this platform that is triggering this change=20
> now ? I think we need a fixes tag here below.

The bootph tags were missing from the start. If a fixes tag is warranted
here, should it point to the initial patch adding the dts?

>
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64=
/boot/dts/ti/k3-am625-beagleplay.dts
>> index c468b9c5fc09a..5f7265c426bbe 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> @@ -681,7 +681,6 @@ rtc: rtc@68 {
>>   	};
>>  =20
>>   	tps65219: pmic@30 {
>> -		bootph-all;
>
> Wouldn't removing this from here prevent the driver from binding at all=
=20
> in that phase ? I am not sure if the child tag below would also imply to=
=20
> the parent node here, pls check once.

U-Boot's binman tool propagates the bootph-all nodes to all the parents
and thus the bootph-all for pmic node is redundant.

>
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bo=
otph.yaml
>
> Moreover, k3-am62-pocketbeagle2.dts seems to use the same PMIC. Isn't=20
> the same change required for this platform ?
>

I will give it a try but pocketbeagle2 likely requires a similar fix.

> Regards,
> Hari
>
>>   		compatible =3D "ti,tps65219";
>>   		reg =3D <0x30>;
>>   		buck1-supply =3D <&vsys_5v0>;
>> @@ -709,6 +708,7 @@ buck1_reg: buck1 {
>>   				regulator-max-microvolt =3D <850000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			buck2_reg: buck2 {
>> @@ -717,6 +717,7 @@ buck2_reg: buck2 {
>>   				regulator-max-microvolt =3D <1800000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			buck3_reg: buck3 {
>> @@ -725,6 +726,7 @@ buck3_reg: buck3 {
>>   				regulator-max-microvolt =3D <1200000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			ldo1_reg: ldo1 {
>> @@ -739,6 +741,7 @@ ldo1_reg: ldo1 {
>>   				regulator-allow-bypass;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			ldo2_reg: ldo2 {
>> @@ -747,6 +750,7 @@ ldo2_reg: ldo2 {
>>   				regulator-max-microvolt =3D <850000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			ldo3_reg: ldo3 {
>> @@ -755,6 +759,7 @@ ldo3_reg: ldo3 {
>>   				regulator-max-microvolt =3D <1800000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>  =20
>>   			ldo4_reg: ldo4 {
>> @@ -763,6 +768,7 @@ ldo4_reg: ldo4 {
>>   				regulator-max-microvolt =3D <2500000>;
>>   				regulator-boot-on;
>>   				regulator-always-on;
>> +				bootph-all;
>>   			};
>>   		};
>>   	};
>>=20
>> ---
>> base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
>> change-id: 20260813-beagleplay_pmic_boot_phase_fix-c04b7f55de63
>>=20
>> Best regards,
>> --
>> Anshul Dalal <anshuld@ti.com>
>>=20
>>=20


