Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B6CCA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBJy2i/9yHzIpaBvNvBsunSFE4MK+PW07Ms/iq+pt1k=; b=HiVJ7Oeuh/gwYWTurxaiqaH5I9
	y9NIypFNi9szSNtNQZ+SMeWffkoQrk2HGTpDHOQqnu4TDpxVD4g4wj+24Jhy1ULpOfDEwlmDh+1Nc
	jZvJh13VsBb50VIT9tN/xWZAwnuq5N5mobJrkVFpPZRYywwrEUOIsSh45nr6HdEtDEx/zw7Jk/ecW
	a28jo+zLz9olO+RrWWWjlIPdphtlupZ89CTTCIqw1Qin6j3l2rPQFgDOJzyl4OwB/QQDMBX4TynAK
	/x/t1+vleQTRB6JfCmtX8+Q2iuTRfhTurQpcyIyeIBxYYlZLr8XAIkXqzJxmfFwRUEe/6Yccfvbu9
	daJ7AV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJoC-00000009jvW-3ied;
	Thu, 01 Oct 2026 16:39:00 +0000
Received: from mail-westeuropeazon11010049.outbound.protection.outlook.com ([52.101.69.49] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJoA-00000009juv-14oL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBSUFmWWatwamfwlQVNyoZMrQrvtYDq7XJSvCF3+90TEwZbB7k2zhVGQIpllNoQTRXpQHzOXxNxDsecQT3LsVoIFlsApt4hIWhtWQgGCfOPFgm8NgBeKjuus7z45iprRqio9lgziybOGWeewC5yhkMyDv5UIK0Bp9PRbJjR5vuL7Vk1KbiCCmrEJS2yjRRqeZ/Woc1/6SSS4dcA2nRlFELQ2nbsBB8YPCoqCJtlnhH57HwK3lweI3Y5LMkI4HyUm7zi9FVFIojlT2PvhwQ9jkO0Y3VlU/IpqCJI794YzpIcYFMjfyHnUqcg/U7UxNoex/0VxqDpEGSyC3rzzBJ/3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBJy2i/9yHzIpaBvNvBsunSFE4MK+PW07Ms/iq+pt1k=;
 b=EOHk5NCbF653ZNbXmh/rCeQGi1XreUkEi2Pk2ElrZSsjWrLxxaIOhv7Y+e7hBia0PXtYK5qFpKO41FvgY42EWu5NmCrS98UoOq7JoQKnv4kp2lByc8rjdUPusDD3NX0UydFhcA4z6qJFIkR0muGOmEhQIniI0Vn7FZROOYegzln9pgqTNpj9o2uzGKpijteCDF0CQHACRrqjsx2q+9c4OMs5N2mExHuthYxFDRUAiE2HF/4K1DLFpmdGa4JGuo8Q/FLK7kcoJkb7ksaOXNI4XfxFQLPzuOSuVCmkRgXa85FXd4T+IPEWta1WJ6PX9Fw5jV5mh5OKyzex35zIe4gDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBJy2i/9yHzIpaBvNvBsunSFE4MK+PW07Ms/iq+pt1k=;
 b=KtpSQIVT67fgN80SQ3VNvpNK6pbw2VK3NvRiMYqp9cDshmQpq76F93lqa71hYm0Z8zKprGfKWNivdVaa6tCyvMwmLmams/O2b7KDKQ7+t/Y1pMmTZTi3vq+PlSUTSuP/I5pUpRCxDRmRorytjPzwPTR7WtbMxx88nLvsJreP7EIin0j7f9xEcPkm77KTEK8hd+M94Iq1Ob47efFpC/ETeiwy/W6AU0bnHo8xCOpP/Xwy0wx2as5367lUNCg92FJjQHuNl4XSbYyew0V2JBY9JTsB4PuF0H7P2NdlMNAZxa9dmueh6BHL6wCy++HkcUwK+ov2S4+HrpQQVzYk/9CYaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MA6PR04MB189634.eurprd04.prod.outlook.com (2603:10a6:250:56::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 1 Oct
 2026 16:38:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 16:38:54 +0000
Date: Thu, 1 Oct 2026 11:38:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jeff Barnes <jeffbarnes@linux.microsoft.com>
Cc: linux-pci@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	roy.zang@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com,
	Zhiqiang.Hou@nxp.com, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "PCI: layerscape: Change default error
 response behavior"
Message-ID: <ar6MlDEnEh_76AQd@SMW015318>
References: <0FEA6868-5A7C-4955-9FBB-BE9A1AE8D3F7@getmailspring.com>
 <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
 <ar6KqnfQ4S5jtqeI@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar6KqnfQ4S5jtqeI@SMW015318>
X-ClientProxiedBy: CYXPR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:930:d3::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MA6PR04MB189634:EE_
X-MS-Office365-Filtering-Correlation-Id: a1647f82-e099-4144-a918-08df1fda7b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|19092799006|366016|10067099003|11063799006|56012099006|4143699003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: oDnGINETcwXLQa6vBj1lhdc+7Ww0auMd3V+O0VtdFrai8MWSy+rF9gw/f6yk4j1cfMraIbbrEIz2gJsiZthg7qRTm9LL9EKIEUyZHArzjSUn71amoH1R80rBYlFp0nyppOzAAGTRHsftFjdBVJuyjh/OMP61rj4pSkAVo03pK7CL6+GuRu7WnBEjVFICRTJH7gISFPo0RIQM9BKcVVls9UDuFt35psV62BVYL+iQ0VBCbrOM0j+4zyGJ5/KwBe7hDpyRiaFIjvaMrfXvF4IXRFu0M2HDF93JOS/F0Kqs5skDh8DbiKCxu66QMwMqCCZg7K7JJroFmdw5tR4n5lK06Zy0ZcW4Y2/3glCKbzuKeDSqkixHNTVKfWVp0oxqJ81Al1a1mMEPtZmmQJtVU0J8puLI1Czyb3wbun0h6WvDWuk+HCMi8e+K09TMHNUNdDN3UkugWU5l2OLWQ6LWagEjZUsPrOM3I+50YXDQAy48AInWZgPFHG3KO7GgeN4cg7RLLB+13hI9rCuf+dZqnfnZ4pN+L1Az2ZXeDkuHYY0tsgEgl6gTpjqxB6AjPZt69HyRzweIy65Erar3+WpYuaPhcJm6JwEvYD+/YohYxPBcv4lPuWw1v2D4anmYj9Xxj7WpmsaoBXucCZFGXXh651JL+1BRY4JTEF7R1Z8MoMz0g4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(19092799006)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dNzWj2Y24iP+6YyysQfol8qXVLakAqlx+ySOcBWWSHsAJwc5qaLNheR4kSoM?=
 =?us-ascii?Q?Ipop1UsZT4Fgk/IcZcygkCASH0A6M9zRDPHgZMAr9mTd9iXOxSHxCixInkjv?=
 =?us-ascii?Q?dIPiTF+pxGirgw1+T59hd95WeneKgQBT6rl+fv5Dy21ExddgzT2Qkj+cw0k+?=
 =?us-ascii?Q?gB061AAogKLTg9zQoZ+xvzXkqEQ9G9Wo1p7DwsAQbeC77GSNifFwO51kQocF?=
 =?us-ascii?Q?n6VP9qFjiBiB1soqNWrgOtnsNdY8fXYEgjwSVafwrbkJi0BXiY4qgPZASQRE?=
 =?us-ascii?Q?d0acFaxeWKFzaB9nVnTlgyhggaB9f5cuEXwtZ5mujCt39pZLSZW5/E6NazgW?=
 =?us-ascii?Q?KGvRJ/rMI0rhbjYzRFOo3j0rpUBdbeDtmuMG+RSGeGD3+2Skbowi6bsUMaPx?=
 =?us-ascii?Q?l/HzjGHg3ZjgO256F5r12mn18UDO7b40q0pJs356M0AGv62KIaVjY1+7wIOR?=
 =?us-ascii?Q?q7kb4/nH0XWjFRtX2P+MekxVvKCqjRE6qRj12dwe3mbyl0JcC9r1Qox95aJi?=
 =?us-ascii?Q?Za4ajb54MlK27niDLRk1LCFJpJZ4OEn7IRU3tze5qN81ciHtLUJBeWsuq/6d?=
 =?us-ascii?Q?H1GItxTuVrTsdRPgBGCWai7zlVB+pSC26sQTqFUl18+5p8dDl+5EKpNEn76o?=
 =?us-ascii?Q?ANTqoMj7uDtR3/WK/Ed9M4OCONZLzkiMn8co+KzY0s630qbr5oJhFQiFC7BU?=
 =?us-ascii?Q?SxcSQOzMKl2+TnuWkOg0UfjquBS9JN3tVb71c5HU2ALoPeDM4w01qBm1gfLd?=
 =?us-ascii?Q?cFtLJt5YJrqmXmzapV8q59yEQp/YXxWGuHXSFYZ+/lltyDXZmTUbp3mFZjTc?=
 =?us-ascii?Q?ohF3OxVFp+PNbqlNIKloUCi2Q27jDCkNUUDHjSfu71/QOaknfkItrIR8365Q?=
 =?us-ascii?Q?fwQyACjJNPTQnf2eCKdpeCJyEvThI26fvCP5mms6ErCnaFhI0AgJ3MMgpHpL?=
 =?us-ascii?Q?q6ZqJK08LfsyRfVagJx3/oPiYC/QqFb/Q9aTTGbFWyzxWT5lbD2nZT2Dac1v?=
 =?us-ascii?Q?VacardD3A7IVtuHCRkOm6du0zIszZ1CM6/FaIZEQrjBeDWYjY4qKP566tbhv?=
 =?us-ascii?Q?V74844mO05oE7YZLtCxwluRA1XWyV6wIC/RWrBVU+zIbX2aDVUr6ejHif8L6?=
 =?us-ascii?Q?RX7iH3Kffg4yEvl7jbk2fvbGQJHhgSXhqgMQzOwZzrSRXJipQRhB4QDjqi/m?=
 =?us-ascii?Q?ioJ9bmy51iQ7hTqDRlB+NOXcZrrmWGbMS7SBnyQKwQzW893l/8kKIzPG/9AS?=
 =?us-ascii?Q?QsqWDKhN8vXRxIwtC+A4aacAnoNA0WqPy7h/RxE33Z6GuBL7quKdtoMHoK3f?=
 =?us-ascii?Q?T6/DDc6JQ7Mx2VXwbw+upjRzgzjKSSUnn4HTTePkSQ08zhCtLughW9T2kaDB?=
 =?us-ascii?Q?hLrsTsjaRXaqI7AEmUzfi1Y4fDyk4nZ+cm40Spv1s9qxw7rNDOM3gEEhvO2G?=
 =?us-ascii?Q?XV2piO/OcW8QrRkqxTvHJd6EJYJaRRw89Id29SLlJrfIzu2cwluBf2/OyYiV?=
 =?us-ascii?Q?fWkA8/kCJsLgHhK2yrsqQap8zHlusBbBqNMjIIFiOXUc7KcgnBxYBm/p1UWi?=
 =?us-ascii?Q?vJsM/CW3kR4o+KhtxkODySog/+E/OW6twK8Fyb4jqGE68wnCDJVk3RlnDmy2?=
 =?us-ascii?Q?sHGy3APoO4UanZKZbQEZzNDrwdhMfGB3YPSiBTGP7nLxLD5/9kf2HVDPJopO?=
 =?us-ascii?Q?50z+bgE9fJGPdj+q6uwfm6feRiiqmEOHTnbQ0Aiw9raBkqtxa45cKlCrflCe?=
 =?us-ascii?Q?dVOcix6e7VQxYr4m/MujSMay1J1/6FPfXjCxP2bPZmGz3kKyzfAG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1647f82-e099-4144-a918-08df1fda7b27
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:38:54.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNwxuROCdHIK5qq5+J+3P+jLqJz4gvmUdbMohFDIvqKAEDQISuzMT9tGvrJ5zOPMUH7BdESyg7VGrsPtB79bdpxEUssfLFrewOiu/qZWqzkuMXOKblb+/gF4lehn7wWc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB189634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093858_297678_40A705EE 
X-CRM114-Status: GOOD (  31.62  )
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

On Thu, Oct 01, 2026 at 11:30:34AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 11:33:23AM -0400, Jeff Barnes wrote:
> > [You don't often get email from jeffbarnes@linux.microsoft.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > This reverts commit 84d897d69938
> > ("PCI: layerscape: Change default error response behavior").
> >
> > The Layerscape PCIe driver programs the DesignWare
> > AMBA_ERROR_RESPONSE_DEFAULT register at offset 0x8d0 with 0x9401.
> >
> > For AXI, the documented default with AMBA_ERROR_RESPONSE_GLOBAL cleared
> > returns OKAY with all-ones data for errors on non-posted requests.
> > Setting AMBA_ERROR_RESPONSE_GLOBAL causes an AXI error response instead,
> > with AMBA_ERROR_RESPONSE_MAP selecting SLVERR or DECERR for individual
> > PCIe completion errors.
> >
> > The value 0x9401 sets AMBA_ERROR_RESPONSE_GLOBAL and maps Unsupported
> > Request, Completer Abort, and Completion Timeout to SLVERR.
> >
> > A PCI configuration access can race with the link going down after
> > dw_pcie_other_conf_map_bus() checks the link but before
> > pci_generic_config_read() performs the MMIO access. If the transaction
> > results in a Completion Timeout, the Layerscape error response setting
> > propagates it to AXI as SLVERR, resulting in an asynchronous SError and
> > kernel panic.
> >
> > Reproduce the race by obtaining the configuration-space mapping while
> > the link is up, then disabling the link from another CPU immediately
> > before performing the MMIO configuration read.
> >
> > With the error response override enabled, the overlapping configuration
> > read results in an asynchronous SError and kernel panic. With the
> > DesignWare default behavior restored, the same test returns 0xffffffff.
> > AER reports a non-fatal Completion Timeout, and no SError or kernel
> > panic occurs.
> >
> > Restore the documented DesignWare default error response behavior so a
> > failed non-posted PCIe transaction does not become a fatal AXI error.
> >
> > Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> >
>
> ---
>
> should be here, maintainer should can handle this for you.

And avoid post new version at old thread, which will confuse patchwork and
other CI tools.

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>.
>
> > Changes in v2:
> > - Change the subject to identify this as a revert, as requested by
> >   Frank Li.
> > - Document the DesignWare AMBA_ERROR_RESPONSE_DEFAULT behavior and
> >   decode the 0x9401 setting used by Layerscape.
> > - Clarify that the setting propagates Completion Timeout as AXI SLVERR
> >   rather than causing the underlying PCIe transaction failure.
> >
> > ---
> >  drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 14d6ac4fc53f..d333f1ae8a41 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -28,8 +28,6 @@
> >
> >  /* PEX Internal Configuration Registers */
> >  #define PCIE_STRFMR1           0x71c /* Symbol Timer & Filter Mask Register1 */
> > -#define PCIE_ABSERR            0x8d0 /* Bridge Slave Error Response Register */
> > -#define PCIE_ABSERR_SETTING    0x9401 /* Forward error of non-posted request */
> >
> >  /* PF Message Command Register */
> >  #define LS_PCIE_PF_MCR         0x2c
> > @@ -103,14 +101,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
> >         iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
> >  }
> >
> > -/* Forward error response of outbound non-posted requests */
> > -static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
> > -{
> > -       struct dw_pcie *pci = pcie->pci;
> > -
> > -       iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
> > -}
> > -
> >  static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
> >  {
> >         if (pcie->big_endian)
> > @@ -180,8 +170,6 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> >         struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >         struct ls_pcie *pcie = to_ls_pcie(pci);
> >
> > -       ls_pcie_fix_error_response(pcie);
> > -
> >         dw_pcie_dbi_ro_wr_en(pci);
> >         ls_pcie_clear_multifunction(pcie);
> >         dw_pcie_dbi_ro_wr_dis(pci);
> > --
> > 2.43.0
> >
>

