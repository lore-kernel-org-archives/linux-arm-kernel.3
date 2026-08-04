Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E708C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QT+k7pp+Wz2QAJGVnLyVEomFbV5EW+H7sDIR5+cNg8E=; b=ER0T8wVq3bYCs3kn15V5ExawCz
	AjDmAHwUZGMxqkjjHzkF3eF7gB/HmPVMLLckUzlgMxczRioLjX2G0dR99YqdD0WgBJ2iV6aHkUMZ2
	CSWAOFMPlgBaiwFb7DbWWaMou4KepTXB9OwPo8Y+6vz7AVWCaqYrPuSnGDqmex0g9sV3bAMoR+NLv
	tD3/n2sDRcY8JUK1YsSfGi3tw2yur8Mw7LeVT5cK7+p/E+KcftxR7x9YrcrKk9VFsaBkQG+ciggA+
	Gq83prOdB5+ueok6WYOv3tWGmwML+0P/XgKnJEQmun/XO4oxDHSqduTMcC2DpEOIN4ClxxSAU2f+W
	HnTcCYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHrY-00000002IOO-0zIN;
	Tue, 04 Aug 2026 16:19:32 +0000
Received: from mail-southcentralusazon11013035.outbound.protection.outlook.com ([40.93.196.35] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHrV-00000002IMi-0ko3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPWjXwzLjWXCD5kYUYbTe7dvutfR7f/LMTmvHdk+7o6m2axIeDdMdPtu0H4TiSffoyl1+3o7PX4z1NeQhYx2iPgdwlW0MtpTui4z3bbS7I+cBGvRRAUxphzgup1nJDgRV8w2i8kSeWEbY8vM/o/TG9B8Wlns2OvpCv1ZKZ5FKoX2+UTH/t9QcNQQ+4Gr8mOevQTwRO4NLeuUi8/Zei2+s965NrrzYMehzfL9Ev1frupnheJqCe+aeqwY6M17aO0H8BF3VInJdvhzOqED/NejQgAlpoF9JMOKj3e6LA5Ezl10Rb1qQxMH0OESFgtX47bIJdLw8y7/7TD8cAlDBw5DBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QT+k7pp+Wz2QAJGVnLyVEomFbV5EW+H7sDIR5+cNg8E=;
 b=JKPCYt1peANf66/jMBaIzX5WUC3WShAk0CUvR8uizk1rF5adMTr1qxqhFSRQLVjNimqOMtd8NqdgwmPxzZ9vc+ibkh/ukYYxL92x9/fvyH7GJjkOkvnuJMl1l9/KM38sP9gXcplCu3Xo+J/GKW5nFW55/TvGarS0Vit/CxUT1+tylXzWH+luNe8QdpUkblPhCOXWMe+AyT+YsmLCbhamzj8GrPDvt9Uq39kIS4yOffoBIkMk8yFdEbVaBJEBa4fh4kYJV02eZ7EZPakenrBzqRJqKzMLMKy1MnvKpckfy8mCTA1fN3fEAVXAUjWPP/lxJ/oNf3iDvH13YJS4JCYvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QT+k7pp+Wz2QAJGVnLyVEomFbV5EW+H7sDIR5+cNg8E=;
 b=OV+cyEuZpWUQTkgPtKsA79k5l9hidTh4I0D62nsLrj5KJ84eKCja5arppJ3XtLtdISKlY+r7oV2ui8qNq6es3ytYjjlYSzSLhPtyuQpKB+Y13DBOZGXX0dOdpcHOjoKGIkMTC6mt1uiQWlzJKiqG9Y8iL87KPBnCmhC9cmD8weSQUKmX+PhpVlE1rn2cteFTuAbeLFFvF3iFUFDC3HzG7KRllVCLfBKHnroxBP4B8hk8aFzAysno+dSZmqQSi3tAbNEkrLcGO1+4PJTRBjAtTBbgp4f4ZKBBzK4T212Evrvqvwio+5CY0mjY5h0a20hZa/rr+/vO/tzVp7IIf41Bvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:19:19 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 16:19:19 +0000
Date: Tue, 4 Aug 2026 13:19:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Pranjal Shrivastava <praan@google.com>,
	Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <20260804161918.GG27883@nvidia.com>
References: <20260706084708.8072-1-kas@kernel.org>
 <amiBagGKn-Aym1DK@willie-the-truck>
 <amiz6GQZ-XGlH706@thinkstation>
 <anHxBh-xGW9JXsa4@willie-the-truck>
 <20260804141704.GB27883@nvidia.com>
 <anINkO1l9Kz8lTVh@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anINkO1l9Kz8lTVh@nvidia.com>
X-ClientProxiedBy: BN1PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:408:e1::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dd5281-6b18-4f5f-1727-08def24422ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10067099003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FlTN1x9HbmhD7FRXXkvWCE5pnhvll/eGiSB+tSPnwIvGjtIj68tx2ijL8W2+caM3nkBomOP3eQ4BqCh8UxAJTLvbxIlhudf9hcLZ98zRKPLE1HgU9B/7ZFO6OluL8+yka/hma9wI3CpLfOmFDdDfLIkJ2MxgR9jBPsk+iZpCSa+cBaaVI7PdNoP2U8K0bCZGZqqOFjgGYXuCZW6efVfnyBMu5QSSZPAV/3l+wkcK34AT1dECWZllrBMIjAY9GMDtaewSR1InY5A9PQmlbwdLfSRUk/4tzryTFroln8H4LnBpIdjNwGdSp0aRzWf/FmXsEXnXAlvier6eLziueX90br0yJ9KUpEgNOHlynp0A0OTvnM7VOmHOhJA5bBUmTdQ1SnGgsnHdJLMlzu7IHhh8+WPpeags3f2iE+E3xbj8rvNCnUULX5Uvh5clvWDhHTc+pMxTBxKV8E9DA/BMYl/MBD1OHmU5yHgZUOx6qbYhCibQpqIyw+OL4tiG2DFSxqz9bhLfhGQ2Dbx4CbboY81PfHs5dQE8+YDds/u4nK+NJRRURx5tLl72YdaUSY0ofQfMlQz9CwhEpDKtaWeEXx6gVJhlByfMF6n9Q1HVUCGqcnKA6pH6Es5rOSl27fGSxOQd68VftaG8X94IVn/L+burOj7MFDRTG8mvsqcAlcMb3W4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tw9uos8as1A3bmmEJN/hwGnVgUpuT2jDPt8ilJYQT3/PoIXDC5NcxoTO+f8R?=
 =?us-ascii?Q?avVjeBKXE1ebDdEcbmclfGLBP/tN/nv68fO33YsxlkDvQinTzsTE3RDAN9t8?=
 =?us-ascii?Q?Y7Tpm35a1gNN3Fx8F+7En/2KUSpZGPnw2CHC2iCWNu8opzapf6oBUXCjkJko?=
 =?us-ascii?Q?ARya8EkLWNjof0lmN0iWPh7i3YTkMpliiXcqI0EIspuMJ0nxQJLk9QWk7t2v?=
 =?us-ascii?Q?VoMIDXSS8wMC8Qr6qSnxXqhTpLZ0f6+y/B44WjnNIhtyC+x5SACgYRcScJ+e?=
 =?us-ascii?Q?tfwstCbjlrbz+zteuOhUXusWpDIs8L5J2W/uHLe41SqAQvh2f5H3sEOjI7S4?=
 =?us-ascii?Q?aWxD02abGjR8S7lh/JEORvp5/CUOp8/ty9fevu6vb8CkryqOYjcP2QCG/ZqT?=
 =?us-ascii?Q?4yp0+yxEz5EMWs/I794E3Y0qYqy5iWY53gz5bm5fK5JwjWkQY0EtsaYtV0CH?=
 =?us-ascii?Q?JqwvJzsxDMFGEKPvbFhLtEnp5Va1WSk411L6EefIxWejxnKkzVh/f8vmeR/I?=
 =?us-ascii?Q?sSBZ0QPcKRf5ex1/yyCjH6cjeP/KofbZt0bcRbPe4cfxcxvoM8SSTD4l49xH?=
 =?us-ascii?Q?tn5pBCo9akrtvWwadPGv2jBABTmpJNPduVcEzw/HlSBz0P8X+KXQvvhOY31C?=
 =?us-ascii?Q?miXYezY9C8oB1x50M4t9Dx4UxZf4+D1IWnjl0DE9Ws8wlWMmhMFpFwqbaxq7?=
 =?us-ascii?Q?WKZx99ShGaXCO0ERrWj2S6j0MdGqh/sG6FdCU3WFXbn12cqnCDpCtUM246Xk?=
 =?us-ascii?Q?VLB5w6Lp79qXW/cTdnwMZQon+dd7bxLOO/38UPmuX6EeAgvnhPl10c5cr8Uh?=
 =?us-ascii?Q?P3dTEjFNQzr13FHy6dV9uajZbSm+4XDDTTHc8dx4ksnBsepCb3tP+qAMB2I3?=
 =?us-ascii?Q?z4BL0M/y2mNyAhuV/o/XWWhDE9moRcj30YkDDZaxLRtKRpI6Wr6jCsO188NT?=
 =?us-ascii?Q?pZiDMv4Jd2ZmUuQUNa4L23fQYaPfzRQQgLX4dRnyWWwr5c6/IMWSW4i9H13s?=
 =?us-ascii?Q?xl9Srz/FS9kCF1T+TpuoOHnQYdkg37xCzkG4TfcQneArw4OGlx9c16VQDJkF?=
 =?us-ascii?Q?esOMV/B/gh4P8N1ak3yq7EnQh4c7jTIwUprNoIBcUGM9hsRGCVQ+2F5GENvA?=
 =?us-ascii?Q?ciiT4ZNpAs8eKY5IGc2DAKkFsQcZcjRZt1fkaMqOCGcypjk2M/mrbGHO5XxE?=
 =?us-ascii?Q?pop4RbyDxpj7H9MNEmmw2Q90iR0QYF+m6TqhPUPBK4XIg9bsObuDRFfk5wHB?=
 =?us-ascii?Q?bqVOG35kZEgYQ4dfzSdBp57BgQhqKB8QNEFZljuIm6onNUYVntcPFcw747Vw?=
 =?us-ascii?Q?qs1o2jHcaYUqZEqImDzwxlPxg6g81QtT2WsEH2XrNNTnd3/9hcNACp1dP6Su?=
 =?us-ascii?Q?qKdaWCFW54yDA5h0AKgV+YZZimXXMVBucFfS4HQNIDBeg46JLSj18j0tE1K8?=
 =?us-ascii?Q?fCJ0iUXz6csUWmlJb2+LBB+RFuhx7FFyef0DN2QgBBr5Fo/bY8TFh9vRdIms?=
 =?us-ascii?Q?dL0UkDHShUYqLnB7FWqP7s+GJP8ptelJp/pd24o75yAeEakMyOhopIAh0Lgw?=
 =?us-ascii?Q?qm9yh39DTZlNdIrcTK+lAppDcMtOteF1g9IOT9KBjxjmOcnei0ogVJ6o/+PG?=
 =?us-ascii?Q?9tfJJP+84tLdCgCAX6sAT9ZzHJMtS8PcjP+V1pAAmHKZ5WN46EoYgUwVsc7g?=
 =?us-ascii?Q?XcFyRFJgu38pNQ+t8nKMF7cTINOnsymmiasbTUV/mHD338LMlxC/XF/tf1lG?=
 =?us-ascii?Q?5KDsKyQfag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dd5281-6b18-4f5f-1727-08def24422ed
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:19:19.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UE0tp6272eAhCVnKGCC2St30770E+vmHzm0pLt/IDgmOiNla5gligVnWs9YEyz29
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_091929_218370_33FD4B69 
X-CRM114-Status: GOOD (  20.16  )
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

On Tue, Aug 04, 2026 at 09:04:32AM -0700, Nicolin Chen wrote:
> On Tue, Aug 04, 2026 at 11:17:04AM -0300, Jason Gunthorpe wrote:
> > On Tue, Aug 04, 2026 at 03:02:46PM +0100, Will Deacon wrote:
> > > > Would skipping their allocation when is_kdump_kernel() be acceptable on
> > > > its own, or would you rather see it done differently?
> > > 
> > > With Nicolin's patch, we can just avoid allocating the priq and the evtq
> > > entirely in the kdump case. We can then add a cmdline option to control
> > > the maximum size of the cmdq, which is useful regardless of kdump.
> > 
> > I would still prefer kdump do this re-sizing automatically, even if we
> > do add a commandline. It makes it easire to deploy than having to know
> > secret command lines :\
> > 
> > So functionally I still think this patch is fine, though yes it points
> > out more things in Nicolin's work too.
> 
> I will send a v10 of mine, to skip the EVTQ/PRIQ allocations.

I think Robin's point is to structure the v10 so you introduce a bunch
of tunables, including something like 0 size to disable a feature.

Then have kdump default those tunables to the right thing

Jason

