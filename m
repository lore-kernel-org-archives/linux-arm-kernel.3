Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37238CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yql/VhYK7pLaete1o9MwodqY27E3NJ0Y+IdOZfgx6hQ=; b=VZZY+zGuVnjVS791CznrHkYRHS
	vy6FSpgCxPXcmUdzfUvuCWx5uNY8OThuIBtTtS9B5Md/FRR5dV0BMtXYlRBBgdNIwThd9/0kln3lC
	J4CXThaEweucLKSsEz9Mo0MeqRvwRsrAK8mMwMMJCr0jgi60o+0rJ03y36NMJQ08G+PsFMh0g4ncy
	/dYPMLA3HzOkY9uVBc9HNAd/OLftJWA1SSuu26bkcpAmpxx2Xqa0dz/6ino4/uJ6cwvLveS8zfro6
	uST4JiinJ/swJ++j/Go4rX57okya9mXmD46s+szdt+yQbBs0JlotquHxR5NdeqFWnoZMwapugp+E0
	WNePBdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxaQ-00000007TK0-3jTU;
	Fri, 29 May 2026 13:49:18 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxaO-00000007TIu-1ZXB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWCqRfj1zzsKcNHXDjGvczsCiGY1oexDKng2+JpLyeVn7haGCVtVZmNs5kt23JjXbgIctk6lHZM6YVLun35PQK0nXVIm//IrvusypKPCnzuf2klbEJYyL3cZmj6MUtSNxEnVg0/HZ07F9twG3VftTwZCoBmINlxDz2I92uYFANaThNBeVzPJppf9zHoyhdw+fhbcqibjfc2VhO3G2dgc+bVORsgg6O6sXNZvBuWNB40NZtQhbkda19HPHUJt0fCuaQjjxauQRKQ+t9cDikA6+wo3XJXP742HgdUFwRRWSncv4zl5LBoNi4lVlC/4VrqRC5Occ5FOWeS6m4nTFp57gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yql/VhYK7pLaete1o9MwodqY27E3NJ0Y+IdOZfgx6hQ=;
 b=SAMJwVebfwwdnxJxrNJV6KPHL9sFwUCnE28hVzzu39kJlReEZvOMX4AZl3jtYMjsm5BaArB3zOY6xQ7XkSZ8ljaI2O4LjPXVJ6G6WFhLLaxeFsJ8Bbfbb7VUV4V/53+pLVjjs+Y1+e6rGCGGZVT4miU/ie6IfG3Zu9yI+7J04FH2CqblVtw7yzoTLrzCgfL0FOfn3jKWHpP/GX0QD3Ak60YAQQqQaTEtoMy7gOwiYy6BJTg/iTbwzq+MI/IaKshtzEZtBZUaVQChlgu6FbtUAq6rjBQumCyTMNE6RkhoGdIlp6ZUZfMTrz0DvQdMNuRM2HSiSwwiBJLQ7PPryUKdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yql/VhYK7pLaete1o9MwodqY27E3NJ0Y+IdOZfgx6hQ=;
 b=EIv73yXcnf4ENnv8ufvooImEb5GbSSB/+MA4I3oE72ALlYONoU+gDDMRzpBFXxwnlHfDQfMlOSal0H+4Dj0E7fgmvb0JQ1R25T8KIpsr1t+fYXy3r1eWJHzqtSEsPZCJ2D1LWrg7joqo8iwOfb74VRN6dmvxpoMG7DXJHIY9s0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW4PR12MB7333.namprd12.prod.outlook.com (2603:10b6:303:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:49:05 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 13:49:05 +0000
Message-ID: <02b43205-5036-48ec-b49b-ded4984995df@amd.com>
Date: Fri, 29 May 2026 15:48:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: zynqmp: Switch Versal NET to firmware clock
 interface
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <cover.1772725183.git.michal.simek@amd.com>
 <78c6e51f0a648b42dffa4d23778b0c1caf4a5f68.1772725183.git.michal.simek@amd.com>
 <20260311164503.GA4041143-robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260311164503.GA4041143-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::48) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW4PR12MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd85da6-6671-4438-e8ac-08debd890c5a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: dP15NzB1i2hyTmmBW0+cOpaW3JNAKIZWCn255by4HxkmiRSlQRw6O/xBE63bGwMKvoNIhdKqHufgdQdfru19w86NuePAxAeohNLtlAAgGDZlG/SPbNG+KjDp5IRn+oraZQ7y5zV0LrYD3ZXqASWWcn0Qo/HehXyZpTfha62DrcB8X/y0PadCvHgnT141zrG/iIurA9KQN9Xpop9noL3J7y6o8C9nqat+rDHfmrq8u/wGIdGprF16Unboz8Eczk22PVepw94O0Uq1VgztVqwNDiPhqK/3WJ/GEgrEyQpD9pO6S8PYfWg+iVR+aGZ6F/fiiWWd5EEGwha6XCxKMKLulPSPj0E5HAsZOzBFMVNJma/fKC3DFnBWff5NvOt1xg9gxzM4p9UCz63m7fo1E6waDO/wJgXKuRLVD6QC2CZZiaPdGcuzvfwOawX3oE5EmfIOu9yGPokXMAPLFWHna0Yb+/NzoiUAxTtnxJ4ZCgge2dMwZaE5xlbd9Ndgn1vhvyygHmRqYE6c9eaUfL3SAIAJ148hX2PhyIjWztAzGwzDCdd3uVWnAUi1rcrd0LGvrh+EQRElgjhrWZsZm0aQRsHU5E/I/uors0K5220/tjeqDLXlGExn5BVYYa15z84DVNoxLH1e0YqZJ2K5w6FB9Wjne2VJE1srLlAZ5MXmZV/LH3Mma4rDsitbbPiiW/lt7w+3icwE4QzFSqP8eHZAixWKwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFGM0krM0FHWCtVV3Y0Q013V3pNUHZDSXBRRUtrNVM1aTY0VUlod3l5dmti?=
 =?utf-8?B?clZ1b2ppa2pxQXBRVElvNmlJdU1UVTkvaDhqRWV1aUtiem1zSmxUTnNITmZQ?=
 =?utf-8?B?U1VyQzEvTWhOdWpXbHVSYjJkMFpSNnpUeHZIeUhlOFBQb3Yzd3JzZE9CVjV5?=
 =?utf-8?B?Nlo1UkNvbVFaWVZZdElmdGZjVld0NStYSE5Yb2RmdHg2NVcreEM1OU9zbHRp?=
 =?utf-8?B?Q1F1blFES29pU0ljNE1PSkp3aHhySTZMTkpmTHpkQXRHVWtGejBUODdJYnlU?=
 =?utf-8?B?bHR1ZFBlbUdpcTdnTEFKeVBKcW5lbkpBK1EvS3NGR3o5SDlzS0dabGF0Ny9G?=
 =?utf-8?B?UDBSSGlobFIwa09xMkkyNFVBeVJ1RURXWGhkM1F2VXlJcU9Dc0NmRXpUb1Q2?=
 =?utf-8?B?WUdBektIY3U4eXF1Q3U4SmpNU2kvMzZvMWV2N0xHQnhDNGtKQ1MwQVFwcEl0?=
 =?utf-8?B?WkptVWg4RG8yTGpDUVVBVzBseU9WWFgydEVyNCtSSmJzTzR6Q3hVTmdiMy9u?=
 =?utf-8?B?MElvRFlGdlBYTUNSRmVkVkJWcWgxMWlGTEZEQWRQMEF4VGF4VXpOWjBHMnJY?=
 =?utf-8?B?ajAwbHo1T2tRZmcwaTBVODVMZHR2OGovNm9jV0tvZDhCWVMxaEFmbktJaHdx?=
 =?utf-8?B?SUw1ZTNVRWdZazlyRHpVK0hTN2dEZE5BY1lvZUJ1SXcxc1BLUnZnU3NOZmFa?=
 =?utf-8?B?V0taMmVnT1RWaldHWVRIQUpHc0xuNDNsdlEvbXJWT3l4SjJQZkErSitLQXVL?=
 =?utf-8?B?Ujh2VENHaHNRN1ZBOTFURVlud0dsNEYya21OYllHdkE3THJiejVDN2U1Nzh0?=
 =?utf-8?B?bkt1bjhVMkFJQlU4WXZhb2hncUdQdS90MjVxTU9MRVVRRTBrcUM4NThsWjNn?=
 =?utf-8?B?WktGMjJveVhXS1lVSU03c3AwRWlKbDRCblZPU1FKajBMSnJHYUk4aDlNTHpE?=
 =?utf-8?B?QTcrQkxGMTBHdHl3djN3YkI4eGJOajhKTTlVSVFnS1cweWxUK0pSWEZHb2lo?=
 =?utf-8?B?WTkvNW56ajVpV29nQThSSTFXNkYxNGZqbjlMTXhJclQwTmVYTXVZRldDVWJy?=
 =?utf-8?B?ZnVrVEQ5NVUvb255bDBpQnkxWGFNOTJrS1Y1RnVlWmdGRTFnZFRFaGRPdlQz?=
 =?utf-8?B?RFdFZDloWkdvMnNyZnRpdzVRMTR6aFJReitqR2FJdi95ZU5uVHZ2QkxYL2x5?=
 =?utf-8?B?VFo5OE16RWltb002K1dyMXlSWmV1RDJLTXdhTm9BK0swdTNTcVkxWWc5cFJC?=
 =?utf-8?B?T0hobGNXNnhWUEJwdm4xemx0ZUVZMk9qSHJkbVU3RkY0aGxQQ0hOSTlOemJs?=
 =?utf-8?B?VEVrMjhYSWIva0VVSXV4MkdMdHNnWVczMFRjQUhYYmFaRTRMVGlJWE9PM0tY?=
 =?utf-8?B?bUdSanpKN25RbldOaUN0Y2Y5RkhCZWwrdkcrb1M0NWp2TjBtQmd5R3VjWUwv?=
 =?utf-8?B?eTd6N0JQS2FjdkZoT1RxdnhvLzB0d2Q0MWhiM3JVMGl3MG5tMUNFcXZjd0Zm?=
 =?utf-8?B?bGFDVlhkWnhJdkF1RFJZV1V2Q2dMWlFNMjlxRk1RMXZrVU5GWWM2My9jak1n?=
 =?utf-8?B?amx6di9vUUtuYWtiRkhnZXgzTUFmNEY4VjQxZDlWcXVlUmVrZVJVOWRmZDRF?=
 =?utf-8?B?aVJBNTk4OUd5TkxuRVM1UW5BMC9tQmhSQXF5bDR5U2hRbStkd3AvQVBYdTkz?=
 =?utf-8?B?U3NvRFQ1cSt5Rm9Eb0tZVThHSldlTzJtMXptWnlzVllzNTRtaXJsMWd4eEVC?=
 =?utf-8?B?OWJQRXA1NHhoT3dKYTZKdjRpdWRXRHpieTJlRWR1Z0tKc2RkUC81RVFicVZO?=
 =?utf-8?B?Vmw1Tlhycy9uQ0RYRk8ydnl6c2tXVlN6WXFjcFdhblduTXpwSkRSSGFVRDQ1?=
 =?utf-8?B?QUN0VlQvUjlMMHJobE0wb015OFB3ZmUxTVNOZnZONVUyYXFDaUFTUzZtek5P?=
 =?utf-8?B?S2hMdGZrTHljT2NROUVHbjI4YTFlU3VnR2dRQjVtV2lsalgycSszdmVCRVNL?=
 =?utf-8?B?bmZ1L0ZiR3BXK2FzT2l1clI2WXZFTld1NDdCWVl2Z3pKQlpTNmEra3NZZXYy?=
 =?utf-8?B?OTZVZnR3WThlM3ZBYUtocFpBSndsbVhvZHlSdnVDYlNTd2Z0ZkJabUJWdWZJ?=
 =?utf-8?B?ZENJRTB5UFd1V09OdG5GeWs2Z0xrdFp2N3EyRkh2eFdzQlZkMnZPMG9rRHFQ?=
 =?utf-8?B?M0lDNzJnbjd4OUIzNVpKWG9QaklhZlF4Y1RpWkU3VmZEWlZYOTNBZ0xibTdx?=
 =?utf-8?B?SmhrbWR6NjdWSWNHMzhjUWNvZFRMTGo5UEZpL2lQamY5aGlqMEdSR0hkZ2x6?=
 =?utf-8?B?SlQrT0dOSEJGV0ZlRitLdDE2OVhlVjRsQUpnbERpckZlTktnUDgvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd85da6-6671-4438-e8ac-08debd890c5a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:49:04.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0SbEpokrZWietUCb9l995TveEQn2Rrzi9HK5vTCY9jE0zs4DY+ftHw7e6rh+DFE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_064916_494207_8ACCF69B 
