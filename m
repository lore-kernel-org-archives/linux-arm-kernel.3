Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA2ACED240
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glLArCmpxbVxqkP4lNjLiQqJzWiW1o/+bOweTa5PUPg=; b=LEvyR+cPUob8gRThcDm+vAQw4e
	YFl1ctUekTjWVMSYi29FoVJgO0GV1Dp/e/+OcvAgMCBQbpxmzSrUwxKo1Qw5+MLiy6vdPgvIdlgMn
	+J2NEWWJQF2t94B+p8PfzicH0j+BrU2Sj/52yjrS5c76gTgYF6Cv6GH3u4vmBiHrtZYiLpGGEBqeO
	pq7jSJRGQDXfOdFyf9sA7EI9HgYiEDgw0tecxWuuVZrRAHHeUvK6EPoQnheq4ziaKdKpormJDtvXs
	ECu+PNGc3+dQpl+R5+ilcfyxBlR2lVLX/8L3iEKdRgji/2niFV6s0GvD/+PLg4Ea54X5ldvgohWIb
	1MIOO6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEAA-0000000HQKB-3OaM;
	Tue, 18 Nov 2025 05:22:00 +0000
Received: from mail-japanwestazon11010057.outbound.protection.outlook.com ([52.101.228.57] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEA8-0000000HQJO-2Ymu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 05:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x32pr2+6P+/SI2j3UkeLb9pWDVYVmMYWb77s0WFymrEJhzuqyL3VfXrWmWfGrZTuwio0A5gPqx+YXnRqwZdSaat3DJOZgO1gn3FyYRmN/0Z9VmzEUjnUIUbphcBUxtR4GLBVY3wcdcDx6bl3aKG+hb85UPC291AzNnwxZ8YnfPUl8otCMb/3wVxtOIGcueduV8/v2kyADvYjKObeifxEaU/uoyjddZjUYVV0t9hyzs6O2By4e/JqzEdjJ2/fRQEQPRbzpsjSlxRs4INkcGbJCNc2jCle3The5D3aAA8WPNk+c8j53XW5NjT9CEruTVPk7rhfesiabPaW2Ov7QWN6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glLArCmpxbVxqkP4lNjLiQqJzWiW1o/+bOweTa5PUPg=;
 b=rH8G32sRm3F2LyJzqqNO7sfZFKk0M4BQR+w7EH9llPaAR0RIHog5qcJWEmXxZN/3t+/nQNmH/KtzGsqh7Ndu4SVgDti0LXRQX76jtTIRDW71Q88vAYqh+Q7uhdposTalJprG5Z7aRzeiX40yH/HI4+P3ht5kWZ7oD9gBr04yrsUn6Cqi6GBLlRV20HQuSR3znBIAlWxo2VkqvlngG6slETlDRvIT+IOUnX2Ad+ly2F240Yg4+i5ZVzPLlxIwWRDkMZlGqBgWji2ixjtTiSvx58qY4HwhENeHTSQgX68h6d6IxrVxxFoEcfRecokDhq+5dEP59u6kRSyHllPEYm+v5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glLArCmpxbVxqkP4lNjLiQqJzWiW1o/+bOweTa5PUPg=;
 b=NLhiNR8aUr0Dg0Y2nX0DAJPaTiVGwvDJLauOqsgiGp16RndS2MO7WVMVhxHtme+AKtrpnSqi87rx0CDACHxuwiC0xZfWBm0GLOI+z4xHc+p55FZ+XHeEu3cUu7DvCAe/TfB/uS0oXLQBJUra8BzdFgnXGfGcaIZd+9zeMk1AA5GME8CQhfySSZQ/Utbt8mSRTlsI2Y5RR3uo98dBQt110L3yfnSqohKLO9ihEDFnPP16Dyeg9d2Tr75Lp/Zb11c80hvTBrsz/sodzlvo65B7Enw48EVGKpDKZ+oUZQT2PTWFee4FhJiFcAPYipPEXDWMAvdkqBOVEO0iyVldq7HIIQ==
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TY3PR01MB10237.jpnprd01.prod.outlook.com (2603:1096:400:1d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 05:21:47 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 05:21:46 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Ben Horgan' <ben.horgan@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>
CC: "amitsinght@marvell.com" <amitsinght@marvell.com>,
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dakr@kernel.org"
	<dakr@kernel.org>, "dave.martin@arm.com" <dave.martin@arm.com>,
	"david@redhat.com" <david@redhat.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "guohanjun@huawei.com" <guohanjun@huawei.com>,
	"jeremy.linton@arm.com" <jeremy.linton@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
	"kobak@nvidia.com" <kobak@nvidia.com>, "lcherian@marvell.com"
	<lcherian@marvell.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peternewman@google.com" <peternewman@google.com>,
	"quic_jiles@quicinc.com" <quic_jiles@quicinc.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"rohit.mathew@arm.com" <rohit.mathew@arm.com>, "scott@os.amperecomputing.com"
	<scott@os.amperecomputing.com>, "sdonthineni@nvidia.com"
	<sdonthineni@nvidia.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"will@kernel.org" <will@kernel.org>, "xhao@linux.alibaba.com"
	<xhao@linux.alibaba.com>, Dave Martin <Dave.Martin@arm.com>, Zeng Heng
	<zengheng4@huawei.com>
Subject: RE: [PATCH v5 23/34] arm_mpam: Allow configuration to be applied and
 restored during cpu online
Thread-Topic: [PATCH v5 23/34] arm_mpam: Allow configuration to be applied and
 restored during cpu online
Thread-Index: AQHcV+P7MCrDq1Ig1kmxsuURvMKf37T35gAQ
Date: Tue, 18 Nov 2025 05:21:46 +0000
Message-ID: <OSZPR01MB879875DEF61C8C410A0448EC8BD6A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-24-ben.horgan@arm.com>
In-Reply-To: <20251117170014.4113754-24-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=7a2a79f4-f195-415a-8f32-35bffee8ebf7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-11-18T05:19:19Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TY3PR01MB10237:EE_
x-ms-office365-filtering-correlation-id: 6a955dd1-5f86-4a51-100d-08de26625e9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|1580799027;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?U1FBbE9LenlXRzBRTVJUU25UK0VmenpBY3Jsa3BiK3huWXdEUFZrZk9J?=
 =?iso-2022-jp?B?KzB0dzROSnFaV3QxNWVDVW9FYVI1Mjg0ZnRRTk5DUFY3U0YyRDM5c3Y4?=
 =?iso-2022-jp?B?dE5vTlJXUm1oUjRxaHZ4MWlXNkRsMGlpVVRhUlNYajd3ZUI0cjJvajJh?=
 =?iso-2022-jp?B?K1dEa0dISkNnaUFvUkpYSXVEUnlpZDEzMlhlM0U1S2N5amUzNytmcyt2?=
 =?iso-2022-jp?B?aE9oNit6Z3ZXSGxMeWgzMWxBQzd3bU5hRGp4Qm4waTVadG4xSUpoTEdT?=
 =?iso-2022-jp?B?dGpKUWpnR3BJSkk1Q2o1RXkyYWVJM2toUmJlZmhGQkNuRWR1OUhaMWNQ?=
 =?iso-2022-jp?B?RDMxcExGSkFFVUd2OGt4Y1lXR2RJVXk4QWloWHdudVNHQTQ0UGZ3TmU1?=
 =?iso-2022-jp?B?RXF1ZWVYdzJUNW1vcXhNSmw4bnFmOEw1OElTOUFZQWJBQ2t1NEUvM2RK?=
 =?iso-2022-jp?B?aVJDemxaMVVFSlZaenBWMWE2NjBEZHMxL3d0VS9XdkxQZExWMFZCdzlL?=
 =?iso-2022-jp?B?V2kwU0NmRmcrSVdPdkVCR1JaSTRkZVBIYmpIUUU1bWVDZ3QvZk9jSk9a?=
 =?iso-2022-jp?B?c2ZvUlR3Mm5UZFV3Z3dTbUN0UEZEbWsxbnM4WXlzL3RkTnNmd3dvdnR5?=
 =?iso-2022-jp?B?aGFSOVVaWkdvdmFWR2EwTExENnRHV3cyR2R0cG1qMHJXZzNaRzdzbzFK?=
 =?iso-2022-jp?B?aGFZZVpwVEhPVVp6ZEN4RjU1TzRxeTlzZmx1VmsrNDJxNVJLRzFCQktW?=
 =?iso-2022-jp?B?T01mNzMwWjRvZ0JnN0g4TGpYVGFBMGcrTjNrejRXUjVlU3JKeEtvVFll?=
 =?iso-2022-jp?B?T09vNCszdkdLeDFRd3V3M2puM2F6SXNrM1Jkby9sMnFXNzZZNmd3di9l?=
 =?iso-2022-jp?B?RmxhZUgxVXh2MkJ2cE1mZlB6RkhOQjVHTmtDVTlnS0szRzlEeXNpTVZo?=
 =?iso-2022-jp?B?SEw2U3dXYTRzTUw2UkZPKzNuZEJKeVpNK1p6c2FGanBzWk9LTnJJVkVY?=
 =?iso-2022-jp?B?ZXlRdGJUMjdiT1gzeERJc3Nocjh6WFVSWWM2eVdjajlyZXlBcnNJQXRI?=
 =?iso-2022-jp?B?dkFITEZIMWdqSTNHS3NmVjhvQmRzSGwwSXdPY05aUEJrRG5BNU9iQW1w?=
 =?iso-2022-jp?B?VktuV0tKZk1Hbi85Rkl5eDlmK2pzMklvdTlqKzRNYkRRbUhscU5zY3Rn?=
 =?iso-2022-jp?B?MythVTBYMGdpMTA3WUlVUENUbDd5V0hEdk03QkJDQXBjZFdLYndVWjdh?=
 =?iso-2022-jp?B?V0JTQlgrdlMyRDBMRUJFaFNLVnhDQjlZQjNtWTQrWG1yQXljNTFrcmUx?=
 =?iso-2022-jp?B?N0ZWWjh1Yjd5ckpzL2tQMlV2bEovR3FtTnZKeHNqTkx3ek5yR1grNzVY?=
 =?iso-2022-jp?B?M3p1elVEdm1DcWxtVVBhNkFva0F0Z3FiWnhrSVc1Y1MxR24rTEp3MTdT?=
 =?iso-2022-jp?B?RGpscmtqRnB3eTRvQ2RseWErajg3STBZUHBoK0grV2wyay9CaDAreEdt?=
 =?iso-2022-jp?B?TDkrb1RRTFFFazJkc2RVMElOWUFKSDRyVDBrUjlXc0RYaW5SUXdVb1Zv?=
 =?iso-2022-jp?B?TWEwTDE3djh5dkpmN0tRMVEzbmw2VHpwRFg0UTdxZmprTWZyRGZQUG0y?=
 =?iso-2022-jp?B?UTlESW9TV2J4RU1LQis2RHR1OERubFZlbEJaNzdaeWZiUkJKUitqbEhG?=
 =?iso-2022-jp?B?UXBJZE5FcWtDb1NzS3ZMcVFXTEJFOUhSV1o1MnJkZ3hWQ0dUSktZbStS?=
 =?iso-2022-jp?B?R0VHeWZhTko2aW0yKytlZllSeXdpVyt6dmxtZG1kcnh3MFRRZHRvbGQ4?=
 =?iso-2022-jp?B?T0x0TVJ6Q0tndGNGWFNvc01CSFE4UFlJdDdmRUtKZTMrNTgrdTBFOG9M?=
 =?iso-2022-jp?B?UGlCRWxTN2hFVG9CL3JLdUpVT3lid2d6MURxeVNzNHlCbDRMVEd2d3pa?=
 =?iso-2022-jp?B?dE8vYWRMdVQ4dUdWVy91UXplalNiNFJ3N1g2d0tKQW1hSHptZHRYb0tQ?=
 =?iso-2022-jp?B?VDI1RGc0Q2lJeDFMVTZWRW5XRlFNMHlualFzZ1J3ZTlMNDhYTy9xNFla?=
 =?iso-2022-jp?B?NjhwRExtVkkxNkhpRWFpTEswck9zV3RoeXNwQnYwblQ4QnZtQVhJQ1BD?=
 =?iso-2022-jp?B?cXdzeFlSUGpKMS9icXNSWkcyeHRJc0FtTjB5OVBPMXZ0SmR6ZEhyWWVr?=
 =?iso-2022-jp?B?UVR4YldFVExKNXpyejYrQ0ZJMmhzNlJaSUpqMjFwaXBpSlhvUnZic01V?=
 =?iso-2022-jp?B?bXFXdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?aTVGZ2VhSnlNNTJxQ3Y1Nm0xQkhicCt0bWc4Y1lWQjNRbGJuVEd5RGpL?=
 =?iso-2022-jp?B?VFZvaFhXckFzR0JWM1laeHdkV1VkVXM4OFEvaXBYdjVyRzFNQkk4U3Vh?=
 =?iso-2022-jp?B?WFM2SmR1cm5DdVZQSE5aN05pMnI5NHBCRE1uSVFmVkRKRE80dzlndkxl?=
 =?iso-2022-jp?B?R2ZRM1BtZ2d0QTlOOEdyVXIrbFJmNFFIS1J4RE9YK0ExUXQ0RzNwWDdu?=
 =?iso-2022-jp?B?bklFWmowWWRISnJ0OEIzdGJITGcxWDNNSEdUVVQ0aWtzUGwxMkdZUGw0?=
 =?iso-2022-jp?B?SXZWYjY4SFRwc3AxRStyOXdGb1ZBSjRYNklMRHFKcmlxM0FoWkpyM1J3?=
 =?iso-2022-jp?B?dmIrKytWLzI5Q3hkTm14cHUrdXdOVWhsT1Vadm9YU3NnU1E2NXdjMUxt?=
 =?iso-2022-jp?B?Z0dRT3hqd29Wd3VFVlc2TjlNZmk5dlRpU0Q3L1ZZaGdXUGdoT0tFS0Qx?=
 =?iso-2022-jp?B?NXBabHVQM1VQc2Yyem5XckVzalZSS0JqMlh1RjBIY0J0WXMwVU9TUzNS?=
 =?iso-2022-jp?B?OXlmR3RFTTU4NmIxN2xiWW5LUkFQOTVhUUR3VzF2N0VQSjBPSHBuU290?=
 =?iso-2022-jp?B?OHhxd25PTU1CTmlEOFdXOVlYckFxbi9PUTZyVm1YenZvRDA5Y3RWNk9S?=
 =?iso-2022-jp?B?UWt2emkxRkQ0dlM4OGk2Tno4dEM2bjdiZ2FCbGFBWkM2a1J0VVBTUUZO?=
 =?iso-2022-jp?B?YUplTk80OWhhaW9xTTBjaFlpQlM3ckdYVjJhYU5NZERKN1NDT29YMytN?=
 =?iso-2022-jp?B?LzFiK1JQTFJVUVJvM3k2Yk5MQUpsMUVJWkN6NUZBYXBwMUlZQnFPY1hD?=
 =?iso-2022-jp?B?OUVON21HWDdnSzhGcHdmODNyMWJ5TWZDSVAwaEJrTnNQVWpYV3BDMkJF?=
 =?iso-2022-jp?B?bGtqV01NeEtjc0owekRLVHVQVmhyS29NWEx2dFFYRGJ6ZUQyeHlzZndZ?=
 =?iso-2022-jp?B?OVhPMGRyUUowMTFlMjdmT3dFdVNaVzl4V3cyR3VIbkM1QzJtQzlzTXFX?=
 =?iso-2022-jp?B?VTExQzFnZ0RIUkE2UjVIQkl5ejkyalZnUWxxWWE5ZnNmeHZjVnJoY2Ix?=
 =?iso-2022-jp?B?MnAyZGYwaFlCS0JTemxlcEM5cEJnaWU5cUhNUE4yTnRHZ2xINjl1OG53?=
 =?iso-2022-jp?B?KzVmZldMTUJ5ZWgrdVZ3TnM3a1VzcDlWb01FWktaUkpJc2grTVlzTzVm?=
 =?iso-2022-jp?B?eDlxOWwvcDJoak5SUmw2eElXZEs0UGdOcDFRMmdBZVYvZ0kvM1FCUXlW?=
 =?iso-2022-jp?B?U1loVzJ1aktRRm42RDA4SFJhOSt1cmt6NERabXhpeThPUTVwRFIrSm00?=
 =?iso-2022-jp?B?UHVXWklkS3RPTll6VytNcklIOEVOdEZMWUNLWUEzZUZKV2dyMmJLMnIw?=
 =?iso-2022-jp?B?ODhiVGcrZVQ1aFd6QzBIejFIQ3RUU1NYSEd5Y1Z5SVBpcHYzRWl6ZUJJ?=
 =?iso-2022-jp?B?aDBPbElMZ2t4UElGb2drcXhZeEIycVQ1QWRIQm4xSWVCS2pnNUFRbDFr?=
 =?iso-2022-jp?B?T2pMbzFBUk9IZlJ3aUV2WHk1Ri83azZNd1p2ZmgrOVl6aHZaaDFFR1BC?=
 =?iso-2022-jp?B?MU1RbWZUZUZOTEZSU1QrbGNOZlVqRVF6NWJVZE5vaHAyVUJNVkhvaGFz?=
 =?iso-2022-jp?B?WHZEM3RQWVRKaEgwTCtCdllhdVlMT2NqYVF3UHZWdG80MUI2WHJiR0Qx?=
 =?iso-2022-jp?B?dVUzZ3JBMlRwY3JmczA1b0kwOXpnT3hZeUZPV2cyejV2RVI2S1pHQ2FJ?=
 =?iso-2022-jp?B?V2NVTThEc1ZmN0FPdkdoRnpGaEpCeG4wZksyMml1b2hPKzNWYmRwL3Mz?=
 =?iso-2022-jp?B?Rm9FdW5ib1FJbjExcGJIUUloL0hYVC9IcndHWXZ0aHNFbHhpaUM1V1hE?=
 =?iso-2022-jp?B?YWhhaGpYT2xBV0Q4YlFFeTJKZzRFdlJvKzd2Q3M2REUrOFBualRLOTVC?=
 =?iso-2022-jp?B?ZkY2T1g1bkpxcVg5VkM4SDFNUk83RWdqNGxIR2lDR0R3d0h0QUlUQTVY?=
 =?iso-2022-jp?B?YXJ4bzdFaXlMNkxFeTRUOXF6V3hlU3Z6RE90alRNc3M0VXB2T3R6aXoy?=
 =?iso-2022-jp?B?cStjZWZyRGs0NXlBNWJNSDljaFZzdEIzNHBWWituM1hwV1ZFRzAycVNt?=
 =?iso-2022-jp?B?MWNsL1hQbTkveE0wZSt1RnI3Q1BEZjRXOVZPbk9JOGxsalN3NDFFc1h3?=
 =?iso-2022-jp?B?VHZRK3NMS0ZkM1dUT0JVTlJ6N2dhUENHWXJYelZISXVNdEhUZE01eG1n?=
 =?iso-2022-jp?B?Tk95dVBUYkZ6VHZiUjFwN1lSdnRxSkpiNEN4ZUNrUzc0cWdDTm51aHZN?=
 =?iso-2022-jp?B?bFYzdERlS0Rack9GWFo2Mkx5RHBPdGJSOVE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a955dd1-5f86-4a51-100d-08de26625e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 05:21:46.8773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YmVFkh7a4D4znwOfDvd6HDgDuAlmqG/RxfOECBihKxgSA/JS1UMPET4khyyV0/yUgeAvR0KpgMh3bcw9jBmRLgK2cTne9cqxVE8G0w2giU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_212156_658411_03A597B5 
X-CRM114-Status: UNSURE (   9.85  )
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

> From: James Morse <james.morse@arm.com>
>=20
> When CPUs come online the MSC's original configuration should be restored=
.
>=20
> Add struct mpam_config to hold the configuration. For each component, thi=
s
> has a bitmap of features that have been changed from the reset values. Th=
e
> mpam_config is also used on RIS reset where all bits are set to ensure al=
l
> features are reset.
>=20
> Once the maximum partid is known, allocate a configuration array for each
> component, and reprogram each RIS configuration from this.
>=20
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Cc: Shaopeng Tan (Fujitsu) tan.shaopeng@fujitsu.com
> Cc: Peter Newman peternewman@google.com
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---

Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

