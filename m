Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA68FC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 23:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdh8L5M+zvBMuElzATq/pd4SYEeUnOnlS/HdGIZ+GCU=; b=Vfj+AjbCfG62kN+O+Ju7Smcr3u
	+EIwzeXSgevXWTBr3IKm6LecNPchN4V1aL1Q3gXIRGSEbJAr1KmVfGnD33A7nbel6ogSpcXEl5xhf
	JWcR0MIkCE26R3TiNmMkzS6T0c7nnc7WvXhiPWFo+l/zSzi7+6VIXDL+wQrcC8muN8X465hww8Nsi
	bt06OCc9OTCfcLJkiqYM6N1g3/vBckpZM05eW03JV6nF8QZD7JtFDjyl08XNe7uvTOJvG3ENwiK2D
	hBNhFeuvLH8ndWjmtaNo+yDWgaoh8We1N6Fq3gwPclVMPYTDMep3GZGyIAjeWwvTihXRJ7h6TBQlo
	rK3mxROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9WYp-00000009ihm-0idn;
	Wed, 23 Sep 2026 23:39:35 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9WYm-00000009ihO-2jSM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 23:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXlLtlh3CFB/tEHoN4tA7kn8HYDlC9NRrrDJcRzNroX/tjDXOOZAFzxQO0AenBG3e+gvmT9O965Bxm/KRg4kUNhEFM5DGqCPx0aJePgCE0D1Z7gncQcsqGMEuHcXkcZ3S0qrqGOtxnPbYuQPn2svcuNV+zwAeTFPdjpQSEKb+WNj03sXin8kx6pfhjxN/TS2+wIW36qIHb+Bkm6a2ZMvazxagaiasSijjHvH+1k6ejLPQmgysd7qb377YA9vR5K1DqwtE1Bj0pfckcBFpgrDLa/Iaqa/yfrbkwKbMFJbgqDcQvWXJ0OhmjVPnEAbuzKBMkcfDFAc3LNmzmUCel/gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdh8L5M+zvBMuElzATq/pd4SYEeUnOnlS/HdGIZ+GCU=;
 b=BqqHVO0b3fbNNtOtS+vI9kEexHc0s8ePewBAXvEJGDGKgL5dd/6Kejfv+UkCvIcEX/bEdCjnNtE1B5oCt6entk5KL/rT7g8aO7vOD9dcwEB0HqnDL5re15Bb0DEKKNk0dwJ76pO3EcXcclcjanFfe+znM0nObVH8AmsVNB+QalC1c1LdywnwUKvjagUuFnFliXg/383Rcg7Hw5gCXNfJEI9DH2ndYn4I/IRciASfjpefOVheiU4M531IIhsRUNVy5SWKGVvK+/20myRgdoOjoNt4MFjpLMrrUXKM8EmOUA4TFoRcLH8a8ZRBivcEVrPoSq4y0LJ1VgGWyMonbCJAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdh8L5M+zvBMuElzATq/pd4SYEeUnOnlS/HdGIZ+GCU=;
 b=VpuvMoxmKUrBaZCCdlFn8TqDH5KeFiHzzIYqMMrHF8ssz1Yk5MWer8NYz8lrmh0Z+TeH4t0pRuTh0xJH07GeF08/JUg2+YICvEXAtIJANR+VJfeH7aWcpHG0HuNEh3Z5WPnAxH0gCncMytk65tqjBnJg8F5sM/3QDH7U6YrNfNmkt9Z4x3ILil9O3Xl9WMpySPlPPITZSPxYCvuWz+TSgd+gzlspmtYpPyKUgzFC6UwyEG5ltJw27ndUvNv3d9EOXDuxbVqbGJhQcP4+9NRnJoMbQLcqQg4kJlI3n/J/Yw9r2fSF+iMJuAieOBtMkNaahEs0M+aIsVEgCrbky6nsyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SA3PR12MB8440.namprd12.prod.outlook.com
 (2603:10b6:806:2f8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 23:39:22 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 23:39:22 +0000
Date: Wed, 23 Sep 2026 20:39:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	joro@8bytes.org, bhelgaas@google.com, praan@google.com,
	kevin.tian@intel.com, kees@kernel.org, smostafa@google.com,
	baolu.lu@linux.intel.com, Jean-Philippe Brucker <jpb@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com, harsha.v@oss.qualcomm.com
Subject: Re: [PATCH v5 04/15] iommu/arm-smmu-v3: Drain in-flight fault events
 on domain detach
Message-ID: <20260923233920.GJ2545495@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
 <cc7eabdd07e7705c84e30b04c85271d4ddf66055.1789446520.git.nicolinc@nvidia.com>
 <179018862538.3334538.17643821143626392419.b4-review@b4>
 <arRTojIlWBOF57zO@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arRTojIlWBOF57zO@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0683.namprd03.prod.outlook.com
 (2603:10b6:408:10e::28) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 788e55e9-d826-451e-6fc0-08df19cbe4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|5023799004|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: JWvkBpninWArqnrtnGr+6CgRQcwHAdbJcDsCPHfhVCQ4lTJgCPzc/dvqv2Bgxlenge/L4wZHf5b1B96dTc1yoeAURN8k+QbtciTiLq/CwqbbUopYy4DeVpmK9hg8BMBnGlvO9hg9MMTOuwNC9pg3N8oHuf5ueLe78bxdqiXGXfxR8xDoQ/mJYtobvn8Qf58B0O3Q4hJISo3+8KhfP81zBGiwe63nL1J+6QPdhIihmif/WGXF1pbIOTMqLl3B5t4ipq7uFzSfjKUhrJKRE8bnjRKVNOph9VQ4plmHWC2jB5kOrHd4io0tkGTpoy3JsRQE654PnAYZE0OKhFZVD+iKoDBVBiHn8AQfOdG5UynxjLrOcMsGGI+T9yrqOqK+aVX9KeJCGmr9biR2crxdBBxRJBBpMf2ZyyMIX98DW5EyJ7wo74vtTFGDmpd8E8yrIhmbyJNSAXd4nzSHMdzLWU0ynKJZ5g8lq3pwGldMhUfCIYc8FEQfc0FagdOzZsFxAZm5SkdRxh7mt9hgUSRjRLCqsCH7ZT3Nv5/POfmbvFdd/yBlE+YJf4JdUnxjEWabMPfD6l1Y/btY/MW9Y+koMGU7MLttCD4zzYBKsbQDdDKq0bZ1pcz/NBVgELhm0xP5QweCNYGgjYqnneUoNUZy/bQJMlkg1MWjeuEvcWrVLg4hmzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(5023799004)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxPSoc9mTAuVUNh+OC93I1BG5CWweZE8TI5QUOjIAf3U445y7rEj05E6PBiQ?=
 =?us-ascii?Q?ue+eESEmcaeddmQb3uWlc+Sddn8plQDXMDok5tAXziue6+IhhHU5mfV3C8L9?=
 =?us-ascii?Q?5obeZoNqVw0zfOiPWeGTv7SuN5XUmFeMfOvc76e6kveBUiX+6EZEzPAnShjS?=
 =?us-ascii?Q?AB1W7I8mVIKDzy1PtoHk5+byJFQQyE6rzluoA6CKwqTuqju7BYsM7cymnzHo?=
 =?us-ascii?Q?xKkGe2UYu4rkKD5AvBujp2XQzdWu+75ebmYZKEEXu3kWzMkNtqfJ7AtWaL9S?=
 =?us-ascii?Q?VYgZuDVYnCZMbp9F7g6gEuxqlX7mWD/OEsn2v5cpM63GHqQ4/GtIZskc9tSr?=
 =?us-ascii?Q?Gvu01wHi0K+/V0wE2TEqIW+6LOGFMruGqjbKMUJSYoe7b3bROp6NaIHaLJ9p?=
 =?us-ascii?Q?Ol5K5ES3sVgw1/50D9311fj60o/XzjolFvC+z7Rjbn3MsO5Kj3tpXLaugHwM?=
 =?us-ascii?Q?d/2vTNMUczmhjBhMXJKuTd2m8wZTHfmPIBrdq4VN2iV8QTAohoKH2TL8xDO2?=
 =?us-ascii?Q?mzWG7lwE0+BR2sEy7rnzNFTblPkeUbKUMW2YiQYGcS8PhwZ1QeR96cSTCMiW?=
 =?us-ascii?Q?TQJcJVRJA+r41tV78Rt5g+HpKUOcegi55PWW4txlLjlyuyqwVX45qlOQYSmV?=
 =?us-ascii?Q?f6oCPMEyt4fN8TTKEbRENrtl5S0ULq/Ddwuz2O586jd5w+tXRuVVgDe2lyp6?=
 =?us-ascii?Q?mnAJ/IJYRUJ7Q3TcBJtCArsquQDA9RIWVt3P1sJ2qjv448dviV9hYNse7Rwa?=
 =?us-ascii?Q?25H7OgCa8w1TZBbk54rf87GwHpQCmIJHEDI5o+3ehvsntj+BxEFJaTNZB9vf?=
 =?us-ascii?Q?uaexKKarrXiTUfQ7pHfUvXpk1JJDdLKIdx2kIQHSC5rCrmHvW4nx4vC/VzS0?=
 =?us-ascii?Q?PpNdNml+NT0OkRMAGrNtK/+4RfSaAgc+WO0ZllDwla/XwqWwNqybMQCRCrAN?=
 =?us-ascii?Q?NnWf3iTifL3Bg6sLGYMgxjkee8Viknldc/GdG1pgoqZldMimmlo6WtA7HeCx?=
 =?us-ascii?Q?g4CPS2E6URqHjhi5JCkSH8GeYzsdFhuppzsz9uT+lhr4pFt4Fzs+gEcUantN?=
 =?us-ascii?Q?niuFwwM1bLYSd3mUck9NhjGiLRgm4OfNuTXQxqQnaF/krsKmzfnc5EMlTilx?=
 =?us-ascii?Q?mFRNODH8CG0yLK/AnbW6IzJ2UD/Xrge0qdwXW/QHecM9eD7j53ayZ47PsfYs?=
 =?us-ascii?Q?xoDlTfX1PPwlvryvjnaShLRykcRM6Sdpfjg/CWzg6WLoyUS/POZkCYE2b+Ip?=
 =?us-ascii?Q?OSjKXtb83lbVsfTUEEnsfrIeFvlKp55MltC2ThpLgnWgZrUxJDhIzWtTn1EZ?=
 =?us-ascii?Q?lTGtT9+6KFmEl8AWV1VmUS8vGQgrGe+Z8Q5CZk9G8cEKHHCgsVkJMzb/oLsi?=
 =?us-ascii?Q?JzRMQQ7pSqDyysQOchHUa2UIGw4qb4NASEx1H20AnzieGZuw8DP+RnBb8xm/?=
 =?us-ascii?Q?S1sL3bD0OWGiQBG+Uf7Ah8tsMwk/FJLDcLQUICLe0/odzUTC3/61UxF//3aK?=
 =?us-ascii?Q?g2uZwrqLVFRt9CyJneMead03wG4bZ4CeNdsOaGqDO9ElW9sJCx3rI93FJua3?=
 =?us-ascii?Q?O4E4IdcNWnjIvQ7+puBUdItPxbcDpWpoh3O2fmgC3JYZoguoIl/D99/ewvHD?=
 =?us-ascii?Q?ziHGaGZwwc5WpjwdajnZT2uguXz4Rr775/Ih4VMbmnfXe4ELAytxpwi2rm82?=
 =?us-ascii?Q?zO7OvBsQiPi0qm2mC7n18MSoNsnBxA/QR15OWcZ/ZHuQipTZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788e55e9-d826-451e-6fc0-08df19cbe4db
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 23:39:21.9547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGYmjf1iRU+wKBm0hCRqFQ4c+U2id2sZHcdTATvGxyYRUBTNodFa9qqirV+jdXM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_163932_693975_3D5D55A6 
X-CRM114-Status: GOOD (  27.39  )
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

On Wed, Sep 23, 2026 at 03:33:06PM -0700, Nicolin Chen wrote:
> > I'm not sure how this all can work, the queue is running on its own
> > with some other CPU handling interrupts.
> > 
> > You can't do this sort of Q_DIFF math unless you've somehow guaranteed
> > one side of the queue is stable for this logic. If both pointers are
> > moving forward then the points pointers can progress and wrap without
> > this noticing that happened. That will lock up.
> 
> One side of the queue (pointers) is actually stable. EVTQ/PRIQ uses
> the snapshot mode (until_empty=false):

It isn't stable, just because this reads it once doesn't mean the
actual values are not changing, which is the point.

If one of the pointers is held stable then the HW cannot advance its
value past it.

If both are advancing all bets are off and you have no idea how the
values are related to each other since everything is modulo the ring
size.

For instance you can read cons0=10, then you read prod=15, then you
next read prod=11. What does that mean? It means since cons was
actually advancing prod & cons went around the whole ring and
wrapped.

You could only do tricks like this if you had full 64 bit counters,
not truncated versions with modulo that can wrap quickly.

> > But I wonder if the point of this has been lost? Prior to calling the
> > driver attach functions the core code already changes the xarray:
> > 
> > 	curr = xa_cmpxchg(&group->pasid_array, pasid, NULL,
> > 			  XA_ZERO_ENTRY, GFP_KERNEL);
> > 
> > That immediately makes the threaded IRQ safe since it calls
> > iommu_attach_handle_get() which now fails.

Hmm, actually that's a sneaky cmpxchg that is only doing reserve..

> I am not sure about that. Looking at iommufd_hwpt_replace_device(),
> there can be a old_handle != NULL, in which case the cmpxchg() would
> not change the xarray?

I think this is wrong, there is no way it can work like this where the
attach continues to see the to-be-detached domain across the
flushes. No amount of flushing can fix it.

Somehow we broke it :\

> > So all that is needed is to synchronize_irq() to make sure the irq
> > thread sees the xa update
> > 
> > Then to flush the workqueue that iommu_report_device_fault() pushes
> > into.
> > 
> > We don't need to do anything with the HW queue.
> 
> FWIW, the idea of HW drain came from intel_iommu_drain_pasid_prq()..

Yeah, but I think they might have over done it too..

Jason

