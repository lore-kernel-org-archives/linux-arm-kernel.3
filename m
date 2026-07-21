Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764EC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4FHfvaoo5/jYGHkwNEIuZsFUSLjKDRl3V0EcYmSCQM=; b=DzTVaLPW4lsSoG9PkrBexkkZcT
	DD2AmRQZVmrr+S7j2XjWyZqe1uMVdah/TlmGfPApji2gHiajxTzN7arXz8Uh93wkCPgtYP+uj+stS
	ANgLbopBCdinbg7hGjjBeJAbhoqPT+p05Lcvyw3jTIczgPAcH6aKvcvNzPBC+QkcYVb8zDoICGAPK
	WM/LtkFjp5P7p20ebCzt7AY9jNwcCQG0CH24E5DfJ0Khr0xs8KRRi4VfhzPAbjgqYuob+Kkd7HH1g
	qVDG2GqyF9pFvWlopkhf9JnyF77a/asnqH+qWKXRW77sgTX3wgIKRq7bajz19iW0XoD40LS31np0+
	04OB7tAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3MR-00000008Tl9-2KpY;
	Tue, 21 Jul 2026 05:49:47 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3MO-00000008Tkc-1x6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:49:46 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L5l5tU3420394;
	Tue, 21 Jul 2026 00:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=T4FHfvaoo5/jYGHkwNEIuZsFUSLjKDRl3V0EcYmSC
	QM=; b=H1RzFtOvG0BimGNU0QHwZazd8ZflQPszzUluRw+7uQBa4LFxBCfh7g2p9
	y7fYMBj1yxN+Q1o93qa1jpzAMS1nEHidoXMDUVaTYTgohRT54nTQPDj9r9rwQtRh
	8J5ktfM48mgRUn7pgWfJEWmvOsWjswxDjB6GiXu0KK9pFbuK8qae6l9C79iqlZNC
	n2RQg2aRyEqupXs0D8ENMUGK4OC7lvRZ/6x1k5fegQPFH0g1Fgu+M1Hrs4OEchd6
	pyt+TqF1fR3Mi3UkmsYAeAVy8vu/nV8UmjlToSXxYrzqoy3cR/y3wJV97838V49T
	g0n4dzVJHENFbHJlG02sQ8xAPT6hA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhk19dmmh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 00:49:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJTLupMpS/fOZXCRtW1tWJouR3kukoVWny8aynhY72ri3gO7pFRdGtMPqcnxTsVn949u96GCcA+cXQid/XV9ZQ4/Tw/TgQUWN/uezD10sEe+nLvaNBPnezTpaUkKKNBz+EMMqEfL6IJYN0X+92xjUAmlfZQBrWk4XnlQnCmg3brFKCtxr0tPRPzkWTVT4codMhkfyv/Xtn5hlVgaibljgmGeQi2wVmcRBhInLmAp5ENwNauZtojVUanFGoxIylW3tdjbmUmNsU7DpzkBGk8TvtTXhIaoxjLlju82P6MUElgcTl+wj7aJQTlJVSKlZlducoQvgmjI4QS1CfZ7ss+eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4FHfvaoo5/jYGHkwNEIuZsFUSLjKDRl3V0EcYmSCQM=;
 b=JiY1UyAHnntFJ3CKdK0KdoiTPxWHSn7AYJXfzg2HgIjMzIf8la208LAHRXbWqp2AqxGR8D0lpQjiNHy3jtvg1YYZvlV9DJdBBVH7B2npOaDX9kTLqPPrRllovl1GOk3mBgWS5gJ4piqoQLwIYEYjjyVpP4KMIWlyWd4Ms6nAndo2Xm/vxOM5uYPkmC4FL+XVG2Ev5r2hUaTHrHaYs+leAw/wbb5U0CIn4voM38ygM07Nn1FtdnU/MqMHtqdDJDqww4oy+MXQPO72B/Ar8FxY3w+0xgF16wfAa0/PJHr4kMrlu9JgBBFTl98jv5vFLKAC24r66/AGGRuikqzZR1RHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4FHfvaoo5/jYGHkwNEIuZsFUSLjKDRl3V0EcYmSCQM=;
 b=AT+mpXd8B5uOQYD3gtRZnG8rI35jBLw8rZeel2ocynDmNE4GBMm36raZU1Gy3i7LX4dQwLmhzK6YHnXIpTAvBH9Et0Zo2+NwTfwg2Cqr/idpkoxSMeB7+tz+cp2ar5DxYsUOQiinS1crzLNzUx0zMXdlg+gGo+TMMMmlLmHJiVc=
