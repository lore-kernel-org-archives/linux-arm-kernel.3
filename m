Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1364CC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TicA5Brl4WMeSpIhlH6ZYSFfgW4uIqj5yTacQSEJWAM=; b=bCcvVqoYy9t1ZLinp0Uxf8vzVz
	8Tl3/6u7MAxlzMB6BkluS+pj+uRU0233M12qQNlsmdXpWGbcX8fG23faFZih7cOh+99Riz+6fa0fk
	0eY9+AjgswNHHINH9v8IrPP0x8RPRJK8os0jL/LO0m7J3HisrpuYSoCFhIiezlN9XT9lpQtHCqejW
	9cuRDULYcZti5mRztWlpvvukRzeYrf4sz6pfiZwuKtMDPABi3kC1elcvLj5+mLOwxwdhRhvo6rB1N
	I/ll2K5db2JglAKLUZ2SFzp6bwlz69lukvZWv1vcDWaEx5xzKNgU4pflM7M7zIOE/yxyUOAFwre/c
	OwKxqmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQra-0000000AcBv-22R7;
	Thu, 30 Jul 2026 13:31:54 +0000
Received: from mail-francesouthazon11011041.outbound.protection.outlook.com ([40.107.130.41] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQrW-0000000AcA9-1HDt;
	Thu, 30 Jul 2026 13:31:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXE5BybS2xFocLg7w2Voxi2T1u6L5NfG2Fh8WwaGw/ybBv3DYPPY99qqNt71Rx3Cyn/KR8AJ4r2LdoD6ZXb0x2aA6vhyYWqeLi8M9Kght4MIdnfbZZBmq2SCmwuauJEn29r5ymvmJXSj+iKrea8jLDuJqeFrt6Wp1855Fia9FlNYKEzpd4AfhEVLUz35hiUXzHf7h+j6YiZcWrdSHabhPiOD76HdRd7wpByt8KQVLBnhOa0V4pK4sGFyT1eh4kHs5CscAGDoaZcKe1DHIOx6m4lOaugsfA8M4SyFp8pJpIo+oBqGbS5+stsuA/OZ4z4vPej5S+Pi4StqWir5qyQl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TicA5Brl4WMeSpIhlH6ZYSFfgW4uIqj5yTacQSEJWAM=;
 b=Gyd396ylQHJ/vQ3JAKAfTakoFU+KbOKfNZ2gdh09kltCrbZFirHapqyM4X3i0UGCq4nF3uuPOu1DlXLbCtdZEP29sG+hPuoSVI1eJto0Zv3ScbIEDfYG9SuCOT+Kp6+AYnRoIQ//4TsNkUzqIqhhNeVmt0eGkNWe21NKr1Zy3TH68KWYtSpyVGN/UniARNRB0NfLunp4Vs4J09JFgyqfkAtVBkJ2vcFwoo4zCjFj0Ypv0XSP05mL42gkORfeObrZdCNHObbSop5PgIcC5+6lWg7PKPsv2bIPnylhXcFD6y+YF+1SPSUyYLDJFLhOZvncvjy6nmIxNHZZ5JfSGI41qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TicA5Brl4WMeSpIhlH6ZYSFfgW4uIqj5yTacQSEJWAM=;
 b=FXhBY6rr+A/sI77sutA4QjBj7DmxGF4E/cWq8bVPePZ1GAwnpVdx7tPUm2oGMvwDOO9BF0s7dUp8bEZdsl33bVM9AeJPLhLebhvZZ0wo6kQ9D9HI0DW4jSbI0E0SS2kw48UGR/h6NgK10S8moI80vVmT9zLCyBWuL9ZG8wzDJJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI1PR04MB6911.eurprd04.prod.outlook.com (2603:10a6:803:12e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 13:31:42 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 13:31:42 +0000
Message-ID: <7628bc49-b4e7-4716-9579-022c20bbf134@cherry.de>
Date: Thu, 30 Jul 2026 15:31:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: rockchip: Enable CAN controller on
 RK3588-Tiger-Haikou
To: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, Vincent Mailhol <mailhol@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260725-master-v5-0-75da459d2b93@qq.com>
 <tencent_8E35228F9F4F133FCDBCCC4902F6887D0006@qq.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <tencent_8E35228F9F4F133FCDBCCC4902F6887D0006@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0033.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::20) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI1PR04MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: c2818d0c-c204-4c33-f2d8-08deee3ee4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HqfCtY4NEkbFMwZve80Ejx1SH2PVQaaigC8UYfB6kYsmkz99ztQDTwLD+QaIZLZc0u29xgZhnLab1DKbjbwWTtUVgFqf2UNeh8p8zZdfGjLErk15mcmSOC+MVZGHIB5wz9sQS71dlA0rW0I/8q+bt11mxLeSurch8ZBilX4HpG5y2su1YFP4V/rdFLUumQ7jFiR30rEROM48Y/qew/qM8LwoRvOrTC6DJSi30UYHnOXANclieoBryd9nyPVCLR1JZkPZbqd0yO827QmL+UvZVlBI9oMotYATwz3k+Z6fG39yd+IF8TJ25EbQfYZkv26saR1QHeAsV0hJ37zqKzSvt31pww2sE0cb9VaL6uRTe8eYpQywEA2kEPd2WoWOZL6cGR9aqAoDvPPtkyeHq5aUggReZVWxifKK53SPnjh/OtyMFNDLRqaawckXQ5XiED92ByujWMyttK1HzPhErj73Fi0kTBy8QgAQ4Yp5HpGgQ50PzUbMKHzWembyKCrCSA9UhQOUwRe9Sqj1xyfHESggm2BYVb8f0MahleEY+bb74g0Z5028kAEEqHiAu0HKGyCAjRrwhsvYcss9k6pYcqip28av7u1QRQcnPx34zXHR94fT2VV/VIX0wZR4ISsFVe8nij9sS+BRA9z3H5/tpPAoxZCWULY2UNUlyrKdLpDsPSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVYcEJucU5LUWlGbHlFaTY1cDFyVXlMZVhTSVVjY2FMMktvQlNsRzZjcjdq?=
 =?utf-8?B?b1hVeDl3YlNZU1lJbVZOb2lNc0ZlelRQYlJTaHgyb1JXdlgycEpkc2Z1REh5?=
 =?utf-8?B?ZnIzL2U0c2RubDBqc3JmZHJFdGoxdzNsSUxBUkFqa1ZVcjdLZW5MVmFxV3d1?=
 =?utf-8?B?bnFiK1NGQklWV2ZRZTJISy8zWG42NWo5ajJoc25qLzJ1OVYvRC9ncnZuWUZp?=
 =?utf-8?B?bEEyKzNvRmZUZUVBSjdVWnI3Q1pRKzY2cTkrQnJwdXkxLzdxUkFZV0FxZUR3?=
 =?utf-8?B?OGVaS3pLS0psV0UvWmY4MW9uT1VkOWZ5TVpUWFYxZ2I0YjdiMUdnYTdOckxB?=
 =?utf-8?B?TldjQzcvaDV5c0VVNW02d1hyWEh6TTN1Vk9sRnloVEZxdHkzYkxwdFZkWlVL?=
 =?utf-8?B?MHRub3JYVjdZcE8rWks0VndxQVNOYUlIRDdXdDhvd3pxN0xsQTgyZGZCdmhs?=
 =?utf-8?B?aTRUNXgySTR4a2R6NElrKzRnNElkdnZ0VzE2UzBLLzhQKzBxNUp3WVdWdjg2?=
 =?utf-8?B?T2VvUUE5Tm03NnF1QklLU08vOGFPZ1RJa1dyYVgrNEl1cjMwSEhEeUdQZEh0?=
 =?utf-8?B?elVCeUNnc0tKYmJBZGNkeTdweFpPTVZlcm1CcUFkMVEvby9OV2ZueE51OTFm?=
 =?utf-8?B?Z2hzQldrb0tscGtnMitYR1hvbk9QaWRjV29XU3NlSC85aHg5ZHUrVE1nRkZY?=
 =?utf-8?B?QzVjNjltZ2tLYmJIUGwyOTlKS0ZoRUIydHBVbFVaOE5oaVRKU1Eva0lNMnVu?=
 =?utf-8?B?eXVlVnZGY2UzUWFPbnVady9DYUxRN3pvUlNSNmFKb2NhRXIzUUc4cEwzRWhu?=
 =?utf-8?B?d0U5ZTJ4UlJpYVFHeFpkQmU2MzVuYzU2MmUxalFQN3hIWDN1TFc2clBtakFC?=
 =?utf-8?B?SjdDaGIvTjFJRzFyaVBGb3daWERFZU9nTWoyOUNxUDZQcWRHajJwUTJBNXl5?=
 =?utf-8?B?ay9tbzZQVkVWZ0N0ejR5TThWZ09jVHhTRVVKWHN6OG9oZVBqamJ6dVVwaE1L?=
 =?utf-8?B?bXhVZmM2QStpY1ZDdkZSckQ1VHhqN1JydnErWnMrNUhJVTNxaXZOSHBXTXlv?=
 =?utf-8?B?Q2xEc3lkZFdJMGxobWhPbDBRMUgrdmJsUlY4dUE5VGxIcHN1Z2RYc3lmRG1T?=
 =?utf-8?B?K3lxcmxFT21yNjl0TlZMaTNZM0pwM0FnelVVQ2ZkQWROMCtBRmVwS1Rya0ZE?=
 =?utf-8?B?VVpOL3Z5Um5BZWk2bWhrWlpJOHdZeUc5RVZ6K2YydTNaUTN4RnZyY1gvVXoy?=
 =?utf-8?B?NklBN2JNcHh4bzVlNlExaU8zb1JydzlkUWxqM2RYQ1Z2K1pkV210Q21zTWx4?=
 =?utf-8?B?UVVESVQ0SFpXU09TVXBkdWRLVEdLZlh5Rlk1UEl0S0s2aCtrK2FrWitLZHND?=
 =?utf-8?B?Q3QyZjRSbllrVGQ1ODlnQmhTMUptcnlSVWVSVDBDeVExUjBzM2NwM2dNeXNQ?=
 =?utf-8?B?enNjTlBSZ3RSV0dnZWt1SFdEV3h0bVdpYVNLRzkxYVdlYVZXdGkrbmlBdnps?=
 =?utf-8?B?ekdDL25yaFNmWWtGL2ZFc1Y5Rjk5ZytVME9TWllmSkgxVVFLc211YXZuWnRL?=
 =?utf-8?B?anFsSHZDWnord3hkTlVsblBSQnlIQ25nWGVRVW5WQVI3aFk3MmtoVmM1ekdx?=
 =?utf-8?B?NjBPTjVxc3NLNU50WW0yVzJYaitRSUlFbU5uWGNjKzhnRHVmZmlNM2NHakxQ?=
 =?utf-8?B?QkhTaXdDdlhqMDBhMWpYQnQzSW1tK09ub25rMFIxbUUxUjB2b0hQR0crQUpx?=
 =?utf-8?B?UWRtNUwzYS9kaWNFQitoL2ZrVGExVWR6WHFna3Fxcm9jWDJjdzRCcy9MeVoz?=
 =?utf-8?B?NTlLcjUreWtwVUdkUVRlcTd3MFJ0dld0NTYxdld3cm9xYXJJREt3aTZVQ0Z3?=
 =?utf-8?B?L3lwamZZaWVVZDVWMkJqZFpwd09UdUFrckoxVzNLQ0I1Ull0bmRteFVUV2RY?=
 =?utf-8?B?MU9GL1VtKy9PcXRady9uZHhBVTdOY21YMW1IUEcxWWlKYngyYUFCNWNnNVYv?=
 =?utf-8?B?Y3orWHd4NldZL1FCUVMzVWFScWZHdWNhdGRYUUpySVBIMVBPdTI4Wm5ldm9E?=
 =?utf-8?B?dVRSQ2lhWlg0NkhaU2xyRVBJdWY5cUtIOG53WGNvd0ZmNU9kbHo3MzNKMk1n?=
 =?utf-8?B?UkhUbmNwT3VUOHZTdHNoT1RSVUtYZyttMjJLajUvV1RPTHNLTmRPa3JaK0o2?=
 =?utf-8?B?VTdkbFRtS2NKMDF1WVVSQ3AyS2pWckRBNWJUSjZaVUlsc1pnZzh6VStObU1O?=
 =?utf-8?B?VzN1ejUxcmlLUi9RbmdDdXpsYmloZWI4cyt0cFd1V2UveFBCSTQ0OUgraXY3?=
 =?utf-8?B?OW9VL01NYWt4eUFSZTk1aVpBNllkRWVlZWx3UmlaY2tleC9uNjAxUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2818d0c-c204-4c33-f2d8-08deee3ee4c7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:31:42.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw+PYhxSGXOAlUbJ4C5BKgxz29gWULaw46b0HSPwqmEyoisuEdSfk1neJqDxU17M6w3JWlqlEW8dLqyAKnTIH5nJRdl04nakh9Q1vj9VYIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_063151_121244_7F9BE294 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Cunhao Lu,

On 7/25/26 9:03 AM, Cunhao Lu wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> CAN0 is piped through the Q7-connector to the CAN-Header on the Haikou
> base-board, so enable support for it there.
> 
> At least on RK3588-Tiger, the CAN clocks default to 99MHz, limiting
> usable CAN bitrates without skew. Errata documentation mentions
> 300MHz as the default frequency on RK3568, so replicate this here
> to allow more bitrates.
> 

Can you please move the assigned-clocks* properties to rk3588-tiger.dtsi 
instead? RK3588 Tiger is a SOM and Haikou is a carrierboard. The 
carrierboard takes the signal directly from the SoC and route those to a 
transceiver. I'm assuming all carrierboards for Tiger will need those 
two properties, so better have them in the SoM DTSI.

Just apply:

"""
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts 
b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 6273e695b0394..6c57c9f54a305 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -156,8 +156,6 @@ vddd_audio_1v6: regulator-vddd-audio-1v6 {
  };

  &can0 {
-	assigned-clocks = <&cru CLK_CAN0>;
-	assigned-clock-rates = <300000000>;
  	status = "okay";
  };

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi 
b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 139f70e7bbd90..161c89c62bcda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -90,6 +90,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
  	};
  };

+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+};
+
  &cpu_b0 {
  	cpu-supply = <&vdd_cpu_big0_s0>;
  };
"""

on top of this patch and squash and we'll have what I would like to have.

If there's no need for a v6, I'm assuming Heiko can simply fix that when 
applying and thus there may be no need to send a v6 just for that (but 
if you need to send a v6, please consider doing the suggested changes 
above).

Thanks!
Quentin

