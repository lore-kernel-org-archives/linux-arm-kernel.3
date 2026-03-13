Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BB0106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFoKUOlCQy2NCjqZEuS3LyKHSGzP4OjdEcGAnqc9Gd4=; b=TCqHDCIV3IYTZLprGkWD5tQYcU
	V0T4d9cK/lnWlDY5prIvmnxs4pNVGrY63LgwSGtnnXJA/BmdtRCbnwsiLNQAs5yhcpsDZKQq/NC5h
	ALuxr0HxD3a5NqvA978ntPZu3Y32h7cMDdoXc9bYZ7liwmd6nsde2GUYH6MSFf+p9uj5U+AUbB9zS
	DA3yQX9OY+BHLG4NaXhICnTHUVaSISnVH9AxWZoAWfgJedSf0256Hrtbh0yzl74WCx3+/peCOrzdH
	eGTE7bI1OhDtPLH+i1ltzJl2G4mU5YNu7vQSHb+IF2ITAmqg93xmxsD3GrjiAJiXvBMb4vj9DYPwu
	LDqpBzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xCE-0000000H5ru-0b5j;
	Fri, 13 Mar 2026 07:44:34 +0000
Received: from mail-southcentralusazon11011064.outbound.protection.outlook.com ([40.93.194.64] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xCB-0000000H5qv-2O8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OY10bU3dKXer+yniaRyTCg8gsIh2UoOY9KoazV1kndZoTZZpeP9AKBR9es3AMD0P/23Sh+EkwM+drdMsqftDcIltBtPdAW/LEKt5Wv5VuzfKTpVvug7FYsxfsDX24DXFZq/oGZeZEjW6aEM5ArDSU0QVO1sTGPQloiPVrssLC4W0bzyqCNki9ZZ471ahUIKvNP6bxOCBwXThngmggxz2meJKA25gAPb8XGYKBS6N8fbG94tovysyXfw7qhSBiIF0ihdD4Cpg0ENOhyYAMaJvPWQ1GSps4w0wNMpvYcqKuW4PQ8ssowzwQFpZZZHsIMmzbmt770ULtB7ljscsVae0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFoKUOlCQy2NCjqZEuS3LyKHSGzP4OjdEcGAnqc9Gd4=;
 b=sOBVwcx4Qmupa7qPvjj25JJTLSKyLXWscI04AxO2sNKVA4J8ySQ18bJhgNtc/FGqFOLXpV+V/64cyW854apgYSxWFJOlz/Rb2j75tc5uGf0zEO76/p860KYSwoZL4jrjReULpqTh/HucrZDbPFLJglIB+4b9bBmDAardXzKVqqKOhZM8mrkoMbQC+2GrWJEnaA1it3KpW6uQkQpM1l9Oio90M0HvJCPSog6bw56uaQ4OWP2rEYEnw4ZW/nhnESlJWAT8OGOfsjLl8rI8T48nNLfsaM2F7a8Hk2IVXU6hc70ESaBbBkbrKnUDxz1YxS8+jWv30QfUmCksQQ7OsMhfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFoKUOlCQy2NCjqZEuS3LyKHSGzP4OjdEcGAnqc9Gd4=;
 b=N4aaWKe37qfjFf1E+nyx65Mq48eiXVo2pqFhvz/lm/pCd3Lee+Z/xhB8lfJVpObBJC110R/eWMinDK8drM4j+VHHDN737E2+EJCtJPOi84YOS3HleYZYYsHA3PMVHu8KbXDs2Ec/1Gn/4t45Uw2E2Qr46t8J1bo489KaTk/VLR0=
Received: from BY5PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:1d0::37)
 by SJ0PR10MB5597.namprd10.prod.outlook.com (2603:10b6:a03:3d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 07:44:27 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8d) by BY5PR04CA0027.outlook.office365.com
 (2603:10b6:a03:1d0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 07:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 07:44:25 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:44:08 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:44:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:44:08 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7i2NE157708;
	Fri, 13 Mar 2026 02:44:03 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole
	<d-gole@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Kendall Willis <k-willis@ti.com>,
	Sebin Francis <sebin.francis@ti.com>, Bryan Brattlof <bb@ti.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5] arm64: dts: ti: k3-am62l: support cpufreq scaling
