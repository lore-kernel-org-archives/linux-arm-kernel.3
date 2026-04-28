Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B67FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/LS3cjed6wT/ve6oSAab5MfP7jXSZWFqsiBBYZ7azLY=; b=RTmSSSbuRrwexpEFqsIvJfpBJI
	/vi5iRplpcdhFCH+Er2eksEKI3TFWIBPnqZ+SS2dQd6o6L3P2lmS8nu9REIs3Kku3TqkjYlRy/1B5
	H7d1E9MF08sijqJaNb2yp4Gxei9gIK/aC1uCxQcq+UuWh/xV6xRMsPHcz973jFOIpA3yyqaUkJ6Jb
	QXvvGtgJnL+a+XaFzNiwkqqNqWzq4ye2fCVuwxMmgqz/aQ4XXO9WAM60Yb2oaYTWCB4TRtJoJUMmN
	v8JFElyLfsL3Abu/IcQsMXk3cDu2TKRumPoAwqiKf0ZN0LlQc3R+l7vXGdpuFZc9y1IzKzzIvu66g
	d1E0zgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdCH-00000000oDL-27ON;
	Tue, 28 Apr 2026 07:49:33 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdCF-00000000oCQ-0b9x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4y47mllwDBUdmyFMFqoQ0jQCT3rh6IidQ81fgJEmFPhAo+jylkdWqL5LQYVmcssb4tQHi4t1CQZBfxOm7RBf152C331wy5pIGhqmuGuGydJohHUFV8VxVi6DlRJqdnRTPuv40ortIwQAC32CWYUHkcXube1G9eaWkvwwSV8FcTiuwzL9gDiVNLiFtLBfVkxfwXliHb3TFL2sPVqgVK/bO3nkKi5LHz72UeBh45DSHc3Y/TMYB99w4N6ly4HiLDN03qH+ttFNPSuDOycrvXvLa6QbKgjtC1z4Ex1ylTZZT8uQsw9Es2XcQUdMdHGc7S42knTn9ota6UmLPsC/915tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LS3cjed6wT/ve6oSAab5MfP7jXSZWFqsiBBYZ7azLY=;
 b=u8ZAgCcI+xUAvjNgwidtpnQAgxp+GBr/HO2ivd0KlbRjzKN/8aHO+WirNkkRgZpXveXRJfnO21iFNQqGCPd1u/GGGtWUgAWFg/2J7j7roVJk7FPdnnAKUBDwFC3XiYDtJg+rsWOEcwkllVeeqw4NtCn46ckHpEdTu356UrGyhOWZQzixLKmdTukPfpktFv6VKaJGQzek1bDR0UM0GjKp6Rhi7XTg0UOZOe2IJ3NbgL9SJb4Q709cvRXCAUOR7dkdt7SRVF+YtTYoi8xgZuhRgND5hmeMzrG/cVVeiYw4TlkO3UYNj/cI1pea8sTM7NPfa0y06SxRbc8jdf9Lq2+RTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LS3cjed6wT/ve6oSAab5MfP7jXSZWFqsiBBYZ7azLY=;
 b=UlLr49A1IoE4ZU2bCaBgo24YdCnjFMetlNANWYuv6vOOie9UBOyA0Tr3uNC+Ummx7/HTVh4C54GOlxaDSaDo70iBDLq7wKxhB309wTVMJuGrrEDcMER0dDy9PV0DovaDLKkyXE1sG6cEHFCG+KocKvxvDmja8neoKMdLDi1sbR72fkydFqbKjWj6/JTeiXxbrYwRrP8L33d57KSuebyJAAnzL6uonYkhnsH0VaZIPahYqGwaaFfWhWxWSrcWKDJqHhDE7dQdWMPcboRG4oAD/s6HUzZO8jSHB4zLtgwcrmPO6n6p+RAC1sjGVEEkiE6AwbS4452COytr4gPB/NgbLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by VI0PR04MB11024.eurprd04.prod.outlook.com (2603:10a6:800:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 07:49:21 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 07:49:20 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add root port reset to support link recovery
Date: Tue, 28 Apr 2026 15:50:27 +0800
Message-Id: <20260428075030.1626440-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AM0PR04MB5220.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5220:EE_|VI0PR04MB11024:EE_
X-MS-Office365-Filtering-Correlation-Id: b7957cbf-196b-4f45-f3c3-08dea4faa80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|19092799006|1800799024|52116014|56012099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: RKOoJP3Ihxewdo1Apg4sYIDDk2VOu+gaQLnW2NU4Cs8mgeYmt7ALBdD6ifwNS/Y8wIuDRKRskjpAWmL7DR2fn665MP9cZUNPsw8dJwyw3MUjfK0+h/QOl2DQFHSjB3gnCoFPg4m4QVckY3SrciODky2U2vKysHncMIYfOdxjzGbk4iom94lMmaQ9oGaF0QrRi8yoHijnZIF5g6mLgna0XlwQhkWgs+Uj0kRZYEJ/TsCB3dGc1gQ084t/GUTmwhtMMx6SF2p4Z5t3tUG5lIVnXTr8OnqJG6xA+Bi8G1iHHum9bByaJgwyKZL4OpCoPRngNviUexXtlM+1u2lnqM7Gfq0a0xXCoJfUmsdgzy3EtCOXy3R6IPC4SQzsuRSM2Iv6UOkiZ4o/fezsJcaE2xzwh9GS9ocfzeomFn9Ehn6lAmdQg+2VxyWhJqRykU34PKJFl7LAmuEULKGgYeSiwCrFUeVR20q93HTwmZ+wVhlli/OaiYWLg4nTo1d26EIWLhiXoDec+76Hzod1kxKtFDGFA7PW2ymoz0ri/9WsIHDiX3KRFv0q3973+IiPHrBgbUnXTe2ZykTlGh47DjqUNqfNHa0/eIdUVJNz/Rj+HCJ7zI9qIU+B6iiPV+Td5uyVQ6EAZ5doynfxHrJyDiFGVHLg3cIeIokQzJGzjGIzwaO6q1pq8nQagGw6Q/x7QeSv16uGZtmyBDlfISm74lngoYWowMgI34PvbeSu6Yvm1gCsT/KKw3pT3ME7NXBNAWp3h7lfg07Sr8LOtrwUS130OYouYadnCgEWBcuWD79hUFIZdFaSd2M4hwhEjHUS1L3x70Yz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(1800799024)(52116014)(56012099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kGZxfR4FDWotBT38W1ahd8PT3r+s6FZ5a+q+nKwc8100UrWN6GySyXOL2pNt?=
 =?us-ascii?Q?H/7DAEtM8D/wmoYbEmf1e97TAs8YuLrdEexymp4QxzIQ91tWHp1fjLOIXfS+?=
 =?us-ascii?Q?g08dnNoECtOMPqUS2TQS/gd43n5RHLNV7dlQJd0lF+vDxZdSr1fXmDWHOEF8?=
 =?us-ascii?Q?klRs+t1pXaPnQ0ua1kv2+LutcNMKDcQy27bVnAQovPQuPgJz/66xWouCGY3M?=
 =?us-ascii?Q?zA5nmGQ5LZh77MOnWxqtRQIu8OMYPexGzhOdPO6gXjfxXKQ/etHDjfdAhbO3?=
 =?us-ascii?Q?34jI2HxY3ee8/VS3FONY2R7mlPx5BgkTE/mhUQuoKK9qQhRcHjpQfzf1/7AH?=
 =?us-ascii?Q?8U20jSjX052tQ1sFNwJ1gQRd/NcDeo2nBj6OtNGFJdKf2bazkafHxDVABh47?=
 =?us-ascii?Q?a6Wxpyx7BBoL0NGvScsFXqpG+EZ0zEQiblxTulJpVdBGl9Ipu7lMiSJ22Jct?=
 =?us-ascii?Q?qa/I/9WyhYLNhu7wAUzHChfwOeF3ZUyfbwXqFHa17b2GPNhycjD5BUwmRlkO?=
 =?us-ascii?Q?aiacK73BWtIB9/mAJ5JrUzFNxodwbpDL6f/IWWsBm9VOyfzKQQwxgTKwVCF0?=
 =?us-ascii?Q?bV6jJq8plVl1J/T37ygDvmYsFuFkb15p0ovLx9Clx/2qdPdIABWsilx+jgK5?=
 =?us-ascii?Q?ffbNVW+cG3ynRO2RSxFSw841Nv755YlKm2QhbYnYowTOGrLffjzMAF6ugD/u?=
 =?us-ascii?Q?WwwuQ0jcci1fDbrWB4lWIh2zayr0/Z4pX098L1qQwnwboUjMmk6MZPQ9U+Hg?=
 =?us-ascii?Q?TbgG4pKYpGPCEK9e8OUqMwl2xQxaTrB7PlF4HTV7b3a8bkISZ4KP+8LdLOAg?=
 =?us-ascii?Q?LhZ5wfuXqPuLILS24TALiiaEjbZqH4XN5Q+K1fbsIWBPseWcObL9fAdO1+A+?=
 =?us-ascii?Q?Jf6BS9oGF+gavslw8G7drx/ODWCqMTEfdqGbhtcJFwuvdQPMNuzfBlrLCC6/?=
 =?us-ascii?Q?23NDpGjSfn5j/fJixWNbU1y5cKb249XHN6+o5zN+zSrEAi8CtQvEtUmxMEBl?=
 =?us-ascii?Q?FgWwnwsTXw49DfCn/KDWcwbbfEu8Q9z0p0GnbpqwV4ob2BsxVWVxBybzOFEm?=
 =?us-ascii?Q?7hkCSbD5qMJqzauyCV+02SClR83aXLdQCa4zUDANJxDub2IxOASpLwKgVtCc?=
 =?us-ascii?Q?N7dxCIRHk/sUcKw7Nk23Op/3zitQ8mtkRCbloEuGY8PbmlsnOOolyRTf3ePS?=
 =?us-ascii?Q?R5y1f3p2CekURZA4RvLACyEqeQlgPg83KK/uGuysqLn5AS7PewmzfgIz1Zz0?=
 =?us-ascii?Q?2ZIfk/lmIn7QSonPpzRhQP2qjTFov8JI5T1jIOy7lWmvrmRZadp/VJWUCVe/?=
 =?us-ascii?Q?z9GLJqNniKqZWYJR9uSxjbQ45UCKNTooB5qOvQdD1rMiDn5aQ+3kxGRIw4ty?=
 =?us-ascii?Q?L0sfhXTKFoJyGA5Aw59h1botZ/oJ/rwGxkfDBuqypil8Cm+IfGysrDL4SnVn?=
 =?us-ascii?Q?qHaw9RPsB+z3ylH0Pl5Kpv/mn/i2fN6HFabYgvc4CEOG/fQiYv1WrTF1dbfR?=
 =?us-ascii?Q?cUAR/fWX6uHttAtxXuJpoNuOvzaepz5DSQZpwkgtytow59B59Yc5iDB9pyR7?=
 =?us-ascii?Q?T3U2mbzFP9wPBeJKvVqgAlnPAo/9BNEXVAg1MvzU+HhijSVqC30YFp/+D6c6?=
 =?us-ascii?Q?b+ouHxSeRQgNwaYRx/O1IcuPw5b79OE5sFugC9vUt0VSxc0JMkOVfzR/ii5Q?=
 =?us-ascii?Q?ReFzPQVmTALwhQAapQIfvSIq/YcgWekpd0GSJX9DvYD8TKgG6CDPdHF43sfL?=
 =?us-ascii?Q?fPZLseFKiA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7957cbf-196b-4f45-f3c3-08dea4faa80d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:49:20.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0Zvl+Bz9r7nBAS4IsS5fbpXeyq0YFI/vOCVSmSjpRimmsXts5xdtGaZjD3KuN/b8RunA5cpM6GyYtF0YRd1ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_004931_216253_32EFBFE6 
X-CRM114-Status: GOOD (  14.20  )
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

Based on the following patch-set[1] issued by Mani.
Add support for resetting the Root Port for i.MX PCIe to enable link recovery.

[1] [v7,0/4] PCI: Add support for resetting the Root Ports in a platform specific way

PCIe links can go down due to various unexpected circumstances. This patch series
adds root port reset support for link recovery on i.MX PCIe controllers when the
optional "intr" interrupt is present.

When a link down event is detected, the root port reset uninitializes and
reinitializes the PCIe controller, then restarts the PCIe link.

On i.MX95 platforms, link events and PME share the same interrupt line.
Link event interrupts cannot use only an IRQ thread handler because the PME
driver uses request_irq() to bind the PME interrupt directly with only the
IRQF_SHARED flag set.

To address this, we register one handler with IRQF_SHARED for link event
interrupts and manipulate the enable bits of link events to ensure the same
interrupt source is triggered only once at a time.

Additionally, this series adds 'intr', 'aer', and 'pme' interrupt entries to
the i.MX6Q PCIe binding to support PCIe event-based interrupts for general
controller events, Advanced Error Reporting, and Power Management Events
respectively.

Changes in v2:
- Constrain the new added three interrupt entries to be valid only for the
i.MX95 variant using conditional schemas

[PATCH v2 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and pme
[PATCH v2 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
[PATCH v2 3/3] PCI: imx6: Add root port reset to support link

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml |  21 ++++++++++++++++
arch/arm64/boot/dts/freescale/imx95.dtsi                  |  16 +++++++++---
drivers/pci/controller/dwc/pci-imx6.c                     | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 156 insertions(+), 4 deletions(-)


