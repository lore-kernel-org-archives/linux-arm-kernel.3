Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4515C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY5fPeNkKYaZ9cVCaNrS8iqqA1LQp0nVkmK77TLx50M=; b=V+NXP4UtoOaIY9KBGww2EBThlD
	BehnymbXZGVFVvETNaJ1YpaY7eooLA79lQJ/BM2ICiFNyg/nMI9zvEop0WSLMdEBpxJbjk69UoJwn
	hPnrnSLpr2BIiw5m+yp1rhwapZMyd6lE56TBGqknK7F9t7AoCIxP4BrcAPtdIy4GUsVAIX1eBJxFf
	95yJlrnPw87mfabMz3Jwhss4PRRzR9iGJRucT/J34A1tRW6qNHe8nwFZtIJ+lkjNL/cns4qMgMLW2
	NLoDS3btbuW9zsR5hEd2a3zEP849ZjS6w7h/gBzxnlzwJUTfS8+81c4jIlgE8ZlRUapvG7oF7+JX7
	EaQd/fLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVI5-000000027FE-2ywz;
	Tue, 01 Apr 2025 06:40:05 +0000
Received: from mail-psaapc01on2072d.outbound.protection.outlook.com ([2a01:111:f403:200e::72d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVFh-00000002706-2Xiw;
	Tue, 01 Apr 2025 06:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC8liV/GNRlQSecY1zOySZ0DsscLnT7slg4ZeVWqtdLHYdoj205qVnxgckPWZP15JtQZCx8BWlzfYy72tYjq7l8n7mcB4Kk7uXXHtBru2JbThRuSkVclEOwKB2jAzUTa541Ulb3S1XdjfcrbZwusPFPWxNM6Vk9Ia9pfYmOlcjpIvklIGRZW9ZifVxefhfFXsK1T5bfrD4OXM7CwC84OWgTBrRh6YHlU0Puwn+rMUxhJsFdVzqsG4Q5ftxL/TahY/U9Yzr7W3USIjJuuiA1KkW0n4ijxmBH0MgO7BEX7lgbOPthcotuDZhYUgYO2mS8eCSbXrgLClldLXqkg0UK8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY5fPeNkKYaZ9cVCaNrS8iqqA1LQp0nVkmK77TLx50M=;
 b=Xipdj5r3WQ4rCJyJcITl1Bxt5sy9rbr6gmW/0iTxpZRCPOVwdSHYg2a199jpH8wp9tqoI5+K1VWyuQJP0mixEEd1NDUGeX3TNZDubWoDtOHCTQaZXJJUorWnMLVMs963USwaaiZ+bBvVm/lwxzEbOF+0VcbrwcHnyyGTMSQjG4RYeqs9JnZcWFcqHkDTBfI6tbKhadCmU6jLTPEoy/igLKZ7dIetrgwHXK/vLvZmffqyeT9Fsk0wD2wGO4143LC4c+2ewS7v5VjKIZfmNC7ieuBPAN5vlC4827lr/kYwzVZPWJa6xQE2YujMvU0oEJpqjK/MEmht2u2/xye5EHcJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY5fPeNkKYaZ9cVCaNrS8iqqA1LQp0nVkmK77TLx50M=;
 b=fy9CVeP76i1yGixqQC7nv4+I3WoZy9gNejzz1jq2R/qh/tGrfFP4EjQz3MSvCK0utBSXV9mV17AknESBgHSFhp6/DebQ6UAcuVdGpuCd2PPMr0p8HGoAa0SS3Pe8YAwQw3AHPzyW3H4pKxH+4YABK0eArXjTFjn/JUcafNiq8noA1sAkuBJ5KrTxgFdkCPDnU+Gg+lGGSxGfkqduseVSx8/8vSJidtJv8ZD0YWZSLV0pRiRUfh3w9+zirKyu8+abAO348icYOKpS7sIYjnCy7MdYhimPpPq3V/Rr1za1ASVViZKVh5O8x21LqjvkXXQULd+mflgbA+JPFRFUu9N21Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB8267.apcprd03.prod.outlook.com (2603:1096:101:197::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.34; Tue, 1 Apr
 2025 06:37:26 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8583.033; Tue, 1 Apr 2025
 06:37:26 +0000
Message-ID: <549b4c65-cf5a-4e1c-ad25-d0efd0eebe74@amlogic.com>
Date: Tue, 1 Apr 2025 14:37:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
 <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
 <20250401-meteoric-perfect-cuttlefish-abd62d@krzk-bin>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250401-meteoric-perfect-cuttlefish-abd62d@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: f03c2e25-e1b4-414d-efa9-08dd70e7aaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXkyR3Q5cFhLRUw0NytJeE1ScFJZWUo4aG91dEJUdVBQSVE3citRQVM5Zjdo?=
 =?utf-8?B?OFpTT2toOEVMdnoyTkIySXFpZVZHWllVdXF5eURhZUZUNkpkdDJEWEZZTGNk?=
 =?utf-8?B?Q2hqM0NRUExHNko3M2p3bGFiQmtoZHN5eTd4UTRVNFVvUFlnWlBnZzA5NHVj?=
 =?utf-8?B?NzRNdG05ZGNRbFNzdVo0R2dQMW0wcDhNQnpQRDd0Q0I0dzAwdEJKeEh1UWFj?=
 =?utf-8?B?cHc3aW0xREt3NXV1S1BueWFMSTUyQlFFZXEydXl3Tk91L2pPWThxbzQ3N21x?=
 =?utf-8?B?R3c4UThlYndlcDZrRXZpYS94ZmVUbTQydWRoUWtPa1NhTFZDRDE3SHVGRDRX?=
 =?utf-8?B?bW5qNGxuanlFaU9YVjEzemtrbWx1UzJSMkx5bmU2N21CdmpGKzdVOVBsSkJv?=
 =?utf-8?B?bXFWM2lvcm5QdjMxalIvRmNSTnI1NVBrTmF0Ylg4YkJoaVo1YUV0NTkvbGJ4?=
 =?utf-8?B?Z3gxYnZ1YmdQV1c1U25URjVVdDcxYXZJbkFXNVEyT2tsSGMzTkRLOXZMQkov?=
 =?utf-8?B?KzJVaDFERVBWZEx4ejIwaWxPVDk3b204dHc1SklCc3RHY3dubFRFQTBGNXJM?=
 =?utf-8?B?aTNleHJUd1pOa3YrMDhPOS90ckp4eUFKVWJFZytObmsrVkhVTlRmNlJMMDh5?=
 =?utf-8?B?V09PMUcxZHM2WDNLeEdFT1pWUFpSODBoYVlhVVkxZkl1aGR4U0I3MXU1R3Va?=
 =?utf-8?B?VDhiZEFoMDZibzg5bzlIYnZ3ZmVMcW5WTTlzNnhvUERVWnlBVmY5TVY4V0JC?=
 =?utf-8?B?YXQ4UEF2TjJjdkxwZ2k1bWpEUit4UitjYXFzd2hPS2haeGhZM1JqRnhmUFdo?=
 =?utf-8?B?a01lVy9OS1VtMDBITkpTSWo1VGdBSkFRQlEyemk5QXJmNDYxODBUK2o0N1RC?=
 =?utf-8?B?T0ZKOTI0RC92OGFORWMvV1BmZWVDWjNNMm9MWCtpSGRjaWpMb0ZNOUhBcy9K?=
 =?utf-8?B?a29pa2RWVWVaM2NldGl0dEZuUUFpaDFORjdJRENJbFQ3aHN0MlNranU0M251?=
 =?utf-8?B?dUxTYVdONk1neDdCVEx5anZDRW9WWURDSHU5anExYVNEYk9MWmwva1V2aERN?=
 =?utf-8?B?SDNZVzE0N055cndpU0x3OFNqanZUUkpqTG5ZV3dLdGMwM1J4d25iWlJ0TTlJ?=
 =?utf-8?B?aGI3ZCs2Z0tiUjdJUGlKNlpUSmh0L0g0ajNBZXZlSmNsVVlZWmFjZW5tVkl5?=
 =?utf-8?B?ZmxNV21RWVVGaHp6RGFTTjdxUThJdVZhNFhuUWRvTk1GajFGZkNwSmxubk1H?=
 =?utf-8?B?Z3VNaDhKYXBZbk5raHpOTVlrbnUzTzB3anlhMVI2Q2dYNWp0cThLZGFETU9y?=
 =?utf-8?B?Ri85TEJFc3FlODFLRHhlcC9QSWJHMHJJaGJBeVBJc1dXei9CY0dCZXI3MHF5?=
 =?utf-8?B?Y0wwRXVnMUhva250bmhpVE1GaEhJUUM1L0dIaS93MGJGeENsV1Q4eDlWL1dF?=
 =?utf-8?B?bnR2UFZYeTEvZHBnUHZUN25SQnFJRG9OLzN0Q3prSmovaGJCU1E4bFEvRWlR?=
 =?utf-8?B?QUdKbGFRZWJrem4zbGNaZ1RJdDlnZ3NhYitpQXRXZFg1VXpxUjFCelBUb3VW?=
 =?utf-8?B?ZllPRDRHdGtRZkdwN2JWb2VZUkR6UWJlUXBpY1lUZTNOK1A1WTVvZlNGU21h?=
 =?utf-8?B?Tk5HN3kwdE9YVytNZkNIQ29aS0JidldrWFVNQUVSMWhPV2Z4S2gydWJNTlBH?=
 =?utf-8?B?eGFQK2hVaG9MYlEzRXhXOFpZa0F4WXRRbTA3anB1cGVOTFp2eDRiMUxWT2FJ?=
 =?utf-8?B?VDBhbUhod0dGN213L1YzcFBOOXJ4UGdJalZBTDA2eFlGN0Y3bWcrZndhdFZo?=
 =?utf-8?B?WS9wYi92azlZWW5qN0xXQTQxejZEa2lQa1MvMHdyYm1rM2VBZVl3UWtzdzQ1?=
 =?utf-8?B?YlhkRHNpM2daZWZQVy9UdjQzeUxpMkpZNUdkVG1GanFINEwxa0FSaktYMTcr?=
 =?utf-8?Q?Ok+f7jY7ua0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHMxN0hhZWVzbkZmelZKVDNqNHZlMlNTb0JxdFd1dWlJNzFhekpXRGVBRmJK?=
 =?utf-8?B?R2F5RTVETjVEUHpwWDFFeXg3Rk5lSHdPWlhXSHRVYnF6RnpBZXdnSFZBOFla?=
 =?utf-8?B?RzFnd3Zqbm1BV3FUWURrOGdmQXRQa0tHdkNEWVlVczhudnM5bUN6cEtzbE1j?=
 =?utf-8?B?Y3hyc3JGYXdyNVJWV2lGYWgwK3JxOVNTT3ViaXY0TEJRNTRVdjVKaEZXYmsw?=
 =?utf-8?B?dWpZOVc3TnhFNjYxd1J6eGdxaUJtMHB0dmtvT1ErWnN2dHdyc0lrQXgxOWlG?=
 =?utf-8?B?VHRaalZrRFRjZmtPRFY2VEdIdCtOV3JzOStsNHc0MWtDMGFERi9VUFh3MjdY?=
 =?utf-8?B?VUJKRTZzUWxQTENVa2NOZXdhVUZON3VyNjJjaWRnVjlYa3hxQStyYVdMTmVO?=
 =?utf-8?B?MmxCdHhhZWI0ZzAvdk1xUHJ4OVBac2xIamlhbGozMENBOWxFb2NXZ29kVUdB?=
 =?utf-8?B?Q09JaHA5YmpNb3F4Q29nVnY3SnRrSnhyZmpGY2hSdSsvYzhJS0grdEtuK0FD?=
 =?utf-8?B?ZlNmZnl4Z0ZzMXZGTHdyb0hWaDgrcURkWWEzN21kYVQ2VVBBeWpxU3B4YndH?=
 =?utf-8?B?RjhtSzVWbmNTa1JXNlBuSVFTTWd5VWJFa1E4TUswYktTdlNkVlV3TnVpUzVD?=
 =?utf-8?B?NzRUdXRCWkFGaGFHcHFpS2E2Y0pqdFlOQk43K1orRXdtUkEzdWNSeHdRMXVK?=
 =?utf-8?B?Z3NXOHY4ZmJobnBFSkR6ZXNwK09ocjNZeis5cWhiWFJMMTRodUhKcUYxRThv?=
 =?utf-8?B?YVZKbEdlTUQybThRREFPdGRWL2lQUEo2alo2djJtanRqWmZ4ZUR6RmM2VTFr?=
 =?utf-8?B?cWViMDMyamZob2NmUC83a09wZUlNdW96Tk5IQmV5T2EyWHJNalJHamlUS0x2?=
 =?utf-8?B?Vk05V0x5WDV4OUJyN3NkQzVkdlczMmVMcmplRGY5SmNyd1NkSlRLbnV5cEg4?=
 =?utf-8?B?V2NwMWE4SnRFK2VhUjFDUTI4YnlOQ1BvV3BXazVIUStjWXFCSkFEUW8yb1RK?=
 =?utf-8?B?TldyZTMrZHhzQTJ3UjhlOE9sd0Y2SWNLbm1TY05SSUh0VlkzSFBkZWRjR2NW?=
 =?utf-8?B?bFZYeVFmUUdEYW5naGhXTlI4SG5XNlZnU1hQLzdNOUtkMnkwdEFZbXdNUUlR?=
 =?utf-8?B?bmtCZlFMZXRzWGp5TmNHZ1ZYdzBkaTRxYjBpNWVXK3d6cmN2OUFvbjZCMW9Z?=
 =?utf-8?B?K05QT0dVMWVaNFJzTythdHQrV2QwZEw2RDhLYy9DQXB2TUJEL3ljdnk5Ny96?=
 =?utf-8?B?NmpFWUpQMjhXbXBFTzVra0c1ZGpMVFFnaTYzd2VtckFGNWtjTUxkdmNlRnN2?=
 =?utf-8?B?MWNGQkI4bzdYMDVRQW55UUdwR1FTR2pqRHhNc1c2TEZ5SE0xU3ArQTlIS3F3?=
 =?utf-8?B?bWpzeC9neFF2M2tGVERsa2JjMlBUK1RWRjBYYmxCL09LT1JKMGN3SHYvYzJq?=
 =?utf-8?B?N2gvTG9xTlVodmtybzVndGh2cEkwTEduTG9FcUFYTkdoWlExTUtlRkt0Z2tw?=
 =?utf-8?B?RHAyZDNGZzlGNWRjOEI0V1pQVFVmZm9La2ErNTAxVHdZUVROTDlLZjN6L2ZG?=
 =?utf-8?B?SWVFTDJrSUhtZzh4aC9VUTI1MUZrWHBRTFhXdEtUdFpteXpVb0ZSMDZJY2JX?=
 =?utf-8?B?TlFyREU5cDR2cEh6VG5naWZoZzBpeWljVHMwa1RVUDhQWGhMbUVmRGRGNkkw?=
 =?utf-8?B?b3R5K0orNzhCc2VuWWlaU1owU1Q5dEdjU1Y0TC9rNGlNM0IxT3kwei81c1BP?=
 =?utf-8?B?WW9wL3FZZ0paWGZXbTJmVHlvMWRGN1dUV3hHelFaUXF5MkdSZENFeGdjYjNa?=
 =?utf-8?B?SU81REgwZW9sbXBDRlo4cGp5N2ZrQXpjek9Udm8wN1BNODI5a0l3dlQ2d2pk?=
 =?utf-8?B?a3ZzQWNPekZuKys3UFczMXhqTjU3OGdodFMwMWFNb0w4NVJyU1NWQmg0aUNM?=
 =?utf-8?B?Tnk2U3dveEhOVzVub3ZZNERVOVE0M3JrMjZyZy9HZEVBYS83SklmNVpVMlh3?=
 =?utf-8?B?cnBJUWJ6YWZIcEJqMnRhdm4zYUEwKzRsV1RuZzQ3U0N6YStrRTZCOVFKSnpO?=
 =?utf-8?B?amt4WEpDWS9YRlByV0NaeGY1dkIva25uOWFlYm1pOU50bzBJT2lOd2lzS1VN?=
 =?utf-8?B?ZXNmOFVCQWdQNjErQVA0YVpqNjFtQWxNSVFFNzhOT2Q3Q0cybjdlRGJBcTln?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03c2e25-e1b4-414d-efa9-08dd70e7aaed
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:37:26.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v8g8agknLzJLRPaf/zSBpuX3AKqb7covQksF/xDvJHOkeOpdtpyPW/JiHJdXsIlmeOVhJtiXmrPob8qE8HmEzDD0q27rsjRqo1Zhqo4mUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_233737_681662_18DBD150 
X-CRM114-Status: GOOD (  12.47  )
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

Hi Krzysztof,
    Thanks for your review.

On 2025/4/1 14:13, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Apr 01, 2025 at 10:06:21AM +0800, Xianwei Zhao wrote:
>> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
>> no need for an extra compatible line in the driver, but add A5
>> compatible line for documentation.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> index 8eb50cad61d5..3bebccaf0c9f 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> @@ -14,8 +14,12 @@ allOf:
>>
>>   properties:
>>     compatible:
>> -    const: amlogic,pinctrl-a4
>> -
> 
> Do not remove blank line.
> 

Will fix.

> Best regards,
> Krzysztof
> 

