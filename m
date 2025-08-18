Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EBBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4lj3V4DiV2+yX/SRpC3KAVqZFjIFUQtEjA0DWLfYbg=; b=qqKxuIn4bTczxJFhCGXAWYzmnG
	dEeLyB/hw18Coqotxzt2dJRTZML/3dfeaGd0qBb8VotdvSsVDFEL7tdoDVbGfe+LJB7s+hvFmN/2g
	/11VaXyBO9yzmu2RYKkexyg7WueU8AwMIsBXsD+RvbwXX4AsYZ9bwlJKUafBza0N0j/RQH+OHwasG
	DCMLZneGNrLoBlL4HOZ7SFmFKrF43faCnpE/UjL5dAl+G9TTNo43Ag/bp+2/ugwzXNjFXsc0G21U8
	it4Em3/5oTb3XbBwMTjXcV0IeieItUsfqGzAQKXWl2qJnKmovx6rPVZJhxhvvTKX1cu2R8SKivs19
	PkoYyf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuer-00000006qEG-0hhC;
	Mon, 18 Aug 2025 07:51:57 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuMB-00000006n4t-2t3n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 07:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqtOy2Rr+t6IW01uKA3klWQ8/gfmH8SoPIhwQI8v4E/HEobx7GflLTlG2xPJIPRvh6sUSvHUUkPOK/tB5Fmz5mPpFPU9XyhL+SM+3H29D+yGpTsSzyVBW0MEgvyGsN3MPtv4GnJ0Snukq5YhqD1OhWnO3i+L3BF1gnHDOBUjloHFVcC7hesgmc8SOUncS1ZVVJIwBsQVgrUh6QyhDwUtMBufJq/K5Heoca5iWpJk6RuSY5H2tpbzci6xuk941KVTGIoWj9A9SoOtrYDDjxLCOKxLbuu2AancUU/x9zssYYOmWyuTxOfP4jGsqyxpA97h6bRGinil6QcQ/osfnxLCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4lj3V4DiV2+yX/SRpC3KAVqZFjIFUQtEjA0DWLfYbg=;
 b=eUJ1ZVTc8q45z/7BuY3hMG7tJzGpXILQPjIsa1m2LMwReDnoNyLoc+Uy79YLQtamkb71wfn0ezgvWm+AF2/XZMry/r6rIACsRe2iIJoGxtILhvV8rrMFTgnyD+fKqGF8zK47x6QYQYSzq42jrktJC0ZPNbvt4h/PoT3CI11eUiyn/xzMODlhe2Wi+Z4qaMpM8G+I+9au8X9UGtp/xNWybEqitRJi5pRkKP0APkLdpvPNeF0bY8Gs2zVWRD5hy0WB+ZTY8YniQg1GYoD0K5gdOUkZciuXtkMF9l6OHFPesVdEt5qXvTuMHD6YweGqKeTvksrBL2HxmGs0d3lUGwhpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4lj3V4DiV2+yX/SRpC3KAVqZFjIFUQtEjA0DWLfYbg=;
 b=AEduMI2aQGWDOmCIvXGlUCU5nLzUEax+1zY8UBpz7xPhbhVjxJoyTyw3I7G3nHakfh5sHozyzNs2KuAUXYbKml2j8R1AvHynxWLok3MwsXznALuvdyXJshSt3ifIj6PHOSou4TmuWteGzJwkOUjoRQTtabXdWnnOp/SwdNb+WwGsGuYarVNCIj8kTiuOWYUv92MK/rsbgjKieb3CRu//gS2Rztw31Y8miaJaDZkvDBFdqs20PXzZ536tSnXnA0RH3HtKVj8oufBc8UBn4jbwnOodYn4eHKfLktwtPbtsO431JMXuWm6BA88hTQRfLr3ZVUUGfB7e59z19qtt5VQEGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GV1PR04MB10533.eurprd04.prod.outlook.com (2603:10a6:150:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 07:32:30 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 07:32:30 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 0/5] Add quirks to proceed PME handshake in DWC PM
