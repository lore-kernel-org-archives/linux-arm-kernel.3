Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30275C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFnlDEA3n+opVLAAAz9UNDahGvAeXeOrjetHf2ECR7k=; b=WdvyfUtfIrjVVBsJlVovASGghB
	dk/SHqwhSW+xorOulcUJDQMGHrRrxMs4tGEHpnrn+yPoIzzUkeL6THm9G30ElqTa9f3Xwgv/2OGmA
	qUOkWY/94vrhjXGM014aGSkuxxglZD98bUAgp1KsMTU3Igak2xvg62Og7D+tYmogDO/tKOeyPDPfP
	n869Vu1FSDlPHoeayJ8MybAVl5Hp2m/4tjbd7Gi5Xq434QYYqnxR36eM4tqv0KNHWs+qJTQkzOFOY
	caCK8e0Nr7y67iny8IACQm6CL5OkvErYt4/4r24r2KWOG1PKl7WRP47nyUR6Zao9GRNUJgPZN/1Pw
	yDZyG8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHru-00000007ptC-0FAc;
	Tue, 18 Aug 2026 11:20:34 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHrr-00000007psY-2pnd;
	Tue, 18 Aug 2026 11:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052032; x=1818588032;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WixTgqdSgp2g/fkZZRQgu3xH6/jNT/+OPQvLyh5OXQ8=;
  b=UqPTPHTfNGWgyTtm3eKMcFcUv8I5xqvehTaHWExyfx8rSvGJCcG36Gfa
   PIZ/oewPNz5GB+z7iTiMzy2pfvhc4Z5qeLsAHm0CAKr7qVbVPkG+PAB/U
   08mZQuUvt99E+YtRT0zf3HF4R1z//F0janF3bg7owRROckF1TdwvfibiN
   QwlvtBDrJnjkvZU9oSAkGLWP49Ae/IXlndJNuCDZw0pRa4C4XiIyavgJ7
   t9dQgpVRiZMVj13RdOCYbvNmyWPQ9eOjkHSUzztBJuBWrI8tSXZjXkn3f
   qZC/0hl6Yk0LUk9SHYlqHmsTKr+fNP3okNSbXBC6s39s7WWZm8lxzMDMo
   w==;
X-CSE-ConnectionGUID: TiBBGrLbRRiGIAD5q9tTlQ==
X-CSE-MsgGUID: z7kERAn9Q724VjfqHny47w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="90053685"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90053685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:31 -0700
X-CSE-ConnectionGUID: 55B4qBHXTM6772NzdgQp8w==
X-CSE-MsgGUID: 5kA4YoS9SDmHnwMaXuEmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="262572959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:20:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 04:20:29 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0m0fq4A0L+/nq68ZisHCb6JOVtBODWzdpV457jkU9RqnD1g1CCo+BsWJjulXr4omqqf1kMEaD0O443Gy3GL/MWpjrfNqj4FsX5BE8mY0xlmAuOKCQDOtCAQjPkduwDHFbjfEZ+v+ERucdKdlX0HVajGtn8/HGyXDJY6zHjohZXU1wsxkGcRgB160nVEdYVdcMtfTNs+MjBdJDcgkyL56BtVWXyWEveTTgg5H4WFmPewmJdx1x6rJEvoSWknlBN/QCbHOfJGtnoGrDnZpWF8e6sv1oEYr3wynfpVZFhnaFg0uhdHmqU3RITmFHOrT9i+TOHyZUh+GicFnADJqLKB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFnlDEA3n+opVLAAAz9UNDahGvAeXeOrjetHf2ECR7k=;
 b=Bf+JK50VMWzWV+FFo2v5ZBHhSxem/kckf76DoukzuXYEkEQUWbadkwNo+bGJcJy8fOF94yfNdHJTh4A1bm5/z0gLN1hCN4Yv5RrkEYFx47f/yNe3hbgwpLBfBzgvOoFh8c6T7dgQNw6AOtXgz1tzNZipXePwJqTNudhPcsZNZ3Cu2NRQMO6UwxSj4gtUZZ+8qFKwXz5fIRhTUp16+UH7t9LthbgE67wpjGD9OU81pjRjykl4yvzf0Wxer9hKfg+al6bpXFdghG+WJaI2NN2s6HWRwQa+a+l2yOR7kl+2ZxPzG/JNK2+q9U42eqD26odCZEXJDhr7JaI0RQQivmPTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 11:20:21 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 11:20:21 +0000
