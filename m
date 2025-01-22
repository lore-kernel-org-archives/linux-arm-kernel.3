Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9819CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/zHclglua6+1vRiuOJ8dQ7gpYrSrv8p0vOhE4fbxSQ=; b=oqdHOkiNjtPZH8kxtsQ4171Qz2
	/kGJwx5go9X5QUKuOp11OUZauAclAoK2Dakes8KNmLGN5Bg7pXWVfXqYeiLT1ZHQO0VmOqMG2P3tq
	wF62R9lyxImfZdkt3PBPFuWiJrsvSva2G4KwzLJnrUtvFXuf/K9Xn8tQ5CDUu+79UdPOPfUlu7+4o
	yTf54R7qURT3yZRG6Ur2QucfQnnp8+MVms6jEOSOFZ/LqKlms4ypFa75cl8hKjxUgrkw9nff75i3S
	2Up6ggjQ4w7AfcMMbjmVuURE3PUVeopt8iszRbL//tg31K8WKmC7zCulZCcgZbJxC4q8VzyCqTHOp
	f10VKB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tageN-0000000B6TP-25IF;
	Wed, 22 Jan 2025 19:44:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tagd3-0000000B6LI-0FG0;
	Wed, 22 Jan 2025 19:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737574989; x=1769110989;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1EVq4FdlMjOlWLKVr2N85PHTe20MSlfgUs0mHf7dbVE=;
  b=RxE6KLfejqKPxxzg/FX1LFol6PqzRbJzP93fKIn5k4w7Q7S0Kl7E9eSX
   bR/oaBItepg08VtZ15JnT049PszxsH+PK5Nl64or+aYrCZzj5pMiwDmDG
   gP11yJ5T3bvW25yBWmTNFOhoJTvKv6nFRMlBOZoUm5beDVhzXYvOXGMEg
   mElXvIYK3zmN1hqKIDhcEmazl3Swyrnzi1Z+6/n5fbtivbXStINilDdFI
   6yp1vTJ9LPcV+ILDpdmVIxARbQVVVGTJytRMpIT1Y8BPKjppeYHtRZNTd
   Ffl2fgcWSDCF5QRgvOSfYB+Gntx6xfMQqIZz/PTeB2WjBl/eSrPvmbQf+
   w==;
X-CSE-ConnectionGUID: UYAxuMcfRYy8FCAxf6Ea2w==
X-CSE-MsgGUID: 1Fi3fqnFRK6WTvF2kiQnrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37751171"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37751171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 11:43:02 -0800
X-CSE-ConnectionGUID: VKDTCRXITpGH/G2h7aba4Q==
X-CSE-MsgGUID: L6/02INSSB+P5SlacGeadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107783960"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2025 11:42:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 11:42:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 11:42:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 11:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/lleCqS56ml2zdRZCeU/gY2LE5GWxFvWx7AVBqAowmABuEBexz6I00dJNzXveWZBSXzvM9I4xaXSdEc0z4ZWqpCY7rlgDghq4v4iOVr8QhS89R+jAq2Z1ZHdjG7PyZtPdr/n4JkBdMD/KuuKZtNVq2W2Jsy4cR6ZvPw21HmW2KnA5wS3wCGQlmgGpYjzzExSGihJVyEZJSjei7WXEHrakFA4HxAG+Em/Cxzt06Zi154CtNvKChsdbaampBZmt46i2kyNlyMVqo48sPnEWu0Hwklos2fOC9ZM9ZSBDUQ4QGxZclYVnBkcYA4A71yR3QSpsjl7vT3EKWPOvSQ89EA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/zHclglua6+1vRiuOJ8dQ7gpYrSrv8p0vOhE4fbxSQ=;
 b=ZOBGL5591E1XJ1b/Qu07I879FNv3EEMDdZZluRRlE63nyzzJklkQDEk5Dos/v3h+TYuZn+NDm+6TnZQHMifPN4t0zkYDWmfbqqXe9ItFxRWWwzUROceKpndQnh96pHZxoJ9x17DJlNSdja+AjC+1638XphxmqZoWFHYYQT6M658ae+gc4y+OJ5/LsYZ0cQ4iT2kkP06Rx4Pyn+3NnXtwfNgErbIM+FNK3B2uCbDZrCVlnhLZbpJ0tXcqSShHHy7nn5DohijAeWy3+YgsD6NJA9TA7G+vLDXb9UWde8zRxE531QvYDaUeJ8FWxrJuDC1aknajGHcWXFoEmacBQchIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 19:42:55 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 19:42:55 +0000
