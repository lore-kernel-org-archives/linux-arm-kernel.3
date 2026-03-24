Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7206FEC0EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfQNIAg6A0UVCVNqjtPFlhP3KSVfJEtkcE5a623/XF4=; b=sny/HAvUWJtz+7fjOElZcGAEr6
	tbpjQFBHJt8AMI0qrcOTa4RG53M5nYne3vo+dHH8jwDCqqV66qwBOOVgzp5lKYVN7xLMapyiDRMHH
	VTqHsv/CEU6QKAr/vBLv1pYmT+uyEady4boPMRrXe191SCQ3n+iT0v7WUrm+EcN+ushVjs94gC0P5
	Va0iHyYD7rO+N16xaLsMRLZopkfW+JLL4VPLyjv/v6jrbeAtWrqsD2XItkoiLGY/E+s8k9zJXLEus
	8po95Yu9L/hf90SNh4gm7x91Ra8UAUevw9fbY156HJua993hjh0TrrPdGcBSJvfTLFqnUCI5jpmDg
	j9r8R80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56dx-000000025YO-3pbw;
	Tue, 24 Mar 2026 18:38:21 +0000
Received: from mail-westus2azon11012039.outbound.protection.outlook.com ([52.101.48.39] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56dv-000000025Y2-1hsG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz4jiEXbj4xNJbgePYtBpU1NxD2VWA0A2/lwB5vMynyI/nIU5VRwo9P0zZgPN1/eHTFchf+0IA53g5rSwM/iRI1VumHtTZ/DaC5bb4LlShmt8N93N8GB8qb/ohcMLkm1/E2YTCR0i8QOoJPsbNok0I8O1iuYTvZ4Q6YHXl3wUEobuWiE/WdBGCST084WTnROqIO1Tzt5UcpxOATvhjQ8Uy0ggcrjKgYLrYUTB6Bak+g6NVnslViV1DqasdUo+66ODKFPuwn5JdZQQIq388oxN8wZU6sT9amnXwAJB4HWrJVzxh+wz0GausfzmJJ1Wd1o1LtpZX4kS5I9/dgFdtZXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjglhRHEom3Ua5Hezv/IzfBjRrryjK2VlmqqVw1gudc=;
 b=PhDJBkuQNnBXnZZ22dbQyNoHVlslW9PwW/6mgVJqGM582F3l4lNfBMbZ8gff9gXt+oBtxOtYWRG5kOiVd0WjGfDYOq2225acj01SrjDuuY8MUunCAwY9p9NGDPoRbPIpLGR1vvqlam6prAYeMdB8HM8tFEOSqtcdu58XSBvuvHUOrx2hQ3FGxtdX/L2inKR3MKoKSWAaBMfHelgSPyiFHRQKjjG19dE03B5Na2teIpTzmcoaWUas9dYZUryhIikKnZVuD25eF5R+cjNiewB6pDHlom1FSDgBehqBhNQffbO6a+8JCKfuo/C+PV3V0GUxPmc4e6yT4dPI0KBnTHgQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjglhRHEom3Ua5Hezv/IzfBjRrryjK2VlmqqVw1gudc=;
 b=SLpt7xwkOwx5GA+kFZW+tOuKQIvjfEQ4+4S6i0TdL+26bCRxIttTO5u+JFlaZi68Dx/R2+pF1dl87MB8iQLwuEszH8dVzAMjwGlU/9keuwKclyXuuSpDlgov+nr6uigaeDTocglt80Iw0uod24DTTynqoUuzaD0KU3hJhYT5yKms5ijv+I/QWt/5Cy0jJEpEpLyEejSgQm1F7Dg+BHsr4hyNFjslwOvN3i89DJO187GfaPjWFV7NyJaGY4Kc8+LySo8rjp+qxmK+5KrAu9KiVsTe5Gl8EXve5yMgudhiIWIhNg8WT2QtwIN+hNgd+xxxvMAADrNuX0lmaIsiiz18/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 18:38:07 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:38:06 +0000
Date: Tue, 24 Mar 2026 14:38:04 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>, Tom Rix <trix@redhat.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>, Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 5/5] fpga: m10bmc-sec: switch show_canceled_csk() to
 using sysfs_emit()
