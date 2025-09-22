Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BD3CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3BlVNNjVo2JNMeACpg/Z+uolDfE9TC00BYVvFhuyX6c=; b=jk279ESd6tVBb55GE39ABVR+yG
	UNK3I74qpVNFUc4h89HJ2I8G4k+dLAxrBfQPzTxP5c/MBXpymy/LMiCYIsNzYJ6kGrP23U1g7KXiH
	l9EGqVQG5B2BNfUBITKWdNB3vebU/9zpJELVmNaw//s979K7scSn0uwSr+yagzt1cKSHpzhWh8V0h
	X8MaSIO7p2IO3QO/WzPF+9v3gnzM048zkgT5KAeFtcnubKoKey4RX5qLjbpqmOZAksXafsNEs5ak/
	FLnEi9L465xRbhEXUbHC5f5mvsA1S48eqcttx+Z9qtubjYw16Ejcessc9YP5C9l3CGP2268FKN358
	y7ifgtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WRi-00000008ckH-3Lba;
	Mon, 22 Sep 2025 02:38:30 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WRf-00000008cj7-0ZaD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Am5o4KiZn60eVjXkn3kOLXJ3X80zPCM1HfekAg6KNQhMkY/cdrpTZdsgMYsBxhji6yX0hScAzcWVwQwRjBk+9rICjcfQ8/DC959mr3s2dn2y9n2+5r/gUDwkKPg9yt/kYIuGhejiLMhY/K0feDa/ANwstU2gGXcacA+18TA3e28LLjeZ/F0fToj/jf8qY08JIhCh95OXVlmHU4r+IJSbSjzojjTLLozlIEV8om5zlrVxkj+BQRGo/tItPJ6I5E5VRNcQiIxwhyls9Yo5yWGxU+XlCQ9/Lkgc8kje3sLbEFLuBO3VuWJhi3Mip069JT3JZRkNVWHce+KCGm5F9j53WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BlVNNjVo2JNMeACpg/Z+uolDfE9TC00BYVvFhuyX6c=;
 b=sL+9Z+rp7XER+NpIsh6SjQ+ic15JZZzl1/p+BILAjZz+YI4XVB2/qeTe0LJghMXoCCZZIflGVr2/T2RBmlbumAKWROoa4hX8QbPs8BgfX6N9wqtCesxfWizwecQ6pYrPqZBon+jhEa6GvI0N/eOvlta1Ryueu/sb+N+o1hkOx9qyFADBRG4+RYqGGy6U66lTremLoYPg94hcTT7wlVXo0QSIHZrfDOwcMbxpbZrWAEf5K2vAt7aMpYHNy7Vy71iCuC/2bipPkAqUc2Xn5ZTWmpdz2lgteV69vUEwDpraJ9hjGFbnniOldOhQ9CJZt1XZnMrJm6lrs1j+EyO3oB0xDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BlVNNjVo2JNMeACpg/Z+uolDfE9TC00BYVvFhuyX6c=;
 b=g5ttm7uWL9ErBXhqsjYozNhg3ZsXQ2yj4gNiM5zbskEsdokKC8ujMwBeCBMtUjuTHXDK7YtrosWi6E2iRerLNeYmYs+8GHPsu0JfU1ZPzFoBQmMK1F7XTYwzIpR7jMto3BraD3GSlKorVoQ+wjOTVr9m7enGbwZQ86i5QAhgpqOo8PVIOxPQCRG4zanxgWSo42jGHS2Svd8bggFIQ6iHjy3OcNE+SzgRiWfZGgdid+0aYdUle3K/f4MYYPm3ElXpaxudVX/EN0aumFWwlMzImy4iC0KfV70OgPzNv1o+uxPIJ/AWTDKAS3Df+6Eu47T0fmo5mvazcC5eoMyUwzkfrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DB4PR04MB11280.eurprd04.prod.outlook.com (2603:10a6:10:5e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 02:38:15 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 02:38:15 +0000
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
Subject: [PATCH v3 0/2] PCI: imx6: Add a method to handle CLKREQ# override
Date: Mon, 22 Sep 2025 10:37:39 +0800
Message-Id: <20250922023741.906024-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0136.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::16) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DB4PR04MB11280:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cc0382-d856-4a0e-0197-08ddf981148b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DEE99jasefacN56+jCufK63wsg8NATvq298gczh7i3DIjBUUXODLmbJrc2/N?=
 =?us-ascii?Q?wvClFlwY7HHfYnzvHyxOCa4633/oTgO3Ao5nEYNaffFrmHjQWRnJrhYXU1Ad?=
 =?us-ascii?Q?JknOT97vWc+s3stehi3JNzUXMPi/vr/dEBWLv8Ce5X2kBSiXODP4UGqAtmq9?=
 =?us-ascii?Q?GL/unkppdnk7RDBl3QbZF6uBzriwGVc1JrtpUw72Ed86MIwMkWFnh/BXSsDV?=
 =?us-ascii?Q?Igx4X1ZsaPlFfYpjK2EPHhHGwV3W5mNZVagSKV2a91Q/Ec09PYU/Y3QfagW0?=
 =?us-ascii?Q?g+Gf/TuVVCpYO+0uOFG30BCycWCBk7oB3L6RS2Eol3gn65KRGW4b324+I1Ox?=
 =?us-ascii?Q?g/VMH40w5kCdJg/JtDCfK6I2vQqtysDy3MuX37SLo2jJfnJ0bSzJeIBB6Nt3?=
 =?us-ascii?Q?jpY77noLFmGPT+//STxipytQfTx+U5w9cx9KvzmV9tiShXNIdba2XIFxddr8?=
 =?us-ascii?Q?QaxGpsPUyQy1cY1NsQnw+Ytd8hzh4yw7L6YFFiQrZYmNK3CV1RXkD3QjaQnO?=
 =?us-ascii?Q?6t5DSW4Jw2A4GPn0feFLlUP35DjbrUkq5M2njMVVGoCokIgJEqT1bhLh0fgA?=
 =?us-ascii?Q?bxRVawN0U/qhmtRttB5Q+wshBFdTaS1lA8wUP5UUKdBRCr0FCZ9cSSckAAQt?=
 =?us-ascii?Q?UeANtFlyED6fECNFJK4EhBbY/9phfYqsrWVg+Uk+A083mikYuGlDeV0f4jup?=
 =?us-ascii?Q?vrBabOGlGvftGxQCvasj2fewHTrVSETiom3kTdsAJddAZtW0LPw8jAKf0XJn?=
 =?us-ascii?Q?AvMJZ/EhdLiOkqU4girMcLwl/bdWCo1Beb8Y5XESlIhEvVA5j50+Dronzh0Q?=
 =?us-ascii?Q?+bffV2NQItnUub7RUNE+w9pHtubQ9iSCMWTvpYEb4yB66xieia5Tsf7BCali?=
 =?us-ascii?Q?izgaS4KIF9lPZEBq1vvj6EG+SFG/TDOKFUGQKIY+LlMqq/5ktmeRHoUgcmep?=
 =?us-ascii?Q?JW0XbGsHz0KglfoQGNflrlhPYPK7KFXXbnBBlTF7YKq4ZwWABYkvhlpPcEdK?=
 =?us-ascii?Q?0VF2zugAtXSPIjfJGMv9bw/4Ci2aqJPP9AFmZAF1cA9+IM0KSQuWzxnLVK7G?=
 =?us-ascii?Q?TeT933zHSPWxFNKoxeJBwrPXl8PlgHP6TEwxXbhLXlzpg+PDgKGGsVqpnidu?=
 =?us-ascii?Q?dv8jJDPTi2hePH3xY8EQAZo0hxQJ4U/82WYKW6d4aFnYZT//hLJOOUKtja1D?=
 =?us-ascii?Q?DFi+7pId0wMQ/RjDnku+HLU417hCt72jwbuNhPIlse7hqwC/AmoWfGVZrlg/?=
 =?us-ascii?Q?xgzA4PPCdXXkvNmkD6FIPhQ0DuZ5GkcCN3xrLb8pLc157jcmphS+V5uuvLos?=
 =?us-ascii?Q?CdA7xIcrRRPND4QAVzKPjB/hmmUGgPW2y1KMiWxT/4RLaYjFeqT0jn8RpVYc?=
 =?us-ascii?Q?uclZJupRzPgjpmNFYoio5TtN12iv+dCzymkZlVqH7/ciH7x3OrzY4sYNqTer?=
 =?us-ascii?Q?xpIY+ROOYYuMZNckwaEfUvFzMKLU61mPsmilJ8xWnpwNP0OOIzHnXsJpPMX9?=
 =?us-ascii?Q?lNpOSBXloj8yNGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Su8XNO8Z98NQyKC5VGiGJDSnQ39r2O9NsMTZo3PP+j8ykvOMTYoQgpIL9ee9?=
 =?us-ascii?Q?316JmEh8Tih3PDMTsY/1zo7V1Ddp1Otfmq5feKYBdIlf7QXNagRrtyhy+zbm?=
 =?us-ascii?Q?D2RdoKZm8MU/dkJuaoISLXW9HSmGyEhlrNiWM8e2RBQ+Q0EzgfW1TZ0CGQBx?=
 =?us-ascii?Q?BMGFt55D50ajvO6sf1MwJqVuaPtTmUSaNxICuxoFAtuT/lmw20qRtGR6X0p1?=
 =?us-ascii?Q?YwRHROGScqhoa9O/lfrGoPYlwyRXOB0FYf+2qYOTUAUmUsoiyqtQkGw1O9cO?=
 =?us-ascii?Q?k+/cjDeH+G/Uhn1CchFjUJsrJug6SDz7otDAaGjxYKaKo3UdNPPG/c6PPcYU?=
 =?us-ascii?Q?PoYKV8oAEZp+aDEhH4lF3b7+ItWnGRO6hV3W4zYnRKIkkuBAZrZOwPSgQV0F?=
 =?us-ascii?Q?7EhCuBX5MxQYTaC9ZTRF0ITxrvDOFY5HDvcyZRvSfUACFPmWNbX6BdulnMiC?=
 =?us-ascii?Q?d/bVVg6fE/TWwrOc3hgrKp5jW2dC17uyuQGDa+vbxerZU0V8FnC+DLtv8ZSK?=
 =?us-ascii?Q?il5zbpRTqH6/ZIbIBRs2UMfewgI3Ql+rdiSTlKH9oI/zFBg2yrE4yv1CYlr2?=
 =?us-ascii?Q?u28NEwJW0bJ34p1Kg2t41KJs1/h6hjPTbNzV8dn69bjKGDPcLuSe4ovnRsZg?=
 =?us-ascii?Q?XPapbqlVGsa3o1GM/LN0Q5qEhB2qlS+uZrgaV8rUXpnOYPK+jbcTVfk4ghxY?=
 =?us-ascii?Q?KUh8RT1+hBF1YOwdrrpLmWdi3/nOJ0RA4EIVOUK4r8CjuO/l1RLMXfuyscWP?=
 =?us-ascii?Q?4jX9HUS/ZtFkA304VIJJjh4xXHGOH4Ra3oL83cEJ19gud/6jKSz83sEGSJlP?=
 =?us-ascii?Q?IOzOOPYplOWFGAtBOg1CRlDbx00iQhIEtg79GJF6UpvjBrfvz3TIVteLI+rE?=
 =?us-ascii?Q?ASTppCnS2zsOIxF7vZgHGyAbn52xUwMvyqe5jppYS2490Z967ozYZxKahkBc?=
 =?us-ascii?Q?550xQKMDJ9q05YgMyaX/Bp0drNTQuztjlZim49BLuhBp6+oMdW7E33Tyqe0b?=
 =?us-ascii?Q?i1VqhqpIPCi2mqWhsCuEvf79OsgNPYRMpwtJOW4Ksc1hDtOXDs+3rRPwDtSM?=
 =?us-ascii?Q?/EolS6FWgQqk/QggKvtT06fpgkjxjrSLMifHS8XwqyXTp13v0qmWXwWJiX8m?=
 =?us-ascii?Q?Z3aVpa0+Er4+HxMYEn7p3F65t5SpTkWep3gFhg+2T9K1b1IT2kaP6Ubf/zIu?=
 =?us-ascii?Q?zcqBRYYxWJdLH3ktEELKxb4zAdy5eGjrwYuzOtBo5Du089slpOeTWrM+juE/?=
 =?us-ascii?Q?jTNBUc9VFUN0xU/o7WFwNWP+YoJxVDFBN53SR/6kJE4Ewiiq/v4CbL95tB+N?=
 =?us-ascii?Q?WxF3uesiksoOOAyqg1pdOygTqd0Z3p7oXG60Lc+DR2bx36MuSA4C3E7ArYQE?=
 =?us-ascii?Q?8r/JsFfloiV/0FJI3sGQrkOKuR24FxFPbbgZ+IqmeEAhzey8Xy3cSWKXTdpx?=
 =?us-ascii?Q?VqakrjRs4D4V4XAfQ1Pk5uzB3Ko1SKlo24g745tbr+pbLB+ZOYovK4JfRyVg?=
 =?us-ascii?Q?wguzHtfV6KeTq86D9vvQQU16D1xkJKH7ancSPEhHgWtukAbbTALIRWf3Lwf+?=
 =?us-ascii?Q?XrJyntaNYEBQh5B8Yihn3aeNQ+0bt/rHnq7HNxYp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cc0382-d856-4a0e-0197-08ddf981148b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 02:38:15.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGKzWvRxYu6SfNRKfjMARFLb5MzdqU8HnNj6hfi993qJPRDL42TQMmbRQa5UTV+zk66aMEyzeBxrto+rumLExA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_193827_174270_99F51FEA 
X-CRM114-Status: GOOD (  11.12  )
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

The CLKREQ# is an open drain, active low signal that is driven low by
the card to request reference clock. It's an optional signal added in
PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be driven low if it's
reserved.

Since the reference clock controlled by CLKREQ# may be required by i.MX
PCIe host too. To make sure this clock is ready even when the CLKREQ#
isn't driven low by the card(e.x the scenario described above), force
CLKREQ# override active low for i.MX PCIe host during initialization.

The CLKREQ# override can be cleared safely when supports-clkreq is
present and PCIe link is up later. Because the CLKREQ# would be driven
low by the card at this time.

Main changes in v3:
- Rebase to v6.17-rc1.
- Update the commit message refer to Bjorn's suggestions.

Main changes in v2:
- Update the commit message, and collect the reviewed-by tag.

[PATCH v3 1/2] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
[PATCH v3 2/2] PCI: imx6: Add a method to handle CLKREQ# override

drivers/pci/controller/dwc/pci-imx6.c             | 35 +++++++++++++++++++++++++++++++++++
drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
2 files changed, 38 insertions(+)


