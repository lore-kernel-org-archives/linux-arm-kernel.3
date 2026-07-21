Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701FC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 04:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQRc2qDnICAwH5RxPkJ6/P5xqZpu2mzE3CtTYbWZQ6w=; b=ZBKpVa+9S9oWVU6V4wyTQuLYnR
	czgEbCOK/t+AMaOkZu80ll8LV26bw/dNGhHZqiNNWiqzKF7vDsWsxkQ1jrtyjEC6cDT9VwYfE6Eve
	ns3y9cg9011fqVqOJ2ZVThwVEGekqqo/gX8gRgxuQGGwVZ8cHfi3potDrk+ZTMRfemeEgCMo5rpJ2
	jfTa7ApLUqJOnR1rLLx0YDIdoifpgrYZ9m71A23kU5KEglTk+I2BHZmy8G4xygkvz2L/frqVTdw0K
	YMoGPA/sxUbuNGt57tExbyvIZJu/IceSzVrOQfEgM6d8xxCA0SejWnLiQ84BZhSMBcxuvlH8QYL6y
	A5jZwADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Xs-00000008OwG-20L0;
	Tue, 21 Jul 2026 04:57:32 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Xp-00000008Ovo-1nGn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 04:57:31 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66L2fdos3857693;
	Mon, 20 Jul 2026 23:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BQRc2qDnICAwH5RxPkJ6/P5xqZpu2mzE3CtTYbWZQ
	6w=; b=ARJUkjbn0XvxbxyKKiNwSiESgk7gAxoVs/7L3aGRstpFO4n/Rt/LqXp2J
	dqeMeCEC10G/TCB5cfiykDnPPnXNIvW4aKyvuaCZvJY/NL9tMNK9zkUeUJTSlaUH
	Y4V6dwZUrcfvt9JqlASHUzIFk7OejrDLwTtAJwa9ZhoUNmTmsNeqdPdowj2KU1Tz
	rhsiUEfrVF3nq53uTI9Sz84QQYOAcp5UO7N7wOnJIwkcYlsO301krUmAIB4I9JeO
	LfSJ3vLOgmAk1fC4NqwHnZ4IaXJLT9y91veA5LzNcjkHGCWt0XgnRqEfK11LyfeC
	Uhm6CC+7J+qWUn9uXtRrCIoGT1YXg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077ggqh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 23:57:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgTAuBWspjQRXjaWP80MnasTEc2CmFOvqHoqPhxUZm+JJmnQldi0a6ihTXPQTP0F7fh7MKO6QZRpS/o5iGfFXBvGpiGbbjl7nQWnwYuXOUmUS+c2P1cGLLgX5GxRrlBgGrIW1FRbCfWlY+Cinw6FsmGuSJx8hBSZH5gbS2ISTcY8Vl+NqoqjPp4F0PNvg7vVqeFt9ppJ9T5EL/EElEQUdNaawmc7dYy5Rqv9/ZltY1A44pyFziiB6Kz06JHpNcviDHQQWKzDREee+sx1hKC9YewnKLq+73iOKd3wk3+QHwmMIqdUNO4CXuaJjAa5gMBpDQccbYf2wlLiafNq8KeVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQRc2qDnICAwH5RxPkJ6/P5xqZpu2mzE3CtTYbWZQ6w=;
 b=K06+drV38WQ0IDxaY3rkN5ahI/XZoS9eLYotKeNd6GICAoL1Dhg4ojvU6zrBN09duxZm/6T4xJU5pTvZt8CYd2+fJRGt3OplqSa5v5G5+JBNSWtqSuVkgE9nzcs/GbDIjwLtivKxE8cMmzC5FwgYfOWlZwz+4fBhtPgKL+HiowDL3olzxAheQXkK0Niqc3WXWhOmxQF58iIEhWXKjV+ZLfO4zg6Iu4MS4rnrK4jTufEXnN+anGYIslcMBUMPI1byDFLVOsvxhm9zXBtkjyN3X/KFCG9FZ+o4rqBRp9mKTRaWJj/f4Th2hhOdH8dFWRz6efXW64zh9IgoD6HGmJteRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQRc2qDnICAwH5RxPkJ6/P5xqZpu2mzE3CtTYbWZQ6w=;
 b=DjeCnDMYf3sOB7C7iGrtNLCJmE+KBpw878y5UpCLPtH3YGyzzA4LvaIj/s4KOAS4/OdRY47ct2BF4ILTZvFSDz1IZH8cg4MexjiMadx0kk171F0WjZYRLEdn5HKNYVYF4MNNW6v97Fqf4odcKgakJPsBZUi3dR+kiqCyq0fprGI=
