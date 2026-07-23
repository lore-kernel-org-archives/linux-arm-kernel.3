Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6AC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0s0hvhadmfCmYqnIAnZ9gsEtWng5IrORw8E7EtuhJK4=; b=dRcDwdGP8B75GO
	D28RJG1PZm8MVadMz/zBW9mFnBrhSDt8BMLiZEwQbdVWyI7tqZ4PIbixvLzkJEp9u4TFPiTXYBqyt
	SSyXyWOPHabG5j6pgYXd0JSJQ+OeOGPfBKc+93iTrhfd68zDzGKkG+C4/L7keCjJPjUoimL3p5Q9a
	26JD6jRqe00Y2RmRY7A2lenK7PWPUlstGvgVpW09Iu+NwjLA2OQjFPoaxrREXN5/gzz+cFhNAgQQ1
	2yjTKHOlxltBMii68YpvzkVOu6jw/MsCg20cmFkNyUMuK3KGn6WxsXHrh1Nrz9UZ+6DX2nSg0V2VI
	FYUHIdSBG+4500GKCjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpnT-0000000Dr31-2YHz;
	Thu, 23 Jul 2026 09:32:55 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpnJ-0000000Dqyr-3t2I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxp1xrxb0WQjJ30nlGLJUdsHtj9zwlafTDNHH7JfI8yOVtN7rbnZllF1o4aLvmirnmB5P4lSWNYkT3LeQlX3rmtr8UnDMkTk35HAezv+Hdg7GvqBkbnAYmoYNkOMsMbtawlu3gmzfuFJMMqFd4zzRER5xbJn25CeczKhW49Eb02i9hgSjQnTq2AnsLGFz6sIxDsUMtb6l/Iddh53wVVb9eJBtvDsoG4go09xD5znbtaXMfMUtMFOGEUtnPDSXExXu8h631095sudZ4CXhVpHbSWT45Nh8/qioV10r+lBhxaa7DC1KIqqi7MnAjx/XMVvOZyb+snsAvZEUEKR9sywgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s0hvhadmfCmYqnIAnZ9gsEtWng5IrORw8E7EtuhJK4=;
 b=d0xm/gOcBdrWFfe9boSNmHTlKUFDhowPg1nmspSlVOiodNKzIXknylPVfct7eMhV4QPY6WWpNO4/kXHX9ZBJxGj2eA2tUzX9W9Dz6q3FHsh61xv59VqmXcG3QJzG6ze7vQhy0X6CSMBOZe+iIiY2xsYr9UT+a1on0Yp9422/eXjKn7qZwyie1fVMOj2xAaILwpUKLFvZykKaechjY/CgkQqOoFY4oozLXSGq2zrhmJTCKVL6CKpx/0V4dCVmiE4n6hitnL7RrOhSOzpeZMBZ6rTJw8MVdqSLltnwb63Z2346cnEQfRZIr14zM7sbxKYbZRgqOQmKUWtRBT8W3XGvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s0hvhadmfCmYqnIAnZ9gsEtWng5IrORw8E7EtuhJK4=;
 b=uJQ8SYENssIDjX3zZjOXocDS75xFQamUOgAgYHG2gyT++pGCDywRPu/+EPlUDx0m+z7ewLUY7nu12WK9pHkQnqFi8dW98jfX9J6bs9fzdyMN7TiV5USTn+MNJNuiS9j/tAzVUODcjL4ZBPiQvoOVDImMqU+UT4ux4B6seavu+kH8drOX2t/EaO61nTYmqyAmmiPVL11MREOdVP+sxaMTeFgb2jgqn8T8/17MX7FeI/zMIeqOwUWyYIEeKj5SFi6aKxldEIcQBUTACe7UhEj46osOiI9yANAZJvx1vfLNgjCaYgrTNKuNM9+ilSdeDnymllaxPbN2lneGCR+Sd3dcdA==
Received: from BN9PR03CA0533.namprd03.prod.outlook.com (2603:10b6:408:131::28)
 by SJ4PPFB9F2DC4B6.namprd18.prod.outlook.com (2603:10b6:a0f:fc02::f3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:32:34 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::a) by BN9PR03CA0533.outlook.office365.com
 (2603:10b6:408:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:32:33 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 094B94186B53;
	Thu, 23 Jul 2026 02:32:33 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v2 0/2] pwm: add Axiado AX3000 PWM support
