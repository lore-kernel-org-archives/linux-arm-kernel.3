Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DFC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=byQElWd0dqmfkIPPdd/EOo3f1xrNH62cGFEBPTMTSZY=; b=JLHtAEYxqCQDvwbg2ZWX//myDP
	6zb/Kym6Lz4fqcbl1X4kcpEf8lDhoP5HUtr7OBSunr9Ks7pEde/K4tcZ2Ak8IJVspGLNyTHAr/R1S
	ICN6KFwI0j+ga9nwABxMdk55aW11USqFiwjE4CUoamuJF/1KAj/KIIY5dQ6vP0vxm1GmTOwJfOn3/
	gx8vRX69SVyom+8eFqfAtWRKUTn+Ps+T6bIKxg+5ilJOxgrdkQQnXISaGOwjKQ9c1G7JVV17YtGHH
	H7t0h1yDsXxVjPkb5MOuUYNtk2F+p0xETlbuYAkxYoZv2PTmFxt8qdNwv8NPxE/YIhtgj0n42++Hj
	heFiNriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wse2y-00000009G9i-2anP;
	Sat, 08 Aug 2026 10:12:56 +0000
Received: from mail-australiaeastazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c40d::4] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wse2w-00000009G9F-0YOA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 10:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2jSJIqN+so4iS+4VO/5xRHQ5Th2RF+TwLyCKkANrl8r208sN6zf7yariLrCuSrRxlyLEvR1AUnVvWfUy/3XKld+kXB9AL7YXMDJHDAl0s6w/kR0zOU4/90NblyxLKDPWJ2uSmb9WAg7kFmxduiY49381f8qTK9u4TJPWvKlZ8x34dBgVA9yl0vhALqQV77REW4DA372GXBowRZrG8uVxdn8hoc6Mg9oq9ApoW4zfHm4tWneKJw/KavyuQHEXycU3lfRzFHv0bSCO7lLVB8cv/GFCptF8uE58o8D3vRpO55+Rz2HR3UAE2Kb4hBothAYEbtCU50F2LoxXL0zTM69cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byQElWd0dqmfkIPPdd/EOo3f1xrNH62cGFEBPTMTSZY=;
 b=eHO1wgX2DDFVMvNukoiQPGJF4VxHjGu9t6FEe7AY8xDxUZAdjcDKItvh1vIdvIJ7ZSkE10qw4cTRc5O1f+tx4TdCfB4hGm6mmUmNJ+HYhuUDk6nEtjW4hIf81xu2NArZGruoEe+C40LIay6zlop6e9FCHulK9P86RZIzvYueUKwj/iYQQcsshNu7JYN6hmPLBdeu680zE5jn37vNBQB5fITd+o8II5UADq134ej8+dbs2y5ZwbMcK4oX/RTa/S94nKSDXLnnmTN8ZxQb36M6b4YbvM1wsHGouUQh3ilJvc4aaYNELGR7iVmeqaP7eDKFmDd5LKIh+ZX28zgRop8HDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byQElWd0dqmfkIPPdd/EOo3f1xrNH62cGFEBPTMTSZY=;
 b=a+BY9KcVqzvXL/FGfl/SBCnndS6u5DLescAx32/YxsQTuk97YOsTqbH/ePopFndbxuXGtJzU3ZbFMavQ9WLXbhO7Dzel96W92CMfMtwPYjMTG3kxI5sB7XDy0wUCAWVh73SZ1om+g3oN7Qf/AI0TgYw9waIqnr+FM9ah0R+4r8SNFeYQc7fTXWmhm89REcHLd6fdEo1We+bE+nFNEn6gbQcKeKMhXvKENwJM0SjSWzCWoWmfAnQx7nnBV3uUnwFXpH0SXYMyIX2PMOk8nzoJsws/InpXmh0gGpS2kL7Q6eKBtWW4CF71gdITDEIrqHjz4RnKabOj6SDX0meSmk3WLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:12:25 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:12:25 +0000
Date: Sat, 8 Aug 2026 10:12:11 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 0/5] arm64: dts: imx8mq-phanbell: Google Coral Dev Board
 enablement
