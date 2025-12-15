Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04BBD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3VrK7KPegpNhAz8VTqec0oNVZw5AliWZfy+Bp7Qso8=; b=ORMZdTwIfYFKQrgL0nxJ0c8nqd
	ry1J916EdpSDtM95uoxN+g3QUfl4YxJUOILvHd4nafKdS/vHKq8hoXCWT03NYEhWHsjnACuNb/86+
	8O11npneDCahjaM3ogPAUlMZjQqrorMrNqde0gFoRB7q2P0WhNVNP9CwRhBbOEW9pqzlf8iSgw586
	B/MmRF40kDwa5DsIvrS/NoXXOzXNqUKkgR6RHJ7JtN5ey4VVXEWmOlsfnOaMhSgjAhmt4x2nCJ0RO
	9Cg4kreRsp7z7WYjCEVOClKEvxopw7pL88RgQsQRQGgOiT1drcM6ItIE+iNmegfJaSbs8h4ZKB/Xq
	DWbocNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Xz-00000003Ewh-1hwa;
	Mon, 15 Dec 2025 08:03:11 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Xw-00000003EwE-1LtL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOQOGl6P1CB9kF5DQqOpKctf5IexQTM9tWTKkmbr+773O2XySg1kZN/Kk9N2ejIop63dJI2r4JLl8MZ6ry7yalSEY2bdyevOFjV/o5Hdp7S1XKeSBiFiIGjUNXiSaV78vshLVgdubPfKXysp8OWIwRdGm3F/GGGxsrd3BJMaCSmU1bGOK2mTxTN1Fk4djfiUXNYpusyDTJszQI/Tvmg162J2iDPgs46wcwPP206FuGOcj8RLIQ9+eI2jSaakErxUVZKKbz+S2h/yBtVHjbt4wbQ1ZCHJxfRPML8/ASaPw19bkp8Mag/hk8D+ZDZ91mVpD5v6Wa2MhQqqh4RTuqI71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3VrK7KPegpNhAz8VTqec0oNVZw5AliWZfy+Bp7Qso8=;
 b=fN2XZTr4r+6GoMPtDFXPx4utrrfqMiB9YuXZovTOmKtVDVGbLFFerGxBlJBX+toiF59qeVmY8EsO8UCJxALxlBr7wGimlRrTbic0bEx0/38NIN3Sin8oavohd01bGiesZOXs1+VsS7eWoYTtTDlG/vxmsAYSj8jgnLHlbZSWlcmAnLzbPf8kSEDL8K6Mg7z9nCaVEuiN4fUj0BSZCTw7DlzKhSMDep9qj1r1BXoJPhPTHw8CASPsak6I4mWnQOKY4yB7kHID1padPk7AAN9czQckmm2MyNwCk1fqoig1HNVTmir0/lRSm92E0bbenQuo+QEY1mtBgfYTVEe9QEnPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3VrK7KPegpNhAz8VTqec0oNVZw5AliWZfy+Bp7Qso8=;
 b=DYY7LrTxIxwnRnXpazSW5iejzTVSd8NcNajuRwfs6rtL9JoudtYohxmLy13y2B7vLW4T6T8SJr5HSDO/UW9JB3vD8ng9X15MNBklTJn6VdC0zEXnYRS7I/TEVu7LWK7zo4HLJE4gI0aysHMB94jnzgOgtV+gXzqWrQWyJ/YyqlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:03:00 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 08:03:00 +0000
Message-ID: <27c2e287-949e-4ae5-a818-49f6d61cba5c@amd.com>
Date: Mon, 15 Dec 2025 09:02:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] arm64: dts: xilinx: fix zynqmp opp-table-cpu
To: Neal Frager <neal.frager@amd.com>, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, git@amd.com
Cc: jguittet@witekio.com, jay.buddhabhatti@amd.com,
 arun.balaji.kannan@amd.com, senthilnathan.thangaraj@amd.com,
 thomas.hommel@emerson.com, micheal.saleab@amd.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, peter@korsgaard.com
References: <20251111070555.1169130-1-neal.frager@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20251111070555.1169130-1-neal.frager@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0121.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::10) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: ef52ad93-4321-4b59-0ce9-08de3bb05d49
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTRlVnloRGF5WWdiVEg3SW1WUW5NeEJqYkVVbHp4VDJWQURUUnI1ZXBvQ1VZ?=
 =?utf-8?B?YXhKMGgyR3hMSWJsYnpYbDFKLzhmOCtqdFNwM25GTjlqWm1vVU9ZQ1lqeDB0?=
 =?utf-8?B?YVF0T0EvVGxQVnQ1bmZId2RRcWhSVi83UWNlY2c1UnRWUmZ2eVRETjNjM3o5?=
 =?utf-8?B?VXZOVk9Ua0xyN3EyOG9LdUxyMzlENjRGZ2Z3TlhzVjhTaE53dmZrTHUraXB1?=
 =?utf-8?B?MEJNOGtTUW52WkFDQUxENHEzVHA3Sm05QXVpVUNXUURIeHNxcmNLczh3WUtH?=
 =?utf-8?B?bXlxSHFHZU1CZ1N0QW5lbXZvZUloY2FzUHRhcVV5TzUrbm4veWZzejh3OFNQ?=
 =?utf-8?B?cmdFaVNvMGdieTZSdGN6bk1ZK3ZaVGFVTjY4Y0xBMGV1WHIyZmpFZWUzYVpa?=
 =?utf-8?B?V3dJWFFIUFhwUDBrK0VlWnFxZUQyak9qcEtjQ3VVWkhWT3ZjblB2NHBCOEln?=
 =?utf-8?B?eE1xcm9qaHRSdmZBd3cwL3FtZDBQMXByL1BoUkJYRnhFTGlFTnpjWTFUV3Za?=
 =?utf-8?B?eWpIY2FucGpjZk91QWNGYVVKTllBc1BLRXNQM0N5MXM4LzdGc0srQUNXdGpq?=
 =?utf-8?B?NFNBVkNPdy9JeGdhMElwWWdReDBJLysxNmdWZzgra0luNk9kQWNoOUY3a09o?=
 =?utf-8?B?d0FzdzBhWjVkdkFJenkrRk5adzBFYzduTnlLZVpMOFhxemFRN2FDdlNuK1Vt?=
 =?utf-8?B?d3RMZndSN092YS9TRFdUdnJWNXFwbWNpanpJRWp4V1JLVzk4L0JnYmhUaHU5?=
 =?utf-8?B?WHBPcWpQQ05UMFRHYk5VYVkrQ0NFM3VrZWdhMFJURGREMU5ib0pDTXBsbGFU?=
 =?utf-8?B?UHlTWEVkbmMrcG93ZXc2eTViaWpvdDBZTTVSYUVkaU5odGJLNXowbmVJUGti?=
 =?utf-8?B?L1R0QmNQcWlUWkdBMnVubnp2UVZONWVKZDJSZ1pmdHBTTkZRTldTSFg5NjR4?=
 =?utf-8?B?Vy84ZXREcy9hQkJ1NVh5MWlYUEd2TTlPVGdiUEU0QnlFK0xVQnZmcDliQzFr?=
 =?utf-8?B?RzdYNzZyclk0TGswdVd2WmhPNERIZkdyNlNKTUR5ZFk3dUVGMzRmZENyUGNC?=
 =?utf-8?B?enpiMmJVNWNKUWRDV0F4MmxUVHJmek1sZTV4SDF4OTAvOE5la1p5SWJFcks2?=
 =?utf-8?B?V1BxLzdnQlJSTHFMVk9WVmlpcXk0c1pDSlVJSkZ6dnhCMFZZT3pNNjVRZUcr?=
 =?utf-8?B?MzVZSjhIYXJuTU9GWExlcUVzbUhhTXJoSEM4STJ3eU4zZUxkWk85VnN0MDJW?=
 =?utf-8?B?VGF1S0pncmpKODgwU0R5RWMzVlZ2bWVQYkhoK005aSsrdG5Qck1vdWpZMFZW?=
 =?utf-8?B?V3hLR0o2UU05bXhUa0l4QjdaZmwxZW1Bb2UxdEN6ZHFEVUJ2M05BOVljVysy?=
 =?utf-8?B?dlpvQWZRV3V3L2MwYlBick5ZM25iQk5GQ2pIUk1CVWl3eVZ0RUQxVG5ITFhT?=
 =?utf-8?B?VkhSSjczOWJiK2tyc3U2UUV5UEkvb2t2Z2UzMHRlT2s4cU12RDdzb3o2Ykdt?=
 =?utf-8?B?UGl0WFBET0ZzNVFYbzVYWktvaXlJRVZjU0NhQTdRVEkwRnFhM3dBMVduNTI5?=
 =?utf-8?B?RnJyL09mS0lUMEdzYVlyS1d5N1VOSWpCWitCallxU204amFaNzZ3QzU4cU9L?=
 =?utf-8?B?RDZQdzVEbFFxNjlkeUlqT05adlNzZTN5N005RzBzbVEyTldrck9SMnYrWUpO?=
 =?utf-8?B?ZWtRaStGWjZ5RThjWkxFV0hlOHRVRTNQMTRGTXZMUkJOQmZVTWFJYmVjY2c1?=
 =?utf-8?B?UDRkNEw1WTREY0FLOWI4Rm45eGcvR2NBRjNKWjhlbXk5R1VZTEFSRU9yelpZ?=
 =?utf-8?B?aDBMWHVBcUt3eTJpSmZiT3RHVEt0c1VhaU8vVEpsUStkcGFIU1dJM00wTDgr?=
 =?utf-8?B?d1BlaDhmYlJMUlZISHJUL25hMTVETDlzTlRWTGc5VHpCcDZEQmhZaXBDd1hy?=
 =?utf-8?B?S3VVZkJ2Yjh0QmhwbnNWNFRrWVV1WlM1Z2paei9aQnVOQVpmWHoxdU5LTGRR?=
 =?utf-8?B?M1k1Uk5pZzhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVA2VlFnNis5eHV6dTNTS1ZpS2RORFFpYzBZeGJidlRhUUprOWpKMmttbCtu?=
 =?utf-8?B?Ti8reGJQc2dTNjVYYStnMGdaSThvVmg5YWxsNDRjOFgyd01WWXdtZnlFNk5K?=
 =?utf-8?B?algvV00yUUZFd1U4MFpGNXpxZE5mMjFSODk5V2l0OHN6ekRTS0FUR3lFenNy?=
 =?utf-8?B?MGdDd2ZWK29HTUtUdndObk51eWpkMXdhWUk5NDhjVURJVUtmVG1Fcnlzam1v?=
 =?utf-8?B?SHJqVWtxQ1VPekIrdFhqdDhQN0tFTVdGcmZDdVhPUTF2NGNuSGFoZVFjZXpI?=
 =?utf-8?B?RysyTHBFc0lQYzB4b3FjYktBc2ZoekFuUDVIZEhRNUdXdDQySi9xQmo5cXVl?=
 =?utf-8?B?Y1Zrcmc1cyt0MGwzWXRvaVJaMHZnUnRSanhLN3FISXVtZElwUXhUYmNvM21Q?=
 =?utf-8?B?aEgva3JNQjNRS1oycDd1ZnZtQ2pRenNDeERjOVFuYW91NjBXY20xVE94am8w?=
 =?utf-8?B?bE5HaWhITzJXa2hhQ3B5RjdUd0kzdnlmc21hNXAzc1RmZmU1UndWcCtFRG4x?=
 =?utf-8?B?RnhSRlllbStVSWJkSlJWSjVzelJpVndPbXNJS2NJN3R4eVZiNEZUU1lsTFJw?=
 =?utf-8?B?L2VEMHUrV21uVkFtSmNNK2ZsdmdyTWkwUVJabUhQbDBPVHFJdzFBZTlOcXRi?=
 =?utf-8?B?ZlRZZHZTVThnMnQ3ZUZZdjAwVFE0T1N2ZnhUeGtWUUs0UHNpMVRoYkxmM3Jp?=
 =?utf-8?B?OUF2RDJQcVRtcjhwd1V2cDRRT1VwUFltcWRpaDdSWjFlSkV5VFJjZ1dVVmRj?=
 =?utf-8?B?eDlWOFdqVzM3MEdiMk9VdncrU3NrYTVhRWRNTXBGbjRPMFJEUW1mbytpS1g4?=
 =?utf-8?B?RmljSmlnSHRUbmxIaDFJNi85Zk9UcDRKcmw1bG5Mcnc2d2llWk1RdGtneCtT?=
 =?utf-8?B?SzhldFpyQ3hMY2JoaWx3RlpITjlxam1jTGYwV3JReUIyUzgrUitpRWZ2TmVn?=
 =?utf-8?B?UUg3c3l2K2M1all3ZlNUT2h5V0t0L0FGVlpIU1dEK3djamJ4OW5UNVFZVS9W?=
 =?utf-8?B?RHN3SllLNHh2eXoxck5saXJKU3hEakovZFdtRXJHRDlJaWQzZDFHN2ErUm1D?=
 =?utf-8?B?SThuOW5RZ1pyUEJmMFdJbExjdVVvbjBLVTdZMVlrSDM4UXJ3OUFOWFlEYjJx?=
 =?utf-8?B?R0RTWU1LbkFkMHNkMFN3VmZicXJpUXJzU0dkdk5vT0xYcjE2UkV1U2hSTUxt?=
 =?utf-8?B?RHE1VmxWS0hxbE1QamFKb2ZNNmZpd2dzNlR3bG5pRGtwUldoUE1udi9ILzRo?=
 =?utf-8?B?bXoybHpybXlSeHc1czZkb09rUmlFbVhITDZsdzFWUk45Ty9BMEJlaVFvUU96?=
 =?utf-8?B?SHRZNEZLSHZPUy9laEVES3Z6elNtMDZSS1hFY295Y0E3cnMxQ2RUWjhZQTcy?=
 =?utf-8?B?MWQzSnlHa0d1cmcwQ05XM1ovR2JuNWhWWkFIR3djcjVUZTh3TmZ4MWRMOEdQ?=
 =?utf-8?B?MkZsTlNiclJ6YW5jS2VjWjNmcWlnOFlGelpDNy9wc09zWkVQUkpuNW1BbjJq?=
 =?utf-8?B?dXpBNi81OVJkdkRGTWJnOFZMYW9QWVo5Q1NBZlRRMklMMEl6QkFpclNncGxu?=
 =?utf-8?B?dGpjYUxZTDJLZk9rRjlOdi93Y0pjTStjblpubklacFA1L2didENCTEJQZDVB?=
 =?utf-8?B?di9VMks3M0lrR2JRVFZ4R3hCc1lDUkF0WlZkMnBBRXk4TUZBdFNKU3U3VnR2?=
 =?utf-8?B?WGJ6T1Nma1hnbFVCbXJhUnN6RlhLdGovaWlyMkZjSTVESENHYVVOWEFYaElP?=
 =?utf-8?B?Q3lWNHRHeEtuQmZvUUFMcnNxR25uYXh1U2ZNbmcwTEx5WVBnMDFBdW1HVFdj?=
 =?utf-8?B?UFlLcG1BUGdGV1V4ZUFMb0JGUmY0QUNlcktpbWk0SlVSRVJIWDlOQm15VWxo?=
 =?utf-8?B?NmJOQXpSSlJHa1ZnRmFpME5xeXpzK2hSV0NXeWNPbmtYL2F6TEkvQld5STVG?=
 =?utf-8?B?L2cxbWMrYTU0dUt1QWNYSmRVMUNMVXdsV3NIZGxHdE9wQU1taHJXVU1ZcEJz?=
 =?utf-8?B?WDUxOXlzSjFndnJtV2hURkVveW12b3ErY3RyRzVDbUhuVk90TkQ4L0pBS3VU?=
 =?utf-8?B?dnAzS25lM056SmdKV0N1Nnd6MWFyNFgwYTN3M0g4a0tldGROVDV4cDh6Q3pP?=
 =?utf-8?Q?DRTjPORm0PXqsh0C6vGNwEHp8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef52ad93-4321-4b59-0ce9-08de3bb05d49
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:02:59.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVxpzpPLqNiOz/+HEY1McswnQBPAOc9SxWKhoV3R0qZnSoYkLo5ZacGbemwayIPK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_000308_459426_AE41879D 
X-CRM114-Status: GOOD (  20.61  )
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



