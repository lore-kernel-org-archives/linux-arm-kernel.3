Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6CCFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdPA0mCuir88A0hSvUIoQsQfdb0RD+VwyBdVFh/a/qI=; b=qL0pP4aWGN4ft2fHWarknIXy+K
	Qjd5Eeqs6WhjRZSS+VTqh8Z5qg2UwUIa7JDPE85vrL5A0nov6d4QUvK0N+A1gbG4LCJtb3tChFcLW
	ZqE+Ocp/msk3QbNxTAI01wIL/iWmJNqRbjAgerJvX6HvJkr8Cw4MSgLsBrFe5kB0171JA3uOxkWhT
	K6f0XBith95HFH3B1nPOZrd+NWcC4eXTK/G7Arw/or45nzLsN2ejkz8QQ2n9zy/iL1NoMLYyRuLoI
	2SR4fDbv11C/9/y2IloJW6+HVM9aV9vOEfKc5Jq5jlW3AIl9XgXeiZn1f0JI9nFDEh7nOJncJXUfN
	nZBYQ0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyjp-000000033k1-0rwR;
	Wed, 29 Apr 2026 06:49:37 +0000
Received: from mail-japaneastazon11022121.outbound.protection.outlook.com ([52.101.126.121] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyjn-000000033jY-1DQ5;
	Wed, 29 Apr 2026 06:49:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGUuaaBuqyd5fqA7YbELJb1KNclSK0iPcjNG1o080aPTb7QaFDjIKksr9rszE940SBXAnLQxz0Acp3f+8OwlsMdWyMWxTz12NbaaLEPwyy2GFnriY0c/jGzpOWij1D24QxeBZ7Gurtizn1H/XZAVpGS7hG9q24iS/GsOOXCW3NwcKzonccGr3mZlXKv+4bYhHMhTfDgFF66fGAcYPK0RkofddWn4jPr7wRWvlUkIQcaMetfvGaRAFRAmNgwKJUAjmOzmqT9PUNzgTMdiSa9HvAL/2r9q6cjyHiUc5xIG2f0jDXfErXNpPHcmWPQADszWbpYWkiE7KvXzEdCuPm8mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdPA0mCuir88A0hSvUIoQsQfdb0RD+VwyBdVFh/a/qI=;
 b=c99a0Kzyv6G2oYNT8mV87IYxyyPFz5W6Lo+zuFWG0Cb221CKCGj349x+SaOezQzojpETi1G1RHMDXxiIWnw7nNhkxG2mWHSCQcLykYzW4AdiskOVel0RiHCZiiAkgpuzxsVXb5Y9ruxwbpHSYljkOqDhgY3r5DLVnI8y9KpsJj19/BWY0vGKdRlhAAIcJcI4w202W6WI9JIp8Rk79rHf9Q/Wo9WarAmcUci9qAtSVwbnJaTh+nSvQ4SZdZxtIW+3ecMpsmZhgKpIKd2w7y3oipCwuv/43tPM2TUaVMqWmVNf2GnNTQkI4spz4JNuQb0xR+P82tIgaoLsn34Pf/iYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TYSPR03MB9618.apcprd03.prod.outlook.com (2603:1096:405:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 06:49:31 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:49:30 +0000
Message-ID: <ec07016c-832e-408c-a6ac-77e22c95c214@wesion.com>
Date: Wed, 29 Apr 2026 14:49:26 +0800
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
To: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com
References: <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-6-gray.huang@wesion.com> <5673086.MHq7AAxBmi@phil>
Content-Language: en-US
From: Gray Huang <gray.huang@wesion.com>
In-Reply-To: <5673086.MHq7AAxBmi@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0018.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::19) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|TYSPR03MB9618:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fee1d3-5b87-4ecf-10d1-08dea5bb7713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: OVUqJSyBvX+XNftlBNOYdWpmMSRp2TucrGs5j/Qg3iq/5iB5un9kbnzfB+gupWhkLMhSRnJF/H5KWkJELvZJ3R90cr5tFtY9PbGWcGKs8JElcPJqGFVd1QVdRInElouT7Esq2n15PAWIsAdWgI0EwkZUUhkfyt9rh2yJeXr7YGygPjhZEW5yf6uB07hFmNqJPEl+drnsfwICR9nHbzBMOV94HJIWFu5YTZytuWaX0U+veFN9LvgzIVvv8HV7AeWCzWtLvzaBG2HzViT8wOiExCoxV5nQmHZHh90b4OdnJGs7xCZaS5PLDBkUMufJjNSHooovkgDBMZ5x4VqTkhoXxteom8k6HhXYdWyz3w1S8NSxy56GXE5RrMrg8p9mQTlMksjaTltjr/xypqeHJanU1fqkVRdW890bTbLyMpiihEC9DHcEjbD2zgrsXdFGf5KS/g2HJtdYTWviBzjxIegdZaqO6DR7ObLvDu/iF5RWoUay/0iEW2FqkzzvGBZbg5WZZ2r3zdq+jBdmuFFfhZJgubkAKROOeu7y9CU2eKfMkBREe1bL7U6PgBLuQmfJds+l3D2+OJR2uzBemF135k1WsD9SYqMpZRPZsOYAzfIhCoQ510A5FHo90TJIdjKw1Mgf79SK6QW+rtGRFAuaxMuADChihB0S1G6/xyxkS4X9E3X7bPfhMz3+6QK26gt3QCuE4VW2J/m4Pm+eDARynJOioIg9XwdHm+0RMeXISwOpalg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2Z0TVNFd2UwSktaZWp2aXltS1hhM0FZeVBhM3EwTWEyTU9EY2dlWHV0b0ta?=
 =?utf-8?B?SURFTVM4dFBwdkV6Tk9XeHgycjBOWUFlWmw2VEdzVUk4amRVcmpTTW14TzN5?=
 =?utf-8?B?cXJzWXhUaWNSYmc5NDljbzM0RXUzcm9RRFJPMGROQTc1TnBYMndFNFM2M3Fs?=
 =?utf-8?B?SStWSVc1YUpERWV3NUw4emlvRExSVXRJUXA1WWlIb0ZPYnRhRnRVOWFRU3RJ?=
 =?utf-8?B?c3Aray8xVExBZExsYVRabUpuRnhOQS9aMVpGMHZFanU1L05TMzdqWFd5eTl1?=
 =?utf-8?B?VnRBbkVzT0V1YzZkaFV1T25LczA2bW9BN1JwYVJXNDlyRlJmNmY5bGFhbFJT?=
 =?utf-8?B?anpySythb1Zja0tmVW1kUW9uc2V5ckZkNVprdkp2MElVa3J2eHY5cTVsbmNv?=
 =?utf-8?B?RkJtUzBXRzd3UDUzT0dneUxRVS9QbHZ0blArVG9VQk53dWRwQUxvTkR1Umta?=
 =?utf-8?B?Tk1OZS9SZXRlckJHRFZJbEVJT0hETDd0K0FsSEI3TERrbUprYmYrMk5iVCta?=
 =?utf-8?B?c1k5cXdFQndteXFYMXZUZEtHVSt5UFNsK01wWGU5blE2Q0JPdmVDZmNHaDBn?=
 =?utf-8?B?UmhMT1d3Mk4zNW1DbFVXWk9oNC9TV3cwRGNSOEc2N1pRSkJKb3laL3pkNlht?=
 =?utf-8?B?Y01sNkhWRG84N0RCS05hdE5tTWtKZjBqeVJDd29jaytJOHR5YjVYWElRZHNs?=
 =?utf-8?B?clNzZVpUdmFqZHphdWFhVFRHd2s3QjZqV1FyNlh1VGNHV0J0Si81U1NEK3cx?=
 =?utf-8?B?aEhibVk5cWdib2NhZDc2emUrUWNWYnBWL3Y4Tjl3T1pYTmxiQWcrdUhOOW1H?=
 =?utf-8?B?NFk3WDdJanhvQjBRMDV3S3FNYkR4YnFScXNpMDNDdWJMS2YrYzVoTkl2amVa?=
 =?utf-8?B?WUtQclc4TGZmYWVxb3g0eTRYNXFOS3VMWDJNOWVRcjFyNWRnQUxLNTVXQnd5?=
 =?utf-8?B?RXk0MjM3QUhXUTYwU1pFMHpWMmoxMFFaSW5UazhLTWxPTDMzZjlwZTdZUUdx?=
 =?utf-8?B?elQ4SDFoNmhoZEp1WFVqdkQ5aVFwTitEQzlPWFFDb3NYbzltTWFNWlZIVzRv?=
 =?utf-8?B?RFJsMW9laVIvZ2JXdmFnWkxKMEdwUEZGNy9nQVZpWmkrMXJJaFk0SStkSFBU?=
 =?utf-8?B?Z0MycHdGRTdzbXFUa2dmNGdTd2FKbmRmdml0KzNWNEgxbW05cE5DYUNnN2ds?=
 =?utf-8?B?ZVpYODNEenNQMzd5QVVtQjlkaG41Zkt6L2ZYQTlmVnl2SFF3VDJaTGIyOE9C?=
 =?utf-8?B?elRtOFNsbnJtODBNa0xicEEvSFFoNG1TMitkOHBWK09GUXZxYWYxNDJVeENi?=
 =?utf-8?B?eHpIaGR4UDFSY3c1b1Q3YXdEcnlRQlNGSHo0Z3V0QjBuZXFZYVNYc0l4RzlY?=
 =?utf-8?B?ek5hdG5JUzE3K2RvczFQSzJKd1RvMXBJQ3d6U1ZVL3BRTFlQeElsM1FTcnRY?=
 =?utf-8?B?ZkJTeUIrMG5VR2lzUXNFeDFYUnVaTDJtVThIT08yL1RCQVMxejEyTGNkWENW?=
 =?utf-8?B?SjBTTGcxODR0eHFRZmdIdC9MZ0dFdUs5TXVRNEFCblNGaG1PaUJnRjYvL0lh?=
 =?utf-8?B?QTcyQUlhMEV0ZHVWOFFkcmVaWVJHN2hXR3k2SnN5QlpScEpNSi9GM1B5VXdx?=
 =?utf-8?B?S0kxRGhKSkJkSnFraWcranI2dVpzTUJNeFlzL0RoVnpublk2Vk56VWo3MUJJ?=
 =?utf-8?B?Yi9laWRDVTB4U1g0Tm96ZHNIdGg0WEJ2R2grdGZPOGRDRWd0M1E3YzJLYk1y?=
 =?utf-8?B?NE84TDYxOENyb09VUWN0ZWdUNmRodExjTyswcWhJZTNaY3FyUHdKMmluQ2lQ?=
 =?utf-8?B?TWRDYTh4QUYvOGY5SUNXRkYzbnM1b0lidU9SZ0s2dkpsdWczeENnNFdRLy9x?=
 =?utf-8?B?YzM2UGRHd3lUZnZOazBMNHlOejdLTExhY2pTMkNRODZCR2JzbUF1ZHpCSURy?=
 =?utf-8?B?NlRZbnZLN005ZThLV0RUVkUxVUl3bmR4TkhITGtjV1RtR2p1WndFRnUwTHdK?=
 =?utf-8?B?S2ljZnhnekNvTHg2a1plV1RvQ1F3dmh3K3UzaURIZlFZcmYyTzY2ZGhCOW42?=
 =?utf-8?B?ZGk4MDMrSVFSczQzRlNYTGxueWNWTzB2OW8vL0hSb1lJSGdWTndvOGR3VFZn?=
 =?utf-8?B?NzV5NitKZVBFeEhid0FDVFJBKzczd3JiSnBRTUEvTytCcVpQUFZVa0dpdm9V?=
 =?utf-8?B?ZzQ4dVZkdUVzd1Vvd2s5MnV4cFNQYll1SVNJZm9BUnB0ZThDR0hpdVc2TnNp?=
 =?utf-8?B?R1VsSU1uVTZIRE1PYU56cTFWalM2MHZmSTI5UnBYZ1p4eDlwUFNBc2hzS0lG?=
 =?utf-8?B?MWJpcTR5cm1mNTJxKzFyeXNzUmdkelNIVk8vcTExMU9WTGxtQzlBQT09?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fee1d3-5b87-4ecf-10d1-08dea5bb7713
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:49:30.9506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzQGCbhCuT1wu69iQyGwGNHdwR3IolBYLPKIIUtmhfDfacA2gcRzzySGuPdpoHI+m92CaUkM8gxjjnlJwco/Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB9618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234935_355932_9ED4C203 
X-CRM114-Status: GOOD (  11.53  )
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


On 4/27/26 20:27, Heiko Stuebner wrote:
> Am Mittwoch, 25. März 2026, 06:46:13 Mitteleuropäische Sommerzeit schrieb Gray Huang:
>> The Khadas Edge 2L board provides one USB 3.0 Host port and one
>> USB 2.0 port (connected via an internal hub). Enable the
>> corresponding DWC3 controllers and PHYs.
>>
>> Signed-off-by: Gray Huang <gray.huang@wesion.com>
>> ---
>>   .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> index 003342fd69a7..8ecd00f6645d 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> @@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
>>   		};
>>   	};
>>   
>> +	vcc5v0_device: regulator-vcc5v0-device {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc5v0_device";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +	};
>> +
>> +	vcc5v0_host: regulator-vcc5v0-host {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc5v0_host";
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		enable-active-high;
>> +		gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
>> +		vin-supply = <&vcc5v0_device>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&usb_host_pwren>;
>> +	};
>> +
>>   	vcc_sys: regulator-vcc5v0-sys {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vcc_sys";
>> @@ -531,6 +554,12 @@ pcie0_rst: pcie0-rst {
>>   		};
>>   	};
>>   
>> +	usb {
>> +		usb_host_pwren: usb-host-pwren {
>> +			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>>   	wifi {
>>   		wifi_reg_on: wifi-reg-on {
>>   			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
>> @@ -542,6 +571,24 @@ wifi_wake_host: wifi-wake-host {
>>   	};
>>   };
>>   
>> +&usb_drd1_dwc3 {
>> +	dr_mode = "host";
>> +	status = "okay";
>> +};
>> +
>> +&u2phy1 {
>> +	status = "okay";
>> +};
>> +
>> +&u2phy1_otg {
>> +	phy-supply = <&vcc5v0_host>;
>> +	status = "okay";
>> +};
>> +
>> +&combphy1_psu {
>> +	status = "okay";
>> +};
> same here, u-something and c-something between pinctrl and sdhci
> is the wrong place.
>
> Heko

Has been sorted alphabetically in patch of v2.

Gray

>> +
>>   &sdhci {
>>   	bus-width = <8>;
>>   	no-sdio;
>>
>
>
>

