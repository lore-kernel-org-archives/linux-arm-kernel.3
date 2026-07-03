Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE989C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLnC1fvqtYHhE4OJmX4zSZE49yWBpb7jamm1qhs+wLw=; b=n0ep/aZadnJN6aT7LIxHzEzBfK
	h+es8gcw4dEASQG9DUM786ESg0sIkWgAMp2xNXu5zbUqGjvPAfq+ZpSj5ZbY2mdHNNCe3KhHiF4Cv
	A+ieKhCaEPAUfTPBPCvhv5uvnHSpGxl592LIKlrqprfAKoACfF2Rt8WDhvhZqA3cPCoJ2ofBnghA8
	PpQncyiDG48OskbNXWNt4qGoLQAT9LjaLe2dW9PgAZ/Usfigy3bY6jY844h0/gMMUN7zzBWlBSaSJ
	e0RwXBY3H7YDaJPICVIGbLuRze1cN5R5bvvQUv3KRs2Gpd2O3jkgD2lGZD/7uDlKbnQp2biegAFXS
	KVmcpTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgEY-00000007T8M-2ygf;
	Fri, 03 Jul 2026 15:55:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgEW-00000007T7B-1Jmq;
	Fri, 03 Jul 2026 15:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783094117; x=1814630117;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cq1Ia3qvLUfw4q5EMv6IoenPZeED0efv9NXSJ21ATOU=;
  b=MlXcr1H7Ntxx+Q+oazddXQvsohBjonar3r8Sy/motGPh0V0t7uTfsFp8
   rPaA0GJxOf4oKVfhvSKTpmMx78HXAimIJXP40y5TMjJP1JTUTw1ht2Urw
   8RI3LkgxQCe5V/n8T+FUoWcwvjDUkalNjzsQxdDXyXas8xNuTnkDfwP5y
   F0f0dRKgMFZjEJKOQ7yHB9oWEJ4EiRo4TzSciAW7lDcDf+upKN6LJi7Az
   C4bkVKYXxclIY6vdMduKoQzAoowGb1I0jkY7Mib8pM/NeQ5qFR1uEL+zx
   DTV7Gfdbis89P1939X7feLsA+mvdUoenEWJmqSbCFCQVVLHaU4pn/K0fL
   w==;
X-CSE-ConnectionGUID: 7F+7NqMvSKWMOg+2OOR6ag==
X-CSE-MsgGUID: v3xuvhg/RiqE64TPwgH/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="101268078"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101268078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:55:15 -0700
X-CSE-ConnectionGUID: oLdu9fgCSuiMMnx55b6/og==
X-CSE-MsgGUID: J19XKXXLShuzLXT3hrug2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277469485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:55:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 08:55:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 08:55:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 08:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBc8sJCnML5IDmpY1FhfxSPFexWzwNDaTeb56G+5GKSnpPEeEWCpUkvoyIvdYogq9+vbLLoYQgPIO1gDUZqN2w9R0wBjxSNAXmcdq32zm3AnvKBuz/YHTSLFEQ2OcHx+Nv/3NwO7iIm/xjW94zlNCBs+ajgyn4KqyQbpUPVVj4kPZ+GVyKipEOIU3jq5QiyivKo1919dWko1Ld3wuHNNPd10B+CFNnbfl0cmKmVW5cGA+wD4RqukXYlsszwyrjB11+eXm6MQIbyBVXa/uENGTLNJoqX3U6iTtq6BGQSONtncbHmnZJK2HgQfOmNNW5useH+I5+q7ZPwLhGBAzCbE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLnC1fvqtYHhE4OJmX4zSZE49yWBpb7jamm1qhs+wLw=;
 b=KuEoF8iIayzYVEjdbwywx8QWQTTQpY6tijVD8Swx/X4cuqny2uX6MGVFx7db8pg8M5s1fDYGMz5aKNq8o+oS2spIOMZq0BZ3gnj0DV0Eiv5FpcylTci0qzS0ApW9opnRGgnmqyK7ltUrdRVzo24kFlpVYtWLL1LEW9ssGEjgyZ5zuPabqO88zB9lwYSA/nLDvndkPJ4F0MpZurKCPfllVdMytO/lEKsBmw5ucemlk0HbN8YeIExHdB1Nnd4VlXjPR166pKV8R/oAWXaaP7hIMy5PnaAqkvNKV5dN0WrWwqphBpdvOqL1eIFKecUbquFuNRSyF8YMtaVnoZVj/Z5/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 15:55:10 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 15:55:09 +0000
