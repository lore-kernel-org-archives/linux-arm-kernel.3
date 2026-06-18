Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73503CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0VAwwvYAplGfv2GepazNPNWcmyy3t/KoG94CgWOdWc=; b=OkjU1B+n76Hggo
	CSlp5Vj6XuDpaMUSe/8BuM6V6gsbbLLaTDdhsytrdK0Wj9xIu+CTXO9voaEp2VnI+pLjwrLmgU7o9
	8oWX9AL2PLRRY+qEQxQH8VtUTe+eBf4WJtIsZOvns/rYpc2Y4TsC8ZCXl/RngW+JYgWbcbFpmN75Y
	UHtXAdosOHvwDKiEdsiT1Vx3n/D/KtN6/gzu+Hx7+9vQzERhN7V7XvNULgptcOUGMa4JGiVIqw81z
	/8Syu4yI7PIV5cdeL2mCwGo26V7JgJnavhu3s0P1yrNh2DDO5gw0SY5t8gTCsz95HhLezAG8SCnpo
	Q+7Ug3tu9DOHm3tyzQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBq5-00000001Gmj-1HhC;
	Thu, 18 Jun 2026 12:27:21 +0000
Received: from mail-westcentralusazon11020094.outbound.protection.outlook.com ([40.93.198.94] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBpz-00000001Gkd-1MQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5zug6Wub/bVwOMAWCTVO3vPbxFG+55n8dAenFigtdMEBGynqhcc1IAyV/GlHqQEad2pfX+fT/O5lg3cCpNUetkhcZuJ+EueHTV/ASreGXD90R3Nw+rFpgb0lvjKQk+596Sw3GRqp8m96K97bFS3xyRfCDO+OKJmYMBXAe4zCDIYduZEpr67lsBaSQ3G3btkhdFGZI0qEacQvxRNsGn2gLkn7KSQi9nuurtrfRHuPq+whHb6sLncTgpbfjaaMvaMPYnAc5xnjir/IKu2f1pl2mnRQesz09/jr4n4GJJUDzTjqyLYZnPB4PqzvS6jCiyKxECPWJRM1Ib+hxQ1KlRIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0VAwwvYAplGfv2GepazNPNWcmyy3t/KoG94CgWOdWc=;
 b=m2dogJ9pFhqdSmyJrl3PHi8cgw9inh/iC3ORXymK1Z8w8Vf2+y8y8rXaiZ5ZOnuzpuox4zdCFObnn9n/XhwBbp9FtY0j/Nso8PyNSLd/H5HBq3gdDOiVUHRLdlR+706u6XKpCqW2ZqzIktfnuB7OPgWIMvsKsRE+Dsm8bxcjTnO00yK/FnSLs9yNHwP09FPVDIcWF+rDN7i5SE2kkPkKtIqnyirzDeRLKy962ILejAkXcr7+Zn9xQ5CcSkk2NA5lSsjg7IwzvipMMZ/jl59pzLOfDgMt3yDXoZKezu3dkEc8M24ao444G2BUAMip3rEEJ1UgCl7d1K9TlMT/DAdYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0VAwwvYAplGfv2GepazNPNWcmyy3t/KoG94CgWOdWc=;
 b=ldP5JAipsxwK9vgRvW3PiJceV///BwI31vdttwRsSEZ7vP0ZCadHqsGa5BiJOOILpcBdmgYsGXFIpdcvtMB5z/nYZLuxuYTNi0Ge/40p7Sptgf09rBMvCimE4Nd/XkC0HuLa0OTdRBScTocUigcOj/jZbDngoBYvnhl/oi/QVdO0VLKMQRu+WRZ/zkUgDpisUovRIslrEtP8pOEA+opYGdM4cWX27BHzcnGLEdmAw3S/GO5DEOkzq73sthP5tj/sWlIXTt+Wj60czgUH4ZFzU6ior/rWLXjj4Rx7bAPe/qzzGOWNVo03l4d4nDeYtGivtgfuVH6W1Mr0Z8uZNDvsDA==
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by BY3PR18MB4564.namprd18.prod.outlook.com (2603:10b6:a03:3b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 12:27:06 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::a5) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Thu,
 18 Jun 2026 12:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Thu, 18 Jun 2026 12:27:05 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 16FB04186B58;
	Thu, 18 Jun 2026 05:24:25 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/2] pwm: add Axiado AX3000 PWM support
Date: Thu, 18 Jun 2026 05:26:55 -0700
Message-Id: <20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/kM2oC/x2MywqAIBAAfyX2nLCWPX8lOohutYdSFCoQ/z3pN
 MxhJkGkwBRhrhIEujmyu4rIugJz6GsnwbY4NNj02MlR6Je1dQUtIgr/nMLYwbSqH9W0SSidD7T
 x+z+XNecPGxoaKmMAAAA=
