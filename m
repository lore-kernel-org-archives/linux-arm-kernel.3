Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CFBC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 03:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vePeP0gaMHS0CYLoTCYK1Wcq7MJTuul12sQYk9J9pjU=; b=cvhC23xh2WlLCRVYUIYtjCFbFJ
	dxk/THi9pxMc6xKANB6wDm+EP4GuiE29kHYQoTC+q9GwY41jTVtwh86Oq3iLSPSaBQJKYct6t8blz
	Hqg6ybF5IhUeYSjAIvqkc/Q2iXIquRiQAokjEi/XpTvZoel7XuQMwuRL51uXy8vEiJb9sTZ2x0VQb
	OqBHRhPlkLtKBEHLZ3tR+qxNX0lRLXDYUpATlUy/YCoPki7xfDX05UEOg8n11qymqhWt8QmLk33Fa
	yHA9+bwbrBlewaNEohAGKaDejL62dIGM/T2/US//ejH0J2EvIyPIxvQKarvUj3mD1bSDsmURKnrmd
	V46AnEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1bv-0000000HDj0-0DWh;
	Mon, 28 Sep 2026 03:00:59 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1bM-0000000HDU5-39Wc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 03:00:26 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RL6HQo2282713;
	Sun, 27 Sep 2026 22:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vePeP0gaMHS0CYLoTCYK1Wcq7MJTuul12sQYk9J9p
	jU=; b=DQHMNucV3sMtSurQvZxPBgNZonYTLUzfKN++DjR+Et+MtcfdWDk3OzLCW
	E8PlfvscOXsIKD3fSwjK4ssdF3U4+ho1QUrO9DGtdksjuJA68NcHIm0v9EgFOFHU
	K96Eb7nTQN98WDGrFYj5bwcjqFGctqEqVQc6TnvzGNJ0iIQ0lXOxATE5F755edgF
	yY6MBXj3IGiduQ8Ao4hXgL916p2q9BWdm9R57uTzjTJIGA6tU/Ph7a+J0kA6NXis
	mhrLBlinOOCnoF3Ye2gFSC4t4jnJF0Pwl3Q7dkuNHkhNcYCV+ZvB5jjS5emPaWBO
	5s+Krvf0bLeln9ijm6NdIU25VdgoA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nug5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:00:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOu29oam6KLet4fT1rOy4eZ5gCLC2+HmwS506Rh4b9CGo0UixHxYgfVXgLvAYQLSpDc0d6/0MADZ4SBBw60rJzLWSeh7lne1Cst1zQqu5HJlWRC4k7FcgpDsmZf5nOTlW+L6jGHG/p3df16I916SvULZLnPhEfa6VLjVN+husRqRe+a+ybkTAjOEjaE0YTHDh18FMsX4SnemEHnY97l3horbzbTB41J6fbsvjFw/0SHkVmYvYqFlciWesiLF5SWDTFpZL1oCPrk5VGlHtptwYrOgya7jZB2VWc+X67Dm7Heswlw5ieKX593cR9xnzzV+ES1VSwStKANnRxOsWy912A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vePeP0gaMHS0CYLoTCYK1Wcq7MJTuul12sQYk9J9pjU=;
 b=U260iHFZQinOmH+6JFV1xK8MJbYBX8R8w91ZGVodqyBdW1XYLNoblWc8r8o6igX1ceAHhQvFQpoAgAHd1r5fiuHBvjWP+K+aMdF5giWfhm2e0rO/BPX99rBbPW3Xtjo8QMOvgqoG9ryteZwKvfp0K0txuauyF/RrhZ1jBSReg52Kuib60mab9ov5f3zfYabyD0EvUpemTE3Jy2kPAldlCEhuRbT42rzBQMzrVBW5PGDprC6IAsRTu8fQETZbRbGoGmJgkXEAYr34AW1IQnRsTAjV0PS1+d8rUUNOVH5NdypF3AiYzxQ+kT2XAw4P1XnLaFDlv8fSmMwNnx4A/xYGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vePeP0gaMHS0CYLoTCYK1Wcq7MJTuul12sQYk9J9pjU=;
 b=bwfA5aSlT5eTNq+CZsfJGB3PKoDPvbfueBLggNK8arZ2rOXD53T43WzHNdNCvivg1qq7VfBtLS+IWZw1NYoPC0bMJnjYDhrJb1xlRSN1WWcWNR7smIl2+YBZOWEf7TOATHt40OqCJhvDfcdjK/RXZkmuASYsksFPCxg90k1I4VA=
