Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084CB106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57BiHG8MwyWf9/nUGr5+8X8iktsqBU23TS1GSpdmGAY=; b=gNZF72xfx2QNhm+iZkx3cjqjWm
	gh7sMWweZ/Oqltsu56nYJGiD+78gCq74ZBHeO0A0+PLqe33x4IzXaP43IUo8FB1s/4SoA5KY/s18w
	0NjaTWLe5idy72CT+SAMUwuMqYiw0kASZF3EqSVZ2fuZG+IG51Elau9WTPDwIAB7Eso5/3uG4xq6J
	kaJGkWsDGmD5tijMpb94ZxIsMVJsW6+pLVKURPlnHQiBnvNH1byoEzr6mvKOGvmeYd0iGcCc15a15
	5h94hhdv2+EOs0hxk3jt/F7dXvWWuMVbGI9pe8/Rk6D0Ci5HEwdgzUlfbMzI3g20MfFBVTJ9tSu/+
	moCq+bPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x7Q-0000000H4yx-0cZI;
	Fri, 13 Mar 2026 07:39:36 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x7N-0000000H4y2-0fQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:39:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfIgWlmSTWZ6q9rfXzwD/0E8TV7tU+MycxRTr59HmRi1HxXa/9RDGi+4zEcnQ2LPKLW+Guxw96BE3idyn1d+8Kw2OCI72/cH8YEUDwrOI9f66yVE0vLISDjAmH54ymbcjtvtVdno2e7nxWvnjNqFS23JSK8dp+XjjOJxFj3WmJKoS3QBbB/9m9BLVV8c2OURTQsm1XzoczOX1P0Z4RmVbnFzqSRm95vI4VCUnL8XAzNU/5G37TmjGYfypifQa0fZI0GPDsZrkLVbpLfxSynjiVbcA1uNzrHZ5wt1yA5vEQBITcCxzIFncu48D8lKSW52amxNSDcqJE9t6VtGYQZS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57BiHG8MwyWf9/nUGr5+8X8iktsqBU23TS1GSpdmGAY=;
 b=TL8lgW2kyqUIU7slu3PI8eCOrYlH3c30FEHCj/n9+KLmdkqW1fX2DIRwUIS+M3S9nCu+TY4unwkpu1GL2pGnfD7MqXBwseJuQTy4fE334Jc7DWpI9X74dHOFzLZBxpbHBlsvbFJMv8jbno2Yf4tcBfxGhUWs3dW7dF9e/It/6/SvsNxcWG2QuDmf+IO8q5xevFuJggjCtHYnFsKcrN2wtDtBpmcQ58XUsrYK3bv/MYnRmSERLUMZLmY40ZOtltHt3hOrls3KHxLr7kd1gZQxoLm1xdR9H+hc0z/0vlpx9iXjvs1WnV8c6A3WlYhcVOHtRc4L+N4J6IFk15rd9aRgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57BiHG8MwyWf9/nUGr5+8X8iktsqBU23TS1GSpdmGAY=;
 b=n2I3QQa8WodR1Nz1Q8MboxG/i3nnvIW6qFFnMFZZiOoHLJmhlBl2vKsjqTDZ0YMrTU1QjZGT5ljkoVfPTNqpcBZH1HdHycLw63XnZ5PYTlRAQPtZxg2dJeEIkyrORJdhjPayRn0qr1JXpgAeNaebVi5HXq/UrQJmVrkx0/rO5GQ=
