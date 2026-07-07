Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c2JCMSZknl1LehNnC9C8RZIW+053AEegzZSDONjhKM=; b=szMZUTTCGjYecTkgDAj4GnaOo4
	v500EtWSBlDRYPqbhLrr9ar4TN5d+pWFtJhM7mCUeEL9IbEbgb88kQz/OlJ6hsVcD7XJv5NtL/LPs
	39xhprox06oOPjeuXk3+/R2HunmVHY614vh+v5C2nXcV9mY0B8OTONStCJOr0zA7Da6QjNb3iyqoR
	Tag5ug3PwY+7eFvBn8+AB+MLS7te7ClQWArzQ3xNmP6cVJsjFvi5UIt6XbYC0Iv7B8eAsgElBTlXm
	0eYDd+ji/U7AEMXyyngvfRTQx21HTLalYJr499XQbtnfDScMaD3N1IZ7QBBXXR+FS0pn5tT8MUf7f
	9QRrC6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1fI-0000000EYum-1KAU;
	Tue, 07 Jul 2026 09:00:28 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1fF-0000000EYu8-2pXh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:00:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv1vHjkSm/eh8so6oDkvjdENhQQ1RvClq9iS3kbyht0qoAJVNgO442RPzTVjyMNCUxX3UMRgD7JKpJ5IDXuwoZcLwN3JpKYUxCen9RoGHA0a08imL14o0ik2pZItxE3XHfNo0dqt1tWohLdTc4Hsx+AVIhgSz7+/Uewp/trKqK0hpR+l+OG2F6Cq/+VZhnaSRtpjSZ91G6TMKEl2LgfbAMkPAsiF486lqyd+Xs4MJxP2EwAHTXp6zAJ3jHjr5/sWFAyK80zUjykTM7JgxYMSE2Gp2plrffk4lbdvT+vzzgDejONe7J7ZgnMI/GekSNxnRTXzDgmMkqFbZsQcdMvIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c2JCMSZknl1LehNnC9C8RZIW+053AEegzZSDONjhKM=;
 b=UIjH1JrTJKOnujl5v1behQbt9ioLZbA3ZdY8zq8Wvarvi5b56qx9zTIKR8yJmWTuLCoKWZgV50lhHlXSJXI5Cgb65HP4sXp8wrnIFsAkgO6uXm8Uu9OyrzU95BJRSmbYlct1atpdldEDepM2+jUkQJxXT6CxB0fVAqzJmGr/9CnktkB9iGIkZ4x56oxY8Yu32Rv47vHrCTIjHUTHdmwc7mad3itz7giU0bhsRJoECc3gDDoUEKMMCH4rK91Jppi9LJO4ZN5u4xWCm5DWLTsueP01/pZ7+SVb38WLP8Aor1rzRBLcDqgqd82rIP5dI5ehwc60y/P/YrHmPyQiVIGP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c2JCMSZknl1LehNnC9C8RZIW+053AEegzZSDONjhKM=;
 b=1+87m6F1OsC2S7ybUvp4E/jc7kmpLZpNBTdcWWtMF0WxvDiWrnRZwN/JLJdjnFNCduACTK58ZKHhaNrMaLNQoxRufXWi6tG41hCa/Cyq8Ivj/xJQXPjZQCLWgsQNreuyXa1f7lrrT0EitPG/zq+P0uewJ7Uf/mLg5QYGIe0ktH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:00:15 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 09:00:15 +0000
