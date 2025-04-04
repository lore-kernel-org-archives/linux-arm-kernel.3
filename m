Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B694C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0TuZag0Xgcih4P+oNxVTw+JqNJl6qSE2bA2I/FezgM=; b=qJG07/ZHIFzs0um7QQjGUaD/Ug
	C0dDfVGPf/Cm+t6/UF10vXNF8aPJoYRvVz2HwyMMuwemznnDYxMW366dQFRFGCJxPrb1AV6lbuuvg
	EjTa8H6YszEE4mOSo7/eA8URZoglw1GbBMEK3TgTcEXbrTa3GnFppuEAj514wnLUUYw2G1gIcrbhq
	vD/fC/xEGUNh8wdSaqBjMHNz7jdGCxe3qMSBkVtd5vzf5eEKLINMsNjkxYiGFxsQ1jyCQAUi7ObwA
	iHBqA8m5/TAuDTy2FOYtmleat846ZTH2VONZ7O9n6c4pBG8OgQUDQz+r3s6lUx3SXJe/D5iPaBTwF
	Al8/5mEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nkm-0000000CnxT-3dbt;
	Fri, 04 Apr 2025 20:35:04 +0000
Received: from mail-vi1eur05on20619.outbound.protection.outlook.com ([2a01:111:f403:2613::619] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nj1-0000000Cni6-2bAG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 20:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3jNo/w6gruZk0JYaUIPzxeXunCYrNaIqW7HbtBP5/3QS5I3xlBnspzgt6g/62wrh3tssiW4BPkV51nmo+cUsQODPZz23Tfk4j1R+xnAAK92P9PcGCwnE5hmFHr7VZzEEhAQxgCK8+/9muqO5vY9hiCe3UWo3aCXxqVTQymVrRzMGSwha87FCKfbg9ooOQ37P9c870j8qbgLz3zOP8/fpsok1Dtp50GIkoojUK1dsocrt/Ig7dbeom68i57kR+HGk1z9xvaU35SVH/GrR52OroJQPINQuA6UzUJa/o5Mdjxiyung0YcUsmsimrQAmkngWSGiQ3Nto+EVurCyMQq8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0TuZag0Xgcih4P+oNxVTw+JqNJl6qSE2bA2I/FezgM=;
 b=TWhyl9UAEHNE7Asdc8S8keOujGQd7SvBXWq+Hx38DkZwUfW2z6WHPzzU7C3HHhglwQWu9PIXXa+VIrBidZpGIVOeYekCzqti3Znh7OPo0TveA9hgyMbYWdUfZ1/W9G4BjSOawW64HsHnJdnrAjTFaXK4EcVFYLEkCUwd9cOC6HWD3qkeuSl1+5W+2Jb2K+ZeBoBt+6bNvR2Ex8Byw83BPaU618kdYMjmT1ATTQp5wp1QxZXHeftGnzd3cXRnWypgvjluDfqermp48Enm44dOiN0PPQI2QKvQZ0N5Gayiro955Jy8SOtOMiae8z3EN//o3we7Tm7RgswjL5M3U26MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0TuZag0Xgcih4P+oNxVTw+JqNJl6qSE2bA2I/FezgM=;
 b=jAieR0UUqOtV9/Ay15ew3qY4uvA6eM+iZkseT4Hva0QW/WJA3yGWl7e9gNAbyvPY1xpBmJOrcqD3RgxjkZJA25wSJ+Z7ZH01EG+ch9N5D0QmjIlTPcwoAcz7Eb3wTHtIsrCWd2vfAojrRH8KbMf9XWiCshR+PgG8RkzX63aMv10HfENkTyTinIwVgL7YXBu8rsq9l7xADQru91U6Hb1l7fAr0+9fCZgQc0Pe3Ph7eTy9p3AUlP0KUEGvHtEuR4KNaHcN7Be8SCZC7UPBFp0FL5UNB8jvv9Bw6j7VrdYwUp6QQZBVGyZ9jyNJxjN2LEB5uCt9y+zCxxydl/3gBgktEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10628.eurprd04.prod.outlook.com (2603:10a6:102:490::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 20:33:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 20:33:11 +0000
Date: Fri, 4 Apr 2025 16:33:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v16 04/15] dt-bindings: pci: pci-msi: Add support for PCI
 Endpoint msi-map
Message-ID: <Z/BB/Maq4253H7N2@lizhi-Precision-Tower-5810>
References: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
 <20250404-ep-msi-v16-4-d4919d68c0d0@nxp.com>
 <20250404201140.GA236599-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404201140.GA236599-robh@kernel.org>
X-ClientProxiedBy: PH8PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:510:23c::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10628:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc8f995-f4e0-4218-d7b5-08dd73b7eab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ToD9gG3EM2AbpwFR0brlZkz7gR6lr3o50LFKJU9wfxbvDtu6skr4eaUsxXAP?=
 =?us-ascii?Q?GhQnct96Yj3fFLF7KYfiQz6A2E/jRbY2vneZ/3vjHCfJMSvVoIElXI0FMJoq?=
 =?us-ascii?Q?Atp5Mf+0Cd43WUjrALnfgj3ezB1kOVsgehfqwg4OXFYRxY/WMesrFUBs5Vl/?=
 =?us-ascii?Q?Ogy+jcFctXo12JI4erwcG5HBOSR+yYFU83+PmLGAqc0OkJ+OmbFMNSaR3+PU?=
 =?us-ascii?Q?LjO/fEaCLPEqisvvySuzAMfZXEhPiCRWe3hHAX17ACzLY8m5nzt3tQjI+G9V?=
 =?us-ascii?Q?PAYoJY3DXWr38z8CYqtMV6Ie/C+byTXU9f81Oguw3VFtuMQkM2LDQtZtzh2S?=
 =?us-ascii?Q?S3u7NAABOckpKxthXiAUetUIHZlxoHC0mXe+6JJmQ1M0BEJI69U1tNYNKQCL?=
 =?us-ascii?Q?V3McBODIcm50F8IozHEmNTBaI2a8cgAzDysNYgbHfUpTUPGXuz6FgKbsoKQq?=
 =?us-ascii?Q?VOGnaH1xSOAGWwsAHzlMBJwDTsFeSOTN/ivpVHe10MNzVeG5Mmw3D8fGXP98?=
 =?us-ascii?Q?UMwVVDxEpFOMLPdrbge8oJzq9uglU4eCunc96PhaLYCWlYRTNR5MHqXWFgpA?=
 =?us-ascii?Q?wLElkNmDW95b3CDWXEpihZ4hLJQXGhci7z0iffdfAhmBKtS2X7p5mCS6C5SZ?=
 =?us-ascii?Q?cx3gtrPbbEhlQ2IU3DyJwQ2xZzHz765AblTkgx3bD5op0gBIKoqFDkv6hH0K?=
 =?us-ascii?Q?TvkpZ70POi6aRtejQvooHzinDp0dkTQ1J6IZN+VTGw1lFx+uUkjMRbu6seGQ?=
 =?us-ascii?Q?CDejOdBEIJ6+++/Bux/gjAfj3uQvPRoFp/Y9lekE8xbLCJr4Ufcb7Fb+yir8?=
 =?us-ascii?Q?cRE6mvGx7F31C1Q3ifRlViq9WwTpM6SosiRc01pYQPfjJzASmU0LGyUJgl/w?=
 =?us-ascii?Q?MuhL2JoYVr1DT6FN7cc4c20gGmLXg+qqf4A9BSXb3IXdGBHyR9T9Dld2mn3o?=
 =?us-ascii?Q?4xuExsBCrRlpWw0Arss7X8IsMDF+nR8qsd//nJJBuO4yd/IVCpeE0o0T3VI1?=
 =?us-ascii?Q?1j/cjedLW52FZI6JpMidH3QwaJqiw78+3gONPMn2u2Wwiu4B7hUuUe3yRfuu?=
 =?us-ascii?Q?+zprj8MqeHIO0SXt2v2yEFuIH3o7uRuDE5/5RaU0WDcwTm2ZdonjmjLRHxYR?=
 =?us-ascii?Q?s90wvK4OEGV5i1QOd76K8kPS7sCBEZX13ccFkZe2C/e/VYeGNfHe7SXOL+a6?=
 =?us-ascii?Q?vxphWeHNifu6nthnMxVedNsPSVuXE6KJwBunR6PH/w6jVXpCW50BrR+IlKG9?=
 =?us-ascii?Q?nyRWokIc4UEbTDMOokYcaPrDFWxIruVJQfuYbFZ7nlFdKCnASdVVkYW195Tk?=
 =?us-ascii?Q?QYJxeAzn475htwmkNq++FZCPD+V2OR7oqxGTIK7ExubMLSEdwZgAI3KdgHDl?=
 =?us-ascii?Q?TdlNDv9ARXP0o595/Ldh6FeEU+YHh0e4a6jOg18OM6h4WQqITFw0PX1XGoqS?=
 =?us-ascii?Q?//oR1w/6i8lpqb0L8uBhAHAzM/97MscfwJ4DACbmSoYGryS9K8dOdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7MjxPA56ohx5qGbwsuABzBM8KB+UXBFJmfS/hxzHWZGvpFrGNeGTSYSMOOl?=
 =?us-ascii?Q?pyjcWSVO5kdso6M3HxDsml9MxGuc4zq+j/gR2lyXrLv7IO+LiwH1ibGFefJS?=
 =?us-ascii?Q?BFHEzVz/cVG0DI512+lDcbk1kW4Mx5CTqnpTanji8pYArTnlGNHzhqZ9GBVJ?=
 =?us-ascii?Q?lGTQ1CmuZ5lpi5e3XnwdluDJ7brKB2NSYYqqG2ZBLDl6gZoLrG+7SpqKyN5l?=
 =?us-ascii?Q?mfzPssqEjVTzbQjp6hk5ww68SpHEkfcSqlS7I5rROgABZSwSobAkwYE82NVz?=
 =?us-ascii?Q?5nES9BdA3IZjLhOxlvyB2XI3qx49zEPz1tcJt//ze9RGi/nLYw1UpBg1ELkN?=
 =?us-ascii?Q?Kq1l+qVyvRERlRqNBvOcpAtQd7cWDZr0nSM0CQGdHgi6H7WMR3/Sf5hy8JgX?=
 =?us-ascii?Q?iJZnJ7T0xk9U3cCd0VifVTkYgX2YmNSKrLJ0XAx+21QQM0rGKoSGCwTOWkWP?=
 =?us-ascii?Q?HJdHRBy3ziJtIGni1DsbtXOoqvQtk9Zhm36FDgYPlRWwZsFpE1UMYQ21IO9A?=
 =?us-ascii?Q?E+PvxNBNXeEstEYffoqexafpurmJx4hwaUJ51SMZD8ijt5Bhytraxci0BrhR?=
 =?us-ascii?Q?9+ZeLN52K+39stWCInudtfxj1zpgcKmysKQ0o+KZV2cY7sCpjVWuWsAofo/I?=
 =?us-ascii?Q?+/+5Evstyyz1AN9eDyuM0Hn8Na8KsnugDQxL5kLUHb1XvhE7S33SLxM6XekX?=
 =?us-ascii?Q?quz+6Vj1oX8QQXPvKQWBDsWZtdKEjDbUifuGWYQjrN0ZZB+7XN1WRShzDilZ?=
 =?us-ascii?Q?cVWmhGATFeiGL9A2w1XUNTbu3C8B4tvczG71Rmk+mx/I835jYxW9rNRfSGJH?=
 =?us-ascii?Q?/pswY0/3GCAV4Xa1RS7cuVEBy7RUZ5b17ErXTihfk5NeT35KgtL4d/Ny5JOW?=
 =?us-ascii?Q?F0Zq0soRopiEmtrgqGfabdEI7BDp0xE1m/kBNyVizGHmo3UpAgnuilX3Fq/U?=
 =?us-ascii?Q?WL0AJDfnStGKajG64DYZV06Pw/ugrqWrcXmPZRWMJt+T4dTtJRTFgYnUOnmu?=
 =?us-ascii?Q?DgRXhx4LAFPh0V+KXt02I3ypHm3Olqux8kQCyK7ElrEowUN2HUdUDWPkhc3k?=
 =?us-ascii?Q?bYnCzC6F+S4v8wWP/utNS41sAo5mLb3VS0K3cGA7BVifHxDYmNd5LjeVSJcn?=
 =?us-ascii?Q?5iCTyFGaXIiGPM7PMQCHmHKysWVx8e9Kuo6MtqFbr0ymMIiVsxR4z5eICpIr?=
 =?us-ascii?Q?/bDMoBy8VJCBIYn3NEXeE+A7iwbNLToD6+jH6MWvLdl08aJm7Uc1/N1sjoyQ?=
 =?us-ascii?Q?xBy02g0j0VZDpSPdwgrN+naJpjJ8jMS+86+gs1jcPnyz+59rrsYMhKrlE/2T?=
 =?us-ascii?Q?v8rAYPFbWaimRQ9SygNxn4McPfz/WxSfjrPLH5rmWMyifP1zk173jkqBN4Lo?=
 =?us-ascii?Q?XbVJe6wKojczs/iFeeW6aOvkNfpwAb6O3bGBoRpaC4fe2Per/vj+oTUu2AxI?=
 =?us-ascii?Q?LajOUfONauz774ne+wuLa4Pq9fcNayyQsydamLWpdX0OdZdDB8xduownNpQ5?=
 =?us-ascii?Q?tzmqkVEsAZrQj/e0LngDK5MWyJc1uVbK9jJdXahVXyve/Vw8LwTCLXHk6s2K?=
 =?us-ascii?Q?kkp07nc/l7Vk20DPD2IQSk4pp+hOcRqCJSNj7qSz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc8f995-f4e0-4218-d7b5-08dd73b7eab2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 20:33:11.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFfoIzTXFLzaS+5l1BbKzNhl3Fy0gtdAvxJ7JNOAffViBz/OH+yECOoru0I0qHLoFojuwcwEqAE95WE109ITuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_133315_674004_5FE03D4F 
X-CRM114-Status: GOOD (  19.47  )
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

On Fri, Apr 04, 2025 at 03:11:40PM -0500, Rob Herring wrote:
> On Fri, Apr 04, 2025 at 03:01:05PM -0400, Frank Li wrote:
> > Document the use of msi-map for PCI Endpoint (EP) controllers, which can
> > use MSI as a doorbell mechanism. Each EP controller can support up to 8
> > physical functions and 65,536 virtual functions.
> >
> > Define how to construct device IDs using function bits [2:0] and virtual
> > function index bits [31:3], enabling msi-map to associate each child device
> > with a specific msi-specifier.
> >
> > Include a device tree example illustrating this configuration.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v15 to v16
> > - new patch
> > ---
> >  Documentation/devicetree/bindings/pci/pci-msi.txt | 51 +++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
>
> Please don't add to .txt files.

where should put?

Suggest by Marc Zyngier <maz@kernel.org>

"- Documentation: the msi-map property usage is undefined outside of a
  PCIe RC, and the way you describe its use is so vague I read
  anything in it. Please update
  Documentation/devicetree/bindings/pci/pci-msi.txt to reflect the new
  use case."

https://lore.kernel.org/all/86ldtpot6m.wl-maz@kernel.org/

Frank

>
> Rob

