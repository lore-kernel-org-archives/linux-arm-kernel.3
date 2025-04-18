Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFEAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3A1dG9qq+brRv/Mfs8F9fDJbPtEDFYCq4GHdkSQ6VI=; b=yc1t9Pn6Fb40BZGOwJeUmc0lwD
	RUV0MVZShKx5aZWQzXrjO5QhcTDH/tMIllQB9gNTHuZnKYcY8ULkdU6olDpS3W8BRvwJ7k8RMRE57
	bb03ipkkmHk77ULRp9+RZQoRyNlKdNwTzF/TTqbzn/C7tvxchu7NmVdQZjNMjWsOoMNxfkE6Sw2QK
	clrN9HEeCxtgjFQky1HD9+cxQ94CBJCtW4SzyEx8wMMI/VZmgc+r1DGdB3HSBhsIsfJ+ewthGw+2/
	zS8t7+TKCzaUGm7isxKxGIQEV6pK0ATmEPEWOzH3dyDSS8+S+8wEC9PNtg/Cus+mIaZQdu0h+sdGU
	Xjn/JMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nJg-0000000GaUx-2fpD;
	Fri, 18 Apr 2025 15:07:44 +0000
Received: from mail-vi1eur05on20617.outbound.protection.outlook.com ([2a01:111:f403:2613::617] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nEj-0000000GZKc-2MPF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 15:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXDH41ZfJ44xjp1uqHjLwHbyOsyVkLk5cNCV39zzs1rJlAzSk3TgrBU2dtY35BTzU+19BDKhKbEoFnlbHxFBi4CGDo+MhVIeJKr6Roq7/3BXXgQltB/uQqV3wwx2xH0eDTO3g79F7XydvOoxNBpFek35PPAxqxHjCqbj9GG0xQJURuAYEjgDGRQw7icPYMe/O8IhaDnQ9OSwqjHzI/PmN48u96t+ExC8j8+tDFMeKLY7Ed23rf/MIVMEKhgzamXAM6dyVOjx/gG3f0ixUUgoJdW+GLxCY32pw5Wz5CE9y6RtnMOqPyoJuiGUZgAREJTyWeKN2snrsSyw0XCi+HH4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3A1dG9qq+brRv/Mfs8F9fDJbPtEDFYCq4GHdkSQ6VI=;
 b=iuBJW8P5un60+TReRbpJf06XU8bHeCoIJPl1AdkuCCGJl9p67RDp5yxnKB5HMFz+HZB3RiH6b8KzQKLwv8YmcdIzUPk63BuWs15hEVsmYprK/atvKTWylP5wgZsukdP0Kq/jizqVnIWYp+t/AiI6U8jPMUtCO6PORTxmQvjdG467UvDQ2KKtFkihZiIdPeHD838g+GggpCzRM78ZR64Y7nv3hrHj27WRRhBy2nFm9qv10yhB+EcP+szOPeKlvHNdQile4rL1x7mZN8de6MvMIaa3iOefMM6v61P3QSbwcBO+aM4e/yQLf6pd7miDGVe8Tt6ncvWwhKo/IntavSQdeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3A1dG9qq+brRv/Mfs8F9fDJbPtEDFYCq4GHdkSQ6VI=;
 b=CgMibfXTwUU6/r12D1dKSi6UWAm37Wl9d6DwsPT2e4VuM98z+0OBQdlmoso+4hOEdBnGCVAhDvVBSkBCqMieXf8D2yvE6FhzxEp73NmIPjuqwZmteQ5row+T6wEXFb86P+vIpnSPw3mGVkJvIAe7iyIQn3HZYqr34p5W7PCZH+iczvoeg5SPedZlYUB0vXKCp0J1ga9t1//gtdT9j89ZDW0OF1tqrVbbqvoMvHTnJaY8ohfeQYzU2ZzOyrQ1d4KWbjtmMs+fC9gZFDAGoyt7MbbbGDL853GECBe60zWR7STXKbGD0rscU8Ozj5UfL9CgvvqAaiOW+S0mqRp66fkB/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9226.eurprd04.prod.outlook.com (2603:10a6:10:351::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 15:02:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.043; Fri, 18 Apr 2025
 15:02:28 +0000
Date: Fri, 18 Apr 2025 11:02:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
Message-ID: <aAJpeu0fMrpGS7Wq@lizhi-Precision-Tower-5810>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
 <20250418070826.141-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 67aa68b7-2be2-4591-ef53-08dd7e8a092d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hiA6LQqvjM29NV7RP5+vTUfDAvDCC4aV6DP+mfgW0hkhpOSype8omKPYyqQS?=
 =?us-ascii?Q?kXHF6T+rSmB7egGem7cqRywAYOc7EKJ974Adaxye44SPc0V8xTW61Rn62j0t?=
 =?us-ascii?Q?hOL4CWYRTI7LTNP1K2mPxST7dArOkQhTY+Qq/xkL1UEX2dOdq1yDxHjnkQI+?=
 =?us-ascii?Q?A1vH0tS8WwGnVl5TFdzQRB25tGEouslZJch0zI80Z5djpX1kZx0lm70pAiA3?=
 =?us-ascii?Q?4nek58bpXZhFnOzaYTUSrUHWWRXbsHXX3VvBvIidGltTwp5XvXE48gECkTYe?=
 =?us-ascii?Q?anPu9ejW3aUuy4QR2p0C0jEg3CuRnTajv78msHa4N8iOQH+mnteO0jT8Rs3F?=
 =?us-ascii?Q?lIzXYD8m6h658LhqqKPPI5c3BkKQo8XQty97EgKS1IsXgW+hN+IXcKgyetxm?=
 =?us-ascii?Q?sltAGFUk/HjUXO2Lv9OhLO6KzyrlJGHmsnvVAqe+JHFKIAgPNBU6emd3rFHr?=
 =?us-ascii?Q?4SIc2z7CBuGF3DkJzvUaKl08Hp1+pVwOFXpliFo6qN+BN3tTSytdkJCVSqnF?=
 =?us-ascii?Q?mVjLV/xyCMK+hsl51RUGvTJ2d2Hzfdj0uwnkR/KporGsOLJRx/tJyqPg/+rZ?=
 =?us-ascii?Q?wa8NspjpfTlIZOmnTyFB0TFJNWWP1QeLY4+def1Xz1/TiwDosAEGNdE+07kp?=
 =?us-ascii?Q?/cPp2lfLMiG1Z9g7hXBPNFKrn83QuMTcmvHF5xqv50X8F8PPC8F+4Kioi08g?=
 =?us-ascii?Q?8oiXtoVEwttxs+q897Eg59SBB0eKLhf//xXl0xwMeI2EGkiXJZgQy3Cdnep6?=
 =?us-ascii?Q?fcecD24vx1bupoDmt55dsqoX8jP4KPgurg9iBXp0KrnQaNAAicfKYUn8BRD8?=
 =?us-ascii?Q?yiShnpldvPvS/+WTXznvVtpmo2CK0JmIPsV7wzUMeTv+tgJ9DgsG+WE7ipKL?=
 =?us-ascii?Q?pGC2it5de583ij0WkVcAXziaJHKL1MupBEPYdNU6BPdmAlr7i0WZMrY1uTkL?=
 =?us-ascii?Q?5/F/U4A5dXeQs8DtUwlJSLJlSjLtTZBYmkFAEtmJO2KwH0ziW2gdfZjXTIiK?=
 =?us-ascii?Q?425IMC/o8TYcL8GM42mUBepLGTrLwta5vbQrhofxL1V8euo0jFAeAijgTqu6?=
 =?us-ascii?Q?pOJ32EwabIlR8GGumjvoWdNCnfx+HKfyAyn3WfBpye1wt47qKgaqdiigfPd5?=
 =?us-ascii?Q?Ryyk3KtHg+EXtVTZsqdkYc4osMEAPU0evx/ak2n+lyWACdFSOck+D/IItapD?=
 =?us-ascii?Q?ObNf9Wmg3yv3Gk4Xu8LlxjU5WnR68rYtSXw1hgUo4LbKxh9UYwojKoy670v1?=
 =?us-ascii?Q?7fD5Lz7g8c7PVt6AbZXwl74o4aJcNbBwuoyjCSOVKZQ9ZPi9PkguyoDKDkuO?=
 =?us-ascii?Q?hNa+yatjQJboHyLKWJlkmb4esWph5ODPAK4JZKiVknPJwOhmTjD/tCNPMR1z?=
 =?us-ascii?Q?A6nA4Iem6lwGAyK7EeAnK7HrTvUXqMRT96wtnnPWuMgACSSjC5yGFQRC+wVu?=
 =?us-ascii?Q?+tAhrKWL95StsXm/ooAeCKc4O88un/ogP6pbxrqHY7yKd0f8uV22/SO/iW8O?=
 =?us-ascii?Q?0guZmx7k4E8OLOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fKWY/2Y9ixwTchODkZbDW8oBiMOFr5PVGpKGJ5uin9HWcja3/HplUhBf9pyG?=
 =?us-ascii?Q?O/qBwGdcVYaQUsfvSPodwDjO5ZmEv9LueFc87kPTW8FFWlXdNEtEEFEhHKgx?=
 =?us-ascii?Q?JbRhlGd+bjYy/+Puge8AumIBonO2Dxci8CEAiT7k9Mo/601IhglYyMuvy441?=
 =?us-ascii?Q?TVWIJnziiqRGbrk7xybcRzfLspNisRZfeNYhvOLTEbn0Nt5lJyupIiirvorE?=
 =?us-ascii?Q?UvTtlCcU+BsbTVNS60bb6HtWYJ5xI1UqkYEDQdQv4rTmmUOYyc03jBFOZEbh?=
 =?us-ascii?Q?BQDa/K9qAKdtB+naCp4K3Hhs/moaRrVHLSsa/11HxU08wlVMWYv0HMh+6oXs?=
 =?us-ascii?Q?/14rHKw1eNo1NyhQK0PnOLypGp3uLKWcJoibj+YuKmn3xSImEIWBeEaoBxI4?=
 =?us-ascii?Q?Yg1pwDF+CXX/Con6ytW80PmOowkZ2ABB9xdHUZjmLxiQ0HjJaSZ+rphZoxf8?=
 =?us-ascii?Q?RQj8nwE1pFk5lCDmOXeo+pqvUY9sKKJ+8Qy+1NQ8uuzb/54CWaryf9DU9hLa?=
 =?us-ascii?Q?7zpNrl4Bom37zvDVag9LKV5kOh+KWBTqBstyjWT03OvFAydP4vuL3OsiV2Ug?=
 =?us-ascii?Q?VmUnkbgEN5jNYgO/z4wpDuZrXV1Jo3x9Il62j5i7OqThYjuDk0Lxo7ld6QAw?=
 =?us-ascii?Q?HBkXrp22P4qzh4FeLJybisM8p5L0mQnEdW77y2FYZ3aRIsCz6Pns1E5LFoSm?=
 =?us-ascii?Q?EiAE0VVtprO8UtTKzTTuTYwMXRYLEgo1uddHWIJYeW2B/94heLcH+Zvfc0a8?=
 =?us-ascii?Q?o9NaJOr+LPfjq8dLCIpRmf6awaIWlIyHtofx1hLGpKAOG7aeis51lPNlXuoe?=
 =?us-ascii?Q?FjPrti6Kr9WWmDyp9h/AFzbAenRYYKyZ7Z7CiQA2YG7a5m4qLDoAVwl9NBnH?=
 =?us-ascii?Q?rdDl3MIRQtrv7+Dqp7++/trDgCbSfMhnH4yLxm+9sIxR4/p6S4d3oOfHc6p5?=
 =?us-ascii?Q?onYPfFl5kX/0ECGOYa4Nn30ycKCVI7AuRl6eYrUqmrq8chxjryNDBR5f6XRj?=
 =?us-ascii?Q?N6mveqy16gYxvV6u2VMys04fVTtMIwYRSxBxDd9OLM3jIFMBWSLoPcbFy2QM?=
 =?us-ascii?Q?CE+foutDwy26kH4vw50wP63S4aI3cb+JvhjartrHghdte2XsqXCvAVfZ26n2?=
 =?us-ascii?Q?mXiPkNdARYKSYim/KtPmWBVX0N31r5D/6XeD6Vbhx/59Y4ghE2EZiVw7VWWZ?=
 =?us-ascii?Q?xhzCWY4v4U8Lg00VjBc6v1RQq4FM+2Rlgr3ZEfP2fGlCil9nUr7ZvEzAaCXh?=
 =?us-ascii?Q?tP+vGmeJIFF4qS+8ILq9wtxuTBh5MmrqmFl5JFVrSkibAxF/eg/pV2m84f5N?=
 =?us-ascii?Q?v7RZZjl4ukS8W+FwHs0kKH8gQAj+T710kh0M4wzaOfn7LoYXaajrJmx9WIUv?=
 =?us-ascii?Q?aNQHDY6o6gUfOgh8ysQZPmW2ttLRhr7/WTvdwavJiTagHuzDsUZ2VhZMW8Nj?=
 =?us-ascii?Q?RkQxEmS6uJB2Lni9a/27nr31/V4bF0t4+xWgG18Ne4IgXl2mHhEw1frXp5Bk?=
 =?us-ascii?Q?sw0ScmzciMv7KUJKzU/ggRzFZIy09P3xGUTOghImEnzAhpC/+nf8C63eWyx/?=
 =?us-ascii?Q?ebx2IO+ZBExoOyfB/P5WPacTQczyRqK/lzdwfDvw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aa68b7-2be2-4591-ef53-08dd7e8a092d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:02:28.5306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VyhfY8+NS/y+XMdZewuLH4tMl1nnnbXSR5ENPIxuLByL1Bhg1Ouh6uYxgJ+xOqHVis9wUx4CmxQ+1+Y0ZwCCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_080237_624447_DD41597A 
X-CRM114-Status: GOOD (  18.16  )
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

On Fri, Apr 18, 2025 at 03:08:17PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return false;
>  }
>
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>  					       struct vb2_v4l2_buffer *src_buf,
>  					       struct vb2_v4l2_buffer *dst_buf)
> --
> 2.43.0-rc1
>

