Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FACFB3D17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V8HBbG2IACmW7Kt58EwkBMjOE5JvWYRSYV5XrSOZeY=; b=iKhwmH8LK6m5PgatDHzXjGJSM6
	xLd0z4foUT86OUB07/Dx5qQ/MSG5WHxuMU9xPNlHpBipjGC94ip7ZvVu3jRZTDWXzyz3bLRC3mQbX
	WtH71iIDczTf41ddjzrXb8wnrFEelzZLpwkayREq4uqKIl04j7N3juWJxCQI1PJDNkTnkfI+O4nMn
	EJ0IggXoDVUyPKYTnV3asn5dnBI2Mu8W8526KnFlYPv8M6Du1Uk8mx0YzUuaGYwANK6NpmMqWAl8D
	CaKgGpK2gF0R1Sz982hvagESAelYedXbpkPwdmeKRN8a+Ymr7eiHaNLxYqzgu/pn/Or8+/aEXxo/p
	Cjp/hZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A6Y-0000000B5ZH-0vpf;
	Mon, 30 Mar 2026 10:44:22 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A6V-0000000B5YP-1omn;
	Mon, 30 Mar 2026 10:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1Z1My6/dGQjdzWh/hquLqdadPfvx95Z3MEOePhWJy8gebtVYcEPm+v3L+W3XLClTkaISFyDkj27ZIcKwJ63PuoDmlX3c/hnDYaAORcisgjFeof1i7fufJaklYWNNZK8QWJzslNRU/3KAiawJpbCahqzbv3EmrOwRTxCtw1L38o/x9l1sMAsNd79xWsY1LPAVChQHGBdNaYIwT6GNDmpUMPW432OcC3LaxtCSwPFh0SRajRhnVEEj1a8xXKjNZnyLgRhmmuZP0+DEx1fdw0/Zz4XGtHSLSuDhM7Q3K4rA6Zuq8kh0w72F5tS0Bb8Phw66AWKtZbld4K8DC0SQPY0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V8HBbG2IACmW7Kt58EwkBMjOE5JvWYRSYV5XrSOZeY=;
 b=wqm8zdFeuSHsw6W54o+d4xuoOsYKib4L30MFtlE3VnzfRfsGd0hN6yCZrURdIZ64WSWwu/RlfTpoA6V21xthN9ZOMdkutIo4n4y41uwCZy5U7vwAuTcttASeInB7Djg3KKzVidNsXJ5qpIkUf2hnsBXPwNl4m0SZGWvs/NH9UW88IkkYd6QRVnWm8CnQm4vkKuNN2NKlMDM3758gJhD/ew4lBjCJW1D6i80bdAe4h5nL1eCtwd+Xx2rVDdVJbsexozWL27+rBJMLY9QKpNxfX2gcAwMWQYm/GDCGNeP5R74UmxUMwyAI6/ncNTiucgaN8DwCy/jvu4AXp46kdJFS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V8HBbG2IACmW7Kt58EwkBMjOE5JvWYRSYV5XrSOZeY=;
 b=IkrU/wtTO4Uh5tYjy5FKsHntTbK3aO4m38Pb4Nm230JhPAg2Th1elpisDYFBItwTeQfuSpD/3FGJTMFzf1JC/GXJSSXs4Y80MadEu/ixGbTTBKx8pIjb73IKWI7agghucYOmnR507Q8VZCB2/v5kMQWq/HC3SSX0OQpfgco1ZTXR708e+pJasMMC+GL80oVXvw2A/Y7PsHKAqCUH88OOg4hnIAf9qU1L7H6pIDz6ksDE/NNMXKiKfA6F7lJecI5NdtQOGfbBDGlAORc+YUAuRwY+mzUhfLx7Fy1u80NmtzFfc8Jid1ASZiLBxnEPsr0W8knVcVCK7Vo9LQA1v5XWuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KUXPR03MB10075.apcprd03.prod.outlook.com (2603:1096:d10:a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Mon, 30 Mar
 2026 10:44:04 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:43:32 +0000
Message-ID: <9830ff89-a145-41d1-98e9-1412f497d3f2@amlogic.com>
Date: Mon, 30 Mar 2026 18:44:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
 <20260326092645.1053261-2-jian.hu@amlogic.com>
 <20260327-rough-spry-hyrax-8236de@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260327-rough-spry-hyrax-8236de@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KUXPR03MB10075:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e650df-391a-4016-ba8f-08de8e492fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: C0igonA8m4AiGnvbFaUH/NXffL3SCgERNfiRg8AqY2TC+d+Q1xo41oS0QPStM4JmOCzro1Us98xSvipq0w5C0ZywV8R5cH2qqMid5DNJhQ/0eiqh7mJ38irMKMtGYnKFk6T9sPWGzJHub4p6MnoTwg7VOlLoirneqYUvLEiYyzfJV8aFuMOgybhlWKAz908X8he0Rk4ZZ6LaWuMxGe7Bonl0etG6CR+JWaEadC4WAsrVaBgYJEXMtxk3HAb0L9T27uY7YDi24M1I0L69rB+37d+hEpE0b4wYty8pCZF7JHJ0H7LMF53S4rzL0ZCSrSPlLB/rnQNHnDLmmFt/+B6LLATWjshB4a5bcKomQ3SAIajC1HwWzohwHTRYdmFVI4/l2jE5ylgJeUSFStazpZ5kPPJCitGc26QfOHIg44iFypaVWLARo4TTBO5l+E2KZCz2iD0X+4OZGKlYbHAm0LIOnXefCZP+FXWkC3pFD/8BbKNmzhtUGV+CLlNLpt7zPwUFe3M7mHujeKCScU/AjZe/IxhDn6u8dzMk7GlFifkV2Abd7+20GHPwGmbNQGNVriZqid6JanebIllVj5xHf3kclV9dCZcBq1arD041ANZpT/OaYdBLKlR+eoHc7xE4HVAKrfTRaZFKFzJQ/6e6kmX4gHRe/yRQFuhKMhoL1gn2ntlqbuxPjWLIYD47S8r4nNal4EWYNdbN+bX7bYWaLIqYXenn5TLEgqD4GGoMTWyTeuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElLUTNPa0F5VnlLKzlUaUtjLzgrTXpNUmxKR2RjeU5GMmh4L2dTMnFHUDlP?=
 =?utf-8?B?N3JYQWxTV3UwNUxEdGFFVW9BL3l5Nkt5WlcxeUw4TWVGaythWERnNjRDanFO?=
 =?utf-8?B?R0k2Y2tzUS9BN0V0S3Z2MldvRGc5MnJoNFg2ZEc5aVQwaE9IVEo4UnB2VDV4?=
 =?utf-8?B?Mks1aVNDcjlyZXNXb1VsS0hJR2E1K0lNd3BCYXNxM1lpdWlhcVIyMVB6eHgr?=
 =?utf-8?B?K3VPcEFTUG9yMGFRSExwd2o4Y0toeWNvNEN4SW9qUVV2VVhNQW1vdndrU2Vo?=
 =?utf-8?B?RGtXVlIwaXZoajk2bC9BbmNrMjlVZ2lPWUZTNkE5MnJ4c29PMXBUU0U1SnhK?=
 =?utf-8?B?cXJtWVkxWll4UVpFMTdETHR1KzlOcmo5b3lmU1kyNnVKS3VLSmtJYlpYMzlz?=
 =?utf-8?B?ZEF4YjR5TE9WQVhSaGVqS1VDNEdPOEdxZm5YK2JZY0F3V1hsMU9aNE1EaU90?=
 =?utf-8?B?bVhlREhRc2JVYmtiVk5yNGM1c3E1R2hTaXFNaWRrdXVqamZlNFI4RGtaS0hV?=
 =?utf-8?B?amxjN3d4UWZwT2dZQmlMZGNvZWpHL2RjSzZIbTRMaHhrTnRyTFA2REx3WHdk?=
 =?utf-8?B?YzVybWhVWlVlS0JLbEdYRUxoV2FxM3dLanA2RWFmT1hTbFZiQkxpTmJOS01T?=
 =?utf-8?B?TC9PaEFRRWdWcUhoa2ZpbGlyeW9vaEJ5a1BjSUI4MGowMmhyMTQ1ZnFOUHVW?=
 =?utf-8?B?T1VwT3BySDVBYkVQR1FncTJ4aGFSZk1jYmhxVXlMQWhTcTZPRVpzY09XSDdF?=
 =?utf-8?B?TFlpQm9MZkNrWVQvbS9Gck54RkdwMDNTTVpTTlVGMHpKL2gvV3MxWjlCZ3g0?=
 =?utf-8?B?T0kvaVpIVGhWbmoxMjZSZ2VEaFRQZFNWdE1UbUloWEhwcXI1Vk53VkMwRDho?=
 =?utf-8?B?MXBZUUFjdFJiZ251SWZHVlhsZEZGaDByNlYydmNqUkdWUFZpQjJwQkxTVzlF?=
 =?utf-8?B?ZUd2SmxYdWp0R3F2VU96Y2RlZEgzUXFGNktIMmsvRnpLZkUvVE9rZWM3aDM5?=
 =?utf-8?B?cTVVUFpxQnZxbzRMQ3QyR3NRY0hKMTM5QmVnbjlCbFZ4SlVkMkcrbklpR1Ft?=
 =?utf-8?B?RVA0Z2NiNXhFc2VxWVRXc2pId2dSdzE3SnBtUFV0SkRHS0cvZERHdG0vM3dp?=
 =?utf-8?B?MnJia010QTRxZzhPcWkvclBzUFdPelAzbG5pNXFBV3ZteXFFZHNxcGhpL1hU?=
 =?utf-8?B?d0dzUktvMW5xbWFkOEY5eGFVK3VEZXp2UkpaUERRbHlTRE1oelRzM2Rlakdr?=
 =?utf-8?B?dm5CaFhucTI2M1hzakFKcEY0UjJIN1V2b1lvbWRRZVYzZ1lPWklGSnMvNkQx?=
 =?utf-8?B?T1cyMjBwZzNXOFkzRUt4T3grUFBjaUpZdkpOMVFlejZqd1NtMlEwc2QzTk1Z?=
 =?utf-8?B?Vnh4MHBJWlJyTU96TGZjZDFKRTNYaGpuZkR0UGRNcE9ZYUh5YzBKTjJyc3Vs?=
 =?utf-8?B?Zmo3WmZ3aG1rM0p6c2dJbklqS3JPdlpVay8xM0FxRldKbVFGeTdYY0dyMXJi?=
 =?utf-8?B?QzRUajBlRmVPdWF3aEsrSW5jazE5dGZjTGFiR1o0NXBkcEJ0MFluZEwyZk85?=
 =?utf-8?B?QWNBSHJFZHdEWTFtWDRCTERjUjlFeVR1eHpENDVHYTE5UVZHb0VkU0o0T3p2?=
 =?utf-8?B?akpDN1ZuZm52azBBMnMvaVZMWXozdFFVQWxyektiVkZZVVJQQWtOcWM5eGVv?=
 =?utf-8?B?YytqTGhHWVZzdVdZL2hYMWQxYWVYN0FwOUtaRzA5YkwrZ0kzVUtndVpYWlJW?=
 =?utf-8?B?TTY4OGZ4cVJnbGZMS1hlY2RROVJpSmNRc2pwMGVQd0RrU0xUR21mR1FCZ3V5?=
 =?utf-8?B?aTdobzg3RThFVjVIQ2xySHZ3RTZWSmp4V0lSZE5pcW13ZzcwaUhhZVczMHR5?=
 =?utf-8?B?Q1VYdlJlSUF0b1hqRnNKclNaby9rcHU2bkFkMXhoemcyeHl4WFJXelhHUTd3?=
 =?utf-8?B?Sm8zQ2tkQ0szZ2hNajJCRmYzVmJKdmp2TVE0bXcrYTVITktobVRoU3dBL2xl?=
 =?utf-8?B?QWo5UDVoS29ZcTdDbDRnR202QjVhaUN2VTlPWFNTa3VMbWhMNUxuN0hiUGdD?=
 =?utf-8?B?cDFzTmRvd0xPeTRDMjJDRHNRZXQxVjEzOWdZNHc3bFdVZW5xUnd2TVh1SDFG?=
 =?utf-8?B?K25TZjQ1bGh3WTR3aHNrRUpkV0Q3Qy9GemNtVS9GY01SeWZMR01yYzFxOXhx?=
 =?utf-8?B?VisrcFd2cjYvZkZTQ2o1RVdJeTRIOXlLWGVXdldPM1dQcWowTVdOMW5ITi9m?=
 =?utf-8?B?QTdpUUlGeEp4emNITWp2bTgyMitjeXVJeTRkZzBLdFVMZkVJN0EzOENuSms5?=
 =?utf-8?B?NDkvMXdNUXdpZlhYQ0lOMjkwRVlyTWJzSUJTV1lTNWhkWXVWZXJKQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e650df-391a-4016-ba8f-08de8e492fdf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:43:32.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ/tRznSkUuc+hX+maiVxXufkipctPH3SQ/LWNjQHWaeGRZ+EYiJinOdkJu/ZKMPaocsr6DeXizYLE6B7muwrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_034419_510040_CF600E42 
X-CRM114-Status: GOOD (  13.88  )
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


On 3/27/2026 3:23 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Mar 26, 2026 at 05:26:43PM +0800, Jian Hu wrote:
>> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
>>
>> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.


Thanks for your review.


This series is based on the clk-next branch (version v7.0-rc1).


Here are the check results without --strict:


$ ./scripts/checkpatch.pl 
0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch
total: 0 errors, 0 warnings, 8 lines checked

0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl 
0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch
total: 0 errors, 0 warnings, 46 lines checked

0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl 
0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch
total: 0 errors, 0 warnings, 149 lines checked


Here are the check results with --strict (I had also checked them with 
this script before submitting these patches):


$ ./scripts/checkpatch.pl --strict 
0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch
total: 0 errors, 0 warnings, 0 checks, 8 lines checked

0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl --strict 
0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch
total: 0 errors, 0 warnings, 0 checks, 46 lines checked

0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl --strict 
0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch
total: 0 errors, 0 warnings, 0 checks, 149 lines checked

0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch has no 
obvious style problems and is ready for submission.


I have also run the script on the latest v7.0-rc5,  and no warnings are 
reported.


Could you tell me which version of the checkpatch script you are using?

If you are using a locally modified script, kindly let me know which 
warnings I need to fix.

>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Best regards,
> Krzysztof
>

