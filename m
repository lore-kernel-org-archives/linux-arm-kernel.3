Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I4zWOsj2EJA9cvxq/WLfy8tagoabFJBWKA+pfoiyKiw=; b=lmwch+cQQb+k47hKcjgmddtwk7
	ieuLD0tmmXSHvZAwkA+2sjImYbXDFknHKDb/11qM9LPkXvh7oqjBsXsxn5bMQq6b8gJYH+qy6Tv+m
	7JT0WB7NLj/sIIvt4KRy/SMkRc/+XoT8q6CQMb+GE4p1gpAkMuAGT4mHycs480jwpSi5pDvbxPcQF
	PxwqsdW+1MZuNpc1GklJMOCgPiBsoxAG+Rssxiz6Rl4XYh+KwfP3o0ONZJou7Do5OI60/UaS6j49J
	trs9Yv2psPtIVRu2edk/T3FU+65cTiXxNJvtOozvjZD2tMWQtptHqHsu4s22TtAGggQUm6TVeK3m6
	b7li91pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHk-00000004mZP-1kUM;
	Fri, 09 May 2025 20:25:32 +0000
Received: from mail-vi1eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2613::609] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPfr-000000045It-3pRq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlQ5PbR/FbazGm4kX6VkRvINew8WZFTTO/+ePTjcSjsglnQ7jccUnMligkhXgAWL4F1cr2GsNAZSMTMa1Qx1cEvH/lx5CuaWRNyoKC2K8EofzdNa5eFSBxeDctkrhPCbhDyOVRE3lnm7jIIb6ikO2i3nLcS5VAtOGGxmugg/VTF4um15okVhAvCPLYy4X9Jlh72DhqIndBKSV4A/VFI052J2NhfOzmNit+1i3YS61PHYh9nAj1vgjdMFM2GISwpiUxLq3dYhT+Q5k0FNeHxAEheOy1pB0gna33VOuUsfG6FeFUnY9TaIjb330/qx1GSUAUgqbDDkP3U2H2Jp4AETGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4zWOsj2EJA9cvxq/WLfy8tagoabFJBWKA+pfoiyKiw=;
 b=Q4U+GJgwivVKWSEJBzNJbZ4Y8ul112hLsTBWiycnZXpSfhxhuqjJD2dO1UnQ5K5WUs3PywlojWw38EWzNXgcpA1wk4CJbC8/HJhfa8OK2E6WFr1ACmSPNT4fNrwE/VJPsSbe2hBVGUWBZdOoFY8izmlGNHwBLJc9wKUlMU8YW7qAYkTeuMCG3v6ij+KUys6ux5hEgoHlkvp0xubc+6tjFnAMhYnTqupSHCtAsRWR1KGZPF2gHr9PFvvOhufxUKlMFLEayyAab8NoQm5I6t4vEuxfc0VPUuMK4rQY0U5W0en6jMCoCkZUrtjKyyokkaTXi16a/Cd0tZ0ReUTy/PitPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4zWOsj2EJA9cvxq/WLfy8tagoabFJBWKA+pfoiyKiw=;
 b=eNDiDVtNEUeYJaf6hEmGccTKWknzaOfCUdWHFyHU2H6I3dhKYJGi/FSiK3dQYrS7Vd5GHE0kDNadvkzJ1T7kRJGwNDXoK8njV+KeXPxP/+2XtQ64JOBSgIhsl7iSnTDXTwm2dQkjhpUGZW909qoEVYj9Ifmb11UQRCsMqZsbAXcxP3Emh2Kh/JS7R++FYiWrFu2GS4vwI0nZenZortbQu1dm+LWnmbg93pUdmZ14yKXj7julbd/g3Bs5/eS9N/4c6VOXDfYFQ8LxT1GW0K0CnazJUR0/pXPBfOxWp9i0JTI0YnTsMzmK6TlEltHIWJiMlQ0oMleA+9cmvTfSGJw9hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:00 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:00 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
