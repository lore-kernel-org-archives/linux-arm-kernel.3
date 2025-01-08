Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEBBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq1sWCtUgnn9/9gxwsB8yafqsR0h5yt6x0i2JsWwai0=; b=DVBy3YwGl839BMZ4BDwLKTxRhD
	4qYH5aMuxgCy2a1kaXppIxgECXqdOefKzT3H9BTEYWXs8mnfAzxxfxPYELXefs+86bfpXcDzBGFnw
	eAfyUi6ntQ6XoLqACCBCGqrNZZlDwaHrAmA4KA/W+Zp39mrTyVPdVqbS0a9IuyKBytjdAsufCzVcA
	Phl696Rt9DHTE6ky6tbsuHkuMfkmtMUTmYwaW6ciCO9UozXeT4luFa81jqHtyGa0cuLKon8jBERkk
	QtwFFsLDv43dGuCcSfETQuYI33NWA1PmbeOfxXt9lDY1Txx6rVS1U0OX+uCUwFNIU2e1whT7Ocdw9
	hlA4ntaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVaL-00000008VwH-44tJ;
	Wed, 08 Jan 2025 12:54:58 +0000
Received: from mail-db5eur02on2061d.outbound.protection.outlook.com ([2a01:111:f403:2608::61d] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUrt-00000008MQP-3mth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2lHuu4hX8W2xDW0fxdzi1xCnBjwIxfY9jXn/vApteFyHoBQKtEjDgX7VroGZRQqTzT1GHPyc9JI+TkO+LLXJGpYHUuPVaXYohlLhY/GsKOVd/WAwQitOjby5r+BUsedXLaNZCqtEhyTPbWxdTSvrzcC1SHLaq96mTTosoAN6KlKCC3eIrdvNWZISINwI2A3vRrkodTRMHwopexpKlBqR+02yiNy6+xDXPSXmERRp/D9pL3VE2cIhT2D80UQk2n181X6EkAOGX1DHyEgF1M9xbH8FnglXuFxCOQIeznEeNuJ3GUYi+DVmaNEuHHg+fkQpgKwzmd4y8wqM/jBWY630A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq1sWCtUgnn9/9gxwsB8yafqsR0h5yt6x0i2JsWwai0=;
 b=e8BD3yx0waZS3UmOYMv3nt/7mXjlLtu7GGgLY+uf/jg04v2MENUNFx2QlHIzqYC2kKMC78/SYTleRcwGBAePpn0y5ILbOuyamPq7aIk7TSdFTS+4JYc0kNz1GUJvdMyrJTmzUihLx3kCP57INeEl9ElQRlDYDBOLr5Wo2kldZZEomXkOJAUC21HDdXvJZDZQV43S5bCjgwWx/2NnMaMbbM6B3/32eeeC+Dhg/9zsYH7g05pFuP9NOmXxVICFO1vwwSsazQhhDG5q58WbEufR5/s5o9ex+JOpOOCHqrIpApougmfDqXOYw/+5POAtB0kOwiyV8xftIGfs/lYPQs8oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq1sWCtUgnn9/9gxwsB8yafqsR0h5yt6x0i2JsWwai0=;
 b=UomxxBKqy+goIpf9lGRdElC7SiakhgE6Le3pmWzDWagDNXX075rtYMmir10+JjlPWPW6rVQNhOTmNlQpY4V6z988J1Q+Qhdrfk9Wbl1nKC/NyVPkNU8BcXmhSR8vh1UY61iS1B7uCYHOk/xZ4xFfbZIndMJhehErxHHx1/HKXNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB7364.eurprd08.prod.outlook.com
 (2603:10a6:150:23::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 12:08:53 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 12:08:52 +0000
Date: Wed, 8 Jan 2025 12:08:50 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Message-ID: <Z35q0vMEvt7yYHBx@e129823.arm.com>
References: <20241223185328.1339616-1-yeoreum.yun@arm.com>
 <065330b5-992e-47ae-9c49-e496d03c20de@arm.com>
 <Z30ltrwxpbVjIaVF@e129823.arm.com>
 <e236f2d3-a9cb-412e-af3f-6ae46851869d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e236f2d3-a9cb-412e-af3f-6ae46851869d@arm.com>
X-ClientProxiedBy: ZR0P278CA0062.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV1PR08MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a074e95-24c8-4bdc-2ede-08dd2fdd3797
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N0XXq+UpXw52pR2ei9Ua2IVhHQ6ldCYgeyvyBANaWrF3akWw4EspbhRT0mgr?=
 =?us-ascii?Q?h4sAXENjBcqQ17CUdBvUDiC8gwkfIf4wupwmKeGhHChf0P1MuhuN2j+/V/+m?=
 =?us-ascii?Q?8TRLbVnYWKvyN5hFBHteH9RRQtowdLxQvNjnqIH9WRLpskqOuBbnsZFG4SvL?=
 =?us-ascii?Q?Q1nN32Qht7xV23IwlY+cVm6shbQ1E4Y9A+XuLXurDaejT0PiU1D3nChnJUTd?=
 =?us-ascii?Q?4ZFAq1F1fAqi1EQWi5+G5Qn9jcnmyrFmKZjLYAvU397Ru5ww1PpMpfZHJ3PK?=
 =?us-ascii?Q?zCbpuh32v1EuUibzMG+xHXnK5Qoe7FKbFwGPr7CHPPmfP8jyYj0JuSUDFuRp?=
 =?us-ascii?Q?BucH0JTeYfSRQrp57Xw8DcydvLJj9ZFoVKTnyizaleIYcPFhW/DnWMcu6XOr?=
 =?us-ascii?Q?ScSRjkiTFRuB01OA5KVlQh/VYElPGZwaif4FoSIBctOiHPE5GAKbN74iDkpU?=
 =?us-ascii?Q?kSWn7zAFeV5Go3mGT8hbjA6NFU147Jm8oa85TdTbe1TD7RVbF+3SavRe0tvM?=
 =?us-ascii?Q?kjoRTPzrfX+64E5REuDEqb57xLME3qgvL/7Cv+jGxTR0noLg6yqc2EaSX+Ky?=
 =?us-ascii?Q?/IdwFFZpYn/euhckId4NAVLFSLEb++4DnNgHYXQB9RNcwNrFOeavwxZrP76m?=
 =?us-ascii?Q?OhJYwmp/uG3USLFfCBYNvD8ISageiMRjOEBBGwiWsD7s+4j0hLeuEa6ABINk?=
 =?us-ascii?Q?LPWgyp/OpjL/MgMVc8QdepDhfDEj+v27xEheOPShpAo4z6XA1zS8QHw5sNiF?=
 =?us-ascii?Q?CyHjNybIiZWdlnh5OLXlx3Av7C3ycHda8ZKjvxjgsOYbUmyYYx8yfFuzGDIg?=
 =?us-ascii?Q?eAbuFlQnfaCyuLjsvECIhBTRop7X388G05hTAmaPTsWnAOi9dkzhToKhR56x?=
 =?us-ascii?Q?ml1UC3jZACg06nHQDDnQ7xP4LkCjyItNeC1UZIS0BsemIqMuvd7rgK3oMKJh?=
 =?us-ascii?Q?JxeohQlcK55Ie94N57+yKOKDvmD2uSRYcGiGobgWcMP3A+kXR69EnEkuDeXI?=
 =?us-ascii?Q?u3g6ddjg7lCQlpu/Diyykw7VY/QXck/4Wplu99v0X6Ec2O1MxaQklJIYAdSv?=
 =?us-ascii?Q?v9ITvC2zAOF2fejvCa6h73BZZaEpKkuP2viFAOth3excEyi1sX0YKPmoufoE?=
 =?us-ascii?Q?mhrwd7ejtjGB1kIG8rP/y5t65GoY/3kYR61bgA0dZn1tmTCzFi4CYi9euiBW?=
 =?us-ascii?Q?gDfdo0PuEeClxANT7USDDkZoPAP7+TE2XMAGOfSBnWSUUZLHnlzcNMl0T00D?=
 =?us-ascii?Q?qcxyHvAyoT5L4+Pv3rhdiRY+5R6q8gDv3VxK8LFXgiVLvBkolJjsRJTi7q+l?=
 =?us-ascii?Q?/fwnGvbqdayeybVGR+XobAnlIva/jhLN8VDJ/YbYXcZtxdlATda3vz96Hm0W?=
 =?us-ascii?Q?qXtUE2ChBMZD1htUyDHVUKhp9oKv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QwPXrqW7qYW0LqUSEQAZf/8uw5LaJAAu37Oa1R1zcYr4VxL8HrHDEpx3ELFi?=
 =?us-ascii?Q?TJu5MitT7x92HWcU1TG7TKPwwRUAvke3kCK3HasdIYKha5N2o1SBPz9sWwe9?=
 =?us-ascii?Q?lwQReuYcsvYGcIq+Ttgn6amb3GTufye01hpp2JMZ0NuZl+Pq+SSKKFwC11tG?=
 =?us-ascii?Q?LNIrZ6npEKpKpaLCFk/scTPeojInadnE0lANdf1XEJl8KxKApZc/G06lElLo?=
 =?us-ascii?Q?LiWDcz41x3pFdnvelJ/oNRhwlcFXz7feId1HYZPsa6c353PClasGcjBcKKuy?=
 =?us-ascii?Q?194GCMKZp/NErAHMH4W+qKvFWBL7RSqurAmAS6XEghxjQvayRw8PxLBK1Zt7?=
 =?us-ascii?Q?pROhJT2zLJeuBeYY66R2BzccQj8XRXXQ7AOoUpeNutyCnZbJPIKM8RKCRsYG?=
 =?us-ascii?Q?Jo86oe98pNq9NLeR17KCZgEgn8myQSdZZAWoBWqQuZCubIdJ3v11MmDUSOKv?=
 =?us-ascii?Q?qrlSOfKnMMqKuPgjPBdT6QMzcq3Z4nR7N5D6TTXuem/Mb0m5TJkFmIu6g4TT?=
 =?us-ascii?Q?RNSIN/fxEl27G/OL0XyvZwXXBKtnRxYBtgmHKvDWb+h1xi/0K4695/EPfUjp?=
 =?us-ascii?Q?IV5A+fWytSLkvOfU1TkhTSARjqaU7wGcfaBPPrDbAqBcoMZ9KxUFAsc4LyZs?=
 =?us-ascii?Q?5AfeuxY9fjK03XKTqLbFee3R8v9EAvhY8v5GJDIqTP6ELjzHGchJFOn+AzYR?=
 =?us-ascii?Q?LT6FhZpxfoA5jZPvGA8fbmv0n4FwiC6rw2WeC/tU2Q65R8KTG6aNxsChepQq?=
 =?us-ascii?Q?2PzCTJqmWqPj+e6QCE28WofAjcAUo5vF0363lLXVG9rZ4WBbldE4DkvGnLBA?=
 =?us-ascii?Q?bVg1KkM96RqxFdwIZKd49k7yP8cTd99trDYpBE1jTFYfLA5eByOzxyORFWeT?=
 =?us-ascii?Q?9y7JLyk8dEQuTpD5XUx4eNkpLd+Z0g3uJ+8gjKY7W+/ZgNfobWT0lGy4MuUu?=
 =?us-ascii?Q?Ab4qIp3ZbtDw5lHox/H5cdoUStIOmjcHKvKlwkPy1Y1E6U36TfUb297TAFp2?=
 =?us-ascii?Q?LbKSCenhQwy5w6EdM1ndqR9Q8a8EZOnjXMqMS7LRvo1yLqQA6lKsb/crKQ/T?=
 =?us-ascii?Q?UTflFQ+WeAdPT9FwK/eG9wT3y+Vw9ASiZ/rcKG0i9f7Q2ppWKracgU/IjovY?=
 =?us-ascii?Q?DJcnsLpe4GJU5tp6plxOBXMPwyVxemNFfn1csWwwD0GObTRfAp8tZj3fx3fT?=
 =?us-ascii?Q?Og/BYJIzCIakIG1a+czKPHJ9glcN3H01Kk0irQiZlqpK+4yU1sdXJGDI1fBE?=
 =?us-ascii?Q?m1CqKuguKKWt9tSBTWuJFLdV8pBgBdSDo6KTz/D/pBGT60kpq2rpF6ksJkw4?=
 =?us-ascii?Q?boIVf2BtLNIy1GuHk30jJ5fEHOdHNF3eJj+pwFU4D9lfDwtJsujKAxUyof0w?=
 =?us-ascii?Q?wOqW6PavmSwfm1rY3oNH75EAxAivM1lT/sRWFUiw7jfKEBka7cMujQXeLq9F?=
 =?us-ascii?Q?czzxdC1/mUDNWAEdqkrSztDa0C6paSV0DfwxhDpbpZi6K5exxuUn6IPq6VQA?=
 =?us-ascii?Q?bCEffEBOWqedK+IttKzDmmyTdTk11DJqBurFha93TsqLq7hTPbDGmK9s/fA8?=
 =?us-ascii?Q?2v7LQIP8XTUhLPeudJtXDYP2PxArUVlDr1VTUTgT?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a074e95-24c8-4bdc-2ede-08dd2fdd3797
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 12:08:52.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiQgair15lqEEgAtPwE+dHTH1ZyIdeprf8cC3f7TZwMMw0kGjqzay4MBtDiXov3RkgV0wtw7+DWPs/9BKiWUkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_040902_095565_56E6F9C3 
X-CRM114-Status: GOOD (  47.21  )
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

Hi Suzuki,

> On 07/01/2025 13:01, Yeoreum Yun wrote:
> > Hi Suzuki,
> >
> > > Hi Levi
> > >
> > > On 23/12/2024 18:53, Yeoreum Yun wrote:
> > > > While enable active config via cscfg_csdev_enable_active_config(),
> > > > active config could be deactivated via configfs' sysfs interface.
> > > > This could make UAF issue in below scenario:
> > > >
> > > > CPU0                                          CPU1
> > > > (sysfs enable)                                load module
> > > >                                                 cscfg_load_config_sets()
> > > >                                                 activate config. // sysfs
> > > >                                                 (sys_active_cnt == 1)
> > > > ...
> > > > cscfg_csdev_enable_active_config()
> > > >     lock(csdev->cscfg_csdev_lock)
> > > >     // here load config activate by CPU1
> > > >     unlock(csdev->cscfg_csdev_lock)
> > > >
> > > >                                                 deactivate config // sysfs
> > > >                                                 (sys_activec_cnt == 0)
> > > >                                                 cscfg_unload_config_sets()
> > > >                                                 unload module
> > > >
> > > >     // access to config_desc which freed
> > > >     // while unloading module.
> > > >     cfs_csdev_enable_config
> > > >
> > > > To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
> > > > deactivate while there is enabled configuration.
> > >
> > > Thanks for the finding the problem and the detailed description + patch. I
> > > have some concerns on the fix, please find it below.
> > >
> > > >
> > >
> > >
> > > So we have 3 atomic counters now !
> > > cscfg_mgr->sys_active_cnt  // Global count
> > > config->active_cnt	   // Per config count,
> > >
> > > And another one which this one introduces.
> > >
> > > cscfg_mgr->sys_enable_cnt  // ?
> > >
> > >
> > > And config->active_cnt is always ever 0 or 1. i.e., it is not really a
> > > reference counter at the moment but it indicates whether it is active or
> > > not. Could  we not use that for tracking the references on the specific
> > > config ?
> > >
> > > i.e., every time we "enable_active_config" atomic_inc(config->active_cnt)
> > >
> > > and disable_active_config() always decrements the config. These could be
> > > wrapped in cscfg_get() cscfg_put() which would, inc/dec the refcounts
> > > and also drop the "module" reference when the active_cnt == 0
> >
> > This action is done via _cscfg_activate_config() already but its
> > activation is done via "sysfs".
> > and the checking active_cnt, I think it would increase lots of complex.
>
> I don't understand. We have this today :
>
> cscfg_config_desc which is getting de-activated. This has reference to
> the module (owner). If someone is using this config_desc in running session
> (be it perf or sysfg), it must be refcounted. As such I don't
> see that the cscfg is refcounted anywhere. (The active_cnt indicates if this
> has been activated, but not used in a session). If we have a refcount on the
> "cscfg_config_desc" for each active session, we could
> prevent/delay unloading the module until the last one drops.
>
>
>
>
> Something like this is what I was checking ?

Thanks for your  code. I understand what you mean now.
But I think below code would need to add together:

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 11138a9762b0..fe1adcf45f06 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
 static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
 {
        struct cscfg_config_csdev *config_csdev, *tmp;
+       unsigned long flags;

        if (list_empty(&csdev->config_csdev_list))
                return;

+       spin_lock_irqsave(&csdev->cscfg_csdv_lock, flags);
        list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
                if (config_csdev->config_desc->load_owner == load_owner)
                        list_del(&config_csdev->node);
        }
+       spin_unlock_irqrestore(&csdev->cscfg_csdv_lock, flags);
 }

Otherwise, If atomic_inc_not_zero(&config_desc->active_cnt) failed
and cscfg_remove_owned_csdev_configs() is called as part of unloading module
before list_next_entry(), it could see LIST_POISON1.

Do you mind to send patch again with your suggestion including above
patch too?

Thanks.

>
>
> coresight: cscfg: Hold refcount on the config for active
>  sessions
>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../hwtracing/coresight/coresight-config.h    |  2 +-
>  .../hwtracing/coresight/coresight-syscfg.c    | 24 +++++++++++++------
>  2 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-config.h
> b/drivers/hwtracing/coresight/coresight-config.h
> index 6ba013975741..84cdde6f0e4d 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
>   * @feats_csdev:references to the device features to enable.
>   */
>  struct cscfg_config_csdev {
> -	const struct cscfg_config_desc *config_desc;
> +	struct cscfg_config_desc *config_desc;
>  	struct coresight_device *csdev;
>  	bool enabled;
>  	struct list_head node;
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c
> b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 11138a9762b0..53baeaaf907f 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -914,15 +914,20 @@ static int _cscfg_activate_config(unsigned long
> cfg_hash)
>  	return err;
>  }
>
> +static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
> +{
> +	if (!atomic_dec_return(&config_desc->active_cnt))
> +		cscfg_owner_put(config_desc->load_owner);
> +}
> +
>  static void _cscfg_deactivate_config(unsigned long cfg_hash)
>  {
>  	struct cscfg_config_desc *config_desc;
>
>  	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
>  		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> -			atomic_dec(&config_desc->active_cnt);
>  			atomic_dec(&cscfg_mgr->sys_active_cnt);
> -			cscfg_owner_put(config_desc->load_owner);
> +			cscfg_config_desc_put(config_desc);
>  			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
>  			break;
>  		}
> @@ -1047,7 +1052,7 @@ int cscfg_csdev_enable_active_config(struct
> coresight_device *csdev,
>  				     unsigned long cfg_hash, int preset)
>  {
>  	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> -	const struct cscfg_config_desc *config_desc;
> +	struct cscfg_config_desc *config_desc;
>  	unsigned long flags;
>  	int err = 0;
>
> @@ -1062,8 +1067,8 @@ int cscfg_csdev_enable_active_config(struct
> coresight_device *csdev,
>  	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>  	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
>  		config_desc = config_csdev_item->config_desc;
> -		if ((atomic_read(&config_desc->active_cnt)) &&
> -		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> +		if ((unsigned long)config_desc->event_ea->var == cfg_hash &&
> +		    atomic_inc_not_zero(&config_desc->active_cnt)) {
>  			config_csdev_active = config_csdev_item;
>  			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
>  			break;
> @@ -1091,12 +1096,15 @@ int cscfg_csdev_enable_active_config(struct
> coresight_device *csdev,
>  			 * Set enabled if OK, err if not.
>  			 */
>  			spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> -			if (csdev->active_cscfg_ctxt)
> +			if (csdev->active_cscfg_ctxt == config_csdev_active)
>  				config_csdev_active->enabled = true;
>  			else
>  				err = -EBUSY;
>  			spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  		}
> +		if (err)
> +			cscfg_config_desc_put(config_desc);
> +
>  	}
>  	return err;
>  }
> @@ -1136,8 +1144,10 @@ void cscfg_csdev_disable_active_config(struct
> coresight_device *csdev)
>  	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>  	/* true if there was an enabled active config */
> -	if (config_csdev)
> +	if (config_csdev) {
>  		cscfg_csdev_disable_config(config_csdev);
> +		cscfg_config_desc_put(config_csdev->config_desc);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
>
> --
>
>
>
>
>
>
>
> > because, if so, it should iterate all config in each csdev.
> > So, I believe it is the reason why the activation and module_cnt get via "sysfs"
> > to prevent iterating every config in csdev when config unload.
> >
> > although, active_cnt in each config added to list in csdev be 0 or 1,
> > the module could be >= 1 (by sum of active_cnt which have the same
> > module owner). So I'm skeptical to use active_cnt like "reference cnt"
> > and That's why I decide to use "sys_enable_cnt"
> > >
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > ---
> > > > from v1 to v2:
> > > >       - modify commit message.
> > > > ---
> > > >    .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
> > > >    drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
> > > >    drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
> > > >    3 files changed, 21 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > index 86893115df17..6218ef40acbc 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > > >    	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > > >
> > > >    	raw_spin_unlock(&drvdata->spinlock);
> > > > +
> > > > +	cscfg_csdev_disable_active_config(csdev);
> > >
> > > This looks like a separate "fix" from what you are trying to address. Please
> > > could split this ?
> >
> > I don't think so, because without this calling, the "sys_enable_cnt"
> > never down, It makes error.
>
> My point is, we need to "disable_active_config" irrespective of this race,
> in the sysfs path. So this should be a fix apart from fixing the race.
>
> Suzuki
>
>
>
> >
> > > Also, would like to hear what Mike has to say about this change.
> >
> > IIRC, I followed his suggestion.
> >
> > Thanks!
> >
>

