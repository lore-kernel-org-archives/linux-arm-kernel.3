Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FAF41992
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3I1z2WZnW4FrREZcAXsaSH1QeYiBmsYm0o0Il3E2Lho=; b=KghcW8HIHEL6lCXJiDgRyNDYFk
	Br3+WXGF16H45wR+gn6Hima/e0yd0LHSy/35T6YT+vvUj4xa8LoiY+R8InHJnlxx+l/E1MPMSHTp7
	NeHN/MpZ3Q7eJupdzY6ZgSOdm8t4RPls5DrBvK7WJENN/9e3oU3cMKmPNVF0TW9IcEBuIdds7ysum
	/cEpjIqGqiV3xMKL2GyUVs9BQNN57ug2j++SJ/FMh4OMvEA/ai+fxgYDo96fv7G53npK0q6HErmay
	6yV9RYxvZNXJd/H1l6JSKk+P8J0caepKrtdRzSZ3DVP6ajqYO96Wh9LUGouYsxhFx8J5QQg0d74T7
	gtbrkv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyZS-000000013By-0Yri;
	Wed, 15 Apr 2026 11:38:14 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyZQ-000000013BZ-0tMF;
	Wed, 15 Apr 2026 11:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg74lnyBOGGRXJMBikAB90/qz+9vvVNDHms8x+psZNsAv3n6N+FowRluDc48BhL/x3xdTOE7HuD/qxuryYM/WuNsL36su1Ntn3Q0q3Ox9hHnHu2DAGzay4Ra+u7DXqZeHgTht5XHqpy8FinI/ye1ooUQjPytP5uaozdHvTS43lIgds4fzrOPd7W7rb+yOb97uEKxbUSnAYfVbPyriq/6g7Ln+aq71dbAEPU2jq2xNde41GX9YQlb2Yn2UFd+QIpL/3Q+DMqr3+Q6LhYy12HpItSAQEgzoX8hG8OjWK8F0X8vhbK5vslIUBniRrVev9ionVBejsSc15WVS8OpfmDeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I1z2WZnW4FrREZcAXsaSH1QeYiBmsYm0o0Il3E2Lho=;
 b=FusuYTenHj3v0prORkek6Wm3s+PnreTmKNXLErVjV/HDwP+Zc8W66TjAX5BGEprNFF+9Gr6pr/D4BADjN8b7L4tHHaxXUovBke08xYmDHL+l4YfmlLT1LrucrhviCGySymXcJHdg35tEoKOuPL10P+asZuIujkCF5AVVHZF7ZBexRReLe0iGkuUx8Kf348UKxkMM/7E6pN0CLNZxeAxu5GgVUMtGxFOothqS/6fDnAM/ruwMH344eRnwncmuDpcJuJxA1Euh3U1dWHmfOhu9VMXw9mkCJqox2ejzMDEW7ekXU6IdjbQB1EwuEKUmeowpp+Yh0ep36x3MN/BlJShmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I1z2WZnW4FrREZcAXsaSH1QeYiBmsYm0o0Il3E2Lho=;
 b=I/fVL9SzbhkaDY9EK2rc8tHGo/3jA++xT/qhJ7c3smQWSssXjXppgrxpQkNmyS+H1oob0JlLo7SwJj1OpLmwFRS/a6ZDCJOMfy8fHlfMI3E/kL54TKdJxuXwksMxAgSX+fEZdFP1gefxOdEk4ht8d9AxIh8sYbokPzn2OEutuRjOdJpjyJU5oAG3dbhlsOjMi4szMmyV/Prcwe50rX9x9w6iY5UKrF1uNjr7dXdaLe/qlFvrkVAHiIFvK/kYowEGNlcPt2fVxziq7qPiYUDWazzBQRUmq12ukM3tx87aUMqXZE+2L7MSBcgvfwGjvYu0lkCJlKlJoudliUlRUjkHDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7779.apcprd03.prod.outlook.com (2603:1096:101:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 11:38:07 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 11:38:07 +0000
Message-ID: <68577e42-2fdb-4b66-84a4-610acb8b975b@amlogic.com>
Date: Wed, 15 Apr 2026 19:38:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: amlogic: t7: Add UART controllers nodes
Content-Language: en-US
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
 <20260415-add-bluetooth-t7-vim4-v1-2-0ba0746cc1d6@aliel.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260415-add-bluetooth-t7-vim4-v1-2-0ba0746cc1d6@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0045.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: eded4dde-598c-4a8b-8e99-08de9ae3769d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: lj1CzVYcu7j3bB16bbwLYE4rHfirvCB4FwEyLXEw9oKY6oWL/7SgJA2z1ofRvSWpso/LnNhISwp/dbJKz94r/Lwl7gLvU9GOYfrfrA+N9iUnP3+sQVp8k0n8Lk0c2ZZcJ2QvPXCulmK2qG4X2qbUUWmmre+9QU9UUQdQKAH5xUyw8rg9xuGP79ea852AtAVDEU1vNpcC8NZ6G+6XQIb4/GBiE8PxbmIzw+q/N1wQjaXvZOa0ZEFC/aGhrENbqA6wApLXHHX1iY6UkoratEGk1bGe6ZWKtQyXm/aTK+Ch5NVu/OSjti0GfOYCmTpCG2qqiic4EJbNwvf+8u0utxEqGugCnOYB/rztDbeNIHkTz7TOqlXIsbesI4bhih2TRbPEjK2KzvB+VSFfBt+BvXF41zkuOBrKNKEA7xs4KdL+8FNPiG7Y/+IOnU8T0zCPUwV9HYnxFvWS1FemJWXqBJiC/pY7mc6Yqk5goN9lCVB31AiD1hDq5I00TBn1LIuPPczZT5tWjrXe1XRAr4RfmTd+c5EvWRu0jzS3y28RaCMINI/8+9HxzG96p6G593+iEdt5SzDBN8rc3suTGAdsRABeU0p8obHIB0LaZRLJ2OAyjJc8cYlm6xHK+UiRgl0UDryKCG9t6HdjraLheRJoPkW0H6QFm+WmbMWSML+r3dO5RV6tKlqC3aqZ9S60YMdozKZaqrucZY9UjGjiYq4uwWpjlKdmFEi3z3Nqk++q7EetZIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czgzZnYvWWJtenorRUlPTkhXemRSdHk3QnFOY09vK3RGUGpVNHdvOWtpbUdy?=
 =?utf-8?B?b0wrcmFleCtTN2pJYUswa2Y0TjY4VWJQTHMwTFNmbVRiSTh5YzV4eXk0dEUx?=
 =?utf-8?B?K1FoUmdBWTd6Vk1RdWxlNURreW5VV2FvcnhodlVjS0ozTXlyN1NUK3ZXS2tl?=
 =?utf-8?B?b3ZnY0pXVUpGYTFZV0RCQlhxRHlBTGkxWFhtYmdsdGZWK2ZjcVF4bDFzbUZB?=
 =?utf-8?B?eStENUNlSFNoanhtQTFnc0JYQU9wNElsd2FFMndxSERSVUsxYU1YUWgybFFw?=
 =?utf-8?B?a09jT1BOSEFaS3BjVXYveWd4QzR1aVRKbms4SDRaSm1OMEtIbTMvVTNkSUNt?=
 =?utf-8?B?ZTNRV1BhWkxRbEtEQUFKSUpBelJXQkN0N000SDliTHVJR1g4STI1eVlWVUdm?=
 =?utf-8?B?MzhtYVVkZzQzQzhrOWJia2xPRTBUUGVHMm5BQnFVdXZkVmxuMDk4N1ZuZXM0?=
 =?utf-8?B?ZERJSk10RFRPellZeWpEb2FYN0RmcldwcUlNaWhLNlhmaDRSc2gvOHc0Ykg4?=
 =?utf-8?B?UzJSQXlVUVF4SVZPajFGMWpvUjRzeHVWL1VudHpMek41dlpQVW9ZTjFhSjRy?=
 =?utf-8?B?VTl4dnJVQjFsN08rR1FiT0VaSThvNHUvamYyZWJGdXFJUnZZRDUzZ1ZUaDVp?=
 =?utf-8?B?N2JxY1paQnNnZ0puWWlteHJDV2RvekRqNG5uUFBRdmZkbDVsTGwxWHNtR3lM?=
 =?utf-8?B?N3dVNmFiOXUvRGlQR0d0eWFZaUJGSGhpQjNXY2VOckJkdUhYUEhtQVRTYXJF?=
 =?utf-8?B?U1VQOFlwT0k3dkxLeXEwVUJpbml6YWQrdWVUMGhPSjN1ekZSYUorUWloTStt?=
 =?utf-8?B?K3dhMHBiWUs0R1BjbCs0am5ZVjMzR3VyWjFCeEU1SXJUalM4SEV0eTB2RTI0?=
 =?utf-8?B?WUt1bkhxa2d1a3dMRkVIM2xCdElhUVZVbmZkcWIvdUlKdzhPUzYwU3V3K25G?=
 =?utf-8?B?MUJicGVMaE9sVElSZkxuZWFqWGc2WnJLUzZDd1NOQ1R4WTNBT085bDVRaWsr?=
 =?utf-8?B?c241KzJSeVQ4VzQrMXQ0Q2dOMlJwTVo1dHBRMG9UTElYdG52OXFOV0VwckQ3?=
 =?utf-8?B?VFJIZHhPQVBPUDgrYjR6TFJhVE5EZWsvZkdGSEJNTStEOU9JNXZUbDV5ajdT?=
 =?utf-8?B?SS9TMnk3NXFLbmVzTUE0RXlKemhWc2RHalBXNlI4YW9iL0Y2ZENQcWxOcnJK?=
 =?utf-8?B?UDEyMUplaERnMHhlRjQ1bGJTNTZCSGNlTXN3T05IOUNMMXJpbzJPOU80dFQ4?=
 =?utf-8?B?cUpLRE9zNXNFTURWeEdLc1dnVWw0L2xWVDlIR244aGpoUGszRExJTnQ2Vk5B?=
 =?utf-8?B?dStEWkhKOEUrNVZqZTN3WlJ6QnAwWFJpZHUzQWRTdW40UG8wVCszcW5NVkJk?=
 =?utf-8?B?Y2ZMS2RvOHhoS3hpOVJISU00NUhhU09CN2tORXBaMVNlN2RnVXo2TDBja0Na?=
 =?utf-8?B?RktKdVdqVDNMQUkwdEhHNUU2b1RIY0k2T3RJTkgrVFdkOGx1cTVCTGdPRFo5?=
 =?utf-8?B?OUlZSzRPV3hkVWVlcm5OU1R2K2ZJY3dBSzNkQ2U1WU44Z3FtaHV2bXNSTUNP?=
 =?utf-8?B?cm5EMGtYbVZoajdxY1ZMcmVVK1dNaWtGZGZYbUdYQXA3NFVXQTgzbjJVaDBv?=
 =?utf-8?B?Z1ZZK3JDTFJYUDBKdGpRMzV3NFY3aUpOZTNXWCtyREdvM0t4NE44eHBwN3BH?=
 =?utf-8?B?N3R6QzRRL2V4SEEwT3ZzMDd3MFNibkNldytQVlNuY0FaUWRtWHdhZm5rVmxS?=
 =?utf-8?B?c1hLZm9CeVZtbzRKV25CclZxaTlIKy9lcFlLZ3JiaUFhZ3Qyd2ljRjhMK0w5?=
 =?utf-8?B?VG5LdG84R2VQOUJTOEJ3cUdoSXVyNU9zUktFSlJzN3FDbUdqaE9DMjlyUkRR?=
 =?utf-8?B?NUhBNXJtKzF5L2F6YVFzSjc5V3dOdUd6R0lTcC9TNWJqS0hySVhiZTlQV253?=
 =?utf-8?B?OTFxRXZqKy9mN0t2a2hndzVFcHlKYUZtWWplOTFMZDBuWll2VCt4U1F1TWNU?=
 =?utf-8?B?K1ByR3dRV2V6OHpKallGQkJWUHlzY1prazZ1OGh3MlhCMVlLWE1tNktRcStH?=
 =?utf-8?B?NVlpcStLU2ZLZXd3NWtURUtlMEtsV2RPREh5MEhRS2Izd1A5WUlSY09uazhs?=
 =?utf-8?B?ekxTUlhHN3ppUjEvbzhGcHR3eW5rY2xtODZ3N3FkbDlPQ3BWc2FYM2dkQ2xH?=
 =?utf-8?B?TGpzUnBTWmlKbTRNMC9XUEE5dEZhdjFES3NZOFVld01Md2JqcmZlZVRVS2NU?=
 =?utf-8?B?dTdaWUhCdDQ0bzh4WlFKUzRpTHlUbDczV3FPdFoxeDhoMUl2dk5HRTdZWWo5?=
 =?utf-8?B?SEhkeS9GY1VYcDFLSTJEK0dVcjF4OTE1M1hia2hMQXNlbks0TWw2QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eded4dde-598c-4a8b-8e99-08de9ae3769d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:38:07.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/ErtCEzf/GKbSmz6SikA57TqyGCiCQOzBHL9o3wjG3bgc8ToUSoFtQLTJz8aeklejlCY0SCB/zVvsFi+lUXS7epKN7qzivp45j058RtYBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_043812_283588_D04EFF48 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Ronald,

On 2026/4/15 19:16, Ronald Claveau wrote:
> Add device tree nodes for UART B through F (serial@7a000 to
> serial@82000), completing the UART controller description for the T7
> SoC. Each node includes the peripheral clock.
> 
> While at it, move the uart_a node to its correct position in the
> bus address order (0x78000) to comply with the DT requirement that
> nodes be sorted by their reg address. Complete the
> uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
> associated clock-names, matching the vendor default clock assignment,
> consistent with the other UART nodes.
> 
> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 531931cc1437c..56b015cfbd6d1 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
>                                          <10 11 12 13 14 15 16 17 18 19 20 21>;
>                          };
> 
> -                       uart_a: serial@78000 {
> -                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> -                               reg = <0x0 0x78000 0x0 0x18>;
> -                               interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -                               status = "disabled";
> -                       };
> -
>                          gp0: clock-controller@8080 {
>                                  compatible = "amlogic,t7-gp0-pll";
>                                  reg = <0x0 0x8080 0x0 0x20>;
> @@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
>                                  status = "disabled";
>                          };
> 
> +                       uart_a: serial@78000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x78000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";

The xtal clock is defined in the board-level DTS file, while it is 
referenced in the DTSI file, which seems a bit unusual.

On other chips, the xtal clock is usually defined directly in the DTSI file.

> +                               status = "disabled";
> +                       };
> +
> +                       uart_b: serial@7a000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x7a000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
> +                               status = "disabled";
> +                       };
> +
> +                       uart_c: serial@7c000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x7c000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
> +                               status = "disabled";
> +                       };
> +
> +                       uart_d: serial@7e000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x7e000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
> +                               status = "disabled";
> +                       };
> +
> +                       uart_e: serial@80000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x80000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
> +                               status = "disabled";
> +                       };
> +
> +                       uart_f: serial@82000 {
> +                               compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +                               reg = <0x0 0x82000 0x0 0x18>;
> +                               interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
> +                               status = "disabled";
> +                       };
> +
>                          sd_emmc_a: mmc@88000 {
>                                  compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>                                  reg = <0x0 0x88000 0x0 0x800>;

