Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A43C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 04:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PKDyTOh1HbkCP3+STruVPNS+XNkrJCeGrlpHKAv9eD4=; b=0audpU6IrBOmIS
	vfFvGXdd4oK/T7vjzKEGenPmdLHGndQaBiTy6IKSzSAo8dVAVz0ilzz1HgOoCe67J5F7UTVhxJRIK
	xz5uk8CINyDFHc675WrHsnQlnvU8bZV4UGCO78qHY5Ew1pnRngrREgG0WLrIkBaA5qFTb3SxhS2nx
	oUwRQD6YG7Nr/2EgMavhOwWgo26vocCyyfZMOsAFAVY9k3Sluf9YJl6g3HqknIRF/mM95lC6srEa5
	8scX9/ndoVB2PUbApP2AKj+ti/3itF9K/Ctk6A1bLJ3KwBb79LfIYg1xglVSiayA0IILub7O+2RfN
	cNkEKmKnj8kbgvAhs/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemtB-00000000eMS-1R1S;
	Wed, 01 Jul 2026 04:49:33 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemt3-00000000eKN-2fwI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 04:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9RSvtV053JmQcH7Ds8+tz1USuk4pkE/ZId/TtlyPbGysgdA0LvX8/1Cr5Pndf6RedIKBje9qsb4I8lLmqWuPYScP9O43Ca/gedyDFEshbDEDn+CcxlN8JtSUiaojUB+tG31P1ibX20pfbpkrFBoOvwZR7ePASrgbA5QflV6xRYvCaUJJmtL1rtHHBz4Hjbfy/bfqVBGQiLUklZYytEvE8gtDiCRrBferNq3cJAxITq+2RHbRRfknUK6u65I+PbaMmmePyq6PEDGi3aOadUMmCPvQ6HzNuheBSV/bd+KHeGz00mKkkfGQHxH+1WUXFpwJKDU+6eDfDpEV43gcWOytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKDyTOh1HbkCP3+STruVPNS+XNkrJCeGrlpHKAv9eD4=;
 b=bkO4bmtpzixZp2t5GA0co7gNLtNliHVR0qFqp9e2gRkvXXHPudFCigHM7iAPOeTr9swf86sCyZIs80AILB/cQAhWJ2iszp2wR4erdoDjLYaYODbvew3q61R+Vg6EglB6ihycfxFQoG2N+G0gZ7AGG6eob7PPqklkT0qxZnaBAstlWulcDiEllgR8CGxJ+IU7mZ2ciNRieK/eOVeMX2U5Fyb+Pu/DjOfhNvFuTG8KrBh/mNjuTL0pxvrLzt78CJEtPlN/OnKcPePMylaZEuJcD/anlnZ59M+zGK1KymHe4Z9ucWPIJuXLQoiz0fS+SARIW6clTFehFe0awm30hhEPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKDyTOh1HbkCP3+STruVPNS+XNkrJCeGrlpHKAv9eD4=;
 b=fqumFcmhkc+uV1ZD4TPoip197jjdGtp8QER+mgXe5SikELm14CYyoMbBOK0jbVGUH+9m5tqprKwreFf3Ruzbn02Jfj65ykUxCRFg0fi4ioJWinUWUvLABtXANw51mHC/J+UOeqqvy03hlyYliZ/X6z2omMcKBUVDfuZgIzzyz2tKYtaFoDxYy88Swg0BEhGeDb5o8ji8O9IQxhpSQ7wTbZdkJyohSMHhZIKHxWAIJmYIb6NSE7nc+hnGHFhNO4XyM3gamo4vcWZhBt30b4kITianJ+WV902u6+sXEioGHTEwn+jVzv7O580Pxv3QCa7aWSRf4UCGaLPVve8WSKZs0w==
Received: from SJ0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:a03:33e::32)
 by CH3PR18MB6051.namprd18.prod.outlook.com (2603:10b6:610:1e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 04:49:17 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::32) by SJ0PR03CA0057.outlook.office365.com
 (2603:10b6:a03:33e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 04:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 04:49:17 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 68BBA4186B58;
	Tue, 30 Jun 2026 21:46:24 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v3 0/2] i2c: cadence: Add support for Axiado AX3000
Date: Tue, 30 Jun 2026 21:48:57 -0700
Message-Id: <20260630-axiado-ax3000-cadence-i2c-support-v3-0-4e217cfe5904@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmcRGoC/43OwQ6DIAwG4FcxnMdSQCXbae+x7AAFJoeJAUdcj
 O8+1MOym6fmb9qvnUmy0dtErtVMos0++dCXIE4VwU71T0u9KZlw4C0wxqiavDKhFAEAFJWxPZY
 hjjS9hyHEkTbCImNSa5A1Kc4QrfPTduP+KLnzaQzxs53MbO3uegP1AT0zCvQireHOIGipb/vOG
 cOLrHzmP7I99HDmhURnlIFG1MqpP3JZli8koQi3JgEAAA==
X-Change-ID: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690; i=syang@axiado.com;
 h=from:subject:message-id; bh=3oLswqHJ47qPB7/wbj4Z8SgdhKo3GxWekig4IIU6/pU=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhiyXObbPd/7bxN9q9SakWMio9tGdiPtZR26enClt2/Kvs
 4sv5mtzRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEzk2mVGhgvO5lebt2RdT/Tp
 ufi/9umu60pmNoydZ2rqXFbXXhXwfcvwh/uY9oq2D86OcxTMl01vK1CRuVFtwS3moLpY9YL2jcP
 hbAA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|CH3PR18MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: bb92f1ca-2b2e-4f70-215a-08ded72c1b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|6133799003|18002099003|3023799007|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: Xag2qmrjOtf3j8TgESz3h+Vq012iZqUxCp1YXRa8lGPuStmZUKLVII5WHS9XZE2M0qfn4OIEPaPNxWks9akTDDu5vV+hDJ9MxgZgocST0SM+EJH1fRdYI9XnoXpX7IohtU0Q2pPMj6xT6QPez3F0mnmpqmFHcasC904CqOYPfx5rJsQ71uAgRDHvcUme/XPTZiNJqhB77ucZBSwSPJo0Z0Nx0kd6r91uaWfmSdOjBoGyRkA7JVm6pFEpjcaH0pnOuZV6HWctrTD5knkEqpyK+6Uh2RWWlrMUeMp0J/tnrPmSpxBInbXpj/j1jyvtAylBsogm8zUsmUXgjKElPA/YKtsJEiwzmVq45WTHtyBStqsiTJVkaJxfQSsotyo1WEwnjnn/TXqV4zfUpHlO5KTzb4Xt3LSwsn33Hh9v/P0FZQDGo/487LkgfKwPEHLqOLZEHG3NJf4z7cuyp1WxMklyasBIXv9g53V3Vk9Eo8LWR8x9kJZQgQL4d8BD3IeHulJr/B4YGvYtTIepHvKEh37SSMlrr+4H7gFtfAm3eOirZ6snnY0WwR1Cxq0abDQvnEUDKQr00WqEw3lS4J1ngCISTyaEi2hMPZAS2jTnAgRvjmzFwL9/m8uXEpJZSd/UN6oqa7XzO4s8at//284rb/Unm3dTeXb5SBFvIHLiyXncaw1bKCCKbn9DXXNoDQ8XAeQVADurtmf90zrRiOG3Zj/RTA==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(6133799003)(18002099003)(3023799007)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z8UXenlNnja5xjZbYOQGBZHSc5XtyGm1kmPXWps2tXCdVNCFPrwgFVvsyn70Z9HQt4DWQoyIbO2XUQKunjyapbDwVCySH0dRZIPdbGZ8Ea/aGAhwReS/qnZO0QoQo0GkvN4BgonmTWue8+Wlzcq6kfnWgJyqxrcJsJBKb0ziwempRKKZkJzbBmQZDiAu2iBp0KHN/kgXlW7lgZLw5nXWpmF75YJoqtMh7afQCk2tXj4xa1MI9M5TyNbszqrz5+CZssWARRugrIqBje1s9dJHwJP9Bq94iGfSmdJ4FO3VcPvW4Q4++BweV35R3tkIbqBqFzH+6U3/KWPltnSUoxL2bdbY2yvCtCgplfECNML9ZRSVFBa2z2Nn83iuSK6jB5vm7quvTqD27VB8B9y5++9N1FL2/wH3IdixXWCqOEBZfKCG4A7r4gjRoszPJiirVLpw
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 04:49:17.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb92f1ca-2b2e-4f70-215a-08ded72c1b5f
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB6051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_214925_685602_FEAADE73 
X-CRM114-Status: GOOD (  13.95  )
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

This patch series adds support for the Cadence I2C controller
integrated into the Axiado AX3000 SoC and enables SMBus Quick
command functionality.

The Axiado AX3000 utilizes the Cadence I2C IP core (version r1p14).
While it is largely compatible with the existing i2c-cadence
driver logic, the AX3000 hardware specifically supports SMBus Quick
commands. This feature is currently disabled by default in the
i2c-cadence driver (masked out from I2C_FUNC_SMBUS_EMUL).

To enable this functionality, this series introduces a new
platform-specific quirk (CDNS_I2C_ENABLE_SMBUS_QUICK) and 
uses driver match data for the "axiado,ax3000-i2c" compatible string.
This allows tools like 'i2cdetect' to properly scan the bus using
quick write commands.

The DT binding update follows the recommended fallback structure,
referencing the 'cdns,i2c-r1p14' fallback to ensure compatibility with
older kernels while allowing the new quirk to be enabled on AX3000.

Patch breakdown:

Patch 1: dt-bindings: i2c: cadence: Add Axiado AX3000
Patch 2: i2c: cadence: Add support for Axiado AX3000

These patches are expected to go via the I2C subsystem tree.

Feedback is welcome.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Changes in v3:
- Addressed Sashiko AI bot report: Populated adapter quirks with I2C_AQ_NO_ZERO_LEN_READ to safely reject 0-length reads and prevent potential bus hangs.
- Note on AI review: The bot also reported a pre-existing UAF vulnerability triggered by 0-length reads. Since this v3 patch prevents the core from passing 0-length reads to the driver, this specific trigger path is mitigated for AX3000. Atomic transfer issues are left out of scope for this hardware enablement series.
- Renamed the quirk macro to CDNS_I2C_ENABLE_SMBUS_QUICK for consistency.
- Link to v2: https://lore.kernel.org/r/20260611-axiado-ax3000-cadence-i2c-support-v2-0-cfdad0534afa@axiado.com

Changes in v2:
- Collected Conor Dooley's Acked-by for Patch 1.
- No functional code changes (sent primarily as a RESEND to update status).
- Link to v1: https://lore.kernel.org/r/20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com

---
Swark Yang (2):
      dt-bindings: i2c: cadence: Add Axiado AX3000
      i2c: cadence: Add support for Axiado AX3000

 .../devicetree/bindings/i2c/cdns,i2c-r1p10.yaml    | 10 +++++++---
 drivers/i2c/busses/i2c-cadence.c                   | 23 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074

Best regards,
-- 
Swark Yang <syang@axiado.com>