Message-ID: <0fa17ad2-23a2-453a-85f5-7767e0ec0575@amd.com>
Date: Tue, 7 Jul 2026 14:30:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: xilinx: Remove EDK/Ethernet references
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0222.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::15) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: d59809db-5734-43ca-a32d-08dedc06295f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0Np53m08lWXW15KwFja+/TNjwonmKr7nNb7RkWt6jU8XsBWiNxRKTZBg7X7A23R4/2EBKBD4nRaBxemzXGgwAI59qnk9Yw0WU82GtApC0t0Aai6Vk/bYewut4UrfkGKahRQgSs7GNAsVXKU/AQ2SqKcn1+bnEORZVdMNUiCRQbSLeZIxheUNPoCqiQZxpXJIHB6k02r3NEGaS5HyQf8uK3vGw+o8A9cUzc6Ty5M1iAXp+nyIWEaaXKaelPEFgnvGB+PkxtOlRiWIphpyDE1kPpx2Ii9BOTS8Cp9HQaONo8ZNzM8gsSin+yQtnFMN3o5J2O3Bn3Wh27JnuHd87ZmvQpdyDIMmV4TMDYIYx9UIYjLNe+ac/qYr85tgB7zpAqsF8X8+u1CJgmM4u5meh23xxYOyNJKuFPWobm5QZ5igfuKkNM6+Xrmtmf0rn32YtXVBwINXVSyyTPPDhTC4fA4uVe037PY57XUXqa8YvPZ1GM82IAPKAp6Osj1y/2TjwcwUdhBr/40+pxG3Nu8JPbDoePv205fJm0e+Tc0M+lXpI4YU2j7/Xqk+C9Ous9b0QJ879Ro4W7f0yED2bKWAB33eULH3ZIl1zKpsFi19T05JWWkRAJCbJyHUi36l/uu5m23rtuIx2rwULRoxnHq8wxiYPWKebRSt38/xFpsr1mQcM7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0oyL1lOL0dDeWE4QWxwaU9ERlg5dHRLd0ZwdE50ZFJpY1huSzk0eE9EN2s1?=
 =?utf-8?B?T1BxZWlDeVJRa1VnQXNybVpGTVRIUExBRG0zZW9oV21hcDg4V2F2TzVZclp2?=
 =?utf-8?B?dGVjM1Axd1pReEM2b3NKQXVxNW8wSUx4b3lvSlRaQ0hJKzNkbk1jWEFTMXVU?=
 =?utf-8?B?STA5TU1JVjBHcklocEkwN1BHcjUrdmd6UnhXMTJ6czJrTkQ4VVA3aHROMTNo?=
 =?utf-8?B?THJYamplSW5UMThyS2VUVW5BZ0M3SER2VTVqV3k0UjBLNElZeWk4NEJ3S1BU?=
 =?utf-8?B?aHh3ZXBDdkxUTGhKaTF6SzZyT2xGZGlGbE9VbXpiOXdxUDZXR1h5UjRqc2M4?=
 =?utf-8?B?ZmZvK0JHVWkzQ3VSeTc4djdXYThZSzdtalROdThWYWQza2xrTk51aHNjcGJX?=
 =?utf-8?B?SVdKazdXaTVISjNJWnRPMHJIdU9BSmtxVjMza0RrNGlUY01WSnFyMkNWRER5?=
 =?utf-8?B?VUl5SnB3SjZSa09jRlllOGl0YTJkZmNpQnNWM01NL0R5M3pldzYra2VENnBJ?=
 =?utf-8?B?SmdlMHFVZXFXejlET3l3UHR1L1lZamRxTzFMcFdsNGVobzBPSUE3VDFJS3Bq?=
 =?utf-8?B?ckI3R0N6NUwvdnBwU1NCU3c0VEFTVFJMV3A2SERaQlNXYUxReUZDNDhENXFG?=
 =?utf-8?B?MmdTNWp3TVp0azFmbVBJekVielpLcElRZzJhN2c1RHdvZlV5TVRta0wvN3lI?=
 =?utf-8?B?NENGa0xwUUVoSmhwVHVSYjFaeGFKWnRQRXcxRWhQOU0yZ1R6c0lDcm5hTjVq?=
 =?utf-8?B?K21QaUt4Mi9iaE0yTXA1WEE3UE5yc3gvL2FJN2RZVm9MQWE2RENCNWsyUlJU?=
 =?utf-8?B?R2RzZXpRbjhMVUZlc2xyS3VET1VWaFhjajZoYVpEUkd3Sjc5MUNod0VPdlRl?=
 =?utf-8?B?azBpWkJUamJ5eEkvK0VvUy83alRyaFFETHc2MjVpV01GYnpxSzlmekM2RHdP?=
 =?utf-8?B?M1p5azdOZnU5T3BiVW1YWlgxYyt2STlzdVZNdEZaZ2JtSHhXMko4dExza1kx?=
 =?utf-8?B?blZ2ZTNVdDY0UHVsblRoSU9oTlQzTDJvOFh4M0E1RGlzK21JOTZJWkRWYjBV?=
 =?utf-8?B?REZybkVRcEZzNTd0NVJtMjZYQzE1a0JLTHI4Y2FkY2h6KzN6cnRJR2EzM1dl?=
 =?utf-8?B?WnRTUDRjT3IyTE9ZWU5sV2RNYXhGR1RETURiTEtJRUhzcERkdEkwYzIwa1hK?=
 =?utf-8?B?c3dZeWVkc3h1ZUIxVExWN0pNUzVUVWlqUXFKTWhlTnA5Z0JhOExQS3JBMWFN?=
 =?utf-8?B?Y2Rwd0FkWS82ZVNEaUF5L3V4UUhNOC9YSTdmd2dTSmlQVzRnclVWNW1Wbko3?=
 =?utf-8?B?bUlCbmxla0g2eGFxRW5hUk9ROGdlVlRIeDhvVy9zNmI5UlA5Qm5EemgwWk1D?=
 =?utf-8?B?QlZTTVdOWVNVN2N3QXFjMEpEMEJwSjF0OUZDYk50VHVYWWlJcWN4VVptV3da?=
 =?utf-8?B?RkZCQzBKK2NyK1hYOWNWa1FPWjkrYkVMMC9GSkRGeU9SNW9HemtvZHkyaTND?=
 =?utf-8?B?bVdmZEpvYzBBVElNMnJXQ0RDTkJMM01NeXE4Q0JxTFpZSkhhSFZWdTZuSElB?=
 =?utf-8?B?cUs5QU9pQk9kSmpBZ0EvcGI1a3M4ZE85WVgycHBrWGRkOWZCdnQzVVpEdEJ4?=
 =?utf-8?B?Rjc2czdDaVM0QkJKbWN5QXRkWVhDUGVSMnJKTEVFYTFmVm9WYkhzOUNzMTR2?=
 =?utf-8?B?WmltS3BDaFhwN3oyR1JldWtkWVdLUjJLajMwTW5UektrYVNWbnVCRFM5emhx?=
 =?utf-8?B?MEtzRjgweGV6aklEbjVnWXRDcHZQM3NqWksrRGhRejI3TXdwRThWdE9hbjk4?=
 =?utf-8?B?bGp6YldJOEJyVVVTeGp4ZHNLdEtGeGxCWkUvV2M3Q1p0bkJsS1BRTUVNYWtX?=
 =?utf-8?B?RUZjaUhtNXJqOElVVk5sRGpNa0ZCTGhjWHRlRGIySlc5MTV1WEdHRUp4dU5y?=
 =?utf-8?B?eHJYNWRKWTc0QW12a3M2UnRBTmNRTm82QkF2VmFIbEoxSEtuZTRPRGxzQzNi?=
 =?utf-8?B?SjZrY1pOYmhRSEYzWm50dElENHNqMW1hYTRyWlNmRldBd05QNUxLV0hlQUx2?=
 =?utf-8?B?UExHN2Q4dUJ3MkQrQjdYRGIyV1piUG45U2duR0FlR0VVVVVQcWtFeDhrcjZs?=
 =?utf-8?B?ejZGa09nUVhCSkZpNFd6MjZ0dXB6bTRxL3loTHRBU2hGbG85SG1MRGFNN3A1?=
 =?utf-8?B?SnU4ZEZEeGR6WFpWSnFyTzJNNXBCOHBuR1Q1SnJVNzZHc29TNkUxd1BTaXNX?=
 =?utf-8?B?TllrY043Q2dzUXZMam0rb2l3bHBsZEV6aFp3WXFVYkJqRFNrcVhldGpmZ1VL?=
 =?utf-8?B?eVZFb3hhVWl1Rm9UMWdCWjBSVUFIN3BWSGNiUmJyNDZQbWxlZGVWZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59809db-5734-43ca-a32d-08dedc06295f
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:00:15.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbaGWXrRUCezb3Poe/eSXs1pFN3BxF+/SYwoX2qQeq9DZhNodJQ3x95fMpbtXECV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020025_726307_6363215C 
X-CRM114-Status: GOOD (  34.86  )
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

