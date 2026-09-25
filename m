Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE4BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsN7zia+ky1QKvpqn5bu1FqjQac+Fg7iqBnWk+ZFy7w=; b=EYf/By5qvJVGSW9weq3Kc6h5Na
	eP/sZR+IuH6PZWlpH4VkK3ctU+slEYEoy6y/MHWnW6h91PvGowvsjW6wbs/KdTeEaK41rlG7If5Um
	1ZYVmwfuACul4TFR8/4lkusuPWMqU7OLXScGA8KmM4jlKKHuP4wB/VFyc7UvJseZBPyGm1uXbDvl0
	na+ueORVgz9pAnpiLjlkyVRi58jm7ZLjrVQjVQPW7rLcAGove020jcEuVwVWVURhLwPhYmtOblfqQ
	pOFLCYVvMXY4PCyah/3tJJE5mkrdG/YLM4glWlQG2d9htfpFZFG8dzYNxjQNdB8/U602UH+AAB0wf
	kw6Hxc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA61r-0000000DRKH-0Wva;
	Fri, 25 Sep 2026 13:31:55 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA61b-0000000DRBS-1AUD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:31:41 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA5NC01803374;
	Fri, 25 Sep 2026 08:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PsN7zia+ky1QKvpqn5bu1FqjQac+Fg7iqBnWk+ZFy
	7w=; b=mP8YLBa2GAZLjYNaD3CdUKOrSbOfwc7fjtADMC/6DVooRMRL5A6Ku10qr
	CK9Yud6FudkqCUxorpvu2qEpp4ypMW1wUYsnqMhegApo/lgy0Vd8FJXzpW0iSMDP
	24XYXB2e4yfpLGzyBNdiXOfnUHfroEYrw5M5tytSzHjG1ZlatofasL/hyrVxjQv2
	YyTfkHnGhklD2k5lev0OcrqiWWT001+43ok76kS31eauehx217mIO9lU84S7cMQB
	B2pEpQAjooDAXdvNg/+dY4oI53Mws97EHrVC0+lHvHjdm7s84d1a8KaomplKfEK8
	2Myzsh5OYKPUm3+9gYixsT5///jBw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwpw7h0fp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRvEqtjWK488Z1oZYnj4ACqU//yNjcMDt3hy1J+qbec6Z4es/VBrJpioDpNux/Nzft1VtY+bUq/wkY9XlpzDB6xtMhcSR5skbvzo00wphJi8zrsvyQ6v9HBhOsvWR+UQGFCk+p+dtDIUaUmgzgumgC1otfqzH5AJpSPFMEaMXeKhYVpzRTKb+WEviUpkvwttg/O8IKsw12SA1izP1c68/bdkUzYd2OFM73eVDAMG+7gsLY60l3YZJAGUoTeKjGc02iqzMJVCQM7ewEkPvRf1bDDPU/zXXPlftRfpSvSDWiJ/wV2MvmC1NmyqRBugm/WIhWdJ46c8TrCbxsrOpb7bkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsN7zia+ky1QKvpqn5bu1FqjQac+Fg7iqBnWk+ZFy7w=;
 b=Hmi7WgGPInbhfojPFm96t9nRiDXdtNNmEXFLH4JwsBmQ5P12O8XT/+excol0vssNZex8KAf4Vxhsz/o9oHUX6u4PyYdnt22irBoOU1eg+Tp60b/0kLoYGSI6W2/3t3UfrU11JOizTNZXNKuteVsm4nRswHN6vngZbwGAgny+6T06TuBlhEO6f8lyqblryY6t9+uGLrxYljX2AezEeZDnfoIkH/BMMNpgMKhaNoc5uBsqoCfiBlr2FfcRuyQYX75o/hXM2BVwFCmqzbuG5/5Yvinu417xzKViCgWfc4jTimzeEgdvgnJSdc8SvoONgiwFyc2vyj/5zrpqG3ar4v7etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsN7zia+ky1QKvpqn5bu1FqjQac+Fg7iqBnWk+ZFy7w=;
 b=uQlzmQHi9IMZqFT961RwORr1pxwcoDbw+B/AsO1Wgw3qdfu8/vWHFYy9qUv/OoSS+Z+nFWCFPEgoIin2N1cgYKT335EWp9rohCGMSLo5+CmpZNnTaWm1RwTFdgH43ncZQkOWgfM2k9qPdjCOxUs/bbdowOCkwu3NtCJEpYku7SU=
Received: from MW4PR04CA0388.namprd04.prod.outlook.com (2603:10b6:303:81::33)
 by PH0PR10MB4645.namprd10.prod.outlook.com (2603:10b6:510:31::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 13:31:28 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::60) by MW4PR04CA0388.outlook.office365.com
 (2603:10b6:303:81::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:27 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:52 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:52 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1nD2840014;
	Fri, 25 Sep 2026 08:30:47 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 8/8] arm64: defconfig: Enable OV2312