Message-ID: <fc17525c-1543-42cf-93b4-2b2fb9d409ce@intel.com>
Date: Wed, 22 Jan 2025 11:42:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [net PATCH v2] net: airoha: Fix wrong GDM4 register definition
To: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Sean Wang
	<sean.wang@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250120154148.13424-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250120154148.13424-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b671c21-794d-4204-c454-08dd3b1cf72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUtOY3ZwZlVRSzVNR3dOSkF4aXpkZCs3Z3FtbURWcnBneGN3aXR2bysxR3JM?=
 =?utf-8?B?UmlNVFdsd1MxbmxObEswSTZhL3J2ekJ0QmlLYkUzZFN0cThqWElDVVlpUC9n?=
 =?utf-8?B?U2g3TTZyb3dpY0tFZXhKdUVkOGpaM3hsMWV5enNUazYwYWx0RytwdDNYd0RM?=
 =?utf-8?B?NS9zRjkwT0w0TmNMOStrNW1EL1dHTVJzTTVNb2NuZE5TcWJ4ejlLZmRKd2NG?=
 =?utf-8?B?L2FEdlViTnRnNWoxcFNtK0I3T2tqOWR5cnljZmJkYmFQRkZmdExYbjhZd0F5?=
 =?utf-8?B?UU4zM3Fkeld1c3FFWjFVR1l1bnRmM3kzdk5jVkxlTng5K1hVNi80UTNGSlUx?=
 =?utf-8?B?Wm5Oa0pnbnl0akFEcUhJSjU2NHByOGw2eHNhckJGdkdRUi9QVlYwbVllTUEv?=
 =?utf-8?B?M2VmN0VZd1owNEhHU0w4YmJLV1Vabmlka0JuOFU1NmJyaStkdnE0QWNUdnNr?=
 =?utf-8?B?SStDaGxyMis3aEhoVmUvbU1SU1hmWDFQWXpTWjF1TTRvWG54VWU0ZFhIL3dn?=
 =?utf-8?B?RC81ZzJtaEZMbHdPc2JiL3UvemRnWWE5VVoxeXpabU1JbUNob0ZONG83REhI?=
 =?utf-8?B?eDRXSk43M1JKZHJ0M211a09ibnZRV05vTzZHNXNRVks5cmdjdXFqMTAzMUxt?=
 =?utf-8?B?aXJzeWVqdDBFbmo2M0pOY3hGQjVkbXZLUVluSmJ0M25mTEZyMjdJT05kTnN3?=
 =?utf-8?B?aGtVdjJ0ZkJpdWFHaTJOSUxhSHBWQXNCYXJjdWxxZG1pM0pEZC9id3BaUUJL?=
 =?utf-8?B?b2NBa01mdStnb0tiVkhJQmthZlJWbGVsajZBek45SGJlNWcwdFMwVFFzRGly?=
 =?utf-8?B?U1VvWlJxcXVRdkFweFFYWFh1QmZSZFo3Sm9GYUxDWTM0TlBhSVFxbDJBbE9C?=
 =?utf-8?B?MjAzcEpSZFd4T0tmVlIwUVEyOVhOQXhXMU9sZEVoaWYzZHV2cHFZV0VZRkhG?=
 =?utf-8?B?WHZMZzhIb2xQQVNRbWJtajh4RjFQeDVucEQySmJJdnM0RVUweU1NZGhmdDV4?=
 =?utf-8?B?YTBaK29oRGw5MFRQUVU3WVA4a1ZTcmxuR2R6cnVoU1hQWWVWRXVsbGQxVlNJ?=
 =?utf-8?B?VmF0RWVqMFVVcHdyYkgyWnJUdDZwTlRqY1ZGNEw4Z1pxKy94TFlxTlZXb0dq?=
 =?utf-8?B?ZklkN21sdlRjUjdXYlR6M3lsNmw3RCt2MGRab0RUMHlqQ0VsNWlFRFVNL2Ft?=
 =?utf-8?B?LzRVMm1xRStvcFJPb0hDRElqWGRiWFB6cnZMaWMwcTR2ZUlkbzNLN3NkVGZ0?=
 =?utf-8?B?MXdJTHkyc2MrMHlMTFBvWjNWcStJdEtSNjVPeGtXam4ycUE5eTc4U0Yvb2p1?=
 =?utf-8?B?dTB0OGVNSVF0cnZXWjFDaVVCNTRaSzJ4ZDkrUmgweVc0a1Q5SnJEM0FzVW93?=
 =?utf-8?B?VzVXQjJla0ZZZEl5ei9jNGpObFlkVnIvUk5lV1FjM2oyWHEwOVphY2Z0KzI1?=
 =?utf-8?B?dkZwa2U5d2M4Wkw3ZFhRdWtXZVcwaHplNFpNWExad2d6MWdVenFHeFFHRlM3?=
 =?utf-8?B?cWk4Tys3d2tXOHdYN2JmT2M2eCtIbnJncDVlUEdXT0pubHFuZGFKRUM1SWZG?=
 =?utf-8?B?VjlXZjhVaHZpQ1VYa1ZTZjJxc3ZqQmxjdU1sQW5takxHVzRid3ZSc1FJMG1G?=
 =?utf-8?B?Ukc4aHQ4eW1Va0FOM1pZV0tadm94YmQxRk11TXdxSk03ckVUWHhPWTM0NWl3?=
 =?utf-8?B?aWxMY2M1VjFlenlkZHRRcWdYRUFQMHl2QWdIenh4WVc2MHltQmpXWmxwR05F?=
 =?utf-8?B?WVBjcFB0cW5vdmlhenFTcHhHL0NxQUlsb290dUI2czFhTEVEUTFyZXQ2blhX?=
 =?utf-8?B?NUhHMXdRUlpFMjhJejMvd1J4enVQSVJSWFNUQTZ3TWVnVS84UTZLcW5SZGxw?=
 =?utf-8?B?WDNySjk2MTVlN1JnSld5WEhISkNxN3Q2cENER05OTDJFcXRDOFkyYWJGcnhn?=
 =?utf-8?Q?ZwhDGNMBvg8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlEenIxZFgyZXRkaUJtTkhDOWtLMjV2QTBWUDROWVVUM3YvTVAzdDUzWjl2?=
 =?utf-8?B?dGVSZEZ0SytXZExKK0dRWllSSVg3N0h1ZHMyQWM2NWNBdkt0SzB1ek1NZGNF?=
 =?utf-8?B?K2Jhd3hFNVpHTmQ3VU5hVmtIQkxJVWdSOVU5TmFnN05EN25wT1lSWmxBZjhG?=
 =?utf-8?B?bEZ2WnBtY1dJQmJNRDZWWWVEMk9lU3VNN1BHakUvckFkdmRZdUxvMjVEOGVt?=
 =?utf-8?B?NUFuRWlDd3pXdkIydjB3VHdCbWJ0c0tsUlhwcE5laE9iTEJ1cHo3dGFDZHVG?=
 =?utf-8?B?dmprcm1KalpjVWpRL2ZpZkJ0RzFlYTc1c0VpVTlYekpJWU1zRm15d0g3NTZ5?=
 =?utf-8?B?RVNvazlwdWgyeHpoSUw5WTU3cmwyRTVwZ09MOW1WNmR0RXEyUyt6eG1CczFC?=
 =?utf-8?B?ckNRTi95S2VZY1QrakQ0L0VDVGlwcTNROXptQ0loekljTkhlZlNLVFVnajZJ?=
 =?utf-8?B?SHNsTzJRc1lLT2VGQ3YxQTZJU2lrWk8zZUJDbGdSL09qdExwbzdPUU5aZVZO?=
 =?utf-8?B?YmNBaEVpZlhpbUNPWi9hQmJZd0lDNzY5d085anN4STR1NWE0blgrZ0xVWnpT?=
 =?utf-8?B?anhTcUYwZkk5V2FuNG9Hcmo1SlZyUW5qZVJaNFBuYTB6V2dDZFZUVTNqRFQx?=
 =?utf-8?B?bmlRL3gwKys1TVpnYnlDdGFBUFlhU0FQVGpzdW5YNUNMWlRlVHNURFIrMklL?=
 =?utf-8?B?OE5jZ1J6Z05IUmdFMEJjMnVXYjJBMkNKZU8wMDdsWVVlM21IVzV4ZUR3K1pq?=
 =?utf-8?B?RnNDc1lsYTJnd0E1NWdCblBNbElOUjlmU2hZVldjWDJhSnlXYmlEbE44TmZ0?=
 =?utf-8?B?Q3Nzd0tEZkE3SkxZOGUvUlhkZVhka2FSQTZsc2dhQXlweTIrZjlhc1ppQjhw?=
 =?utf-8?B?bGhyZGtpSkNIdTVkdkN3NXROSmNjWUJsbjlrR2dsMTYzdkZvTGVXOXgwMVBa?=
 =?utf-8?B?bGo1b0dWRVhsdUZnNnp5UWVNWFR1cExZcWVITFc3WS93RkpHTmlFNUJBYjUy?=
 =?utf-8?B?bzBIci9aZkdnOURKbTRUQ1NhODhZdHFwYmUxZnZBWGlMWUMyU3oxMUtpcTJa?=
 =?utf-8?B?dm9WK0dSejdnS284ajVKSG9oeDZRSUlISVhVeDdjbERKV2c2TlY1N1JhVjVG?=
 =?utf-8?B?VW5wNFphT3BkdFA5cDViRUhzaXRvcURJTisxVndoTkF4d2NldWRic3dJRGpl?=
 =?utf-8?B?cXkyZENiTDh3OURpZ2Rmb1I5bDVWSDhpOHFyZkFjVVc2a0Mwc011TEJSVlo3?=
 =?utf-8?B?bEtHSm1QeGFRdjJKa2dJV3loRGJ6RnBjTjErK1Bic2NxSlE4THVSWHBkM01i?=
 =?utf-8?B?ZmRUU21FSDBjdjlmVW1TVUZFYjViK3podHdUOHF1SmtGM1FTT0lUcmNPN2k5?=
 =?utf-8?B?V0hsbzNnQit2a0FXb2gwbmIrL1k0WEJJVFRLU1pQRVhOa3F2dXYwWFBaVVYr?=
 =?utf-8?B?T0RSck81L2FTT1preS94cmxpUlhqaXFyMm5haHJQUWRiYndTTi9sUEE4VTZu?=
 =?utf-8?B?NXIzc3JOMUQrZm1XVDVUcUF1SGVvcVhKNFZreWcxeGNoblBuR0NtQWtGVHRZ?=
 =?utf-8?B?alowYzVOVVRYNFp0TlM4TndObkRPL0pBM3ZpbXV3MStIeUdaWGtidHUwTS9x?=
 =?utf-8?B?L3p0UytpZXdkcWhhV2VPOFRwZ242MXZHZVRnYnhlKzVoejVIQnBCYUVMVFM4?=
 =?utf-8?B?VUhFc2x5TlV3YW4zVmpzSk9Md3cxczkvQ3JtNWV3Q0RxZEVUa0N5MkNuaHZS?=
 =?utf-8?B?ajhGZDFnMGdKaWtsR2prUEE3OERvZ1IyVktpQkFKS3h1a01nUmpGM1ZxazJl?=
 =?utf-8?B?bU9jVkdFVmVOYjZNek5hLzlOZ1J6b3kwcGQxTERYOW4wci9qOUdsYXdtNlVs?=
 =?utf-8?B?UnpBeUJmZFdmN2pFOE05ejk2STd3MU9Sc0hUNXFxNnBTYUo5VUdEV2xkOS9U?=
 =?utf-8?B?WE4yc2FSUjVINnFWS2ZnZSt4cTVCUURQUkg4NWpXTitVcFB6VVNRUGl0TXpQ?=
 =?utf-8?B?UThsWFV2NFRFTXpKWDF1aTJIMU5KdDZlcmcvN0lzTlZkeDg2R1RVelpaSzhr?=
 =?utf-8?B?MjlOODZjTUNqdURvR0t2bHBvbkR3Q0o5ZTlVWFNyV2RHaUVVYTZXQ25jY0lP?=
 =?utf-8?B?UzNYOWF3ZXB1dWdaUXhHSnBjMmlSNzNnNlZVaHBTc2dPZEdSUTVzWUhUMCt6?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b671c21-794d-4204-c454-08dd3b1cf72a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 19:42:54.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qLxOa362b2j0bOygCXl0tXDIvwgS3D4flj9hp2FbAsAGDcbG4p3gh2ZhsUxGxGhSpJelUy01lOVAEg2KQ3t+jVtfppIEoEV/1j3UOOOp6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_114309_162656_050E05DB 