Date: Fri, 13 Mar 2026 13:14:00 +0530
Message-ID: <177338196934.240421.13730987956184406764.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-am62l-cpufreq-v5-1-65c50af71681@ti.com>
References: <20260122-am62l-cpufreq-v5-1-65c50af71681@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SJ0PR10MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f0102d-df8b-4ed3-208d-08de80d459cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: f61VzYnzmqIMdOLMeb+FzOtVjCdi3y3deNQClqW7iXuHRy8jbbZkASCVikBpSBUkru8AjUaxb0e8QCMXQruEobdH03+TLlzRufcwnc+gYaLJPfkRieKgem+aSUpss7UQQVuWtaZ9PNggH+xvOPPl/5vlT6SJF34I9Fa5H+xTw0uJglgCjoikAmOdPV+/Ig/iS82SsxoagGwloGRQIgIFStvM8K/igGauPjPqWlG0MxE4wmEYohduhRRkV23usEIiGxVvEONb1zdl+SvdT7nAZN590TQafYB1amB2SHhP+7bPYiWOrX2Av/XoGW517acRwaRlVqx0w7tlYSYV18fG5JvBZpXV+UH6bpU5pZiVUE98Wr7tTAHl09ec0QTevhRhdKxDBISwIdkSukLq+qltCqO3C++J4yMDJk8fgkC/ltejdyCtyO7MALYVClttTE/nvJOrfgqwzMgS4HGjfbmrtlGN1JtGUCEeNDzwRp9jUXgy7S6fj5VUWAaPXAalOqWh/xEJz0JeocFU9PCOBiGg2incm/iSzUeBQFJcgWJOcqaEPZpSzndFZtxYAZTv+aZUc0T95gMQKQ4NEpapkH/PONIetRt6dmT3dezr5QtT+NyQzNQJTLDlqniG9lbjRUXAQZp1Qs1vvM4rvWvbdrk9Y7eTnwrKx0Hyv7q8HYFXepwS4W261wI7qx4zvFN0BANqpm7va8nUTGxlTCAMWhPsKWFQcycccsnCkfGLmflu6hQ=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YU6Ter7l6Xh2aKzhx+KLCs43Z86ExcgIgdFSnZnAYgtzC4nu5nOogNoG2YMYk+rlXds/9saHc+xnAARc1nyENrCoIAfB5P7UuqmCAM0u1qgn74SG8aIJPOUo+BA9+EJ+p2p5vUlptwI5KJJT//RPjgiT2yGR2fMEJcZt7HLmRdCVngs9IvTRghlpG7wPwuW+zHjBkiP43e24jY0LQliQrHj3BCe8kg285RxGPcnBVC5xBUKcKisTtfjAJIbSjlsqpRm1QV4FoC2QVQrBrRPC0ye3/jReD9eQcZI/etG9fUiJN3swPFL+mO4oLVuPyz9A6Mfn9wn55PzK0/6vU5Vy+C2RksHgwOMfBy8JsVWO5COwBw36RvXc163A/Fxhd7kS9ARtxaaofPaf7MUZCzNYJvc/IvuOFTH0iMakO7aDF4lDM4Gg4w8gBX9QE+O9Ev9P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:44:25.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f0102d-df8b-4ed3-208d-08de80d459cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5597
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004431_606517_AE439598 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Dhruva Gole,

On Thu, 22 Jan 2026 21:13:57 +0530, Dhruva Gole wrote:
> Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
> syscon for speed grade detection.
> Add the operating-points-v2 table with CPU frequency steps from 200MHz to
> 1.25GHz.
> Specify the CPU clocks to reference the SCMI clock controller for frequency
> scaling.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62l: support cpufreq scaling
      commit: b349c778a8f49cc85a585ab9bbe35d9d84c6383f

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