Message-ID: <21f779e5-cd31-4fd2-9f7f-2f4bff8d3f23@intel.com>
Date: Tue, 18 Aug 2026 13:20:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: mediatek: mt2701: Use dev_err_probe() for error
 handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle
	<daniel@makrotopia.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
 <20260817104929.63152-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260817104929.63152-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0056.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::14) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: dda6e00e-0bfb-4d2b-3d88-08defd1ab0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: RDyy8PH1cZa9Bw8970n6u6jrjTZDaIz9yeDM0URSxCwcH09SNaNegT2N+cMbIpfMqri9IxnjGV1Zim0mTMYKx+RpUCGuY0mREeKkz63zUpa1Y1m6DT2vMyFmXOkPAt+mBSGE+rt3BqDWbpQCL8OngQj8pHDgbSrg55MaZT4OAxvHL0AeZ+HL/B76xHSkPoR+RBUxct9Si+8gqocsEOrGE6Sms1xE4ieWaMFzWQr3ArpdUf6IpVCuXPZmsga7PjEO5UfZvGhNef5q/G6Hisy+MIzVUtlGPZzvb5UNWbwnSsN6DzNwWXJ+8Cytyqe7mYaPiF7QzZEXc3J5rnN4yLvXK8cXXm6GbZe8ucr5jfXR+wU16+TVO8iCoEl4WEYpZ4pO6ijuYjd7wqEblUPp0Qb5Z5ul44ol8ruRvpNEnlKOGc2hKMHT81XiI7smztGTSb7qJ8GUXSRTfrBB6wlV3A+LF2MEilEAmVS018nmhtLMF2fEhwdhv7m3SrxUQpEX2ctQL+JvgZL98SkpsGaf55fopxUzNjEB+S5+IND8qZ2JGZxpg4nko856noHG1zY/21LflcLGtvnmlFGYjhklmc2fkhkjgCNe1kiikguLDoJGQKD02yoWjtIBjVLNuuLtKfC/v4Pwz0kbPIkhaFcPX3g3ZN57Cha4vtPW37VuAOrqTWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTZhN3RuTDBBaDN1OEhwSE1WbTRxc3Rrb29vc2JnblBRakU3MVF1M0QvVU5U?=
 =?utf-8?B?bWFHTWZ6eVkzdHppelJqUXJ2QnJaRlFmWTFHN2dOUnhnc3JPd1lXcllmUjA4?=
 =?utf-8?B?MkNLdXdPN215bUxOZ0RTOUp1clE5dFZQZTJIeFg2bE1QSGZnWk11dmNSYThO?=
 =?utf-8?B?d2ZQbENsMG9VRU1QR25temREYjkrL01DaTA0ZkFHRU9CMFVFRlo4anJBK2c0?=
 =?utf-8?B?OFFGM1FMVjNFakhyUmFuRi91Mm5EOXpRanErUzhNSHVYMWlBK29tVVhIcE9v?=
 =?utf-8?B?T0hQWU93NEx5V2wvMWRpYW1aTTdFYTNMMDdzQk16cVNNdWUxMTJScVdzQ2E4?=
 =?utf-8?B?WHZ3QXlwRDlyR2tqcGZkaFY3Z2c4YjdXVVA4S0lsSm81UGdjamZxRVc3R1h3?=
 =?utf-8?B?SW5UdXhDenZkc0lrNm5DWkhVK3huYkhUemJybDdDM3BabFlFQUNGU0c5c1Yx?=
 =?utf-8?B?WjlIdjZ3SzE4L1NvamRlQmZpVmFRenYwY0ZPY0RHVmRLSDhCSzFnd3ZFK1Fn?=
 =?utf-8?B?d2pScWU0SGlPTnpnWjVRSmpGazBJS2NiNUNxSVhwWHpjcmt6SHlJQVVvNnlh?=
 =?utf-8?B?Y2dvZ0docWJtREhOdjBnenc5azVCcFdPSGRCQVhBbWxDRjRuZUVBa1VhODBW?=
 =?utf-8?B?NUJsajd5TFNxLzNGOFhxWmJSTjVpRnBtU3NGZnVFQXZuQVdOU1ZvQzlIRFVa?=
 =?utf-8?B?V3diMGNyZ3pIclNXR0pDNitmd3lqRk9sRXAyaklMMytGbUtaRUJmM0dkVkdo?=
 =?utf-8?B?RmovVStqMkVGN3pHR3FaWG1GbFpXTEJQcUdPVjBlZmdjRDlxTlFia1gvV2RX?=
 =?utf-8?B?WlAxVVJwMVh1cnRSTjVUbU1HSlNkc1NRQ3k1UUZaUnJUcit4MlpPVTdQSHF1?=
 =?utf-8?B?VVhyWUFCcDlZS1ZNK3JONmI5YnNtL3BhKzRsYWl0OXBoSFZnalBTYW8yTlMx?=
 =?utf-8?B?eGErbmZUNjVJVVFDU3hiOUwwUTBROXp4cS9KODNWRGRjQVFhc3Vrck9JcUpz?=
 =?utf-8?B?NXFrdGQ3c0xJa3M4YW81SEQwTGZWTUhLTy9xdkZ4UVlpVXdjOTN1TmVXalZD?=
 =?utf-8?B?cFRuTVFDL1F3NjJQRWMwanIzbGRyUmV5OThYWGdhdHA5QXAvN2lyRkhMYm1C?=
 =?utf-8?B?UitZZ1FLVkpWYzBKcDFTekZ5L3hrejFxSzF3TVNaRUZLbzd4YXdCcy9oWEVS?=
 =?utf-8?B?bjJ4dUtGZlR0alh6Y002ZlZueEgrRUZjanBoeW9laVBDelBCV25ESU56TUJn?=
 =?utf-8?B?blduQTJWdGJ0TUJuaGtPWjNWd1U2NkNiOEZmdjRXMjVhTmdZOEZSbkM0T3B0?=
 =?utf-8?B?c3lZTkdBOHA3QUtWNDRHdnJjc1h0RklHaWI4Qlc5VTYxS1l5UGdJODMvcnBm?=
 =?utf-8?B?bHBkUG1MUzIzUktuRmVuWUF0dnpCVk5ObHZvTTFpNXZLamthOUwrREdsNndP?=
 =?utf-8?B?NzRzT1piM3FXMzdTa1l2OFk3ZG9oNzcwVlZNU1RFZ01BSm1iY1ljN0FBL2FE?=
 =?utf-8?B?Q2xMRHg1QnNvM0x5cXZRSStrQUt2THZvdS9VZU45RTlMaEVTdVdVTGJrWjQ3?=
 =?utf-8?B?a2lSbW9mM2hiUEZFQmtjMVp6Vk1oVVVsbWp2VWo1cGgzb3BuRVU1aVVvTlpI?=
 =?utf-8?B?aHh1VnlKRmRveElqZmZMMkNwM3pUNjNPbU1MNEN2dHFHbGhPU2dmNWNlMWNn?=
 =?utf-8?B?ZXZjQUZENzNUSzdDakJmR1ZyS3ZIOGh6d2RtQk9lVm5CMHlGUzdMdWVMUWpE?=
 =?utf-8?B?d0FYWE5rTXhyMzdBTWVtdjdNVldBU0hBUnVlcHYzYWthY01wcFZLRDg2QkZh?=
 =?utf-8?B?UU5Cc05IeEZ6eEZycnZzM1FKQlN5S2tqR2N6MkdxcUY4Rm5KQlgwUkQ4S0l4?=
 =?utf-8?B?N2pDaVo0NzJ0VWZWNDlMYWV4QUdBMW4xb0pjaGdoaXZybjZBbjkzZy9icTNF?=
 =?utf-8?B?N3NmMEhsTUlxNjZhV2p6djBEZ2V0RzJVNnc2ZnJTTmE1MzVlRThsVTh4NDJh?=
 =?utf-8?B?VFRFdDF5QmdJZGpTSnJLMzJHcmVOL1FQUi9Tb1VrczNHbktvWjNGcjRPQlVn?=
 =?utf-8?B?TVVHQk04SjRlVnJRaXRXTmUxRWRoUW1LV2F5dlk4dzhjU1hxTHltOThyZ202?=
 =?utf-8?B?N1ZySnpWT0ZmRmhoekx4VVJjbktYYldhamJXT0E1QzNITzQrdHNzSzN4bDVn?=
 =?utf-8?B?TlU5V3h6Z3RKSGczU1JhZGY2UDIxcHBKZjB0UlcyUlluK3FMcm5LK0tySitX?=
 =?utf-8?B?alpweGNsbnJmQTc3TmNGMWc2TGMzbzVlNERmejNoN1hlRms2SjJsQ2MxMjNh?=
 =?utf-8?B?akI0YnVsWDZleWtsRGtBdThkcFZJTTZkc1VsQW83Y0VZRmM0TWtsWlFHeTR3?=
 =?utf-8?Q?OWhKFfnIpnLYMfn0=3D?=