Date: Fri,  9 May 2025 18:29:34 +0300
Message-Id: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0036.eurprd03.prod.outlook.com
 (2603:10a6:208:14::49) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 639d01a4-c0bd-4aed-8421-08dd8f0e5cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?++oV/o/zxpcb0+sLDANvfyIKiaROcxbqAViONDuHaBCVxhr4HEzuen7cBBWD?=
 =?us-ascii?Q?EsmPHejWhd1Z8E251//ucAbWox+Sg4SlZBOSC9pwW8K7D4kunp+zuSRrtP5c?=
 =?us-ascii?Q?Ar3dlQPhqKoVuK9/ySXqLGDNjRavFX0MlLaQeHaNTLBwGjMYncdfJ27AjCDx?=
 =?us-ascii?Q?RWG/0cmvYSo5mVzDkQlxjKpkili1pHAWI62k455hoM0IArn3OvU+hOjF1+bK?=
 =?us-ascii?Q?RCWP0Gz0TM+bRSxMcSA3dZy2eqfeU3oi7cxidGpBuTLvYn5zqfxQ9KumsTEj?=
 =?us-ascii?Q?a3C1kqDg3GTadHZUXHxvcGlwc7JtJNqX/2XLz91NhHhv6T/B/H2QhNWdb1OR?=
 =?us-ascii?Q?5P2XKfd3k41saz8AuhF6VP5nZL9mByPCl3g4cOWKjelMtW7TEVNLE+6LKsuU?=
 =?us-ascii?Q?QCG0VAnfg7jLGx4dohzFGe2HsCpiSA1ukBJ5ORWyWPljEZ8a3CNWPQryZUFV?=
 =?us-ascii?Q?JzpMJIe7anJRGs+TJdGAOCKIMwKqypLWBdpo9MG1nHNxhTOShZMnX7anxbUD?=
 =?us-ascii?Q?n+8yevVuBLlOXbdzHcAg0p2Cv2DuYFgmfOm9x8Iof941LyJcOeHJmlG3mnOJ?=
 =?us-ascii?Q?4EDe82YAHqG9Qxw8EbErn6bgSq7C+89QmQaUh3V7bYKD0PwvOJIskygo9vj1?=
 =?us-ascii?Q?bmgsZOitWBJegfnQBJfJ14bQTEsoQZtCOAZA0Tdi1k3pzEi+gSn/CkQh3Kji?=
 =?us-ascii?Q?MS5AOoJCCxNCN3wNNIEZj57JoDYe+/V0igX0uYvLpwKqCh5XPJVbHB9XuOCN?=
 =?us-ascii?Q?n4l+UUwAgBnSHEIR5hiP19u3i/Xfq3YwQOUYj7AyQWPzyJY2Kawr2GSWtjU1?=
 =?us-ascii?Q?j0Z09K6rhHSnfAkMabj2HRspJnZPnzzgWpFusFmWwrE16ZJ+g++FrjZxeoNf?=
 =?us-ascii?Q?ri+Wi38YmK5Y+0Enz15aaWK6CAFhukSuIyTSg5te53RkJg+0OEx35c2IqzFt?=
 =?us-ascii?Q?XYOGwTvZAcOJAlVVjyXAw+3ZWjIo/YouZRix3m5dVRUC+RaChGLM0De8cuuK?=
 =?us-ascii?Q?pW6jtAid81bIEOOXDLM1NLkykZaJvJBjUBCVU9/ZI4zf039WNa47IEf2O7bv?=
 =?us-ascii?Q?jcqVBUFHagnjloyIes4rJbv3xBb12loRwiBkhezvuRrUkA3WR7zFJwL+UP/U?=
 =?us-ascii?Q?Cc0t1BnVXatjiQ6UGwebxLTqBkKpuIzurMGvxIsoB9sg49jFfq6C+8D5Hhyf?=
 =?us-ascii?Q?fEKt4vqfziUWhwlkfKx76fHTU5q3yMVJV/swuKnizcp9A703iyhQIPjVzU7j?=
 =?us-ascii?Q?ptIh94PJw2Sm4TqdUpTup9waXJ2loaiyd2Jk2O9IQtHFgF2cNh66RxmiWk2p?=
 =?us-ascii?Q?bbETojk9J4cgDenTEO7DTxDRR13HOI6yRzIfs1ENlTWukssfZMEkyqIGaKOp?=
 =?us-ascii?Q?uXgnPijm6SsrR4/WckL1JDGQlmZKadwvU4iE1KSfros4pJlheAnOrTWecvJk?=
 =?us-ascii?Q?2IXQfobTVAY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7lfLGHyE9gtp4p/IAKqWLAmVLVUoG7EXkrdqRfAdV1j4kRSK177SJ/ZTB+Z?=
 =?us-ascii?Q?8QGyHu+GfijDCNYZARznaSrkaVYqkXDakJ/2tTczReREIG0M3MUPEMZFu2c6?=
 =?us-ascii?Q?N2PorxpKTYuduO8ig9TJPZRLlY36M69q3PC8OA9IV+MhpAIwwZojft1/VYBs?=
 =?us-ascii?Q?3XI6ywDk3tjp+B/eRfcb7m1qJ1h/zRH2A0yJ4x3WafP0VQppqHjhx1gYBTNl?=
 =?us-ascii?Q?iVaCuqyfu2CTTYsqwtJD41PmcNfUhqG9NxdHEX3fe4LbZpOcaRqb7FmT6nSs?=
 =?us-ascii?Q?LLLeHQoDjYTD18P9290/XxtGOFfehrIYK+G5zIcschhHKgL1Ap/01buv6Hix?=
 =?us-ascii?Q?QLvy+I4f7YkhxL/fSKHRb97opkYkZa2TWmuPNctCQBEVBeIqhwEBNyPjjEln?=
 =?us-ascii?Q?nUtEU50IMeg5ZYw6li48GpXgOxoIWq8dNkgaQfO7Ey0NiUtplstX7IaYyspJ?=
 =?us-ascii?Q?L3P4Bgj+PwJNyWjiX48Fn857AobhY16h4Lww8V3zwvlEj9aS0BRDqdvESVlt?=
 =?us-ascii?Q?VoGgsG0WtQWf9u5nP5sh2tv8k67BB1fD6n48uxKKwlNofa9yTCSqfiqbkKBc?=
 =?us-ascii?Q?PiPXgLuJ11R1+jh54O2eFlse6He6aruSexgfOk17qlh6B/E1YIh86KyyRL6A?=
 =?us-ascii?Q?FNRif36X/Uka0qUK1IKS9H41205fnhB0M1LUUvw6Y5xxfg970maJye7YCQGO?=
 =?us-ascii?Q?QTBYkxr+v/XDEKb1NmUlEU3ha2m+AryLmbhiNcGf2CeSMoU54iNU87hHjiD8?=
 =?us-ascii?Q?/c20HfYjMTwdgchdyHtIkZb/pq/dDvsCfeML+xOwU7ldvZLAfERZvvJcQDn/?=
 =?us-ascii?Q?PNAoowMhkj2KmZF6oAGDGNUmXYU9Isen2i7P1imv6SsnJ7BYRrXQyWfZvVnq?=
 =?us-ascii?Q?NwsChWPvtE8SFyckeAI3I+Dv+bqqa7XN47Pu+Wqx3qMl+CpNKnY/s7u4v1Z7?=
 =?us-ascii?Q?k1puvrHYWmlhhJtA8N4G5LeSX39TGsacFcPBGz7BLdS4Hp2VnYHlDEUSHpem?=
 =?us-ascii?Q?RjXPZqbKRTINN3bHM1HPqRWxAThnljjMEjMzCl8nVm2/oujbSZzHzhhmfz7a?=
 =?us-ascii?Q?xTWT2fCGZqm3TfKBFCMgak2fSBdQkYrXEikErtw3gn4hLJRkVOUQMO3xWpeS?=
 =?us-ascii?Q?l9fKTK9xSU1obH+3Fdevf3+JiSH9DNhrQE8oyxTWNbnxCyERpsEPpWDC5j+2?=
 =?us-ascii?Q?b5JWCelPZon3i0DQzGqtvGfiV4Vmno5tHFT6mW2F7/HQellDXLcpbZFK77sV?=
 =?us-ascii?Q?PyCUmPJ90eyw+RusSJzDkzCp0ZEyYtx3lHkOLs7tHj8hYJfWJq4I7mF7bWJT?=
 =?us-ascii?Q?FSoC8UfehJJSMnU1i1mu3dYG+Zy87bGLF38WIrUSSSECf67nhZrUJAvHHDry?=
 =?us-ascii?Q?+v8WmSC03c9HnV+mbzkkk/t1njsD9eze4HFD0e3Vu16UUT6v/jVu1mYqX+T1?=
 =?us-ascii?Q?yhbiibqJgHGjJ7Nrv2gPmDojj4EWehxY05nFNIyCLSG8CBfMXuYRnOp+MABR?=
 =?us-ascii?Q?40vJJBJR7rickAcjoLnjU6dKt9ajGsucunKag+4vSzj6Zer3P+8N7GPdRsT3?=
 =?us-ascii?Q?Z3RMsMaL24+9eaB1El4OKUdli/8kn8ZakjlhJTqP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639d01a4-c0bd-4aed-8421-08dd8f0e5cd0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:00.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNO4FcNQWDhUjnby1w/FM59mxQx1J9GvLmm8/wDj0sK4ly4LL+SUSjYv+Gccz0cs54DspY55+a+HozFoaZnGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083007_977005_C8DEAE70 
