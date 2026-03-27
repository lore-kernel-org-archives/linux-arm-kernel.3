Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B39510BA426
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dze+SZHw1IEW2937BsFiBEMrCqLtcAaxCo7P381NvYE=; b=JWCtFSQlkUI2WffOjl5Xg9K4dN
	7VodPJBjYKl10X3gXmdoADp0Eey7vUThNyw6fOefSZox05jVNp+Affx27rZVt5T17qgJRS51BPYf/
	nG2dfeVWxiM3TsiniQPiSCjPQb+zLdqPzt6WmmSODe/nlB8Hnd67jrcuuyrJDQPp+uY+7h37jZBkp
	3ss4Q1Rv+90ahV5CpFQlKdchZxc+tdf3MgMN4komeKYSf4jvrj5awPzAd0lUg8sBso0wCIBzakhw6
	+f0KybwIbbf1H+kMpA1Ts6zoKJWpaOTlUdkL3bOVdQwYS9U1lHwEJxyMWLE4rztXg57jWcH38ZKTz
	YoqhRmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zFn-00000006gXg-3otZ;
	Fri, 27 Mar 2026 04:57:03 +0000
Received: from mail-westus2azon11012044.outbound.protection.outlook.com ([52.101.48.44] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zFk-00000006gXH-2Sdm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV7+yTOq6B7cy5tRT6im921m9pOXxGT07o40O9nwaH5shej3x3nh2vDIIGG+xCtfIDIkAcUmwSBxxbxKc96gLWXxERUtrxY9+gsR04WYl0vH3/0wG7WYNEuOOE3HQWG7iQ/sHZ2kILW1ce6Hcr5oDxNsQnGW/tEqgd/ywoF3O+zDjwijZSjJ1+nM1T0qK9Nf0nY6VdV3b+wGju4i4JyZ1GvF5VgZW7OkgduXEkQ8lvd4xWJFlihg+t73ul1KqoWyZuXcUuoRlfBmMiBy3qU3WLK6m7klXkQRpNTH7GAobURaiytvaVupWcanRZCCjpKvNNokAAv1PfX98Hm+tFoVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dze+SZHw1IEW2937BsFiBEMrCqLtcAaxCo7P381NvYE=;
 b=Df78mObXMRLPivhv+49W+2noKkKO2XNqx56skQzTWd7plPkH3czxaxY+3KHsxzt+NCojmEoLLn3D5/SQc9+ZPaGhFbz+dicQgLyCk3f1J3FwTk0KbZ1qu0gc6Z5aJyyzQbrR+TXkVfL2v/JiXbNsZHCV2Kt8ukqA/DARfrtZoYYtVza8KoqdxPsni5l5ymaj26ZZuxI4Yw9nWsuPM/RHLaMNDgl9ew7JUiqoIiWlWo47/S4W+nZhwSwdmND5hA69z7/t1nfwLWWwZzxC0WFkga4ABI2NQ86EGmn5rNlBtXDHQdO2btfWvPXZ4brn6VXSVVtbMk8iWkB0L3bs6LBCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dze+SZHw1IEW2937BsFiBEMrCqLtcAaxCo7P381NvYE=;
 b=o2DBPSH3ZvRml1ed1H9AYAfoxJA/Dosg3/YhWaJRIsenD71YnnZ0G2d7CD6oUOuriyxiJa9m/pjcr6nz2KOrLiD01lBsvVcuFHmq4TCmO8aTfIHeKFWTl+zVayJiJdyrykAcaQ9OwS/kFMi7iQchvbe/DUjf6wSgHmCsmPDvSFY=
Received: from PH2PEPF0000384E.namprd17.prod.outlook.com (2603:10b6:518:1::6f)
 by PH0PR10MB997594.namprd10.prod.outlook.com (2603:10b6:510:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 04:56:57 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2a01:111:f403:f90e::4) by PH2PEPF0000384E.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 04:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:56:56 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:56:55 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:56:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:56:55 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4upa33366227;
	Thu, 26 Mar 2026 23:56:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 0/3] Fix MMC pin pull configurations
