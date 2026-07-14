Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE4PlKF2SVsor8rjhmNRWI6FXUaZZ0xkR0vwd8d1TpQ=; b=IsVdEgEmgLO7Dh5V8U1fkH8Xn7
	iH3neTiK452yqrsoouS8aMQyRtb9YRXlv/myCXpIBC9dlbRDwz+CvjqFYwGJsEkaY0Gd7F6WnvGOv
	GBB19mU6O86LB68+njMofJjj3L2ejuB2nUl2W6wNFjMsEySgpteOh64RFZfayVzirJdSjPyr3neoJ
	Tz/dtpcKHzBwdHzVsNqd5PwOgQgiZshPignIWaHvX1dMKmWehHaoLqrTgc6Ntk5f3qt/ICtiFmMXN
	eN/xUf6BV6OXENGz6Js9kwhJYk9NyKEeFJigwJrtCFhic4YyUThP4pAoxjI3vrwMapaBJTGixVz/q
	6Zex9kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjchN-0000000C1n9-0ww3;
	Tue, 14 Jul 2026 12:57:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjchI-0000000C1h7-1BxS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iE4PlKF2SVsor8rjhmNRWI6FXUaZZ0xkR0vwd8d1TpQ=; b=ohLzgcb/zmLiegyj2hNHroibaI
	zCJrKUFodz7I41O1nOoMqc+1f37c85uV8Vn0lpUQ+dfaA0RRKMR2LkYKXBNqPuVHU+2HYhYlxxoQ2
	ec+SHOC330dnAOfBhr/MkqVFgiru6sOCcdWi6kQYG+RPSB0BQwer0297zCuVkmvYMTyIQWoqYpJ2v
	kV6yhVlJY3CY3EWMadb5QNqgxNECL4nb/A9ae6xciRvY6J5OPb3C5PYPso/UEsW9Q6Jb7ODUwulLa
	YKxY2pE5ACBRHJuetfKOcfqVAp/L8QJTiPB5VOER279sJfd5nZ4mkka9Ny44IjUZEVd2vkjozyrsA
	yc9grrNg==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjchF-0000000CVHW-0T4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:57:15 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBPp62695296;
	Tue, 14 Jul 2026 07:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iE4PlKF2SVsor8rjhmNRWI6FXUaZZ0xkR0vwd8d1T
	pQ=; b=ZdPWraAJRlsT6a3jmJNloI/Ybsd1HTjhtO2Y/RdIJNYJu8MxT75HIF3Rd
	1999wi1/NVoVWFvvwfr9S/KsPLOBB5y3jtNAh/u9J0oZVbaIvAxEQpBHlkuRE0KF
	TwaVpceYxnjb/QDG/dAhGkWkIV/KwLG7NxALlxMaMXP8zTbK8U7NLe+h7eT+bvHM
	Lrv/nWjanfanf8UjQLJaPdCXtDm1cTli7Sd2XTRy2FPND2uyb0bwEGVVVhEFMaWo
	WGNQfV7zURExFI0BpJdKd1rviYlDJW7V4kG0aSmzNAqXbhIAwUl8kDAkbj1aCp+7
	fOErvzzCGeve0Pt8JtTkQsouNygqQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dge37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:57:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9vgjUt44HVxPkHmUAmtXTbzqpt2iBNiIHv1KcUh2qqAWddSzFuA7XID9akbOMRY+PjwXEVsnyX4UROs/BWP/f0smiWQSAR0TSmGmJbI5qAxnPQ4DL06Kv/9zli/CkPCZY2rhgcTV8pmsY1TQohpXzKdQ5FgmZlYCNEOG2g59HGYqeXHZz72pUOwKYZRKNXqgbCsbovhQ68C7zUvoEgHDijSiopZ/UDsELMSzVrRSTulS1vbUKzMHKFtlbbAjbftnWovkPPTHHDxVdi+d3iT8BVr8zOLo0aDfrV2kEA1tEcKa66W7zEqflEJ2mpYrorfIGzJWahJXubu7AlEVHAN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE4PlKF2SVsor8rjhmNRWI6FXUaZZ0xkR0vwd8d1TpQ=;
 b=ZNo8iqaNm5D0+N2vMs6AIoCRslS7yfCFXH/xMbSrhEJq6IHlYwzbk6j5QUCMMja137BPnNKTA0HpT8rILf3E0nsENt0998MrNNVOiqobXnrL7hbSvuO+4R7lbEzzJ/M0EXBdJWKTsqS5J4rp+KaXHaTPoP+IHGyL/h3qXBcaB5aq/X9GsghSh1nyK+BZnu8YCNA8IzfQtfPJLcfvQA4e2SrzhEL6bz9znGk2b+Ss2qcR9TKP8x1obvQGEJVJGMxSxnm+CUQtDwvuRUBYNBFMXOFYLYfSChC5N4bKUzo5/PTHb49LurW/XhCGhyJpk2WBVj1mVmcLqt39K+fven1Bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE4PlKF2SVsor8rjhmNRWI6FXUaZZ0xkR0vwd8d1TpQ=;
 b=FzzxZcRLZP0hiLiy428wzw8jvEjib5Wp/SYkO1tPsF+nlIP4Hop6hsEO5UDyvL1i3b9J9Ks1PwOYxC0IiJRLdmWcR4As+R1VOUdJwf1HYCgo5/kXOr3P0RVsOcz1fmEj4k1HQ37pFSbHFj3r5BMI8janx+hys+w/GmBR0DnwY1Q=
