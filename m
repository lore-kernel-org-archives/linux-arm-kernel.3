Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608EC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hw9wa4GvzLNM83Y7tsv27/tR8KAy9MuhrhvRtLgNjUY=; b=A5XTbMwcbq2UlQ
	/znBBggMMSrcWJ1OGkrLCLHiNCQoNnyG7KjHM3LS2kU9YrlxUj67KSdamlDuQD4VjD/1Ucb4sEIiZ
	9PCISnULqE1emx1/QqZYoCCR8bhtvko1QbN2lHsHldfVYwhEEEkN1qb08bgP3dWDXQXs1qmmDomrq
	dJ2/zKGhYa/LpbltvlIwUOn+kKN+xCJ2rTvV6BFqaU37+NI9nPWmEhGcCE5AaVlDIBTMhORSyOh9m
	w2VwY21kh+f75aiqluLQcYFFX6jRxbrH8k/Mo76GOq4iUeBdOWE25hQ2C3F8Dmq/09lnRkyLxgXLR
	+6s88ysKyhvaCAgPsFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtW-0000000DVBV-3Zxq;
	Fri, 21 Aug 2026 14:06:55 +0000
Received: from mail-swedencentralazon11013044.outbound.protection.outlook.com ([52.101.83.44] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtN-0000000DV5h-3yH4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBXdwOpR65hru9rx/tOgR3J2+VjSHStiD+JQ0xCtE5bfuXGBiKdItzhHU/n9Luwn6py8X0V7MzoRaXaUCY255JWQGzAuhnftcM/yW6Fz14CZ3XOQo1bNZTjVOWJ2va6IrCBVw2HOVUVZ2AM4/cTj4hkigufYLaqQAELOhV6BCXPg5tWwDtUBgb1Ov8x6nZbjWB5YbGgrlwEKxW1ZHaeMhVOKCYNyaxrK833UMeqeyfu1GcX/yFV30Six2DEC28TftWCNjQbP4Bq2wNYinEgL+bnPJJ4Kot2ZbJr/8pnStoqiVv438c9vRbrAWnx3NJcRv/ywGVeoeOG7NxAeCYWaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw9wa4GvzLNM83Y7tsv27/tR8KAy9MuhrhvRtLgNjUY=;
 b=SGsq3YLOiakQCI7FtTIN8VIWI43CGFVeAL9HGjrsiXg+R7Kx1BAdh8iO2x7REGJGniKO0djD4J9zcKMRqkyzjSHqRX9P4phZZ6DNLGSfS9/9+jtbuHViXqxB7RmahvCBjPHoYxDVnT6noB/T+yj9k7u/ndoWF5R2ZIUSQafgwTJteg356jOkFv9Pob/thB77X2ObiYDSgZqAiiv60tePT8ITFdr6f16iHvJjcWCvRg9sKBrmaEThOR43x1bTnYvzVjEjCfWA9V4B6Vd/nNcMPwXQGUtpnm7rwJe/UfNlRAd/YM+zZsd6mOhYmK/f1KoPgXxRbl19Fuz0TSDZpydRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw9wa4GvzLNM83Y7tsv27/tR8KAy9MuhrhvRtLgNjUY=;
 b=Fgo6zEFeTBGiQjkPBMLKsF+nJu3aVobCL0fr7z8jl8flQBFxopNoLdWm45y6If1R5zbEIUkPpL+KiEN2cwc5iBGtZMyYSDPULzH2Buff7GykgXmhls+DucJDnvoGBAYlzYnGkcy4veeHw7y/yNNVldO3mEGIvTp407s9bWcvYfHgKtpbr4CMS35eGOcqbSDwwZD+WKah8GK0ezIeMsFQnGT+H2RqW+dIpUZOlqP1lQeUzFkGShu3D5YFdilAmiOZSkrsDmYdRDGk8E/u/Lg1iJbbKGZJBC5sp6j99+7VPfYe/WL9bbeyiJPlFC6jpjqkfXrkDg9oHxHUbAa8dlKAqw==
Received: from AS9PR06CA0495.eurprd06.prod.outlook.com (2603:10a6:20b:49b::20)
 by AS1PR10MB5577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:475::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:06:32 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:20b:49b:cafe::1e) by AS9PR06CA0495.outlook.office365.com
 (2603:10a6:20b:49b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 14:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:06:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:11:22 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:06:22 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH 0/3] ARM: dts: stm32: Fix STM32MP1 ev and dk USB onboard
 HUB supplies
