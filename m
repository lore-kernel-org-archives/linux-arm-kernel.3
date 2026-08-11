Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F60C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBballaqM1+K/XhbEc07NAZDYdttcb+DuexeKlatWi4=; b=aLKr4QakTteOlvov/xY6h4VT8z
	lusy4F2VHti8hRXb2R8HJtJExEpwjF5+gX2VjSxmQ0rWydsrwXcMbkwRomujiAfdBUn6ZLD+JhgpX
	g3MHP+f11FXlOxwvBMAAnpm1dtPm4rqv8U2pUCM7LXUMl8cpvRi5/QzX5OLC9ISBZE1skapf39N6Y
	8E05gjfv3SMHCAp7djN2+G088aHAKYe8S/UsAOmT8pA5lC/LSkCdAJjBmNzLu6Q4qo+DHA//nQ9UF
	2c1n/NJcl9eq7lKb60pXdM4ojBfq9GBbpDUdXrSkOqW7zW/pG2lVlEZJTzqeFrIXh99NuycG16FmM
	qFFv8Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpp6-0000000EZhB-1bhS;
	Tue, 11 Aug 2026 16:59:32 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpp3-0000000EZga-30Wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786467570; x=1818003570;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DOLc2397ttyozSPWOc3xQ1UUSOb9/bcQA57T1nWwdn4=;
  b=lc2bXFxP7NqGPhcNfIQqBOoSSUfexgqWZfC4APGenJksFcQfRqRCFTm+
   E84B3oCgXABP4m3o4bNDJBSQbTDaWKf/t4Aj1MQQD63TsojKZ8QrywQey
   Cr9CArvuNGJDaJM7AEKusjeuWLJBVW7y287gaSe0FW2RQ4pKjExvRv+JU
   gebLCWVSjBeuwiQb8+fL+bsTsI+r1LaZGCA15F2lH2gMGSAwQL0Sbo2Rz
   WCzeKNkpObjovpzypnVulh1lD65ls+3q/m6VhbAdyztSbWcmngjAJSCoi
   eY++Ek+t/D9MepbsmsXQSHD+Kja0rFD73KLbDKcAtVXmfzcB3NbFTk8Bs
   A==;
X-CSE-ConnectionGUID: ZCcNq2kEQAmHnO/cWcF0Bg==
X-CSE-MsgGUID: ArSYw/I0TTOHNNZIc3ZxaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87029091"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87029091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 09:59:28 -0700
X-CSE-ConnectionGUID: B6i/goVRTXSkck1GLcD0UA==
X-CSE-MsgGUID: AYFHYX+yQzysfHohp10rfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="263978403"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 09:59:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 09:59:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 09:59:27 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 09:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyLMfuLh11IQu53IktANVwATMfpgbjdFuhBjyoyikbbuJxYnMwwJLfqXR0YbABNA3dLo9fgEFk9qLQwMSowoLYH6dv99a+agQvspN5V/4F4cfQF0TnyGCmb4StAbjKO3bsyHx2dwp1FLlS7Tf4updjIxkQZKveqeno0zgqa7MWpj1kDo0YsIc4sG6X+5fk31/WZpbXz6xqgDXSjRqIrkvIxWTwpV2HyuLv/6xgt3p90/KnfzKpbTVVM9VE1GcOPAUrrVjQZ0NT/3Y6OfIgYrfJYvWtS/bW5t3gtc3D/X/69pABvDeEEELcaHJI/pT5LAMZqUtBIv/rl8PyF74UdcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBballaqM1+K/XhbEc07NAZDYdttcb+DuexeKlatWi4=;
 b=nkn5jLf+AUF538VZ81eY7wZLVokVRFUp+s6sLohm7Z/kI9zfEre046cJ8qP4H0BT2fpetRvn02tKEwCf96KqUbxEsemCpuqO+Rs5+DT6Ods+sPsCZfsj5ii50NvRH+OR+sX3cyRL+slg6m5UJELvjjwVIS2qdpZwYNMlW3zF0IcESVA+t9kZ283FiF3ftyY5j92+3xgpR4Kva7JVYVmj/+qal5bo5mbnnaBiouS6F8sNzYiqYZ5WX7awbbSX5LJ9Tc3DJERQr5P8E8kteg0JYT1L25p8Sqmoho2YcJvFQ4oLb/fT6wH924kzprayW0DTD4el/OlxJcf/cVfJbFBgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 16:59:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 16:59:19 +0000
