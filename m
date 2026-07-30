Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34AAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecm+GkYXB+9Ut0LKE7+J7JRBMM2c+6gxZvZq4bLAzAI=; b=y9RgRGa2rklT6KGgOnlaEumlHx
	0Bm7toO/J6ydAtDxTFDgVVzh4oEP4KjOOyCGLv8cNkV7y4syRnXN7TtKvf89UJbF01uRGfE4l2nBW
	aFsVcrGES2FVerulQM0HK+oUe+htu0MjolRZ9Y/XY9zrCt7zMc4osQrA5xU7PluxaNTzSuSi9OXUX
	x8uzGasOu1h0vCzxH1Yf137SGX8R0JkOkSI94taIek3VT5KWPKlplfeKheQuKXYMmtUgPRds5d9vx
	MXa71NTBr28tTtqi8sD3ai5EUNQWb42noJd8QY8ByXBdoIDiCwS0x0oeE8WU2f4mCMmxMBsw6YhUk
	7oCRnHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpInj-00000009Vv8-3DwY;
	Thu, 30 Jul 2026 04:55:23 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIng-00000009Vuk-3347
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 04:55:22 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4OWW7087571;
	Wed, 29 Jul 2026 23:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ecm+GkYXB+9Ut0LKE7+J7JRBMM2c+6gxZvZq4bLAz
	AI=; b=e6kzlb1a4m7mLdodIrVjwxrEvfBzG8JJ0NwabZVvCacTmqrU1bgu8zI0f
	sal8Gch9XS/qn/BH9jA0gk7/9t0gjepkrkXNJS8UhqVJuG0HrQ7jDMrUT6wekQGD
	eyRr+QYsiT5tHe2IUwkXMbuTvGVNxd8M2j94Py+hJ5eGCNCzfSl0XFyu3GzCFiyX
	vjpcH8F+KlNZuSrEk6StP86Z/ciWeX1OqyaDeDhfVHf09yzNbKMpCtH/GQg3gyXO
	DcxM9kESMOLhyqUuiw7PY40kkI71o80vHvWnOWDx7/h4qRZcJFpCAqs6TEO3J/WA
	GuaOqwFXux1ey5UHCDzPxHdgKLCUg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqyj8042n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 23:55:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0ZjDnFy8goCpREJySEBYE4CdYQJIx3SzOqfe5c7HlleuR2i/8T67IdudmhMXsesDmUbR53fpwIo37d9yNwrZfAf5e0LsQQE7xCpupsWEoQKHyTkhUskSZpWWfV9Ks2OD9jS1JrIExDt8LXKisyyOPFI3Vgm77dCDEjxrk/1CL9PI02/MhSNnOvnKTE745gc7+M9kDQuoEHqi+9R5Imyv/OqPretGecoQ8/7jNw43ez5kDICqcKagUJKaqlQ/XT0Y/kkWiTwK2SMtuXjH8eXpqKlZESJDb+PKTgVJ3Vs63C6ahBKtptiVcpYeM1EPyRseKDYKH3RhNrZ/wlVyLVh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecm+GkYXB+9Ut0LKE7+J7JRBMM2c+6gxZvZq4bLAzAI=;
 b=JgiU9i72h2TGFUfQVW8nJSu8WultweQrQDzF+s7N7+SVTgHp7T9YCtt9nqFOGhK2au3Fgk3RheJMGEk+MFqKaMEt452EXE2dUzQsptw+9K5g1QqttsjtyIyzx4ThMxU31Y7zj5HGimKctQU46UOucQcnkc6kpPtoT3XKlNsXdqdOzQ4DgwHBlWLaqOdLR7VWBV9+B/p4pOIuHRrBpBmWXnjuNZ9upGQQdHiZrlePIMwM5bf6cWSF533FpE51zkf118pa+JvpLvpCc2YLYkEB1VTVtSfSQMCpedt+/ggqeIAoIAZz7r8tavyESMtWrMD3fVXeS+DC4OKDw06HT/To1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecm+GkYXB+9Ut0LKE7+J7JRBMM2c+6gxZvZq4bLAzAI=;
 b=Tw0apseWNRtY33tzOIdB643Osw6/IT9j65A++UN3CMwgAql2AnRJJM0m2k+2hxq70jQLCpzKYb/o9HKfuryRp/Um5D6f8TBuAluv9UAzPpAoNqjXg8JG+DKYD0cZcLQpIXQaL9ygQlmswGXHREuNY7dlpsl2L1O+tBnAz+Fqe2s=