Date: Fri, 25 Sep 2026 19:00:01 +0530
Message-ID: <20260925133001.2780868-9-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|PH0PR10MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: b183f7f9-7cba-45fc-199b-08df1b094d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZSOYYhSb/17wLBzIxdJNNp2vL6WH9qZE42rEzHLRfHpu2v4NNJ8Xeb99zA00vuDm4bZXhTOQZ6YLnDQO+ralk3AeSy7Q+mdJK2x+elpZN1jnDI2JYh33cBTxSaVZQ7WwaWjKkO9TBMlrZUPtaZuo3iX1AZ/JdF3OpyEBtm1YTr+Qbh1s3ArRJ+si/dAd9YTj3mpqY6YkTOF1JCVllR+vIs/qCnoxr5cc8FvbnnubhR+obiyMyJOWCQUalgftJLrsVzwnG6q+UQWNfYjzr27g00769tIzQYBOo2j65wD2tHiO4rvXzm3v0l3siTCl+ltWYOmtOt0TqK01YY/TPLZLEY/yyPrZ5oicwrso4q4/VmzyVvBzNCyRpol4Q8ljxz9xFhjyefcxZWtKT6tl2dNTaliDjb1FmoR5qnZFbsZL+WchhXjItQyK98DpNl2T+uePzsjZpezA0JiDltEJ9RbdUYbC1W/69rQ12NHE6OUQyt270MFvGcsBqM8r1fgyjJGbLIqmV9QSKcCmPla0d9pT82RPL+PMxmp9VSVNaBNDbh9xOrIKtK5u6gmpzMn2r30DMTcz5JpdN90fVVa4+QQ5tXiWl7K6DkCil16nPn51yJg3vP0+kyRUZjghCrX0pPRFQlqThwfYJdw/I/CxMImAPazFPIb4prZq1F0LrBgLNfnpVLOK+m6lzPQhF+doJlKNAvldyMz87kjZpSd0mQ8T+w==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ocdxCa+oXRfTFDrENACMmxrrtkODhjkVjBx41BeN0kiBKACc22aIJwBThK4CSZpCHe//NziF1RCm+KE1dfM60o1/+6mram+mOX8E+QXq0ZPOo+92Qobbpdcu5mwoIEyHWT4pa5tl7PzawfW28Am6JnoaU8ucqqMxERVK9rmmZ0ozK19lBKx3HlBmo4XQOHX8jbA9WuGhVwJDfqlARyj1125fIJzzeeFLdiNKgq/blgt0bDaoC+1dGzkLbLhqYgDhTo8iMenYEyUyVK2TPC3My9NVcxkoAbcbOL8ua+fYsYD6GkKMgDfnJQ1Ikq+K9FrWY4j27wav04y0Sn8R+ewrRNOGshWCn3J/QjQC2ys5xkDf+JvbNDWWmJFSgFxDVfdsKLT0JsohIfzQhanrRvQjEHVEzt4yxumQpA836JLvQ2P4g7B9wnyJbk9YH7z8at8l
X-Exchange-RoutingPolicyChecked: JJFGf2y2CWTJmXrA+9OpNpUv/JRwEmVFJU0Zm2G6UUDzgsCap57F9uPMhlFkghITntuWrfgxfTFbPuaUxoTh5rzh++va6LAVkpnudHs0tmOhVjgMVp+XuGqMQpelI5S6kJYpqtX3KG1h7j36H8jBQdM3NdUEM5H6szy6yj5WZS6BgbaY3OhgN26chMLAZRs89NcdeF/RF71srBBQKEzjl6hHYX7vYWnmQbV0viPP7k/QRiimZfH6OsMMzUdzcotRGX/vdwK3VFqc9XoqrY4rsyX36YevynS52J1oq7eSr+/Q9HD9FOBzHmOg/LurUO8ykPGqnxSWFD6TAbl0r2nclw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:27.5771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b183f7f9-7cba-45fc-199b-08df1b094d67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4645
X-Proofpoint-GUID: -WeDOFmYgJWfIehCu8nd4lSVeE7jBP1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX7FjCpXl6Mfxk
 uU6blV6+N/6P1mJfjlEarzB9MZQlHSrWS9vme8YABW6bDvshkqS8ntRfkGViDBNbSYQSeCyRpFd
 CVtPQWw8fa+cciizy+Yxu8sKBLS2hnthGk6gFjcKKFMAMBHVckyiag0BwYkoym/gNF7taSaFOlf
 +mPqxI21rxFwhJyqMQ/Eoncbftavuqa4NOOIEVqgqwi0NF0i8g8t6ktUBwoPVFkrXJfliwBLems
 2GAM8Q6dU+AhVRAFCaOtjAL087zSucX98Xve0WBumelpwcUXtNkTpMoUoYY+AtyvRwgo5ZtpvBV
 2zIbzoMjESOOiiFbSlxhso8/egE/c12ECd7vbtubGy4/dZtsahhV6eNYKkhMduq6qWtSF3LflXr
 A4viL4YJHrDnMUgdQ8ja1OidsrEhnqM0Q9SFZvctpnL+NH4fGZ/ZupW1hNd5z5XLkE6+QYmmWQA
 x4v+qGKSssqLMMCM/aQ==
X-Authority-Analysis: v=2.4 cv=bIaDs/+Z c=1 sm=1 tr=0 ts=6ab677b4 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=8bbwncp3ZlvK1Gm2r4YA:9
X-Proofpoint-ORIG-GUID: -WeDOFmYgJWfIehCu8nd4lSVeE7jBP1Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfXwngfzjaUEg/p
 zCiYSid5M4YjjUWu5DW/t9j4V7F2ov04GCC6RDad82vaviAsr7QZgC7KWXaOQzuKXCHI3aJMrkr
 AD1D/6jTq9aji4vxXnSnqvNSBb+Hj/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063139_436102_67A728BF 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Enable Omnivison OV2312 RGB+Ir based sensor

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..f00b8eee15f3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -954,6 +954,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV2312=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
-- 
2.34.1