Message-ID: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWPR01CA0044.ausprd01.prod.outlook.com
 (2603:10c6:220:1e5::19) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: decddacd-9e7f-4be5-d9a0-08def5358b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|10067099003|56012099006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info: 6fJruokieYQaz3lmKceGIBwTBqAuWw2ocMGfX2O2jsTYGIUGaOPMMTFWYIQ0a2I2SH1ZIaOXSHZb4E85eyZ+k1JXqdCI1lzN7tBLOGPnMQsL71bJSY5qVVF3mqry4juS5K5SRuvI1ovRJ0jMomTMDayJHAth4krKqGSFNc1EOPZqYpGDHiALdvBaEV7NWZw4Ny22pnQp0AFB6BaFtX51h3Q+NHiiU/vDIVFHJp6wSwB7/cwIf78YD+uLjrfGxcIomspHmOSv9mY/PMhWx0wviD4fW36HQLZcL/pvftioKm5Oy3b05J3JjTxKmY4LmmFiiwktqLkugZou4b1N9osyRjDg++WKEABM07nZCErUazzPSOb1N42DMuMLp/97CxYLw7KtvqCQ0FIMgqGYnjyx/t1kBdO1qPNOpek+78K7P9VuaFKir4zQVMOozHuQQdzl8Lz2v89eLQerDKmHpvPhH/7FHut1TdtaIhlkt2UcKwVpHy+YI2Z8GZPvSHh7BEDDTK2ibR1p5R08bdbVn7yI+pRm5k9mMXIfXGEqsXNTbAo3BDh7SF9HSJW0y2pzIdgxKtKG9GKq56jLvqRqM57s9AziYXr7aDrsCnBE4ZfjE7ONwWZ0dSuGcBS9lsnNXidtBV2Lyv8CVNpmiemqePDxBO/xT58Qq0XzF8IyUjywoTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(10067099003)(56012099006)(5023799004)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbVoDoxmhQGk//nmqVuuRXevtVbqaiJ2/fFOxbVhj1zJAKowamvuAw0HXqfu?=
 =?us-ascii?Q?12YGz7vCt0VSE0UPX7C0LTEU/q6rNMh83Q7fgRIoJvGVilgXuhtkXg9n9dwl?=
 =?us-ascii?Q?sLXoDHIlsmNXp/cuQchuFuxBkKv206Um1dTwZl4F3lNagofeKHOUF8+KbhOq?=
 =?us-ascii?Q?nfuON4dmsGoFAzRImTsI5MDoflC9KCBj6uhWowVCk1ci6ZzAc8yAS4mMOtMv?=
 =?us-ascii?Q?fHQlLwsXislL1cabfw8TQD0bm05id85ZYCLGEMwlgcua2wkc5Ioldngc1qk8?=
 =?us-ascii?Q?Tw4+NQ2Z3m4k9GiRKCttw+NtKM2HzQDB/3xjt9hGoYO13Xqtddkh1gjrqSNb?=
 =?us-ascii?Q?+tHoa3dmmKzsczRQPk/cV023HqiiemJEr5d6RQph/qYaNFVbVrphlk+jN94m?=
 =?us-ascii?Q?JnyhE5qs7ROnsVLYwWhr0ZWYvhIILNVIRj5h3OpFcmnWrkz3L3VBt2jQ/m7I?=
 =?us-ascii?Q?Dxso58gqHx1IBNv8FEzZBBPSYtPAWoQkMXPDAOh8o79inA4IVhbB3fFDXUrt?=
 =?us-ascii?Q?OQi2GuI501YQO5QkJzb6+LHBLSGDC39WHfpthYLlp68MhDo32kOYLPQ5Cozl?=
 =?us-ascii?Q?lrw5qYyuosoXfNcRzeZmn+Q9WLsPPjgxqabqgsPdkPnN9lUb9Em93wBuuiKg?=
 =?us-ascii?Q?opGJhl1hKVHUdplevH80DAlZRbXYZzhgMIQ1o6JK+B1tn+iYzAqaidp/7m/D?=
 =?us-ascii?Q?p3N9dRhAKl5XsbKJKCSKGVmbAeTiHRH9hyBjBZAyayaoSwUS/Vwm/6WNLKjM?=
 =?us-ascii?Q?P9jmi1ReruG0I2SAtNft9VmigHxsfDLDtST4/svn688Q+BAl8FoHh43m8I1V?=
 =?us-ascii?Q?XhiKpIV92ma41E0GfEyHUqCgWMsQwai4Yq5G/oHs5jIV7ez+rvt6MxDjGQ5n?=
 =?us-ascii?Q?jaNBi3bj7d+UzEO7xPruYqG0W7GZemAER6XE8tH4ReupD6cGZpW3BY2yxgUz?=
 =?us-ascii?Q?4a6JnRcPWi50pTSP8xJFOwYO1L4B09s8IfZVYvcH4SkaVsSE6w+EhiR7GDJ4?=
 =?us-ascii?Q?+WfAST4RUiu8/lrRIMpuo2zb2N/QSsG7VEiE6uLSZpWa0pShNU8sq8+BM0r8?=
 =?us-ascii?Q?wUjzkMnV2KDkEdYuJCBac61H7sl6nF2l6Ezh1phUm+wKIS5SQc3PNgeNaph9?=
 =?us-ascii?Q?o11eefdtQfZxOylCWcYrQNJx2DKi/kaYPoOws/XEEQ66j/qmQXkEOCZsut7B?=
 =?us-ascii?Q?NDwNb+wQlFbDOkd4cQ6fOYh3EuzJfEMBsQuvaM6C7s62ma1u+09LJWd865Jn?=
 =?us-ascii?Q?1jqEx27ZvVL2dUNdrpZXveJcRp4Tq8sZUU8h29Bp31ITudnElL3bW3Ys8d6P?=
 =?us-ascii?Q?ojL+yBv+VoYgyYpXEM18Hao5XCcF1yGE5IzIQjx9/IGtKREtqnPWYKBgc1er?=
 =?us-ascii?Q?w4KBQF9ZABVK5iHCndt4kwJQtjYd1P76O8Hgx+tUpLrYFbsaneiEz7jgc189?=
 =?us-ascii?Q?wmEUMj4AzXK9OpyvBlPmHfkL2aqQ19zhErrNkiIEv6gvSivPWN5l0b74xMm1?=
 =?us-ascii?Q?mmt/PHnRsK80w2Lubhn1cRqvalwj0o+fhLy2gjkKcBYqW8lB9F2Yj7gTq1xj?=
 =?us-ascii?Q?f2Bcyrl5HZ6xxJmuJ+4gd+c5PLROix3NyGfTd0zHyo/lZLZHOl5A0sM5lFsH?=
 =?us-ascii?Q?zgRJv2OhC20kQMyrAgvDJfWdjQFJPUesdKr2e5EGaSPYcljUj6dKZgTF9fD1?=
 =?us-ascii?Q?PAu+qSsK+KmWaWgSCjMm05lLLBav5LFCi50cWNXqNB1ay0gV?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decddacd-9e7f-4be5-d9a0-08def5358b57
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:12:25.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W3OUypGzn/g7eiceX7KF9vd6r+wCPryZ7V1HkBY1PFCqRkVaXvDwT7dfXGm9oYV7d8eH5cirXC8L1cj1jYqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_031254_170773_00040DA4 
X-CRM114-Status: GOOD (  15.60  )
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