Message-ID: <eac63892-8946-4674-b757-bb421a868b1f@intel.com>
Date: Tue, 11 Aug 2026 09:59:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/23] resctrl: MBA control emulation and ARM MPAM
 MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>, "Ben
 Horgan" <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu
	<yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, Gavin Shan
	<gshan@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <cover.1784217438.git.fenghuay@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:303:8f::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 066075f2-d785-4a02-4916-08def7c9e228
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: iXLXRnRtwFpr3oP0xGjqVm30WMyjz1Qk5BXdBjSRjbZ6mbGQ1PjQwwu+tqyusaruSmOPffNFG0RshRffnvQVjUykVwpJwU3+uLM7+Y/PecTKPS5RD5fbFAeESJXe/QRFHkaUieJAQMEaClrwUJAyMjlH9prLRAK7aBGaTC9cEzQEZo0k0l7EWYX7GYZy5gBND7KH3e4EfPHfw7hDnbdf+8cQAGIqMC5e/ZYHyCRlqwfYZ/7/uMCLiUwKfD9bZMC2E1qr21vOv4Wmhc+2cCDNst2zaH5GtCn+Vq0KlILTXeNpWBq1HB4OxMw6Csh9yxBnQFVX5TL/4lTt1fUwc516QFyXLIvZjGWJstXM7i4N4JKoDnV5RqMwvsOmgp4LOw6M/LRozdvEs2eymsyGvj60OYQnf/Oggw/u3yDOidG//M9aJht9yEMCLWlNCMYLFpDRvW2i3E0FBq/+Ekv/yNKMw9j0SqKXrEgzbp17lN1X4chVLQmPDIsZmWLVHhcmZUc7Ul2pHCXoU0C4XAytS9QiJwUIg0/MqBdkHfN0gciU86gIPSCt1pbdvd/E3C6ORXn+GinAjow0KcYMvugmMweru7Iwfkd+yA544LED0ybUtPVCHm+JTN3+YibaDXGW270IfCOQm/WshL8XuZ3VPwIlErvn4KhkjKCULV9qjeqiKB5fNVV+7TwpI3NWJbSiNololAIOdCqlLZ5FM1ZGrBkiPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNnQzdCdGJzT3NieEtXaTdwNWNrWnAvRWYyMEVXQVViNTIzVCtUa2VIa0lU?=
 =?utf-8?B?VXhZdEQ1VlhVZEdOdms0OHJBalB0Z3hOQjhoaDJBejlDYUNXUnJPdFM1enJa?=
 =?utf-8?B?M1FlRWx6ZW5pOXhJU3hRT0JUQk5mL2tiN3V3N2dCT1l2Wk5BaWxEOWlvS1hz?=
 =?utf-8?B?QzdsUUdkUE9yTi9VcGMxeUY0MnAvNzFuMVJoaklxYVB3Sm9CWWNEOGx3MDJj?=
 =?utf-8?B?YWUreEFxd0dtMzVEdkxsOE12YWFneE1GSFllRkNqMVNyWERoSjdLSzUwVENo?=
 =?utf-8?B?R1ZLYVZmeG1keEpNVExid3NOVGFoc2V1U1EweGRMWXp0bkw1am1pTkVKWjI1?=
 =?utf-8?B?SnVYSytmTkJVSk14RjBGRGpneWdDcVh2QjFwRE1KSTRTNGJ0L3p4Tlp2QkJJ?=
 =?utf-8?B?Mmw5aE5uUmh5TGZLaTJjQlZPRWhaOExYbndid1JXaVdhZXJVSnZLV3RobWYw?=
 =?utf-8?B?NVFoQWlwUHIxUUV5RzlmRCtoMlZDalBqWUdsWnNwdzdOaUtuY3JyenhKUVc3?=
 =?utf-8?B?dU05ek9aeGFxZytjZGhISG9HKzUwYTNtdlZ6YUw5bkRBcENhT1IzVXo3VDZs?=
 =?utf-8?B?SWlzWmhXL3BnQjZkeEsrNHBtdTVOd2kxaUFGbVAxZmw1M3p3YnQrakFVcnJi?=
 =?utf-8?B?elQ0S0I2MlczY3A4VHV4VDE1aDR4emt3M1BhRzZZdlo3Tkg1U3NMZVdDcDBn?=
 =?utf-8?B?VThqTzJuRndzUVZkblBJckFFeDdocEc4QTZUMGxwYjRYUnA4UjdQSnlyeFN4?=
 =?utf-8?B?OGhDWmQrb21hWk4zd3dlV082VGtwYnppVmlDZm8yV1UzaFVsdDdGZGd4bU1p?=
 =?utf-8?B?WUlkd0xvdGZqTHNNeGJ3L1lSNVQ2SEZKUStkd1FXTFZvZE1zS2s0YlAzbXYy?=
 =?utf-8?B?U0pOV1BiTjN2S1VyR0FwbVNaZFJnMnpnek5KL0hKQTdIcU1OZjdHcGM0OVdL?=
 =?utf-8?B?Yk4zZW9acUdxenBva0o5T2RjMS85eW5GY05UWEhEekNFenQvYTBYb09wUW5v?=
 =?utf-8?B?ekYyOHl3eitnMFJCMklKelk3TmpvTy8zU2EvU29OeU8yWElSaHBoOHpOaWNk?=
 =?utf-8?B?bWk4RGRpb1l2RG5KT255cVF3V2VOU1FUbiswRzFqYTJ6ZnhndS8yTjJDanJi?=
 =?utf-8?B?V0JDNkF2MU9iZWVVYVVmYnZCa2JTanZMdTdIZWJZRHpsSUlOV2JEK281RGZ1?=
 =?utf-8?B?amdqTVJyK2pXU1JYZ2Y0dWd1ZGVoSEN5YklMeWdTejl4dzFHVjJmVnEwQUk5?=
 =?utf-8?B?UVh0QXRsKzMyd3ZRZGd5WC9wNHBaSUdmWFhTWlI4UjB2WVlrb2Qvb3RxRkpZ?=
 =?utf-8?B?S3pRMFBiWUxCMzBzV25TeHZwcUxDejBSRjlUdGxrRFp3QkNGOWVhL3VwVFB4?=
 =?utf-8?B?dk1XR2JvV2RGZDdIKytoaG9SVU5CZUx6bitReVNsNjlBWG9MbURpcUZQdTZ0?=
 =?utf-8?B?MEJqTDJidlFjV1Q4Ukx4cU9YUWhGZGNhNVU3WjJJL3MyUGtyZWM5Y1VwM3pS?=
 =?utf-8?B?bXVQWko1WnBPVmZVbHltY3pyTFBSeXZraWgrMFBUSkVkWUh2cWU3aHpmK01w?=
 =?utf-8?B?My8wYVQwYlN2aktreGh2OE1qelcvbW41d2IrMkFrUTcrR3ZTRXVWRmhzc2FU?=
 =?utf-8?B?dUZ4a1IreTZmK25FcTM5ZlJxK09KTU9jcG1zeGpwT1BkNG51UHNRbTU0aGpq?=
 =?utf-8?B?ejlHRXNBaW1GWGRhcmZFaC8vWUp3dW03aVZqU0FrdHVwbVRXdTNodFA2MU91?=
 =?utf-8?B?ZVlDVG9YT0RaYk5YTDVJSGhCMDZ1RGU4QWtjNTFDTCtiNVYxaDZ4OWc3OUQr?=
 =?utf-8?B?bWJpdmVZSi9ET3RjWVMyTmJRT01BeDZrVmFUM21TZ24xYzRoS2k0V1V0Wm1i?=
 =?utf-8?B?QjU4b2xjK2xuWHI4M2VPRzI4eWxsdWxVcUxGeWw2ZGdDc21YZ0swN25QWHFj?=
 =?utf-8?B?N1hZdGNwUnd1RXJJK1pqaFpFZE1CRzhQOVNNb201QnN2enZwOG1rbC9KRW5G?=
 =?utf-8?B?ZVZFKzNBaWx5TEhLTG9XV0dERjlxeFdlZkRRRWFQSjV1dGxKRjZwK3RpcFg3?=
 =?utf-8?B?eWllM1E1ZnBURXFTVlFWOC9PcDBMNmlTRVFZMXRTalR3T205M21weVJGMnVr?=
 =?utf-8?B?SmU2dU5BVHY2dGJ2ekxWUjgvYU1GWXdPSEw0OUxIa1ZrejRsbS92REJmZk9M?=
 =?utf-8?B?Tkt3QVdNVmF4U3JGRUwrSGF5QU82dHhXNzhBTTNYL3JVWFZPWEtXR1M1WnVw?=
 =?utf-8?B?Z3cvQ1NieHdXUEp5RmRmc2ZJb055bHFIeUNpc1o0Q1ZEV2tIWnFQcStHWlBT?=
 =?utf-8?B?QUo3eEd5VzQ0enJiN1B3cUtaMnNEajN5eGxRT0lMdSt5YTlPZFBtSVpid3ls?=
 =?utf-8?Q?H+2JOU/jqda2Ikg4=3D?=
