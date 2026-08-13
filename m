Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A147FC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG7ctsKobDPjRkb4E53160Dz3SMV8TWfw+u19AaN2wc=; b=RXWvXXzy0R3BEwSLcFbeI1Klyb
	pOPeVNbAqETmTfwQ5h6pP9xYgP4V1g0k7rxnRqYARd7rfHmtx08u+GyUJx043iwK6KMvaCI20HXR+
	IDjClB92m9p4H0rpKpQF7qCs6Es8RtCTG+zXFsXGSo6XmXJJrWX3UkEzdatComFKmYtVe8ZtS79KW
	viNHZyR6+xi94p6AjfrFiJeRt5+rwyi3v7m/ZD73o1/+kSeAIMA/7e6D2S3WbA667lgQOQ9iLt8+i
	RyCTtJGJx5j2mkzbdo/HKaD4iUNcUgZ2ey0ZPwhGLbWuhVMXoJJrHqScESBAdK5tiBaQFjqdVPtnx
	S7nEdXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOD5-0000000HRE8-3qqe;
	Thu, 13 Aug 2026 05:42:35 +0000
Received: from mail-koreacentralazon11023101.outbound.protection.outlook.com ([40.107.44.101] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOD2-0000000HRDU-3DLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+ZRaZZlhGjfOnkx5TuTG5zE2w1KbSVZMcLtB9HLmzHvBWRkFwchKvdg9uxIExv0icCVDQPOsC8YkwQ9ShBSdm4qK52l6WC7MQUHMaFuSj9Um0dfI0Bj+7tV81bSzAMUiuogYPR5i/d1TeVZj/UIbAgO/sFdd2vI/+dpruoJy/9xZ4aZI8tlSXXmQbUR3Eg+TkRPXpAyJc5q139iNZ1/kXo6L8KhWCUK04C3WJvqeD9xjZSPy5sC2kDZmjw4bNMZkiHABNo3csIAF3kRxZwsYq/oOre3lB55hz3z1bDtJmt0i8jCxrnN0AyM1y3dDuG+gx6zyGevpiaUPaDg0zRQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG7ctsKobDPjRkb4E53160Dz3SMV8TWfw+u19AaN2wc=;
 b=F9Pv6I0YVlbnKW6JvW6geCO61QYpWhDCDd1mwWcxF6LXh9XNskDNeoAhQ5p61O5zRslhYhdsnfwUkiy6W2Op1+E9W3yjdhOTjkJd6nrp+aUsRpSO4GUwArKp/45MRmTJgz77c13IGfRv42Iy8+L/U+nWmB+k7P1oPV63jCcZzMm87PmerfhsEBRlEqpbwW0Nqm9XUzCDaqhL+Rg/PBvEhqeHvEJOudSiQyeleNxkGYqNRt/4lob64chbX8Cd4DpdSRJ4xC2RDN8pMMDYAmYx+Y3jjjf7WmsM126yGREMwPNuafwDyPO8D2ulwD4R1LySxeG7XraKmhN3LtXQ1Jr0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0014.apcprd02.prod.outlook.com (2603:1096:4:194::19)
 by SEZPR06MB5199.apcprd06.prod.outlook.com (2603:1096:101:73::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 05:42:15 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::75) by SI2PR02CA0014.outlook.office365.com
 (2603:1096:4:194::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Thu,
 13 Aug 2026 05:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 05:42:13 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EF8F540920FA;
	Thu, 13 Aug 2026 13:42:11 +0800 (CST)
Date: Thu, 13 Aug 2026 05:41:51 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: kr494167@gmail.com
Cc: jassisinghbrar@gmail.com, gary.yang@cixtech.com,
	fugang.duan@cixtech.com, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: cix: validate fast channel index before
 request_irq()
Message-ID: <an1ZH2JGTObGoPAV@gchen>
References: <20260812084742.22081-1-kr494167@gmail.com>
 <20260812100623.36939-1-kr494167@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812100623.36939-1-kr494167@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SEZPR06MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d23eb17-9168-4b50-3b64-08def8fda0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|6133799003|4143699003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: Rl1D64KaLcb12dIAh2VELOmu4D63fQ/6cyJyJSeS6Oz3g8doFIrCtVAquIPBHCbvPNt2IEbwmcXDspJeMzyp/Pi0+uvcYI79EVAVmchX3ImoR79OQYsN7VoPsADWBET/0qtve/1xDQ6jChK0QY26tV+KJ59L7nuTfxD5itnKx+2/yhgux3YZtptSDHq7H0w8OqEqqDNHD/1tAylucit40AIIyXtdRN12nDHWp8lEYhFm62LPuchGWqUkB2Us+eBi0vjwbw1OAvDdFcI2vdYB+QdsHV4mIN3ET7YrFuyyzSPIyJw37ahZZIPcCRmHtA4BAvf0KHBSJ/z9xdSmaKkBn2J5HjbP9iulODnU0ZKN24AsEYNxT0QYhH/V0gWDuAl9jPXCo0R0YGb/uTOF9J81+ZbigP9vcdMndLw+SGi9LYFcuM1FNcY+r944HcbswHlX8QrVyrlLbczhe+KZjdbc961eYA2UidDh4sj38gVKV62dSdIMI5M1adXDxPGlmZeC91PvAMwgnF9xThEHjsTyiTtXBCVpWpWAC2KBWQ7gN5+pDb3hjWeZfWRJelfnRqVWVpJ6ExpABrQS0zEhXzZm7vFargQH5X3aXUxZ8Z0WVNmmLs1yhdiOuo1ZkyRulnIqwXbWvw6AHj4MwaZc1S+uLVjBfLG9XOCFFlrRzzi7qa7+urUhQzPxRCXBuRNwDgdIUIMf+GlIweVlQwprmC6rVQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(6133799003)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PT+n0T+jrMfAx5jaagdhIcxXKUdhP/D8wgIXF9xaVts2F/r9pWvVqvYuNpz5eQ2f/nCCjumORXZlpe22T25MuemXf4PtTN6PXf1QIEek+6fQSLUuDb4FVluje6TLhpqMteJzQEIDYT1q8tiwCIq3INbZW58v/cazEHcuAtdTKpBM9nTKT1VBIb64D5C7hN2lUQawJab1ca6NFbi7JL6wObjTGI4rrM9dTilsz3UmhgFdsYWVCWqmE/XkYVj1G2ISP2iO6qDqZGHn9yV59UxvzbKPTR4wXWu4t3js/QcMWs7hzBDtsRNWBz2RZiH/O19yKIZT1HAraJ6cKWuEYNdwCyF2LmMXrLsDxAkMWnw2H1vH1okgVHWtR+lfOyEgBFf77yNZ03QKe0+G8xi6xUJXqN7+Karm1417oESCSH4OWaQzs+V7qUsh3cgDg3VcKYsI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 05:42:13.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d23eb17-9168-4b50-3b64-08def8fda0c2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_224232_811718_E6B7127B 
X-CRM114-Status: GOOD (  22.57  )
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

On Wed, Aug 12, 2026 at 03:36:22PM +0530, kr494167@gmail.com wrote:
> [Some people who received this message don't often get email from kr494167@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> cix_mbox_startup() checked fast channel index constraints (index < 0 ||
> index > CIX_MBOX_FAST_IDX) inside the channel switch block after
> calling request_irq(). If validation failed, it triggered a free_irq()
> cleanup path.
> 
> Validating channel parameters prior to request_irq() avoids unnecessary
> IRQ registration and teardown churn.
> 
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---
>  drivers/mailbox/cix-mailbox.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> index 43c76cdab24a..615218c69eeb 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -403,6 +403,13 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         int index = cp->index, ret;
>         u32 val;
> 
> +       if (cp->type == CIX_MBOX_TYPE_FAST && priv->dir == CIX_MBOX_RX) {
> +               if (index < 0 || index > CIX_MBOX_FAST_IDX) {
> +                       dev_err(priv->dev, "Invalid index %d\n", index);
> +                       return -EINVAL;
> +               }
> +       }
> +
>         ret = request_irq(priv->irq, cix_mbox_isr, IRQF_NO_SUSPEND,
>                           dev_name(priv->dev), chan);
>         if (ret) {
> @@ -448,11 +455,6 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         case CIX_MBOX_TYPE_FAST:
>                 /* Only RX channel has intterupt */
>                 if (priv->dir == CIX_MBOX_RX) {
> -                       if (index < 0 || index > CIX_MBOX_FAST_IDX) {
> -                               dev_err(priv->dev, "Invalid index %d\n", index);
> -                               ret = -EINVAL;
> -                               goto failed;
> -                       }
>                         /* enable fast channel interrupt */
>                         val = cix_mbox_read(priv, CIX_INT_ENABLE_SIDE_B);
>                         val |= CIX_FAST_CH_INT(index);
> @@ -461,14 +463,10 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>                 break;
>         default:
>                 dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
> -               ret = -EINVAL;
> -               goto failed;
> +               free_irq(priv->irq, chan);
> +               return -EINVAL;
>         }
>         return 0;
> -
> -failed:
> -       free_irq(priv->irq, chan);
> -       return ret;
>  }
The premise of the commit message doesn't hold, so I don't think this
patch should be applied as-is.

The check being moved,index < 0 || index > CIX_MBOX_FAST_IDX, is
unreachable for a CIX_MBOX_TYPE_FAST channel: cp->index and cp->type
are only ever assigned in cix_mbox_init(), where cp->index = i (so >= 0)
and CIX_MBOX_TYPE_FAST is only set when cp->index <= CIX_MBOX_FAST_IDX.
There is no DT or probe path that overrides either field. So for any
FAST channel the condition is always false, and the "unnecessary IRQ
registration and teardown churn" the message describes cannot actually
occur at runtime.

Given that, the patch is reshuffling dead code: it duplicates the
(type == FAST && dir == RX) condition outside the switch, adding a
second spot that has to stay in sync with the FAST case, in exchange
for optimizing a path that never executes. That's net negative as-is.

Best regards,
Guomin.Chen
>
>  static void cix_mbox_shutdown(struct mbox_chan *chan)
> --
> 2.55.0
> 

