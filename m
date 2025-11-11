Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201ADCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz6pEbY0AZ4TVal+Od25/WYm+QzBEs6JqpuU/AcCSvE=; b=Qx9RiGJoPumn59rXwDt+m2lP9y
	vQjapMXLq0PglQarVCs21Hg+Ux2/qY/SLvoaGT5BUzGgJZsZe2Dt+qEmXTZn5T+iOlHwYmCQwMyls
	NgJkB6wfMb1yzP/l/Dm7s/jPHcelnTsRqNVevYoU1Th2IkOYXsyGbTGsWcU0lM9RMFGc7gCx6+7qK
	hdBWDEv5VwobTKbqBgT6Jz+fePIAgv9BXHlfZ0wbYD4fmPwjz4Af4dB9O9LqBUkkYUZ5my44Ee2NL
	HVjFlYxrWVguNEFMNR99RaZF1RWh5MV91Nnf2Jvh7LIKwQ4HCuSqb8zlD7268LLIv5F74y+3IpMMW
	xjTzPL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqpv-00000007QJR-3kZx;
	Tue, 11 Nov 2025 16:03:15 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqpu-00000007QIv-3sgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdtGyinnsjszl3XFahuJNp0E4AH/XPUQkCnwQr6r+65ehVlHZvrwyXn1OioEm/ikdocIcOvFa/WgDzqn2UJAI+H8Dipiy5rNq/a+1+Yj4OfFmX0gVkc1Pdbb7oXGtnzHy3z6G9y/I6JDldJ0epU+xbKUhTuU3V8VWEQ5lnf/90qZaPWVMXvNeXGbkDZqpdQp591Uwe1HNn9nCdWcu6TL3SqmgKHjiu4AawHpS5OWTfUF17R0BVWeRiNiDXauLXY9+9fmwTxN4HDNZdvk6C1V92MBRRmPLKjV+GX+9qTecIAYq6KTegzeIciTJpBM3J3iC7XoKxqx4RRmLAsTbP+O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogNWxD0w56Ya0Nkd4N669Yd6tyh0rkni3bAQUMP97MQ=;
 b=ppa8Od7VB7eQQx9BwcQKjgMCYVYqOUhEeV9QCvcrKQxy6Rj9NFiSDqw04YlmD52+lTV5jEgqVe9OSLzG7VwZv1ko/mbxlcQUX807YZr/knt957kGG6z/iassf1VohZS5GKETTmueyehjv/5pyhMgZzyHqMlrOhx+EHlfvbhL2zEsxHdIMVUihNbdxJr4korAYMCjDarqt0wkrJmXbjtIGczJo8TzsPgakdGcb1k0msnhOlO0f8mDuUNr9SVWjWdq9lft1BhYv+jRgjkSzwHbpGHr3/ADPhGTrDHOMTAlHU3sNAJaeD843EcIaPbKVFC6lbFGvLvkQA/k5uRmcTeDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogNWxD0w56Ya0Nkd4N669Yd6tyh0rkni3bAQUMP97MQ=;
 b=H9Uy1iMAfnKJBnF0AijLWCRZKNPhpVeh4Nh8g5i/g9dplVSIIofQ1Ruy6f2/Gc8Fb2lOiYz5vW0Rp8RX36klFMyTUk5gM9odPmurWz0rzJcQh2CIL9Da1WAW9HuUVoYOPrI9wC+89wRCnkQ7y7yPyPXa3/JsBoa7tejqhx7Vyn5UCVSvWgM7MxPLfNXk7nIVKrPw0CPuKQjKDvIFad0DLtTURRjM7BUW069IPREwSO7pCST9w1F29oDLowC7hxhdYq9IELIaC+bq4TAYkMaZ/5WPPKoznhzKxjQ2+hVrJh6gRYXdP3dW7Y8hyzphf9++WqDKYqNw/MGDwCYYbtJ7ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7953.eurprd04.prod.outlook.com (2603:10a6:20b:246::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 16:03:09 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 16:03:09 +0000
Date: Tue, 11 Nov 2025 11:02:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add Toradex SMARC iMX95
Message-ID: <aRNeMJWsCTRO3j6X@lizhi-Precision-Tower-5810>
References: <20251111151618.70132-1-francesco@dolcini.it>
 <20251111151618.70132-3-francesco@dolcini.it>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111151618.70132-3-francesco@dolcini.it>
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 18164ec7-535e-4268-e5db-08de213bce9c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5MCb75bREi7mAljoAkj/1ssz6hQ3XAvwxGiGQ2R/y5UyZCNbpIr8/BiU7T?=
 =?iso-8859-1?Q?nMLqRzybfilTghTY0bJ3X5BypLIdgAmEY2mGk49q11JjAMO7fWgZ6Ceyxb?=
 =?iso-8859-1?Q?O8guWegSjzi1Jx0Iy72zpF42Y3upbZdycKClCDJtk3FMcl7Q/8D6syTRYu?=
 =?iso-8859-1?Q?33SufeklHnqXacjPcVqRq+5CfTL2JPQgrsylI+BwSgk9HzFl5R7HCgZ5xl?=
 =?iso-8859-1?Q?2eW70Oz5ZPF/AekkbaGXVw8meAJcTw1DpFF8vWQOH9K219XDfU6aQVY4ZS?=
 =?iso-8859-1?Q?1JCEOC0S3VOTiKMNCNIJiBH3miiXwkKRnwIq6SWpLf07eC53nsfX9f+8yh?=
 =?iso-8859-1?Q?SfotFQ+48Aq8GxLPHRZzcRmsi9UYBJN5IONEKScHhk18OLV+UMjfwkBmG7?=
 =?iso-8859-1?Q?Mg6PfbVUS1KOgtkyXW95p6Om/lekrNRQBptI7/6LfTc7DxlOLBdgUeITCU?=
 =?iso-8859-1?Q?2VxZNmjDtkMK1gc5i/9/jI9t6lcGMqosOk/FM6gkAS70vt8fNI9QAZ4uIm?=
 =?iso-8859-1?Q?GwE3Wp/c02vJpnPMQq8HP++Iy3iAWAoWesmXwI/wW0kQimziIVMpCPGx4R?=
 =?iso-8859-1?Q?ltmwuEO13FYXqLOXOmjA90ZlO0/NlWmPmV+elc4sjfW/FF80OZvbghK1XL?=
 =?iso-8859-1?Q?ul3kxQx8aYurVvvVNvh6ftQQsOLbS+x0KZv3LdIxzqXteurL4NBzl61Dja?=
 =?iso-8859-1?Q?JSh6gu/FypciTIZ7gCe3tqvqeizKLtcPxs42w1LlkaRs2cWn8rxejabzI8?=
 =?iso-8859-1?Q?dIV54UZ91M8t0cLUqhs49Tl3hFuYPs+pi8cizhvAfZ0QkV1vgaR5xNZr4k?=
 =?iso-8859-1?Q?5kmCe478N5CyVbxq2jS7w6hi1XcoQkuS5W9yM8jrSVV9u7T3L7BBILeZfU?=
 =?iso-8859-1?Q?oD66BLQQj7FBlImbiupDKkDPeIhW2SE3eIgzkpVOPts00ldMD9tSONZzny?=
 =?iso-8859-1?Q?DdOMZDodL0rsAPC0M2VoLKQKN5fteYnTme7BkkMaDUDj754DBx7kbqSbN7?=
 =?iso-8859-1?Q?KZ+BVY3W1HephkHwqU7W8eJCOeK2PdxPQQmpUl5nIQwGufAv6MRL94nbAD?=
 =?iso-8859-1?Q?uzKpgYnAwxr2IEfi6l6Cq8go1fOiIb5wnmgjrz6ZhU7cE7BuYMVKh2H4mk?=
 =?iso-8859-1?Q?C6As8FX0LAuzL5QclEc7LrzpZw7HLyjGsB1Vty/Y1OkOuYEDIRlvXxVxRW?=
 =?iso-8859-1?Q?b7kwi2fVIawBNbokSt3KmQtGVQXeMrKYXVkgjDSVdCzG2lv6iY33+/ut0E?=
 =?iso-8859-1?Q?2dD1pr6x/ZE7VTINV4upg0h7w7NeO/MDR1Rc5DW3g28dmhVGpATRUx/BoY?=
 =?iso-8859-1?Q?/ZnYHOuOfiyHXCOrvn34P/9LL5TUWA9bRfgsV/QR/bGQaPlasfmvBP0KM2?=
 =?iso-8859-1?Q?SXfqLlnlxUtpqIT14ehmyEyfNM5siNIpIjPYELDH4nMbChVMY4kHFjqL8a?=
 =?iso-8859-1?Q?nxLXt9S0Z5x3ZGKCR43335WyCHV7zfCyAL2qi7PCrjCqZAwH/Jgrz8unzy?=
 =?iso-8859-1?Q?fc8J5MtLkTdMFXrNZguc0ZDHr9Icp1rf3fHNBQ7qO9XNiAtpF5kTh9UqEn?=
 =?iso-8859-1?Q?KRmoTDuoeUXtvxXkGF4dPuwCo+4Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fB4xX2Q4/n8QfBw9c0uE924AC968jYwJXiP7Bde5UXOesMeWWOWrlHkYRs?=
 =?iso-8859-1?Q?Z03tQItlXHNzmlfc2ecwD7cW4dPQbqZGHn52M27En6fgQE+5TgqJHwSrIR?=
 =?iso-8859-1?Q?wjhbD1Z83qZ6GTxRAuafKlYzRKFnDDQX7pFl2mit1vav5LpDq32agWhcMs?=
 =?iso-8859-1?Q?GpAiCVSTPT6XmPXNGBBftC647MptuKPbvIleK/Qpn0btYUlfVJ5xgXDv40?=
 =?iso-8859-1?Q?tVlc9Vu1Gg5Jrb3PIfZt7sijFrSGZ26MtHX7lCg2uEQH37y4gbpYgVjfbA?=
 =?iso-8859-1?Q?jdweBppa0uO9/YqZaZzd7F4TYq/9Yi3j80LAYCFmoRus5ERO61RI/oHWA/?=
 =?iso-8859-1?Q?UC+mExj9Ij2QZSE/lbWJ6eEgN4H0Zt36Bl5IIu5XpOQJaBygyF2yg3y9oq?=
 =?iso-8859-1?Q?GERp7nFlrunpX9Xipv4o14PRTWs9vea4twDaIKMPF0NGeqRCMGMD9jkK/+?=
 =?iso-8859-1?Q?fSkmlYPcqjmRC43u5xtQVb2oCz7Duq4JmNUQLz1LLIJHKp8SLIgnqYuWZL?=
 =?iso-8859-1?Q?foEqVyqKwDlHtQhHQX6MnFm1cpzuR27HQ03caD9o0Df/N1eaorayKnesM2?=
 =?iso-8859-1?Q?wvVLefeG9wsdVtu4gpkxAkpVR631h43GrZ6GnbZgIBBqgAIEeLFHkcSRyQ?=
 =?iso-8859-1?Q?IWUHQp2wHwpXVAXRlA8uDk6Jw010qFfd8F7jleetVav0PKA4DKyColwacw?=
 =?iso-8859-1?Q?dOwATnHc5J8XSaOfb1s4ad7DGrVnRN8WQJUk56xlypk7OeXzZqg8FrtaTL?=
 =?iso-8859-1?Q?Xv5nqZ+9zUypS8RRIcFRJ+1GW3N2R/tlTtCGIZj/9CPogKmCwgPWtVYdfq?=
 =?iso-8859-1?Q?qBzhGaU861tVccRH5wNMxBuw2BoS7t1ycWlLJ2MBEQgnmv051XeuO36E0Q?=
 =?iso-8859-1?Q?7KK+R2DFWkJcaWT0rwklD8oRdUHCncgiWeWETYag+o80jLia+1q0Do8+uS?=
 =?iso-8859-1?Q?0RM21utQIEJ+Y/WNSJAdIUUla6dcktliSh89k7HtqKLoKJTcuv+U+6YU2L?=
 =?iso-8859-1?Q?En4LRKYeCFOU3RLTx3G8kVPTTHz45ubaCoNTQ7oPdtkH0ZcszrhYbYq0xz?=
 =?iso-8859-1?Q?3yLtX61Y+KfM9HawXQsadJovhLWmrtOwLYQykbyOe4oTP2/4g47nFaLufp?=
 =?iso-8859-1?Q?NPShu0/9fORLRYjiO2w8EMSRL9QbTAzGTEHOC+woFDAQCMYuxwe1f7o7x7?=
 =?iso-8859-1?Q?b/dUCla01iPD8APMaWK/VBPOyVZ1nwSuvlLHTxhH8h0+UztqBz8kZhmeCZ?=
 =?iso-8859-1?Q?MSROfS9h4DeQ9zr6A+6KrR7vvTrXvPvcbGko+qv4XUxxmg0RBuHobej7kE?=
 =?iso-8859-1?Q?GeO/ed/6MJVnh8+le6TOMmAkwhszHVXHium03Ovvtxm2OR2jPlmkiacCbJ?=
 =?iso-8859-1?Q?GptsT3vvEehhk+voIXbUNGX14PFhGTC1qdDJ+cd9KnMeBQx00HR22dIej8?=
 =?iso-8859-1?Q?0jBmzon63dms3osChD+vZNV0G6BdZFEM3hzdMzlqDPJXvsuc3yxJu39vZX?=
 =?iso-8859-1?Q?peydpx5bZ9lGv013kQTmJyXuNgbQl4Cxq9jbrc23J0A4cwWAAK+02uBxaz?=
 =?iso-8859-1?Q?my14bfzVe+MEJJXPA+TVAp/Ht+os1sBSBs3EV9FwoIGBF3pGroaoscmt5H?=
 =?iso-8859-1?Q?2i/ETqEg5Lpv3M46tk2ZOyDWCbfedOftMS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18164ec7-535e-4268-e5db-08de213bce9c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 16:03:08.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TY4QImF3EGPGtbnON1Qb9prcfu7BZ9qky4XF+wjrWn/IeKVo/QhT4IC2KBFN+7GhWeItgOX0NbHqUwTK8z0fdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_080314_967501_C29BFDFB 
X-CRM114-Status: GOOD (  20.46  )
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

On Tue, Nov 11, 2025 at 04:16:14PM +0100, Francesco Dolcini wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Add DT support for Toradex SMARC iMX95 SoM and Development carrier
> board.
>
> The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
> RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
> Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
> and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
> and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
> DSI-DP bridge), and Wi-Fi/BT module.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Co-developed-by: Vitor Soares <vitor.soares@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:
>  - move enable-active-high after gpio
>  - add newline between properties and child node in som_dsi2dp_bridge
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../dts/freescale/imx95-toradex-smarc-dev.dts |  277 ++++
>  .../dts/freescale/imx95-toradex-smarc.dtsi    | 1155 +++++++++++++++++
>  3 files changed, 1433 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 75676b908299..28f8eaf18471 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -390,6 +390,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>
...
> +
> +/* SMARC PCIE_A / M2 Key B */
> +&pcie0 {
> +	status = "okay";

Nit: if there are next version, please consider add supports-clkreq.

I suppose Key B and E connect clkreq signal.

Frank
> +};
> +
> +/* SMARC PCIE_B /  M2 Key E */
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +/* SMARC I2S0 */
...
> --
> 2.47.3
>