Received: from PH7P220CA0164.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::7)
 by DSVPR10MB998102.namprd10.prod.outlook.com (2603:10b6:8:3aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 03:00:17 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:510:33b:cafe::45) by PH7P220CA0164.outlook.office365.com
 (2603:10b6:510:33b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:00:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:00:15 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:27 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:59:27 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqQ2256662;
	Sun, 27 Sep 2026 21:59:23 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Mon, 28 Sep 2026 08:26:25 +0530
Message-ID: <20260928025749.1055383-20-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928025749.1055383-1-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DSVPR10MB998102:EE_
X-MS-Office365-Filtering-Correlation-Id: f69e3851-2e8d-4cb8-920c-08df1d0c9ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|23010399003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bdv8aedXjNxJSBeUjdeeMju0TtttZaLnXjsOrGOSafljK/95tbgfhQT8CjqWqGU+9DngTm76XZ/yzuSGFwvav1d+06jlorgsFu2SBX5o3gmO83+Rw33vSXUOi6qg22MdVfqnN14Wd2nJjRDH1EdlqQQFQpgOzWeEHv8LSO7fS/oWcSeJWUkX2BWHlyDuOag4XtWgVBVzqhXrv/Zl2YnmC7+fbVS2kjWFOuV8qwsKvBkM1Cyi0qzhzBw7HjYuyGuMnWSS6o8/eYz5VmFP9TlNxYl1aBhL1d9BxRYPJCcOrX/OhnA0f0pbzCOkJjOp0zUfT/PSFvjSnlmgutxJvOfG+JEDRQvFV81j7wnRwvYcvzMHWKSW/Ayu1++L9N4q+/MZkxZjGB7rsqXxwvoropL8ylG9n3LpkgbgNbNY68csYkJ9gKAL8JAtkNMm+qpCXTbYEJPHIg6msLuY0GJA+n3vQahxGOf+cmyIxu95dacJALu5tbJ/scpzvzIFv2HpiEpcMRoKjeeL38TXmToKMImB6ZDzSCWYJDxrVpU4KmnJ5Bmawy2Px+jvESN8Sauo3v41hOMWrFvPZwqIVowqvEHcPbVZvrYxU6APeMojOm5zcuPWDUHa+Xv8LJea7LGiCDyAMWGtK3d+U0p4LEWD0E1ulok8SvqAixJqrtRjMaQHkdfnRK+PE5cWTpjAXZgQNGlXcKwflk5uwtPDYzY2kS9lwVU3eGqzID5AgrUxRSEuZ5sMgJPTiiw9qPPrvxJxfTA6
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FQMixtTsxU94VUP3KCi2nZM7w5Yiuvg+gmPYcVU1cuLDouK//+gBspfYA58/94im7SL1GO28lQmLDhjHRx6xuljUyHg2qpwxBbOfGSt6owGwcj06CUYvgmhyguXDbKy4HXC+MyggZ/UDmP8IlB6cY66dtsHDDBRLqzhtuOvi+x6FTU2IECp2KCl/Zd8ORszFvwMhNDn45EuPE/0gbLH3ngOi9pIAy4/qeaCLFJQIuLR7h2/gZCFgHTMXbSGClRjMjxS6Qy3rhsdq3xm+DZeRuEB3PA0CqnWa7o+BW2GIeAuUlOgcODXRUBHmADzuzD6U+20cybsoa1fLKisFM5Kkv1P7Vbz3hpL3dhIaOwqAR4e+9c9BC2lWGqy9qWuhovbipOddHaxoNyTKsQwvBaRyHBk8WDSU14I/u3GFhskkB96dKxj3XON5icTStc8PJz/M
X-Exchange-RoutingPolicyChecked: eaY6w6wEgKhPdbuX5foZu+FoQtqZtOTyBoljPmorDG0EvnDmgnTCCLMr+eIkC3PL9vE+VuPjEwfEQ6USI7wWg0AS/foM+VUHyc/N7sNzzBz2e1uB+9UTe0Qdc6XYPTEI/8FWRsM1AvAvHNKM1EhqhsNWnGqpfFIjiihqUWKzHJzAb/MVtcQ5c5qw6LciWWRrXcG48GR6TqkYcgjwDyH2M1tiQAV8yURmleOliK0TtCwUT/FcrL1Ks5ax2aaBs6yeXMuYljCLVqnDyBqrq2DcjGvX88ulkFfGZoOnGXasEgWCh1gwKghhlR3HyzhuqmGYfcOZt8MpmhAgrSHvP3zzDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:00:15.1409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69e3851-2e8d-4cb8-920c-08df1d0c9ee8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB998102
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX4kOGhZX0LsSz
 ieuhzMsRNLziwz8yT4pMwMY0q4i/HrmEDy3eKpB7mCrIMAR5wfKU3YR61+Ux/L4vjdGm9WHwM16
 zfKr38xgOmV1Y5wCiyawD8gh9b4uefE=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9d845 cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-ORIG-GUID: EfHV3mojHnoKhmERSy6rsiPxN5U8BlX2
X-Proofpoint-GUID: EfHV3mojHnoKhmERSy6rsiPxN5U8BlX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX3KmNteLEbkUk
 b2WCQoJquR73u2Lc0OeIuqZIJAaTwnf4hM4kIHEu7CuXQwo4s0ohKnFkYHPIy3VNVaG6V5V7gHE
 e/cNC5wIR9PGD3cxJj3m2F96I22/A//2bzzbvEv7tZaZa5hXE1aAGQCMpZUx+FbOsbKLWNeR2PK
 c6NKOoitoP2XaUfx1PtpwOeIaj9gJgFxm+RwN0+mNcrN2I8+Ru0Wfg4+F2kHsEJi3ju3cqlM1Zo
 alkq6Vz6Jen2Skp9e+4Ze0Mh/PpQSAuzbCOQK88d4VGgZmwBBW2+eNHzZnWVFK99zwQF35WBTS6
 FEoUh4Cgj0ZXrGC2HfbtelxY48rQFXjiHvvP/NlimBLjqq0UpVWs51WSKSkHLkedMXxpbCCvdfb
 xhcU2pu2cT42Nz+fDzYpy7AZUErQJkXdK9CJMIvPvBl2AsyzphfPd9Bf3pUkOwkWV7nbXZSNOy/
 XxyLbqDv3MjOyBl169w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_200024_916491_A28A464B 
X-CRM114-Status: GOOD (  15.25  )
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

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 5fa3a7b8d2026..812a177f7285d 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2016,9 +2016,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.54.0


