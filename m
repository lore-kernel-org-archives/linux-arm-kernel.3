Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD2CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 05:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrVPfIjZtdKKQ6X1OAT/VyFAr6iHgDYFmsm09Jfkaek=; b=wt8F0Zy7gfvUDG0oVV4TFo5PVX
	Y727lBZM79RQTRmErI6dzwKfvzJiLbD9AzlRY7UUcQhu/5ThvClYOJnSgUn1lxPV5UqzLkh7ognpy
	7ukKSE6S6ljfFhBUifqz0hwFTtNLA0C4srJ0kkLgRC3r5jhFPt/fTPUZuwl2w6MWFFUBFDaRZhz4I
	3JJi689i7CQqCjkLGXZQzi56juVlGPs0pEq9nEl8EPNjpPBqDt1+rp+6WVxMDf4svdCm4+wsE+XTl
	qaWXu+T/0kOL/u6jcL5ipSPgmtar7pGxfDzJtOH7ThOYodypO/yoLrTnqHelz2JRvrPZynxK1KYgJ
	4C+xhELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7zM-0000000F9vd-12UW;
	Tue, 05 May 2026 05:06:32 +0000
Received: from mail-westus2azon11010056.outbound.protection.outlook.com ([52.101.46.56] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7zK-0000000F9vA-0Mwu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 05:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM1EWUGtszzFqTc+/1ooP+UxMmcGsW+oWULyGGscX6PU8MrNsUp8+/baJqebCkcO6eqNqSSZ986PdHCCYyFW7w7B7ul1yRWqCi8XLmgliqn5A5mm1YuLEkCymizA9wj63QKgb/HbfdmbxLIV/ZMhS3lRWxeXXIBWFDaKcx47sgHw1kYf4Q4yPL7Fck232Vfnun8UNvw99fbia6EBeBs5Qg+XUeHSCfRXHaZbZ6NSPswdO+juDmcUNwQcB4QPlK/5X6ARNBe9/bUqxTRmkgIC/CTrwmDlkofK40ZbCQNUHaQnnwxcs5WCjFbQfab0W5F7OPDWMLO4nU6h7T6RZbvwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrVPfIjZtdKKQ6X1OAT/VyFAr6iHgDYFmsm09Jfkaek=;
 b=fnljYKb8C0iO6Q1pUYofs+ajfCad9+69pA2M/VmSK/5COqwWU9xjvDq8i8OQMOT8H5AIv31yB4TnKfYGECMOW+XdoM+YrdaPbfDhoHrq8FCwlN+KG6Ax/DHAg1AGMjsqQ7VjmfMA420xAHCnuYjhjj9noekygVajkF28t3ZJeo0GZ/A8N53yYmT0p6HPmgDAZaMLusHu5q75DyF7uISSiooxaV4z/r3s8c8XBILRcMwFT8jzMDkJi9BNXD8S81n07n8cUc8s/bxHh9PzAcpSmtM+q35rqsXdHSCnqKT1vLm4uPUp6xyUX+oOaSZ/btTiRMYIYNLcDGn5S+fcJjOBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrVPfIjZtdKKQ6X1OAT/VyFAr6iHgDYFmsm09Jfkaek=;
 b=Cu/BSIui84LkzN2Jq+Zvv5QbQjzWWIaBvICfwc6CPbe5p8ouxoRhVspdcpf+giLZnZl4E38FfBHxTlgR9qfNpjIwKITkxQO/yF+4b4qHi2RVBf5FILnTya0Cj/YCE64HYEKD/9qf2E6lLZHK7Us4c7Qie5KwbmMZlgT34fiFMKsK8BDMf+Zwj53JYnEtZh41nqY3Grm1x+qbP0p3RlZ//fylakZuT213f9GXfwaStHJp8M92bmf4HNqfr2+pYu5dHeuvr/MMaxSnUSIfP18N4f53ReR1QRlegCVR8d6EEaHS0KuHwYiPAdMNd6KGjZ/EcI5y4Y949L7ASvl2/Xp+bA==
Received: from SJ0PR05CA0131.namprd05.prod.outlook.com (2603:10b6:a03:33d::16)
 by BN7PPF9507C739C.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 5 May
 2026 05:06:22 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::c) by SJ0PR05CA0131.outlook.office365.com
 (2603:10b6:a03:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Tue,
 5 May 2026 05:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 05:06:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 22:05:59 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 22:05:56 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Andrew Lunn
	<andrew@lunn.ch>, Marc Olberding <molberding@nvidia.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
Subject: [PATCH 0/1] aspeed: msx4: enable BMC networking via MAC0
Date: Tue, 5 May 2026 14:05:40 +0900
Message-ID: <20260505050541.3031447-1-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|BN7PPF9507C739C:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e95129-7c31-47e7-7a4a-08deaa640d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BDecSk97sdlBJpyFUTNkJrBUWYyttiQZG6zk46PlkAYwZXInJnrlqBHORH3B/f4JL8vGBHQMa/T0n5eKZp0XZTQCQdWr+2Wda6k+BfpOLXdgNiiNOuIrsDa1nSd+WpBWl96Vm4wZuB8X43J2nlrUX43joej7LUAo3dACBK09yU3DeC6Xb5UZ8Y212uwH6U8oLUavXBuhlcRX/RtPebRkQudmG4BfmkttWxCGmwjbSySL3z6LC90WocRO0XH1hLOFVacGqFsu0JblzdVhCWZSe98Ywm29Bool1WnO6hbtjH8neTxecHPkAMU9frTuRM/gljX/I+qWc4ZPTMUIK+dWej3jIHquUMsh3Rb8IHh+4nCZC3Ih4zZzT/OK3t8RZQkoNQnYZHQQ8uWGUmiooQ8j5yw4uVDQoyVqhogzzGVX/SYJB0XwKJ63LI4Gje6ODAZg9AK7D2Rrze8pqJUwtheYA/4E+/M1i9BtgOf5yDvEP2GT11yLubTGGv6zAMMY9BF430U7FoMJi4eqw+Fz8JF19uZD3Cavn5qCN6cFbotdpLLnzFE1hbZeUtLPIZwhtzXznpLElWYBJYWJTgcaBFtrtW4wqNbcX6VeHvDwv3ZedUYS4trPrxZNVl4ssPHobjgqMOCVR1HF1B+JajW+2AzIDpK82v38Sl4Gqcf/4pqCRiZUmj1Ro57QP3MOuF3JplF70na9DhForN6oP5hic29CqJEQnVPb9MdCgB9BDRtif7FTY/bNVaIo8nVujjQDiF2V
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PCQD4zv8s5dHDwGiGRL3y6oV9yK9F/VDdTPU4HA+zoJDxLc9i7668e7SXLOdwfqtiHTV82VAxIk06cfJUxT5hUDdaMWVNzHlfDIKPSUI0jxvo7ucCXdJhqAMXuaqbFTtmDjFj7wZhktvIEbsodIKw4fJjzXsb7X3QzIkedNXqTrNhIAjMkRHlFPAxOvyErFsweQLSZHWAgP4f9R/2hwMw1rmVlTrmJzBzEk7rFThJyuP4oVnfDiT/CSnts9CK4vWoajUFdt5UZpTeTaMjrZxeGGSkNQvLQJ1fnu2ipyAE/gXCngt3fMFHvbBaI5eTbgqmlxpoZmhPq5VjXT5SO3bEyjmDdj2kRIeRZt4GeBFuu7avhqSmExDyQgmZfE12h3mqfviuEXJs57smF6TAZ3e8RO7Lp/iVURHCiAyM5DsdbehQgiuU2d76IlJe6tC9uFz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:06:22.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e95129-7c31-47e7-7a4a-08deaa640d09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9507C739C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_220630_141575_C9A76020 
X-CRM114-Status: UNSURE (   7.32  )
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

Add the &mac0/&mdio3/ethphy3 nodes to the NVIDIA MSX4 board dts to
enable BMC networking. These nodes were intentionally omitted in
commit f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM") at
Andrew Lunn's request, pending RGMII delay handling clarification.

Following his guidance on linux-aspeed [1], the U-Boot bootloader
has been modified to stop enabling MAC clock delays on the SoC
side. With phy-mode = "rgmii-id", the PHY now adds the required
~2ns delay without any double-delay from the MAC controller.

Tested on alon8 hardware: 1G link negotiation succeeds with this
change in coordination with the U-Boot patch [2].

[1] https://patch.msgid.link/eac09481-0ba1-4ac2-ad8c-d859822ff0d5@lunn.ch
[2] https://patch.msgid.link/20260504044702.2613879-1-andhsieh@nvidia.com

Ender Hsieh (1):
  ARM: dts: aspeed: msx4: enable BMC networking via MAC0

 .../dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.34.1


