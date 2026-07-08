Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV+S9xbrpg55tfs/6yKumY2DEI7TONy2nI9VNXDefz0=; b=EGqsiO62XadIctEqT2iNS+agGX
	yoe3Xy8XJ//GnjiHh//9TV/kRS/dYnn4msm8aHYrEqG7y54JPvkUMT+vR2J76JQ0EoopuZI1jGJ92
	vV1US2Lxv8vliVTajCBiTeLUs7Kxlpl08BJID3mJJTqZftlK2V5WDIkRP0/I4rq3cvlmQjEgZ42Tg
	XIu1CaYpT+QzSW5g/+z7M2OpYsrL8JWtICre/ijdUXhuJN/CCeyGA6MFtaf/2Oe6DnBbJa93ScgME
	w0eTaZsCEB+iQbKG3SW3JLKz9kDb0DwAjn+zTodhEJ4a3xiKJOq9a6+1SHod1Iku49kKZNrevLRhr
	DzkDkicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVrG-000000004UD-2xOi;
	Wed, 08 Jul 2026 17:14:50 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVrD-000000004Sb-3G4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783530888; x=1815066888;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=M3M1GltE/J1Jn1JDibTVw1so+TgsZq82VLvqHFyopvU=;
  b=O/hd+osPjqixItuep1UMsXujz/mt2tiWIK2cPb/+rL/x1uQ2gP6GRSPw
   cjNICWH6AYfbNxYjwoTAJ6jHKy4nmCFUGIG6bGtxDIOvfUiG//wEZPtBZ
   hwxwCvQb9dqQp9WYM4YVEHDBaHuGpjtUu/Ea0RpuAontpLjbjpc6Q4t77
   QXowDCCnuZYVNzrNXg5vJTw5Pj7cIHzbu9HfxEclO4cF2biwJOyXzwDgx
   gNP68UEoUsIL0BU8O079ODnXjZ8nEMek2nZI278nDS/ymJFGhq6l5cSj1
   haKyLQmdrJCSVYFIQI8EwBlt6jUIPRkxjghqjy+NJ8Pwr37cfr7wtxlP/
   g==;
X-CSE-ConnectionGUID: vbmYecgyRZmBfE981RMrIA==
X-CSE-MsgGUID: Zczg2zxQT5GaL01KXrEVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94848809"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94848809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:14:45 -0700
X-CSE-ConnectionGUID: WpwKOYGdRD+JYp1cRATL9w==
X-CSE-MsgGUID: cGIHEY1LSYa94Fc1zZBkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253262600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:14:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 10:14:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 10:14:44 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 10:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfVyg0fAcZ2zHFLjO23sk0VJ2HROk7nEcNnAcl/jprJwTlJP1+POFAjJ19iUWVrMt7YLjEtYmm0A7/kS2iwRhLQund1V3F7W0FEKvAaFg1FxKPW8A3Sps8T1Xll6IqWxls0lXYYX//ggbx6PYMSGeBFxJe7mcfBsdWn26XfwIqu0g91/CnbsJM61aeQs4mcmFLaftxzXRjMbOX4ygHTa+KEWwAocbs9XImyqpMJ3eBS1ssRHVlWPzKgtw7eRYfFKexvG8AI83broXTA4gBretvJT8NZXNlbKEb6NSdTWfzRXixuCS2MSi9RDK59RFGV5sF6kO8Ui6X4GBfKeWxQc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV+S9xbrpg55tfs/6yKumY2DEI7TONy2nI9VNXDefz0=;
 b=L7o7VTTzEOaF1TsGdFSDLFFyXrRiV1R3LeCX5zHOJVBr9BW69ix/0QvEmRdpTFu1jhgm0/daV8/9e2egVdj7/xMst3fzB5e3W7eGEhHM+ocTfIxnC2seV71iRM6CThjChvsyxrtkuobHHRk4NLzmJKD21eP34aeUqReHKzoMeBqgeo2mUaZ/c3XBNwMcVwH/BQVYwB5Xmv5Qwz2spcILxWARc4ADLc39Pxkx9yMgFM0zq3F3dqr+mFrqrkFntXdwODOVVMwKkeuCeKUhzcPXtXY8P/uoCcxtYJBnQO9Y8FlGq0RorvjUlKgcfPnVWtUJm2NCys8its3+XU4VsKRiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 17:14:42 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 17:14:41 +0000