Date: Thu, 23 Jul 2026 02:32:17 -0700
Message-Id: <20260723-axiado-ax3000-pwm-v2-0-22002f0b281d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHfYWoC/22NMQ6DMAxFr4I815UDKSFMvUfFEIVQPEBQUlEql
 Ls3hbWT9b7+f94husAuQlvsENzKkf2cobwUYEczPx1ynxlKKmu6iQbNxqb3+VREhMt7QtsrW8m
 6kXoQkHdLcANvh/PRZR45vnz4HC9W8UtPW/3XtgoktFppZTRpKeT97Fytn6BLKX0BVx+0Y7MAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784799153; l=2552;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=SJRq2/EYcsCvAg5bl1I9ma8zFRstwjgLdGyxbAZfPkA=;
 b=LFp8TPTEeFr8x64EjCg8hx/Zw5rULhnmrDmmdLkiJx9lyskEMIhY9WWrZGdRbf6xCamHkOrKs
 It3RDImnamvBnb8MtpvNApfksew7gDOu2oKT6uJ7veMw1Pb4ZCQ0qSG
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SJ4PPFB9F2DC4B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 2579383b-31ab-422b-387d-08dee89d536e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|3023799007|13003099007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Dh7YLw5md5VUM/Bhx5rCsFYpAUBIzTOic1w1bbF4ja83yYe5PtMkbFe4M04A8nTL54sujeua0wPJxSUr/vzMrW8REbM1Az6e5rNpTAgetjVedgY1bjGRTmtzfyh0jMoYPSodelOIUusl6lIE3VUjCwBYB743A9D5ia/oRLct/1dIl5M5AdhSGg1vsjzLpuW9/hFLXhnyMWjQyzE1yNJ3ArI4yvtPq13X4vIDY+KM7W1iAm4dvVycom6XROVsGG22VDh+T/Aj9SexoM+nlhTEr83R7lRivewXouz5+GzhZveHljpu66XNlpRCTkVWRZ76P91nyCEhA93UgbqA4XeGwxYK9CokBUgs3QcLGg83Zv83MavmGIkNiKjsAOdseMVcf0qcC2Albq+bj/whs+KPF4WKY/ynYctsBbXjDFh/p6HiLkZP+Lhc8OyUoTZKjEmX6CnGvIfef3q5X/rEly4SMrFRBQJ29P4fR7uRZgFhAJrzr7pyVJ9i08mTjonPcNRkFUOsauTGZXaDbDVCy/Qtk2Ou/3DMAHj2Uc4DvNMmKdqhlBEbNYw1ce6FGNolbsp5FV1lxQOoRIVU5Jd7eKj6CmPAOyestZ8OMIKPWvP++JHioiP2f9aEl/AdvhFV+/LcFDYGGD/KaoAmhICwgM8H0w==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(3023799007)(13003099007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1h9ieOXWAcWsEMdQH0YEMBzAUeQRoIpTeL4IteaY3g2JWk6wvMO3yIaN1Uo6q7/1QoDpy25Mtf7yCWC1tFVmZLMdEFdVMjUBUfCPmxO850ueQaI1WlslfrlyGj1FpzP3eefWWSr7EO3yYOqRxY8DpSbiVKiQwYJtUlVwwQ2mwsSxzQ1g2xgPZtrrQLnlRcYjX71uQnTV438ckAy/S8TyKBsQqwsdPxw6Q8aSGZy2YX/4smITCZnuAMMWLQ/D4MvvdPXjUpXxKe1FJV1SXv3421uFXHtyw6RND27OgncjEOi5Nrx4TQfPZUmmcNUPyowC+7EyaueyZqAeqmddPRCLovT717DBwGOoBuXVfFljv6vHgcsmQWTi4Aj0nPGzVT3Bm5/lWoSm98mHgsEwVfS5A64TJnYXn21jlQ1Ym56cmpoh4XAMvM848+ylcWAchW4T
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:32:33.8684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579383b-31ab-422b-387d-08dee89d536e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFB9F2DC4B6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023245_976353_5FB929D6 
X-CRM114-Status: GOOD (  14.10  )
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
Changes in v2:
- Migrated the driver from the legacy apply/get_state API to the new
  waveform ops API (round_waveform_tohw/fromhw, read/write_waveform).
- Cache the clock rate at probe and lock it with
  devm_clk_rate_exclusive_get() instead of reading it on every op.
- Improved rounding: clamp period/duty to hardware limits, reject
  non-zero duty offset, preserve exact 100% duty, round sub-cycle duty
  up to the minimum.
- Added a "Limitations" comment block documenting hardware constraints.
- Renamed macros from AX_PWM_* to AXIADO_PWM_* and dropped unused ones.
- DT binding: dropped clock-names, made #pwm-cells required, and
  updated the description and compatible list to cover both the AX3000
  and AX3005 SoCs.
- Added axiado,ax3005-pwm to the driver's OF device match table.
- Link to v1: https://lore.kernel.org/r/20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com

---
Petar Stepanovic (2):
      dt-bindings: pwm: add Axiado AX3000 PWM
      pwm: add Axiado AX3000 PWM driver

 .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml |  51 ++++
 MAINTAINERS                                        |   9 +
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-axiado.c                           | 272 +++++++++++++++++++++
 5 files changed, 344 insertions(+)
---
base-commit: 368d34807e6d04bb2089918383b58abf40e720a0
change-id: 20260518-axiado-ax3000-pwm-cd7c346849f1

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


