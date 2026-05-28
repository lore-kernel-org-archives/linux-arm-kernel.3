Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAD6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smal891lf0p8wQIZqqpi+Ny6yioJvO+558Ydx8j04FU=; b=qzB9V2Rcn+v5CgpDb5wP0D8Buy
	akcyJtbg5YTD+KmMleX3AKi5R/P6Aw3el5uqUzZfxmTYSUENHTlaAI8iIG7IXgekU6xDYD/QotLvf
	v0AeTVOSNPBAWUAjdrDQrt+pBhEyxYeIDb+s4Qmwq8pcwWRoo0muDfmRhbs6y8B8xD8QvYpnfFAM8
	mZcV3RmkjQGYpA28LCy8BDJImJYQPyppT2amL0DXWc2GY0aZQ4WYGigLXX5805VDRQHt6ipWQYk8E
	zCAV1QpjoZfXPlb3PyzB16M7VmcJGJVsFrRMQx3gW4g8RuT0BlB99zP0pu2DWIfAWUhd0eoQiKx16
	ArbK1aRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeYV-000000065sf-2nax;
	Thu, 28 May 2026 17:30:03 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeYS-000000065rt-0eIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKzWgLeXJ0WCnS8v7Jjoa3Zbd92lyO9DfN3FyPwFXaXQ8NR0gai1l0mfQbU3iUldR2Nlj3X/wMbf8gLikukeClje5hjgZtnTC4Gw6ysv9JnaL8qeqWCh1FFWpRsZqLReuH2pjw4AFCXjiFc4YWbiHi2e7ulAr2hyLTjOin5pKWpoabq8WctEt8yLPPedejjsyhIeJEcZOBfAQLz7uNQ1knOndP58jppcEGK+UM3SsAgfWz9S/nrMHgyLEBInLwm3vQe+ZXfa2SVcbJrpWqX9GGzgmYVhnE1lHSGLDxe5WORMo/nw096ImOXD8Dhcqdmw2g1u1jpvlhR4F/DT7jIeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smal891lf0p8wQIZqqpi+Ny6yioJvO+558Ydx8j04FU=;
 b=IH3eGX51l8wGzhqLzv8Mho4EwSN0BxNIQJlXpngAh5w8YpU32OpljQJvCOYdJtmzEsVwbNwSvu9pVFLjm1acV1PVfm9/RJ9TBMx2QLuDDWiqNupR+R3wq8j5TPGhZqqZsEPDIBujig1Db//h9uMD14fd0WRRRnO4J+dSy7jmcTMqHQSenmfVQA8JWMhPDA3CoVv2JJieEIKB0NHjAz2E4B+0WXGQ5/oavx31GKgBnaGKTfAXlAijTWib1RoEzyTTg8bsnqqOJYk1oO1X+VlnpYm7mRc802lexogRD124mlm+d6lNJsjTFrhc5IjpqZ8sjzdq2uEgvTn5d7QGuz2oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smal891lf0p8wQIZqqpi+Ny6yioJvO+558Ydx8j04FU=;
 b=gICrAIGcDt9nDPQfCqX4ruubdMpLSQqQLO0jEu6/TnwTUF1mzw3yhD2lkkUs5Nnpr+MWbot8Z4htFJN8hsYSbelQ0ikAhOWeJJu4LDk/KdVIRz6kMDF6psQqQo1o2IZVDlYFW4XUVXbQW5uUX7Mm7zb3F5PcbJTZGQ2dN5VTYmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 SN4PR01MB7453.prod.exchangelabs.com (2603:10b6:806:200::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.14; Thu, 28 May 2026 17:29:53 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:29:53 +0000
Message-ID: <f496f502-2afa-408d-be46-3c639f4cb101@amperemail.onmicrosoft.com>
Date: Thu, 28 May 2026 13:29:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] firmware: arm_scmi: transport: Add ACPI PCC
 transport