Date: Wed, 8 Jul 2026 10:14:37 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Junhao He <hejunhao3@h-partners.com>
CC: <rafael@kernel.org>, <guohanjun@huawei.com>, <mchehab@kernel.org>,
	<xueshuai@linux.alibaba.com>, <jarkko@kernel.org>, <yazen.ghannam@amd.com>,
	<jane.chu@oracle.com>, <lenb@kernel.org>, <linmiaohe@huawei.com>,
	<bp@alien8.de>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, <tanxiaofei@huawei.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <mawupeng1@huawei.com>
Subject: Re: [PATCH v2] ACPI: APEI: Handle repeated SEA error storms
Message-ID: <ak6FfacJrg8Elnl6@agluck-desk3>
References: <20260527082707.2013499-1-hejunhao3@h-partners.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527082707.2013499-1-hejunhao3@h-partners.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cfa30a-b9e2-4b7c-641b-08dedd1464fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|18002099003|22082099003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: VlOVoFs7nNzOMaSIfm4B04/Cwu6ZwyEpuaLmv+R/cMNpGOlmZBfmbvEYFUlDeaEsQVgdXrSikLpgLKrNWwQq3ChJ8el81QTkh3CMg4vTMxtTew1BDRfhLsXoARbyuEKZSveGuXsSg06Gkx6RmD+CWXLWmMnyjzwTEbWXmKCfQmmMHvdDeKm7H4ORT3Z7r8qgHv15SrFnamU5r/xMqAZTG+D+5dD1xRTJPHtugWNMdR4JpqycodPuJZ1rLPRV9rdUSpUEFH/56K7+TqgRDplgxRXpzCDlsS2gMzLn7c1RxsohITQPlJUcyMVRHTf68Snr3kiswRbK4i8iwFtfq6HM43u4VqwgXjBUCWnGo/+uubY6i5Ey/FqwLu/1kc4gGic8sI3IWsl842jtMgIvxgsFz1HCbhdmrx+rUQRat8k3aPt3PJP8J1t5Hh27BZg63IONF8gACrKAN3++HzF/iP2r2Q2RMHqOG2FHTe45SMTxLtuos2nUFDUWL8z0GjBLpyHiJraF8w+bUve6U39g9ZJWVmTuxKbggSlOaLlh/Lxf5/phHEf0YqCtTfdqVVA+LbqUEQv4YQl/DlH5zelhAIfE7Dcx9wxlBHw/O+6YPePOnwCXJFhz3pNCW9CLcBxTvpCArkuuwhhfK9PriT27KTZRp/m2x28r8GtyUpIKMX0ueVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v01RMKAw+s/qa93HYt2jipBQRb0BmciZilOwS6LGRJ95CYcYC1dx9yE5ieWR?=
 =?us-ascii?Q?jSqkRWCxm5h/bIKXR0a1/kQz9BV4x0rMPHWmyhNn4RdHcJcx2c+Fx+BJzAll?=
 =?us-ascii?Q?nBP6w2WNaa+TgjiPhzl9GD9j1bIDX8L5JTO9mi358+NimnTlXO6TfTUUtdbf?=
 =?us-ascii?Q?21WsGmhmLhz6D/5PA4E9sufJdYIvLwT/3AJh/h9kaCtg545cZtQPj8671msX?=
 =?us-ascii?Q?0BYJud5e0wGUonwvjRaO55+wl0MvDTXTPGhQECeI2TB95d18S6DBHQH37l32?=
 =?us-ascii?Q?ZpP/d5vxlxKYN3QT5dXNCjt8OttXcyYwXpc+UmfqNTvMXaUCV3rV6s1s3D7z?=
 =?us-ascii?Q?8C5eJd0bgaZArKaL1iETNYZkoVmua8MS94lJmshU0ouINFNzU0O1MHJ4/4h2?=
 =?us-ascii?Q?PomkJ7NwNOkvFrkTqx3KStG66OneeyxMj9GyyTQ+KNqtiZe3qWLY4vEYGnxA?=
 =?us-ascii?Q?wp93F2Eeh77dhW2QK3Pp1dQyALy6FkBR8appL2D7YgIMMJsltOfz8RrRXLy+?=
 =?us-ascii?Q?MVKpB0kEKOTyZ8Fw5XGHLwFuDAk5L3fvQooy+uUQJ8e6tVK/NyN5AxtoDUQg?=
 =?us-ascii?Q?tOg5L8BnLZ5eS7N+MWRkBPS8Xnpo3zk552um1fqGTOMNxgIsq7blYTcIYu9g?=
 =?us-ascii?Q?C2wBh9lHgTwcpBNcQh+4pKnjEWlFU0MbQ8wCPno+QRyRN3KXxNnz3ER3Wygk?=
 =?us-ascii?Q?XMBzi26eAe+ftcIVSM4omI/ap4VaxiTdGXBW9rihp+WhWw+VKTpmBDsyrlyj?=
 =?us-ascii?Q?hxE5vByigZFu5/89jUwnTkhnYpv3TkySMJTT2axFnDbea4+iHdX6lTr9s0Vr?=
 =?us-ascii?Q?1B2/vyDmhAuVyAKxCO9PJ9Dxsi/Kw0QNAoow0khZfQmuDelXHBXozBEPDEhj?=
 =?us-ascii?Q?80afOI4AeWqpV/EtB2TvQWuRAvPozRuPp1iz7XFESSOQBegsc8kVlJRlwB26?=
 =?us-ascii?Q?51L5oGYmSoGKBg5vhByLidOLK/VGD+JJGToAaIEDMNmzPW/psiRZuEPsplKI?=
 =?us-ascii?Q?vtl0NNBMJYm8xQmf+oMaNjYDP/Xi/qakoZm3P/dL4kNBHgSw3OhIqAaf0DdD?=
 =?us-ascii?Q?sKhVh+xphAwBwX410g7mQS54dC5m2HD5ZZc+VXE6M9aTytdAnoLXv9xv/fXW?=
 =?us-ascii?Q?NkPAECtPcOE+U2l2xdBcwPubj0YYEluqJD2busaoh9RCBpTfYVsdyeIYDeEu?=
 =?us-ascii?Q?VFYgC9sLI6yrGI4PIMPNTjYTioBJVKX7JgO9NX6aRLBrNqo+a/CZGTCM8S+J?=
 =?us-ascii?Q?7+lGnPbpOO0z3d+NKsGc9s1JhQb93vxZQMP/BwMc0ZIUwTsXmfJI/WiTtdUb?=
 =?us-ascii?Q?edfxB32VLIWbopLmIdiV8X7xM/eKGql7g5St+uhL5mMLoGyNirHnGX23vC3k?=
 =?us-ascii?Q?o5Y40eV27KQEE7ocfSve3SCyUVRAm0mZ4a9ZkvjAzopq18iRV8ZtAxiUFbEs?=
 =?us-ascii?Q?Y2VV2VlGd6zd87lNDroz6xPgLHFtId9Lc4HQdpIIOE5BNXKh46PTqnYzmQz8?=
 =?us-ascii?Q?FsGLNFYWcfN3+ADMLDC6ukb2+CIDBrIdmcA3SvzyvP053ufzCIF4KWsseq7D?=
 =?us-ascii?Q?5jzWEfdYEzO8K1/A6pKUOfpDj5psr2kMvEnVUr7hkOAh69aJyT5ig3UwPbiF?=
 =?us-ascii?Q?6pGUjT5QGJzvilzTZSUygP8TWBxyYbfzbazor8inwXtr3zaP2eVau8JNS4R+?=
 =?us-ascii?Q?XFHFb2wCJKUzj0/PmYmfaoZH+QGggfHNaDNaUABxIViZScheZ8RmpBlFk7wM?=
 =?us-ascii?Q?ulaQK8OAaw=3D=3D?=