Date: Mon, 18 Aug 2025 15:32:00 +0800
Message-Id: <20250818073205.1412507-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GV1PR04MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd7e9b0-b481-4266-9c06-08ddde2963bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ixxm0JI1hqzn/SOvgHtP3jVBz3nNXnTsPKaR3/4uzN+OTRSt7EAt41RSvp79?=
 =?us-ascii?Q?NjADovywfERlklXEuaOEnJjVkS04WBa3zRzpRUwdstcW6MpjNYhpMm69t93K?=
 =?us-ascii?Q?Y8hnfE2iyfiGHVl5yDpZnbHug6/jKIlFn0Rn3TLcHn8SZK6v2Co6HS3Q2iFt?=
 =?us-ascii?Q?CKxBxb08kph1YLKW0EG4YNKhNSTnJKdhJzz0aPH/0vDIPiX/zgKg7lLSHND4?=
 =?us-ascii?Q?6fuaCIh12mlH4wYtIxia7pHxstYVKMBcUFJbEUYUPqrpNzVNPKkTIvDUSHBy?=
 =?us-ascii?Q?rw9sKqWDkCwpmK++TvqoAi9D34LgXVDdP87jdrOJxQYeL+xBYtoyS0elrupm?=
 =?us-ascii?Q?ceryLac6pa9RqZX6J3ANH5RoT0iHhrJ4txsJF0MS9q5FGdoT7jor3Vkxp+Xj?=
 =?us-ascii?Q?WC/DPH4RKawqdev7DYdM8kRqs61zbQ0ZqHRAOY1s0zjbPxz8rgsL/3wKeShv?=
 =?us-ascii?Q?V/7VfWbqor1erNg7r5xPgR3X83UeeX/0dmAh7ESp64VMWIeULNjm+WZIZXO1?=
 =?us-ascii?Q?I41emCW6b4hHBZkCkLCxdDnHCEBy8+Kgtx49Wdsdax0RT+Vc1Qk71tjsY0Jt?=
 =?us-ascii?Q?YissERxhVxfmNY8CcALKbiY3Km0iUUVibloJsopZPnJla8sDNE0KaZEmkBib?=
 =?us-ascii?Q?QQiLvk3zfYrB0AigG1XCL8EO1bd9/Iq7k0MciMir3Z2gsiyPl8YZh+9XEX4W?=
 =?us-ascii?Q?jfzrnMKePS2uzcaoDoVJs+tIZTt8b2Ozw+xk/AXo3JWh5lFyZNhxArcIB/Lr?=
 =?us-ascii?Q?8DSjYcq+vGE8i5o0FSu31E/f3Vm99niVXHic7jIWr2L2p+fZJB9Dj0uyjMEv?=
 =?us-ascii?Q?zRLmI+jsidXcHSukb9LLxDgDfbjucC6r05510xhO0On/yrjOMExxmLfPur6O?=
 =?us-ascii?Q?O1ErG8ul5oksjrPpVqCDogOBO8gTZEgIfPBrfFEyuNxiQdRmRPbmjezQdwYD?=
 =?us-ascii?Q?qtwJZnftt0uU7Iw/Gm64p3StFlk/r/Oq4jf8/0Bc4plQoZnlCGpRC1wsmqiO?=
 =?us-ascii?Q?BNurT4rLFhrANxetPh4fs7Cf4uvdwfRjygaBR2fGQ8KKNKzuwd9v3ngU2CbI?=
 =?us-ascii?Q?7c+yKqFDe/HAFAHG+2f/Yzqvo9Hj2UhyGp3cmA0cxYwSW008y2cDCklhXYAi?=
 =?us-ascii?Q?VcP68tNH+Elp2wCszJIBwO5OOjOB/T+vZLCZhzSNf+fylm9sVzWw/VJtuRz0?=
 =?us-ascii?Q?CsVpTzVwETsXC44yNkRkWGZmaH3MGSDPpiywagCVjQcu0vcxr/vUlmwMB+6d?=
 =?us-ascii?Q?xeeCPqcH83qszunjksBknBkhQ8DBsxARBv9rzVmXyAu0HNYNYbsMRmu5MK2Y?=
 =?us-ascii?Q?v5xptJFGAMW1vrKnBfEqKSTKUw0zMzUzSqI74Jq1+zoduujTxArhPk0Nl7Tf?=
 =?us-ascii?Q?8yHUeuU/nkthEFzRdQ0vlXwX34d0v9aQHQrj9s3K6jbcdSHd/31gGIhMT76y?=
 =?us-ascii?Q?FK961adtu6GufdvcS0K1UH3Sc00Bi9xhtJ+olSE1JoovcGS87tJaVgdg9w3/?=
 =?us-ascii?Q?baQeYrwRsjDqsH+StXL9DBXDeEMZmrjlyBGw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2XtUyKBvXbCLAy8AW2ya8+fop+DD6Rrit1Z60gNaupxAajx6k8UfQ7xMF3IK?=
 =?us-ascii?Q?/ag7Qmjt71/hpLDNcYuzJtN6j8H3eZJ2LPc85mb8II26RSvxDOzEoka49b8O?=
 =?us-ascii?Q?PGc1Lnf7RP2zRsuSzBp43xnWob0OSWBK+NaJYVQ+Qp/CSGrcs4pJ58OM/VIF?=
 =?us-ascii?Q?/xYcWKrqFn5ofVmaqWrh1e/0GXylPCfXHo9RzXRJ3tBMUrETUPrWCPYWcber?=
 =?us-ascii?Q?V5h3HtolzvR3q1a/Cs08dkbSDCRHX8Vcl7OlwWP45YVL7dF8tBFrQk1P6pcI?=
 =?us-ascii?Q?uJ7FuQpKhgZXgCyzjyJJoF3KCFkGYdOJ2RdqdA2KkPlVg9B9g/uSmpVonMyf?=
 =?us-ascii?Q?MTp3lNTcO58G4atxeVdNvsgH/YjVz8f/fh6qgKQUxGebLmR3iUyhGH4wsXfr?=
 =?us-ascii?Q?m4Gu45JaJUfhl3iXpmuuZYvB61PQGOwcb7xg+LKXGCX+LvbuVJOuC40ZxdxW?=
 =?us-ascii?Q?rR1/FHpAQBsSkdOBPj2AXWMoGonp0ZrRSjEhE5xBXf5qUGz3hqsQmsRVI7bq?=
 =?us-ascii?Q?IME0IAqIKqWOCxRXPXfv0jARtzCQhA/C5u0exiTu2UohPJIm955u4U2wPsf5?=
 =?us-ascii?Q?HG2jOFlk97MbmWo5UOT/Y0EccAAAEYZKvHZGz2yLo1/s4StHYF2X8xn9J2FP?=
 =?us-ascii?Q?TKo6Zqdm6dGDu/+SDou/XuKrRwbZ15ICKoIpom55r/waZABbaVfqoLeYAuem?=
 =?us-ascii?Q?pCYWRp9+XnhmYyOF9nG9Evu1GrO87q8pILyhtz+9+Qo2ESMhYdKcll3mtDg9?=
 =?us-ascii?Q?aQS1HjvD0X1v84cEu2/EQK2MQ9tFKzQRLCzdD75K1SBVo0XieOs9ZYJgb8W4?=
 =?us-ascii?Q?BhJblsZmrV4grGta5ZmwT88jMBS+eCchjEZYeSCkpLUnzEipDI92qkpgF17C?=
 =?us-ascii?Q?oF9YX/FShre4z3wgSDuhkdXHhVRYDAXamqHO/hxvO/YTlMjAN4OiaHiVmzWl?=
 =?us-ascii?Q?jPLEzHEyGqU99aEGEeK9PElYggoZJpvdJ+QSEbY3jV+rGiHI4wM7MU8Z6luo?=
 =?us-ascii?Q?rLxuvNlrQ26Ud+ds2SBS0RuVaKX3Hb7Pq+zPQQPu1eBqYiZ9wWs2KkxuKEq4?=
 =?us-ascii?Q?bO6cxvTtJBWu/jq94gwXdKY9eS6IbLoiYd4jbARGpazwzXxbTwIVfM9eUG7/?=
 =?us-ascii?Q?C5LPhBSph3arZefvPwg4LgGhAsyVn8Vc0rFIOzTDNbtblGn35WOfjMGNVB/+?=
 =?us-ascii?Q?WaLoEqp4CDHAPV45NTg2N7LUKzGGUi4nGZmHK+daMSFnMF/hSFp7ovzW32rE?=
 =?us-ascii?Q?6dL8Ux07tED2sh7gY11ZFunvQHTAc8tsWwaev59fay5zERn2KQBSEaTmKvjW?=
 =?us-ascii?Q?BP3itAym1HsZchDjKs1fT0tg92Uj6lQ+MoZcdYRcbb5PiJFMhNre2NV2t1Kf?=
 =?us-ascii?Q?unND/+V1YwJZliFZ3s/e7XYFaU7aYe4br949Ql01w94FheFJ3AAvDhSQ7T9T?=
 =?us-ascii?Q?iWSmF4ZkNYOJlIh7edFoeOrg0U2lAoyGoJCWX0lGFBQq/Sp2Owln9c4QLOqq?=
 =?us-ascii?Q?/1La0WOEYCXTBYGYpfBuVdvr0cDg4HNMjURKcTp/+aJMKW9fDfcxPlOEPkK/?=
 =?us-ascii?Q?L3szx9mNw39W4a8+PVTK7CBlHCBrv8x4mXjzFJ4L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd7e9b0-b481-4266-9c06-08ddde2963bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 07:32:30.7426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Qev25CYT5FoCsUNRmtnJ5VnJZRnDRW7mHCqv3CYG/SH7pZVa7xAzvQXcc74Jua2X9sPYaxo//od0ddmND6q8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_003239_868581_69101CBF 
