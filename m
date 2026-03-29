Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7703FF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KMr7UZOa/RJmzIUz2EKS9uYkvi8to+oEx6dPksgo2A=; b=MAVsRpoAmuI6LV+0j+S8z8d8ti
	YZRzMkVNDv9EIRX/94sl1ZjQYp0strOwUVgoUi7rU5WgafG1duUTaPF2o80u+bO+tKiv6KEMlw/TK
	wBl5QDObeBO/jS4PwbQMZZCwa1f0II+biMnsLvOWGAsh4hZgun+y+kMn0B8Ie3vbHqdxLwptBoWO/
	RA1uoRoJ5mdUSwT50IPMTp84o22VehxsKCQatqVMVM52GpSaE8LfA53jQgTNS44UFVZaZlll6R1J5
	pMXr/vOyKWMaJkfssNyh3KwSSAUYvwiHQMHSN+Ueo/nO1dQXf1XUclAbtkV7KZ9kAWTa5dFnbeLCP
	/Uxa4/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rLj-0000000A1bJ-1rER;
	Sun, 29 Mar 2026 14:42:47 +0000
Received: from mail-northcentralusazon11010049.outbound.protection.outlook.com ([52.101.193.49] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rLg-0000000A1aR-04Ds
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 14:42:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXMxiSSsnozkDs/p7jeBB79Nf5x1ItJ4p3Nmc1appLLbQQnliVth0wXw7tbDDuMP3JLrS+2I19JqAuZAz5GLcCgaplXC5tij+0yI07ybGFAGJOi1vgQvhfYjvwlaT7wRccUB0dXRh6aBUppne8cREfxjPq5UpI8tYIG5GlgKTDRV97oY1znIxEEc9R6BNM+8q1dgT0oXu0Smv4sRiYwPBHJmFpOxOBH1nBqVg15lg2BjxG9O/7CwFzJrx3ysG1WQBMMs7IQrUut+tR/0yE8LyzBVkN58pkNF5D+5ACaxcZmYQ+ykrYAtBSlBO7/qFqCtD0WzBn2IFyyU2gWePEtqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KMr7UZOa/RJmzIUz2EKS9uYkvi8to+oEx6dPksgo2A=;
 b=d779n5oqVNBtx8spefFYqGhPADL9k7YblyVQw1dOUmocFy/SMCfmGbVIikvuS6yWJWqgcmQb6LXDxr9t8ZpqYBcElNJzUyGv9WsHQSeL1K3L6k4MHtvaepfP/e/d6jnXdCyy8+1JHlqKCw2s6EmefreApdDyBf8GqnERUfe+RElneh4zmW8NerPJ96Ri0mMp2pyfeuEmEiUnPuFX3BMRx7yId3RFOu4ZwOV4F6m7xMdQrj2rNeqyF0QNhgincWgRH/awZSe0HoHkZ8r6VxE32kX6fR7WojW7glhFVty1l3Ze0gzLetubjRETZvXOz2d6zgysQFqif9DYqP03TtCBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KMr7UZOa/RJmzIUz2EKS9uYkvi8to+oEx6dPksgo2A=;
 b=DfxUVmUuh26p9lLxlEzoibfoxxkRFGdkRv9D+i1LQgykP+DWaZfDzODwpKmbGtIGQfNDSbLproS3W8Scu+5fYq6/y3NnRbS2HNI1cNd1aoLyj8g66znXgDQzG7OVZdL/PPI1OqwjkuRmAY2i7cHYcP/XVZoFAoMfjgZnaiOmgWY=
Received: from BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::6)
 by MN2PR10MB4301.namprd10.prod.outlook.com (2603:10b6:208:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Sun, 29 Mar
 2026 14:42:37 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::92) by BL1P221CA0036.outlook.office365.com
 (2603:10b6:208:5b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Sun,
 29 Mar 2026 14:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Sun, 29 Mar 2026 14:42:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:42:35 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:42:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 29 Mar 2026 09:42:35 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62TEgXol3256096;
	Sun, 29 Mar 2026 09:42:34 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>
CC: <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
References: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-pinctrl: some minor cleanup
Message-ID: <177479534241.2176431.16318210830741997453.b4-ty@b4>
Date: Sun, 29 Mar 2026 20:12:22 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=RF11bLOffU2IFCsyHsyKrIHRb7IC+t5VNWWf5z+3fOk=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsyTVpFS9VydBhmMPhN5dpjtO63SWGHmHFb+++urv8dfV
 Wgqbj7aUcrCIMbBICumyBLAtmuWVYrF44iKxK0wc1iZQIYwcHEKwEQs8hkZNt5Usj/e5rFSRsPz
 5oHZUzxn7PC8XiDUsmZJ7KuNc11WOzEyfF0wr9lrzVnZZx+4G7czT1l+ItzLRf70YYlX3RvT9+S
 VMwEA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MN2PR10MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e91ffce-1bef-490b-21bd-08de8da16b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: xSoXajSqKCQMm9YWjdEK29ztPEXDtdh7elC4mk4UoG1o9vyeqVofis0f7EOynm02812xXfRgQIPaLYeuTjVHLCXK6c7fFPXiomYyvcVqg+8FVZdCsmlNgtmISpXwTx714fb+jlZxYYn/WOLkvnCD2q6lRhZZb/vet+FLZKtffBkwt+lTplxAcfwrqtLREDwdZ6ZoM8B6O30eHa1Lco45Qblup22GpStDenld14/y1FU93tYOPenJFe6GqSe20w03KWp7ui7VD6uekwhp9uBDcCz+sGXBEE8e/rJx27N5sLeLRSNlY+SDuLkRuhWpuHcKQTFg3ITDJEm+lfQfhUmidey1KFpuZQc6kjNCih4tlTn3Bv1Mx64nw0ie+M6bgIDdmkUjNaRYKaijxmMrLLLQ9sH+QVqZKc/4/48gUbQ6vwuw+n1cO5E7i6HDKCzJ/TxudN+NYoK6ks5e8gjRVLykIncKfxnUfT12CVttKvpM44acM6+dM5YUiGB7Dq7vMqgpqkZwwjxqJJTioPxpFr692U0bYaLW1a2dQMX8MhvBZleS3NFA0W8RR3x1vv0STOtq7iiq18hgdlHrpUXZcsWJvB75WADGg4gQvS1K7rGX7GRPHFpdvJkTo+wf90l80Y0U9rtwCW0+X9V/RUKfOIw/Iun9/azlWC9JX6HG73atnXe+gQKh8gd3jAdOGjC6+hz8BWeVVLMC3yDmkcwzgMrN0FhvJssmEW+PeWLzyA+g7APAz1BpbMXpYjXaGZsX2Vw7GxcCS49RgEY+cgQIO0ArKA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VeZGIBJB+4FdxMgba9oUQS7rRw+pEx0LE7t7R98ak2tQRkOfO8BoAFReQEPc5ahyX8itELEMN/yTfexx0MlFICxpE6YH/tz6L5MSELeumHHwnnsfhBMfTcpYIA250BY+v4XlnBz1mIvVGEJKQnB5i94YARhzhX+taty+ErJOiNdKxA5L9RjoeqsJk+X3niG3PB268f4cIAA4jGLHSgyZKDcXLyt67QoqZOYQKwFvUYxuow4HpbHNVpJfGc6m1vWWqcSUzC95K/IidmiCgKsc+vC3/ym8wFB0ppQ/Y/z06RqMqSUYl1TPnFw/dV2ZkpaU/isYIsMxKrTkpjgqfBLW6UuYfZgYrzM5r6mOpOj71fipsEXWCcVqxlHjig3FPveR4Q+P8Laga5zrHt1TgSmdo/x/YegRBGa2rxjtHfmx9ABhRBacJyaajk1QghSfwj3F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 14:42:35.8705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e91ffce-1bef-490b-21bd-08de8da16b22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_074244_189700_7870F355 
X-CRM114-Status: GOOD (  10.61  )
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

Hi Rasmus Villemoes,

On Fri, 27 Mar 2026 15:15:11 +0100, Rasmus Villemoes wrote:
> arm64: dts: ti: k3-pinctrl: some minor cleanup
> 
> I stumbled on a few things one might want to clean up. No functional change.
> 
> Rasmus Villemoes (2):
>   arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
>   arm64: dts: ti: k3-pinctrl: sort shift values numerically
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
      commit: 8bd215d1e4f27a8feb762b19a8d030178cf0337d
[2/2] arm64: dts: ti: k3-pinctrl: sort shift values numerically
      commit: 06498fabf2965233440072d70146798e4372a8fc

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