X-Exchange-RoutingPolicyChecked: EXfIwLeQa47xMzLyajqMPv9Oe1/Tml+MtPwKRhLvJhiiJei3iobcCaqaa2ZT/+xMFb9cdY0282nPCs7JWK2kFLrJFBfu3JnWEpGR9d2xLXFvGHe1DoTCggs+CwTJwH2aOP1ol2Y3iB7uL5dPReZmvQRcr85MzPzor91xgttM2PC+WBIE308RfwLKOkwnjyAXfdW5FN5HbUU+KBe4eX0mMS4siWGxJ3nk46TPb4lQOFejSXL0LF63SfIUowMiLsEBgpoKAWKj1rfO7ipqo6zSqVjh28g4cGcmFZPc3TnzKNKM5/Ph0ZxzFzxTOARyETzwAv6bJARrkfYxa5bzDj/k+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 066075f2-d785-4a02-4916-08def7c9e228
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 16:59:18.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXcwoOX4FG9eUKMreTuIPsmABwHi7QLRw7/g4brB6G4X9DwcJzgmbk/Y7s6Kv+JSeskdXndJgyfe+jpIwie1hCMTTmyofXqWdobQgTi4yG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_095929_799985_22AF0CD3 
X-CRM114-Status: GOOD (  14.84  )
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

