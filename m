Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0C1C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxwMnl7z+NzKgWuiuuVuTfo+0f8P9fW7Ip7ua2ddals=; b=ODARl/FFHMZakluaJDYnjRHAt6
	qoG7jUsTvSGm2WNLmRpzoWxBIZ72xKohod8n3l7s9z6l7PcSvQOM7qoeKdr2uAnl8PAJolggqHOjT
	aQPtf0cb0KUPDSIoRb3Kf3YTUKCzYuZXb8hxjEP6MYbTXP5Ar17LEMlNNmF1w3wi2KMhfg0FWzSgQ
	8Z7DS0c4Dkte7rQrj9ehVGJrxxEyte+Mtg86H5mIvc9vN5z8KfLmyS/aGg4ruKbwdfcsaW84KOkXp
	Vo9Ma/YjGuaqZsbCqkwlS1GDzYLnCB6s7dHOffAz707ytl2Oi/bB7w1Gktx3cDPh2tqXjHsOg5WMr
	nXGI2wAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvRf-00000002xvz-2RkS;
	Fri, 14 Aug 2026 17:11:51 +0000
Received: from mail-northeuropeazon11012063.outbound.protection.outlook.com ([52.101.66.63] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvRc-00000002xv0-14aV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:11:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agG5aW/Qw4ae12p3ZfV83SpwkJKqA3wN8uBX3TYB5yc2cytZBNAhfTEiZSTyelPKrQSg7/qbBPdddb/tLE6JU25NXva/OmaTvRB9maMUO+HBgNmhD6lcl6pzlnwN7gtGjYupYcpjyGOKoLMzielK3/lc5BKcx4fVrVlKDwmoTAKs7590G1cgkV6DbK8LLruvL1wYQA566KnhZOA0sD0OO2YN48bP6+GlKIR6xYGGIF00sdyEz1dSO16oKAbj/yIZtG5cwvVE/gu+z2LWcvBjeHTV8pHkhZReQrqvMoSuvIaD45QD87Y9OAznsK5HyFNnHrsZS8GnURhwoiQ1lhzPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxwMnl7z+NzKgWuiuuVuTfo+0f8P9fW7Ip7ua2ddals=;
 b=D5l+XpbyxtbLVoaX8BA9giagN/h5r94svwaw7EY4iRboHZ8qLR9wQ+uqNXbWzmK7WXhBnwk4JzMAvKRh307JG5KrBm7XZ7za3jkMITvSeO4x0rlKrwMp/k+q7TxMT0Bu6O8VxsJDSGuapXmIhZhi9OpiflIOmDbjoCdBEAtpmKg2K1NXgIvk/i3V6Tw+p7NhPnWbUpj1tPhqbYaY3SrR/d7eszjatfUyToQaq3eAN7+mqYvuqSovG1INK7fsoGSA49zrmTHzRJhK69kgN82pCxODuPf651rTTPb/zGR+Y4Dy0dvVicuTe9GLkLKHA8d2bXLOKzpPRvRHiH+CCpte9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxwMnl7z+NzKgWuiuuVuTfo+0f8P9fW7Ip7ua2ddals=;
 b=izZndqY/AiR0IdvqBQByblJVUq/rJGAboAcPtat40A/e/UNPtqPngHeDsFfJ4W693Sn+0nvnZqWMqLk+govuvEyjAjEeudZqTg5SV8Snhta0S5lp3fqLcWQwSzIcMSEn24rLRg60tN+++RzFwzfm59VA5cbtFSwLovbmKPGeuRtmUgQNp+9IAEypuYkfn/8SkuTdTekRLxXbNL3W0/xC4uS/RX08wCR0eqbeSNPyU8uoCFGezZwcTtvS9PAXzixYAVvhAnLdyGb0CrE3PRB+hYS3logMBUJubCdB7+RxcmTCPTzBQbJ9t6pTdgGAi8PpAghmUO5TBBxV6M3yFCpyrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:11:45 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:11:45 +0000
Date: Fri, 14 Aug 2026 12:11:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 7/8] dmaengine: zynqmp_dma: Reject zero-length memcpy
 transfers