Received: from SJ2P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::15)
 by SA1PR10MB6615.namprd10.prod.outlook.com (2603:10b6:806:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 05:49:37 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:5da:cafe::44) by SJ2P220CA0011.outlook.office365.com
 (2603:10b6:a03:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 05:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 05:49:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:49:07 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:49:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 00:49:07 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L5n49w4180349;
	Tue, 21 Jul 2026 00:49:05 -0500
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
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: ti: k3-am62p-verdin: Add device
 tree overlays
Message-ID: <178461293945.873002.8278843868337803913.b4-ty@b4>
Date: Tue, 21 Jul 2026 11:18:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA1PR10MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: b0345f8e-4b05-4e45-96b9-08dee6ebd870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|13003099007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R8WCtG23D00l0stgL20q1fjzlzqiDTtjuoUfo6glawbFepeVFb5F7fdxcPhpT8nwqNTG+VXASLm2r9gR55aZJr/PMrekrlXLgBr/IMPVFemkW25k6vpb32Vnjxv++++y4ZeTIh7KsF6BpYsw7KH165hrWIt8zJCl9JYotql9fyQaxqvvyfg5+yKd+qxS9BnSkJuL2gCcugTwTXuKYSKg//P7KKt+wwHRxzs0M65G16Zl+Kkt/oYiF1bhmVPd5rjueA5si1KKcKI1hJXZuRHRhWNSckB2n3xl8X6Z2lhYUPC/sVVMtBGY5CGCGLI2NX4G9PCHRWgPIfy31iIi+yFy526aHDjeWz8g/Ttz2VLB82b07ciI2hH74R+MCBWNTNe5wBoNL4rTg34kPlNl+x3M2ZbahFvXJBs4BCGwcgK4fZLo1dU23wqdSB44O0LzN711Nz5I7o6N3LqDFr6Itv19LP8zcvZ16KdzK5JNBjjL8fWHqx7fDmSEndYn8na47Z1PMfELUScP5Fk64t1IJ8dcY1uwhjnK8fdE2K7tGc77CZ9s2cTaXNkFn9emfbRYdsbe9q08Pj//OrD0XWZQgoPlWv6L2eitTOJmjVG8x3xgAavuFGNCQGR0AWrT7jflOKoFF2EvM6NROw0fAL2KbkshM7vGNprpNU7H/8tFlIhIYpVNttvFRkWLhU4Oa7KIWT2fnJcwHk5DVobUm0ubc2cKDA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hc8sQWYcGU6T+1z/A2w+dGH2Y17lvlt5xAocYVl1Uc2GrShqEnAU82i+cdHsAZBOEbvqxTWErsnd8qhOUQ1+Od4UilTPuQNTpz/c+n8bcHKNs8O6YLIc/XPUuniW2K02phxI9VJy2ZFSun71z3IR/qfQURfNXlQe+g0zdniid8eyHQiKWV8od47MzfU+AivYkLlSRZApAuuSjpULWyPUq7K7kivN0cOc2BBQec8R+xbCMJmPWSHDfAnLTTm/Kd4U3ejglhmohtTSVNsow/Rse5PcPhjY2pfOpgoobY5vSPzuX2Mqa5bQpcmRfshdbiz9YuBLCNz7SY0qPuFr/Zk8W64q6UY8i5S36Ta2FM7Q47JqU9QLGkRAe6o8h3Tiv5G4q5vugWH5B1XJYST6Gt2JgRjeuRhewMi9sQPcB6BhtLzFYGge3Ynen3QWc8sMJYxH
X-Exchange-RoutingPolicyChecked: eDtarQIfTX4DdSChKH2l5s1INh6BGdcUqZ1DElt+5TJtOC+VxHpIOSPFEpvh4SjBw+tDVn8nzLsQygVVa5RNPmMnI3VRXW4rBGSkjW6a3/ukSVMRdHTwgmWKKwLRU+W3CihCvQ3LDtVh4Dg39e6fwO7j/Lz5r6X9EhNqxX+WZ3ehlcAMPPD0BdCT/vrdNHzgRXtvy83FiMg2o0aSTPqjn0KXeL9pdE0SJn58qz/CyKGgOj3Ult6Y6w+aAzhMY1Ho2/lcfDbvgC7xrx+h4JTsPAJKmwVSESibZO9MUjV8HujN++gU2MN+pj0m9AfVsWqp/xjk6bttjJJn8WPIzjhepQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:49:35.4906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0345f8e-4b05-4e45-96b9-08dee6ebd870
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6615
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1OCBTYWx0ZWRfX/YljjIPKUN1y
 AADyr9QfLrLQVmC58DqF1vt5N1tg4pQebkXZNIe13a8GyfB14s4eWmRl4RTSLLt4lYkmF/Wwu1K
 Ez8nFKMOA3IC9Hs15ReQViNOrxkuYd7WqmJ+5LwCCfPLulh0/mbdUHISTKoT8Q4iN5vXqiyoEd6
 TH/Xk78EJZTxb15IAmOrsN3ilkGfSTW18hfE9kgaZc0p3s72KUDlv0GERzwyQo+IiH+3U74nSCp
 /v1FZQo9hSYt+59Mm8fh6jd5iK71WVikxW76NDLQX1lD9mu+JmPtS8IV2U17xUzrGz5LO310TNB
 NWmdzts/NRi6S0g+4+bxP2TDZQp2iPk5ki9Sr6Y1ASOWr9pE5J7bFNOWEmbs88SVLLljrKTA6bQ
 Cs+SWN6hZgT5WSlvtRFbnwsY+UGLOit0DsnpS2RDC0EwQHoOabwYIcs6FWkBxudX0O6T3c7rfjr
 VLH+LEwYPciRanWJQyg==
X-Authority-Analysis: v=2.4 cv=I4pVgtgg c=1 sm=1 tr=0 ts=6a5f0875 cx=c_pps
 a=gDBu5PZszbgJPyH+JdeeiQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: JF9-Gd0mTLd3EaYDxwmz4B1jQCc58tv3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1OCBTYWx0ZWRfX6xJU+Uw0AqLd
 20+CKHX3Eb+VG8Jh7PPzFopsCn8SkeceYq11L9pLzBp5uo0eNKXIimN8dbUPnAegzOGU3IBXuJv
 3RgXrf5bmYkkZRh1xYKup63KShpmQu4=
X-Proofpoint-GUID: JF9-Gd0mTLd3EaYDxwmz4B1jQCc58tv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_224944_658403_9BDDDABA 
X-CRM114-Status: GOOD (  14.16  )
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

On Thu, 16 Jul 2026 19:42:59 +0100, Vitor Soares wrote:
> arm64: dts: ti: k3-am62p-verdin: Add device tree overlays
> 
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Verdin AM62P,
> bringing it in line with the overlay support already present for the
> Verdin AM62.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
      commit: 2ef0fbd401f2b96517410b8eabe2ad107daa9294
[2/3] arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
      commit: 3d86b6aa2c6279b695effcb0de78fae7567fcb63
[3/3] arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overlay
      commit: 43c6215de59abd42b20112ebbd1dd1bb1a5aefc0

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



