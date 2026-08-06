Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15511C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4/EG0Sn+dG0zq0AUL+5/zEiSsNzP6AVr+coqCkz4Bk=; b=KkG+o40lwqFXB94nbZ0wBDf50D
	SakHLZjAFWWMFphsYS9NiZwi3+F9+gIZrH/Ch/wpblEsdARaPEYZBKaRCMwqQqr71lP85Fv+VmUl2
	33I6bnVeMElqfNQDAjcTJfiXl5OzrwEaOV2mJvLJLIUYgh62A1+WHV0DlVL/pHdlrrBiWLxpCKgvB
	D0GeHgFfHIZFAAsoDR3FdrTyVJWLBomk9XEGnLhVx37E2yLBwC8C12huvjce5E+qnBPkh2eN6Udos
	rJ+QIG7ffk1PRZAmvlUto2iTJRpDzomiKe6kEEt9Zm5UhNbI0HVtYdBlv6Gz+610XkYqO0Yzru+hN
	1lozvjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0M1-000000068gu-1xdX;
	Thu, 06 Aug 2026 15:49:57 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Lz-000000068fp-2BAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7fHJ29LMX/8rohcoQM97AZ1nKiVXuuaf5V2CJG2yN7foN7pq2bnqYX0Uqdgxr3qGvw7y2ebZFTYF/XkqoqzZKOJ77SUeABeQw67r029yfYruwv7LvkiStTs8fdiBTx6BkcklSZueKbOli3R+ZKWj8CItl5gyUs+mr5rOhexP44bVpyMDfkokftZMJBMin47Dueg0i4sT6MKxY34bxiOwkC6gYEE/75Un8IdasDBxZfy/k3dEoyZOq0z1U6qIPhdMRoulM1DM6HEDPpyrsfOw4zOl+AOemkZ05ijsK06wXihgJ9E3hX8CECm+IvRegK6kZCXkWEX3nkurHjdAxvywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4/EG0Sn+dG0zq0AUL+5/zEiSsNzP6AVr+coqCkz4Bk=;
 b=CE6pVYKKb7mn3VUABTL89+C+pFRLpSb++fX00whFYb/yLQXAJTlLqpA5NtEV3KYwN3HV9Yc9bTgluOfSu9BvbV2UhT8D0TNGg+JnzZraX+9om9e/3+pcIHKX9F65O+ruR+/o7i+mYYApnCMJvbVJSJtGClivVwFl4/Agg4t14szTNQlyPP5HJEg5TP70m8mgX7YxBtMAZ1ngUAlNm9pCiopDyDow8YRzPo3dy6TkQseNZYKlNcQzzLTp0sWYeJ0fkRk3ml+xZ4INW+K3vEsVjBDYAuPQgDs4bq5EHRH146CtmSwvsyJIrR2t3UJzYLJ2QJYDP/3Mca4PhOYTTl/n6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4/EG0Sn+dG0zq0AUL+5/zEiSsNzP6AVr+coqCkz4Bk=;
 b=pmM726ypmZGKbV+Wp5jxY0s3indd9xXjM0CeXoe3T38qFduLWGV5eYKyzY5zSrnwLOCtE4ir45Iuc7YUusl3x90BWFb1HBtNwEpYCmqPw2cxSdch+PiREHkrotwdFAK0y+tYoo/vt7RcuuG2zffnF16uOyypqeFi9NnvxVlWl2O2R89kmBV2W0ow8q29rvi7TlAJ5DJryfeLwgPDZGNOrSvs/Tkxz0973Fv32g0ShtSwtlsfa7rfdHqYRZnevJsT/V6KDWBv9+a9F18Ep2u+og+gRxlLTVMsH5f4yT4Pwq5xjkxh554B5mhSFja1zdaurhUzxrCfNwt90GzwdjU36Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9083.eurprd04.prod.outlook.com (2603:10a6:10:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 15:49:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 15:49:49 +0000
Date: Thu, 6 Aug 2026 10:49:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
Message-ID: <anStE5woQ3UWc08k@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-4-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-4-nagendra.golla@amd.com>
X-ClientProxiedBy: PH8PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: c99acc43-4419-426b-dcf1-08def3d258b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|11063799006|4143699003|56012099006|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Yp7x8OCphDLSuTLG0vdcVOQ2deWCavoD/abrMDcy2ez1EPcwBFweKeqacD6mWzJ4h6bzp8ivPCKE+c1u4OGGItXYPz7J37AQtOG2vtRxjirWfHfiTJL1tYvlaYoSg2+X24kw/bZ1PIp26eDP2ExfEmUsBngWstArR9M40F2WDBMtIpTyAT0JE0XBtcMLz0iKzbtVgjtByeAAkY6YmHKBnn9pCCWID4a9xTB1+fBlhoqW0NxOEW4MTSoiVWb33nUO5Kw0NKBl0nBXcsvrlhNxPCoQzgGRrQOTvUk0OTsBsFgbeGOMA0nZhy2+FHg+kTABWli/egSxXksvvnH3hpEflE5/BymWfssUDIMbYjRPNebacxZyVVdZ5Vchs2acdzZyp7qEg6ehUJjmMgvA4skBqIlwqXtbgq4FMMTw23sShXQUqwC1XqwOMjohpSOzY16V66T+pNoUGnYoBBgOKH3PK91vw7X/JLFrHLEfo4ttp/N8Vgrt4Wd3Z6ySyGcKOvubYSlEVRa7KC3FFMdKAMwvPgQMCbDPV9aBG0RZkr72eOQ2+sPadu2iwTs0s+xQxtwWsXxOdzvxBN4HU4v6DpunT1KpmxyuNDxK8UgBYWn5q5th3bDdIxh1LgtUlSrnRC8jMxrehpUgnNETp806l1iECuv5mLVWmm/Z15vn9MRIttU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehxutz+Aff0y/1+L0j2DICmbvBrmMSF1Y8EJcwFDNn+WOeN9Bzk2ULJ90Zay?=
 =?us-ascii?Q?MwGdXLmEyZMW8kiFV1WJ6Mrdve0+coMiK/v8lSZrkBQU35Zl5jRq5xs9KBi2?=
 =?us-ascii?Q?lIH4Klx/RpapiCcEOZbGq7PFsBLFXHE/kQwcuNo/p0NUdUBeZTsbBlbmP8Gz?=
 =?us-ascii?Q?ThWfkJ51UELDPKlfkPu+qkP9qrAjRaRnDRVRDOJdwL6uSCYF7ZkkoVqwaYnW?=
 =?us-ascii?Q?OdJM5tGfjRZKgXdC0lvGqw8IJW/KNb4sb66u+nlvkPyA+QzmRL+oU5fJNA3w?=
 =?us-ascii?Q?Iz4r5SCJpCs0PN7plhEPvcj6vIx/8qw9mwszdSCTM3EiDNw/erlA7z6if65i?=
 =?us-ascii?Q?BRbyWVMgGN3bLCUJSM7qBTk4xwKgJls+71bfWc6S+X95BtD0wKrz+kYcNeeO?=
 =?us-ascii?Q?pQ4ADKxUbGutGqsbuEXbk25BJmslUGD1f5WBO1NkxvhKUyZJR60dEtQa5yiS?=
 =?us-ascii?Q?KqDoCGMvRzInVJ9ox911F2t7MoFqL1egIyjfF98dDiiiby546DA2KiFDx1pS?=
 =?us-ascii?Q?G+IEKraVo+mMX9PMx846UV//AImWx+EfIcszOwQvcmaKOCGxJTvAbi1jkBth?=
 =?us-ascii?Q?stMJisBWdWpasz6+gAGB1ilKi4qvxh+yX8YqMPmhbSeHVDwyprOHSgztY9/c?=
 =?us-ascii?Q?YqRVr6rYccYah3qjUkOkgGeAFCBwGTDOY7hCfM8pm4S5rWN4plTEzQtmjicC?=
 =?us-ascii?Q?/xB7U2umcDaTzA1WcYpoD8Ed3/mnm6eNpMNJGXpmb9QBgPVgITOK/pp4+pBE?=
 =?us-ascii?Q?FJexV5K3ojOnyyGbJNnBQzayrjeUtJD50PIdU4Cjh42m4nQ3Oixa2MsZfooz?=
 =?us-ascii?Q?RjI1Zef1gvoGreuX4UtYBtW2KaeU6MCR5mjNZVNrCn/Y6QJrw07ersmY3dkg?=
 =?us-ascii?Q?mZFhKy+843TtLY2yOqoQ7hUCATvKB1arQ9IDRPsDH5pU5CjGq9coNwbTwKaY?=
 =?us-ascii?Q?Ok6aYgBu03x1ngP09GgC+BS561dgGhyvPPJmiJ5+xlVtQTX7AbFN7en7FH7O?=
 =?us-ascii?Q?B/OAzInk0rCI1PGvp2TdwN7qtUWuEqWDCEqI2inn1GcS/9Rk1Yq2019EXzag?=
 =?us-ascii?Q?E8ejiVtFqXKVXao9rqF9Z39/XZXW4D5HEMi39zxog2pn3OFj3NFfzOlh1uDe?=
 =?us-ascii?Q?48RUiIx1SrXb/Ur6jJVFsRhldlyyM2WH7Cb/bzpiAbDhPcuUsCoMi77H9TJK?=
 =?us-ascii?Q?Z2uILs/YhIlONJBvvDLQVhgyszP5EE+xT/L1P4FgwvoFCFM2zKb+Y/XO1NHj?=
 =?us-ascii?Q?iAtkvhdgKheyiiQHOWZDWYOsX8EmooHWjTvHnoHVTUEvejUQh9YTU1bYuKh8?=
 =?us-ascii?Q?ESiD+0SpddtPAvGXLtL5QD0QwPYiyNAcpFJXdVEhWQb2RApd1mYNr5+fG2nb?=
 =?us-ascii?Q?hI/U+vo3OSaHitGtDanuOClDp5ofBbn1Z6QmFJzX18xDGYK+HXsw3Uaw+Trx?=
 =?us-ascii?Q?Fy8KYCyoeCaoktwfs2DS6VbKi8ZvlT3AkInX65dbEH6rIpLw8n0VydC+Vf+4?=
 =?us-ascii?Q?QL9sU52TpKs+Sh3VCNdtxkRnMVABe/0V2vp0AkO04zJRNMjypEGeWNc/3uM1?=
 =?us-ascii?Q?PXl49k0fjoZPsxEsMiLT2UtDUZFuuQJ+PQC5xA3ZUp7sKMa/CAiLrkf4g89p?=
 =?us-ascii?Q?BBS75ioXiD6pDTXnQX5TgRgwpETuQcQondRrZ6yBDcNEJOoRWJXj6zIxhS5W?=
 =?us-ascii?Q?eXxSmJNPhMvJRx93xjyayvz6eu4fWvFHPR97y4GmB4NDrSAlG2BEPn3Oo6dP?=
 =?us-ascii?Q?vF+b02KMOHyE4TP0KzWPE1tpcRCVqf3U6ci4cWGuhnrK5Ufa/7uu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99acc43-4419-426b-dcf1-08def3d258b4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:49:49.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pemdqdqDfkgDcdNCaViPaCYUoVWvOXlWnrcBpDL4I3H2Cm4T3dxmVjf0kRBtXHQivYCxEwO4QhIpUVzd/uF2BsHPxHuKgo39iYWb9wc+9lFiT8DYGdRXZi/r5FgXgYmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_084955_558965_0F0C9750 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, Aug 06, 2026 at 06:00:11PM +0530, Golla Nagendra wrote:
> Correct kerneldoc comments that no longer matched the code.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/zynqmp_dma.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index f7e4a177bd17..c5b05fd52e9d 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -208,7 +208,7 @@ struct zynqmp_dma_desc_sw {
>   * @irq: Linux IRQ number, or -1 when not registered
>   * @is_dmacoherent: Tells whether dma operations are coherent or not
>   * @tasklet: Cleanup work after irq
> - * @idle : Channel status;
> + * @idle: Channel status
>   * @desc_size: Size of the low level descriptor
>   * @err: Channel has errors
>   * @bus_width: Bus width
> @@ -435,7 +435,7 @@ zynqmp_dma_get_descriptor(struct zynqmp_dma_chan *chan)
>  }
>
>  /**
> - * zynqmp_dma_free_descriptor - Issue pending transactions
> + * zynqmp_dma_free_descriptor - Return a descriptor to the free pool
>   * @chan: ZynqMP DMA channel pointer
>   * @sdesc: Transaction descriptor pointer
>   */
> @@ -617,7 +617,6 @@ static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)
>  	zynqmp_dma_start(chan);
>  }
>
> -
>  /**
>   * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
>   * @chan: ZynqMP DMA channel
> @@ -908,7 +907,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
>   * @zdev: Driver specific device structure
>   * @pdev: Pointer to the platform_device structure
>   *
> - * Return: '0' on success and failure value on error
> + * Return: 0 on success and negative error code on failure
>   */
>  static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  			   struct platform_device *pdev)
> @@ -1042,11 +1041,11 @@ static int __maybe_unused zynqmp_dma_runtime_suspend(struct device *dev)
>  }
>
>  /**
> - * zynqmp_dma_runtime_resume - Runtime suspend method for the driver
> + * zynqmp_dma_runtime_resume - Runtime resume method for the driver
>   * @dev:	Address of the device structure
>   *
> - * Put the driver into low power mode.
> - * Return: 0 always
> + * Enable device clocks.
> + * Return: 0 on success and failure value on error
>   */
>  static int __maybe_unused zynqmp_dma_runtime_resume(struct device *dev)
>  {
> --
> 2.43.7
>