> The latest EDK version was 14.7 released in 2013 that's why remove
> description for it. Also remove generic description for Ethernet which
> doesn't bring any value.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
> 
> Changes in v2:
> - Update description for additional bindings - reported by Sashiko
> 
>   Documentation/devicetree/bindings/xilinx.txt | 98 +-------------------
>   1 file changed, 1 insertion(+), 97 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
> index 0ee9de99b3ae..a1a2cde7b7d8 100644
> --- a/Documentation/devicetree/bindings/xilinx.txt
> +++ b/Documentation/devicetree/bindings/xilinx.txt
> @@ -1,93 +1,4 @@
> -   d) Xilinx IP cores
> -
> -   The Xilinx EDK toolchain ships with a set of IP cores (devices) for use
> -   in Xilinx Spartan and Virtex FPGAs.  The devices cover the whole range
> -   of standard device types (network, serial, etc.) and miscellaneous
> -   devices (gpio, LCD, spi, etc).  Also, since these devices are
> -   implemented within the fpga fabric every instance of the device can be
> -   synthesised with different options that change the behaviour.
> -
> -   Each IP-core has a set of parameters which the FPGA designer can use to
> -   control how the core is synthesized.  Historically, the EDK tool would
> -   extract the device parameters relevant to device drivers and copy them
> -   into an 'xparameters.h' in the form of #define symbols.  This tells the
> -   device drivers how the IP cores are configured, but it requires the kernel
> -   to be recompiled every time the FPGA bitstream is resynthesized.
> -
> -   The new approach is to export the parameters into the device tree and
> -   generate a new device tree each time the FPGA bitstream changes.  The
> -   parameters which used to be exported as #defines will now become
> -   properties of the device node.  In general, device nodes for IP-cores
> -   will take the following form:
> -
> -	(name): (generic-name)@(base-address) {
> -		compatible = "xlnx,(ip-core-name)-(HW_VER)"
> -			     [, (list of compatible devices), ...];
> -		reg = <(baseaddr) (size)>;
> -		interrupt-parent = <&interrupt-controller-phandle>;
> -		interrupts = < ... >;
> -		xlnx,(parameter1) = "(string-value)";
> -		xlnx,(parameter2) = <(int-value)>;
> -	};
> -
> -	(generic-name):   an open firmware-style name that describes the
> -			generic class of device.  Preferably, this is one word, such
> -			as 'serial' or 'ethernet'.
> -	(ip-core-name):	the name of the ip block (given after the BEGIN
> -			directive in system.mhs).  Should be in lowercase
> -			and all underscores '_' converted to dashes '-'.
> -	(name):		is derived from the "PARAMETER INSTANCE" value.
> -	(parameter#):	C_* parameters from system.mhs.  The C_ prefix is
> -			dropped from the parameter name, the name is converted
> -			to lowercase and all underscore '_' characters are
> -			converted to dashes '-'.
> -	(baseaddr):	the baseaddr parameter value (often named C_BASEADDR).
> -	(HW_VER):	from the HW_VER parameter.
> -	(size):		the address range size (often C_HIGHADDR - C_BASEADDR + 1).
> -
> -   Typically, the compatible list will include the exact IP core version
> -   followed by an older IP core version which implements the same
> -   interface or any other device with the same interface.
> -
> -   'reg' and 'interrupts' are all optional properties.
> -
> -   For example, the following block from system.mhs:
> -
> -	BEGIN opb_uartlite
> -		PARAMETER INSTANCE = opb_uartlite_0
> -		PARAMETER HW_VER = 1.00.b
> -		PARAMETER C_BAUDRATE = 115200
> -		PARAMETER C_DATA_BITS = 8
> -		PARAMETER C_ODD_PARITY = 0
> -		PARAMETER C_USE_PARITY = 0
> -		PARAMETER C_CLK_FREQ = 50000000
> -		PARAMETER C_BASEADDR = 0xEC100000
> -		PARAMETER C_HIGHADDR = 0xEC10FFFF
> -		BUS_INTERFACE SOPB = opb_7
> -		PORT OPB_Clk = CLK_50MHz
> -		PORT Interrupt = opb_uartlite_0_Interrupt
> -		PORT RX = opb_uartlite_0_RX
> -		PORT TX = opb_uartlite_0_TX
> -		PORT OPB_Rst = sys_bus_reset_0
> -	END
> -
> -   becomes the following device tree node:
> -
> -	opb_uartlite_0: serial@ec100000 {
> -		device_type = "serial";
> -		compatible = "xlnx,opb-uartlite-1.00.b";
> -		reg = <ec100000 10000>;
> -		interrupt-parent = <&opb_intc_0>;
> -		interrupts = <1 0>; // got this from the opb_intc parameters
> -		current-speed = <d#115200>;	// standard serial device prop
> -		clock-frequency = <d#50000000>;	// standard serial device prop
> -		xlnx,data-bits = <8>;
> -		xlnx,odd-parity = <0>;
> -		xlnx,use-parity = <0>;
> -	};
> -
> -   That covers the general approach to binding xilinx IP cores into the
> -   device tree.  The following are bindings for specific devices:
> +   Bindings for specific devices:
>   
>         i) Xilinx ML300 Framebuffer
>   
> @@ -102,13 +13,6 @@
>                                              Default is <d#1024 d#480>.
>          - rotate-display (empty) : rotate display 180 degrees.
>   
> -      iii) Xilinx EMAC and Xilinx TEMAC
> -
> -      Xilinx Ethernet devices.  In addition to general xilinx properties
> -      listed above, nodes for these devices should include a phy-handle
> -      property, and may include other common network device properties
> -      like local-mac-address.
> -
>         v) Xilinx hwicap
>   
>   		Xilinx hwicap devices provide access to the configuration logic
> ---
> base-commit: f608bce703fc31a2cdf67abe1de882d5bbc45142
> branch: zynqmp/dt
> 