Received: from DS7P220CA0056.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::14) by
 LV3PR10MB8156.namprd10.prod.outlook.com (2603:10b6:408:285::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Tue, 14 Jul 2026 12:57:05 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::3e) by DS7P220CA0056.outlook.office365.com
 (2603:10b6:8:224::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 12:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:57:04 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:32 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:32 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fa546300;
	Tue, 14 Jul 2026 07:56:29 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 15/22] arm64: dts: ti: k3-am62p: Add DDR and controller node
Date: Tue, 14 Jul 2026 18:26:06 +0530
Message-ID: <20260714125607.3304375-7-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|LV3PR10MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe66819-aeec-49c1-f23b-08dee1a76751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0xkdwFTc4SNGRO3eu4wPnzJTHcT1ELMcffdhPMD8e0EIKwBh2Q0T0A2nn/CUeucq4rwdL92vl+XUiZZZuw9f3i1GwQ5hGuG7PZtHVOK2R5mv+xRvKqhaDSrobkJt6jzdCDtZqh2u4Qfdz2O6od4AdTNnnXG80nQsehn5DWGw8yYAowzTVHQQXD/mqNVOrcgi2GOAUF3JGpfMvIr6yobbozeY0rRQYUcttFt6TNVzFAXCT/n9kzypwZfC/1xO1oBMeLl+Sor7F2Z3aEyNVBY3LZraUP7PcafQ2I8TDjLturDWi91wlC4LhEE6Fqo9mB8mCs46jtmgf1fw1Nr9GAHoz2+fawACjFQaEideGEvMSF7Jc27EMWWGdMve1uFeXA/08CkvCx/ld6Rn+NuY1likxJnkZdggksw2KgRb17w982hMsOH4ofURCt98ruH7BuMh4R968qHDXck14m2JeNorh0nhZzJyIvSlrh6w77KLrIos1pd57BmyfqWV9O96cizAXn/Fc4bWrrTXL7s2mRyU0tevilX5Xhgzk+9+lxxP8kaKpeAYJMffA/XPk+FAucQdkDQpWCrMCLwxIHas2v6OdzJCcspq4zcvVdn0yyYWECg9sPM0YyQt/b9kpRep/mT2SpF51CpIHBaHeyOnLxAqicuAIKscDODDRYN1rDaixbyhJwSIBi6FGwDuRi3ukuMfPbI5E4iT6YuF1eTuUTpofg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lRNm6Wjb0aZYo6iV0KpWKoSpMjgz73LYTVOkxBNmEz4fAC5FG2kJLIId5RiOLrGMhfXMdsO6mySFtpkokZSDjzt84jXYmYbItlr97UYcMCHf/PZXBhW3mRoWU0qk0MYfIEmYssvkNb9B/q3qU3PsHsgfkxiC9C3yC0nRr7HC3afYwbmvZxIOk69ZhCId/2wl2JKPgtEvuuacQp+FSRTS3tkcVxPWvj109mHPQyDnfp2dB5Ib+o36s42J1XuChiyW7YYI0lzN1aKomees00MgtfyMjK1LvIW0beaMFVdxSxEody/TSL+lVkDHHJsC0R3N1usMvvDr7cadP8SRprCZ+J8ZbP8YQZoxzVdUfMlomXP6gJIct9tEgGknnXOILLOjGBwlHIDyjulAwSIXwxhGQ2qTengzXbzgAs6dz85VLquSZPaKEqp+oAyx1rHQDC+B
X-Exchange-RoutingPolicyChecked: UuW6+lSTt0abNmnAfVqDqr2+pv2Lr+VzN2nWOF9rJOQPrcRoNwzrfHsE/ib2mGNN9BZ4V7N68NZC7Jtj6VTGENMHbV7efGG9QtcpSeMZakGqB+kUJLt6DtYmwctq94FaI8WchK81NSWHEi92jmlB1cA9sBzt9XmOCh9lhw7iWOHpy/1GSoCmqxWcriK/sP+Qvnsxeh58JJiWHChoEYcmxsdAoyQ4GRc7czouNQx0nKmuLzZUIUIFd/pxheXjY6f9zrXe3Lh51U+1SMClTWdNqZfvAvpY8XzbroJ39QNU6oUPEfCD4aRwF5F2fBdC/vF9pbVymJKgk6ZCx+WRqlaPAA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:57:04.1422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe66819-aeec-49c1-f23b-08dee1a76751
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8156
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX0ujrvlL2ihqL
 zZY8+7MFjv+DsJ94ywHzrRk5nA2zbsUacKqHWk3ZykUjBB64oFdbW9Z/xZVfC1Xxnpx08a2bwd9
 RWv9RJCgLP9NLTktO2vLpGzQwV9VsKE=