X-Change-ID: 20260518-axiado-ax3000-pwm-cd7c346849f1
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781785625; l=1645;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=87gvUjSMK5PQr2yt6Z7luNLbGcs+2FueOZy/VIUrxo8=;
 b=zI5BnmTeoEXCSPO94viVFgIirch9LW185TDZKTRpEM2u1z2aO4fLXEPPAxBNuq5rprjoaLkXR
 4ZCFy+cGDduBPBBz5t7nONPxjNJlOglH9tGQsLSN2C79ruTTy9ZCb/d
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|BY3PR18MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: 203d0a1d-b776-4e19-dd9e-08decd34e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|18002099003|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: B1Vv68HBeuXlKN4gQhAyGsoTVzGPh6utOYx8tk27IPrEnr59MMjSOwmH4llIHdaoX7ZbDlussFFqK2eafeRlaxzaorCfRWxKqEma1KZVWXPro0+m5uzkQFdINJrz0HN2BkAuLADSmCs/GqajwFdmpwLpHfNYuW1OgeKxyK0hZHvQPOucElB+8/lTcoHBuJMDzPxZ5nS7G4U2SWbt++gXeflSOtMkudCCXawikexzufGnnqATjbRSW/wWT5jtXV9KL6AQBOMGwB3WGc5aujxQf8y0CFCgxf7fWLSI9aGPGVFVX4v4XXAO8vyKRfBibhr0hEfb0GfzsgenhOD0aViPuvQcPEmTZ2IUZ8dKS9xp4EJ2i/rZBMBnOy3kQaoZ5/1LoIxt3XK5kM6/JEdJd+8P3CvWtrOKvtaEtng/iywsDjdahse+H9K6kr5h+AlHOopvpu9zuvjSRkbtOu2zR3h0CPjTaiZBzIWdLwFHMEDDgBpbUBe+Q5LntxdVmg6KlX8D8r9qAEKccoI5JD8Yo04JOAg5Uh0Ck1vzb+gYHkQvT17lDrHgZtWb0x+f3LCbPcNrnfbvXsHWVQrjuhkYrId1+683NgHGqEEmHNsqer4tnyYMfyCFKSEdI/9DVquSl+to2AE1M4Xv2OjP8R1Fh7AZEki/fdbfRVtOEWDnjbB0VnGWVYEc611OuYWd1w4OP+kp
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(18002099003)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tiY/sfi/6gNJRgxNBXY6bT6mf1pe+pqxw3iQFoa7ELmSvVbK2p6b5Ar2Oux1K189qpS+WvF03VcKOjm2iSVa5ih5vZwC5gU+VZYSs9O5ce9X60qWhHQdS/HvgY/ChRZRyFr6cDhF3aoEtHTRpO5ZDNqhguqQfkcl0W3kMrY8cuMQC9gT8U08UMTdFF6L1X10iPpb6Zo44AH3uJcVmzBbCq828l/ERUvD75taRN89YtbTKnkR/k5YX5qERw3KcUAHns1qkXmTkzNFBljvenSGedSSySEIz9PINAzvW5Bix/4iSQAPKRdWyWuagjmXs0mzXZSf/VOPogcDX6/P5r0tHL1ntxBrGy0SGYeylF41EX2INqvAr5UQlth/eLeFGKv5pvRWxN2ma69DM0ZSvrCfjOP7jr6An6WSYSkbVWFyELbYkT7iFHFpjeGj0WaZPsLC
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 12:27:05.9298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 203d0a1d-b776-4e19-dd9e-08decd34e8ce
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_052716_020572_35E4484F 
X-CRM114-Status: GOOD (  10.86  )
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

This series adds support for the PWM controller found on Axiado
AX3000 and AX3005 SoCs.

A new driver is needed because this PWM controller is a SoC-specific
hardware block used on Axiado SoCs. It has its own register layout,
enable control, period configuration, duty-cycle configuration, and
does not match any existing upstream PWM driver.

The controller provides configurable PWM output signals. The driver
exposes the controller through the Linux PWM framework and supports
period and duty-cycle configuration.

The driver converts the requested period and duty cycle from nanoseconds
to hardware clock cycles based on the input clock rate.

The datasheet is not publicly available. Public high-level product
information is available at:

https://axiado.com/products/#AX3080

The register definitions and programming sequence used by this driver
are based on Axiado internal SoC documentation.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Petar Stepanovic (2):
      dt-bindings: pwm: add Axiado AX3000 PWM
      pwm: add Axiado AX3000 PWM driver

 .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml |  52 ++++++
 MAINTAINERS                                        |   9 +
 drivers/pwm/Kconfig                                |  11 ++
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-axiado.c                           | 193 +++++++++++++++++++++
 5 files changed, 266 insertions(+)
---
base-commit: 1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
change-id: 20260518-axiado-ax3000-pwm-cd7c346849f1

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


