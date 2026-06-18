Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D93CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=So5K9ng5O43NoDe1KzemfqCeQFFmAdKJgebs1G9MFj8=; b=A/eceiWT29vL8DQTY6Tsttx14b
	i2x5EL7Ah4hkfm1XM5VlKNDhrG+++J4BKAyhY8Q+lQyhY4xnNaNtPPY5iBscILqElAitAfbJloG4P
	VMe6BhobM5noti+CTpKUGbGhHauPre/Dt3AbiS1vH31Er+4iPWa+863KmM4YIpFzYafrVXFvZSKwv
	qV44iBDLgSYD0bteLR8bWVArE/rVBjARtk9NE6ucnLWyIL/zGylhv7pfcUgJ28gJwq1prSUCcMH60
	SBjBqtoomKHROf45m0CopoULeZoug9G699PtvS6lENWabFfPZcWkDKADIOx2/V8iYTpIv/4rPc+iq
	+MQrKymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8so-00000000ulZ-2ahk;
	Thu, 18 Jun 2026 09:17:58 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8sm-00000000ukt-15GF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXnzRwC8NWix1ChLf0ESfebGqZdpDde8qcKPr63ZstlwYCYqFD7djE95FL4F/VATiZNrf6rDn6xNBYvjp5X10g8abhc8Jv2qb6U3LqcvfencPQVOVAv2m4MMtuy+5Kw8z7+j+EbHpEBk4uZBuTJ4s/T+MhcwlaPtQzQmr234K7tARoSXP6pNYXpY3h3RIwmeNurxZ3MnXS/GcgXBfl9EOZOJKqtgC5ognNqXUk1FPSKVEyOBTL7ZMyH+xQKtYgdqLbz9CX+lRU0FTE0T52h6lP0vdSLabVshg138sMWeDyOzY0eFpQm9JMRZt/KHsdApFOF80zpw4XVlkSh9lLL6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So5K9ng5O43NoDe1KzemfqCeQFFmAdKJgebs1G9MFj8=;
 b=q/fTXNcq8z0gvTScDBEy+i7iCHr4AR3nefBhP6v0cnGpxi/xHJtC6NlfS6fxTzJNfeM8rhMqywo9Q+Zm+QHp74M89iUw4P3EEnjeqM8757G/AfwIz0xM0o9+U+xk484sv9Gzk+x44WLxGTbyup6G2vCsrGjoHHMDJrSJmfGGs7RHT5g6TfXPhQbJdO/eiCFFhrE5cAZbomt9wHt393X+Fp7q+9xzxr3L7AbiE9myDBniPVm6KYBo1o03yBr+FRPqFqAYAUiFcwJ7li3hC38Y6kVd7oTFCLj/x40FyRo6BIjGl6lPsKY600uT4Qi4P1o9QxKUmcZMQddpeyjkt2E5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So5K9ng5O43NoDe1KzemfqCeQFFmAdKJgebs1G9MFj8=;
 b=hOkOBb0SpFtIYSSLOZ1Q+/5z48sn0sjeKrsEhRweCQo3vAnWWiEN72uLaOMfP6h2yBo1eABG1aogHzHQOtCp2EMHDoQ7RxpVUFnIqNN39eUSI2qOVjoD3qcG/nuMvkZ7TffO7hdjCpkSaDNkRF7S6YbH4J4fgWGVgsM+BAjnikUMiEK/VbaRi27VpJ7Iv17igRPzHmqF/a2IQosbM64APETqdComUmnE4cvu0x+mdwW3QPqfpCzfxDb92bQ3udYyCavSWqmA3fTQ770yWv8hz2RASXftdwXkKbmiKu/Y8plqFMoIxNXKV1FQ7ixfNJbX2fJbBAUEViAtlg8KTLkOaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by AMBPR04MB11763.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:17:50 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:17:49 +0000
