Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B5ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNuYLe2xhnryTOJStniaJ/BdYj6YhTSCOwTct5r4Dgs=; b=ilDn04/K8iLwd4jnoJjniUMpJS
	MJpOvotEG1cSEubruxV4kLcQRsdh2RBN1SQH9AZOY+Z4mH4T9HPRp1r7AjJdlyswc0LsCAPBhLC5Z
	k4/GSl7L80feXqOCxf8lXLyTWZNObNa2z7OlEROsJgSr9yK/01Q3dD362J0pyJ3GBxaTHzBES3UDY
	V113ckz5A/Ztr2/DlmTvsJzTU8zL/GhTwYRx/aIF+RHdMjJwtJe2/QT7B8dxiP1Fs78DFYz8ywsbC
	rwaKY/5/rA/OmCSG644R4ed4Ydo/+AkHCRrz7Xswm2EgsUTgTg10DJM4pQQtyFvMqyJfDtJKzpv9b
	o6xqhk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyJM-0000000G4j0-2zQU;
	Thu, 04 Jun 2026 03:00:00 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyJK-0000000G4i6-40SC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6v+1j9SCybp9J3k8YceyGljRd13c+B3RJFifB9mVIFbz2nCbfRKkPR0CijePxGto8gbrWj9m6hYBoHEt7oqXU7lbuq+/Mp/kO8jVcwK4C9TTmk2/qdFyD90LlJMgB0ra79AKuLEJc30h8GlTrJ9vNNGFW9h/4DUdlbcnmhX9lNRZJhTJe8VxDa65nnditP7EvefTb1fnIsY30n+wE8+UcetooFnzRJ0Tg2pzUDlJPURjzwrw8KoJHUTD8gIgwvAtN3pjDbyYfkGiDQJo271UJJoWRcvxO6osCiOj8LLY5kMap0gbiFmaKz3w974z0QTJXb5rGNcCY5yKcDRKSlerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNuYLe2xhnryTOJStniaJ/BdYj6YhTSCOwTct5r4Dgs=;
 b=EG4tWNhvOFzMlNI9SmS97Cg4YRFecrPd3ZusXONc0o3O98r1TVjqDDLPzqnSpS58eaaSEyUHxyWmWYfMiI9j/k6rotsh2TkQDPwDIouMrl/pmTHMWrUqHgKlWKmPf1mOW6PRot9a9xgg6M4KWMsr5miqEUl+O8dhS0Ei8EC85O/FK/Pd3yx0QSeWwp018CK5/9l0UuYwLbzXcI5oOTGL+EAyH/b68XjeNunx4rES9E1Yb30ojXNue4CP3/s4L8RaoSi/uqSrmbWAM5Se4jXNABGSMnS1Fy3tjBxbXJuDDh2JkaQn0MW5AYq98hGDFjQmNHuKB7Omu+WrMtQsIi4x2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNuYLe2xhnryTOJStniaJ/BdYj6YhTSCOwTct5r4Dgs=;
 b=iPZji8L7puOaY18Lh/FHTZI3+OwLFV+czZdIyh+MRVEhnSHFg3AWwhnq45Ym6jgM4387oUGfDw5Ns5bTIxL8bzZQdzm96qDDoJa1AsX+gX1Q/F7KgrXlMkVbcOF7w/QkTnJlyddDOuDSdrFojkYR2zlMFLh35+pgdBB2t/7xdE0=
Received: from BN9PR03CA0555.namprd03.prod.outlook.com (2603:10b6:408:138::20)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:59:54 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::35) by BN9PR03CA0555.outlook.office365.com
 (2603:10b6:408:138::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Thu, 4
 Jun 2026 02:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Thu, 4 Jun 2026 02:59:52 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 21:59:31 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6542xVI42511473;
	Wed, 3 Jun 2026 21:59:31 -0500
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, <a-christidis@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael Walle
	<mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Date: Wed, 3 Jun 2026 21:59:30 -0500
Message-ID: <178054194985.3283937.10940582422296013848.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c35577f-a275-4308-e867-08dec1e559b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GC5uongJ6rxLF9AEGkcFZTCqMSFFrqBGkD9xSOMHLVmzvYpxTtK/5iUme0OuH0KyDHd4BNvwBZ5wOScFcXIAgXahkd5f5Zsc3bzAEZZPzZVgILpJl/EWx1RKU9kK6xMaTuyPf8YHOGDlrbenYJt2eis7Gj9rL4Ba+0PlZFEbX9KzdIc1bUyjkrTKMSc9WN/gC3OICdVRq3OHpIM8sUqijN1eyA7/LhIGE/xR390V4o4PAOIDUl0rI/EzhESMaePc91WeFhKbrm6dYVe7LA6nGkC9SGdkNk0n4OiCqQvqo1Am+yZOsOmJmc0JjheEJYwhx6b27j0sZ+7NxLez5UZatJ4u1luv2SkHADvh3nI0s8+DLdifB9KNHKye5+uPb2Svl+IgT8BJdX8tbWVf1AUdiDfuKyoUaMus+S4jC1BSoVMfwBWQlP6XqvvqMZj9k7KtOk6HSl/DyU4oCzIK+deZBn4WqqY3lJFAwAMeFEB0jHXhCCvEJ6YMukIzYrsJgndgBW5QhLMY8h/PU5QJ/AOWWQBj7yd3Lvo4rcwfrfTPakcFuBbYODNXCFvacHmRT5fmEYpITUtN3UidvNdPoOtOXeDMXv4dq0p0pxtAFp+2nwImz2xKoS+NaPzDshp0/56gGopSeNp3sw4l0UxJnzTfduiM+OClu6rWF5/SQYxbXTeOipmTcfIf2Z5wL9/3418CE6d2w6uYGzmfvZenPtKjghTNbIo9u9p7eP7IhiZI/rw=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +XFnjOPN10H9R/Mq7LZcnJ5THFIm7TN6AhL08UZ77r9McPOV0ModRYZm6wHvbhl7OiU/alqy+OaKy6sG0Mvxb8jptqpzwdUtCDLxxk2lAL8A/sdQmaP56rmzh4Jzg6ymlLDEE9nkR/bg6l9i4vbBVe7dqEZY4Fz7Cgu2JWmltm0YnrEXDSd4fSL9UB3CGyzPLyKiJD1Lk65OeiswLWmHc+pBaF1f5RyHiS/KDo/F4ZyKVcHUMg2MQ7yabpjfnbd4+T67IEokaTbg3O09gxCH01aRRxWMy+hbSMVRgiyNBU9ARngqPNOQODW+XecTLpzUf6doOzoJwDFrkCu3FvBC2RRfPWLO60CTM4L8HmIMCYkyJMVbu7aSlKwOBuZu7EmmWxzOv9Ib3uy2o0lEBdm59cmtSRindJtTyt7TEu/kGme8dhHsm5U3NG2yozOzoQih
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:59:52.8368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35577f-a275-4308-e867-08dec1e559b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_195959_020415_4E938C6A 
X-CRM114-Status: GOOD (  16.30  )
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

Hi a-christidis@ti.com,

On Thu, 07 May 2026 11:09:34 -0500, a-christidis@ti.com wrote:
> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong. Thus, disable the cache
> altogether.
> 
> [...]

I have applied the following to branch ti-k3-sci-clk-next on [1].
Thank you!

[1/1] clk: keystone: don't cache clock rate
      commit: a80b32a140c8612bbaed27009c383d43304db6d5

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


