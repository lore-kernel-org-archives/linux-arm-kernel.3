Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EFFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD9dWKtrgSPZXDIb9hJPaqJHUXowzzrI744qEXdkaGo=; b=jaFFBMGWLNjqB8HTPvMTkJW69s
	HNREtyo6oGKljDGJt0ow+eidv/tgD+7Gb7MKWtD8jt9DNTpeAbGE6mPUYKvq7qv6qoPOuRNE5O1A0
	XnAIRTI1g2tQPPEMCla9292YP1bedlhkH9LA+y4ypZplEyE0RUJaahser0Ofuq8pCaP3HemlNZQ5h
	IdKtixvK660DLyJH8y6U8iTkIuwwJRGRIihwdwk5Gm5v5Fn3Aj8td5NmE+FnHk1D6jIWBtb/8H3Lp
	di/Di9QeLxhXoONy/MOfKhbNBkwr7CBdhsfsgNA2oB9YzAbr1bT6ZoH9CBvOJOZ1Nwm+FGuXcvF4h
	wG4FUH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ3C-0000000GBco-2dfM;
	Wed, 27 Aug 2025 16:31:06 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urH8o-0000000FlJo-10bS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryYQmZuqaRhsU/6q5SbObg20BRrtXElFLHMkkXRk6lXmGM6rCJg9Iiep7SXIa8vVjba8aKtBCqSNXJKU86ey+SttG3G8hNdCjAh+Kw/7MH7y09Pt/nW7Rp+LDdnJrAiXEwVDnsvuIa0vIubTUSAAvjs3ipLsvmN0V8snCYusu1cfoDNQ86jlA+tWZfyRHcvseZ/f8ydznlOm5KiaJLXAJgfto1dO1K0jgO9AfmPUFM9iAAmtYevOc6ASMLvTbFjlvrv+ZFkU/8W1i4MXZxcC7gEbXFxyDO9E1AtutqwAXZQvv6Q//Q/+85+eL0eFG/5DbgEEY7e1Y6cQJQRs6bgjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD9dWKtrgSPZXDIb9hJPaqJHUXowzzrI744qEXdkaGo=;
 b=vlxH/SsfEoIVm4SBWx1IJ+XgyRQimLrDy5m7a1qAyk82EOzC3kw37BzAyb/zHADbIG1rU7OfPFdzVxVNZm7c7KoLGKKe6O3X269Js3qzZmO9GU22Bwb34bLhysG0+1IwHYUKxzd/Rt322Kr9FZjgwnG9biyXBBCAg34Xai2yNe/osHMCTW4f59WQAtkYn0NzRCEEiuCugusFIzzqy3bABJLOCpasX7caJEI8WXpoT5nIXj+JKKTy5waZmZbtIgCNqqfDGbRP51PtjOBb9yDxxmq423Jztf/VNMJwtAyVs9rABD2LDb4BSH1XDHjyEcUUVVUXyp3y4FML1vnDs/c2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD9dWKtrgSPZXDIb9hJPaqJHUXowzzrI744qEXdkaGo=;
 b=K+9NoKE8zOKL/9Xocnq/k+NHE6ikVVug5YvHs64bMudeOk7F9Cn1Mhs/PyzHhIuNCEglL+xqCPB6+Jgqtw+N4dsk7HTjjgmd0H4QAwH/YhGfAV86G4XfkGUqSFEmRR6sAXrzDFPNKOEL2TRUt5hR7TIyBnZpRt9hXVkO0h4f8C9pxeVj3oghb9RnUCMndvTXZdQI4V2dU5vGvHzf4EQGmn4fwJZPrVNYSVMkl7VJaCHmyO4/PJWrvmri8AxF/VSz5/zQwNsZ/Gf7dikj3LOSRCULUxCYorHaCEjA3v6nShfLnrId1cGeuQL+r84itLYas18wTEWhtotr4iQcvoM9pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI2PR04MB10548.eurprd04.prod.outlook.com (2603:10a6:800:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Wed, 27 Aug
 2025 14:28:31 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:28:31 +0000
Date: Wed, 27 Aug 2025 10:28:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Message-ID: <aK8WBvQdkY2ciQs9@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI2PR04MB10548:EE_
X-MS-Office365-Filtering-Correlation-Id: dd29dbfe-3971-4504-7a44-08dde575fef7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V4VPhsOj4fAuOqKhR9FIsrwVhyNaLDajxNuhzQAEYWov3WGs+OrJCcmJLd5e?=
 =?us-ascii?Q?0W84Ahw9TkRW6Wg3oDnYGfORXO1Elm8l6CJdY/ljSBfgzbVOMqZywpZ2Q9Ct?=
 =?us-ascii?Q?Cwo74rGQQNI5ogUQQqaZf0okXYIdqbZIPzd8ZiF0N/3nDAlBAXsyUFkWxRz2?=
 =?us-ascii?Q?Kn5W229lTKwl2j68pDv6iccCR0NyxYqzgt7i9hBmrhMUNN2S/Ot8AM5aBhzn?=
 =?us-ascii?Q?8kQ/cBYOVc5OMCNZjb6YAT5tleqUmusR/iLauOp2WDtqH6AiFMxM3liirmWo?=
 =?us-ascii?Q?mrN5qTs4hpw2ye9Kc7e6V7nBc1Wwxu0AM42t16cTONnZ9GrX5Gu5sI1Bb4tt?=
 =?us-ascii?Q?FCVQYMqkArLusaFVDW7Pw5Xv+N66bK1bKu8lsfsrM8PQ6BhwzaQLmhe5A6J4?=
 =?us-ascii?Q?6Z2L7BDzm8bNH0yDEfHPuHbE07iLoMn9yOG0+1rd/5+I+dxhoXKIwFSolLvQ?=
 =?us-ascii?Q?pOP5P5uCKYsGUnjKxx0zsYM8g8QIcQj3X0rF4pAZ+xACpfWFzeAO6CTkPQJl?=
 =?us-ascii?Q?Q31xhTrYiyaFzGc1rpHSsgJqwExuPG+H66NaMh4HrJeJV2T/nTYWJR2MT6wA?=
 =?us-ascii?Q?2flCC/r6yg1Bee30Gi/AnjSXnPFbZJ+IvQjlfoE5OvXDc1ZJ3oyGYPYYp5rT?=
 =?us-ascii?Q?L5vDTBVzpUyzB08wS8S1d290XvM9twDroVjKMz3qejmW8vKs5+wS1CnFjN5i?=
 =?us-ascii?Q?dFC89TxNoWp8dZHGXeaV7t0LDfwmg3k6yhy7xHrJmZCFCc0N8pFj6oLNSw4w?=
 =?us-ascii?Q?pUc0HxASOSkoCk9aNqwAY1vlJqr/mbsTxfmLysglWfaoWwSW8eH63zVxZmFC?=
 =?us-ascii?Q?gag2i/qxvpVpD8+VlWLE6UohGr7WANiu+tLLRUR20XmtdgCrQhNP1IVagL5Y?=
 =?us-ascii?Q?HOvFOuDFlJMkTxYcdAiv6ab16/6fmePywnroaic3gEyPurdpqM4o3xCBh+Ns?=
 =?us-ascii?Q?tV9XYDNH/XgeD+jn4x2oYn1dGzRXSKf5d1L348WtdQGEhKKk8eBCvqhIYeyO?=
 =?us-ascii?Q?i1n3AfQRGbjWkM2Z14iuGRBc1DTj0XxpHo6XY3HL7HK8dz0JQJzq8gIdVTja?=
 =?us-ascii?Q?NoreibSUUHv0gugwn7GAJ5GvjJYEENbCodJJsjYLDJ7Y8YsHomH3knmu1B1N?=
 =?us-ascii?Q?LScpxoB5bXo7sL5FYOXvqXaK42I1bFEoqkve0oJUe0d1gIzfd1xsG3CJttoC?=
 =?us-ascii?Q?Txisc1UCOSzkc6b1viEb/Nz3WZUT11IRtXOag1bN8o0uHnWCA9DpmJvVp10V?=
 =?us-ascii?Q?H/xZQIiKU2efHvcnMQ8fUTcPRjkNwU5Sbovk9uC+hwkeWXnaJC1Uf9krdH8+?=
 =?us-ascii?Q?VNYykEPCtmb2gI4gQKw0hCzhlnDsAeWnRqzARKCKRcUV7gaMFWgq1h1DZTeN?=
 =?us-ascii?Q?CsRC+ZBOokwLb8Dwtph9UbZtdhAgPqgCa6QDXi/YsoR2woFMrgAbK0C4AzU1?=
 =?us-ascii?Q?yLkCjBqXFJqoWyDz0+dp9HXeKeLdp8q7wbTzcR0o/KJ0BPaLiKoYYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQwO9gwCT8BVWrZHJ4qy6wuXqm9NEJoj85oaTNMWxGdQtNFRzd1LnyTzxFyf?=
 =?us-ascii?Q?+ns8ajH1LLAl+07IuALWRr78vRSD7bT9+8ZCildGngOO9M/22bBDLK7zfIrW?=
 =?us-ascii?Q?xbWww4CHw+McycL0oWcp0oS4w6CSGtI/+xm62u9Re06sf1yRFTuT/uRuLJjR?=
 =?us-ascii?Q?0BVWqiMScRz+X+Is8gWVNwShEILV30NEWbuu/IwpFk0NzReujCkKGOpiFKHa?=
 =?us-ascii?Q?n0vRTPQywtzox+F+qrQHG2AYBKYKLGq272hw873PSvHgeyF5JOoB+zaL673O?=
 =?us-ascii?Q?2IpBYjyhfBpRut6JGuxAHSCbaIQqtNWEX/JuktutEGni/AymFjqusNEejG9O?=
 =?us-ascii?Q?604PTwTP9MKIz15DTZIhcwD4OprIszKNzExcx+rSX4JE5/vR0u5HdXL12ZTY?=
 =?us-ascii?Q?kby5Tn4mifhJbzgl4NJDlkUN4H4ZkIg/19Cs1gSpoGB2fx9mMzIAiEQ9PNt7?=
 =?us-ascii?Q?koN56OM8k01cBON0T7MenyRQaWynz2jvJUGWP3YDbfphJSFvuCx78XJFJwv1?=
 =?us-ascii?Q?TLgwJWWed09kwe7oP2u0nPG7xG8j/me81x5tA9nHqAv08OZ3vSkoQYaAcPYm?=
 =?us-ascii?Q?x4pvi7kkn50mZeRrUi51Q7HbAQe+IA9cZRHtX5r+9HLmeWB8BOYPL5uh+Xrm?=
 =?us-ascii?Q?DAB9GcpSZDr543nKTawlpmHSc8OCyNpxCeJARY/yewpLpRb4V4H9Ml6shDLX?=
 =?us-ascii?Q?xJ+eYw57QjtKVSJUMhBlm0uwRoWZAY1i9KCVOR/QXH/RaouEESd67CivgE0r?=
 =?us-ascii?Q?heiT4ACmDZtUQ4wUlqegrld3xTsYrVv9dciXJF14uYJZV/0K6wwG3Tajleas?=
 =?us-ascii?Q?vlk9CACC16x32Y9CwiQRLOPz2Qpa70t04trDV49K24wrYgorRNi5y1X9tRAK?=
 =?us-ascii?Q?gO0ixSrBEgzLwoRuesFK9mI3VAFGkPLRrUFIQjndfGg9zhs5A65TIBsH2A9S?=
 =?us-ascii?Q?4Ehx6dUz6teAGODM8MsUw5Z+ZNt/d1fpGLTia2BzJVYrC6HQoxQ6DPzMWwY8?=
 =?us-ascii?Q?qkBa6qB4eJ/L2M8Pgz9dojoPW42MqLy6EHU5mH1AmFioLSaBAg2kcEuyU0gH?=
 =?us-ascii?Q?cwE6u1axPkmaeHJV8oF6X2TG3itSTS3yGJzPetvALwHTsAfpysLcXoycZXZ0?=
 =?us-ascii?Q?XBxzDXWXpdr7sDCVsbWIE34Z0hTwigTCB7HVgbV1xKBi6CnfLpr+26Xms20G?=
 =?us-ascii?Q?UihasTIjjYmLM3jfeZOxjcGn2J+2xkpKQpARS5gNY2FpPUuSew+GK8Ie2GD7?=
 =?us-ascii?Q?6GBbbxn1/94sxbCduz9Y4/ZeB3iWj2OgF33Q8Vh1iA5ZFfN4hLBJIQ2Zdan6?=
 =?us-ascii?Q?Kw+1hx3BM9j5mMe2Op5a2U5w8gQVdj2lca973wYjUC8ZGMtchb4gsAlDyrKo?=
 =?us-ascii?Q?gFYhZ9acg4tGFzjCG+tnf197U2yrkD6DvFBj7H5Bar22TgSa67lj1Wlvo2Y/?=
 =?us-ascii?Q?3uU+rhtMj0GgdadUH3N/VbxCUQxzfu6euHtEG/wdpOkzp72uGAZzdo90hFwt?=
 =?us-ascii?Q?sSl2MyaTVPTRPqsVRJsS6nSg1sO0vE/nF2Hq1sOFt7B8RC2vFDTmZ7GEZisc?=
 =?us-ascii?Q?+8qOVLuGpfI3nEJnQse9UxNNSh0OWa7IvHP+IqQP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29dbfe-3971-4504-7a44-08dde575fef7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:28:31.4027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a5/oi2wdmaOBz2jXXGzi6eG04K/Ho/w6kpLQib2g26e5seUcnzwMDsQDMjI1oRIJkTEvJqSS8ZMXK0eF0YTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_072846_281151_51738E43 
X-CRM114-Status: GOOD (  15.65  )
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

On Wed, Aug 27, 2025 at 05:53:49PM +0800, Guoniu Zhou wrote:
> Simplify code by using helper macro FIELD_PREP() and GENMASK().
>
> No functions changed.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f69c3b5d478209c083738477edf380e3f280c471..c05e26798032367813c8730550a7eec2f237b4eb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -16,8 +16,7 @@
>  #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
>
>  #define GASKET_CTRL				0x0000
> -#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> -#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> +#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))
>  #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
>  #define GASKET_CTRL_ENABLE			BIT(0)
>
> @@ -58,7 +57,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>   */
>
>  #define DISP_MIX_CAMERA_MUX                     0x30
> -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
>
>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>
> --
> 2.34.1
>