Date: Fri, 27 Mar 2026 10:26:49 +0530
Message-ID: <177458739857.548140.6108699608079488240.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260223233731.2690472-1-jm@ti.com>
References: <20260223233731.2690472-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|PH0PR10MB997594:EE_
X-MS-Office365-Filtering-Correlation-Id: fd805c43-b440-43a1-c019-08de8bbd45a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: AFsJPgeyEiY7XeU8Hz4sVt+waOm7UY9qXc0eRXjNZDhK/uJgxWOdXUYiEnNiUrSbiu5zly3pqE6zLO+L5MbLdvBuOIkRbPZFr/ohdY+v/yl2WbPGWJPecAsxSDMd96PPzEdgaIjwADj/vOmOKjZgAeW3WsAaZzsNbNHJzj65c98xjnSN62tHcir7WZt4/xLoY7uABm6VTyLChymIzR+dxupiwJBSUxMxnebANpvlf+hiUarr70YSw+grFmguLaqAZ5eYdPxmoNB461No4iHD32Vz+DrXymjLAjUiVQgclbLCrNPswWKaoFSKFBf96dWRkRHzBZxoDDYcbEM9UNJeqKJyNJmCKXocEvzb9ynSU4dXDlGVGREam3eheq25pufxgrnahjUbRSkpxQPuIrgUxOXk2rvgM+hlS+vh47nLy2mZZNnQx/5fV0F56QL5Ez9ISgqwkprCuLxNKivGtX/tI3e22JsQXUUXG4ie6WjVHJbCA1/+zoerZX0DmjuWP53UNaijA0Jo7UVs8zO2HqVoimEjoRqFOql22bQngxvpS0rZ0U1MlWEMf8hV7LPL2tnSufy2UaDisjVAOgHOxo8Y2aZTWZ1WTwP6QS757FkIWH5CeVeT9Gv7/79I3e2ZyeE3mt4tu1TDrld+WPOFpqbb3Wnk48YFZmXfBEqfK2UU9CyDwrV4Oj87A0l7M86cOsekAzcwvuLeUTrlrh1AWFne03mXD6eBocelG6FAnbpEryxYOeg6Y1JJ/zub4M+R0RG0wJ3tHgUhKnssZMiXGHO/BA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2J4t/yO8oESnkDmxY8YLINO7tXQx3ACJrNSvx3sX3kibFjPJi/ule9c3OsKFT26gs7q0fWA5QYqLrrxB1FdJfbjnV2PlP3FbwcIT0Tq59OVXyw6JNr78KF5lLSQO+D8sPtp77DJA0hnE5lnVg+WNHYcUPJUGKPkkYMLY1ZOKki9mceMcoRYney3TcP4ilf5vbm5I30sPIywNn3qNp8cgqo8WHZfkfnXFl3YvySUfHWLOc5qvCHOBAKHdFFbjoIRTKG+L2Z9K1/P+ARvdPBdrwhsBPUPiGknbg1R/HUlAEl0rmOc1Gye/3+T7R2WuanUKYqMHanuafUZ/wrLgO1+bJYCayEc1U8nE1iLcjmOUvXc480E/fWgD028y4/YZyBNsVihlxsj8x2XpEyjGlOlAZgKq7OmExi2JqaR7s//IwJwGhSweyVheCUdMC6CfpZ0h
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:56:56.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd805c43-b440-43a1-c019-08de8bbd45a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_215700_627801_D88CC603 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Judith Mendez,

On Mon, 23 Feb 2026 17:37:28 -0600, Judith Mendez wrote:
> This series corrects MMC pin pull-up/pull-down configurations across
> TI AM62L EVM, AM62P SK, & AM62 LP SK boards to properly match their
> hardware design.
> 
> Most boards have external pull-ups on MMC pins, but DT configuration
> was also enabling internal pulls. Having both internal and external
> pulls active causes several issues:
> - Unnecessary power consumption due to stronger pull resistance
> - Floating pins violating SPEC recommendations
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data pins
      commit: 6d4441be969bea89bb9702781f5dfb3a8f2a02a4
[2/3] arm64: dts: ti: k3-am62l-evm: Disable MMC1 internal pulls on data pins
      commit: 02532ba56362907b6aca3e8289c4a9247ef83325
[3/3] arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data pins
      commit: ee2a9d9c9e6c9643fb7e45febcaedfbc038e483a

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


