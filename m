Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E52EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBbdYWpod8Si8ssldwnsSHiSDf6iGz8RdaEfEwA2OPY=; b=YStMbeV+ksGYcd2m5hFkd10H0L
	39lZ3tAZw3QTXw8TAjJVAs7XTNH5j4PcBaA6Kt1KhkDivJl2PZA4sdRCT1juXlfthKXnFebVW6oPj
	IKFoe0T47fCq1Hap8JjBaPauqjPnb3FRALNxrsB4owsG0AEvjln+QU32Ny6O4KMtzF6HY/yW4yYFM
	sKiC/nk1y7C2O6voloGCWkBtwaWk9IjHitv0lE1HPiQFMLyjiMTxsoXBBXdyht2ntJofAlIiQP6Jd
	JEgDb4JLUftR93iuHMKhftlyhQzmuG6gR3yo3epdJiCGrS/bxfTDixhb1yuPT7LCva59SrJXJbm7r
	6EUJtPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuNJ-0000000E4ao-0eLu;
	Wed, 15 Jul 2026 07:49:49 +0000
Received: from mail-japanwestazon11010052.outbound.protection.outlook.com ([52.101.228.52] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuNG-0000000E4aN-0vD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbPCOxbv8Sh9QYJgoGaBaKbfVIwFQa7ibODVkDmBSMVPRTD8Gpbn1OZ+Eoref8WXLPaZNb8kH19aJivLitR0VVMQvY3KkIcTi+sB/ilVT0UzLDjtJcoDelA/g1800G5fx3yuDE94kLWaZ6CqiYjbk9cfnPrrs2YdjijDWmfIvnaS6r/1qB1JxTW9SIfPwU6rNQlcJsQhtbEEKFuQU1ysUAWDoTLtwKUEwdTWeJYFA9T+3EjLsQelB6jNj7FMJVqlZrp2OljK6yaLNAW6vfoHXsfJGBVTZ5yATBB1Rnyfw1So9WOUesXZ/IHznyLJQf0fWyC+5ZjTGz8GwJPl8koQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBbdYWpod8Si8ssldwnsSHiSDf6iGz8RdaEfEwA2OPY=;
 b=lU95lsvGB7hhOmbD45GdJetXv6wHVTGamJuI035RyZ0FQ/mCCFJwaP9EvUPWHrqYAgbrmPF03t/ATgb5WFYK4jx+d8FnWbu3PL8zwl1K/xi0bTKO6GwpoVZzfY3DgiTBpVEj5qnl75A6f/9eUTnYoQ80dNVbl9PuJFbjb/rxItvq6KZ3izZLKC4FODMEgmbT8N0cY1qDRfv6tPiAnvrL9J9G/Sz1BooAwquLfmXjyR6yF55kKesk6mbxbNbGtk1q1qp2ALTLezyIClI2ZBmYUiTAU2p6aH/O2IE+imlkv0A71cQ8/c1q3Ht6+SxxfaoF4LlfPMP9+t7mYmnCfgFAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBbdYWpod8Si8ssldwnsSHiSDf6iGz8RdaEfEwA2OPY=;
 b=gNy7nWPE1UwUKOHbFb2mdg++CZ+XSS1J8sSRsFdq7utVrZ7vqQ3l61Eqt3BNq1oDfFw7uWKQWH0kre0etWfvvvaJJwmWjrU3B04tltWP3J2Rj39YqFW+64hPUAr4xmDg+s3TdaCwidZEZRCnx9/yPI/zUJMPIsoP1YpalBZRsuNa1AN89mzcmlSCcJNS0Imr/lqDEwBnIe+cHvfMQMmazfjWSuE3+m/ykj03u8K/jQO+h9UJG7QB2J93tdDc/cdlV+FukjJ1x29/t1CmKQbbiYIsJ7201FJSxeHOZvwGzW9AjrrS408b1l6dw0V8nQtqI/PlQ1uiHlQSldwvtXEAHg==
Received: from OS9PR01MB16920.jpnprd01.prod.outlook.com
 (2603:1096:604:40a::10) by TY4PR01MB14005.jpnprd01.prod.outlook.com
 (2603:1096:405:206::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:49:39 +0000
Received: from OS9PR01MB16920.jpnprd01.prod.outlook.com
 ([fe80::82de:de33:b50e:56b1]) by OS9PR01MB16920.jpnprd01.prod.outlook.com
 ([fe80::82de:de33:b50e:56b1%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 07:49:39 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "ben.horgan@arm.com" <ben.horgan@arm.com>
CC: "james.morse@arm.com" <james.morse@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>
Subject: Re: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on
 restore
Thread-Topic: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on
 restore
Thread-Index: AQHdFCDOGgMsxs/p9kaDstfIk2tWIbZuMPrK
Date: Wed, 15 Jul 2026 07:49:39 +0000
Message-ID: <OS9PR01MB16920A90EC44010A30A79A4728BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
References: <20260710115546.29644-6-ben.horgan@arm.com>
In-Reply-To: <20260710115546.29644-6-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-07-15T07:49:38.873Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB16920:EE_|TY4PR01MB14005:EE_
x-ms-office365-filtering-correlation-id: 4052a5bd-3ec0-4502-7d8a-08dee2459fc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|18002099003|22082099003|1580799027|38070700021;
x-microsoft-antispam-message-info: v22V4go/SuzWYn4nFZcwDTGHHOanBkJolEYWJm01qx71Zi6n4LxcQbt+rIBz1v481APM9afNEtkKzBi2eGBq1tKWmUAcL4e0QHmfqzeiHMh7TQA79nzA8nebycv+eiulfUT4t/FDinaW9dp4SFGPPgoGMWU0hpoLVvqm9AbbDTXX6SdGNGpz5l4sj22zOA7EIALeQdZUtBdTITpzU2WSn0vlNBfu44kKGgjxoc568RHZehLsUwm5d2nvAtDD/2AufDSDEn/Ijrh48OUpHOPR0aSwlUj8S7oPIc5T7FiU/tTmU3Mlk1+ldbZPERI5R+0A2vQfozuEa6xAoH1gQQfvwN/78tjHRkbojoq4LFcDauvGSGWYsYsoG1a6fzrdArAkLu5lV97G2wtI1JUsXIB5nA6SSISYoD4f1t5HsnOf+Y2nE/v8VYt0jcT13Ui/pkrNl6wNgNJMofM0Zrt+cDGz2MNo6b8HPQTY1PLN9k8fqFN+0FkiKcIkivJ+YJIgktIxBNtktMxK1bcasO7okF1oxbts4D02BuySIW5xcFU3fn59UCrkwtbmXBGlFNytmRMiyiuJDGEs1kYm8FClHUTUhXyOHITy85vWkQdmPJOEFBloBDQWAtA1SmVN58pQNTqx74KF2G2U/FsJQZqCoTaA88TiGEvLTDfejSpxiYxPCuo5Y3+2NDf9rL+Y63DkDgUYmfcXq+IF7qBBQhXxhGY/4uE03nuT1r22IeIU1yVS6rWLrjRpOQT+EyCiXvWioW4w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB16920.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bk5raCtJcDdCMDdNeGVnMEdCVFlzUllLVHk4aDVzYTFzb2V2bUNMMUI0RzJ2?=
 =?utf-8?B?RVh2SDNEem51Zk9tZ0xCRzlveExXQkoyWmhkcUZibG8wQ3ZsMWdaL3Z2dkx2?=
 =?utf-8?B?TmhSQXZGRjNVM3Q1UkJ5anhwaE1lSmp0QU01Rm9GNklDeHFpOUhMbHJPQmRB?=
 =?utf-8?B?K3ZxQWhMdHZ5VktQUkRSZExRdXM0dXZVK25DTkUwWDQ1UGlQb2VtYmU1SUNM?=
 =?utf-8?B?MVJQNTlhNHE4MHFLb3cvV1p2c01oSkxtcURXNjcvdkhuRHA3QnJhRzdzWnh1?=
 =?utf-8?B?b1U5bHlxRTc3cjBBbndoNm51eHJ3eFBHQzA2ZEthbHFydDg4REl2c1hQYUJ5?=
 =?utf-8?B?Vys5Z2xCcmFxYVhoeXplSTRmWXkzamNwc3hRN0w0dkZobFBBNWZ2MGMrSUpV?=
 =?utf-8?B?R2tNRXZGWE9wZUI1aDNNdEREMGp4WGNMbHhvNEFSNVR1cS9YdHc4SjhCZnZP?=
 =?utf-8?B?UzBkRTdEUExZNjZLWk1VaExGVElnYWI2cURzTG03dHUyY25xZ01lZW9WMXR3?=
 =?utf-8?B?MXc4MU1iemVoYXRGN2orb3FaNnc4RXNzTFY2Vk1KMzJnMlF3cGdEbnhpd2xn?=
 =?utf-8?B?UmxkRzFvZFcxajUzdE1WaHFpcXhwTEIxdjJIN1FpcVNBbzhHWEo2YXpuZGJp?=
 =?utf-8?B?R0hvWEVHcjB1OXpMRzVIUkRIeEpCOERuNVQwb211RXhpck8wczlidXEwcUJp?=
 =?utf-8?B?dnNrZW9KL2VpTWJwRkRNejl6TklERzRqbDhCTndNYXprWGJqc3NzdFpzMEFE?=
 =?utf-8?B?bVlENlI0V0RkelEvdHNnZ01sbXprMXg0QTgxU2hmVFBUdGNQeUs4T3NkVTdi?=
 =?utf-8?B?eUYra1dSRFRxbkZUdk5TZitsKytmK240Zm5kTjBxeDR6QnhVZ2RYWjV0N3RJ?=
 =?utf-8?B?WE85OEhQYjNMZE0zZUtIakhKKy80VEU5UFh1ejJYN25GbTk0S1BFaTg2dzh4?=
 =?utf-8?B?NGtMY3Z1N2NraTBrUzZMNGE0ZGppNm9xVzlWNHlUUEZVd0l1NlRsQTRKbEEw?=
 =?utf-8?B?OWN1dWRMRm1qUU1wTWlVNkJwRnNscGVaZ0xROG9PYzF2eW9Ib0R1QUxORUI1?=
 =?utf-8?B?cFZWV0xwVnNMdFhZQkMvaWtrRE9xbUlrbDR2SDVuL0QxNnNTMGYzN0hqYkpZ?=
 =?utf-8?B?MTJMUFhWdFEyQ3dRQnBsZDM3T1JtbStSdE8zQ01WUlhpcUgxK2xzb1YxaEVN?=
 =?utf-8?B?b1RsZVJDMUxsczZ1dUlobGhObSswaHIzVUpDZG15NW1GbmhtZWlRTlh5WDJi?=
 =?utf-8?B?N01zV3JzRmYwUUhDNU9lVG51dHlRQnNPMjd2NXNIdDUvZlN0cDRjUXhwMHc4?=
 =?utf-8?B?TFJlUUVSM200SzI3bmlhWkY2dU1zeFk3QzFMakpvU2ppVlQ2Q2ZkaGlheHBP?=
 =?utf-8?B?SEV3NDNvdHprU2E5Q2lFa2JjemJoMlhGY0ZhMHpJQk82OER4R2g5azloQUhS?=
 =?utf-8?B?aWEwVDhKMXNJYlZwMFdOSlVOcEp2NC9oYnllSGM0YmF6YTlHcFpvUEpUU0tp?=
 =?utf-8?B?SnlENUtKenhxclhZZEg5UjJpZ1Q4ZXNwWVRNQ3dXd2p5QWtuZloyZkVLYWlG?=
 =?utf-8?B?SkZncGFMRXBEM1lXcTM3RGMrZmJBR0VuRXNyck9sbXMweExUSjZvRVZkRU9Z?=
 =?utf-8?B?aUgvL2tIaWh6NjdHTnNMckdHQzYwT3YxYy9QMFFWcEQzRXpBRVV2bHdiVlQw?=
 =?utf-8?B?dnZPMEROOC9JeWt3UE1hWGxVdzlQSWoyUjkzSkVSYTQxNk50T3FtSmptVVN6?=
 =?utf-8?B?RjdoVXZWZndHWWZFdW1uZ3o0a1g3VnNvclkwUkt6VmZmeEZNTkR6U0NoZWox?=
 =?utf-8?B?eHVQVDNlenQyWTlpNVAza1BkbVZhWUJ5dW1pbmxEL3llZ0ZvdTFPVTNjUDZq?=
 =?utf-8?B?eFE1WG5ma1pxVkwzQlhWTG90cXRCZ3VtQkFHN1J6QW9yYU9IZzNRRTd2V3NQ?=
 =?utf-8?B?MGNEM3NrZVZGdHAxYnNvUjFjQW5Bck1URkZuQStnQ3cwS0pmamlaeWpEWVRK?=
 =?utf-8?B?eWJEUWkzaXJ1QUVOYjZPRFY5MXZGQXl3S1FYVnRZNXc0VE51ekRscXE3ZUlC?=
 =?utf-8?B?SU44OGcyTk9YV0RSekYwQktVT2tCYW9TM2w4aTVOTzc5VUVyRGdwZ3o1Y0ZQ?=
 =?utf-8?B?RmxzNmhzK1VWclhVeDBaRU9JeUJIMlgvYTFiWTFyNjRVMENlSXNhTlJEcjV6?=
 =?utf-8?B?K1dTeG5oK0Jpcnh2T3Q0UGtGeEtPV0tuZUgwejc0MGNwb0RKRllWNFR2VStZ?=
 =?utf-8?B?ZFk4QkhzbU1nRndlZ0VMQWEvMGR5NWhuMWdmcjRRbXdPZm10N2UwcGkxNnc3?=
 =?utf-8?B?ZmVGc3hxa1FMWEcvQ3U0eDZUaG42RzFQSWxCcC9jVHFYcFpUOEQxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jTnKcid5ejEICK/9d28Uu5GIJZ20Zb9IVRUw9P3HK1ARRzUPa5PWX04kLF2Kst7c/wVy30C0DDiv/HMQozpT2XTZyarZ6rD+qAClrTKu4BQqG4+Eb5c+B3SfR8rsIxGlBfm1wv9RFGPNlC/pYkgH/6GZQ5xDvoK6TQoQoimvx9UXyWvxEhWrPExo/zvSz2+rgRVDXm0Uf6kvGAp0u+1XvBWYLKLHJslJJiZ6ZiX3o4z+tPMeo1dBYKXao4DnhzcgjfnS/NtEawtA47HK2oHA1NfjDaNv0UJ/s7IU9zgp3Bem5CRuheip5BQF3xENL78dG9t1oW6njFqd80UdWR4Cig==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB16920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4052a5bd-3ec0-4502-7d8a-08dee2459fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 07:49:39.3720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DTfZmt44JKp06Xu0fS22wvlEITya2TjUmmLgxbvQ/jHlq+YAUxp53uVh6h+YYDrCS1Q9xF+HTELFMFppMsHzZ2GR9oMmImWtpD1kFEV7G8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_004946_416512_031EABC1 
X-CRM114-Status: GOOD (  13.55  )
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

SGVsbG8gQmVuLAoKPldoZW4gYW4gTVNDIGJlY29tZXMgaW5hY2Nlc3NpYmxlIGR1ZSB0byBjcHUg
b2ZmbGluZSBDRkdfTUJXVV9DVEwgaXMgc2V0IHRvCj56ZXJvIGluIG1wYW1fc2F2ZV9tYnd1X3N0
YXRlKCkuIFRoaXMgaXMgdmVyeSBsaWtlbHkgdG8gbWVhbiB0aGF0IHRoZSBjb25maWcKPndpbGwg
bWlzbWF0Y2ggd2hlbiByZXN0b3JpbmcgYW5kIHNvIHRoZSBtb25pdG9yIHdpbGwgYmUgcmVzZXQu
IEhvd2V2ZXIsIHRoZQo+c3RhdGUgbWF5IGhhdmUgYmVlbiBsb3N0IGFuZCBzbyB0aGVyZSBhcmUg
bm8gZ3VhcmFudGVlcy4gRW5zdXJlIHRoZSByZXNldAo+aGFwcGVucyBieSBzZXR0aW5nIHRoZSBy
ZXNldF9vbl9uZXh0X3JlYWQgYW5kIHJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkgd3JpdGVzCj5mcm9t
IG1wYW1fc2F2ZV9tYnd1X3N0YXRlKCkuCj4KPkZpeGVzOiA0MWU4YTE0OTUwZTEgKCJhcm1fbXBh
bTogVHJhY2sgYmFuZHdpZHRoIGNvdW50ZXIgc3RhdGUgZm9yIHBvd2VyIG1hbmFnZW1lbnQiKQo+
U2lnbmVkLW9mZi1ieTogQmVuIEhvcmdhbiA8YmVuLmhvcmdhbkBhcm0uY29tPgo+LS0tCj7CoGRy
aXZlcnMvcmVzY3RybC9tcGFtX2RldmljZXMuYyB8IDEzICsrKysrKystLS0tLS0KPsKgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcmVzY3RybC9tcGFtX2RldmljZXMuYyBiL2RyaXZlcnMvcmVzY3RybC9tcGFtX2Rl
dmljZXMuYwo+aW5kZXggYjM0ZTJhMzY4NTE2Li4yMjJmYzI0ODA2N2UgMTAwNjQ0Cj4tLS0gYS9k
cml2ZXJzL3Jlc2N0cmwvbXBhbV9kZXZpY2VzLmMKPisrKyBiL2RyaXZlcnMvcmVzY3RybC9tcGFt
X2RldmljZXMuYwo+QEAgLTE2NDgsMTAgKzE2NDgsMTMgQEAgc3RhdGljIGludCBtcGFtX3Jlc3Rv
cmVfbWJ3dV9zdGF0ZSh2b2lkICpfcmlzKQo+wqDCoMKgwqDCoMKgwqDCoCB1NjQgdmFsOwo+wqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbW9uX3JlYWQgbXdidV9hcmc7Cj7CoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBtcGFtX21zY19yaXMgKnJpcyA9IF9yaXM7Cj4rwqDCoMKgwqDCoMKgIHN0cnVjdCBt
c21vbl9tYnd1X3N0YXRlICptYnd1X3N0YXRlOwo+wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXBh
bV9tc2MgKm1zYyA9IHJpcy0+dm1zYy0+bXNjOwo+wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXBh
bV9jbGFzcyAqY2xhc3MgPSByaXMtPnZtc2MtPmNvbXAtPmNsYXNzOwo+wqAKPsKgwqDCoMKgwqDC
oMKgwqAgZm9yIChpID0gMDsgaSA8IHJpcy0+cHJvcHMubnVtX21id3VfbW9uOyBpKyspIHsKPivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1id3Vfc3RhdGUgPSAmcmlzLT5tYnd1X3N0YXRl
W2ldOwo+Kwo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKFdBUk5fT05fT05D
RSghbXBhbV9tb25fc2VsX2xvY2sobXNjKSkpCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj7CoAo+QEAgLTE2NjEsNiArMTY2NCw4
IEBAIHN0YXRpYyBpbnQgbXBhbV9yZXN0b3JlX21id3Vfc3RhdGUodm9pZCAqX3JpcykKPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtd2J1X2FyZy50eXBl
ID0gbXBhbV9tc21vbl9jaG9vc2VfY291bnRlcihjbGFzcyk7Cj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXdidV9hcmcudmFsID0gJnZhbDsKPsKgCj4r
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWJ3dV9zdGF0ZS0+
cmVzZXRfb25fbmV4dF9yZWFkID0gdHJ1ZTsKPisKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtcGFtX21vbl9zZWxfdW5sb2NrKG1zYyk7CgogICAgICAg
IGZvciAoaSA9IDA7IGkgPCByaXMtPnByb3BzLm51bV9tYnd1X21vbjsgaSsrKSB7CisgICAgICAg
ICAgICAgICBtYnd1X3N0YXRlID0gJnJpcy0+bWJ3dV9zdGF0ZVtpXTsKKwogICAgICAgICAgICAg
ICAgaWYgKFdBUk5fT05fT05DRSghbXBhbV9tb25fc2VsX2xvY2sobXNjKSkpCiAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlPOwoKLSAgICAgICAgICAgICAgIGlmIChyaXMtPm1id3Vf
c3RhdGVbaV0uZW5hYmxlZCkgeworICAgICAgICAgICAgICAgaWYgKG1id3Vfc3RhdGUtPmVuYWJs
ZWQpIHsgIC8vdGhpcyBsaW5lIG1pZ2h0IG5lZWQgcmVmYWN0b3JpbmcKICAgICAgICAgICAgICAg
ICAgICAgICAgbXdidV9hcmcucmlzID0gcmlzOwotICAgICAgICAgICAgICAgICAgICAgICBtd2J1
X2FyZy5jdHggPSAmcmlzLT5tYnd1X3N0YXRlW2ldLmNmZzsKKyAgICAgICAgICAgICAgICAgICAg
ICAgbXdidV9hcmcuY3R4ID0gJm1id3Vfc3RhdGUtPmNmZzsgIC8vYW5kIHRoaXMgbGluZQogICAg
ICAgICAgICAgICAgICAgICAgICBtd2J1X2FyZy50eXBlID0gbXBhbV9tc21vbl9jaG9vc2VfY291
bnRlcihjbGFzcyk7CiAgICAgICAgICAgICAgICAgICAgICAgIG13YnVfYXJnLnZhbCA9ICZ2YWw7
CiAKKyAgICAgICAgICAgICAgICAgICAgICAgbWJ3dV9zdGF0ZS0+cmVzZXRfb25fbmV4dF9yZWFk
ID0gdHJ1ZTsKKwogICAgICAgICAgICAgICAgICAgICAgICBtcGFtX21vbl9zZWxfdW5sb2NrKG1z
Yyk7CgoKQmVzdCByZWdhcmRzLApTaGFvcGVuZyBUQU4KCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19yaXNfbXNtb25fcmVhZCgmbXdidV9hcmcpOwo+
QEAgLTE2OTYsMTUgKzE3MDEsMTEgQEAgc3RhdGljIGludCBtcGFtX3NhdmVfbWJ3dV9zdGF0ZSh2
b2lkICphcmcpCj7CoAo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3VyX2ZsdCA9
IG1wYW1fcmVhZF9tb25zZWxfcmVnKG1zYywgQ0ZHX01CV1VfRkxUKTsKPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGN1cl9jdGwgPSBtcGFtX3JlYWRfbW9uc2VsX3JlZyhtc2MsIENG
R19NQldVX0NUTCk7Cj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtcGFtX3dyaXRlX21v
bnNlbF9yZWcobXNjLCBDRkdfTUJXVV9DVEwsIDApOwo+wqAKPi3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChtcGFtX3Jpc19oYXNfbWJ3dV9sb25nX2NvdW50ZXIocmlzKSkgewo+K8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG1wYW1fcmlzX2hhc19tYnd1X2xvbmdfY291
bnRlcihyaXMpKQo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHZhbCA9IG1wYW1fbXNjX3JlYWRfbWJ3dV9sKG1zYyk7Cj4twqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXBhbV9tc2NfemVyb19tYnd1X2wobXNjKTsKPi3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4rwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmFsID0gbXBhbV9yZWFkX21vbnNlbF9yZWcobXNjLCBNQldVKTsKPi3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtcGFtX3dyaXRlX21vbnNlbF9y
ZWcobXNjLCBNQldVLCAwKTsKPi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPsKgCj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjZmctPm1vbiA9IGk7Cj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjZmctPnBtZyA9IEZJRUxEX0dFVChNU01PTl9DRkdfeF9G
TFRfUE1HLCBjdXJfZmx0KTsKPi0tIAo+Mi40My4wCg==