Message-ID: <an9MSn71FMR1Y8q_@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-8-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-8-nagendra.golla@amd.com>
X-ClientProxiedBy: SN7PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:806:f2::19) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: 504b7d84-24ff-49a9-47d9-08defa271e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: 30odLfPRbqw/GHaCIENll6OW9lyXDXoOKXijdM5PasjD3+l1ci8HkjfzZ2QKG8/yXLR+TWDejMWvr9+UgKdd6XSM+3UBSGoYRAvJ0SxRSQu0trMSfhPYHfJMvOODJwDSRlNDo86aybaD14CMbxi86iuKOImRl+K6LdiplIjl1DLWcZKhu4sBFPaHW+SZZDaaJi/T41i14dTt+9o4OPGsZ4roiYxTun+XD7vrYV0TM8yuX5WJdHhh9YHAZUGJZwRZiDPOi8mP7LUlh9foXoHTlliXxPziSq0R5LpF4ctKAIlcwK4o2uGZ6wyIWhkUo8P57uAsQVHQzBuSOmwzVy/zY5mVih5hPUrRMVMqcJa2f7+EjPegcxKd6NmUvu7WFc3HcUR/Eg8kdmpLrab1dNnLlJUFNa+a0uGw0Nr3JoFD+wv7u9Tb/gdou4r/gJ0PWkPWcolIt1/YZv9VYlTovKCc8HLTmBxc9hIfGYrJ7dCohgGpDTFScRd8rgioO0nCY/UuvqaqTUqxuJ63AtcEAeLqo2IlzlBwtXL2oDMbF6mUcGDPzV4Ymy0AONmY2sbbGAilF6GzlWaWlAwt2+kxNcnKuTMeSryOxARryjnmFt5XJjewrSHndr/4YJYKJgNZE/rw3pHjeKiKcTPeTyalAk4TxOOqcmqeV8A7FcVUzj6qBpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXxch8MsfxToj7bTVQQkhgGEu5C9e0fD9WsagjDViS695zj5K0Hvlrcmqtyu?=
 =?us-ascii?Q?z6dU0tdGKf7/PyskXkX2Gz72E1pq/A4isvfwjNylHHytHsMeMlpvCwPEwwRu?=
 =?us-ascii?Q?i+3wtI0q9HS43uJZuhIQMh5xdjIsyUuHACUsMTIQkB53yAYap3SshlaU2d/j?=
 =?us-ascii?Q?QyDP8CHRhwdFCqahDEZ9S3F5uoRrUSZwJmAmmp98z9pcIPQcKdkPO3a90a5h?=
 =?us-ascii?Q?2US5pcCGZarIElnc4zvBZaFP+9k8MC2Q476q3r+7FC6xEHGrAoJskXImBx0X?=
 =?us-ascii?Q?m9PZhTZsYXA3IZxVxZHrEomNfFjYjDjkq8wb0L4wfH+t6XZ5mA0sBAckTDfA?=
 =?us-ascii?Q?q6aOIAbWjrVRuFn9vjpt4eI/XLU0OS84p826sqInqWJly3gqhQvmYNrwwxwD?=
 =?us-ascii?Q?/vWAkWDwY66YuUCO1oWyBE6gkP7RxsRT9AoM3hM+AqQOse3mx6N41t+LUZXs?=
 =?us-ascii?Q?40WKEZY8NvZ2iYsQs9snFWtT9/CERLuoNJRawhfgYtWgBapExTyTcGVTnTNA?=
 =?us-ascii?Q?3KNiFeIAqe0gALb6ypKvC0p5FuTfq7N3OGbTlfHjnRHrrQn9215rNZAW7K5/?=
 =?us-ascii?Q?rrv5CnyxNUacWqxLgmZTNFqHCFz2zwA3ERhSaa2w860eb0lniL3bR3O97uNf?=
 =?us-ascii?Q?I56yHK/ts4xm9vi1wjq6Q6N0fHRfJsuSLE2M81i7BLIW9YOzo01QU/6EZ0ab?=
 =?us-ascii?Q?u1ucOzB0Hd7ZMBMwxrLgCSSi359QkSqdd7h/s8S8oCPBeA+zNpiZnUpme/Tb?=
 =?us-ascii?Q?LIL1DG+M02f5A5dBinCIr8xnwiA1+ml2tfUkMytG+gKsPHac61msvgh7A1JO?=
 =?us-ascii?Q?54zg9N0mzJlBOCMd1XDzW2Ug7jbkFaKjS3S0rCiIrhatIemONf+9tGGsvphI?=
 =?us-ascii?Q?85TlMtsLQf8+nk3qb5pYxlwewxkQcNHusaMNHzK12fsrS7FnuRn8orWjIzuX?=
 =?us-ascii?Q?4st0Dn5fibaLvvcsyXnBOL7VITLIVZwJX4q6FuqYviEW82U9gO8uXnXtLrZo?=
 =?us-ascii?Q?yvFVGM5Jj8Yi9JxNQPKqq1EPSAu7PJY2/BHRvyjwIt3hnDBGH2szPuRfMFGa?=
 =?us-ascii?Q?WRhcIh6bXG1oSqTNjI2mQY9fQRwbs0xPrS4tBpPX40M2YlEq+7SzpXspPNXb?=
 =?us-ascii?Q?DmlHy0w3DROqVlP9HfwSFsBS2dRbz2Hmy81DnSxloR5F0e3rH3hhizU35ULR?=
 =?us-ascii?Q?TeGsGsDqFBwCsL7bfrKOE8fHzzBNJ+AJEiSGrvXao0RSfy4OMEtr6kjvgyLs?=
 =?us-ascii?Q?DwXt56G+ToRkh+v8r3H1V9x6YsudATK2GeX6VZ+jh4yKWiPbIcjPL1K8lChV?=
 =?us-ascii?Q?kSOCoIdnhuPQwMT0YGsGKeInwZBtgS1abS5KUUvGMrBlQeZFqvehdvwk8CFy?=
 =?us-ascii?Q?f3ttAeVK9LEEJMDZOvNLzjSH0RH9na310t2AASUlpwwuXtJzoVZaXkqIDzk2?=
 =?us-ascii?Q?ju6HUdR+fUz8kWzY3opW1upPfWfgyPsC2kHupJ/1+FbqB5Y+TWPohYo3Qkv4?=
 =?us-ascii?Q?uwSeL22Mq8/v7DW1NPP1sjyj4/bGPOHtFwa6b6WrsFrgQ2nGVBdvq6Fl7bLa?=
 =?us-ascii?Q?4vJXBojZSjcvIo5WJeQMJq5ZuIzU1ApnDgw/6nKP3MIYXzU1VZFaNwW0KkjS?=
 =?us-ascii?Q?Ml08SCsTSktDWlJmYBlqWvlcuZSbFskuQ9uCQNINF2GNmKxrwR0k0c4K1b27?=
 =?us-ascii?Q?INVK1xI1ttsKn2PUnV+3hZtBDD3GqwY0rgE2edPfbfbf4KlgvbR/hSrUXbh1?=
 =?us-ascii?Q?Rxfx3qNpgvW1EUn0JkCABk0YtnIzsD1O0Mzc4mXaPvP9ZQQ2Ckl8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504b7d84-24ff-49a9-47d9-08defa271e26
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:11:45.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neJIyJB+o68+zr8ULKWjB42XDBaTOqaE/U5lUC02wwBxMZl/feSiuGnNya4JSpORTUtmgJhX6akNXQvF25AqvbLR5OCLAY/Wb8kSlBt4ahiOeq6BBoRJWHwswHUCG6eJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_101148_296105_20F9C6D2 
X-CRM114-Status: GOOD (  15.90  )
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

On Fri, Aug 14, 2026 at 10:26:15AM +0530, Golla Nagendra wrote:
> Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
> zero-length memcpy at prep time and document the behaviour.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in V2:
> - No change
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 194abfd6cb25..921d3d9f6ed6 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -837,7 +837,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
>   * @len: Transfer length
>   * @flags: transfer ack flags
>   *
> - * Return: Async transaction descriptor on success and NULL on failure
> + * Return: Async transaction descriptor on success and NULL on failure or
> + *	   zero length transfer
>   */
>  static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>  				struct dma_chan *dchan, dma_addr_t dma_dst,
> @@ -852,6 +853,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>
>  	chan = to_chan(dchan);
>
> +	if (!len)
> +		return NULL;
> +
>  	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
>
>  	spin_lock_irqsave(&chan->lock, irqflags);
> --
> 2.44.4
>