imx8mq-phanbell.dts describes very little of the Google Coral Dev Board
beyond the essentials. This series fixes two defects that affect the board
as it stands today, then adds the i2c buses, the 32 kHz reference clock pad
and the analog audio.

Patches 1 and 2 are bug fixes and stand on their own:

  - BUCK3 feeds the GPU rail and is the only regulator on the board that is
    neither always-on nor claimed by a consumer, so the regulator core
    switches it off when it finishes initialising and the board dies about
    thirty seconds into the boot.

  - The cpu_alert1 cooling map hardcodes an upper state of 2, which does
    not exist on a part whose speed grade provides only two operating
    points. The bind is rejected with -EINVAL and the trip ends up with no
    cooling device at all.

Patches 3 to 5 are enablement. Patch 5 needs 588852647b81 ("ASoC: rt5645:
Make the Kconfig symbol user selectable"), which is in mainline as of
v7.2-rc7; without it SND_SOC_RT5645 has no prompt and the codec driver
cannot be enabled.

Producing sound from the analog card also needs "ASoC: rt5645: Perform the
initial jack detect at probe", posted separately to ASoC. Nothing performs
the initial jack detect for a card described with simple-audio-card, so a
headphone already in the socket at boot is never noticed and the output is
silent. That is a codec driver fix rather than a devicetree one, hence the
separate posting.

Deliberately not included: pcie0 and pcie1 need the i.MX8MQ PCIe REF_CLK
source selection to be made conditional, which is a separate series still
in review, and the Bluetooth half of the QCA6174 depends on that in turn.

Tested on a Coral Dev Board on 7.2-rc6: buck3 stays up and the board boots
reliably, both thermal trips bind and throttling engages, the codec probes
on i2c3, and the headphone jack plays 44.1 kHz and 48 kHz.

v2:
 - patch 5: add avdd-supply/cpvdd-supply and the fixed regulator they need
 - patch 5: route "Headphone Mic" to IN1P
 - patches 1-4 unchanged

Rudi Heitbaum (5):
  arm64: dts: imx8mq-phanbell: Keep the GPU rail on
  arm64: dts: imx8mq-phanbell: Do not hardcode a cooling state that may
    not exist
  arm64: dts: imx8mq-phanbell: Enable i2c2 and i2c3
  arm64: dts: imx8mq-phanbell: Mux the 32 kHz reference clock pad
  arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio

 .../boot/dts/freescale/imx8mq-phanbell.dts    | 135 +++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.53.0


