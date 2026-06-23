Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A326CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIylHqESip62+9koCly1Xi9MuIzJ61ACoqWKOJqEtgg=; b=X6KBIVJ0m+X9IiOycXDan191sm
	DJABo/XxWomSClirUFlMCUoBk8k9nWyH9hIThuEPRvlUy9QPJ6G1Udfjow+aHXkg9CmyYOAd3soUV
	PPq5Q+fSmy1xCXfsmlkOzaMm3nf174TELVHb9JJqzKynDGI6AM8nrZw89zgPQq7Z+kp/PfP05dpAg
	3EIp4XC2LuqxZWSuFj6i5c29E8Kd70f8ZL6RXHjz46ilbdmSNGSt0114hK5SmeEB0NbdvLZH/IKVb
	FFKnPONeDINHlPUHrWK5YSDBCZEOkSTm+hcRQoBulS4B5XHFvrLYB/9Y+3BfOkQt0zthCngNSk9cg
	U53oif7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2LE-00000006TSn-44SR;
	Tue, 23 Jun 2026 14:43:08 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2LC-00000006TS9-1qY8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/y/QkCSql4yDhoUneXnDBr0g51gELb5zNqXgakZ+qUV0SdwHrg0v5G56NYlRLtIve31Sudx12KqGYg0Xnivojw8Xay2g7+GoKTfnB5VO8+Vn0brVK3FuM2NFAfpInJ0nQJMHxL7QZZI26h2jjlb10sdzoN6/aAP7iWn81oqyfncqNZNo79fjLxDQMcZ8NjUjwo3k04ukPN8hPYlQLpYNsWA0qiuDkWTcDpQUPgG7hMJl1p+1yK/GrqtupqxlFFdMjb32ScPVYVZuD3wxzrB/M5VA7JpNWWgXlWs/HlMWtZj2l/UFjiCKouUzXmlZ4dscgLHcXJBuZ3rFVdr4s+UuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyycIe8hYZn9Lv80xaRjsgOzV0ohN0dNBppJyzuQMxg=;
 b=pZGxcwMlCQ/3fHAITHXhmX7eDZivPcMh9AuWqL5hoE5HT4A2B7bFtzKMEVP5t7LpWUh8270nnL1RLlE6KOcbU0d3tvdMn7XQeW5ck52V+CfspJaIId8patGm/bEZ19/qO/CHb/rQCYFYjV7dsJJsVa3dP/XLoMmKDGk+5cvjCnsj8CV3g0ekCysmSDNqsntgeJT1STOfg9wChjudJwg8yvnDbDPz/AExTEmZVYS5KhUVDXBjtrCxw19tqc7VOkEMR41kZ6fZSlvTYGjnu2WSy+2ffCg+iSPtD32wlBIlXZxeuWAgdMrXCYvXKleI/vKzBJ5RfR7Cz2uDTFt/jk47xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyycIe8hYZn9Lv80xaRjsgOzV0ohN0dNBppJyzuQMxg=;
 b=Wf8I7/u8jxyy52CTmNBVGUcEXgQJXe6uFn5e0l0+xF2Q+Zs4J2u13wxHZaZmfHs46Iq0u5KMhtezHff3GpWq0/ORlGHzRw/d1S/XgrRsGOz/r7gzxuHu2nbXUc4Y1Ef2hpiCakiyMNgTxrq/Huu6sQfd+ToghBTKu3PkYMmEitsPS3I574pR0r/bRrSpLayPtFk3F9jbxELN/erB8K2XcbAn6G652aRpu1JmuxFoi+wPBYENU6DFI5dNrkMQzaOl1AbormCixAVaVVfDofDtBKDfIRo3iMvaG6J5ZOoXMOd6j5nQ/US0kqSNE4xwYDUo6VJLEZ4lhuwXWAWK8x5fVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 14:43:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 14:43:00 +0000
Date: Tue, 23 Jun 2026 09:42:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <ajqbaxFaHJ1CguAB@SMW015318>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <ajqFGWp3XKqDhPpE@SMW015318>
 <ajqZIBDVccYSGoIY@monoceros>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajqZIBDVccYSGoIY@monoceros>
X-ClientProxiedBy: SA9P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8c06f4-c795-4fde-8d72-08ded135b8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|4143699003|5023799004|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: PXREsK4Go/1CYdKmgxMVufZnz904bt3pycvF80yCT0xccmL82lkBKJ0L5DKAIIRj2MQZgVNBcwZaE7e31dP91I6cRvssdGa6GxuSwE8y0VrwE99YnkQyBdy/Wc2zaZMX+TeawyOL9Qc3uJUKoTAkHaLJH14+q/i73gKxu1D2xHKmJMSnlUoOZ5w3ux8oHAtoDKQhLz3adRbsy0fdhJEhULPQlJe/1xg9IcaBAPGB7hklWKneb34fmt9YYaHdMVoLtHLa8UsU7RuetqwuiXcf68cX/N/zU4glYl3NqW6LaqeB+MlE6qFc30+zIrkLuajgbimTRAAh5MTMvBNip7oNIeocarYirrncYO8ujjlwmrdQXIgucSh3p+xJVDOR6qfZtzpKlj1HBFoKusQ5P1DbBrJZ3Tl6xQMy0hvfzUXQKWcaEX6kS76y+sDSdCUoBu3nE3QE4MkZ0vtP/EccutUG/ccXZQezCv0st+CS30o31Jl/bW7/lTpd72Rgxm03sNg0OGWE+SiVgJofz0mCKTAtH2KtyPuq6OWvsFWfEnipe5tI68inkktX1WtgaS56HehX1bqbLM0m5iQNqqVo9wneUrop3xMOAHegtmkCO9otnjCH9/YHuAsFIMsZ4gqWgIVngMIOq3X1IZU0GabXMDGRB0eTJQmyHjol0D58j9r6+LU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(4143699003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U6uH9FYObhr/p6xAKnKof0u4IeD/8X9yL+rNN3AV6z30EDiYtwBPNIZPZV?=
 =?iso-8859-1?Q?vkaJuFlsYVqxEt+JwAkcsQKcgP97uBo3AbJpTRY1lT7/909UUq1KuAEgeh?=
 =?iso-8859-1?Q?mRtB7rbrFKBF4HOsdtSfj9iq4h/s2Qu6bbBGzAtqHmy1c2MFL0Otk434To?=
 =?iso-8859-1?Q?t+6kSgU2P3RSbhD8NxmOSRxUa3+dwcqGp8l409PfYZRBKuP73gPA/EFUO5?=
 =?iso-8859-1?Q?YLt/WxoH9qdPFL/iD4lornP8GihktpSIgj5g1E0dprsxep/UOJpyBD/x4Z?=
 =?iso-8859-1?Q?xJj7RgnJ85UCG/R1QRsyk9kmd05W6iBzvO2gPG8hhMTga4ayHVHUVByInz?=
 =?iso-8859-1?Q?xooemDSUQ04PG/pfkUepAfk1aVZ5sMQ6uBTxeLYTGxTn90LxEs2k76xl2R?=
 =?iso-8859-1?Q?OhkLwkKRDgffTB1yR5PO2vwBIo2MuYD8RKPJwBxaMtxx8bWLyfKnxqnzpm?=
 =?iso-8859-1?Q?E3FJc1LuSt+1qBh5ENebPVTLmsweeKmddKc7grdZRblUa6pYSb4T1Uuwb7?=
 =?iso-8859-1?Q?7TIlOTxgIPaQy94ClgHecCHq0atCWpCw5R22q5FW/qQEY883QV8+2fkUYd?=
 =?iso-8859-1?Q?9Z7fZWO8sL5suXBAPgapIIz0Oxm2QMrMw0hW1DT9Ht7pwOyxWWUffV//fy?=
 =?iso-8859-1?Q?R/DUT5rS4fR0zFg4+A43ixrDHV1cBFqjhT9JMdHpIEzZGXRJfz7FnURx3I?=
 =?iso-8859-1?Q?V2KZl61f1yDFAqrJrdP5gCbDMXqynss0LJcKhsYHlhxAIR6gPUURUguXeD?=
 =?iso-8859-1?Q?mbQo37xjYBt0DWuTdjKqjPMQfZCs+UPuydSNB63HuDBA5fjYuFDLBfjKfR?=
 =?iso-8859-1?Q?/Y9rz/xHCkeBbdfsKZoKqycKYHBC4XOABKLBgEgJHlU/kgzzYJYENaZTej?=
 =?iso-8859-1?Q?+SPBT6zuLjigvYxEGavVH7Ctclv4jXuySCAyOpyn3AHJ9YxPEf38d0+GZk?=
 =?iso-8859-1?Q?VncLGWd+KBN3fXmhscb0LpoBEFi+ClgHPzFb/offtcQq6AkCMCJXta2+WT?=
 =?iso-8859-1?Q?03efAQUY/qsPjG7hsHzSF89xCSvpiTPoYV/z6Y8RWPnaXSbLc0VRZoJnOq?=
 =?iso-8859-1?Q?Av6fDeC0yh+13JXpdQJiVeXrzom7SNbPn2duvr8ieigfzk6oVTE7JkFe3Z?=
 =?iso-8859-1?Q?mPPW0FgTbltMBUMrGx7Nod7T55k+jjDj6MA/BH+G8EceKYSsEEd0RsGlOf?=
 =?iso-8859-1?Q?rwiGie3w01nJCfJ+5wFsEdn62vlDlsciy2yeDl5pObMNEqnnUvgIe5FC8G?=
 =?iso-8859-1?Q?ED6ZrNDA1I5rEIUpxjsB6uieB7dUELZx7JkeXG9gNsdRQDSSx2aWTIytP2?=
 =?iso-8859-1?Q?sBMc5PQHt/sw7e3ANFhM7aNDQg96Hs4UgjTTHM2Huml2vsZJgf1x1D0I+P?=
 =?iso-8859-1?Q?DMKZWwGfl+Tv6X3UKTEOTq6XDlCfqNfrmueT73A9oXs1n1FZNtCY/C3ZY5?=
 =?iso-8859-1?Q?2vU6VoDXG8Jkgu7WmZk1HGXFMxcYgClPmXfZacVyb+flvCXq4ijYW4jauj?=
 =?iso-8859-1?Q?EfAxKr11ybn75IgiOt+wO0UA5Y8slKfgKknTgxPiTc37H0dQWQJVqTAlyj?=
 =?iso-8859-1?Q?r0EIH3hx4ldMgyBNxbrScLARFafSo/nzyYASaa2wM+wwn458VKwBGi/sqj?=
 =?iso-8859-1?Q?PKIyy6QPs0ngwo4ZVdEQy7DIWvqO0amkpCBcBoq6iocNOh82+PakjpvCA2?=
 =?iso-8859-1?Q?d0QSr24nRe4/5cHeoXw1Dwummdcb7T78KZL6MDsI7/w7AdM5gGTji2WE1R?=
 =?iso-8859-1?Q?J7T5SRsfgRTAOxXJPc2po9wqVacN/Eb9hybii61dsZ8j9BihFVcWE4P8Ge?=
 =?iso-8859-1?Q?TA4Ov6DmCs51mZdJno5eH0FVMF5BBYQoJRXaW7f7vRBwcl9J3EyJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c06f4-c795-4fde-8d72-08ded135b8f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:43:00.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AltMeTFGjKhW7CmsZSPncNdlLI/kp/cwv2lBFAj0gla2AHDWYMlhqL7v7KzCNl2Z3FpFeDj7wsyYDQQfnPLeJJk/JSVaCMhaDbnqd/8Q+cymNaLB4dVhMz3SL33cMQ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_074306_481970_996D2266 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, Jun 23, 2026 at 04:33:50PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Tue, Jun 23, 2026 at 08:07:37AM -0500, Frank Li wrote:
> > On Tue, Jun 23, 2026 at 12:45:57PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> > >
> > > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> > >
> > > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > > ("ARM: imx: Remove imx device directory")).
> > >
> > > The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
> > > e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).
> > >
> > > Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
> > > later in common.h without a usage in-between.
> > >
> > > All users of of_device_id also include <linux/of.h>,
> > > <linux/of_address.h> or <linux/of_platform.h> which is enough to not
> > > need the forward declaration.
> > >
> > > Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> > > ---
> > > [...]
> > >  void mx31_map_io(void);
> > >  void mx35_map_io(void);
> > > -void imx21_init_early(void);
> > >  void imx31_init_early(void);
> > >  void imx35_init_early(void);
> > > -void mx31_init_irq(void);
> > > -void mx35_init_irq(void);
> >
> > which commit remove above two functions?
>
> These are covered by:
>
> > > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).

Thanks

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Best regards
> Uwe