Message-ID: <06f3ba88-f7d3-426d-8c95-612140fdfd52@intel.com>
Date: Fri, 3 Jul 2026 18:55:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: cqhci: Remove unused intmask parameter from
 cqhci_irq()
To: Chanwoo Lee <cw9316.lee@samsung.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, Ritesh Harjani <ritesh.list@gmail.com>, "Ulf
 Hansson" <ulfh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kamal Dasu
	<kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "Michal Simek" <michal.simek@amd.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open
 list:EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER"
	<linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>, "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
 <20260624021912.632627-1-cw9316.lee@samsung.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260624021912.632627-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: bc67c492-b91c-4b6f-fdab-08ded91b75c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e1+PL2i5Jctr83ODWUfxrlLhq7OVnktl0fhBrP/ZxY+7qY0GHO7ZbhUsjcw1jQkNSfeMvNU1la5Ti3T3cK07jRru5O2s3z6beO7rwO9azif1TsiqDXKoeQS/heh2H2bAWcyAzJSxpr4o5jmP9zHfKDJoOEPDA1wGCx6wr4WGgKtbMm93y5fhobzdPzmqQ8me2Rl9I8v4aSqiQxBAUVzDr7NY++z8WzAt8drcsIwMnX1AJDYQhrX9UxJGZK2URUF3jeDb9dcgtTKeImDre4GWP3eb7j/vZoSqMtVISN95iMjMVapGFmiKeiWKRTdf2AgHxtS98gq0PfEKY9CrPf/+kCxmwaG1GwQqzbp3aeRNye70a/yVqd70IofZO5s+CNkt4DYSmmTH/b/niyQLXy7fe2rmin5AA42lDdh9YM9eGC+lM4VUGY37RL1yQQ4t6WxOdMNujhqEEz80fJQUhRaNubftpPCo7W2f9eUvoWeO3xU367dC4kJVM9DfcdN2w22fk91QHpSdU+rkyyAGugWx9kZe7jbv9LqaP/xcq8LHs35gFjf48byx2DazDxuKUd90rTvxv81PG0zJkgD+ovjAXU74df/HMr6a0KkkFP7OSfyhrYXzyAF+ejIAkINDYzIWxPalN4h65ZUktPoKK6ShsxVb3RP/jpRXDgBx5oU0RVT3dk14+858e6262x5WwaheGeUI3ZIdQ+dCG6K8jZUeeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dNOFdZSGt2cWRTcno2M0VjdFN2OXp5ZWpER0VEM01vTW5teXpsYXV3R0Mr?=
 =?utf-8?B?OER4SHJYeG9Jc3dxZEgrMXhNTjVNM3ZsaUpZaWp1L1AvSjBrUzRDYTlpbXZu?=
 =?utf-8?B?dUNWMC9ZREk3QmJ3czFHUzdEVDEyUldDclZKODUwcG1UMzhNcEpQa1Azc2dM?=
 =?utf-8?B?SUZNRGt3RHhDbk13Vk5BdnM3c0tpWEUxekV2QU9OdUcrbGFIQnVPZkhaS000?=
 =?utf-8?B?Tnkvd2xPYXNwZW0xbGhCYkxHOHFKNE9hL0JUTkYwclBQRWg4cWFobkZ5OXlT?=
 =?utf-8?B?ZGdib1RZS29KZ3NITzdKQnhuRHhBOWJZVzRqWGpkdmU4VWRSRmhOVEZPeUhl?=
 =?utf-8?B?Qjc5bVpUMk1jTUhZNmdkR3ppTVZsZ0hsb3FXc004WmQvZ3dqbksxUmNSQi9u?=
 =?utf-8?B?bUxyajloOE1nUmN4eUZjS3JrNEZTUzJQMHZYWFMyT1lmSHIyNEFDWnhYdXdX?=
 =?utf-8?B?Z2tqSUpDOGYwcDFScUZJSjNrUldTYktUR3hFdEdaeGFlT3BwYm5lL2FXZWZh?=
 =?utf-8?B?Mmd5aG5oV3pWMHM0dFV6d3pZajZiZzhNVEZjcFp4c0xKUUVkRkxaRWIxNnAr?=
 =?utf-8?B?UlE5dUVDc0VCSWFxVXMvYWY2czFlY2VZdTdWM1RpVHJqdC9sSSsvOFJ1UjYr?=
 =?utf-8?B?bmp0NVJ6NTFaSXVjQ09rN3JOU1MxMC9VYUs4bWNSY05oMUtUaHlhT2M0ZEIy?=
 =?utf-8?B?UHo5WXNlZCtxdWV4UmJPRi9KdXVVOXBSNVlKenhmczY0RkozSTFSVElSNWZ2?=
 =?utf-8?B?UW52UHhOSWRhS2Q4L21XYnMzZVZldlZOa0RpNnNDYm5wTXdHOGd5VDFSN1Fj?=
 =?utf-8?B?M0N2V2VtTkhiZE0wRDliZzRNdTBlSGlxdVNnandFd3B1OVFicGdZak5NSk95?=
 =?utf-8?B?UmVib1VWa1R0cit5ZG5QZ0dtRGMrUC9RNFFhckhNaUNxWEJJWm0vOVhQb3JX?=
 =?utf-8?B?NDIzQnI1R0RZR2VTUEI5dFd1RTNjcjlaNGR0ZmVqSGZVWjZIL1Vva3RONG91?=
 =?utf-8?B?ZDI2Y213SytsbkdhZGpzeTQ1NG1hWkFHVmczMHd5dEordkoyZWFsVC9JSWFw?=
 =?utf-8?B?d2FFbmlacU4zaCtXRWZsRWJJMHNJVDF6OGtXNkpZMllXWE1GeCtZY2RJYm43?=
 =?utf-8?B?TFl5ZFhmdzhJcmlpcjEyQXhQbSs3Wkg4bStoRzhQc1FOTUxqTHBJbVFQZHRq?=
 =?utf-8?B?bHNwbkpKOXYwbFBseXh1V2k2OEYwQ3Q1UkNnRHZUTzZyRWluUGZtOUhPaTI5?=
 =?utf-8?B?S3J5OVk0aEpxSzZwMzJ0Qm1yVmw5Zk00eXozS29NNExkUGhWWlVVU2N2RXU0?=
 =?utf-8?B?K05oblYxSjZIK2lBaTR2dE9mK3YyUUlEZk9VYjBHN09paDZIOWJkd0pPb3pF?=
 =?utf-8?B?NWI3M0FMUzlHbjZBOHFQRXFFazRCUFFqQ1kxbEhMSWtjNkxaV3Y5cXNLK2lP?=
 =?utf-8?B?SEtiQUNSWWt1elFiQU5nM1d3VWdhZWZXRnZjcTdtcUpKRUF0UDlkbTAySTZw?=
 =?utf-8?B?T1ZJNW9TMlFlMlI3bkFhM3VGWnVMOXh5Ti81Y0x0MlFmaklwbmRIZUwyOVFa?=
 =?utf-8?B?Z2hlRkU5Nm9yazRvWmUraVBwM2hEMUt3Vzg5S3htejJCb1pYRi84V203V28z?=
 =?utf-8?B?THFtdmRhY3EzbWdhRkp2SEZWOFdSQW9JR2FBQVNSeXU3TkhwRHMvTFIzM2VP?=
 =?utf-8?B?OXRGa2dIRTJ6WE1jQisvZjFwQ0s3OWhvZ1VSM2tmTHFrVXpnOHR6Vkx4SVpD?=
 =?utf-8?B?aVJBSVF1dzJpTkx4VkdOZlNGTDBXTFU0ZTBUWmcveUhVMHR5SjN5WGFkeDVO?=
 =?utf-8?B?RUNUdlNYenNEQ0pjZzIxWVRjK0x0NEN0TTZPQ3VZcUErK2NaTW5kbXM4VkpC?=
 =?utf-8?B?N212UENpaDZsNVJMSnFDZXNFeXhDQnNuWjcvMXBmQkxNb0FobE5BeWhMem85?=
 =?utf-8?B?UUFoMHRyTEVUeXAzK1RBRjJ0aHBNVFZ1eUZnME51T016WVhraVFxMjgrYzV5?=
 =?utf-8?B?djdSNlVYNXdUMjdjQ1Y2cWR1QUhtK0FlalExOXJYY2VXMnpFNDY2QVNKVjFG?=
 =?utf-8?B?ajVSSDlLbFg4N0VxMU91NkJ3aWtyL3lIS3lpMmNuakgwYk14TkhvTUlEU3N0?=
 =?utf-8?B?Y0dOVFFqaVhweWlQU0EyYUdVM1RYQnVSUEIwK3dEUHc0c1QvVTkyVHJJb1Fr?=
 =?utf-8?B?alVrWkNwaTArcmdoUzhXOGk5RkhMU2pKNGh3U1BEazlZZlNrTUZwUlZNMmE5?=
 =?utf-8?B?YWowa2h0UlNJM2FBbC95d3grUEZmb0Y4Z2RaZ0g1R1FLV3VWL3owQTBmSlV3?=
 =?utf-8?B?WVhNZkdMcUZHVnNZYlgwL0xjUkhSOHhKLzdmV2pTYlg4MzFocnlPaFRxMWNX?=
 =?utf-8?Q?z9sYXangddC7gYlk=3D?=