To: linux-arm-kernel@lists.infradead.org
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
 <20260525-acpi_scmi_pcc-v2-8-4f38938d08d8@arm.com>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-8-4f38938d08d8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0907.namprd03.prod.outlook.com
 (2603:10b6:408:107::12) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|SN4PR01MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 75219696-de27-421b-a08d-08debcdeba62
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|55112099003|6133799003|18002099003|22082099003|56012099006|5023799004|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: FhH6eAiSVhTxMnn7KyTp7D/EYqLBRFqgEd9kDa9Coeg/vv4ERokK0sN3EPO7bWrsIDmEuzI4mhThRlyN56sirDovjlxeSEXUG9Zyuw1k4zL2YsvMHyLDtViJxLXsTlwHO1EiIEPiKoVOqNnoh4IwLxu4NlBYrHgZ9nJQrUcFmxnlc8y5Zx+J9FexQMAjW08rCkwT8qHlw4FelJPqv1+zWT/wfkE6d3MrH+4ZiKFtxNGlH05vvWx1bt//4JH9aGhRTl7CsIK8PEhVtUu4sPhzExkQVwqaSI2MKjQs+xBE1S0etGaqQKMQbVBw9bgAAfyNMWL1HQfjbSOeZMFEImsg5Fk99kwd/PZTxfV5sg8K8HzSdQi+32HUI2YdZw6+/JyKLeSLdj6Vbuw6KInj15TID7jcp8uplRouHUsEcx8TAG3aanSO802w0oRZYnjMrKfBwY2bCu8Pu2DzZfG1wK7Z2ip+fhCVlf9NGEGdSAo2zNHu9PtN365SYjlEsWnC+JQrA2+wM6V9cuw9y3fMoxHUkDFSgAZdevLfbTkVQl6RvvHOnhmcBsZH9dnCIqd/rtA+qQEzDT69nX2HUsNYgm0RhwYIe6sZOTV+zJ/f4ch5/ZGRjZ3cIJRvbAR4bSrNzEM7uJI1t/E75VD7rGJRfPrOLaU0HF16EcgETIWoWHEpo6lQjhuJbg2abcMiKVfgj63H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(55112099003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlI4V1FWalRVbU5wQVVadHVOVWFyYXcwbVdEOWZIelFwOCswbVloRFFEQ0pM?=
 =?utf-8?B?amFYUzhoYmJPZDdXSEFaa0h4SnRRV011YWN2dWFuUHVtOStCZW1GZGdSOXhH?=
 =?utf-8?B?T1ZCamtHQnZxTndUMTBqc1hSWFBYeU43YzdJL0VpcjBXYWNFakZSak1WTzJZ?=
 =?utf-8?B?ZzlJN1BjVDc2b3l3elNmUTJaTDcvSmhNckM2OEM1eVBXQksxV0VtL0JTM1Ir?=
 =?utf-8?B?OWM2WG5HQk9RMFg4U3huaGJOZGl4M3gyTmczUFdiYlJFWUNRdWZoZHN2NUhv?=
 =?utf-8?B?SDZQeUh4RW1ZbjEvanJMTXJ0UWV5NWJhZDBXVSs2dXd0OUZBME8yVFQ2Wkt2?=
 =?utf-8?B?bW9JSis2WmZseS9nRWgwMDhVWDc1SWtLcjN6Mkx5UHdSUkxaUXNEQVlTZVU2?=
 =?utf-8?B?NzdWS3hxdC9Scm1VRFpGR1JVYzhpRWU5N28yZ0pWNWpjWkx1Y2x6TFJhSHpv?=
 =?utf-8?B?MkFVWkJGMTVSY3dpWG5iT2JPU1gvd2Vlb0dYZWw4d01ORXNZaHBQQkFEeCs0?=
 =?utf-8?B?aVFQNHNJbUNUTWx2Q2p6dVgzbHJqYURyL1dQRnNuTU9zUlo1UjdpcGJXTy92?=
 =?utf-8?B?VnNCeGhNb0F1anI3bnBrdXVWcTN5TUo2WVZqdnJpRzR3Yzl0VVBQMEtuR3JD?=
 =?utf-8?B?c0RmV0RPeG9WVy9DZlowVWZlK0U0NE1DbTR4dDV2VjJrNTlZNklNYkUxV1V2?=
 =?utf-8?B?MGdUbXhoKzRNV2NYZHNmai91NGlWaGNaa3Vxb1hoejdzZU9jcGlreFREM0dP?=
 =?utf-8?B?TUc4QU9VM0k0dzJZRlFtREYyVmhYK2Fwck0wTjVtMVkyd1NwOCtXUGJ0ZmR0?=
 =?utf-8?B?Y2ZyeXlDSEczNk1haEF5N3ZFbS8zRG10Yk92UFBsTUFRVlNkTEJEZGJyMnlZ?=
 =?utf-8?B?bWdnTmhtMWpmQVlocWFHQWk1NE1mQjZLUzZ5emRhTTNlOXpuRDRHb3V6WVJN?=
 =?utf-8?B?d0dVcVNxRVRrUXpkM2ViWFkyajhVZS9oVUpYY3BZdlhMTGtJa3NLRkM3MTVk?=
 =?utf-8?B?UjlJRWF3VVhJZWVLaDhEY0dMd0dWRXJ0K05PdUkrRjBBTy96RUhHbjJFSEFP?=
 =?utf-8?B?U0Z0V1ZCQ1B5eGdhK09vYlVKdGt2aHFlRXkrWXFuRWxtVFozRjFjcEdjYlRU?=
 =?utf-8?B?L1pyQWtmSWJ5MWdMU0QzVnZXRjNIVzluWTNjSi90VDQ0V2lvdTdBVXhzOW9G?=
 =?utf-8?B?cWdRbWdZL1hFWlhSS3hVdmxaci9HdWRkazZXemo3TXpvNWx3WStPVkdJR0Ex?=
 =?utf-8?B?Q3VrQU53Y0k4NGFsRGNEOVdscGp5bE1rb1RwaGpTKytsWHVCTzB0b0haZUJu?=
 =?utf-8?B?ZnZaaHZVTzhFUVB2YjJML1BhL2gxdU9OcGVHcHlISVRWRFFGMVd2K3MwRGo2?=
 =?utf-8?B?akl5VU44THFUSkJsYVg5RGNFMDhmTnpjUktPRkhTZnpQeVd6c3lIOWdnWXVq?=
 =?utf-8?B?NitKc2U0ZzNwMUZwY3ZKQjAxSlAwdStzdTdMZGF0MDl6L2RrbmIwS3lMSzQ3?=
 =?utf-8?B?TjU2ME5SWDdtblliNnpHTUpYT2I1NVdEL3hJY3IvYURUM1BYdk9KMnBiQ05i?=
 =?utf-8?B?QUN0NjF4dXRObDlUL0NEaGNjU2JtaDhXaHh1WWF2ZUErK0pIUG91aHowUFZU?=
 =?utf-8?B?OHAxZmhDSkt1ZXZId0YzUjdxK2NqaENaTmpmbTh1a0tGZWhVeTRXYjFVK1hD?=
 =?utf-8?B?YXRrdW5aa3d4bWpIQnhqQmV3anFueGhUNUMxaVlWUlZzQko1RTVYUDdwaHhM?=
 =?utf-8?B?cm5aZDZ4Z1o0UCtrUWJ0YlU4SW5qUEQ0akNZV2cxY2F6TU41c01rWjdIalgr?=
 =?utf-8?B?VkJKZzZETllrYmRCaTZuR2crRlRQMUh5SkJ4UEFFS1dydG5rUUFDUnhldjd1?=
 =?utf-8?B?RXh5a1dHREUyS1BMampOczZ6Zmg1VWNWeXcyMGlmdG1jOHkwOVNvL25kSVky?=
 =?utf-8?B?dHhSdmVUaWlFQUcrQkZhbCtOdE96YzV1TDlOYzR2SnVvM1RtbC9DUUxSaVMy?=
 =?utf-8?B?Vm5UTjhvWWxpWmtwcHQ1WEpqNmdyeWJkRjIrUlZvT0xoYzM5U0Fid0xYU2xF?=
 =?utf-8?B?Q2p2cjFWdzdKU3Q5a0xEWnhlVkY5c2ppSDhvK1lWRGs3STZ1QktrNUJ3eE5S?=
 =?utf-8?B?dGd3NzF1dms3VjV1NWZnWXkreHJEZ01wNjJTVy9WRzFPUURVV1FZWnFqbUJw?=
 =?utf-8?B?cW1BQXBrdkVTMkpYZ2Z1RTRYWHB1RlN6K1hyTXdMSDZKbHA1dzROTWZaV2xB?=
 =?utf-8?B?YjU0N3ZzMVM2Rkt4WUFIVnNxS0N4ODF1dm1nRXBoN3BZM054cWNUQkRvZUU1?=
 =?utf-8?B?enllN3ljeWRPdlNEeERCRFNYTDVnYlgwVFhJclFTK1BTWDYzdG1CLzJMUzRy?=
 =?utf-8?Q?QmFoHHrUedmJ2Q1VO81wkL4i4Oh7uxvXkw5aLw9TSOmAh?=