X-CRM114-Status: GOOD (  18.78  )
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

The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
worked in mainline. The DT files were submitted initially as-is, and
there is a downstream driver for the QIXIS CPLD device:
https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

Since the HW works with the already existing
driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
strings to also cover these 3 new boards, instead of trying to upstream
a duplicate driver.

This patch set also adapts the DT nodes for each of the affected boards
so that we match on the new compatible strings. Since we want the QIXIS
CPLD to have child nodes with "reg" and the current format lacks that,
change the compatible string so that we make it clear that by using the
simple-mfd-i2c driver we expect dt nodes children with the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

The last patch describes the two on-board RGMII PHYs found on the
LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
driven MDIO mux.

Changes in v2:
- 1/6: renamed the compatible strings so that it does not mention the i2c
  part, which is redundant
- 1/6: remove the description from the reg property
- 1/6: reordered the properties when mentioned in the required section
- 1/6: updated the example so that it actually reflects the expected DT
- 2/6: use the new compatible strings
- 3,4,5/6: updated the commit message to explain better the context
- 3,4,5/6: used the new compatible string


Ioana Ciornei (5):
  dt-bindings: mfd: add bindings for QIXIS CPLD
  mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
  arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs

Vladimir Oltean (1):
  arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver

 .../mfd/fsl,ls1028a-qds-qixis-cpld.yaml       | 65 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
 drivers/mfd/simple-mfd-i2c.c                  |  3 +
 5 files changed, 103 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml

-- 
2.25.1


