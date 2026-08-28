Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252CC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lG3xC5115oqCIUEeqcuTrlfVmblpj5uT8RKdEH1wkg=; b=W+/8CqU793gg9qJd7xjT0t1A1t
	Y8hKDZL44E41NzR6nctSp2Z86F6/biusca+YteMFD4E92Wx+RGv58BLKQiOxR+GlbBHo9u6m67lzJ
	Z1bX5R2FzW0b3ruNcuIMSnctpmwV9PkG2ibZxYLnwQs2Y1UOwlEJEEZu97+963AQmk5YMwrTU8vke
	anre9odRd9OtymkHYqquU9t3pEEkgO1N9q/QAf4fRfPAub13iMxL1mSjy0AcMSrdZyevpqMVdcoog
	j/pt8anVH25xdIMISG5VzmWfOzzOiPqRfQPJYdeaUp9ezPjed3Wa82qtH6kHr1PnqXLM+RPYv5KmZ
	JL2m5Vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuG0-00000005cFj-1j1h;
	Fri, 28 Aug 2026 10:56:24 +0000
Received: from mail-australiaeastazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c40d::4] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuFv-00000005cEp-1mZ6;
	Fri, 28 Aug 2026 10:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT2biPlZPIZoXbLirWX/UI4Vnd+PDgZUnUJlQYbs5KTtKgxcv6a0LOGg24EY4BQfOQBy8KHtESHA8WD2Yqmo439jUYOE3QkUmsJwzezNXJe3tvb7xiSuiepcyTYTeX8eNIrMSYiaj3miGSziXK5arIxH5+xnWQBiulSQfv3WjZfQEv/tC2Z5B2LSCws1VyLm5UcVaBv7y1vGjzjDBmdTx3sQBgtsFdwFpqL/vtH0w2pMQTf6MVZXBrNUHra9z1iUaGrJr/1hltdR6qMrnmba4/rP4ZiEvpG3M94Xxk3gQpZ0bLPWFukys4Ljgxr08zOgYk5RSjPTS4syvHAT+xY2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7ab/rONL3q9YCmhqdHoN7d+ZjPXkXQ+VeULYPxG+uo=;
 b=UUHIiZyThIfHRC5zJnqgt04OAb8i6Lxx26Bbcj/CO4h+A8G/egpp3M/tiLNgTtXfX+3QABYiLycUrkHu5hTUms/7KvWv25D+15k26E44fO9KI0Vw9vLWc205u0KQfWRm/zpGlmHrmgGRbUZRcMyQ9q+SeUwYwCpcPeROmd5ByFu+Bafa+u8XSKKCCuYyaRJuDElIlAPjgBkNgLt+iv2ADUDAk2TDjs8i6DFFcuS+7e+UlQs84fTub225RaEFT+dzZm1DAgK93Aq+DZCsavzK00Oki/ZdyqjLvuoubuiltoiXDxG70DzJ6RH06drcLvzyVZVTE9r134Yoxk+Qm8fv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7ab/rONL3q9YCmhqdHoN7d+ZjPXkXQ+VeULYPxG+uo=;
 b=EPLH0JbpjmRc/6vFUEnCbs1ynTKJh8ujfRNOY+2Kt4QyelIhzJJEtJZEHr/1AfA4rAr3JBz7aLM/FChj4fNJC+Xh6LbaUj7YZquf476sC94jjZ/ole1ogQS7hwkIId1mJZcIcyR3cHUNSi5e36Df10NdEbTqxd3Jfb8E6POoUn6ooepbPuMQ0lFuo+vRPF8GySVMHDZep8Ma22IWP30DpJwcaq/NUIx+GlpNMCfZuH7eqRpeqYeLe9oTYPtPqGPOno9HwbasXiGCwjy9OFYKEWFurQ3rrw424lPPYow3XuuiYaruimvJmPBwuNAyaWD9CMD7HqQfFdU/+jw/efjivQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by ME4P282MB1016.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 10:56:11 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:56:11 +0000
Date: Fri, 28 Aug 2026 10:55:56 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <apFpPP1O45BWXDv5@5be1eda4e59e>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
 <5096877.GXAFRqVoOG@phil>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5096877.GXAFRqVoOG@phil>
X-ClientProxiedBy: ME0P300CA0005.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:20f::27) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|ME4P282MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: 3199f2ba-5d00-4835-6ac4-08df04f2f88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hi3OI2pYY2zMuLBjff3FDrGVZVOiTW/41Snf/SaNLQ9QRh81NNFrLDROvIrhVIhsAk8H9O5tLmMQPYC6RMUIxSdV9PskFqJYImtgU4892expFBKsroc9tdGx6O8PHtjA0m5sMvDMUNAA5kK+h9iW6LznCOFULRz2zNBalmqHt1FtLn/x+7oM4h6KNDfC4isiCzC7RFHdVHodVIuSNDRJuBNxnEUn6sSvy2GeD+bZMRPEEzWy1o3gBP38z2Yg9+FuBvq3H/6YMjzbms3ya/eqbB0qCi3v2lqMwsaaUP4Hmt273dW+512rIT+S3Nsf2DFuMf6xUerm25/AF5RriZvuWwTr2/ddtkZexuk2fqV7pHkQP9Z6/4ugYoDIVxYF+tdl766kURMEPuiQ4l0BNBKyDFKPIORAWJQmB18SQ0HRY/Ab+fMIdvY4eqI+GhELcajQ9akJkhxj42Xq5HwyKDf0qh6vjf6gLdiuS3IAAJPwL2kS8Lq3ZKBLCSUs7r5uUiW8br8xw1nqBCYdbJkDB+X83n9B5UO0NreFoaJYOq6Log8I1vqjL5emWawczlrFCvRekWHXCJRJyj1mV3z3UCT7Z09Jcukq+OLCV6LJEzuxlxVZlgxXtS8CNO3LHdNk7C0XzrQ13PRsj9S+FjmhKiisF5bcG+shVAMXjPsMSkNAhN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3NEOmjb8Gmf2Rec30FqSAr/8NQSBrHPYZ6lTxTzmR18eR/f+TAasteaoj5?=
 =?iso-8859-1?Q?zVbituq8iwgkyVge3l0ifX+NRMRXWsKWWyYR9f4cqrvsQcvHOd4nGca7pA?=
 =?iso-8859-1?Q?NZvhZULHAYIBta9gG8G9dJ5eM+MUQ8/FmkH9iu+rYWFO1Z8UBFz+/+zJdN?=
 =?iso-8859-1?Q?i/q/+rzov47XuiPhAMNpUIHBkT+jvnom2uOJSYZZCT5NB80n2XHQsR5vk1?=
 =?iso-8859-1?Q?IzVul8KHPpEoqWrX4/+OWPKf3GfGgoGtebGqoTwVPs2pk19nkj/tccOk3V?=
 =?iso-8859-1?Q?tLbm3vbPjTsobDo0JNxUEux4iRnnNnp3tinXwpnyFoltQg9HQTVc+6cSeX?=
 =?iso-8859-1?Q?LVwNoeD0LZ7f/D2OMXFSxPcPYOwRN+pOheDQg/sIwRIeMS9xqoWSUnGY+3?=
 =?iso-8859-1?Q?XKZq/8IEi8WoiSTozCkIhzlxt7aIeFWaKd+nnEqttgUn7nLsSp+lqLo7nY?=
 =?iso-8859-1?Q?Flm31JA1Zh0lPwzXIko4A7oo8eQQeTDQN/0LMtLIVgdb56HXa3AGZDwXQa?=
 =?iso-8859-1?Q?UK1FR1Z0x+LV7UhEp7AzeO1mw8l/xNqAgQaFDOXehOcZNrJKy/QfivVPz2?=
 =?iso-8859-1?Q?c8Xc7sOerD2Tuy792gzPf1kqDRaT3iQChl0yqH4Vq6n1B+Cn92yCfqx0Yd?=
 =?iso-8859-1?Q?tDdoUqke3tzmz8VWTvNBlpeTrex+Qmp21+jjvVNKHDfBqOKl/FgsQiL0+S?=
 =?iso-8859-1?Q?8mHDPEEcLid/hfwhb6fFFowCxqi04ZSUtqq8mBjhNWtRpjXyK60BkUc0Xv?=
 =?iso-8859-1?Q?LizbhUnc81i7dBlfD2KXga9QQRTeHR6GJFVgvqLFK8+gAOzVX7kYoN7up3?=
 =?iso-8859-1?Q?e2hpat9KHAopUA/6Bgd3N1tet1QH9ZzZfA9CuTO6lAEHZdc7vjtMkAGigN?=
 =?iso-8859-1?Q?FHdubIHg3ecn8je2dh/C6Us5SnTj8gi8cxPe3WsZmV94UkU1Fsyn7X66mu?=
 =?iso-8859-1?Q?pFZJJPdC0rdhOLKl8bjwyhmWnoIoyTsiSryuU3JgZzZudeaRCgJXQQqf3O?=
 =?iso-8859-1?Q?YWXQOzZsW83BbRmXPWzvmK6vqQ25/jUZz0OYi+QJzGbWlF3et4RsNF+RvD?=
 =?iso-8859-1?Q?+97NJY+OHlQLiOrkEj7LHBwaZFZaaL5yQ1N1oOU2zaHE0kY4P/SfmzGLJn?=
 =?iso-8859-1?Q?J01sndSjJEY7YwmIr0J/8an07MLAbqOJ49e2BVdFAe0+nKQ/o6DxGgjylI?=
 =?iso-8859-1?Q?+ui7Ji/s5RTvhvI83TiehVQZx0J1YXwX7px7CNMe4z0vvLsE1g3ehMJuc2?=
 =?iso-8859-1?Q?cXT/Aip7AF4bWGvSs7H2sIQNYb7MIGVpeOr2yjT5U6uBOcppMopCgcB2V2?=
 =?iso-8859-1?Q?n8LyqdT27QpCRzyGACXCm2BiG3UqDTCZkuBvVeiGxe1GTGt4CLApKryuNc?=
 =?iso-8859-1?Q?UtUO7vffXwg1SLMy4j+mLk3/zEJRCcc2UwSsVNs117oqpwFMoakI88qo1r?=
 =?iso-8859-1?Q?nXGAlJ1ltF3qM7VY/ujStMc5SOlVMtrKiUZxsWUDE8ToqvRu824DB/tCUH?=
 =?iso-8859-1?Q?vRzV227Dr0mIl0mMA9I7y509/coNR4NQNnbXzddieAplk5gIZ7DZNyNwgF?=
 =?iso-8859-1?Q?+YozYZCVhgz0FU9MBk3iTe8/k0j6XToFzcLIHvwHw7bbRc5J/Xv72uytlT?=
 =?iso-8859-1?Q?n6DrllAG66WwojbGhgLk20WY/RR0xdwQmgaOcL2xEaFjSZGGQFHE23GTOt?=
 =?iso-8859-1?Q?Kzxhdnsa+b+tlY1XPZKb/fsEOyUJaSdBHktDw4Q2U7Xu9tRG0zCTztj+CN?=
 =?iso-8859-1?Q?q4ogLBVMCWpuzCkcSCJW2D46BPZbTPvW8FQEnzd3QK7LYm?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3199f2ba-5d00-4835-6ac4-08df04f2f88d
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:56:10.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 237ev1Y9iqPqrZtV2Ig/mlHHPJgtgJnCFDFQRLmOCMDZ2PXEQi5s7VPUC8trAeldb/NnQ1T3oQcJMlJhoY8MOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB1016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_035619_467924_7DCE89DD 
X-CRM114-Status: GOOD (  26.04  )
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

On Thu, Aug 27, 2026 at 03:25:23PM +0200, Heiko Stuebner wrote:
> Hi Rudi,
> 
> Am Montag, 24. August 2026, 04:52:02 Mitteleuropäische Sommerzeit schrieb Rudi Heitbaum:
> > The rk1808 is the npu die in an rk3399pro package. It is wired to one
> > of the usb3 controllers rather than to an external port, and it needs
> > its reference clock running before it will boot, which is exactly what
> > this driver exists to do for onboard devices.
> > 
> > It takes no supply from the driver: the rails are sequenced elsewhere.
> > Only the clock matters here, and that is already optional and handled
> > generically.
> 
> the "elsewhere" might need a bit more explanation to verify it's the right
> implementation. Even if the regulators are always-on or something, we
> still want the supplies defined - for future uses.

Hi Heiko,

As follow up on the bringup of the Rock-Pi-N10, the proposed change to the dtsi
for the rk3399pro-vmarc-som is here, but needs the provision of the usb first.
https://github.com/heitbaum/linux/commit/6b114b6fff4022c330003d7f70ce09915ffd774f

Thanks
Rudi

 
> Thanks
> Heiko
> 
> 
> > Two ids, because the die changes identity as it boots: 180a while it is
> > in maskrom and then in the rockusb loader, 1808 once it is running.
> > 
> > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> > ---
> >  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> > index 3523f8f8a149..e07f509ac751 100644
> > --- a/drivers/usb/misc/onboard_usb_dev.h
> > +++ b/drivers/usb/misc/onboard_usb_dev.h
> > @@ -134,6 +134,12 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
> >  	.is_hub = false,
> >  };
> >  
> > +static const struct onboard_dev_pdata rockchip_rk1808_data = {
> > +	.reset_us = 0,
> > +	.num_supplies = 0,
> > +	.is_hub = false,
> > +};
> > +
> >  static const struct of_device_id onboard_dev_match[] = {
> >  	{ .compatible = "usb-a-connector", .data = &usb_a_conn_data, },
> >  	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
> > @@ -167,6 +173,8 @@ static const struct of_device_id onboard_dev_match[] = {
> >  	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
> >  	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
> >  	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
> > +	{ .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
> > +	{ .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },
> >  	{ .compatible = "usb3431,6241", .data = &corechips_sl6341_data, },
> >  	{ .compatible = "usb3431,6341", .data = &corechips_sl6341_data, },
> >  	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
> > 
> 
> 
> 
> 

