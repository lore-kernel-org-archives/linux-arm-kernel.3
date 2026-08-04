Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A044C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 04:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6Fik3wcH9POsVyGqMY86akNWjlW8hBenqyM4uZlEUo=; b=aU33N8gvoCO6nhUi/wM/PBxyH7
	WnDROmPROQPihcYK93IiTOWAbli/Jj8O0rx/RI+5Vakeh1n6XkQhAvw9FWk2EYhsiXKn596RjSQEY
	WjmXgyBmwlW8AwODSA7QSQQeL4cUM0jSX8HWEw7+ZkRBuXPYyz6r77X1wEU5NjGBi4WCxjh8Xo/or
	2wweqIb2Ab+yvOOqRz8I+cSxlwafUS8BDyDFAkzpNfgOS4dZ0weWTcmqG9BVsHipHsoGNJfLbtylI
	h+U6wXvssTk9dWOIrPpSuqZwhYHjZVrocIhnMitjkbOMOx3AoLDX5Ycr3lBycJaWo33tmfW4R3DiA
	uC/6RAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7FY-000000010rE-014S;
	Tue, 04 Aug 2026 04:59:36 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7FU-000000010op-3z6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 04:59:34 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418lQI1418105;
	Mon, 3 Aug 2026 23:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=u6Fik3wcH9POsVyGqMY86akNWjlW8hBenqyM4uZlE
	Uo=; b=EbXqeZRdvi90+jcBPJqGH/UFCG45w8VnZu7Ve3gJbLwbsDySi+TOzyDYE
	5s4swZhszHrUy5vIwK+hUVwnRIHr5NOZ/ljWUa6v9MAXMCih2u4C9IPiDrEfLqve
	g/yud4Xcgbk0A8SLHzahCPN2XRBO6ZbGcqz9Z5BWhU+44nH3K+kIJejJBfSFQMq2
	l3kZ0wBLzYLRXeR6EdmFeOgMoDIfNfSBkhNHZJyOoKNYkXCYxmgRgc53V7rpadTu
	+K8pAUXbPSXfk5OIzUhM/mM1mbMyuFFaFOR0bk8r1dmFA+hSuBg/fdae/JAzH2Tc
	RB+k+fyyUwXg4SrpQ7t6yaaNLCefw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ftt0apxee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 23:59:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXxiKpQCwo00ICXLaAgb3Ltast7yAeAlRiUqYeRVFqt6jMFqPVPTS+Z9jJqe6Vt8xN+JBfO1/mp33+nw3MUNDQDoP1nTAWwv3t3nOp86oLpSyMhEMwdKEcbtQW0TOKU3DadwWSyCa3uHcDBmupL5nTYFCvFWd6YhNQ/TsE1Tr88hB0fLHR3Swe0fEKCcyOJINsPkQBQ8VNobnCaZO2EM3TRLeUfg1U8Eb3s/FntSs9+jZWB2udF629uvpXz13JYYLeEuxadyhwhgbCP3Krv2qPOMjjND8LrXTzmexaE1cl5NYTBGDc7uHvIchHmEm0vnHXueRzBUgmI7inGEPAbDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6Fik3wcH9POsVyGqMY86akNWjlW8hBenqyM4uZlEUo=;
 b=OtQe0v4PX2tJb+RV8z0mIYoo8OeT/JK6vG40+h7wacOnObbK+uwfJmlqYGDm66AFAlfHB2LU6G50y+TdrvQGLA63oiX3LmxQzXHVW9NKHiyzk2RIRCrwmOuQyhOOmCOUhphEC2iKvyg9VdQHBLw9mECfI+9sOMff2hKmQzCmKg+pDULkmV2orfyD7bcwMVKiil9wOaqQw/oR45P6f+roKVNjuv6ZW5Hml+doWOBNmVdDBp1jqz39s5Ay5xHbv0/+GEVwcNnOBUMYT24/bqdDeu/sdVZI7O/nM8j2C7lmaXm2Vz1r3aFVaqx1TcmyIptzFspL7PiAnZYLctriyiQhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6Fik3wcH9POsVyGqMY86akNWjlW8hBenqyM4uZlEUo=;
 b=fO247poeQzYwmjRBgWFwZvWNagOvgus7GbxrhvK50tVamlJpLMFe+qCfq6iULXhCBzCIh1WQSLaKWC1WoSLCgMCaT09AO5Ox9FrugfRPtx5IicfWFgKn2b+nA3LW9ChAvVFCioKEADVsbVin5Qup1euMpSVBvifYgM5jJag5sXI=
