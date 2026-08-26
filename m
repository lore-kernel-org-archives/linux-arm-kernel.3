Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87204C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCwwyJLd0mfu177p6suH3hriyU2wFFGIcIman/dEOP8=; b=VBVql5TsbRsCleyhrodpCMk+j1
	L4QBQ3K+W1OOigGi2RCUCZjWMTKECa8ScRfXjgoQBECIWIeeB5DOBVuvIkmW25lOdPBV9O2EMmXz1
	9iqd7PJww3bNZh8CQiuodVgLjA9jj5HB0tzGuS+xRHTQ9ZUFzxgzKMZtxVXYrU0SaXNlJBP4wade1
	Lgziem0b1Q6oosqe3MtotrjZGebfPkOKC5tbxvccr6Z4wCqAQ1XHo3NyJDQTXvQq8IZjaEmfYA6+a
	Qssf/kj4MHcZRc2mrdcRb9G1vPUvmeLy23Y4hoo2apbv+nT4b6HrZSiOTYtWFeNvTn4g8K57H3J2C
	d5Q6+SkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDY1-00000002Uxq-2AS9;
	Wed, 26 Aug 2026 13:20:09 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDXx-00000002Ux0-3OXv;
	Wed, 26 Aug 2026 13:20:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkNczmtNHsJiW2aKujap+yN/LQcLVp2jx+TIF80bFOPY+/O+DdPPHUTJzODjjdIjXYgCRoHFvSRl3B7JYMIympf/VIb4Zyf1ckk6srZR7qzKvxgCAdIV+UpM3iWfdSK1e5dJ69m1ffX0V9REhNJLmnmff36BjA7XtW5LG7eSoSYLFK88DuvtGQNpELX7QCh+d7qxy7Z8pXdtzMySQno+t6Iyf+SSKHv2u1ZFPT+s1oY5yoa1WBAbRtNqiHTaHswGIWmS8TLvEphoHnBqla1GVidXm8Ke/aAqtNcEtCyRKnshSpmctdsRWHUDwnEoiJeY+d6yOIZRmdpMbagoyTRb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCwwyJLd0mfu177p6suH3hriyU2wFFGIcIman/dEOP8=;
 b=V0vxeSLTlWs8VQ6PLL+x5mppGomLgXCRSqj5vezM5cHewy2kJTp6xcFiiwB3/1Z1ABPdyfB3IcEbouaVjOXeBAQq/KpcgWRkeAs9pAevsVvKkgSmWpVO+MT/pvWo6m2infbAojtDnHvRTHKZdEVsvzX9TA2YwQf1SsJBa1/Zf8wMtHVEEYfStsdQtn1G+FffU3rOeDzR5k99h6AdI9sEaZAiycA6Hp2HsuuUN//iFloGS9epdMQUjr7AFx0LBUYNCy/LqoZ3iwOBbCmgYCXMNUtthdwXMMlVLR0XKB+3r8RXrtFzV5cQJnP4Qn4VB6oECRhmr+ZFfidIkbqUVudhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCwwyJLd0mfu177p6suH3hriyU2wFFGIcIman/dEOP8=;
 b=OA8eJBUDdO5c58ytTWYnvtExNYZd/XcKHwFGGNZmkzJYK9rtGANKTMmQ+0ZIk1t/vf8YuwCjvtnBwtBZMaUWYjJduqEyW4AG96hC2LXVlvUrS5ahinlh+Vcs+ZpwgDI6YJN4803NKUS/R5wadVVBDG/AW3WRFnGVlf+UHxP3FRAHNPaLAWzrf64cllZlrzowfd3WcOye0ipbkdgrz2NRvLHKZWK3gdAA+p1XSzc0IH2+8GLIH1LNgBquHjR+0oT0g2NIXnAuD+/FcO9QJZtS4OH50AF82efB0q+r8pp3LHWVaUjnr5zkExRd3k3maegqKh5/iVsyTZraOJE9WRfkQw==