X-CRM114-Status: UNSURE (   9.85  )
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

Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.

It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
Synchronization.

The LTSSM states of i.MX6QP PCIe is inaccessible after the PME_Turn_Off
is kicked off. To handle this case, don't poll L2 state and add one max
10ms delay if QUIRK_NOL2POLL_IN_PM flag is existing in suspend.

Main changes in v3:
- Adjust the patch sequence to avoid the build break.
- Update the commit message.
v2:https://patchwork.kernel.org/project/linux-pci/cover/20250618024116.3704579-1-hongxing.zhu@nxp.com/

Main changes in v2:
Add the following two patches.
- Skip PME_Turn_Off message if there is no endpoint connected.
- Don't return error when wait for link up.
v1:https://patchwork.kernel.org/project/linux-pci/cover/20250408065221.1941928-1-hongxing.zhu@nxp.com/

[RESEND v3 1/5] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM is
[RESEND v3 2/5] PCI: imx6: Don't poll LTSSM state of i.MX6QP PCIe in
[RESEND v3 3/5] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in
[RESEND v3 4/5] PCI: dwc: Skip PME_Turn_Off message if there is no
[RESEND v3 5/5] PCI: dwc: Don't return error when wait for link up

drivers/pci/controller/dwc/pci-imx6.c             |  4 ++++
drivers/pci/controller/dwc/pcie-designware-host.c | 50 +++++++++++++++++++++++++++++++-------------------
drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
3 files changed, 39 insertions(+), 19 deletions(-)


