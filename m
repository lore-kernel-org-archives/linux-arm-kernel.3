Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCE7C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7fMlDkXKYG3oVx4kQUx8RwXQRR3ISB+4nAjaV5mjKQ=; b=35lXyGouqTxT4G43MymX2Rkd7k
	VRw5quNLcnNXmhU35bZ+TnQyl7OeNB0jksgL4odMzNneokmX/MVdsC2Ymzw1yqhM+iquZtsq5caSs
	aAgapRjJLKR/7J3Zg+39ive0ZJd2TR27/L8oJtsXbK+0/S1RQEt3EuhsUmwGiIDJoQrUDqVVMx/Xk
	UUCdm15H2RedNQBotWcoMRK1EXXXuQhpdGxRfcjqsbtJuB9x03B4LQtsxnWegYnIR1ILAMo5ds9wY
	wst9vVBB4bF2gViMR42+2vwHr+BKA5wrcI9PntbtHpdmJY4e1XWZpMj8snU4VqNxcak1Kx3oj6cnT
	wOmEOPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mtr-0000000Biw7-3ipo;
	Tue, 01 Sep 2026 11:43:35 +0000
Received: from mail-australiaeastazon11020076.outbound.protection.outlook.com ([52.101.150.76] helo=SY8PR01CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mto-0000000Biuh-3P7c;
	Tue, 01 Sep 2026 11:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2GB39diLQWAk618IOKTF9FBBgvZ7TivU47qDfMUWiJVIpm8DLuEfQyHIEhF2PB7Fxyzt66f5EZ1SC+kKvYKSNaXicTh1x8uqo0soPD+vE+COLw/DLTCsJtQhVDflUrPrWpDT7lbDTgSPwlBhmVwpaIyXBlp1w1tc+fC+5KxMqTt4omJRoPt9+rj949Vn4h/8jtdC8hEwYl3Wus2DV63dlHRi/OdScbMutasaA823WJljnlTU4cdPITk6HVu/TGsnQMH/TopBUQ1Xd4asNy3rVtQORmvaYjxD0EzQUh5zbYdawWu4VC+VjJ77z6csPlK5zQL05RPa+kuTp006tyOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7fMlDkXKYG3oVx4kQUx8RwXQRR3ISB+4nAjaV5mjKQ=;
 b=P7Ay50TnhnVHJM1y5p93lXMD5z2dFW1M8OMsTwxg/h0zvZBdxTIxMxbh82fXO2beQvedYiDf3uOwbtkx9XmnoPU+m4wKLYdoJldDTzmimtEQr9HEW6DMED11tmDZ7uBKPJJeN5dH11lFhn17+VrKA7C7HcQuUEDgZyGYjtQ+TtBtoxkBxaXXmoBljQzZ8629kp5sIq8j0sqR7kPJYyauejrgJinus5puX5Q9ii+3Pim8NY8bXrLbL24ZMgIzVc8dvOza9NsJadSqdsXJFXEBP6tfCiiqDVqeAPkFdOA5EePcSAbJzlPg0eiO7WlftUijydLxafeRzrBmx/QhzoRYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7fMlDkXKYG3oVx4kQUx8RwXQRR3ISB+4nAjaV5mjKQ=;
 b=iOMQASEuA7u8+fi31TCspHTKrsPGcCEJ+IKhCj9dgfAW5vggLJ0iZed5PAvCQUJWF6aFAAt0tHWxhgOYS/LUYI8OHU9G+gIdzJu5arm8DYKPjXCj+0N6gRpWfPa8fIEZhhKj8BeaKp6j8xXZqahLSKNXU/xmzWE9SKsExC2aQWQ1Xtm/Ok346WN6foeEsmWpJHpF2NsKmXfKK8QG4y7jOEKevwFqeAqBs9/8ZNyM0QawZeObRZBVBE8d1zkj4l/92KBOeDquaevmh9GGCcIJPV2zZVr31Ip+hQmjN7kSGvklinxjOwWoTSQQF0xV1wrs+LnEWZuAg6EoIBIJfQcSoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY5P282MB4758.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:43:11 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:43:10 +0000
Date: Tue, 1 Sep 2026 11:42:52 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Chaoyi Chen <kernel@airkyi.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <apa6PKthz_vMv3XP@649ea4ce1770>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
 <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e>
 <4512468.iIbC2pHGDl@diego>
 <apGMEsCwly8TCOww@5be1eda4e59e>
 <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
X-ClientProxiedBy: MEWP282CA0129.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d1::9) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY5P282MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e7b651-34a1-466f-59ec-08df081e32a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 4PHA7fkqgJXwvO8TccO/D96thmsgD7C7qObnnQxS7IhNjuhvFBDhbZr6Xv9HD4I7xqY/RaBzbBmA6rEENLvKxRLyeS+6F2Ygv82a3AL5+KLxNu+uo/nlEvLWL0JN0OS5a5YaGTj2yqxbmhupcNuYL/dDGlu5Ez21DYQ8b6u5eEgOcmwyS7IrekT23QqwfQHcYSXzMf22IT2SuaEYJ+Gph4ZcjzXya5MQ0ibjtX/cnwT7Tht/b8sD7uOEU54osATSdak7fyDfwkNfsOXEPJgbtXSzxPThtXNqdR/o23Ibua0YvxL9nbzfSxumJtJx8Dw9pd7Rl/W0ocG6iUBxBhIDII2jZ1mfIIjkD3jWnM81TeCKMOp9MCTUhy/3jX0T8wB7VGeBstySU3QgUDEzXOYB8jYAF9NpkIV14+kY3HMrnrJ91RMJf8xW4TFeAUVi6YuPXyRUbne5jwR3fenEi9on0oOCcY9otpblpf5EELAVadvV6CWmshKA96NoHg2sTRSnYrkmIrpG/EthbrQHZC/aZrPgfWu09fBjpdOvNoO5IMcn6r7PHnBl6yLH5Sp4yrSwBUosog5qoLXEKQ8W9OK9LMXI3lxjXbrBvmlaL3is57XfTZryroVVxfXhBjA3563dVHTTTzMgY/PGX+/Vl3CmlF8X4izZkFqt+mTY8WORFOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFebHJVF2SS7ycWWFriUYMzzV0c4HwVKvEkqiYmEaByySSHrFYCLkwayvnLV?=
 =?us-ascii?Q?dtDsj4onfPMq7WhUFUV/d68ChpGKMfStgkoI6HJH5EPAOn2SmvQXla/xu/gU?=
 =?us-ascii?Q?BxLLwJoQT+OdualYmqOaC/XK8DWb8R1RBLfTVfD3K+yaaut42PJ5Ckqsg459?=
 =?us-ascii?Q?NT793z5Q7e/CX420RH5FL/8OlWZW387xom9kJQxC2AGp8rA8250xe8Rv3Iye?=
 =?us-ascii?Q?+BGkrRpn4G6Mosv7mpifJapImxxpeLxd8+8eHeaCFbgVyd2VisY1dHzxJknr?=
 =?us-ascii?Q?I2GgGkNkj2572Du+dAXkCKlrYBUq7W34EfrCQuYhx+pl5mnLa5L6EoZZe70J?=
 =?us-ascii?Q?FyWYQZ+INb2Gbhn+JKaCeTI1M7NjwbChK+1JraG+wruZ3xzGJobcyUwZ9mjN?=
 =?us-ascii?Q?uSNHPY3qJGhJogCSF10xvUCvD3q9lN/KzPUUuo+YW36C6QtEuPBNtu/MXkl/?=
 =?us-ascii?Q?mVwLS1t5ikdudgcBaXw1U9/eoeGaNIxEqpE+yOYcqhrpFeo5TMJ++ceDh+vY?=
 =?us-ascii?Q?DuGj1B7nL062QP4CCQOZTW0x9dlg040DMAG0HCJ5Aenm8j7q+gmTxViSp9KR?=
 =?us-ascii?Q?guiLxiXPZE3LAqQNylj8nagVM9MdYgBveiwKNFiQrqzORaX0Y/JcyZRdkO2r?=
 =?us-ascii?Q?+uJxXSAjmFDsBdUkaACpmWCvuS4TAwypnxF3nEXCzbOkNu+jHhX7jdrqtM8k?=
 =?us-ascii?Q?6VgvDT04wxxE0pvSwcU+Sv5B5d7Iv1OxPR2vYnavv6QF1eMH8xGBvu69qHqf?=
 =?us-ascii?Q?lE3yrTw4FBVl2elDb5XXAFdk1Cft0bcdICeNrEis0yWWLL7U5ASK4NHC6iqY?=
 =?us-ascii?Q?Xqd5thhUrTVBCVmjFeuGs+UUL7HCxytGdJJHSmZJfQn6JqrnJnOUqkfBonBP?=
 =?us-ascii?Q?qsrYE8fbycSB9M/qV8KONMFH1gi68xtHePE8oQUZ+Fz0OeZHwKUKzp2PylUv?=
 =?us-ascii?Q?BnXDX7JlZ2+/09WJx1u2+hj1Ig0C8mIzaVdjYZDDa98y0sQ6eWq01wjYkVRL?=
 =?us-ascii?Q?NCC+eLKgBVF0EnKOLYwqD36xjVDLIzi7qG7L7RQCubOAbUsI4VhvEvfmBwm7?=
 =?us-ascii?Q?clx71ZQ23oHuHwnG4DcJggIxYvu40BqQqrMJ95245dw6rE9xKzwsZnHshjNs?=
 =?us-ascii?Q?qSEaX4L42uLQOMPqfGsi5+52Ezrm+oUglbomGwA2nKfCkuOWnb2x7rYvinxZ?=
 =?us-ascii?Q?bqiqU42S0WXCdTIMIkqK88HmSvy/RIFoDkTXPAuEN+aFQ2gR+TcUCd5IN3Mo?=
 =?us-ascii?Q?PUBbObbtbp+utwAsK5IE7pPLhFs0skRRDQ460sCeFp/fwhn5/av9oqUW1/Jx?=
 =?us-ascii?Q?Ld4VMYkFjx+xO5ZyUF1E/oQDvANROAcQOrzBWerRZ8HpaFEXL/hs3MxDLO3O?=
 =?us-ascii?Q?O4g7G6BBDlOg0bEyX+7oRJ4YZLc9Agdpe4bIiu6ZvLzZ3GsEcc3PWyQGSEKO?=
 =?us-ascii?Q?eOs5ySTpTMB4y7HDQZ25cJeg0ErPZ0PZ2MoITenB5nAIacf3myZFtGANYAkj?=
 =?us-ascii?Q?gwu1lazmrEOdqlxTl7LMiCLVDIvH+XWoOoBvFxKJd+zQfZNwokIeyVQeTvKv?=
 =?us-ascii?Q?QJHOjHcUmgetqzXL9hB5o9nPAyCJgBqwG0R1vz39gopyctQ1eNFtPhnSm7mQ?=
 =?us-ascii?Q?g52ua3elYltxSgEWRG1METfClO5rh9DxG8RQJkpY5SuxjHdmZ55Koj5F2ZvB?=
 =?us-ascii?Q?WDllksL97FskgruI3Fca59qNFnehFFN90/Aa+KPuVfgVPEde?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e7b651-34a1-466f-59ec-08df081e32a1
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:43:10.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WDQBVeFTjaTdBBpsaiKGovkPKQHldLgkFpzs9Sg1FtkJReMRN6VxPJmTX/zP3tCSGJLpAU9/PN6WMYW+m1KNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB4758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_044332_886377_6427011D 
X-CRM114-Status: GOOD (  20.39  )
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