X-CRM114-Status: GOOD (  20.62  )
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



On 1/20/2025 7:41 AM, Christian Marangi wrote:
> Fix wrong GDM4 register definition, in Airoha SDK GDM4 is defined at
> offset 0x2400 but this doesn't make sense as it does conflict with the
> CDM4 that is in the same location.
> 

The wording of this first paragraph is a bit odd. I think the "Fix wrong
GDMA4 register definition" part is redundant with the title and makes
this feel like a run-on sentence. Anyways, not worth a re-roll.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

> Following the pattern where each GDM base is at the FWD_CFG, currently
> GDM4 base offset is set to 0x2500. This is correct but REG_GDM4_FWD_CFG
> and REG_GDM4_SRC_PORT_SET are still using the SDK reference with the
> 0x2400 offset. Fix these 2 define by subtracting 0x100 to each register
> to reflect the real address location.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes v2:
> - Target correct file (fix wrong downstream branch used)
> 
>  drivers/net/ethernet/mediatek/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index 415d784de741..09f448f29124 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -266,11 +266,11 @@
>  #define REG_GDM3_FWD_CFG		GDM3_BASE
>  #define GDM3_PAD_EN_MASK		BIT(28)
>  
> -#define REG_GDM4_FWD_CFG		(GDM4_BASE + 0x100)
> +#define REG_GDM4_FWD_CFG		GDM4_BASE
>  #define GDM4_PAD_EN_MASK		BIT(28)
>  #define GDM4_SPORT_OFFSET0_MASK		GENMASK(11, 8)
>  
> -#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x33c)
> +#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x23c)
>  #define GDM4_SPORT_OFF2_MASK		GENMASK(19, 16)
>  #define GDM4_SPORT_OFF1_MASK		GENMASK(15, 12)
>  #define GDM4_SPORT_OFF0_MASK		GENMASK(11, 8)