X-Exchange-RoutingPolicyChecked: iiQ5ft95QGRKR/sH1cNuHNc9hCwpa/c+RFH1NL3sJsxAtn5S4m9I/u1XPV2POAkTpBcDjIDFD3lAvPL2z2GlfgsRi6Su7YLM/BVKrZRbEWidMJvNUtq/WaRfREAYWKap2iUGa0RJWgxIxhTcpWhSn2cpFVa97ZvSmslhLkEezUia0HyV4gPYd4yLHR414HSohrTojcvFDobIN/RLvmayQhevwYXj85sctfJ1uIO71o0D7fOuFPgh3Nx6ey7XacNQycnR8q9QvRWKTcuOWllLQ+21RL9KaCHs+lL62cnq2F+UEns/dQL1+tMrf+lKo26+PTN1QuPHUGokR0FRvcRkZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cfa30a-b9e2-4b7c-641b-08dedd1464fa
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:14:40.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bhSKAgHpgdQqT6ardMVRse1I8Bqlut2S/kAFh3GDn/to3iyCjeIkWjntKgZW/QUzzP2BSpQOoeFGdu3VOn2WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_101447_838263_C967A040 
X-CRM114-Status: GOOD (  36.04  )
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

On Wed, May 27, 2026 at 04:27:07PM +0800, Junhao He wrote:
> When hardware memory corruption occurs and a user process accesses the
> corrupted page, the CPU triggers a Synchronous External Abort (SEA).
> The kernel invokes do_sea() to handle the exception, which calls
> memory_failure() to handle the faulty page.
> 
> Scenario 1: Memory Error Interrupt First, then SEA
> The page is already poisoned by the memory error interrupt path. The
> subsequent SEA handler sends a SIGBUS to the task, which accesses the
> poisoned page. This flow is correct.
> 
> Scenario 2: SEA first, then memory error interrupt (problematic scenario)
> If a user task directly accesses corrupted memory through a PFNMAP-style
> mapping (e.g., devmem), the page may still be in the free-buddy state when
> SEA is handled. In this case, memory_failure() will poison the page without
> invoking kill_accessing_process(), and then takes the free-buddy recovery
> path.
> 
> After the CPU returns to the task context, the task re-enters the SEA
> handler due to the same access. However, ghes_estatus_cached() suppresses
> all subsequent entries during the 10-second window, preventing
> ghes_do_proc() from being called. This suppression blocks the
> MF_ACTION_REQUIRED-based SIGBUS delivery, causing the kernel to fail to
> kill the task immediately. Consequently, the process keeps re-entering
> the SEA handler, leading to an SEA storm. Later, the memory error
> interrupt path also cannot kill the task, leaving the system stuck in
> this repeated loop.
> 
> The following error logs are explained using the devmem process:
>   NOTICE:  SEA Handle
>   [Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>   [Hardware Error]: event severity: recoverable
>   [Hardware Error]:   section_type: ARM processor error
>   [Hardware Error]:    physical fault address: 0x0000001000093c00
>   [T54990] Memory failure: 0x1000093: recovery action for free buddy page: Recovered
>   [ T9955] EDAC MC0: 1 UE Multi-bit ECC on unknown memory
>            (page:0x1000093 offset:0xc00 grain:1 - APEI location: ...)
>   NOTICE:  SEA Handle
>   NOTICE:  SEA Handle
>   ...
>   ...        ---> SEA storm
>   ...
>   NOTICE:  SEA Handle
>   [ T9955] Memory failure: 0x1000093: already hardware poisoned
>   ghes_print_estatus: 1 callbacks suppressed
>   [Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>   [Hardware Error]: event severity: recoverable
>   [Hardware Error]:   section_type: ARM processor error
>   [Hardware Error]:    physical fault address: 0x0000001000093c00
>   [T54990] Memory failure: 0x1000093: already hardware poisoned
>   [T54990] 0x1000093: Sending SIGBUS to devmem:54990 due to hardware memory corruption
> 
> To resolve this, return an error when encountering the same SEA again.
> The subsequent SEA handler invocation uses arm64_notify_die() to send a
> SIGBUS signal to the task, which terminates the process and prevents it
> from re-entering the handler loop.
> 
> Signed-off-by: Junhao He <hejunhao3@h-partners.com>
> ---
>  drivers/acpi/apei/ghes.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> Changes in V2:
> 1. update the commit message per suggestion from Xueshuai
> 2. Add a check to only return failure on the ghes_notify_sea() path,
>    avoiding impact on other NMI-type GHES handlers.
> Link to V1 - https://lore.kernel.org/all/20251030071321.2763224-1-hejunhao3@h-partners.com/
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 3236a3ce79d6..787664740150 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -1383,8 +1383,16 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,

ghes_in_nmi_queue_one_entry() is called from two places:

__ghes_sdei_callback()

I think, but I'm not sure, that you are addressing call from here. By
returning -ECANCELLED this code skips the irq_work_queue() call and
returns -ENOENT (instead of zero).

ghes_in_nmi_spool_from_list()

Effect here is more complex. Depends on whether there are multiple
ghes entries on the rcu_list. If there was just one, and you return
-ECANCELLED, then irq_work_queue() is skipped. But if there are multiple
entries on the list and at least one of them gets a zero return from
ghes_in_nmi_queue_one_entry() then irq_work_queue() is called.



So which of these callers is the one that needs this fix? And is the
other called OK with getting -ECANCELLED error?



>  	ghes_clear_estatus(ghes, &tmp_header, buf_paddr, fixmap_idx);
>  
>  	/* This error has been reported before, don't process it again. */
> -	if (ghes_estatus_cached(estatus))
> +	if (ghes_estatus_cached(estatus)) {
> +		/*
> +		 * Return failure on duplicate SEA entries so that the
> +		 * subsequent SEA handler invocation sends a SIGBUS signal to
> +		 * the task to prevent it from re-entering the handler loop.
> +		 */
> +		if (is_hest_sync_notify(ghes))
> +			rc = -ECANCELED;
>  		goto no_work;
> +	}
>  
>  	llist_add(&estatus_node->llnode, &ghes_estatus_llist);
>  
> -- 
> 2.33.0
> 

-Tony