X-CRM114-Status: GOOD (  11.67  )
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



On 3/11/26 17:45, Rob Herring wrote:
> On Thu, Mar 05, 2026 at 04:39:50PM +0100, Michal Simek wrote:
>> Switch Versal NET from using fixed clocks (versal-net-clk.dtsi) to the
>> firmware-based CCF clock interface (versal-net-clk-ccf.dtsi). This
>> enables proper clock management through the platform firmware instead
>> of relying on static fixed-clock definitions.
>>
>> Add DT macro headers for Versal NET and base Versal clocks, power
>> domains and resets that are required by the CCF clock dtsi.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>

...

>> +	firmware {
>> +		versal_net_firmware: versal-net-firmware {
>> +			compatible = "xlnx,versal-net-firmware", "xlnx,versal-firmware";
>> +			bootph-all;
>> +			method = "smc";
>> +			#power-domain-cells = <1>;
>> +
>> +			versal_net_reset: reset-controller {
>> +				compatible = "xlnx,versal-net-reset";
>> +				#reset-cells = <1>;
>> +			};
>> +
>> +			versal_net_clk: clock-controller {
>> +				bootph-all;
>> +				#clock-cells = <1>;
>> +				compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
>> +				clocks = <&ref_clk>, <&ref_clk>, <&ref_clk>;
>> +				clock-names = "ref", "pl_alt_ref", "alt_ref";
>> +			};
>> +
>> +			versal_net_power: power-management { /* untested */
>> +				compatible = "xlnx,zynqmp-power";
>> +				interrupt-parent = <&gic>;
>> +				interrupts = <0 57 4>;
>> +				mboxes = <&ipi_mailbox_pmu1 0>,
>> +					 <&ipi_mailbox_pmu1 1>;
>> +				mbox-names = "tx", "rx";
>> +			};
>> +		};
>> +	};
>> +
>> +	zynqmp-ipi {
>> +		compatible = "xlnx,zynqmp-ipi-mailbox";
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <0 57 4>;
>> +		xlnx,ipi-id = <2>;
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		ipi_mailbox_pmu1: mailbox@eb3f0440 {
>> +			compatible = "xlnx,zynqmp-ipi-dest-mailbox";
>> +			reg = <0 0xeb3f0440 0 0x20>,
>> +			      <0 0xeb3f0460 0 0x20>,
>> +			      <0 0xeb3f0280 0 0x20>,
>> +			      <0 0xeb3f02a0 0 0x20>;
>> +			reg-names = "local_request_region", "local_response_region",
>> +				    "remote_request_region", "remote_response_region";
>> +			#mbox-cells = <1>;
>> +			xlnx,ipi-id = <1>;
>> +		};
>> +	};
>> +};
>> +
>> +&cpu0 {
>> +	clocks = <&versal_net_clk ACPU_0>;
>> +};
> 
> This structure is unusual and not great for readability. Imagine if we
> did a .dtsi for each provider with all the consumer properties.

At early stages for the silicon are all clocks enabled because link to 
coprocessor is not validated yet that's why that fixed clock DTSI happened.
And because at this stage power management is not important (because everything 
is on by default) that properties are not listed.
That's why historially we had two files. One with fixed clock and second (with 
wrong ccf suffix) for firmware interface.
In near future we are going to have (not for this cpu) also SCMI one.

And because reset/power domain requires firmware node they are placed to the 
same file.

And I will do that other changes in v2.

Thanks,
Michal