Hi Fenghua,

On 7/16/26 2:02 PM, Fenghua Yu wrote:
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and
> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.

Just to confirm, I believe that [1] simplifies support for CPU-less NUMA nodes.
Some highlights of that related to this series:
- There was agreement that resctrl will treat each resource at a particular
  scope as a separate resource. Just like L2 and L3 are two resources that represent
  cache allocation at different scope, MB and MB_NODE will be two resources
  representing memory bandwidth allocation at different scope with the MB
  resource implying L3 scope.
- [1] contains support for switching control mode between legacy and native.
  From the MB_NODE examples in this cover letter it looks to me as though
  MB_NODE will take the shape of a percentage based control. As I understand
  the hardware has multiple controls with finer grained capabilities and
  how these will be used may still need emulation if MB_NODE is planned to
  be percentage based. As a sidenote, since it is introduced after the new
  control properties it could possibly just start out as a finer grained control?
- There is no need to change the info/ hierarchy on switch between legacy and native.

Regarding the monitoring support, I still believe that the monitoring support needs
to be separated from the resources to accurately reflect that the monitoring is associated
with a scope, not a resource. This change does not form part of [1] though.

It is fine with me if we continue discussion at [1]. This message is just intended
as a summary of changes in the works that should simplify the support for this hardware.

Reinette

[1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