Date: Fri, 21 Aug 2026 16:06:08 +0200
Message-ID: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFbiGoC/yXMUQqDMBCE4avIPhtIAmrtVYpIYsa6fdCS1SCId
 ze2jx/MPwcJIkPoWRwUkVh4mTNMWdAwufkNxSGbrLa1flijNvH9yDukTyE4lYzSqADXtNpbR7n
 7RvwGOXt1f8vmPxjW+4jO8wKvnLtRdQAAAA==
X-Change-ID: 20260821-usb_fixes_vdda-v1-0e5eea790b2a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AS1PR10MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 416f8e5c-7dfe-4f53-0b37-08deff8d6768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: D5RCBM/CmQM3Knq0A9Mehgh63hlpGWbCsM87LesWIwBEf9iIGxsuRqX6NrWv/h1AoV9wdjnCvLGiDiLrm00dTpOCVweEcWjHqtqgAd/ZmKH51hYt57v0WIj/kXqDCIyw5+AUA7jhovDkzfp7UhZGk6RCf52VbVZRolnpTnVC4DtL1GBPINtR/g1kY5wM6tNim4sA8KZ8LgquXpeoSrO+mCqpAQ0Ss6KCNnhpxgr3amzsaOHGDczr7G2DEr/R88E7rskHssWjO/kE4e8RI+TCp+sjAp9RBgUI17e4EmBQtYbrVRPZdEeuuQfZ19FBdSPfkNCWsO1zbi2aL2xNdpH+RifUzqjGWMda9EJUtfsCm1Z+BlFwvjy+5ERw+H89HoAa+n7r/nTrqwC3udpfkA4003pdzihTzuU+Oad6z6rmv3U+eEj6OFbAlheOvsZfmwZaY7T/aaaEB0tnA6lNIP745+IIPmAynSquZ/33eyI/Rt1/u7SJnjTQbsgaV4fhQpJ/bwVLVrOoCHkmlCMdc9jrzNDrq52k9C0u1RjfQVF/WfSCQGNXyjtDMfgXyObjdCg5EypjmZWRu4i0Br5OyE3RUdLKSll1xlqOOylG17KUmqMQ+CCLFPP/kJfm3UfRVr2Ik6M/xVJSc1DLVEM8Xhs86LuWlcv18Smu51cjRduEi0QUug9wbN7utQ5x3S+xeLBzhL4z5it9mSOJctvZ1Pfm7A==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sInGKKlrWfonhHaGS5cUTOj6yMkmcyso86hpaFeVxBvO3l2/IORt3frliazFFXVMWLtgma6Noh6rKwxN+8YXxb+tI89l7TuVkSBFnvQM9eJ+9oV97iFUegXfyrjk0MEKBzHV6hJX3bkyQpF4JN7vYGOfaWTSmmduiVhS8uIsX3B/MJaVZ6hp4X4S157bpR888tlx/3mgSfma9L4jPu9gvjATD6C2bKOuBy+iNBrLSFqArKVT+mF1AJVO/L27pBEqoCDHmt0GRUL0jZWVIIrl0ffi4RR3cA39yqM2Q8YJiS7EeYihITyCb1ibtjQHPQTbs778F0Xckat3ZFkasiByjdEKXHvNx+EEDZxd5ti7mwu7cQkQmdcDhISfeScyDYil1ZOfJgtmQXCN1vA636dZJaCJb2LMr/BYsgoGesYBYvUTG4K6kddC63ZE1vVNc/UP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:06:32.2277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f8e5c-7dfe-4f53-0b37-08deff8d6768
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_070646_000211_58FAA58C 
X-CRM114-Status: UNSURE (   6.91  )
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

Some STM32 boards use Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Before this series:
cat /sys/kernel/debug/regulator/regulator_summary
...
    v3v3                         10    9      0  normal  3300mV     0mA  3300mV  3300mV
...
       5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
...
    vdda                          1    1      0 unknown  2900mV     0mA  2900mV  2900mV
       5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV

After:
    v3v3                         11   10      0  normal  3300mV     0mA  3300mV  3300mV
...
       5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV
       5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
...
    vdda                          0    0      0 unknown  2900mV     0mA  2900mV  2900mV

---
Fabrice Gasnier (3):
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK boards
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp157c-ev1
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp135f-dk

 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 1 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 1 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260821-usb_fixes_vdda-v1-0e5eea790b2a

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>