Received: from AS8PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:20b:451::21)
 by DU4PR10MB8466.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 13:19:57 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:451:cafe::60) by AS8PR07CA0013.outlook.office365.com
 (2603:10a6:20b:451::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 13:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 13:19:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:25:51 +0200
Received: from [10.252.23.181] (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:19:55 +0200
Message-ID: <1cf02ebd-fa70-4d44-9deb-f39e4dd6c04f@foss.st.com>
Date: Wed, 26 Aug 2026 15:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] arm64: dts: st: Add ucpd node on stm32mp251
To: Marek Vasut <marex@nabladev.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Bruel
	<christian.bruel@foss.st.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	<linux-phy@lists.infradead.org>, Thomas Bourgoin
	<thomas.bourgoin@foss.st.com>, Mark Brown <broonie@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>,
	Pankaj Dev <pankaj.dev@st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
 <745a30e5-3fc3-406c-9263-1c1c8ca9135c@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <745a30e5-3fc3-406c-9263-1c1c8ca9135c@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.23.181]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|DU4PR10MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d29e307-b785-47e4-0af1-08df0374b995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: iPw6JiKxBdylA6enzFv3TJycHxbTuZ7msJbVwYCwE0u3tXHDutyS9wyvL+ThLNdRqqX33nJxKun22C/wsWB91qUWJMstGuqv9w572YSyAJFeBtTF0jJs9WdG3/k6gW3uIQiMl1v5E6bw61F9aNS572AtVibjpYk+lIInIfB9yM4WVBJVpTaNi9mCDxQkZ2hrs2r6jNFDmnvYZG93lUlsw/u5oGgdRX3K6iBbDclofIqMXwC7bYqnw/KTPmuAzndHN411OJYjLd+6g/hcAo5J6O3xMbXu+/rsAR9vZI38+Wh6xzttuM3wbrFLRZz7jbIRM01oNMXov8sQTjxj6yDkoCreTuIB8iEr5XYdTwj2tfukA/jyswOvqzvT6Kjf1SssqNYZbK7YWPlMtiC0dtBsy+cAZSuIhqBflBsN92CurWns6m3eUPbmKYi9vyiGG6vDsuDJzPZQNXDBIJg2cfa1OOWUK8l2InuaGuvaiAUVVIGoTLFd2GfAf/OE1z0gKJg5XHfuf18TDn67nfJ0Bau4fqIkMQkL7XafBp81ljBoFceLNerHnakBqZYfiqlXKU4TtKiPWcOXi1qgvgkWHLclD8aEG3b0UNUOoJBwDGUyW3Cyrgkb/2TWVYC8XoaSdv0TxGLEeBh+SEORtm7SD/zhWq9mMztMYPx0T4iQn46pjzOVJlqc0ICgIKtUiIkqoNk/CU8kNjdhjiBcuOmYYPb5Ow==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FXqBVyuMaiC4kW+uZeCSPUxIS/aEjtC+nv7VAZxE92oWlYb4tUrLWhgDfvskJh4diAEuiZk9z++9YFxkxhlL7uX/AkCxae2EMzqPcDAmGrvI6rmZRoNkW0DLwy+vNW1P2eKPqzJx6mzIlQQvO+cZKf2nfyVvG8q7bmet2vaHIavLCopqp1xOmMNM0Q/8Y63pe4tr5M6buhZfzzxWaqFH7ThAeaDvjLi5Dzz5rmf59yvoiA7k6EYypgYpTTrWnfSKa25vRYPN7lnVAD2xVKxKnlZBpEkHKjxLN6AEhtha8cndOnDguiK7ZmvRcmE4MlwH3QgmfHJDgcAVQXdGE+qUhuAt+WNThp2g2E3iCO+/HuIDgFHiqzz+DCL5jCO8GLcD4KWFylCtmxeTgNjlnjcfQmWodkb6wmtT+93SofHTIt2WN82A4tsBj3tZYIwKITOa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:19:57.3697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d29e307-b785-47e4-0af1-08df0374b995
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_062006_224603_402538DF 
X-CRM114-Status: GOOD (  12.12  )
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

On 8/22/26 07:00, Marek Vasut wrote:
> On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
>> Describe UCPD bindings and nvmem cells to access trim values.
>> This provides the PD and CC USB-C cable signaling functions.
>>
>> Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> Co-developed-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
>> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 51 ++++++++++++++++++++++++
>> ++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/
>> dts/st/stm32mp251.dtsi
>> index 9dc7a05fce99..be54dd56713b 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> 
> [...]
> 
>> @@ -1818,10 +1839,40 @@ part-number-otp@24 {
>>                   reg = <0x24 0x4>;
>>               };
>>   +            ucpd_trim_3a_cc1: trim_3a_cc1@1bd,1 {
>> +                reg = <0x1bd 0x1>;
>> +                bits = <1 4>;
>> +            };
>> +
>> +            ucpd_trim_3a_cc2: trim_3a_cc2@1bf,1 {
>> +                reg = <0x1bf 0x1>;
>> +                bits = <1 4>;
>> +            };
> 
> These two fuse fields ^ do not seem to match STM32MP25xx documentation ?
> 
> RM0457 Rev 5
> Table 876. UCPD software trim data
> Page 5013
> 
>                Non-volatile memory location
> Name                 Address       Bits
> 3A0_CC1[3:0]       0x5400 01E8     11:8
> 3A0_CC2[3:0]       0x5400 01E8     11:8
> ^^^^^^^                   ^^^^     ^^^^
> 

Hi Marek,

Yes, I've raised it internally (ST) so the documentation gets clarified.

Please look at "OTP mapping" section instead, Table 34.

e.g. OTP111

word/bits |

9 to 12  | USBTC_VIREF1_3A0[3:0] | USB Type C CC1 ref current trim (±6%)
in 3 A mode
25 to 28 | USBTC_VIREF2_3A0[3:0] | USB Type C CC2 ref current trim (±6%)
in 3 A mode

and OTP122
4 to 7   | USBTC_CCRPD1[3:0]     | USB Type C CC1 5.1Kohm pull down trim
(±10%)
8 to 11  | USBTC_VIREF1_1A5[3:0] | USB Type C CC1 ref current trim (±6%)
in 1.5 A mode
12 to 15 | USBTC_CCRPD2[3:0]     | USB Type C CC2 pull down trim (5.1 K
±10%)
16 to 19 | USBTC_VIREF2_1A5[3:0] | USB Type C CC2 ref current trim (±6%)
in 1.5 A mode

BR,
Fabrice

>>               package-otp@1e8 {
>>                   reg = <0x1e8 0x1>;
>>                   bits = <0 3>;
>>               };
> [...]