X-Proofpoint-ORIG-GUID: XfLDsNEx37TD_GfLSZNKXKFLDs84OIuN
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a563224 cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=UwDTjPQTiHACf9wrAL0A:9
X-Proofpoint-GUID: XfLDsNEx37TD_GfLSZNKXKFLDs84OIuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXzFqatiiiJTJp
 FKaw9eMC03bmlXy0FNbn+Ab6npjLiPnkWaew6adWQnU13AX36WGxy7Ki1ZAMMbT8Nbu6f3VRXW0
 fnWBuQhYmKP68+GUJpKB3TYqsneKyXWiRKj7mDQCpi5a0+JXsnqcWrqpWEVZ9Ord586u/9xNhrj
 7JFTTR6N+Rv+5/rIGg5zCPilo21q95LlGr41TfusHjdzGD51g/YY8gHXbO8hE+dhbgY5Zu/Rjsu
 ufxYgDWWWTvJGfZkCNC//bTYAxX4rSsMp2Py/FxzsIxhYvCZkTnKG04LAWm4WgBvuecL4ZjU+Zc
 g6ko3XnqHth5dc6OnaD58JwwQul4yter2uqpgYcfZvlMOueAnzAZEAzcpqI3e61NHe082YVztNq
 PMXruV/jUMcVttda2SwYVLUYZ/XofjSbt5tQujYu38Q0fP0op8VESSyiluasyQPpeAnmXH1DHl9
 xBF126hO88czXLxMbyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135713_544428_BFF267B2 
X-CRM114-Status: GOOD (  11.14  )
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

From: Santhosh Kumar K <s-k6@ti.com>

Add DDR Controller and LPDDR4 node for AM62Px device. This defines the
memory controller with its register reginos, interrupts, power domains
and clock requirements.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d7..4e07ff4fa21ea 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1135,4 +1135,29 @@ hsm: remoteproc@43c00000 {
 		/* reserved for early-stage bootloader */
 		status = "reserved";
 	};
+
+	memory-controller@f300000 {
+		compatible = "ti,am62p-ddrss", "ti,am62a-ddrss";
+		reg = <0x00 0x0f300000 0x00 0x200>;
+		reg-names = "ss_cfg";
+		ranges = <0x00 0x00 0x00 0x0f308000 0x00 0x5e10>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 170 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 170 0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x6cc>,
+				<0x00 0x2000 0x00 0x6a0>,
+				<0x00 0x4000 0x00 0x1e10>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+		};
+
+		ddr_pmu0: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
 };
-- 
2.34.1