X-Exchange-RoutingPolicyChecked: sIxoubDCbpP+dd2KL40I2LUZJnelWSSY4/FLDTNvHi61hIJ2g7G20P0nHD/Z0EZHKIKjcC7tJaIyeDZzKLLxUYBO+K94Ue2zWMDC+SOtI/Es6p8mL1la5Vz+qHFdwn8ephF56km51QEvgvfvUC0o0ijBfFcqJ9SoINFLqWP+2JcfdQAbcfOJyadVYljbtkh+Tl3ALdiVhTk1eRvWLHCwk1uLX/LY7RQCq/50nf2NTbcsii8nCyX9lK7jSUJu4p4vWnHze3usbY32pFhy8jezQPe0MZk/c2dS17zorjc65UwHtJ7WFTcmfKLvxEWfDfGmtQsuqcrh7ckJqaVQcpQn4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: dda6e00e-0bfb-4d2b-3d88-08defd1ab0e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:20:21.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tEqCyQ3Ns9bXxMkE5ZVSZjx6H90XLJeTJ2DLTnsw1T3RWRmBuszNAaiHpRKbD8oDsoTofUIeEr5jKgdENY1TDqYaD1Ul8mBDOP70BobI3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_042031_736757_79F7D0A4 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

On 8/17/2026 12:49 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Replace dev_err() with dev_err_probe() to prevent log spam when probe
> returns -EPROBE_DEFER.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