Received: from MN2PR20CA0055.namprd20.prod.outlook.com (2603:10b6:208:235::24)
 by DS0PR10MB6946.namprd10.prod.outlook.com (2603:10b6:8:140::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 04:55:13 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::32) by MN2PR20CA0055.outlook.office365.com
 (2603:10b6:208:235::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 04:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 04:55:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 23:55:09 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 23:55:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 23:55:09 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66U4t5Ar2001620;
	Wed, 29 Jul 2026 23:55:06 -0500
Message-ID: <c4c9ba91-2d72-464f-bdd0-6bf17680e293@ti.com>
Date: Thu, 30 Jul 2026 10:25:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO
 improvements
To: David Lechner <dlechner@baylibre.com>, Nishanth Menon <nm@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Robert Nelson <robertcnelson@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
 <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DS0PR10MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b55a97f-0cef-40b3-1c22-08deedf6bdae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|13003099007|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CoUxSt69Jz7Lq3b1zsgsAe+1yaMj/MGrv0CJvP1Ld7kFkX+S0D3etpgmJeaJMnDuvwby/+3TnbQ9BbkatkaRevZjn2MNPuxzCwJMscOMOck6AQ715ZL0+Qlc2Khk1A49lBWjkfUFvMPuQbsOsY0XXPyXMSF77PEvNlJEcswgD4kRf/Io+Hk1G7ThKiu/vBacT38xFP6xaPK9IyYWb8TJ1z2HzjjZMqyCzabxjnBEMLEO5+MMkejS55jPfVJVNQK7TgVKO/vD2g8U4Efi5qm70aYM3LSRrBUrYVjfYLVlPPyJer/tbCG/iyo8IT3/FaCwVBY2nB8/SAitd4A5VB9FjkbzMGujCZOxCsMAkrG8umCWX6wdwEveaKxu5cKlo7QEe2znhc92vzupQile8qEEOPQB5tllyb6ERsgClgQiu3p1eZ+WNJynCRg1vvbrcr3v+wVQ1fQPWIJfj6NXZCs6pWtBfR8rXSPXV52YPms7LJU2vQ+lvLPXlp52TTP3O/R+7P3XVyw6eW9CEO4vCTVSpa/MlSS103JXqz77ntknGgIomInWpEsUsQ5D1PMJqFITD+rH4ubtGtez/KnV3dzmnFzgHvar4l5htjFzJho0hMHGS8EHXHOuJsuV7Do4U3oRd90ERu5Zo16/M4+cmpIXDBzwmBBYDBj20J+4FFd0ZnU=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(13003099007)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rGMXELsDCF6meBMLRbN7YvsasBsnIwKv77QTPEinHu+432Mr6ZOZwhYC8w/Ax4Jr5V4E3UTtJvmeTl5aq5lZrwjrEr1xBb+s7gMTY3xfi7LOp6p6Qevtq7WUxBCCU/ZnTP9i9P82gkFjPIKqPPIc08e58+c7k6jIPutpnxAR3wKvt8yW8zi80ZnPLH57B285rqYmdrhuDDPDKLl/cio9elWnalUCHHqpKOk6W14wxkqbITmjptKxmjJj3P3BUgCLF4Ma6BBkCcRBNrQXmfan06MZjwfmnpQzOg+2HRD3PUnjw/q8XkHVKrzvuGqVWWd26Ko/9TmNIdERT4uyH91WRML4tcZjhLA4WFGZ20UkxSUAr3qhRVanpt1CF5cYcxXa3w1Y2chIF+NMaSMgdIG4pLr6aMBWPTqMwNMCooPUd0RAalvf0QqsnR3aVlb5KwlO
X-Exchange-RoutingPolicyChecked: XAXuAi2he0rQfVfBc4yIB7SwWeCD6OLiR937zD/KpnkEpWHdk8Scr9hUQGm1yvIFBBgCUgGkontlAmDFQ9ywkYBBpzM9PxLITgBl4qba2VMMFEnGO8Eq3XFvkQf/oVQxkBWboQa5yvaH+kn69DtQiaq2E5wgaqQvnsWH/Kry0DMAcL4fIb5KvlQReB3bsWnlbcsZopHF0Xx14JmGw3jgW51sEHBMzphJjqXaE5qWY0WAfHsJZXIW1Vbd7A2B6FxsbdQeGH6PXoYcO9DPxVXaCwVMMZl8TH16AdSooxriJDX6+FmyCiDgAdI+VOZtD9UJRltXC1/6bgIqaV7KQWxkbg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:55:13.2463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b55a97f-0cef-40b3-1c22-08deedf6bdae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6946
X-Proofpoint-GUID: pz8vv6bf3Fvstx87LZj2RxieGXedqfHz
X-Authority-Analysis: v=2.4 cv=b/KCJNGx c=1 sm=1 tr=0 ts=6a6ad934 cx=c_pps
 a=BZqtFTcsvC7LidonbSP6GA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=xVOUUHzFAAAA:8
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=w6C2GRjRo4xIMcSIRlcA:9 a=QEXdDO2ut3YA:10
 a=BFkDlhTjP3qpOTzr41qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfX996W2DwijM7C
 m1kSsFkASkduVoj5MulAIam3GkhliBtZNBzcRmHD5Ee1PVuLxZQY65EsTZBfhoc03EANJYp+cIU
 596JillaELPVHSyRyk6ZZzS4Q1VARtXDPo0xDTEf3wxwL/C7s1Ftxt20fDMOnxbRSkJC0XpQcj3
 EJnSeMIvyJ8vhZUW44xaWtG9wxFvD5OfImpX51YSb5d94qKszVJm4OOtwUo7zAjN2BO3g55RveY
 JTvyN8i6/9ItBu6Ynp7NC1FQRRZxpqQm8eNuVGJhikNlc7jUlFXySMVfDEMg1ge+9KAKhYCfut5
 rnOacvxptMKSrTey/tlpYwqhjyhqdmukGcFLZHyUCs9wIgv1jzC5lCwFsrTnMG8Lofp+nK2qCaD
 hKEQqCxe84b7XKnIpWSUe/5EkAXeXoSL9MrI8of2V5x55Zm9UtKOa043KZ+VAlnj2EQ6/0D1yGz
 PttSAf2E2jWRINTIROA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfX8kcHQ3fiukfw
 eHcahjC/KwJW/cuEjOf8gIX2YEMrqcXlmwSQ4bxF7lJ/8Uw/UZJsxWzkRgy2pvCxBt/VoR33QAa
 ODKUzKiFRvhf2cVrqPkDv8Zbm3nqIA0=
X-Proofpoint-ORIG-GUID: pz8vv6bf3Fvstx87LZj2RxieGXedqfHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_215521_017399_5D2E9913 
X-CRM114-Status: GOOD (  11.97  )
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



On 29/07/26 19:27, David Lechner wrote:
> On 7/29/26 4:57 AM, Vignesh Raghavendra wrote:
>> Hi David,
>>
>> On 29/07/26 01:14, David Lechner (TI) wrote:
>>> This is picking up a few downstream changes from [1] to make GPIOs
>>> easier to use that I missed when using the BeagleY-AI with a mainline
>>> kernel.
>>>
>>> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads
>>>
>> Above had to be reverted due to reasons mentioned here:
>> https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/
> Thanks. I was starting to suspect something like that.
> 
> Is PATCH 2/2 still acceptable?
> 

Yes, 2/2 is good. Will pull in post reviews

-- 
Regards
Vignesh
https://ti.com/opensource


