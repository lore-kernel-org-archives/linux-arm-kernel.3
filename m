Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B06AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJgisBXeIXnf5M8d/4P8sFVQhiStIn3ocS5jd4RRrN4=; b=2WTVOlZUr36tHfXLSc2BYTUcff
	bbWiZO6m7pQ11VsnnthUubBy9khK6k6+wLTKCHr5ZTDiJciIhrtYQwzyLVh7Qzw/sVsZE4EIc40A2
	W8Sr277oMwx4dfexvoKba4TiEt+hTN8m4qRqo+MRtlPxMNf9RZLwJECNiMGIY0EIvNf3FU/TJScEf
	+Wr+IydKcCAaep9q2N3gHXW0QGkwjKxiRSmPlk9oH482pGvZuqg5/PkfzoPxSKZwiCZr7h/BnBQjm
	C9pHnsWLs0xXd6sosNd8GoM+goHxVLgF1QbcAPEAqtG0g9rKppz0/HJQZ027AGb6pesIxT9plz6zU
	P+EE7dMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxzd-00000005rp6-2F1H;
	Thu, 06 Aug 2026 13:18:41 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxzb-00000005roZ-0aZr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVTKY+WePI46aBK7xqITdQkh/rxJDdiHH1kvJCllegwlgss/7KAFFcwM4c27pb4CoknpIHF1+Kls43BbcmFR+1FxsQmoVHlDqQ/P6IyChnkx9Ii4N/TCHZxYD3rlxnHjBOjEQLKwr8lcVYzKqmdHmlNuw3AU5gOqD1zXUA+MroamoZb8cRxPRz0OkQa5NwiWahBWl+c7+IHxt6pkoyhjNKNMOXRyhqy4psEni2jx8d1CU7V+Orv1KFOr8GYAvyJ4ugHdvFF1PXiJwrFGp9nNSL0wuHNRBYN7klIipRPBk+hfW4Z5siQKIirZozagvI3pTcC8lkD1/eUwyH4aXhy3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJgisBXeIXnf5M8d/4P8sFVQhiStIn3ocS5jd4RRrN4=;
 b=TxyOAueyRaqq0zArwGEcLXIBs9NWTx8hAEjdYzRzhnhIxidWpzd7XyVbmB6kG2ViPdx5CEVtyWBFjbZtjow2H2VcD2yaJXiJ/pADsUBpdpbOZFIV/PzfF+rVWOFKqk/KcUAm0bVsApnIq2K9rRkZN+qg6ZwHcx2jDPZqk320ZlH7FSsoLKkEkEOO4to+vNtoXbhyhTU6TSxOKPaNZI9/DZrbzR1TaSQ8iw8RvSYH2gg1qSl2SN2cZa0T49hhu++QDhKRuLSEohau5obgOFg4NvgE6z46ZcLAGnTVTSsC50RT6XZq/HdC89QvcEP16z4hbwQ2y++K2N0j5Tf1wCn3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJgisBXeIXnf5M8d/4P8sFVQhiStIn3ocS5jd4RRrN4=;
 b=C6RlC2NfpJexgkEEOiFZi0Z1k9uNymssQENEf2CiNrM4pT7czhghYt1+iXVI2O7dZpL3DuFA2dWqzSbNah4VRHdjMzerOAFmydu1wuPLNtVVt1czt0GVktrteufC/AvLLh6GWIB2Vt5+eueZOBcED5ssj71O4n198t3bbxU0AZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB7727.namprd12.prod.outlook.com (2603:10b6:8:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 13:18:32 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 13:18:30 +0000
Message-ID: <9a25abc7-c59b-4d04-a94b-20e760550677@amd.com>
Date: Thu, 6 Aug 2026 15:18:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] firmware: xilinx: Feature check improvements
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ptsm@linux.microsoft.com, radhey.shyam.pandey@amd.com
References: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aff31e8-0a58-4fe0-aad1-08def3bd352d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 79VJWNlGQyQDa2o/dnf4QklPPXZ6pdimyLt/G78+ootiUVcNxnRCExlTNbPu1CzknrASQXd3eu9EVQIFXdgIbe9nJVw4X3aSJ8/z8oHoiy957vbkxBeb2rgm/BnqJkcqlfgL0Xdz4VtqffaWnTCCZpCFumgTaBOG1UZ51mqYQjjwfFgzmxkwsclqb+UxIJcR//1ZDpZOmUSVIINQW/cW+9l/ncA2BJ5faenpQ5SeHHIfFK3ib04coslHF4DP9MXvKMfQp81k5M1B37pLorBIbd9ZBXAAO10TKlG76ogbm6WKMvfPHLYzO2DY+VUOhS4e2J99nzaFFM6wSjNPJgdJpwy81V7jzdqaJP55pLvCdegLvsKksKcR2Gz83BAlEQHP3F6T0ALY+VjotGJb7Pvbj4ntapin8ak0r281gzBo+MOkqfuD8uX8XUmdZl4DfCtIV+fPzY0T5gnObzcyxAZMRFTwKjhj5uDvBO5VV2+7z4Q8guLnm1jrCFuXRREDhTUcEhP9C9Qdy+nsO+Qn9aJBEKbtghD7b1+s/ijdQH+c/vq7sSYDhYTLTAT8DcBs/kebYz96BIhm6FtxremugiGOWjDFwmgJFMMK34h1Y3AA63RhywSUKXzbIPQd1DjUAD/GwdaH8zHOzbB72H9FwdCgFKEefIkZKh3n587KRqKFxfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNFOU1mRkRoWFhPUXJjdkpRUnZZYzRzc2Z4SVlhV0I1dDVuYnBmYmx3ME5E?=
 =?utf-8?B?MFREODBaL0wvSXZFTTh0UXVYZkxHaThDeDloKzJEZ25Wa2NYR3RUMm1Oa3V2?=
 =?utf-8?B?aFN4ejVDb3pLU0xvUWlia3U0Q2tHRy83NjZTdlVoMEM5OEQxdnlTaDhaMndl?=
 =?utf-8?B?WWI4QzJhWnUrN2lTeDlFY0JSQ1pZYnBPOUs2SjFVQUFhYjVadGlVRWtRTWsx?=
 =?utf-8?B?blh6WEtPTjc5WUZSbU96QUpVMnBiQjI5VzgxVEtmcVQwK3RQK2l1eFFCK3d2?=
 =?utf-8?B?TDBEaFdRSmVMRDJWRnpDai91M3V4VU9PcVRGOFpxakRTUlZsNHk1YXFBSk4v?=
 =?utf-8?B?QWwwYmJEeVJvNVFNczRGdTNmL2FIZ1pXQVJkVXQwcmt6UVlqTDFTUUF6UEV3?=
 =?utf-8?B?elcvclJlY1UxeFJseEk0Ujg3b3g5cUtZUUpLeFVjSlNlRndsNnNjczVjZEY2?=
 =?utf-8?B?bjNpeWw4WnlENmpEZkxRbkFqNXl6ZmphMnR5OGY2REN6Umswemhma2F6Vmlp?=
 =?utf-8?B?NVk1TzJSeG5tL1FyMmJ2aVNhaUtpRmU5MURLL2U2S0svdG4zR014aVpqRklD?=
 =?utf-8?B?UGRQdWhMc05wY01qcXZkNFdGMHhxcFBVREllRUoxaFhMRnhLRnNqM0ptN3NG?=
 =?utf-8?B?K2FIcXVKWkdobVkyZkpaMjRKVWZKbXVuVmJkbGQxWWNpNGcvblhBMlRNbHgz?=
 =?utf-8?B?WlhwTUpZUHlKdzhSK0FFcGVHVjdSQzJZOGI5b0dRblBpbi9xYWRJTVlMUW10?=
 =?utf-8?B?RVRQdFJOOHpncllLakRDYnE4Tncwd1BqaUY4am11K3Nid0ErdUhORHUwaytX?=
 =?utf-8?B?QTNCbnkyVnpQRGlzbXROeVI2WDBja25JU0hkdjlBbVVxOU1vV1U1RGl2c0oz?=
 =?utf-8?B?bkVMb2x5SUZVODIyQWZibUxwL3NWdFE0RElnNGxZcURKaGcxM1BMcjJtQStt?=
 =?utf-8?B?V1FWNnEwOUtmQ1BjOVVYQndsNGZ6cGh0TnBCeGZORmVDRFdmcWIrYzFVUmdY?=
 =?utf-8?B?c3k5S0NZMG1yYXFrR3NwbDkzaThoZWhyVFQ3TjlhVDE1d3h5NFN3ODIxUGVU?=
 =?utf-8?B?b05TL21oTmdoNnJPZWFGQUhwNlFvVDd1cEJ4NktWY00vVll4SllEd2ZYU2pW?=
 =?utf-8?B?MlhhSWV4TGx1MysxN2MxMXJwNVRpbzFwaGljOXJmelZET2gxYnh4TUdqYWZF?=
 =?utf-8?B?VThZblRYb0lsYVA4Nkw3Ymt3MnEvY0J4YkpxaXpiWXZuMkpnSGc2SjZkcVZU?=
 =?utf-8?B?cnlTemNScmNpZTczWlZyZWJHc2ZLZEhLeW10eURnWVR2d3diRXFMT3UzNDNw?=
 =?utf-8?B?NG95cnVibFNiM0pMaU9nZEFDcTlvaXk2MTY1Tmx5NkZZNDZyR0hQUkhRdUdY?=
 =?utf-8?B?bmhaSUZhWnlaMys4V0hFbG1PMmR5SFZYdW40NHRTQXlaS1VGZVIxQmJqRnN0?=
 =?utf-8?B?QTM4MFFneGZESFJFZGNDZi8yQ01TWlVqRHZ0alpPd2J3VWRxbjNXQXkwQUY3?=
 =?utf-8?B?c2xxai81a0QyODRERUsrcmZoTVArZUFJZUJGS2ZLTDY0bVo0K2JIZVlJbUFl?=
 =?utf-8?B?NmhQemRGaytmKzc1UjNPdmdlQWxoeGhoZmhoTllEZ2JmR3c4WVZqc2Y0b0R3?=
 =?utf-8?B?VERiNnRNd1NNSDh2MlNRa29lVjQrbGVEelhHZDZHWFZ3cXNKWHBmYThZRE5O?=
 =?utf-8?B?WlM4eXQ4MnI3TGVZbDNuTWRVMGtqQWNrVW5oMEJZU1YzT0d2K3Y2bE8zbkZN?=
 =?utf-8?B?M1NyZEl4Tk9ZM1QrcXQyWkJHRFJQRDRwaTlwaFh0N2gyVTVvSVBGQk0yaGFh?=
 =?utf-8?B?eGpEazZpQk1aLytHbUJxSVplM1hPcmJvYk8vZ09QYjk1dVNjN3JOUkE1L0dW?=
 =?utf-8?B?UWFXZitoSDlKU0Fkam9IQlJML2dmdldtMG9DR1dkc3RNMUExa2UxTktwSXd1?=
 =?utf-8?B?eXRBRVRuV3lLNkpvbFpHZ0hvazdUVkZEZ1E5eCtpU3J6NGZtWmpONEhDeXcx?=
 =?utf-8?B?VzUzemV1dGY3MWd4VUJnUXphN2Q5MUJHbXRyTlIrRUVnM2wyRUVoamFJVXl4?=
 =?utf-8?B?VHo2M0hudDhhSHVXY0MvVWgvNFU5bVFnSkY5Q2UwOEh6UnZwMkxSQUNBMEdR?=
 =?utf-8?B?TUxLWlo4U3docmUxRHJGUGsyUEVwM1JUSklFcjlUVk5haVdTRHlsVHl0SHdO?=
 =?utf-8?B?K2FKUURIOUF3UDR4dDd4bmhPajc1YXBvbkxCMWo5SGE0N0xGeEIwSGZHdjc0?=
 =?utf-8?B?cnVwOGIrTkdSQTZkN1pQbTZ4SXg5KzF3M3hIaHgvY1Y3V1F3cVNzWUFGeWJC?=
 =?utf-8?B?MmpHQUh6SFFzUU5EVzZxQWJlNUpjK2RZNGx0NGZmWTJTRVphM3g4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aff31e8-0a58-4fe0-aad1-08def3bd352d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 13:18:30.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOjz0VuiEgp28XPnAascWrisPqYsmNBc1Mw8OSzJOSKNsA3JObajehGTcAtrYcFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061839_186167_1D223AB6 
X-CRM114-Status: GOOD (  13.48  )
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



On 7/24/26 11:53, Jay Buddhabhatti wrote:
> This series contains two independent improvements to the feature check
> logic in the Xilinx firmware driver:
> 
>    1. Use the TF-A dedicated PM_API_FEATURES mechanism to validate
>       TF-A-specific APIs instead of routing them through PM_FEATURE_CHECK.
>       Falls back to the legacy PM_FEATURE_CHECK for backward
>       compatibility.
> 
>    2. When do_fw_call() fails in the feature check path, propagate the
>       actual errno from zynqmp_pm_ret_code() instead of always returning
>       -EOPNOTSUPP.
> 
> These were previously part of the kexec cleanup series
> ([PATCH 0/4] firmware: xilinx: Clean up firmware and TF-A state on kexec)
> as patch 4/4 but are split out as they are general improvements independent
> of the kexec functionality.
> 
> Jay Buddhabhatti (2):
>    firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
>    firmware: xilinx: Propagate actual error from feature check
> 
>   drivers/firmware/xilinx/zynqmp.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 

applied.
M