X-Exchange-RoutingPolicyChecked: p2NJIiNu2PI6pHVUeIdvoL1wyD2jjMU/HczxvLzEo6CFFfS03Xxjf44wXt5NlbApP+6hDmIjfiGJuGKdRATqQ8APTxde5ThjsrPRZEjPehLMuvsrGcqbOg1robj28Mi1iE+hmHgrh79lT49gLipkRSsWEqKGfvH8ldH7WAEtAZQynLNtAT0VCsUpTQpgkyhLUzxl1VXkZGyiEpp0yxll+M0IKNkzl1jWz344BTfJLw6++A5t17YIN7mVqBeCNKu9qFQCi0T181QVUqUvSNhRi8/nlZNVxH1mOL9Zq/YAfzTJ2pqF5M4zEF3gpHwfCl2Tx9Qw3v3iv2zCQ3K8FtdyXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc67c492-b91c-4b6f-fdab-08ded91b75c7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:55:09.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9awrwnDcrx4203xZWzpIsmE5Bh+GpeYGplyaPa6lWtDCzNkrbHFMQPLnqogbqKVYmiB+rEErgyZ5tr8nj+jRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_085516_457998_8994ED37 
X-CRM114-Status: GOOD (  15.38  )
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

On 24/06/2026 05:19, Chanwoo Lee wrote:
> The intmask parameter of cqhci_irq() is never used within the function
> body. The function reads the CQHCI interrupt status directly via
> cqhci_readl() and processes interrupts independently of the SDHCI
> intmask value passed by callers.
> 
> Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/cqhci-core.c       | 3 +--
>  drivers/mmc/host/cqhci.h            | 3 +--
>  drivers/mmc/host/mtk-sd.c           | 2 +-
>  drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
>  drivers/mmc/host/sdhci-msm.c        | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  drivers/mmc/host/sdhci-pci-core.c   | 2 +-
>  drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
>  drivers/mmc/host/sdhci-tegra.c      | 2 +-
>  drivers/mmc/host/sdhci_am654.c      | 2 +-
>  12 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index 178277d90c31..98ceb0b9a6d1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
>  	mmc_cqe_request_done(mmc, mrq);
>  }
>  
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -		      int data_error)
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error)
>  {
>  	u32 status;
>  	unsigned long tag = 0, comp_status;
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 3668856531c1..8fbbc48c3f85 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host, int reg)
>  
>  struct platform_device;
>  
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -		      int data_error);
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error);
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc054bd..01ea3adbdf3b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
>  			cmd_err, dat_err, intsts);
>  	}
>  
> -	return cqhci_irq(mmc, 0, cmd_err, dat_err);
> +	return cqhci_irq(mmc, cmd_err, dat_err);
>  }
>  
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 57e45951644e..1de2f05fd958 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 18ecddd6df6f..d0fa83f67a80 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9..ceed47ccfda8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  	return 0;
>  }
>  
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 785d3acb18c5..4ca73e7d799e 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index eef53455b8ee..4c5fa6a6931d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
> index c347fac24515..b121d896a804 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
> index 6e4084407662..b55618566d65 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 820ce4dae58b..221e48b59f48 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index d235b0aecfdb..2a27db2f558b 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }


