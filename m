Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D97C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kHwDzf1PE0oxfpX3AA5MhAYzHiPVuq3wj6gwgdHntqA=; b=Wgv1JQCurpbjwaH/ir0/h8eHq5
	sD4kGFG6byIRZlX6G6qQTFTdkNu1xCTYI8D3HtYmIePBy9dj4RDR/qTaltRWC+SAeS7sxueKq9E6B
	JU1mwQR8S/BSDX11PeDq0lfE5j699CEhzmy5lc7a9DmvphTo82od3AiLsjSc4hRiL6I97zrajRnDH
	pqFXdry/Px4uID5wBmd5rHrwy5QlVyuwl+Ndjqw+okprtEDDuKEvV7/AiuNy/Y5q3WHf0IPcQQhvx
	XWwrY2rjNBdVBDY7WcMttNX4Dlvq3UbmfX+7UAlx0pWk5Plmf+Fnu37S+wNESIcrciQPoQNYD2YgV
	dsvNAslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHP-0000000GmAo-2XQW;
	Tue, 30 Jun 2026 11:05:27 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHM-0000000Gm8o-2t8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuGVUrc4efK23xRudIgn2MEMraa0DVEA07nnY1EZbAVpnVsNnLID3v/O0z7fWy2FwRkxmqEZjkYDZO7iDC/reTlbOvGiDxll4XpBCxSgX00toefO6HAJDQIyWWpJnOjGlr3mUHhIChMlhJ9K94ePznyisK4FpdBYXbN6K5BSqcYlVLTSqIOldVFzizvnjuU4wKeOGTpsUkoyRrLpZv/94mcYOJui2R1HD79NeN+fC9sv3T9Mt5ugmrNg1XhGfuts2E75GSLvB96t7TlScginBGIzJOH9I69hPUebgJhTbM2CIlTAeAGxb2aYueqxmHQ2RJm9S/YHPgm3nR3vroIM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHwDzf1PE0oxfpX3AA5MhAYzHiPVuq3wj6gwgdHntqA=;
 b=LdIgZH1L93CpE4FA5tdKGDkthZX7PfQDEZqbIj6GWVMmAVT9NhL+1+COG/wwBrk4DUZfTyQvdR5lGsW0Oy+dGny9NhdOhWRrbLxvkGDPkkFXyrvg8Aypoz//L40ozSqyHTWnMTdv3ySqiAwUV1AXbAC9lxpx8eZt+v+m9GPC+q3BeYY23RrNjuxrv/9Bd0AekIliY8qngBzSJQgj2ESfu2vLB+nLK60DbWDRt47saL8/nSgYyPjBRk8oJjtQZjeJdqD5rh1BN8uu+ARzp1MiQwqKzLgY1afNHi8HghqJOccLZHj86mp/kQa4mGyKHmVm3f44pbsdagsDsfp0qe7VUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHwDzf1PE0oxfpX3AA5MhAYzHiPVuq3wj6gwgdHntqA=;
 b=f5Mz69DYZN/W7qwtsUU8/6eOow6HcDGYHLos4AGdnHMxES0xvz7VXSyoK0i1mRhR1pfk7De9ZOD/uqGMLkyRrvKNIniAQ3Aohi83aNuYhBZJ4iup6plemOiyLLHtwCyehksKNv/EJmPn2fXsXxG68kqH3v204VLKSJLLd8wU0p6jZOxxuE9rSo98x3Q6u7FRvnk7Otg0H0oJp7DsG15kfmNu7fPZO/FjKQNKI8YCrdBh2aqzDrrPPhgh+EYm7TCMgwgUNlN6LBY7xRK81xwNtGHYi1x5ksNHmO6Liek/Gi3uJvpCLZSXbrSaLq6yObCGh34Tqg5SUnq3QKbWNLWEiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:16 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:16 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: describe the Lynx 10G and 28G SerDes blocks for Layerscape SoCs
Date: Tue, 30 Jun 2026 14:04:54 +0300
Message-Id: <20260630110459.516364-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0333.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::8) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3a8aa6-1e85-48ea-ac28-08ded69776ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: MIX5raCSAr4lx+UiOzdZnaeGonsNypUTE5HkfCvoMSYuRGEeCqV15P6zuLaYBwKC6DmnztmGHr0jp6kRIN13cr9IQqgFPHWDA3T2tFPt7SZOP5CnG24WAykdv+c2l7rXA166yR3ZY4fSqknws7rI+4xEFP/wUYE7I5M8BsSu6TFi6hbJyf62tYzze+itXL9Da1BS+8Xlr1V+uFNpjGgytkupMWzIONRU0qdRCetHgRR8EVCDBwEMstHyWYZCZKhQGFohnIUqzD/rceZG0G4vT0aHVrdpm3fQjVrOHLu5K8rWWgpvtJNcAdsNZBSD0gcmSf9TC0hMKoazh9zPOg6/pGhzB8K70UDnzWVUXIrx04F6PXZ41srWzwDx27hEyjTldb9IT5t2iD6TzFJZdRVYmoktJHmTqqArpxW257IfhIGRIta6+KNVMvhh/YP0DbvCwhSLl1aQudn9ZPD51uWzMGvfeHWyAuFZkv8WRZG63dXrU7O+fb8b73yQGFXwjoMEc+NDcF2cF4TKKAgMVR7b1nkYA99bat1fBX5pqThyqhXlV6yvGLNHkL1p2tj27aS65mIM+29Ayun2lp+PiMmD9mUzIfqCifJjC2uUOXMTH0CYkxLz8v1TvNj55z2roFGO4PtUtFyTydXZTvZ32Qbxrj/024caWKCe7Cwrw2o4rak=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WcO3wBvtJYutsyVfyF84llq+0XvEy/lH/7NhbIXlErWG4ttquCM1BF9pbUGM?=
 =?us-ascii?Q?7IO+TAf5GiJNtkl40X/RwrPW18jhIdmuN/zWoElyQDt+V53Poj652yVnfM/8?=
 =?us-ascii?Q?so4uH2FVoaC9Qw6Tr58LmTu1/AQh0FsOJyy66ob+cpbvUT6O+hxcpNq5tNz1?=
 =?us-ascii?Q?iPhO/dPlHWrS0d8RxQlLrKsO0nQKP/+r6oAupP0FYd8K5LFM6yLeK1CUTr0i?=
 =?us-ascii?Q?L/1AcCWUTc6N/KraQ9UH7VPbr1lBlz9MrOs5RP6W9jVnEcgpbnpeLrLCC7hy?=
 =?us-ascii?Q?HnMmk2Lm2Qc4pxRVojZ6jxNogZnIYQEOezLLpbRNw/54Wqk/yzi9LbiWRKHR?=
 =?us-ascii?Q?Fkrk8MClp/vhK+JJBGmQ0c3/O24+zLfuH7XI7psWMAQ7TBIuJ2azlmI0V6md?=
 =?us-ascii?Q?X/g3+hIc0v2ut67Kliqve092lVWpPH9tZJHE8LRhoQdd/DYUWzujGkSQa+0F?=
 =?us-ascii?Q?f0e+DTB8HqhDoR7tyJQp3YRnGgir2dlgESepH6k/DuQ+xnjXF44CsXbFsk49?=
 =?us-ascii?Q?yqu2h4dLGozVlw6KBAaqfvzEVtF9y6ka+8t036stGuyLcSmxhQvO0ywvVoZo?=
 =?us-ascii?Q?yuXmQL5GgIk6vnyc1MWDEK1Ghhxf5sNG1NH+gOVyZm5wDnuT5/KtWt4ylDCv?=
 =?us-ascii?Q?WjeXMM9j37cwEn0LWGXbEZ+iydUjfBYsOscIT95SVAj4SE+2OYL4495/SCs5?=
 =?us-ascii?Q?1Eo27/cpcXEfH2hiW8ltqgsWxU4vrbEOUTPwEPXFz/ydtC0eUG/hy5ElJVb3?=
 =?us-ascii?Q?5GUNNzmCFju0YFVn1QVTLzjyANC/EtJ43GCfobGPxz6063J9BFrQ/iJAaWdg?=
 =?us-ascii?Q?4k9OSHRMsTeUMaWlp2+9pD/sFUgf2I5el+kgvvhAXiF1aOP7DWwSUs3OwB63?=
 =?us-ascii?Q?GQaapqUQqmBogxMy/znmoADCMNHpMU3IA6tyMyZMZuYK8NlzdoRF4BbDg+84?=
 =?us-ascii?Q?DQodPSeCnadZvJxTxOFxhj9wCNgJm/zjXYvucGfzhkaVP2uRmhpgz2Bdfv6S?=
 =?us-ascii?Q?NvvFthnTUtvtrPha5fQSCu492LItlgPhWXLXz7RdncqhKyYx663uIcdhYNYp?=
 =?us-ascii?Q?NjXsWhc+Mgjo2FSyx8qmNS+b0/tmnJkbHh7OtklCqoQWt1zYvUJnYfRFyu3U?=
 =?us-ascii?Q?xLuCvZW8hQe0h04VFsrxZDlOGqY+UESGYYtI9xuT/abBOsBEQ94qw5xcMMxz?=
 =?us-ascii?Q?3BOHquDSGZlN4p3H1+HymAUfQGMZkLfLrO1e/x35nydJfFeohRjiiFI7iNxU?=
 =?us-ascii?Q?4MQqLLzEOwWNuA1NMDAZjVRaQERpEU3+OFTaZXpSQKFR13SbU4SYWn35a6+8?=
 =?us-ascii?Q?VdD7j5APqH0K0ExkLbnM1bW7fjNDnoqUWmZkJbsiSOC5/ADtHviBB+1t+/HV?=
 =?us-ascii?Q?5FBWI7DLmqfVckQTFr6n9dFmIVBT0tDnrB4Tek7jSDYp/N+8uq4y+y/Juk9j?=
 =?us-ascii?Q?NBViVVQ62Odel57sY9MvkiVUAvRYbWQFgTpicUDu2tJMXku3HHvgXkUEixPm?=
 =?us-ascii?Q?x4VALMssHumBqCdEpn9+qcvOCae8CbXHHjcL9VwgT0h9Rb9VRuglhmfzaD9E?=
 =?us-ascii?Q?cxNvu399Gaj2/Vp0V97oQj+fbj/oBjm0PqxRX75gT6WwNLi6ScxBaPyF1Vmm?=
 =?us-ascii?Q?K7PRWaQ83Sp6QuKEHV8C3SzU0GyWZOWcik49hWHMxj8KdANPVMoTIy7YRZYS?=
 =?us-ascii?Q?V5ceJBTXWpOhh6I3b+/Zijfwn0Y3YldqAvtKOFfAXZ9kqvZ32m2hEWX4YfgL?=
 =?us-ascii?Q?Y/TXvf8eZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3a8aa6-1e85-48ea-ac28-08ded69776ed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:15.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQtuO6YOoQqS9zaN8s4d6oBUrscfMOKO3xjg2xPyexajVVMpuCUnkowqxpB4yKoVVGF+7lI2csZ225PbK0eg4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040524_745984_B399F526 
X-CRM114-Status: GOOD (  11.37  )
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

This patch set adds the device tree nodes for the Lynx10G SerDes blocks
found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.

The first patch also transitions the LX2160A SoC dtsi to use the
device-specific Lynx28G SerDes compatible.

Ioana Ciornei (1):
  arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks

Vladimir Oltean (4):
  arm64: dts: lx2160a: transition to device-specific SerDes compatible
    strings
  arm64: dts: ls1028a: describe the Lynx 10G SerDes
  arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
  arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  29 ++++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  60 +++++++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  58 +++++++
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  98 ++++++++++++
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   2 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
 10 files changed, 427 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi

-- 
2.25.1