On 11/11/25 08:05, Neal Frager wrote:
> Since the following commit, the zynqmp clk driver uses the common
> divider_round_rate() when determining the appropriate clock divider for a
> requested clock frequency:
> https://github.com/torvalds/linux/commit/1fe15be1fb613534ecbac5f8c3f8744f757d237d
> 
> This means that all the calculations will be in kHz when determining the
> appropriate clock divider for a given cpufreq request. The problem with this
> is that the zynqmp.dtsi and zynqmp-clk-ccf.dtsi files have frequency
> definitions in Hz, so when dividing requested values in kHz, errors can occur
> with the rounding.
> 
> For example, the current pss_ref_clk frequency is 33333333 Hz which generates
> a cpufreq parent clock frequency of 1199999988 Hz which is the same as the
> highest opp-table-cpu frequency in the zynqmp.dtsi.
> 
> But if a user requests the value 1199999 kHz as recommended in the available
> frequencies:
> 
> root@zynqmp:/sys/kernel/tracing# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 299999 399999 599999 1199999
> root@zynqmp:/ # echo 1199999 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
> 
> The calculation will be:
> 1199999988 / 1199999000 = 1.000001
> 
> This will get rounded up to a divider value of 2 giving the following result.
> 
> root@zynqmp:/ # cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq
> 599999
> 
> Also, if a user tries to work around this calculation by using any larger
> values, it still will not fix the problem because the driver will use the
> largest opp in kHz which leads to the same calculation error.
> 
> User requests 1200000
> root@zynqmp:/ # echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
> 
> Driver converts any value greater than 1199999 to the largest opp which is
> 1199999 and then calculates the divider value with the same calculation.
> 
> The calculation will still be:
> 1199999988 / 1199999000 = 1.000001
> 
> This will get rounded up to a divider value of 2 giving the following result.
> 
> root@zynqmp:/ # cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq
> 599999
> 
> This means there is no way to configure the zynqmp for the fastest opp using
> the current dtsi files.
> 
> To fix this issue, this patch updates the zynqmp opp-table-cpu and
> pss_ref_clk, so the clock rates are calculated correctly.
> 
> root@zynqmp:/sys/kernel/tracing# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 300000 400000 600000 1200000
> root@zynqmp:/ # echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
> root@zynqmp:/ # cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq
> 1200000
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - The clock-latency-ns and opp-microvolt values did not change, so simplify
>    the patch by only changing the opp-hz values in decimal format.
> V2->V3:
> - Improved commit explanation
> - Added pss_ref_clk frequency change to the patch
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi |  2 +-
>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi         | 16 ++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> index 52e122fc7c9e..482f432ba7f3 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> @@ -14,7 +14,7 @@ pss_ref_clk: pss-ref-clk {
>   		bootph-all;
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> -		clock-frequency = <33333333>;
> +		clock-frequency = <33333000>;
>   		clock-output-names = "pss_ref_clk";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 938b014ca923..dd9bd39f61e8 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -103,23 +103,23 @@ CPU_SLEEP_0: cpu-sleep-0 {
>   	cpu_opp_table: opp-table-cpu {
>   		compatible = "operating-points-v2";
>   		opp-shared;
> -		opp00 {
> -			opp-hz = /bits/ 64 <1199999988>;
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
>   			opp-microvolt = <1000000>;
>   			clock-latency-ns = <500000>;
>   		};
> -		opp01 {
> -			opp-hz = /bits/ 64 <599999994>;
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
>   			opp-microvolt = <1000000>;
>   			clock-latency-ns = <500000>;
>   		};
> -		opp02 {
> -			opp-hz = /bits/ 64 <399999996>;
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
>   			opp-microvolt = <1000000>;
>   			clock-latency-ns = <500000>;
>   		};
> -		opp03 {
> -			opp-hz = /bits/ 64 <299999997>;
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
>   			opp-microvolt = <1000000>;
>   			clock-latency-ns = <500000>;
>   		};

Applied.
M