X-MS-Exchange-AntiSpam-MessageData-1: pcUr+LyeLc8Mqp18mkZEvp+ub4WakRoc8SG0y00q3sgJUzukW9qb8CN3
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75219696-de27-421b-a08d-08debcdeba62
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:29:53.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/AMCoxBhkWbHeLTsW8cQtO8DXNZXyRCc1GotKkyjXEOXbPpD1uMJaMSNfEoOBW3siwzdKOHe720LpW5ieCa5Wro0HAPYurx5PNe9YDyA77Ebv/Se/m2vFQMIdjnQ/GC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR01MB7453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_103000_263773_65DE26E7 
X-CRM114-Status: GOOD (  27.65  )
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



On 5/25/26 16:42, Sudeep Holla wrote:
> Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
> protocols to PCC subspace UIDs, supports shared TX/RX channels, and
> optionally sets up a P2A channel for notifications.
>
> Key points:
> - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> - integration with SCMI core via scmi_desc and transport ops
> - response/notification fetch from PCC shared memory header/payload
> - ACPI device matching and registration via the ACPI transport macro
>
> This enables SCMI to be exercised over PCC on ACPI platforms.
>
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>   drivers/firmware/arm_scmi/common.h            |  11 +
>   drivers/firmware/arm_scmi/transports/Kconfig  |  12 +
>   drivers/firmware/arm_scmi/transports/Makefile |   2 +
>   drivers/firmware/arm_scmi/transports/pcc.c    | 593 ++++++++++++++++++++++++++
>   include/linux/scmi_protocol.h                 |   1 +
>   5 files changed, 619 insertions(+)
>
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 347e0da0d9cc..e4b2e1d3e7e7 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -465,6 +465,17 @@ struct scmi_transport_core_operations {
>   	const struct scmi_message_operations *msg;
>   };
>   
> +struct scmi_dsd_info {
> +	u32 protocol_id;
> +	const char *const property_name;
> +};
> +
> +static struct scmi_dsd_info scmi_dsd_info_list[] = {
> +	{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc"},
> +	{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap"},
> +	{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry"},
> +};
> +
>   /**
>    * struct scmi_transport  - A structure representing a configured transport
>    *
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm_scmi/transports/Kconfig
> index 57eccf316e26..4936078f279f 100644
> --- a/drivers/firmware/arm_scmi/transports/Kconfig
> +++ b/drivers/firmware/arm_scmi/transports/Kconfig
> @@ -77,6 +77,18 @@ config ARM_SCMI_TRANSPORT_OPTEE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called scmi_transport_optee.
>   
> +config ARM_SCMI_TRANSPORT_PCC
> +	tristate "SCMI transport based on ACPI PCC"
> +	depends on PCC
> +	select ARM_SCMI_HAVE_TRANSPORT
> +	help
> +	  Enable ACPI PCC mailbox based transport for SCMI.
> +
> +	  If you want the ARM SCMI PROTOCOL stack to include support for a
> +	  transport based on mailboxes, answer Y.
> +	  This driver can also be built as a module. If so, the module
> +	  will be called scmi_transport_pcc.
> +
>   config ARM_SCMI_TRANSPORT_VIRTIO
>   	tristate "SCMI transport based on VirtIO"
>   	depends on VIRTIO
> diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/arm_scmi/transports/Makefile
> index 3ba3d3bee151..e7c4b8de6251 100644
> --- a/drivers/firmware/arm_scmi/transports/Makefile
> +++ b/drivers/firmware/arm_scmi/transports/Makefile
> @@ -7,6 +7,8 @@ scmi_transport_mailbox-objs := mailbox.o
>   obj-$(CONFIG_ARM_SCMI_TRANSPORT_MAILBOX) += scmi_transport_mailbox.o
>   scmi_transport_optee-objs := optee.o
>   obj-$(CONFIG_ARM_SCMI_TRANSPORT_OPTEE) += scmi_transport_optee.o
> +scmi_transport_pcc-objs := pcc.o
> +obj-$(CONFIG_ARM_SCMI_TRANSPORT_PCC) += scmi_transport_pcc.o
>   scmi_transport_virtio-objs := virtio.o
>   obj-$(CONFIG_ARM_SCMI_TRANSPORT_VIRTIO) += scmi_transport_virtio.o
>   
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> new file mode 100644
> index 000000000000..aaebd1530370
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c
> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) Message ACPI PCC
> + * Transport Driver
> + *
> + * This transport uses ACPI PCC (PCCT Type 3/4) subspaces via the Linux
> + * PCC mailbox controller to exchange SCMI messages over the standard
> + * SCMI Shared Memory Transport (SMT) layout.
> + *
> + * PCC subspace selection is conveyed via ACPI SCMI namespace device.
> + *
> + * Copyright (C) 2025
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/hashtable.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <acpi/pcc.h>
> +
> +#include "../common.h"
> +
> +#define SCMI_SHMEM_FLAG_INTR_ENABLED		BIT(0)
> +#define SCMI_TRANSPORT_PACKAGE_MAX_VERSION	(1)
> +#define SCMI_PROTOCOL_PACKAGE_MAX_VERSION	(1)
> +#define SCMI_TRANSPORT_SHARED_CHANNEL		BIT_ULL(0)
> +#define SCMI_TRANSPORT_P2A_CHANNEL		BIT_ULL(1)
> +#define SCMI_TRANSPORT_FLAGS_MASK		(SCMI_TRANSPORT_SHARED_CHANNEL | \
> +					 SCMI_TRANSPORT_P2A_CHANNEL)
> +
> +/*
> + * SCMI specification requires all parameters, message headers, return
> + * arguments or any protocol data to be expressed in little endian
> + * format only.
> + */
> +struct pcc_shared_mem {
> +	struct acpi_pcct_ext_pcc_shared_memory header;
> +	u8 msg_payload[];
> +};
> +
> +/**
> + * struct scmi_pcc - Structure representing a SCMI mailbox transport
> + *
> + * @cl: Mailbox Client
> + * @pchan: Transmit/Receive PCC/mailbox channel
> + * @cinfo: SCMI channel info
> + * @shmem: Transmit/Receive shared memory area
> + */
> +struct scmi_pcc {
> +	struct mbox_client cl;
> +	struct pcc_mbox_chan *pchan;
> +	struct scmi_chan_info *cinfo;
> +};
> +
> +struct pcc_transport {
> +	u32 uid;
> +	u32 pcc_ss_id;
> +	u32 protocol_id;
> +	u32 flags;
> +	struct hlist_node hnode;
> +};
> +
> +/* Not all MAX_PCC_SUBSPACES will be used for SCMI, keeping it at 16 for now */
> +static DECLARE_HASHTABLE(pcc_id_hash, ilog2(MAX_PCC_SUBSPACES / 8));
> +
> +#define client_to_scmi_pcc(c) container_of(c, struct scmi_pcc, cl)
> +
> +static struct scmi_transport_core_operations *core;
> +
> +static void acpi_scmi_clear_transport_hash(void)
> +{
> +	struct pcc_transport *p;
> +	struct hlist_node *tmp;
> +	int idx;
> +
> +	hash_for_each_safe(pcc_id_hash, idx, tmp, p, hnode) {
> +		hash_del(&p->hnode);
> +		kfree(p);
> +	}
> +}
> +
> +static int acpi_scmi_dsd_parse_transport_package(const union acpi_object *obj)
> +{
> +	unsigned int revision, pkg_cnt;
> +	unsigned int common_a2p = 0, common_p2a = 0;
> +	int idx;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2)
> +		return -EINVAL;
> +	if (obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
> +	    obj->package.elements[1].type != ACPI_TYPE_INTEGER)
> +		return -EINVAL;
> +
> +	revision = obj->package.elements[0].integer.value;
> +	pkg_cnt = obj->package.elements[1].integer.value;
> +
> +	if (revision != SCMI_TRANSPORT_PACKAGE_MAX_VERSION)
> +		return -EINVAL;
> +	if (obj->package.count != pkg_cnt + 2)
> +		return -EINVAL;
> +
> +	for (idx = 0; idx < pkg_cnt; idx++) {
> +		union acpi_object *pack = &obj->package.elements[idx + 2];
> +		struct pcc_transport *p, *tmp;
> +		u64 flags;
> +		u32 uid;
> +
> +		if (pack->type != ACPI_TYPE_PACKAGE || pack->package.count != 3) {
> +			pr_info("Invalid transport properties pkg %d\n", idx);
> +			return -EINVAL;
> +		}
> +		if (pack->package.elements[0].type != ACPI_TYPE_INTEGER ||
> +		    pack->package.elements[1].type != ACPI_TYPE_INTEGER ||
> +		    pack->package.elements[2].type != ACPI_TYPE_INTEGER)
> +			return -EINVAL;
> +		if (pack->package.elements[0].integer.value > U32_MAX ||
> +		    pack->package.elements[1].integer.value > U32_MAX)
> +			return -EINVAL;
> +
> +		flags = pack->package.elements[2].integer.value;
> +		if (flags & ~SCMI_TRANSPORT_FLAGS_MASK)
> +			return -EINVAL;
> +
> +		uid = pack->package.elements[1].integer.value;
> +		hash_for_each_possible(pcc_id_hash, tmp, hnode, uid) {
> +			if (tmp->uid == uid) {
> +				pr_info("Duplicate UID %d\n", uid);
> +				return -EEXIST;
> +			}
> +		}
> +
> +		p = kzalloc(sizeof(*p), GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +
> +		p->uid = uid;
> +		p->pcc_ss_id = pack->package.elements[0].integer.value;
> +		p->flags = flags;
> +		if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +			p->protocol_id = SCMI_PROTOCOL_BASE;
> +			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)
> +				common_p2a++;
> +			else
> +				common_a2p++;
> +		}
> +
> +		hash_add(pcc_id_hash, &p->hnode, uid);
> +	}
> +
> +	if (common_a2p != 1 || common_p2a > 1)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int acpi_scmi_dsd_parse_protocol_subpackage(const union acpi_object *obj,
> +						   int prot_id)
> +{
> +	bool found, tx_found = false, rx_found = false;
> +	u32 uid;
> +	int idx, ret = 0;
> +	struct pcc_transport *p;
> +	unsigned int pkg_cnt = obj->package.count;
> +
> +	if (pkg_cnt > 2) {
> +		pr_warn("Only 2 channels: one Tx and one Rx needed\n");
> +		return -EINVAL;
> +	}
> +
> +	for (idx = 0; idx < pkg_cnt; idx++) {
> +		union acpi_object *pack = &obj->package.elements[idx];
> +		u64 flags;
> +
> +		if (pack->type != ACPI_TYPE_PACKAGE || pack->package.count != 2)
> +			return -EINVAL;
> +		if (pack->package.elements[0].type != ACPI_TYPE_INTEGER ||
> +		    pack->package.elements[1].type != ACPI_TYPE_INTEGER)
> +			return -EINVAL;
> +		if (pack->package.elements[0].integer.value > U32_MAX)
> +			return -EINVAL;
> +
> +		flags = pack->package.elements[1].integer.value;
> +		if (flags)
> +			return -EINVAL;
> +
> +		uid = pack->package.elements[0].integer.value;
> +		found = false;
> +		hash_for_each_possible(pcc_id_hash, p, hnode, uid) {
> +			if (p->uid != uid)
> +				continue;
> +
> +			found = true;
> +			if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +				pr_info("Invalid! %d channel is shared\n",
> +					p->pcc_ss_id);
> +				ret = -EINVAL;
> +				break;
> +			}
> +			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL) {
> +				if (rx_found)
> +					return -EINVAL;
> +				rx_found = true;
> +			} else {
> +				if (tx_found)
> +					return -EINVAL;
> +				tx_found = true;
> +			}
> +			p->protocol_id = prot_id;
> +			break;
> +		}
> +
> +		if (ret)
> +			return ret;
> +		if (!found)
> +			return -ENOENT;
> +	}
> +
> +	return ret;
> +}
> +
> +static int
> +acpi_scmi_dsd_parse_protocol_package(const union acpi_object *obj, int prot_id)
> +{
> +	unsigned int revision;
> +	union acpi_object *pack;
> +	int ret;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
> +		return -EINVAL;
> +	if (obj->package.elements[0].type != ACPI_TYPE_INTEGER)
> +		return -EINVAL;
> +
> +	revision = obj->package.elements[0].integer.value;
> +	pack = &obj->package.elements[1];
> +
> +	if (revision != SCMI_PROTOCOL_PACKAGE_MAX_VERSION)
> +		return -EINVAL;
> +
> +	if (pack->type != ACPI_TYPE_PACKAGE) {
> +		pr_info("Invalid protocol transport package\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Empty protocol specific transport package allowed */
> +	if (pack->package.count != 0) {
> +		ret = acpi_scmi_dsd_parse_protocol_subpackage(pack, prot_id);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pack = &obj->package.elements[2];
> +	if (pack->type != ACPI_TYPE_PACKAGE) {
> +		pr_info("Invalid protocol transport association package\n");
> +		return -EINVAL;
> +	}
> +
> +	if (pack->package.count != 0) {
> +		pr_info("Non-empty association package not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* ACPI SCMI _DSD UUID: "84a2d1c6-86b6-4199-8dac-9c17449d5e03" */
> +static const guid_t acpi_scmi_uuid = GUID_INIT(0x84a2d1c6, 0x86b6, 0x4199,
> +					       0x8d, 0xac, 0x9c, 0x17,
> +					       0x44, 0x9d, 0x5e, 0x03);
> +
> +static int acpi_scmi_lookup_protocol_id(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(scmi_dsd_info_list); i++) {
> +		if (!strcmp(name, scmi_dsd_info_list[i].property_name))
> +			return scmi_dsd_info_list[i].protocol_id;
> +	}
> +	return -ENOENT;
> +}
> +
> +static int acpi_scmi_parse_properties(const union acpi_object *properties)
> +{
> +	int i;
> +
> +	if (properties->type != ACPI_TYPE_PACKAGE)
> +		return -EINVAL;
> +
> +	for (i = 0; i < properties->package.count; i++) {
> +		const union acpi_object *property;
> +		const union acpi_object *k, *v;
> +		int prot_id, ret;
> +
> +		property = &properties->package.elements[i];
> +		if (property->type != ACPI_TYPE_PACKAGE ||
> +		    property->package.count != 2)
> +			return -EINVAL;
> +
> +		k = &property->package.elements[0];
> +		v = &property->package.elements[1];
> +
> +		if (k->type != ACPI_TYPE_STRING || !k->string.pointer)
> +			return -EINVAL;
> +		if (v->type != ACPI_TYPE_PACKAGE)
> +			return -EINVAL;
> +
> +		prot_id = acpi_scmi_lookup_protocol_id(k->string.pointer);
> +		if (prot_id < 0)
> +			return -EINVAL;
> +
> +		/*
> +		 * We validate structure inside the dedicated parsing functions.
> +		 * They return proper errors and avoid double-validation.
> +		 */
> +		if (prot_id == SCMI_PROTOCOL_BASE)
> +			ret = acpi_scmi_dsd_parse_transport_package(v);
> +		else
> +			ret = acpi_scmi_dsd_parse_protocol_package(v, prot_id);
> +
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int acpi_scmi_parse_dsd(struct acpi_device *adev)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *desc;
> +	acpi_status status;
> +	int i, ret = -ENOENT;
> +
> +	if (!adev->handle)
> +		return -EINVAL;
> +
> +	status = acpi_evaluate_object_typed(adev->handle, "_DSD", NULL, &buf,
> +					    ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	desc = buf.pointer;
> +	if (desc->package.count % 2)
> +		goto out_free_inval;
> +
> +	/* Look for the device properties GUID. */
> +	for (i = 0; i < desc->package.count; i += 2) {
> +		const union acpi_object *guid;
> +		const union acpi_object *properties;
> +
> +		guid = &desc->package.elements[i];
> +		properties = &desc->package.elements[i + 1];
> +
> +		/*
> +		 * The first element must be a GUID and the second one must be
> +		 * a package.
> +		 */
> +		if (guid->type != ACPI_TYPE_BUFFER ||
> +		    guid->buffer.length != UUID_SIZE ||
> +		    properties->type != ACPI_TYPE_PACKAGE)
> +			continue;
> +
> +		if (!guid_equal((guid_t *)guid->buffer.pointer,
> +				&acpi_scmi_uuid))
> +			continue;
> +
> +		ret = acpi_scmi_parse_properties(properties);
> +		goto out_free;
> +	}
> +
> +out_free:
> +	ACPI_FREE(buf.pointer);
> +	return ret;
> +out_free_inval:
> +	ret = -EINVAL;
> +	goto out_free;
> +}
> +
> +static int acpi_scmi_namespace_device_parse(struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> +	int ret;
> +
> +	acpi_scmi_clear_transport_hash();
> +	hash_init(pcc_id_hash);
> +
> +	ret = acpi_scmi_parse_dsd(adev);
> +	if (ret)
> +		acpi_scmi_clear_transport_hash();
> +
> +	return ret;
> +}
> +
> +static int pcc_get_ss_id(u32 prot_id, bool tx)
> +{
> +	struct pcc_transport *p;
> +	int idx;
> +
> +	hash_for_each(pcc_id_hash, idx, p, hnode) {
> +		if (p->protocol_id != prot_id)
> +			continue;
> +
> +		if ((!tx && (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)) ||
> +		    (tx && !(p->flags & SCMI_TRANSPORT_P2A_CHANNEL)))
> +			return p->pcc_ss_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static bool
> +pcc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
> +{
> +	/*
> +	 * Parse the ACPI SCMI namespace device on each Tx-channel lookup and
> +	 * reuse the resulting mapping for the matching Rx lookup. Defer full
> +	 * validation until pcc_chan_setup() for simplicity.
> +	 */
> +	if (!idx && acpi_scmi_namespace_device_parse(fwnode))
> +		return false;
> +
> +	if (pcc_get_ss_id(prot_id, idx ? false : true) < 0)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void tx_prepare(struct mbox_client *cl, void *m)
> +{
> +	struct scmi_pcc *smbox = client_to_scmi_pcc(cl);
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	struct scmi_xfer *xfer = m;
> +
> +	/*
> +	 * PCC take cares not to call tx_prepare until last transmit is done
> +	 * Mark channel busy + clear error, request platform IRQ if available
> +	 */
> +	if (smbox->pchan->mchan->mbox->txdone_irq)
> +		iowrite32(SCMI_SHMEM_FLAG_INTR_ENABLED, &shmem->header.flags);
> +	iowrite32(sizeof(shmem->header.command) + xfer->tx.len,
> +		  &shmem->header.length);
> +	iowrite32(pack_scmi_header(&xfer->hdr), &shmem->header.command);
> +	if (xfer->tx.buf)
> +		memcpy_toio(shmem->msg_payload, xfer->tx.buf, xfer->tx.len);
> +}
> +
> +static void rx_callback(struct mbox_client *cl, void *m)
> +{
> +	struct scmi_pcc *smbox = client_to_scmi_pcc(cl);
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +
> +	core->rx_callback(smbox->cinfo, ioread32(&shmem->header.command), NULL);
> +}
> +
> +static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> +			  bool tx)
> +{
> +	const char *desc = tx ? "Tx" : "Rx";
> +	struct device *cdev = cinfo->dev;
> +	struct scmi_pcc *smbox;
> +	int ret, ss_id;
> +	struct mbox_client *cl;
> +
> +	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
> +	if (!smbox)
> +		return -ENOMEM;
> +
> +	cl = &smbox->cl;
> +	cl->dev = cdev;
> +	cl->tx_prepare = tx ? tx_prepare : NULL;
> +	cl->rx_callback = rx_callback;
> +	cl->tx_block = false;
> +
> +	ss_id = pcc_get_ss_id(cinfo->id, tx);
> +	if (ss_id < 0)
> +		return ss_id;
> +
> +	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> +	if (IS_ERR(smbox->pchan)) {
> +		ret = PTR_ERR(smbox->pchan);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(cdev,
> +				"failed to request SCMI %s mailbox\n", desc);
> +		return ret;
> +	}
> +
> +	cinfo->transport_info = smbox;
> +	smbox->cinfo = cinfo;
> +
> +	return 0;
> +}
> +
> +static int pcc_chan_free(int id, void *p, void *data)
> +{
> +	struct scmi_chan_info *cinfo = p;
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +
> +	if (smbox && !IS_ERR(smbox->pchan)) {
> +		pcc_mbox_free_channel(smbox->pchan);
> +		cinfo->transport_info = NULL;
> +		smbox->pchan = NULL;
> +		smbox->cinfo = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +pcc_send_message(struct scmi_chan_info *cinfo, struct scmi_xfer *xfer)
> +{
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +	int ret;
> +
> +	/*
> +	 * The mailbox layer has its own queue. However the mailbox queue
> +	 * confuses the per message SCMI timeouts since the clock starts when
> +	 * the message is submitted into the mailbox queue. So when multiple
> +	 * messages are queued up the clock starts on all messages instead of
> +	 * only the one inflight.
> +	 */
> +	ret = mbox_send_message(smbox->pchan->mchan, xfer);


 From a Codex based code review:

High: the transport reintroduces the mailbox-queue timeout bug that the 
existing SCMI mailbox transport already had to work around. The new code 
copies the warning comment about queued mailbox messages confusing SCMI 
timeouts, but still calls `mbox_send_message()` directly with no channel 
mutex, no `cl->knows_txdone`, and no `mark_txdone` hook 
([pcc.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/pcc.c#L472), 
[pcc.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/pcc.c#L518), 
[pcc.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/pcc.c#L525)). 


Generic mailbox queues non-blocking sends immediately 
([mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/mailbox.c#L243), 
[mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/mailbox.c#L279)), 
while SCMI starts its per-message timeout as soon as `.send_message()` 
returns 
([driver.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/driver.c#L1446), 
[driver.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/driver.c#L1458)). 


The existing mailbox transport fixes exactly this by serializing with 
`chan_lock`, setting `knows_txdone`, and only releasing the mailbox slot 
from `mark_txdone()` after SCMI has finished with the response 
([mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/mailbox.c#L217), 
[mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/mailbox.c#L251), 
[mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/mailbox.c#L275), 
[mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/mailbox.c#L300)). 


Under concurrent SCMI traffic on a shared PCC channel, later requests 
can expire while they are still just sitting in the mailbox framework queue.


> +	/* mbox_send_message returns non-negative value on success */
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void pcc_fetch_response(struct scmi_chan_info *cinfo,
> +			       struct scmi_xfer *xfer)
> +{
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	size_t len = ioread32(&shmem->header.length);
> +
> +	xfer->hdr.status = ioread32(shmem->msg_payload);
> +	/* Skip the length of header and status in shmem area i.e 8 bytes */
> +	xfer->rx.len = min_t(size_t, xfer->rx.len, len > 8 ? len - 8 : 0);
> +
> +	/* Take a copy to the rx buffer.. */
> +	memcpy_fromio(xfer->rx.buf, shmem->msg_payload + 4, xfer->rx.len);
> +}
> +
> +static void pcc_fetch_notification(struct scmi_chan_info *cinfo, size_t max_len,
> +				   struct scmi_xfer *xfer)
> +{
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	size_t len = ioread32(&shmem->header.length);
> +
> +	/* Skip only the length of header in shmem area i.e 4 bytes */
> +	xfer->rx.len = min_t(size_t, max_len, len > 4 ? len - 4 : 0);
> +
> +	/* Take a copy to the rx buffer.. */
> +	memcpy_fromio(xfer->rx.buf, shmem->msg_payload, xfer->rx.len);
> +}
> +
> +static const struct scmi_transport_ops scmi_pcc_ops = {
> +	.chan_available = pcc_chan_available,
> +	.chan_setup = pcc_chan_setup,
> +	.chan_free = pcc_chan_free,
> +	.send_message = pcc_send_message,
> +	.fetch_response = pcc_fetch_response,
> +	.fetch_notification = pcc_fetch_notification,
> +};

I think this is OK< but we should make it explicit that this is not 
going to work for Polled devices:

"- High: the new transport does not work on valid PCC configurations 
that rely on mailbox polling instead of an interrupt. The PCC mailbox 
controller explicitly falls back to `txdone_poll` when 
`ACPI_PCCT_DOORBELL` is absent 
([pcc.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/pcc.c#L800), 
[pcc.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/pcc.c#L806)), but the 
SCMI PCC transport never sets `no_completion_irq`, never provides 
`poll_done`, and does not advertise `sync_cmds_completed_on_ret` 
([pcc.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/pcc.c#L562), 
[pcc.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/transports/pcc.c#L575)). 
SCMI core therefore waits on `xfer->done` in interrupt mode 
([driver.c](/root/linux.a6c6b6fcb1c8/drivers/firmware/arm_scmi/driver.c#L1317)), 
but mailbox polling only advances the TX state machine via `tx_tick()` 
and never invokes the transport `rx_callback` that would complete the 
transfer 
([mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/mailbox.c#L105), 
[mailbox.c](/root/linux.a6c6b6fcb1c8/drivers/mailbox/mailbox.c#L118)). 
The result is deterministic request timeout on non-IRQ PCC subspaces."


I think those values can all be deduced from the PCCT entries. It might 
be worth a "BUG-ON" if someone does provide a broken configuration.




> +
> +static struct scmi_desc scmi_pcc_desc = {
> +	.ops = &scmi_pcc_ops,
> +	.max_rx_timeout_ms = 30,	/* We may increase this if required */
> +	.max_msg = 20,		/* Limited by MBOX_TX_QUEUE_LEN */
> +	.max_msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE,
> +};
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id scmi_acpi_ids[] = {
> +	{ "ARML0001", 0 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, scmi_acpi_ids);
> +#endif
> +
> +DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(scmi_pcc, scmi_pcc_driver,
> +				  scmi_pcc_desc, scmi_acpi_ids, core);
> +module_platform_driver(scmi_pcc_driver);
> +
> +MODULE_AUTHOR("Sudeep Holla <sudeep.holla@kernel.org>");
> +MODULE_DESCRIPTION("SCMI ACPI PCC Transport driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index aafaac1496b0..d4ab8d918ee9 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -926,6 +926,7 @@ enum scmi_std_protocol {
>   	SCMI_PROTOCOL_VOLTAGE = 0x17,
>   	SCMI_PROTOCOL_POWERCAP = 0x18,
>   	SCMI_PROTOCOL_PINCTRL = 0x19,
> +	SCMI_PROTOCOL_TELEMETRY = 0x1B,
>   };
>   
>   enum scmi_system_events {
>