Received: from MN0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:52c::24)
 by DS0PR10MB7201.namprd10.prod.outlook.com (2603:10b6:8:f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.16; Fri, 13 Mar 2026 07:39:27 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::b7) by MN0PR05CA0027.outlook.office365.com
 (2603:10b6:208:52c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.15 via Frontend Transport; Fri,
 13 Mar 2026 07:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 07:39:27 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:39:25 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:38:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:38:52 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7clWX151650;
	Fri, 13 Mar 2026 02:38:48 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kamlesh@ti.com>, <t-pratham@ti.com>,
	<afd@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add RNG node
Date: Fri, 13 Mar 2026 13:08:45 +0530
Message-ID: <177338196941.240421.7108287389800858410.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309101650.1652240-1-s-tripathi1@ti.com>
References: <20260309101650.1652240-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DS0PR10MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: dbee6503-62cf-4790-ea44-08de80d3a7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: wFz30AX06GfkSkSATBueUZsNjmHP5Si6Mj/iDU07tcQWtzHNrGme8G6tW555m4M4Dyh7rmk12F5WrWXYYtLTqPAW0NFWnolU4RBw3JYsOVK3zefVyF0XFza5843Vj7q8xqDi4zCAQ4JfwWO/L3MBrTN05TA+AZpRNTkaR7+w/EF9VDN4cnriq9qzJZW5Jbu+DdBhckAU1g8LJAKzrEz+yucbOgxfZfWRgvmnuF4cMAlbpi0QX4tgzn+kAc7PbIz8AYP5lHunWUO2y0nzPasNzVtDRwMkFsjPh7GftRyMSC2RaeWHhRf9dk58U3HijstsrtgjzizpO++MC7W9mahBF3eA43X8bDZz6+8AJTpG+bqR0c3yDzeQg6R+bA/cnk3av++M2AdTL72LaQ7JGhjxmi1EWvZKYRdyzvV5qbE7kxu+RPof+HK5hwLXjphrq3ItNbv/iMS8CzgPAiRaAn4Y3t2R+kRhmxosRpMoqZCNtqfeFzBNvC0ke5htCZ7T99lxgzlQ3oHAv3oZjhKdiDVLIqorXBLTJ5w9oJMi5x9w57Udv9OC1xGzTRoH1s3hrLuSk/y5M8vzri0NJi7ODAsnubSkzbIQRpwSWMsrQPoQVavqKoEuZ+aS3OCL4t8TsXGnzJWZ5skE0KzEeMWXqYy/uZMa8aTc1mgRcUevONxAsDNCeZEm9J1V73qzE/9l6CG2ZVCF4Fi/Dg+XaQ2NO0bY21JMBU4zYOV/AD+7ufM62cQ=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8nz36H+sT73eaMH5QlyFFFTVcKqYgpE9/W1F+HGaeTKuG6sSWQGoSKB8uGzuQx75SmGKONaTjNaYsoVo8hC7yMOAy0iQA72TFx3ZxE74FdZB4FTA13uUlF7jJMm0fEsIU+rxXTEfYP0KekfVxb/1pqfAlB5ajjVqcD5ss8s+eJ/EE6qMcSuQyGrOMlQw0l11laqpLn4CIRqodIFyn6rEH7cTaFGRsggZUjwltuZTvNhVALqhz4Rmd3bqYEK++xXKkInC4jHzAc+waNY09ci80tT9rYr5KkSnwxYab72gaiP4gktQiqoXma3JjDqptC0OraN6ghgMx9TUERLDrtyiR+e/jxhkVHVr3dmYK5Fqp7yt6kfWtRsXRsudYTlO1GO8bD8goqbTP8B7g9ceQDlv4w4tybT6mlTdftfLf9KH4P3WKD9y810J1rWYb2xowY2o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:39:27.4821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee6503-62cf-4790-ea44-08de80d3a7dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_003933_307268_79CEF97F 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Shiva Tripathi,

On Mon, 09 Mar 2026 15:46:50 +0530, Shiva Tripathi wrote:
> Add EIP76 Random Number Generator (RNG) node for AM62L SoC. Unlike
> other k3 platforms, AM62L RNG is integrated outside crypto subsystem
> at address 0x3b100000, requiring an additional entry in cbass_main
> memory map.
> 
> Mark the RNG node with status "reserved" as it is intended for use by
> OP-TEE for secure random number generation. If required, this hardware
> can also be used through Linux kernel by enabling this node.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62l: Add RNG node
      commit: c9c61275fd270c09e1dfe82794f90ad10604fd5d

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


