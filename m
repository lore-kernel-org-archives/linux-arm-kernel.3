Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5751106FD98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1zD0Umc8gx5juhNkbMkTxJAH+XQuSkmuGynP//esYY=; b=kIcVKtJkymusfdmzMK9sxoTzii
	vLF30nklxc6kLIYMgenRI3Ia3xIrys3Qw9pEQIXbyQRvk+ovPBr/SlgfmZt69GEISlQcYK8SPn5+d
	4PdcHpXsD+326Te0RwrrSPTJuMt92A2hIBUGpVv4GGQsH/Ro1VcnzSIGk1AI9F5e066iUkT1lj2CN
	zv2UPkxZI/iK8z4AX8WyMYEV3aZMYSlyh61v21aHHWj/B3cCzUOOH5OsVeBZr+aAn/2guOmLHkH35
	inCZBNHCeZWWoneL+4D0ZGZ6XzWnWIxErRmwll2JMFe5W5FvhTY87dVL9rf0jxwRNfhJBs5d7UFIm
	6ZpkOfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xNh-0000000H91y-2nqh;
	Fri, 13 Mar 2026 07:56:25 +0000
Received: from mail-westcentralusazon11010062.outbound.protection.outlook.com ([40.93.198.62] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xNc-0000000H90e-2feu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5f4XCMZcdoCua7ZNQrJdzz75FtFLLaiIta6Zjb3hOSjOUOPXRrPEGBYgDh9LTu5pZUlxJY3+gZpjlXQnwRA1ZUng1a3SeqKy7yoFwLux0+miE7f6lYND6jBZ2QgowtzbhNdupS9LoMnsickqUriSnQEqfcM52QI22x1lkfMVySmNsa4zpZxNaMOT7TTcJCYZM8dwJwmrF/qhvEhzSG3TDsXwz/HgdSAeoBPld3EfZQNIqHg2p8Tai+3BbZ7VXI0zynxTVlgqzBTK2ntXTpobV5fbGNOE/aOCB3n6vNHcRvGr3KEtReO32MlFAxIwTHO0j2r9yo8wpKHBkv01LyhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1zD0Umc8gx5juhNkbMkTxJAH+XQuSkmuGynP//esYY=;
 b=eroUmHADCHL8Q3kjmlMJvKITS1NvWOZF3DudZoI9wUDGxthP7qOSxq65I7aRjB5XzsMOAEYr6EfAW41ykk3gkMLKJT5t50hijyOa5dPuyOpIQaii0DazrqkdwYWL4WwDe3HAJpLG3Owtyk113P8ZF0WwoK/hNYXQBMnAc8O7ef2WQQc/oaAhmmphwBhr5VgkHUa2xIOFjqD5VUjFyGTBYZsHDPLyV8ABAxi1QoueD1UKvx69gAWNeP+B4MImiNbwp4pA3QmS+tQbJngklO0Bqmfg7P5VPKzuo0c8Mn3U95rO3oaXUyns+W7jioNrK0UmeKx3+M3hGyL8hcdpfem6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1zD0Umc8gx5juhNkbMkTxJAH+XQuSkmuGynP//esYY=;
 b=J2eY4imYPqWqjzWxeptCiLzPOmbN2d70Q4VKrCokPEG2jE1fSl7FzuAdGMin+wF0l/lAIzn8x1PvQTIhrfi9W0skzKsAhEzlUUS7D2o73w2wf3yLYnKhOcydcqr5Y/USAtqeheEnbElLAf31uRa810UQ9P5nODcDB/A0mVrD7t0=
Received: from MW4PR03CA0346.namprd03.prod.outlook.com (2603:10b6:303:dc::21)
 by PH7PR10MB6457.namprd10.prod.outlook.com (2603:10b6:510:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 07:56:16 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::c6) by MW4PR03CA0346.outlook.office365.com
 (2603:10b6:303:dc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 07:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 07:56:14 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:56:02 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:56:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:56:02 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7tvFG3857268;
	Fri, 13 Mar 2026 02:55:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Kendall Willis <k-willis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <msp@baylibre.com>,
	<d-gole@ti.com>, <sebin.francis@ti.com>, <vishalm@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states
Date: Fri, 13 Mar 2026 13:25:51 +0530
Message-ID: <177338196937.240421.2671267752481289168.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212-am62d-can-wkup-dts-v1-1-d2de17e1f303@ti.com>
References: <20260212-am62d-can-wkup-dts-v1-1-d2de17e1f303@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|PH7PR10MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b527ab-64c9-4438-d4a1-08de80d5ffd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: NUqWATSBCL7DTEfkwMaohePWNmdtoPLRuvDnogfD2j5yUrh6SssFk8Lt6e7O0bTAc6/t9JG9ufa2Hs0/5Wr39VxKIPPj3ZoImBng2FO1mYEiJ4d2024wzWc+GOIwxlUE1z7WGYT/9cFpGHE2k3XTM5a5GEavuqu6RsYh6mDlvCIa9oWLvvAM07yo/RYUZUZ3H/HPXt71QVj8oefVySxsox6qOczAflGqlip8MBT79J4GAiwjdvaoHe6AJJ9Hct2BrYBL8BOpCslWIlyNESt3lZEIF1j+ETcSWodFjK9dIpVSuureiOXpGdiVFrjaZC6CTn4OeAzUWkZpDZ+Oj0g7tQnmnFIsvjPD0l9+IBF/yLMsKkQB/v1dAkYkTSbPEt/sjuectYaMYZs6/v/x9fQuEhXaiU/V7v5uUVjrfrOsIatHDC4LvOteR6g7x21Z6hrmLhac2srsq9sVsnK2ceE7Mg0OuExqqpY8xQ/C7hIRHxVfT9NXOUNDg3M1Nq3+5D1y0eJZv53dDuUUAt8Pkf9ikdc23PUPtcnBwxPrI8HlHMN0KG+e/uVMhOl1GcS47hHTzUfKHwjUKCwJfDJMtLGZ/2X/J1MfmUtDoiLw1rt2ja1bo3ebZrqWmLVC5mili9hrv7QThABJMiPGXrEYgcdvpBv+XTmlm7RcKVwj9xFiWFcYUPZ9eXIcvl1HSMg3+z+BHGkQ3EZDo4O/TnnCaxvt21lx7HVLMf/PwHd+skVht+g=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Yig/1cTHU5wkrlYpE4LGeK0MVSNjlFKYq/q3aqtkwcLaLmr3pcJMtoHEG8QFQiJr8G3znaKj5poshFvfqOPVjvF1O3F5iTv5vT0/MyKjaS8ML5nIof/E0hVlfRIIGQqYJ3t6GoEc4Xu4xoptJMhRrIfIcRyOi8HDTGXcb1isv4nYTUUtX4D6OuMqO8pXgbI2J4X2VYFgDJwG9IOkTWbny2u6sDmWqTBX+K6nOHY00g7vy+zTBaRbI7EaAEo9IC3QwxU74jm8jF4WMygKEMC2Vo7U1qNpl7R6zoJeDixg05yXVgs+jGJxBSD23uslcLJNOFO7wpIy/PtqCqmXySfPjO/8hgUj//3me8sXGEPHjtD2rt3mBjvHzSI1zPzAxOSVo3P2H04tLqJ4NgR7uznQrPzcEesqSZ+k+ytKexvS1VQVgl62V3kCg5a0UW9DEQwZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:56:14.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b527ab-64c9-4438-d4a1-08de80d5ffd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_005620_674298_3CBDD8D8 
X-CRM114-Status: GOOD (  13.82  )
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

Hi Kendall Willis,

On Thu, 12 Feb 2026 14:07:16 -0600, Kendall Willis wrote:
> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
> powered during Partial-IO and I/O Only + DDR and are capable of waking
> up the system in these states. Specify the states in which these units
> can do a wakeup on this board.
> 
> Note that the UARTs are not capable of wakeup in Partial-IO because of
> of a UART mux on the board not being powered during Partial-IO.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states
      commit: d170388d5c80d3812811b02fe0ce13a5f90796d0

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