On Mon, Aug 31, 2026 at 09:41:08AM +0800, Chaoyi Chen wrote:
> Hello Rudi,
> 
> On 8/28/2026 9:24 PM, Rudi Heitbaum wrote:
> > Hi Heiko,
> > 
> > I hadn't looked in to these from the mainline viewpoint. I had been
> > using an adapted vendor script based on the radxa npu_powerctl binary
> > which reimplements the npu_reset sequence over GPIO.
... 
> > I have the schematics and the working N10 here, so let me look into
> > describing these in the .dts and update the onboard_usb_dev.h.
> > 
> 
> Perhaps we should first check whether the power-on sequence in
> onboard_usb_dev.c meets the requirements, as it enables all
> regulator supplies at the same time.

Hi Chaoyi and Heiko,

I have done some work on the bringup of the rk1808, and can confirm that
it needs six rails up and its reset released before it appears on the
bus. There are no ordering requirements, issuing the reset 25 ms later
is reliably working. The supply names being "vdd", "vddlog", "vddcpu",
"vdd0v8", "vcc1v8", "vccio". This moves the power-on into the kernel
and not the userland script. 

The MAX_SUPPLIES fixed size array needs to be expanded from 2 to 6 to
accommodate the rails.

The rock-pi-n10 and the on-die rk1808 (including the onboard VIP8000Nano-Q
NPU) are now both running on the 7.2 mainline kernel. The
rock-pi-n10/rk3399pro-vmarc-som is booting with the mainline .dts and
the rk1808 is booting with an adapted vendor .dts.

The required changes to the drivers/usb/misc/onboard_usb_dev.h are now:

    @@ -6,1 +6,1 @@
    -#define MAX_SUPPLIES 2
    +#define MAX_SUPPLIES 6

    @@ -134,6 +134,6 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
    +static const struct onboard_dev_pdata rockchip_rk1808_data = {
    +       .reset_us = 25000,
    +       .num_supplies = 6,
    +       .supply_names = { "vdd", "vddlog", "vddcpu", "vdd0v8", "vcc1v8", "vccio" },
    +       .is_hub = false,
    +};

    @@ -167,2 +167,2 @@ static const struct of_device_id onboard_dev_match[] = {
    +       { .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
    +       { .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },

Hoping to get your direction on this, and if this can go through as a
single patch, or should be raised as a series. I will raise a v2 of
the above if this is suitable.

https://github.com/heitbaum/linux/commits/rock-pi-n10/
https://github.com/heitbaum/linux/commits/rk1808/

Regards
Rudi

> 
> -- 
> Best, 
> Chaoyi
> 

