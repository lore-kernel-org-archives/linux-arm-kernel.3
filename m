Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D22CDE00F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4vMwFFp4X/mlBWxNickQ1YWz8STFBIbPqwQXtWSFjI=; b=4YQXXOi+CgQc22XdXBgCXdRfEz
	3OrkPnXshLy4nYbiKycTNd3jLB6yQLr+BUGJYzHhNZaUCRs/vty4+IRwqA9yAyvMNUf2crf8EjMeE
	pT28/HfRp22LvnCN9ECFf2f9o/WXpB6yofMUSUTl1mAqbjGOgI3oxzTgQpKtCi+6w6a51lzTIzG+s
	/9iWOHzMAA8/LG7gPMdI+HSEap8WsfBl6dVfQPWiXqMDBrdAIJ/G3yzUbOauzc+bYn3WPt8WHeZ62
	fKITowZDG3rxvsSOwwaPwXmCPtYAqxFVZaLdpg2hIgSMDOqr6TkVBavcCXnpgEl+MnajYDQpwVIBV
	mIOtuDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGx-0000000BeTR-0WUQ;
	Fri, 14 Nov 2025 06:27:03 +0000
Received: from mail-southcentralusazon11012052.outbound.protection.outlook.com ([40.93.195.52] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGt-0000000BeRc-2HnG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAqIxyHPJngonIFlpl32YXFaSFI2qRywFQj+9qT+gTBUI6VvkBgmmnsNRsVP1G3TkPYgv63ruGzyD1xfSnJOzonIy7MCRerFXW+fMMI4M4Q8d/Z/JWekW5TtVkxM40bro+P8WxStBP8xrvGP3hVXb1rhmuetBL0M2/EQculVhE2oQqOz6dDgAwg+Ne/WUmG/LLx9DL2KIqidqtIabB3htlkV0ylHuXhoHGvgcZ+VaYsEqcm2tykEpdWwGxBZngBfnSThFJErNSqaXOQ66t5LwxLI6htQVSRP3Wcemsn/Hrjv1lRIiUblvwWOpV6pKze2n/42mHuO4mtOVk4Sue9VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4vMwFFp4X/mlBWxNickQ1YWz8STFBIbPqwQXtWSFjI=;
 b=PxrJTjjgT7sN+fNlhFYhR/yOWSt7YPDsfRP7d8jAx4k+eSycu7156FbAlZUlcaw4NZiI1Vz7VPpNiHwDMKwfECCtRZxYEvMpjCInXTb/r8WjuGMXRpCqRWZ7SbynQUxW959EM2X1Wg0xJ9Z0CGT5u9DIqGM7j8U1lR08eXZTXokn1vEyXcJhrjMlxSFPDP8mks8GfZgFrfYoNhZLhuksZtYRn9Y7WGpnCil5wb7ffxr6BDDdECdcIzSeNXJLs4yJoj4itp04hJgvx+PlIIMCQC9JZiufx9lze1P2EkeGv9RbA+iQbqnvlCKoj2GTrNTcv8wZqCoymM4FYg7lFthFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4vMwFFp4X/mlBWxNickQ1YWz8STFBIbPqwQXtWSFjI=;
 b=Kjjd+Calg4lVAHWtNjjzHz3nEgtCoX6O3ocvwcPRVm8xITasN/KWy16TSEM70/sEVZ0AeiCM4vKy40f5XGP6woNAY9OwfjM10DEK6UMFKk4nSY+kJ4OWWtKY64wCZIEl3m4ufmssFbroU0ieXlfFioHk+QcKxUrZFgYYPQF9TPWNSGToNFn7Z97WVrNIaiehZbEBFGAqvmSQ1kP2KS4T5HPHDMkTpTWiaz0begkca+zIa9Ptbd7QFt9X3ngHYeXbB53j9/Bbpq8aBvlPgiUN0rotjwAyN3hv9vopQObQwjuv9FOcvCr1n9cCQ3FDp5BzQx4i63gbZXdmwRSuUjRUlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by BL4PR12MB9506.namprd12.prod.outlook.com
 (2603:10b6:208:590::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 06:26:53 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:26:53 +0000
Date: Thu, 13 Nov 2025 22:26:48 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
Message-ID: <aRbLqH8pLWCQryhu@molberding.nvidia.com>
References: <20251108-msx1_devicetree-v3-0-c7cb477ade27@nvidia.com>
 <20251108-msx1_devicetree-v3-2-c7cb477ade27@nvidia.com>
 <a030d7a2e2d36064bd86fe2af1ec6e4baabd9946.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a030d7a2e2d36064bd86fe2af1ec6e4baabd9946.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ba02c7-e20f-43b2-abb3-08de2346cd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uWwRM99y9aeN47EsvXDO6LyqP3b1ayyOYFIRVdLE33ot7WqSlJDdmElwj1Pp?=
 =?us-ascii?Q?qZPlOvhpFu4obLNzFXJG4jAPxMKKEZtZGVTk7FZdfAW1K62lUHHevO/jHYGx?=
 =?us-ascii?Q?SeXFR5QmTmVnpeoeYIqt/0J1mMBSblIB4Ns/yUF0UapuHgM/3c+TpyqtWNKC?=
 =?us-ascii?Q?uR6Ih2YxYwi10TfiOQ6KH96pX6ZxBfwSBb+DdLa8EqTz/sRrpHprsFIORTBq?=
 =?us-ascii?Q?dRKPsLNXN/s/auF2Vr4fKKF4Xs8W0wVjYcdcpNqiFnEvHGm1XG8IBcbZGcVk?=
 =?us-ascii?Q?uLCLatURogU2ckO+370YECBmpgDjs9gA7yMNxe0zz56PhZTtGeVDE5qNGhwu?=
 =?us-ascii?Q?d4NZI499R6h9MC7ttTwd7JszneCGfKDdFiwvTcJiQyVG49WQkJqIkvHYv7CG?=
 =?us-ascii?Q?8kTFIBQlMLjtGiBsH+qEGLNxJL3c5C8tsVfQleWhswoKpBNRXZ8LwjxPCkte?=
 =?us-ascii?Q?3esQ5g/nIZvDeM3qa34ZWRxQTwVBOD8Xhx3m871RgHdfuut/pmJAB8sIKLMr?=
 =?us-ascii?Q?bSBJdv2QRyzulsbLU8IXO4Xk3bbfoxwGb2z0HssOz8zLuHXcWAk8YKRjBpKD?=
 =?us-ascii?Q?ihgY0G+85bI9BaUsmMjO1zR30dCKzmuZB+5LtICSIJYqtZ1V2sh8p/lbtwsg?=
 =?us-ascii?Q?OvY2NoNoW62ljP4tSDU33wwjZHtcP3PLGGSU9vmdevrkD4Lk5O+jbic8MBdM?=
 =?us-ascii?Q?Cs5n5yu0yZWJxgI09bJiZW0c+IeC0W0HlUViUTlN0zZDzLDGtOXkPOKz4V7R?=
 =?us-ascii?Q?wYUq2dNVotpNqm7KsRE8NfNt6lt+cb44Vt3YdG2H7NAQPZ2EeLe0mfonlxgM?=
 =?us-ascii?Q?DioJm3lPzu89Cah1IuYLz7/PpJZI9WLVovxdJ5Az+tFKvEVlUlfi6i4ZMepZ?=
 =?us-ascii?Q?145Vn92pDjrs6svoQuCIAvYO+jNEs/TcS+VVPicVVtkBiteKek5p133u/zui?=
 =?us-ascii?Q?wVVEimGV7p7162bITbqi9JPEJIUo5ftUx2zozTUMwkXRhPn6QrMrZm1mTaTH?=
 =?us-ascii?Q?I+CEEoqnCAUkX0TXTRiY5QKNC81CkDDF1eqYCwN5sffMB+DMMdujOuJZ7NbH?=
 =?us-ascii?Q?p51ONGTzrpvKsvT97qmshlww42KyZMmIZDCXtcv8IG9nSAh75tcI9BvCyDPU?=
 =?us-ascii?Q?pG5NYTwfZgT1jLzRSDAzhJRdHgFm/M2ihMKtcWkjLD6My+PJ7JHriSUqolya?=
 =?us-ascii?Q?AlVYdSHCIm5IahCUedM65ZMDC/lHqBmbMIs1vbaxp4jaUvnrXntOoN17ZjjU?=
 =?us-ascii?Q?G6IQiaeBh0BqFTvs0hD/Qg7XzL6KyZ1MXaxqFUIZ3OeGU9PSGT5gnP8/SsmU?=
 =?us-ascii?Q?ncBNo3FnESqnR4WtsZIRTz3vp0JzD6TM6endkNeEZs9PZ+GvYBFXftHZh4ag?=
 =?us-ascii?Q?uB2tvNP4s0jBJyHyoNFp0qKQh3ZqZZbgxmwG3zKs3uX2ux6T1keVJiSyvcDr?=
 =?us-ascii?Q?Zvt187wQuGua3TuBi1WnOa5x73CtKxVI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yxJK9fibSuNUrfUL3LMAgUlX3DeuMzuOXldzkwQtXBSluSqIknmgcye/QwxW?=
 =?us-ascii?Q?HuwJJYDxanXhak/8QHRXlXsXQOR/cYdNWdatP8ygpTfixdbAQAC+hClDNzm0?=
 =?us-ascii?Q?uHeo7zHaCHU7TeIn/PX266derwtkdWLHHSppgfNTqtVVsXaG+ywscYk/KOes?=
 =?us-ascii?Q?+tKCwtidU49VvIuKRMWkWRu6j8L/zWiCxHREYxWNlZcCidUagQaJSGuxxKxW?=
 =?us-ascii?Q?8FFCWh0bsramXhaAC311dhHkYxewg7NxO2ihTKL7CAlnJG7mGkbPn/WXjfrA?=
 =?us-ascii?Q?2W0KFzWVd87pSEZKBnBh2P8DWBi3DuS457xlpbrVdNCr9H40IfkFweoCB+x1?=
 =?us-ascii?Q?lW+I0q4dnfMvp3L9/zknvutvLBb6NZLIvwPjcK2UAYv5HDEsPwnpwBfyLXlU?=
 =?us-ascii?Q?wrgUCWF8Z3tgO+UexRF3VWRzUb80j4y8TS4IvgBt2fz1DoESg2ELJAvViA1c?=
 =?us-ascii?Q?782MpxWfNxvtf0MiiG2A6fhLH1BFNJNQZGm/vhbqtNwztFH0wfH0X7jM8rtV?=
 =?us-ascii?Q?Wp/mLokwGNDCuk5CkPXURgVAFQMNcI9B956xBpPB4QK3q4OFdMY8lOLT5Ll+?=
 =?us-ascii?Q?9vxO4aqDyffQ1W/uJr2kdADZNynZPLI4/TtTef30vMI9qXEWrd9BBrqP3fFe?=
 =?us-ascii?Q?gcbiwEU1hBQOu1NQhqONr12AXWWtEXgA7FkB/bS6oQqE0h8pCzGl8gyySNy5?=
 =?us-ascii?Q?vOQIiyN78rKqgSNG/q84PLkwfKu3WXZXPogqnXFlnINck8CIX8WWeTUReEGY?=
 =?us-ascii?Q?HQsvtJdclqPN+CcglD3eDXYVjwu8G6iY7JL9x2PuCRGyDNiDJUCrqS6oeiIr?=
 =?us-ascii?Q?Kpjs06Qj43yYhTm/tIwLg9scQ7fp8j9AtFZekl8QjaHbKPmq5bsdMXasOjyx?=
 =?us-ascii?Q?5UL5PhsykItGmHrAMHrLisXk2l0dQaGhYQjQzIBX7mglo7URF6e43xZpJoF8?=
 =?us-ascii?Q?FFxapH3Dp1UVJ59BqDEgm44BfImPdTATtqaBZRTFLHQ6Mwxohp1JURol+zRn?=
 =?us-ascii?Q?I59r61St2NKo9S2ao/J2RzWnDkqJAixrqGDqkvBYu4yLMJBppEJafVGNllCg?=
 =?us-ascii?Q?tD79DbHBGBKjAeMcyXyAwqEAve4NYvQeOx1+4ZXdDwOWZcxS2z+sGgn3nquI?=
 =?us-ascii?Q?j+HIYinvnMIIDsSD+5LPsvisSCAc/mPVvPhAM/aV0RCoLfuz/dhUu/HS+zjh?=
 =?us-ascii?Q?Qspxg3IHyl0Eotg2xGpRepN+ed5cBTxcjCoXvpdP5jZjgfHsYAyKHF3/m9tR?=
 =?us-ascii?Q?HhW4w9k3F1xsxYgwKmjEqxT7RiLOb9wWuFvLaahc7g1Bf2duxfd9L0XeIFGv?=
 =?us-ascii?Q?1/XJfdIhkDcuTG05hfNyXe/o4t19fbgfMf9XXiVWB4UGkch4rAMvVufQ4CcU?=
 =?us-ascii?Q?Fd2FUBrh7/gzPtIlB5rPlVA3QPOW8ZwkUZPO50IXr01oXBICIC9XbW4dQ5aN?=
 =?us-ascii?Q?0iswwEG9aBwzzhbs5fUXML2VC2ssEZrByADlGzaXKu04P93XJGcVmHM8ee1a?=
 =?us-ascii?Q?8hTArUkIFD2nB57hG1sN8GHZObpscjz457ioBKH6+I+vzaqSLLMp1KWyOKDZ?=
 =?us-ascii?Q?E9G8gnAE9q6FAJCvWqiHgCuXsd0EwsBrKcbN/7U1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ba02c7-e20f-43b2-abb3-08de2346cd57
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:26:53.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLk3ORG7mDBYrf0JRyUwIDHaKSnGmMCuSDkL9NrtSrrsMlBfQ/fQCXIRNqgSkp98V8TLuUA+m/LlRRfssZjRIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_222659_773325_4CCFBF09 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, Nov 14, 2025 at 02:46:19PM +1030, Andrew Jeffery wrote:
> > +	model = "AST2600 MSX4 Kernel";
> 
> I find this to be a curious model name :)
> 
> Are there no other reasonable names?
> 
For better or worse, this is the most accurate name, and matches the hpm hardware itself.
We may need multi-hpm support for the resulting firmware at some point, so matching
the hpm to the device tree seemed like the simplest thing to do. If this doesn't
match the way the kernel deals with this sort of thing, please let me know the best path forward.

> > +	compatible = "nvidia,msx4-bmc", "aspeed,ast2600";
> > +
> > +	aliases {
> > +		serial0 = &uart1;
> > +		serial1 = &uart2;
> > +		serial2 = &uart3;
> > +		serial3 = &uart4;
> > +		serial4 = &uart5;
> 
> Just checking whether you're actually using all of these? I guess the
> uart nodes further down suggest so?
>

These UARTs are wired up on this platform. Userspace may not use them today,
but we want to enable doing so without needing further device tree updates, in
case they are needed for debug where a BMC firmware flash would be unpalatable.

> 
> Seems curious to enable all of these I2C controllers yet have no
> devices under them? Can you elaborate?
> 
> Andrew

Unfortunately, the devices that we need over i2c are not
guaranteed to be available at BMC boot, and are probed in userspace through
the new_device sysfs node from the i2c subsystem. The BMC doesn't
have direct control over when these devices are accessible,
they are available after the host has completed POST.

As far as I can tell, there isn't a great way to defer probe for devices
that the BMC doesn't have immediate control over whether its accessible.
Regulators seem like a match, but it seems to assume that you can directly
turn on the power domain that the device is tied to, which isn't the case here
for various reasons.

Please let me know if I'm ignorant of a way to deal with this issue.

Thanks for the Review,
Marc