Received: from BLAPR05CA0031.namprd05.prod.outlook.com (2603:10b6:208:335::12)
 by SAWPR10MB998084.namprd10.prod.outlook.com (2603:10b6:806:55f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:59:15 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::ae) by BLAPR05CA0031.outlook.office365.com
 (2603:10b6:208:335::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 04:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Tue, 4 Aug 2026 04:59:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 23:59:14 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 23:59:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 23:59:14 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6744xAlN3767830;
	Mon, 3 Aug 2026 23:59:11 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Dominik Haller <d.haller@phytec.de>
CC: <upstream@lists.phytec.de>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260716000827.84982-1-d.haller@phytec.de>
References: <20260716000827.84982-1-d.haller@phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan
Message-ID: <178581954939.886571.8511785951552300354.b4-ty@b4>
Date: Tue, 4 Aug 2026 10:29:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SAWPR10MB998084:EE_
X-MS-Office365-Filtering-Correlation-Id: dec07707-ea85-41ec-0a7f-08def1e521e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|13003099007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qkef8EpR02R3556K/5+J/kT/CCWwTMRQr4M+/O1vOrmk51hVNHJz7860xNr0GAPBxl4A1SdJGRY/v8LZUqkw25Uho3A1eh29J9Dvqt5Dn32Rrn7nZPq8k3p+WBA5KQkR0JGKqpIBCOqlQp8pAghIT4ufYgucSCncSVqQWNJsdQgRHYTfRmdo3mPM8+0gap3mO6KFwtr98lntvG9VBQKQWCvXJ7l/sgMsV5RtoJHJI4XVlNxSd3R+4sqb1IdWv/+pKO5I+bpbPf/81KtnmVRVkyXiYzq8qlmjTYwfo7JGx1DSRSVaMRRiFxaPVfwW5Nov63VR6zpGOHPZx1Iz4JizeM/zH9DFYCCRmaJ/yzP5SK2G5+Y4FdPY59h0S2qIzMQzyJNczN501yHoUxlckOcWTDx2zIQ5CedFaVKJUBol/YasAxC33XRL1/tm9xQIG/FlvxCpcw9jT8JOtSplZgVL2DCXZycea5T/wgs4cjB/sfBZLzx7zHr8rvkNj9WbjSguNOqnfpzbcHyXuZ7pS0IYNqZjbsOuY9CUBQjsiuzo6ft7hBSBn7ygL156o6fv74vKX8IbFLSLX32Wx4rZkM9nxx1zcU0BImE6Jd2hb3wSqMA6i8ON6y9o0ScbPwz4o1XpFpC86FAGgGbCtl7Wa6VafZkq1u00I1pNKGrGvZX4vZTLPu8EcF84L9/vvgrJc8EFmFD00x5ekExPQRmOBEScLQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WLfVIP5qIupX9zJncn+Fn2tbbOhiFS/EZfKrTSGHvurFopM4FFPX+1lI2XlXCghNMCFC1WWHMOeLc0La2EtQ6mQF4mMYqfLOD7JcB8oYILL5a5qJdZOAMTwNsvJzLMkVzov3V8sKIUSBY2f4Oxf9lYxeP7AXzLjDT8Yv3FeqMTRJ438mbOa4WdLci7ekm0EGKlJg88ZqenD0d/vAY2WHXN0dyVeDnyaspHCe0OYBWNVgGX4gGmbivYX/Er5135Lahf4ufVIZaJpiak3go3byVC2LvbM7HmQ46imyUbgIJCOqsK6WhcBwRSBnBQmYd7669RNk5IyzzDo8CRSGYP4+3n8UqHwjwheclPjG9JYCCTaG90EHVmLrPNLmocFeCvFtCGqi2fEmeFdbKkmGU/dyQZnmBr4TsC/Y46MvX4Y/AtnYQSEbZGunZqpadxSIf7DR
X-Exchange-RoutingPolicyChecked: sGAg5iWjXaVu54iDIWQBuDo1wus/AaV3EPPVATarx6USh614oMclO3GD5gnwpDvTdvsAzIO9SJvk2X7ckic34hSA1NO75J3ODyDCuDTFC/83U0suXLaaEDoQpbLaPLMU+BOuuOvsYMS1QJ+CxwsVy9jQajNgtaBZD4C7x3Z39XtRms5M58HRte+o5T0EuAyFlaaL2u5FKh7uWQj5o0Qf+7RVRTfWEwPKZAfcuU02z4XLD3FxdugWhO0plCq0AWJ+HnrUhmEhltywgaWEa/DvyyhbcXuiz5Gc4A71dP1P+3nh72jy9rtPkn0bQQOaC+OGlBTp9obt5zIJIX6zfEgMQA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:59:15.0772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec07707-ea85-41ec-0a7f-08def1e521e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB998084
X-Proofpoint-GUID: aFpJ4EcbxN1DFpaeA3dsl6-raPaS2MMp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzNiBTYWx0ZWRfX4Gxm2pXtrgWJ
 N/loe5td/q2jdpveB5qLtIBpOPBhqyJpmvTug2YpB968eA3lymWrlA+F1N5HZia+yjSphsbeLhc
 MNQ8OZJ+QCtS49woUdjfs3iQh8afrZI=
X-Authority-Analysis: v=2.4 cv=EpniaycA c=1 sm=1 tr=0 ts=6a7171a5 cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aFpJ4EcbxN1DFpaeA3dsl6-raPaS2MMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzNiBTYWx0ZWRfX6IJfYhztoQ72
 URcv0uIzSzledKdsbejGWhVlUx8MNZxdSi2g/bXzIcwbc9WhAiJnYZH5IzKAhrtmr3+3Hy0OAag
 Pba1leHTGsZa1iaippJyV8H+0nDFYaAvlW5xJ8nUEHTG/zDMJi9YcBtIGtqJnX43G1ktUvDvXBl
 wXcUj4tfIgHZHBoLzVeAG8IKW3x7WDn0Z3b14UGC6XfpvEmYuPR7YliWr3LOrtYU3S/wbTLAk5T
 KZ0dQhBl50TQvwUMMFQp3nB6X3g30aNnu/SVzy6L9Li5oMyidcJWrMnnnI+w+7Rxfb9/nnHTGnd
 pfqIwBUYJEEyDW79iXhBvD+WNU15WvDdR0sRzEQZxbXGPREqvX1lqRM+OMYvDEIxjJs+NsCxR3a
 CY0JtWwHILSw1XdFcEEatNCZvY/ICt9zm65YTfl5rA45Qgok8hD/f1yUDa//W6zL0uwxk2+XgPA
 Hj2P0bcD9ks8HVvTUQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_215933_110629_FC351BAA 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Dominik Haller,

On Wed, 15 Jul 2026 17:08:25 -0700, Dominik Haller wrote:
> arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan
      commit: 37bdaf74ae9ff339ace4c8b06e88fda9432edb5b

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



