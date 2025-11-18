Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544BCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 03:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWvkH6aaAV6xs2jRUTJfBFN/YJbDZyIkCjfsTGPWD8c=; b=gB+G05X2HAObQjYXkeUsIbydTH
	1I3WXx6o00adgqqY4C3fJhrEY5nCOFMnRlNK33CfXv3eRv67Kl8UJxoT7lwCu+viUMMCGR171hhEk
	Qd7Ylw4UT2SX7Ix0SdGNTbM8XWO+O8Mb+fzQbwT52E4yegXUIchIGvAXUKw9eFdqtMKQ6819R4AIP
	j8+b9I9Ig2Sl2p1RaLNu3z0qXXtE9h3/lHvgl8Pywrz4QnD873b947ZHSCVJtpaTcQBcwlCAaOhcK
	rVVVPSIxfPiq4KnWpZ12Tmk+XBQi3pfru1En7Ei5SknpWbDAXl+XCJ2iWR0EM4NfhU591cT/us0Mg
	gBNRkcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCPm-0000000HIjJ-0yZg;
	Tue, 18 Nov 2025 03:29:58 +0000
Received: from mail-eastusazon11012016.outbound.protection.outlook.com ([52.101.53.16] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCPk-0000000HIis-0fLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 03:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9IhJccLHRyVesxFsbTPW6bu5BN/OpfrGhUe3wpRU4DCupYniToYnjMxzUwqbuWXosW9YTtaWDX29i9uuostKjIC29veIH72CAmvG/D6ZdPbQ8ngWkUbcJQfsKnB/0Rn3BAH0LgYjmC5GWHv/UcEeH49X5KFz6qlOvmB57ESJCN2sVaubceYQW5gatGQS90eCNPyMc4TMimLoh42lLX51teOMboyJ8h2ehBllZAUqZnMPUPOT8mi68GjBUFYV2JtFz34hX9hHJ3X+rNmalpdB4bmJ7PUd7W7x1cHBwYnRKsgXYF7veJn62lgep6vWLBr2Ex3zf8PfaKW2c+RGSz3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWvkH6aaAV6xs2jRUTJfBFN/YJbDZyIkCjfsTGPWD8c=;
 b=PMkcMxQ6cSU9IsPRlPc1NL8U9s9k7JfJgQNPQYcMGBEHhtVhGSxnaTsoip3yE7eHeeR/juf5Tfx2bw29ZKJ/y1ZWdajAm0KBOGekchbe75M4z3GHdIvPSYmfeZ0nsHpyEGzzwUCqqVabnHdl1/tIY63ph60tPxvYUY9lz2FsmBd6e1Q5M72s+PKFaXSRWaco7SqOKHb2gZnHXe/+uYU2Z5LoyK+teH2kpGhniLdb15yUr0sog/fgCPu/tVylvUBKcQwaUo/VJWnIiK41IrHawi0td1FEB3hWncXvan54zyT5WpKFiMmy9LrOLl5INAZtCLx9CBpWhtYUwAVChgeTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWvkH6aaAV6xs2jRUTJfBFN/YJbDZyIkCjfsTGPWD8c=;
 b=Q001QZ7l6j1ivoY3p38qys4Gb6jEHQlkMSMmxZL1sbYziNGqr6MDENzOgSLXUPqfjOC0yqvNPV4eiIGUuakWzcutSpeiyA0cM7sWkrVeaslJQTVCAYJ/mDZYxSVB7q4P1//sDHuGt77yNsBqYNni6RH1AYbeQFl+YAHAuYLjPtYgJ9gHRvUN0phFVcyRyC9WpkI3sZ4I+D2iFfpbZXorg9waZvOeGAAVLO85haa64FedfG9KvRvwB97v+8xXDU/Wei46tdX0G5KxSXW47/6Gw3CA+Kpsv+7Ie0A/YujEUNssTJlXjqhSOECp8dm5BjSdaAXg4zsjuOqvecD1MNJgBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH1PR12MB9694.namprd12.prod.outlook.com (2603:10b6:610:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 03:29:49 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Tue, 18 Nov 2025
 03:29:49 +0000
Message-ID: <519e063b-468a-4421-a1db-4062eed0a382@nvidia.com>
Date: Mon, 17 Nov 2025 19:29:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/34] arm_mpam: Add basic mpam driver
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251117170014.4113754-1-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH1PR12MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ebd1ad-cc72-4a6d-0068-08de2652ba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3RwQTlodWRGMGpFM2F0Z0tOcFk4aFJyZTl3U2lVRVlnNGkyYjZOaDErR0hu?=
 =?utf-8?B?RDBqZ1lsWWJ6LzNwRGlEcVZIeVJ4SFlHU2JEKzZrVVBQU2syRGZOWFNhSkkz?=
 =?utf-8?B?aHBaNGpTNSt2NDNsNWlmRVJabXI1eTJuZ0dqVXk4aDFpbFYxS2t3OUlEUnpp?=
 =?utf-8?B?aVhaTHVneHFYa2xDK2dUeWhGMVNzVTlJUzVLWGdBaUV0Y3JBbEUxQXVsUlpw?=
 =?utf-8?B?WmZWS1F1UUNHaVZTaDUrRHA2ak5MK3VMMDVXSjNSdTBXeCtURHFCY3VxT1pJ?=
 =?utf-8?B?UVRPNU9rbmlZTlBublJ6N1BlS0RTbFFxWVVQREFoQmNnaXh0elloaVdnWWZv?=
 =?utf-8?B?VDdyTS9mWi8vS09kVTZjMkJHNmhxQWRjZUlPVzk2Z2NGMUk0Tk9yTm9BTW9i?=
 =?utf-8?B?c3M1eUJEZjhtUGNSL2VsWi84Z0tUblRneVMxcE9HYWlOUlpWczNUWjBVckVv?=
 =?utf-8?B?Y0NPbXJ0UlZZeVZ0bnVJb2JYSTFSaVp3bEZVQU05eW1oZ3NqRnNiWmxpZ042?=
 =?utf-8?B?VzZHMDFjSytYWC9WSFoxMkQ1SmZVTFZKZVFhZTkrRXAvaTBDdnBvMm5xTVMx?=
 =?utf-8?B?TVU2TVVqd2tTVkNDZFE1TStZZ2UyYTdiS2w4U1Z6bHZobTJXZWM1K0NVb2Nx?=
 =?utf-8?B?U3lhbDlVZlduVTkxTDZSdjNRaUdRa1JOK0xPVG5VS0psNHRZQng1VUVUV3Nr?=
 =?utf-8?B?ODNlTk1jQ1VqNWFaTW1PNWh3blFlLzRCR01ZcGFocFA3TGpiaUJ3S2YvUlJG?=
 =?utf-8?B?aSt6UVMxU2d1ODljOG5TOGE2QjNsMnloa2ZxWmdsWmpVQ1ZtdHBDKzM4VXFv?=
 =?utf-8?B?QSsrOHpzMjQ1RHZzNXp1L21NenpkbUZKdGhaU2VwSEkrdi9FMWI0cDIxRThP?=
 =?utf-8?B?Mk9rT0xJWjVnbVBoYkhzOTdaalA3VXpQYzRzRW5jSjltVlEvelpUZjJGUGVN?=
 =?utf-8?B?alNqMjFXOGxYbFNEdXc2d2k5dWkyeXNpZlkvRTFBbE1teERpMDBsUE53b0dS?=
 =?utf-8?B?RTRCOXR3clZUVGo2dkphV2VNNFA4STB6WlM1Nm13VXpJK1dnaUhlSmxoNnhP?=
 =?utf-8?B?cVpGQjdvNGJ3RDB4dmZ1WDhIRklGK2tBd3FxQWY0TzdoVVFiQmJJbUUrV3lI?=
 =?utf-8?B?OEpyamtmb1pZeTNiSU1FK2pJYnoxVlhYZUhFU3ZNU1VtZ25BenRiQ1hvK2w3?=
 =?utf-8?B?WEJuaXJ1dnpFM3RJU01NY3hMWHY0czc5eEozSUthTkJkbmM4RlNMdjhweFA2?=
 =?utf-8?B?SlJ6Y25KMktwQ2hPVm5ycUFvUFRjMTN4b2dnY1hxbUNxaTZpK09ZMXVqMitJ?=
 =?utf-8?B?WU1kL015dlp0a3lWQWFjT1R2bmVmQ2t0NTF3TE9JOWozbHVOK0ZoNTVlcmdS?=
 =?utf-8?B?SkhWbjFCMG02bE9IcFladUVXSkNxekFCYWVzZFFjTFlCZ0xzNjZ4TzhUbkht?=
 =?utf-8?B?NmJFdVNKdWVOQXZ1WWlTN1FOYkNxQmpMV3lhZk5nYmVBR25ldUVFNGpzL2dF?=
 =?utf-8?B?VmJjYjE2aVNaT1RhNlROamFTT0ZNS0JUblRPcE1FK3hBVnE0QUpxNVZyYzYr?=
 =?utf-8?B?SHM1Zzgvc3ZMTmw2aGJGU2xOeHovTi9hYTBPZzNtd0VueDJ0K0tUTGtjRzU0?=
 =?utf-8?B?MGpWRVBZcVo2aEJZTndtTzVUUnRiQzZ5dWV1MkYyeGc0NnB5aXVjQ1Q1czFQ?=
 =?utf-8?B?VGdYdjJYcVptTXZyQkorS0lJdWEwV1dzMlhzenFZZ1NMQmlvVEp6UU9IcnNJ?=
 =?utf-8?B?alA2YldpVmlMVmZZOW5lNytWRktoODJYOWpFZ0RNaGw2Qm0yWWVmNHQ2QkYv?=
 =?utf-8?B?N0pwSUhGeW1iTUx6cGVqckN3Wkp0YzY0eThDc1hTVU8rYWc3cDU0eWJuSkpE?=
 =?utf-8?B?THNCVG5aSmRGUFhhQ2VRejNodU5saVdSVkIzc1I3OU81VXdYN1BhSWRGdkJw?=
 =?utf-8?Q?EWtyFOeF1hu4+qU6IfiaPjkmU/Imy2dl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q24yZk55OVNSWHFjcC9nV2lNL3F3RzhCVENyc0tid0poTE54VUhuTVNHaGEz?=
 =?utf-8?B?aml6b0taVUx1amNGMlk2US9Pay9ySDVaRjF5RnZOYmtlbFd6TnE2eGlDY1Vw?=
 =?utf-8?B?K05naVVmbHN3OG5nZ0lod1dHa1U4TkYvUU5UdjJnWVMrRWxnaHJEdUg0cGpB?=
 =?utf-8?B?L2lrVjMyd1ZQdVR2VUExQjBHRHZScUhNcTkwS3VheHZxdWU3NWltWm5DODdW?=
 =?utf-8?B?cXVVYVFhT0I0NHF3dnl2OFpqc3VtajFjS3F0Q01DbHhYUlFIUDdGRC9qQjZq?=
 =?utf-8?B?SFNoWXpNbmZXV0FnOWU3SjhIdHRQWEFURndxWU9QeGtBOHdycS9hVm5SS05I?=
 =?utf-8?B?ZnAzWjBkdG9YbkJVY1lpUk05QTNnVHNyampGM0ZRYWtDc1ExczZFWjdMVzZ0?=
 =?utf-8?B?dElkbERSNEU3U2VUNmVvcnRtZ1lVcFVRdVZmczZXNWs3OFVPOGNLMnIzTXk1?=
 =?utf-8?B?Zi9rcmZLQUVDd0FMVmRBbG1ib3N5R3dCa0xwdTZQdUxQL0J5dVl4MjdJUjNa?=
 =?utf-8?B?S2RlTUNCd1hTRytUaWJ6cUdic1ZsKzR5WjhHd0tieVdNbzNIVHprT1MvWk1P?=
 =?utf-8?B?UzE5NEtTU1ZWMW9ENmgrK1FnZnlMUDQ3czdSZDlVTDhjRDB2K1hrRFZlbEt4?=
 =?utf-8?B?Z2xOR3QvSjN3eVRyN3Bza1NTWXhUL1V1eXdkS2hCQk8yOFVQSHhpYnBnWVEw?=
 =?utf-8?B?cnZCNk1INWVNR0lmZzZwbStyS1ZMM1pFTGFUZ3h4d21zU21xQjdoSjQwYVlH?=
 =?utf-8?B?bkZxcndzUi9Fc1JiRzBpOGNGYUtXY0paWm1NQUhZQ3JxQzAydk1zNXc1RjhY?=
 =?utf-8?B?YnJ6c2ttZW1GNXZZNkFQeCtVN1FxWmZ5UUp2SG1Fa0pVVTJwN3Y5YVRUSFIx?=
 =?utf-8?B?YlJ3d3lFNXhUTUgvWjJvS0lyMUNjb2Z2c0VtdVFsTm1ZOEtQOEZPRDZDVFNh?=
 =?utf-8?B?MWlEKzhRd3dieGQyc1BLKzJkUFJzSStjYngycGlXTGJDSEprMHVFaVpvdmZD?=
 =?utf-8?B?U2FROTk0M0dtWFVodU9PdlRrYWNObzZnczMwOGcySzAvVEw5REpFblMvU0RB?=
 =?utf-8?B?b1Fsa2loamJIcllsQjBpR0xnNnQ1SkJwZ1I1QnBubEFSUi9mbmhrZWRYS1c0?=
 =?utf-8?B?ZWJxSFkwRm5VTFRFTnkwdEt5MDEzbVNhcjlMcWlUWnEzODdnTG1ERGtlbktl?=
 =?utf-8?B?bndTOHNCbk90cEhWcDJMM0s0U2M1WkVQOEllQWpFemxZR01vTmJUcCtWM1U0?=
 =?utf-8?B?S0RUcDg5R3BrOCtNRDh5N1dxRk1mQWhJd1Yvc05KcWQ4V3VIRzdtYVVGVSsz?=
 =?utf-8?B?YmltTWN5M25OaDBXbWpTSXcwc0hmZDd1Rk81VWtSZS9Dcm1BK3J2MkxLMHNl?=
 =?utf-8?B?YmVhNWdTUmJ2NzhMT1R3ZGV2b2czajB4eEFNb1pyU3Mzd2swZjVXUWZ6V3hp?=
 =?utf-8?B?WDlHU3Frbyt5QlNidEVsRFA1UnhFaUhFTlVEL21Ja1ptRUVLelh0T09vdXFK?=
 =?utf-8?B?bWhkVjl3Z25vY0gwYzhtUDNaTml2aUNwSjVRL1BTVU9RekNKcktHcElCdzZ4?=
 =?utf-8?B?TS9SS2h5Z3JhVWxZcTQxNXBQSGdkSDB5UzJCU0x4ckdVaEs3aHpDdG1kUEY4?=
 =?utf-8?B?aTVmdnFVb3pkSWZCdW84NVJEMWV2aVloN3pKbnYzM0M4RGNnRVZsMFEwczNw?=
 =?utf-8?B?K3V0bnBqWmQ3ZmtJUlR1VlhIWW5SVDAzODEvUXNPWUduUERYbEtwTldldUFs?=
 =?utf-8?B?R1ZRekFQV04zb0NOc1RJWVVsNTExVlNUTElxc0w4Ui91VG5YNUxUa1Frb3Rj?=
 =?utf-8?B?RHQ3cThzWWJiT2hXcmVFR1lFYmxiTUthQzN5RXBuVm9rQ1VWQVFrWHJNRldC?=
 =?utf-8?B?V1BVZ0J0TkMxeFNBYVVhRDdISEgzY3FVMXdoeVZ0aUI4RGpYQ2g2VFRJVzRo?=
 =?utf-8?B?clhMVWkreWRvOWJHUW5QN3pWYzJPMHZsWUszcEVXTEFrdFBNd3cvZkdJT2dS?=
 =?utf-8?B?VG43eXNkV2JGRmhTbGw3NGs0aW9FMjluLzdObFlMQXNlV0dCUXhvQzh3emxE?=
 =?utf-8?B?bzVkRzZXOTk0UEhGV2g0UnZ3SkhmZ3dadWpUR2Zob1FFQzdRNG5UZTR2UWt5?=
 =?utf-8?Q?/ta3ZsbiGR0EpbA1l876dmS6R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ebd1ad-cc72-4a6d-0068-08de2652ba98
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 03:29:49.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrBHEB0FcZcDj6POBGqG9xh36aMl/XWspGLh5ne7bcbQLDyk17t9zyOBcmIwDjOMnkA4FuEzDlMwis6OtMz7uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_192956_410982_22BFB4ED 
X-CRM114-Status: GOOD (  11.43  )
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



On 11/17/25 08:59, Ben Horgan wrote:
> Hi all,
> 
> Not much substantial changed in this iteration. Some rework relating to
> acpi_pptt_cache and a related proposed fix in acpica. Lots of little tidy ups
> here and there.
> 
> Thanks for all the reviews and testing so far. As I mentioned before, it would be
> great to get this taken up quickly. There are lots more patches to come before
> we have a working MPAM story and this driver is hidden behind the expert
> config. See patches for changelogs and below for branches.
The patches pass my tests.

Thanks.

-Fenghua

