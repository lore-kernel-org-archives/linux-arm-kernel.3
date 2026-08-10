Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C54C5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Gn6hEm5xPuPNq+/J36Sxkm/SFhZLPPPCX9sgoCfPXI=; b=ajJwQZIEIQFP6ZmVYvO0oOnCf+
	K+WWChK4ZQvuxFWTJPYlqKCBEz7044fP2xry79eZ/2Z+xilO+uUvQRijN1sRfNHXQ/Fan4A4S5+vq
	sSmbI2cwPI2tjJCATgRRusL3NjmJ4f3lHLI8O9xDVmknTwLqF4oOa3z1STuko92l7MpjOqn+jZ8tp
	blPZWss29mhUBBKxlLwsUCfBgFdudI58x7qJ+ZdO3DrLEpmU9f/TRcWnWumVOhB7VASsbvFqb3HJ/
	pitCjcRkqV2+RLx24b3wGkUG/UwBUkcUkJ0le8Lnx0YdVoa+o+ZxRUzp+t02Ft3L9DBVBm4IZ4Bhf
	Af2aDWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPmJ-0000000BruC-2Vmb;
	Mon, 10 Aug 2026 13:10:55 +0000
Received: from mail-northeuropeazon11010062.outbound.protection.outlook.com ([52.101.84.62] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPmD-0000000BrsG-44TA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DThgjbIL0O0v1jBSjP0gYhc2bLMzuz801G5VMtMEc6CzPt/7uEKXoTKg3lpt3HX07AkJ4TGlANOw6a2LN0SUD294fc8uC5BvqiPrNF8d1mcuRn7JN00wmN8EjUndjVrFPSYroULwpXuM5cl1IFMwyrgn8+us8O6PcPzTfs5i8NlJ3YnD7KtqQIOg9uGbcY+OAD9zXIK38chaDxiq4bqGkwSXWehDXd4+9cMzMklBVXefb4mGAy4dUhxZ/zfsMZJ4sIl8tIt2hKkza+Qvbaotr+Dm7ZUvG/Xv0DtHMm2yp0ILHap2AXCwvCV/SPs+b2Fa5BKnNbKZHLrN/j91+h936w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gn6hEm5xPuPNq+/J36Sxkm/SFhZLPPPCX9sgoCfPXI=;
 b=eX0mrvAirJ3ZGWDqoWU7ePabp2Lgo2YUt4tkWdYH91587DFXpbMd4Wp0mdtzUaMvIzYyKMb0N5FJQ7hPnI+1g5i3gLHz+1NLLKTxJiotQPsyBNqPwK8N/Kq4UQmlb7uV+hUcCAcZDkBFKMMxOjo9Y+lZzM+oqH45c6M/6KBNi0UI3JOJ+4Nrd9dxrHmdlkgwgY9wh/8hjMpn2hnDDhiUTHrRwkAVJVZ9KONXInTjuCPj/cmyMiiuAR93D4eNoE7dAFuJpJS2Ux4ns8NCdb2yLiDxqVfDrxgmcgMCwQ8fBnXnWrCnVHml7hGeAhkzQituwa9aQ/FpbbWZCGJk53dadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gn6hEm5xPuPNq+/J36Sxkm/SFhZLPPPCX9sgoCfPXI=;
 b=oJ4rwCX2xeQXN1QlYRhGrapP0lyJKLMwCQOcpa5dkLa30UCHOj5LT/Fserqb69W5bJ0uytDQJrpd2Vn6rRE4N779luDNIZVNuRlEqvrlQG7us9Edsp4ue2HQgu3/762sHlKJnkC5ILeA+uL+VKTjMXDF4vaZqS0Ezb/l/ZT9WHFW2SUF7z31XxBhuMEOd6GQEsE1M+P6w0kXQrwHzJmOYJqmxuGuyh9Q9FuGHRDbLPRELUlX0RnTwvZh2Qp697LmRMEovt8wiKf+VYJ9Y/alkwbzTLl8tSF1wkZBEhBYP09X8q7D2T2VZ1NuBH9I9KSFeiGGUD6kPQKnewrw9I8I/w==
Received: from DU7PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::13) by DB4PR10MB7064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3f0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 13:10:42 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::18) by DU7PR01CA0028.outlook.office365.com
 (2603:10a6:10:50e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 13:10:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 13:10:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 15:16:10 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 15:10:41 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<antonio.borneo@foss.st.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Some improve for STM32MP2X
Date: Mon, 10 Aug 2026 15:10:29 +0200
Message-ID: <20260810131032.455435-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|DB4PR10MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: ff74609d-fbd4-4b9c-9890-08def6e0c803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|921020|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: +9pFnMolTKhrmr8c5FlDRKMzvU+NiziX1PbDPzBIlGPFncqPly8Y8qbbcvlKAwlnCAgJhLlVSH+t8CF0baX14c8AadKhpdkR9yUttPsTbGYZBTCWLyOp56E9z+wA8LP0ixI79oVapZnb+MtyMNvljZ0mPRA74RKum/yLxnD7/mAABcXk9DJoN1JJfUK09oP9S+z2Sg8Jonv81jK6FUX7n+oUkhRnBfoYyYYuoYUnvdVz85HvTB9xfd7rDICm++rhLtf3FU0Opg54/94oqknuyFA0a4iqgCwUroCJhaZxDONfna3ThCD07fTzot68ONws7EQcxPgkQue9StcaHLW+LeDP9jcIrranxkBEpPUJzHrP/2hMc/daaYRauw188fIu/HlQ5PkLSeIPR4T5OuIyXT+LMGWkd9TYrGG2I7NmEwjXEoOKA22LCF7SRpHVrkr/FOgW1Pq0gBM3wZHaqcJDBinOd9HwLKTTjLmL3BUSkER4TUlhH7OPKSBesKnlFagqi/e+EuLIDgeXiVNs5db3VMs/VoYp74KmNwXhW3guf6Neu0yFZj4p6kaBKdXRcthbJ/PBNK8giJE93vOBuMFE1qhVepQs/P0WoPxgVOTZCy9s3CcAzFtsbo1GAfRi8hxtWXJPEZLpjmydLprsfFKVsidq058asHGmqzjncG6aalpiLRMO5ugGtFSDJgHuPgqGwr+UiEAAAwDmB7EKaLful89c0sLt0KMBP0/vR1SEyk2rUWFZb+mCLCDMPvPdG2D9
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(921020)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +IScFGmXi1h6cmGznVHkb2iXnltJtZOaE6hEWvzvaYnmJ1Tt3jTqMuSIOCBEX9Qpe9jKItUa+vpoWGaQnmd5z+4gxhxEcCFuBcpmVvdwq3wPdsJlPWE7s2tTGMQ+kD4c35YL8dowv2DrI72T1SWfsjSwgPwlUi2cLW26RT2MhVM6A4+ezSX+siXRqMLfmVYesv3yPxoR0nzWsN9GZ4e4GNK3MzbjNlSz2OL+wITnFR45Nx3ZgA3FpwjXoYt6w0hSPxtuhCl+hzeT8LoKRSaPDsxpcOJiFmbO3DEpLnz81IAOCtBGrZjU8SXCOctzohiluPQJeLZuPW8F44w5NmZf3vgEnAsEMpLqIT0WbHBKbZZ38qoKL0s21mi03nEU2oo90Fbyh14bhdfDc0P4pLEIlU2iJxEzHIrVmmWT5SxrWOig0xv73GrIhepn4kJ6NRIV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:10:42.0172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff74609d-fbd4-4b9c-9890-08def6e0c803
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_061050_009430_CAAEDBA1 
X-CRM114-Status: UNSURE (   7.60  )
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

Add PHY Regu for MP23/MP25-DK
Increase deassert value for PHY Reset for MP25-EV1
Remove commit "net: stmmac: manage error case during stmmac_dvr_probe" 
from my series to push in net-next networking tree

Christophe Roullier (3):
  arm64: dts: st: add 3v3 regulator to ethernet on stm32mp235f-dk
  arm64: dts: st: add 3v3 regulator to ethernet on stm32mp257f-dk
  arm64: dts: st: increase deassert of PHY reset in stm32mp257f-ev1

 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 1 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 1 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0