From: hongxing.zhu@oss.nxp.com
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
Subject: [PATCH v7 0/3] Add root port reset to support link recovery
Date: Thu, 18 Jun 2026 17:20:57 +0800
Message-Id: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|AMBPR04MB11763:EE_
X-MS-Office365-Filtering-Correlation-Id: 20622162-f40b-4513-3ca0-08decd1a77c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|19092799006|376014|23010399003|1800799024|18002099003|921020|56012099006|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: c2FU3g3swWpSaRJwt+RFlAaJPKhYdJSej5/viWkygn4gOIBJyyrxJr0doSIMHGvrKdsZd2ay4Ramvo87S8k11JegwjoUiQF6JMdAAxPEYEBJHJl54IEq2dqzmQP8xOulbnH8W9UbrX0aVcPx6frLUKPFCAchCyMJgEA+CktU2ad3mnkAaUrh0PQ1cyTgi8qhRkVqnJPtgzyIkPtu8n5gPdgXdH6urRe321YakzV3jKar2cnArF6OdTmss4aZKIO38EFk1B63FfoTPLTaygYUp8wb8eQxXijk+bsyFyoyenR17fvlzhLlDx9MVZutS3JmLuVkBv2Xktgouc0Ti8N5y8SASnEBEdx31RxkXOOqwmqWjwrBQpJ1DkhUBUX7f8UBFN0+2cTaRGUabajgmOPwfUNYw1F9W3iZHlT2Gq0wwP/47cPi1tnv7csqRbc3RkQ2E4o4zY9UohZ8pEx/xY6Gjo58VG+VzTjlyd5S5MSg6n5wEcS8aCyGuW/AGWF6rHg8O1OLpZ3AWT6yx1ciDxrzpUrsN9Y2l4aVOOkwud2df7GaMW1RBtUisLY3paZ5vP09QaAnYgRB4W6WiwYrR/JBCENo1T/rsEoqCxPUQGxPorFdV7MrJdfEsokzCXk1uh5eJFidWbmtzd9YLOvSfwYE7ZNkhrE7vd4qIV9V3963HJ6bV3VU7szkZPZ74Xff36oLZJpHTItTe92i0vTYBAGulSiM1GFlvz+6RkCseSGy+CEHRiAr/G2vThU/NkTe26UD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(23010399003)(1800799024)(18002099003)(921020)(56012099006)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oV2pXbwHN9n/odEBLNgOH5XovvuOw2G25Vi3NPuktiXAfDkHI3NDMHen/q1V?=
 =?us-ascii?Q?3CXh2wjBfxT3cLPctP7SPgWqZC1qgVpY+vcr/wcLtOSDVW5QJqajCB3pSkS7?=
 =?us-ascii?Q?FYufUfc8DYmUOYxrbQNSdkuflIm+Mtcd3Truh10xTMwbKHlqtWzesrNYBij0?=
 =?us-ascii?Q?c9kI6sJWRviMi1CJ7iNuOXNMuD0LLqNwB5WOR/vodQg3RpZID7DKIiGfMITd?=
 =?us-ascii?Q?WTOFf42/4mmrCAF7HZfeyaCq1D+fNapJZa5WA7ZIcDf/vRqP1RTZ4hLqcWMH?=
 =?us-ascii?Q?FpJYV2VRfq7+XwLBtHrAiWfWxkJ/t759FbSJYNGKyRJkR3cMvOc8wJC8+C3v?=
 =?us-ascii?Q?VEG+kMTVAx1PkXNDi13yx3Xo4T8yJTuTm3036bRX3EvVT9ptUwU2FBBO2ABQ?=
 =?us-ascii?Q?OAYh2DexZi8/juyBnmwUnPaG9dTy/sK4Mz4+Eg6tP4rEDC8IT/tpbfyvUinC?=
 =?us-ascii?Q?BVmzk2twvisEuhxRMHUnwEZYZI34/VDWE6GH81UMHY9Kb7oZSsh3gQZf52IH?=
 =?us-ascii?Q?I6fHQGNa940QMZIwk8whCUf53Zwp/i+cicS1hVMBe9axScVLdBHEcAQl7goq?=
 =?us-ascii?Q?oH09hrc3IQPOcJ8cEhrIfz/q4IKWkKiXlH6+qfYTHIUr14Yp725To9qluuh9?=
 =?us-ascii?Q?KHp6KJ/u4YKP4m58o2yeopUzVBZ/bSyyRJ6K9Ej1AHoKn7U5403dLRpYVzxq?=
 =?us-ascii?Q?CtauCzmcP1wT2Rxq6tsYqp+ZtcScuI3H/flx6A7fzpXb8m91z0l2DGx0hyuw?=
 =?us-ascii?Q?3mF+IDlLc1P3dEHnuX/xj+BxVaPrs6osyL9hDTDVWYY4cNkOEm7fDvlPOTx4?=
 =?us-ascii?Q?UGVGYFsEBsl+vknkDnptiYzKZroPoFlHp7X0F+GMr5hXPHfbQE1yGKZv4AG8?=
 =?us-ascii?Q?Bo4mFxAsQ5CqJL9boEVVIvvqOSYweQYEWYi+blw3WZ8daxGk5dkka9VBzlbx?=
 =?us-ascii?Q?ctN61cZA4GsPfhk12oB3Jg26K8tfMxm0MLve5RFwktF8YYJYYyC4BN3TUBlr?=
 =?us-ascii?Q?m9lKRc/BWBwKy7HRh5sqmneCr3Kdq9ymnbM0DGZ25BvdiNJ3bVmoSmjBEXHy?=
 =?us-ascii?Q?giu5DiyrzozM8etDxPugRde0F8dxvkpRi0buuL4ilWhQhCcn1Da3Cq5rTWlx?=
 =?us-ascii?Q?CqQSMMxuaCGjLKawEvBBeGrbMWpfWHMj7ylbb7pymo+7HuuVlJ5aVY/5YgN8?=
 =?us-ascii?Q?LgfYjHsfGIY2knTdvLh0K7TRE/X+Ug4YSZtpKaMg0Cc0PDr+duZWEaGUO+dF?=
 =?us-ascii?Q?nxwBmfkwDLZ0C+FLaFFs8IZSP05d7UedqiN83VrpmMXoVSYLR6IREkHXqdH5?=
 =?us-ascii?Q?7mqSQLLRD6K3mJJ87l8YV/cWXKtucYVLHikcXWA2fuLbMkU0buumLJUWzX9B?=
 =?us-ascii?Q?XVSce6xwMMhSxHmCZ9SAf3LaSumsi+dafGeO0fZT4GHN3QAQLoo2gSH5aQb1?=
 =?us-ascii?Q?1rhfGZ+VwWofQJHF8H83eXEXIBQMfz1R7sdi0fqvIWqARRyyrLpOuRNCo7JT?=
 =?us-ascii?Q?FW5UaYhp3hPyxQI+lajWNxqnX6+6CedKFx4Z/Fpf0+DdvIv/jyvN9x0F6aig?=
 =?us-ascii?Q?GT4ZysBxFnYKyjLUHCa/+1OeHkKDIpXqqYdHEjP4+2VAY2+HBLPLFJjrwbZq?=
 =?us-ascii?Q?3rMHVESbVjFBxBTI2Z66sAN4o10YDsQGoXEugqf40e2ozqlj8FQLGSs2ezd0?=
 =?us-ascii?Q?AY7/YHCjUW1mciQ0XPpURpt9HCbjb3+PH+GTfwtF5z2N4UPwSB5jGWIAZIJC?=
 =?us-ascii?Q?N7PNAYkp1v0mbUbg8TtVU8vzIKsmHD2jo3ZN/pjugiZKszQs+dZL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20622162-f40b-4513-3ca0-08decd1a77c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:17:49.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o55WjIILKji5pxyYe4ILSXlh93VBdD6jUNthyW7uQxCsAFJYLLVvZZKges+IAuymFVxJoyqdca7+BJ9TDxAbYaYQLj3IaaWmMo977AWhCApWQLUDE6Qg394cm+bKmL9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_021756_313561_D91D4B3C 