Received: from SJ0PR03CA0169.namprd03.prod.outlook.com (2603:10b6:a03:338::24)
 by PH3PPF18C4487EB.namprd10.prod.outlook.com (2603:10b6:518:1::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:57:08 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::2f) by SJ0PR03CA0169.outlook.office365.com
 (2603:10b6:a03:338::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 04:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:57:06 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:57:04 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:57:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 23:57:04 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L4v0p14078823;
	Mon, 20 Jul 2026 23:57:01 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Nora Schiffer
	<nora.schiffer@ew.tq-group.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux@ew.tq-group.com>,
        Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
In-Reply-To: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
References: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am642-tqma64xxl: add ospi0
 vcc-supply
Message-ID: <178460981687.873002.12868613070659357595.b4-ty@b4>
Date: Tue, 21 Jul 2026 10:26:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH3PPF18C4487EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 8578589f-d20c-4231-c957-08dee6e483a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|13003099007|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: nwsJHq2HmgS6Gu50Vo08edCcElkuF8Wm/2NZKdhw6WGfWTWcqX3jgQh+GlVyHuPtBlbG2jLFkruBJQp+6lLD2oqoAEkxkF5ORSMJO2snu8PBWzp6rfALVQqPZDBX5OPktD4E3atIaUh3ZiI3FySj9NxMmO4fZ/4cR2jH0rR33cYEREs6vyDr3JLvtccRr5KfGw18XDdXMEVthKBGDvoYVnLIGXvnHFJvOZCJ+dpBHuRwT82cbApqqf1m2KQfC42Ovu9oSczpzW9IXsRaqkAhrxyB7DdOHjsHp7jTq8lX6H3/FCZb4mz+nJ5tFJHKLe/X042EHPls9onq6X6A/aUsnB6g1uohDDxAMqWMX0M8mu4bB2U4d2wR9XVhCp2I+lsK0QH5fKsaSFIBmQlVb9knc9/5f8pd9kVaqZKQbPPwdhr+slnsCAQXlTp+42aCDQ/6uO3S7PAXmeO4ZTfMjzqrlxKQo3Fs/gF2mi2VKmGQCd+iZPkXB2ZIxZE7oMFc+PuKo5IEGrxgIV7VzHY538vHe/7MBgrXPgwXYhznRxt7QMYC97TXNnPefHZwAV7Vbc7gJFmbqH0a6Z21r46wOBtRtJMp2hAxduPzgMCMiKHH6Yk3+phS74zufNMNWMUKeZudQKGsloVm1RRLsf0VDvXJbw1W/IvYKVyo0onzsoFiqzm7gIYtjvAsMuipba2arRmPaME2QJBtdtzWtRE5INk02A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WPFEyy5UYrr4/R5/XX5lUvodgUzl1oo1z/+/uPi9PGFE46x9vmVCIRQNOe4LDZLwaQ3tXRJupxj0h8imG4C16f+f29/mXgPCgow6ITft8qLkrvL7enPlVnVieIJPTd1u5WkiEaQFMn/XRuFH8mZSbXM8XCBVKn+i91PywdyMoqYwQWFebsmKYyHkYQYMMMCAQd/ShiB2Uiamouf11ZnfvYM09DL4Hmtv55NY8xDrjjcxXO7RN2ogUBrOOzet3LI21AkW7sfq/EeSL9gME9ssBCcsdD81zOcTtTtET/fbPgFPw170SF+fxX+WGb8VBVHvB2N4YJLgpN6Uqy7hDyi4QXD98Qshlgy//b6MEs89fppnsORFvg6BNxPrJ/Jdx0A6xzBeon5vQ9bvj3gh4zmhQXYyHkS1pWylQX6Y8hSOSKKyc2zbYcu05G0O5EJ/C8l2
X-Exchange-RoutingPolicyChecked: cg8OGkvqTJnBTAcFEakorsCOk60ztT+6Xi1vC1jeSGa2i/+5gkTnxbom34KCRQxwJ83qe1pCACFi0tG628EEtYlExg5xk4MnkmwfSa6ok+6kmXcYdo7ooD9NySai2iTIQxaS5wl1Ljkmz81Cf4yOmQQHr/uiSKfi/rD15U+x7++F0bUgbY2utGF8edQVTpLAkAtPkntK9zYbSYz7lgvHYp2+kSrhUR7qKH1HQX99Fzh+5/XXYNrQarRK8LWq5W4MD9B59mNYg2YBFqlliAFtYhbpngNXOoLju8oiSr4F+eNl0QnVC37+fCdkTH2edg/myF7Hb1HF689BDi2CacTKfQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:57:06.7718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8578589f-d20c-4231-c957-08dee6e483a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF18C4487EB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX45UH1RItK+J2
 bq6xRKSmoj3iKWZHZjvcBxd6ME/yFZY1rxWaJYQth7TtZ0ni4THmoIiXiyRlfhk7cgVmn23PJRf
 I1x2x1YS/BMMP/DkOWbofVZ9fjuA6WptZenp5Cfh4Q3MRCLpVV3OHNGWujpB0UnR/WfEGIKD5Bg
 yyakQ79OsgK6hN1ycZ9Q4LWnMgvjRSCDfKzJZ2vtLTiNZt7yyBe2A2JUOGG1XhbHg/vmWGvmHbK
 k+cuxCGE1m3s2MQztwlfilZ3D+kz6I0hjU7igw6mhRi2Jq6J2s0WOxakyaHX5xl8KRB3TXDM4eq
 tBWAJJepgMR5dcUELaeV9JnPe7Uo0KKz5NMsMX7pqv+lnVq1n4lDXUeE93KewnkG+g6bbnmhJRe
 qSudT3kDz4vT719KY9iTfI6OMd1rIcSaLeBmh6MC16PNIKdrh+7P9ApNvwGH1HpYJAu3Xm9h5+k
 uWicH9p3lC5VUyaSMeQ==
X-Proofpoint-ORIG-GUID: 9l-FNO1tDahb-hPbW8hUF4lSh_drnpKY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX7E0v2+dx0Da2
 SIeKrKwZtRWYG8gUtS0o0bn3Sj6V4aEZJalyi+0QqKMg5MZJi6a7OZPT2vh2BvB+KeKuUeAmZbr
 nFrtNAF+QxUkM1b9KfwoDNciaqyuldo=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5efc28 cx=c_pps
 a=Os0crU6ZVxYeJaTskmJGZw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9l-FNO1tDahb-hPbW8hUF4lSh_drnpKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_215729_577770_6C490303 
X-CRM114-Status: GOOD (  11.73  )
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

Hi Nora Schiffer,

On Mon, 06 Jul 2026 16:43:58 +0200, Nora Schiffer wrote:
> arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
      commit: 4266c6f3122ac388e1be7e71e09afc94dfc10379
[2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats
      commit: aec2bf3585ec0aacbea04c3d11077b2981bc6966

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