Message-ID: <acLaDFuCzt0d33Q_@yury>
References: <20260303200842.124996-1-ynorov@nvidia.com>
 <20260303200842.124996-6-ynorov@nvidia.com>
 <acJWNRb1t96yu/H6@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJWNRb1t96yu/H6@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BN9PR03CA0569.namprd03.prod.outlook.com
 (2603:10b6:408:138::34) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: bff9535a-2444-4c3b-7146-08de89d47d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: CqtxLOwmXTq0NoVZpUgRCNRiOQiV1RlFUYk5XXM1CrmrMWbH6zl/b3mUh3gkQWRRPb+RmrIn8geUxA5+3GwkFjGDPCWrq3oSkPgNcyH42jPHKGwa9ebE2W3+8tOwpQwUQF6ooELWuiBEffMYq7YJo6tSRO6GvzT1s9BTV88zwcxypXB6fRPZOw+h4MIv5GhBUa5+LT68WpjdVh2yJ2MIIQTZPnpq971fT68xVLsSw9BsOjFquJyPfCelc8K1TELq5KQE5WzDtQbjNW+Emo8xp350x40YUrriKzOGi6pudikb8Vlfg/NwRvBkc9RGaLe4fuX8QlYf3/UGZ8QyTq2bNMvcWgEeY5bzIR2p/oOBaabPLfwEdkDRDGTTEcNMeDZgaaLU8iiZrm+79Fc8oZlmHr2qe/XMRG66uRlhLee4N20Nx+xvmcWdeWaIy2Jy+6obkE+Gf7tceyouU6omku/zMialv0n0wY1QL2SwzBW939WkgM/+yoRAcUQC+C+skxdm2gW3k1FUcWantFryyf4uks5jUNHJ/PrSYn97TRv3v+ASvsXKC6QDpovgb8OGBWke59Hr6B11+lspq8HC6HG+1uiz4bdL5PJJ8vc+OaTy4QhJoR5/wGw8Akw87iQC2S/vEK/y22sWd8O8cxIBsjOSUZWYc+ioXj9HScuYJO++ECSWxco9VCnNHOv5y9h7UdeJtmXJ68AjZwUwykbBIVDT++doN4nESfW57YU/qRxs7S8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YvIpQjBz5kCRPnJB3kD0/KuDlNufbKJZj9gWxK3Z3M2dxeozye5lcFdPNk?=
 =?iso-8859-1?Q?B7uOpjE27XWp/xvvCdW3STLVQiI5kDhXfwlVBiCqpMxTU43BtSBRbovNik?=
 =?iso-8859-1?Q?hlKvkp+1PpHNMtBpWHhLVKVCNkV6URUVEmg0GB6mMLvQSY/PVnUZs3pgzx?=
 =?iso-8859-1?Q?K4jRsY2XT24NHDHORV+9t0R1+r62r89D1kGrjsqRoW8KQnGLR3Qbfe5cLC?=
 =?iso-8859-1?Q?3nm0RjuOD07zEE3lJeFaF7pnfTPTU/zrui2XtjFSc3aT9f/k08nsZuJO1I?=
 =?iso-8859-1?Q?V0qsfUglJphf5jG3zUU+jFuEzhh3qvpbcOXhk2MDudWmftDemVMfh3+qPl?=
 =?iso-8859-1?Q?Kmp8mc5hjZLWhKjdnb/Znv0CEJnGUKichOi4HXt2uN/J6//67tZWFU0dnz?=
 =?iso-8859-1?Q?02LCxZxNNJUeAxpZYeHFTpJ69qSDETEamV04N1F+WCJHCw+JOXhJax2ZDD?=
 =?iso-8859-1?Q?3aaxHxZfvrTMkoAlvP39B+fW+etFMUNeVeGZCvvEEvA+A3IeHbsvwgnb+D?=
 =?iso-8859-1?Q?EF3Yqo9RJCqrDvw/7jTDTVnqvPC89/2jzb5BU5oKZzahhp9nDtvMzbrsnT?=
 =?iso-8859-1?Q?R1M9RrgJziXdTcQA4AdBoNOUgLZ6rwZoKXNfXZt4GaUKqCMZdlrCO4P/IX?=
 =?iso-8859-1?Q?TrvjguJoyZaSoC7VSa2TAlXyGyJl8V8kfiSgQKILn+CqXDI3hEj3MIl9Gk?=
 =?iso-8859-1?Q?iGlm3ia41lsOJK7v1yHHwN+cOODEHHZl7FvKShHo+TMac0vV5n1pee/lvT?=
 =?iso-8859-1?Q?UQKWrETMY1FPXpfQYabLowZosfsrFcz0IlE+xvTRe555R0svwO6MJF2YTX?=
 =?iso-8859-1?Q?RRDGVSmVh1s1hbUQh4jRq5D4PyRxu5oIkr+Vz7PEbA9pJf9p91WDu+Gn3q?=
 =?iso-8859-1?Q?Wj5TKhK/mDbjFAqjwSnRapr6tqP6S08zCdAAV483pRCge8PCl6+ZIwLSnz?=
 =?iso-8859-1?Q?zKC0bw6Zk1eiGzR3Q/OmruC5Adfh4ddCcgRNLd2LzP4iaT4STqlja0/zIs?=
 =?iso-8859-1?Q?YtzA7gEQLLsU9KdUbvHoy2qjX3oLZXor5gj04zQES8g7O/YlZhP6C6x+Dc?=
 =?iso-8859-1?Q?n+VzqA3cJKxN0JMBanqH+fEnRL1/hOfgLzg159z2cayshdJvXPj3KoVia0?=
 =?iso-8859-1?Q?w8GWWlCJuI7MzAcgfO0BetPIa37rlB/G3r/mZi0ZzX/wZ/XS3V4wtVHWtj?=
 =?iso-8859-1?Q?DQGn3MPaqreDUakbicFGqqLjvk0b6IyQTxXwicKmYZS+SSZQTjocwGyOTg?=
 =?iso-8859-1?Q?ByVlTDN32QFHrbTYwb2i4JLyzqaRO7HgEYgnR1gg2fMJq4RWteaAZxr8Kz?=
 =?iso-8859-1?Q?LVxiteT7w5/uGnNNKriLmrafjlq6MePp1Yjtv0EteA3tPeB1F8YAPuWIj+?=
 =?iso-8859-1?Q?fl6hI3BIm/VOQW04/5w5kfCVWvza3t6CYupnqEUb1iFeMadvDEv9nT6kmE?=
 =?iso-8859-1?Q?c/JHAuKTpxgK3yQA5A3CZn8RE15bw1Ue6/z0ieYQTba72C/K7BNpZS7iYp?=
 =?iso-8859-1?Q?z2Kx6dlImFqh1CSRtSHZsmSKXEQX4E2yCsU3xKSMBsttWJRDLzc1g862sH?=
 =?iso-8859-1?Q?7riTWLUZlI40ZmV4K67cJv1mSQ00Y+nG0JeF5no3RFWZbgZcySmsK7M5i9?=
 =?iso-8859-1?Q?EAYBmH9TtMX+3myenJPNfqFgbYx4SUEmvhkPwSAP0K3jU+UxTGyzNfDhob?=
 =?iso-8859-1?Q?R4WdesX3nOPB2+9JdkgrtPQj655wV8I9LZ1KvQ0iJvb291UteEMLoqs/Ol?=
 =?iso-8859-1?Q?zIiw/vKkI43bKKYyanPKlQYExOJKUFc0jKQoMxK8AHx5zNhudGxra0jqAC?=
 =?iso-8859-1?Q?fKmr9naNoBJ9ugiejVFEFaF/EVsW4WUEQ9RnlX++rQuXkxXmWlr4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff9535a-2444-4c3b-7146-08de89d47d8e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:38:06.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqkWBArMbfkXP5T6TRWRZRVc+IzaQ73a1Wv9JQSFf8XFBjLCKl9C5QosVkCN6QFDcW7ckRa/LTv6oWcDvmEEZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_113819_444101_A4BBB946 
X-CRM114-Status: GOOD (  15.37  )
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

On Tue, Mar 24, 2026 at 05:15:33PM +0800, Xu Yilun wrote:
> On Tue, Mar 03, 2026 at 03:08:41PM -0500, Yury Norov wrote:
> > Switch show_canceled_csk() to use the proper sysfs_emit("%*pbl").
> > 
> > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> > Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > ---
> >  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> > index 10f678b9ed36..ae364c6636eb 100644
> > --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> > +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/firmware.h>
> >  #include <linux/mfd/intel-m10-bmc.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/mm.h>
> 
> Why add this header file?

When I was preparing the series, I had build issues without this. But
now I checked it against -rc5, and it's clean. Would you like me to
resend?

> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> > @@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
> >  
> >  	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
> >  	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
> > -	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
> > +	return sysfs_emit(buf, "%*pbl\n", CSK_BIT_LEN, csk_map);
> >  }
> >  
> >  #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
> > -- 
> > 2.43.0
> > 
> > 