X-CRM114-Status: GOOD (  17.59  )
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

[1] [PATCH v8 0/5] PCI: Add support for resetting the Root Ports in a platform specific way

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

Changes in v7:
- Remove the redundant maxItem setting of interrupt property.
- Update driver codes refer to sashiko-reviews

Changes in v6:
- Use conditional constraints (if/then schema) to specify that these three
optional interrupts are only valid for the i.MX95 variant, while other
variants like imx6q should not have them.
- Change lnk_intr data type from u32 to int to properly handle negative
error codes returned by platform_get_irq_byname_optional().
- Replace platform_get_irq_byname() with platform_get_irq_byname_optional()
to suppress unnecessary error messages when the optional link event IRQ is
not present in the device tree.
- To avoid inadvertently clear the pending W1C status bit, clear the W1C
bit firstly, then do the regmap_clear_bits().

Changes in v5:
- Update the commit message of the first dt-binding patch for clarity.
- Add explicit comment explaining that writing 1 to IMX95_LINK_DOWN_INT_STS
clears the bit

Changes in v4:
- Set these new added three interrupts as optional interrupt.

Changes in v3:
- Don't add a new if:block; Drop the maxItems constraint of the interrupts
  property for i.MX95 PCIe.
- Add constraints for the interrupts property for other variants.
- Regarding the ABI break: add descriptions explaining why these new
  interrupts are mandatory and required by i.MX95 PCIe.

Changes in v2:
- Constrain the new added three interrupt entries to be valid only for the
  i.MX95 variant using conditional schemas

[PATCH v7 1/3] dt-bindings: imx6q-pcie: Add optional intr/aer/pme
[PATCH v7 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
[PATCH v7 3/3] PCI: imx6: Add root port reset to support link

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml |  25 +++++++++++++++++
arch/arm64/boot/dts/freescale/imx95.dtsi                  |  16 ++++++++---
drivers/pci/controller/dwc/pci-imx6.c                     | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 169 insertions(+), 4 deletions(-)


