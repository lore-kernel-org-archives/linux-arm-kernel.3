Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C302BF3D5FB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5V8Fge6G1jsOJydofhp2xU2JkrCNfBZx0DNisaO4BQ=; b=a4BeX4qb325SGD81SKpnDAzfqb
	LwXGePFKW+BtDjXS1pMLAAK0KlVU3MMEDi7h0wQn+RQtc/NEy+5tmt3XIMc4P0RBLDxI85TUTVyQE
	lLIAWJ5GLf5lOtwkIMarzpf4vl7uYgj20/0lqW5JRZA0IDFD7ty+Sv1kPK8Kp/JQG5O6g8v43HEYA
	pjpOE49w/vwoMtRk4J7H/FMoD3UmNs4kzql5iY0vWvSIXmlzr894gBQvAfK5uItc6obwfX2XXNwEA
	jhlOOgXKQDI9fyl+1cUlo+wtpIwq9zzmDpPVhNzvE3/FjibYxnIT0/O25UJ4kyCu0AU2559gNwNNi
	P4iEtWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rPT-0000000A1lR-0Iwq;
	Sun, 29 Mar 2026 14:46:39 +0000
Received: from mail-eastus2azon11011061.outbound.protection.outlook.com ([52.101.57.61] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rPQ-0000000A1l6-3pWS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 14:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b67zMSaSuIGa/2oOAzbJwq1WBAvnGoP04b1gbnGpQCmbDleaf47fjzkw3ybHtKaAJobUiXRvhvMwEWnNHH9QQ8Y71plHSV8vmIW1/8efjS/Zpwta0pNMWZIQ07/ko+Qha/C5Btz54St5VUf8k9360Mi6gTG/iBjlVulkT/70CrIWsk6PXOt+4tty8tftDCL2mmWLrHTS0Z3EvtOb6oJ9pwn7t64erW0Z701bX7moUFVLNE6HUMYIzhuM298n+tIA5Bb/6MSBvOwOxxcqDVktNKFoWS5DnrH83IFv2kvEn48WZAVssqRxg4OO7VYqv5ouL9GCKAhev0ARzCOoS0bbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5V8Fge6G1jsOJydofhp2xU2JkrCNfBZx0DNisaO4BQ=;
 b=Y1vzl5/wuuL6tBuF3Q7ooonCmISO9JAWIDt5itRyZ0GeV0X/wXDpngrsBs/2CgfClFUM5f7yX7uqhspRTBnr/dGxiWemkgFjuMNn8RydYAQEhIdID8SADLQpoHjLEnlFgJT46PNXgpqMKxJHRnARQnVNxI+GSXgNajYw5l2FeaBX+2NToR7o/AkXUr3gWsxp4klQVIK7jmzkIH/nq+HcC/z2OmkhM1CHZabOzOoHZo8Ab3U0F6lJxN3qAu+YjGuH1wpLeZKvQTYiIp6O/MvvNlelTDILINDZOV4u1WwsUi+H1Gk4ogEWkfye59Bo6Sg07J890xB7uCFb69UkZHQkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5V8Fge6G1jsOJydofhp2xU2JkrCNfBZx0DNisaO4BQ=;
 b=uiHzzZptoXojahkFwUY4HEhp/lmzucwjc65jGMdEWCO9pqQQz7Dkpbz1fKpuAdoAeLHsRu3n+hVhOf0CEq84H5yQY3Drwmug6uEpUewt4e0drVXuRu3YLloQnzwyd8FNmpG6DflOIzWLE5+EaSrGLovPGDu26t34LT4UrauatZk=
Received: from SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::6)
 by DS0PR10MB7318.namprd10.prod.outlook.com (2603:10b6:8:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 14:46:30 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::e0) by SJ0P220CA0030.outlook.office365.com
 (2603:10b6:a03:41b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.24 via Frontend Transport; Sun,
 29 Mar 2026 14:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Sun, 29 Mar 2026 14:46:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:46:30 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:46:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 29 Mar 2026 09:46:29 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62TEkQuZ2791745;
	Sun, 29 Mar 2026 09:46:27 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
Subject: Re: [PATCH v1 0/7] arm64: dts: ti: verdin-am62[p]: Add Zinnia
Message-ID: <177479557032.2176431.6725760152464953557.b4-ty@b4>
Date: Sun, 29 Mar 2026 20:16:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=TtYFD2xrx1y4DtCZuSamNCR6/ZkQbio1sVtX+aO0R9I=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsyT1k7Sc15JHlnPxByy792llg3btnbt4oy+d+zihETJb
 /vcl/8p6ChlYRDjYJAVU2QJYNs1yyrF4nFEReJWmDmsTCBDGLg4BWAiop4M/8ss1JiCOH7l5As1
 dgXt8Km2sFhrPffWDcNnN3Us5/2MZmP4H7bqVuuDSWWNPPv3/JaPtLh+Ki/pwnbh/wXxK9jZ7Nq
 C2AA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DS0PR10MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 178b68ea-2728-4fdc-78f2-08de8da1f706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZcmR2tES2W3lKxDTGzyMHj5VSwQ4Mjk4IobiT7kmg/Qgj4ymONN+AB3o4XW6zwYetAPlurAkbl8oaC+Ut5CtDsP4jTPS63BNcZMvlpHr/Ge9nlcyA2rlI+U1xr2AYrBywFYqxsYEhxapuv03ZAUvH64TomR4DX2x3ZLcm+XyIhTuQhDV0t81kSCC3NFKrOctTjENaN70qug0AENlg6ZiFg9xjsrc3V6pmpV+6uH7fzGp1TBbgtwngVma9tTw0pDz1SLDMRQqNS4ex4r0HCG8L8qBtE/z8BrY0WaJheU59Ukqizka7ybC7qwegB/1ZVfL8LDZq0MIYGxhWlYqfCaL0vrkiDJ64tcDh5i/s83ofyVb+BEYj9YrVuXKceNSusRpDA6DQpbbZ/2U+CX+Pd9NeDx/p0AWf/5ztdnTdhuYumPMFtGGuEiAZ2ye96O+ARp09PuDpkItB4pXUrQl56Kgg7qtxvLqOYiyOI9cRJzGo5XG9XyuUdkY6S12i4FQs2DbIfgruZcpgnEyzFikO9nsF8STcDRmVWUMcfn+twqwOJuFUfVvUX0KcmvSe4UDEjGI90e+XMwxMuKzmcHO0vqZ/N9RYYfQZt9BRCdePgKxcF7uO/+93GKjXvily3Ej2jCKtDZfsj/QGF0gRiVttfzSv3AbnsYxSnyUsewuYEcdWL/2sIItNl7JxetdbJQDugZ5c0Aexh55kFu72mi4t4UHCq++Sq5hLmfMXouDpWDjHfU=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hcc3HJ+Qa3PbNxM/3BYFGAc3bHGP/JRYoyH+jEu9dUMw7qT6QxDHnO39oBTzFxqMfudKE9SkxdaR6uQ91McFaXExXXBfpBXwzh3+4f1W2OKVpJ5XQKtB5KOg8bDz4s1UnX/R/sm8OGAFzdZol7J4KSj/0esh6t04VhGgNuCUMWjBSSGGWtNHnNiFHC9Xn3l0K72b6RmEkrLpCGW8cLMAsLTyt5L3q6Y7JwWzK/1sEfqNrb//qA04F88D6nlr9R8k7DZW9cjhvuWF00ZpSHg2ms6AJLFeqwooeLuUQjQWRCTACCC+8vgTE9I6dxfDcXqdmOv45ZIwQHOIAa1I5nHF/7v8OIIPsizkoZQ/H1GCz5XUMcGpBJxV/R2u3tcLP0pD5Nu2XlpRABHgrOSyNP5kUUYqsQmaoItRJyYrNOU2yDt8UeKfwmcgsZQBj+uDv6ip
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 14:46:30.5508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178b68ea-2728-4fdc-78f2-08de8da1f706
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_074636_958204_A821552B 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Francesco Dolcini,

On Tue, 24 Mar 2026 10:36:55 +0100, Francesco Dolcini wrote:
> arm64: dts: ti: verdin-am62[p]: Add Zinnia
> 
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Zinnia Carrier Board mated with Verdin AM62 and Verdin AM62P.
> 
> It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
> 2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
> for a modem, USB and SD card interfaces.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/7] dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
      commit: bae382fc0c9555d21bc125a0310c2b0895489f87
[2/7] arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
      commit: 5a8f6fa5131357c7326ca1956644a588d5b492f7
[3/7] arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
      commit: 0e390541a3ae62e713708ddb263982b6ba0a49e7
[4/7] arm64: dts: ti: k3-am62-verdin: Add Zinnia
      commit: 72f86c677905c752418861c2ca122d903d457514
[5/7] arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
      commit: 16dfb22d7f6fee84386f0f298ccb968545b8943b
[6/7] arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
      commit: ad8cdc8b98e2b8de82fa19c7f67a42a59ef8936b
[7/7] arm64: dts: ti: k3-am62p-verdin: Add Zinnia
      commit: bbe7a708f753cc7009c1af08dca7357e7a43e157

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



