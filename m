Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQTRuq4ADeD4EATf7KLsrBIR/Ak/YO0f0K4dY6xJ+Zg=; b=PZuVlk8qukn7votj2y8tDgz6SU
	Lz2awW69s7+ONYfiIkBfSgPsdp5hgPYi6R2eux1FGo/BAq3X5WXuAO/5lJ9ndMqfFI3anS18GJRRO
	R5elBp7QRfV21Sz3ajMns2IZ7ndXw34WjN0qoXavGrbEBaQUrPvMOV8v+kX+oGuUF+QbSVsbhon4f
	S9iXUBWPQInNRdguVG9mlpS34at5IHYlLy4kuH1Qq5r77TsqrT4R7hBbWvQmO9SorgW445T0owaRy
	s98DBVslXaNMCPhOM4WYl/+EZdWiY5qEGk01peMxBk/hKyxi21bhXjFRRE/INArhmulTNyz+Q/Mdf
	SR8tma3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ0C-00000009r5s-1rHy;
	Mon, 13 Jul 2026 15:55:28 +0000
Received: from mail-southcentralusazolkn190130000.outbound.protection.outlook.com ([2a01:111:f403:d10e::] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ06-00000009r2l-3VGM;
	Mon, 13 Jul 2026 15:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSJ80cn2ICs1MnmBIyXLJTOEXfGfTAhLw1UHUB49avbQ1G+2dy+As6JZ4o6n5DSQOho5CSnAEi78iNi9eDJHK/3usmmnNUbPJwbOWpiwtcPbNMVt3haZoSf9HoXF+yJVg5w+8FzG213jxzJwxXTXeDftOb43VUYS/aCx3N5ipggGyh/lRM/RXITCom06zX74dBUg1kVczXmO3MQ9mazPhM0j/ecLZBRDAcZBgaMHBGiUVNzfriXOH0eIZdPfxQE8kZqVxp3NrGme1uZniLnr0+WJD4ILYF00M4SejgF0JG896rgB8IOYIeHYDzAqejjP+Z2Gdraa7UXLNrr1FhvOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQTRuq4ADeD4EATf7KLsrBIR/Ak/YO0f0K4dY6xJ+Zg=;
 b=DJFEMDq3rtHDQBWZzOW9LNRCQKKE1IqzY9VvjXXjkkQiDb7/Pf9ZewFl7fdoTGR21A0H0qMShYX0a0nc3QS4563r9kOcaXDH0XDuh/G22d6Aueb9rAyIgfm2czf1bSvKeRd/y7UrsAkVZLCjzZjMmV/HjYjDCXF6LKE4TjhHGQaSkrgjMy8ycErn4kQNJSgXpCUEZXnTcTMq8E1sOlngZwuF8Er0S656R+R0hrHpCMFI0ab3vNi1ExjeCs/FiXkOoPmuK1nI1Ra3vTFA+AZaNxSZprulGwL4w4dZ2b66LxAq/LPyKRYwicfMapJKUA1T3gM6TIcSq3zs/ujS/fjHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQTRuq4ADeD4EATf7KLsrBIR/Ak/YO0f0K4dY6xJ+Zg=;
 b=n41SLhQd3uZ6AV/KEJMhrN+rCJ4uCoBM1Vu0tyQ8sGacnTNUQVng+usCe75ddEHjJRfZgfaEFmuamUYpHB73dVO18XggoKBchQPZD9F7t0BjcO0QSM/K0p6mVJF/UwsY0mlPRWmc4DZmjQG/hTetJRMuEpx4z26jq92v8tBaAAr8iwib8vw5aclsVURcMXfhiklvrpPQ4YCXUxJACh9OJicdsIWYmfBbTvllVjJD3TE9lPW3+2REeHg4TaNnkQgkDd2O3/L+Gf1tPZ6bhQ/UXt8pUsEdMonNRkVPrkeSiUcHUioT7mBnnN2OHM01Mho8OSgk63uyXtPlbaO0gVIH1g==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by DSVPR19MB997311.namprd19.prod.outlook.com
 (2603:10b6:8:38b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Mon, 13 Jul
 2026 15:55:14 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:55:14 +0000
Date: Mon, 13 Jul 2026 10:55:11 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: fix Li-Po overcharge on
 Powkiddy RGB10 Max 3 / X55
Message-ID: <PH0PR19MB997338EC336BDD4A0B14F968F7A5FA2@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <CA+c=wxVGQM9HvjB6OR=+yznr5mW5+7SY8i=37y8y9qEkf6c=rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+c=wxVGQM9HvjB6OR=+yznr5mW5+7SY8i=37y8y9qEkf6c=rA@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:806:24::14) To PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <alUKX0Pi2telrtH6@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|DSVPR19MB997311:EE_
X-MS-Office365-Filtering-Correlation-Id: 30deaf5d-d209-41ce-6eb2-08dee0f72055
X-MS-Exchange-SLBlob-MailProps: laRBL560oLSPhlJ95/U7v6W/AahuugGadQ9OLAeQmj0mvrngWDcpldt2IMUW2HMZpbu/eLoc/VGSwPED2L9wV46Sc2S2Id9RvVZCNgoOKfst6mDBSZd3HYyj4qcWS0t0uO22rRe0TL3TwvBtXIUqaLzI51lQM0+j1J5/xzMsUEO8ooVieHV0BxmZI+/1y6BGEgpXzwTdH++93poGyUWdCJk8rzew5iHHVcchxjrbo5DgWQvpoy1fvJURaU9+LLIeAX0AjXMXSNNRhrnFvvYrtXfeOTQ1RhCe9cpMKw4uD3YF+hbH7drW6aKr/+KalnNGKNnM4+jp+7klrQ1yQW3qPGyEoG6ySLPF039as9gcwU9+5HdipJ5EgKYExpLo+VvSdQ503LqFmMUOkGXwY9dU30axq6zmMuI0i85aqmA2xK6CeY8eyWUJE/RMVq+npbL/V/TH9GkiSGYd1SNrAK2pG2xCIVeCyVbD+U+aphA2dDGLexuIMaAiWO3xSZuFk1VGzUIqRX0D1yVFpo09Az0KbFc+fG1rc4UXfpY7wpAEdTSM/ovc5CpnNmjVH87dkNlF5gbjzLnOCn/nzjbmbjTv4mbbfGdOfjm6G0YIgjeF7RPmvwZCW3cUtvXCh/rzfxQeJo8BKg1UCZvGrrIwGB3OClmlFTkLiBKEJsQNByz7uGfFDqp3VDvOlDlkGQnJt5ixxSrx7aTO77ZjkYAe6WRTCIXj+OBWH1xpo8esuCPxV7WIC0ur5PaGSg3D+DjqWBkAyQL1w31zW50J6659bGf2ySwuIT5A9EVV
X-Microsoft-Antispam: BCL:0;ARA:14566002|4140399003|24021099003|55001999006|25010399006|37011999003|23021999003|5072599009|25031999004|8060799015|10092599007|15080799012|19110799012|22141099003|6090799003|39105399006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MERMK2tzVSs5S0lTSHBmRWRVdjJxN2pHQ05kRlR4QS9KamZDTXVrRWVseFVW?=
 =?utf-8?B?bU1qWlRrZVYvZVFQdEFwa0p6bGMyYkNyRjg5VHZxS2dDNzZIM0s4K1o3NGNr?=
 =?utf-8?B?dTNIMUVoYmpPMzZFRlNTejRaakU3ZHJCNHhLUVJYelJJMVYxNUQ5YjY5NlRy?=
 =?utf-8?B?bDJxWU1lUm5iOEN2TlFscGQrSHVveHV5V2RQOFVySkpZRlZQSE1Ha21nT1hx?=
 =?utf-8?B?YVQ3WGVYUDY5Z3JSUGIwaGJTV2ZwVVNjeVZWdEl5R3pONVJ0eWtrU3EwcnYw?=
 =?utf-8?B?NG5tRm1xZXVMdVpkTGtwb3dOT1lPLzhxZ1pZdFVWYzRMWnRHMnpZcHNXb1U4?=
 =?utf-8?B?L1FZSFcva0tiZWg0VUxoVjhLRXdLMmlqdzJhOVVadXNjNmJFWVdkblNQRkdS?=
 =?utf-8?B?NjR0Y0hPTkh6cEZCK0F3NWFiekIrbVFPVlZzZ2lJS2xKeVdNSUNUMSt3dEMw?=
 =?utf-8?B?anZHWDBnQWwrakIwbVJIdGlhTXpJMFBqNlhKZ0pSKzVvSFppaktBeGF1UG1H?=
 =?utf-8?B?WUFDVUxic2hhVWgwRHltdlM5ZW5NbSs4aE1ZZUtEWVAzbUJOMk1kREVRMzJD?=
 =?utf-8?B?SVJ6N3hMWkwwRy9DN25jVzYrMmRUNHc1OTBVNC9jbm5RZ25XUWRYOEJOb1dH?=
 =?utf-8?B?MkVIbGorZllFNXZYaHE1elFVRmhsNHJTaW80dDZsNHZFM2oxWXVqQ0JXOUwy?=
 =?utf-8?B?N041cGdSZHZ0RFEyVnlWMDk0U0FpWS9kaUNsVURnaC9UN0JHUDlJK2hsNDNR?=
 =?utf-8?B?NnhEL2RwVnNrN0dNUDhJWjRhYXJBWlhqMmozSDFidzhwbnNDdmFJSnFjcEd1?=
 =?utf-8?B?ajhSUWJSWVFSdE5sN2dOVjBTUnBtaStIbWNNWW9lMWdOSWtibmEwSlR2MU1W?=
 =?utf-8?B?VURpNjdYbmVUb0xOQ0JCUUxOVWJIR25RQ0FBeHdqb2YwYURhUVQ1NzJXbno3?=
 =?utf-8?B?Nk1VNWxBK3NXdzA0UEdOekpUeXhhOEVlWS94ZFhKek9vYnZLb09qQTdMTnlF?=
 =?utf-8?B?dTgxMCt1Z2QvSCtBSHUzNXhEODdCaUJveEEzZStoWVRES25ZTnIybTQveUtO?=
 =?utf-8?B?U05hYThuVVl2Yk9MbEsyNEdrbVBBNTBxVzVBeWxIOWRqOTE5Kzk2MWpsdDg5?=
 =?utf-8?B?ODdFVG5IOUJid3Q0c0I2RHZya0VodUxXMDR3dGU4bzM0Z1pxVXpXd3lZQXIr?=
 =?utf-8?B?UThkSEpMOGpMYlMwVG1SZjREUk1OZ1NIem1IWXZaeStxdjQ1VHNHWGxyelFS?=
 =?utf-8?B?MFJ2US9USEJtU0tiUXpLK0JEbmJaOWxOZjU2NkdDTGVwa1Q4ZXEwLzltbW1G?=
 =?utf-8?B?c0hzSW1GM0dobE5tOWdNVkg5NGFMWnUrYU1NMThxa1NZVkZyUlRseWMxOWg5?=
 =?utf-8?B?T084eXRkTEY1bVJhSWpsbnhzRGx3YWJzTnJlOWFwTDJFc0k5ZXBPbDZPRWVY?=
 =?utf-8?B?b0RYeTVWbUUwQXZNK1FvcmtJNDE5OUdrVDEyODJrTk5Cc0dJZ0E5UUE4NnNT?=
 =?utf-8?Q?nn5wytnpXFUpvfPv3FpSfhd3Hop?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3FjUW1Fb0VMTkVEdVNmdDhiSElLSXlkY1B5NGFjUUszOWQ1Tkl2T2MvYjRn?=
 =?utf-8?B?TmdpbzNpamUweWFaTDRycnd0UDYrMnlTazVwcXdRS1dKNi94UFo2THNoa3U4?=
 =?utf-8?B?K3Z2YW5MT1BtRHFFamlsdXZhNWJLeFNyelNxOGZaVU1HR0xEOG5wdkM0ZjM0?=
 =?utf-8?B?b3ZkUTh1TlZxZEh3L2h5d3phU2dBZ0ZFNmZNWlVSYm5NM21kcjh3bE9aKzdn?=
 =?utf-8?B?elhuWmtMSGNscFVlRSt3bjMzNjFPUVFHZUsrdmRyUk5WVzhmbnN3anMxcCtz?=
 =?utf-8?B?SUx2SFd4SnBYSUM4VDFpYnVVZFQ0ck91cGpGQnJTR3lxeUtSZEt1eHc1Zzhj?=
 =?utf-8?B?UjBqZXowUTFodE9HR0hLamVpZCtpM01nOWo5OWNaVUZ3K0ppREREVTQzUWdk?=
 =?utf-8?B?cW5rUU5Hd3NkZWpUSjFSUE9OTzMvcUx4ZVl0SDhxTmh4Wmp4MTJyQWl1MHNG?=
 =?utf-8?B?eDBja2hSbWdxWlRJdnBvMEtXWmZBd28xYzJIYWlKUWpMWnFPRW5mU0ZibDh0?=
 =?utf-8?B?NTBtLzJSakIyak0wQm1xT2huZnFnUGtrUFg2Qk9pd2VZQ2VrTkJpME0rNldL?=
 =?utf-8?B?a3FnZUM2Qk9la1Zuc3VFV21NWjNmS2ZhZUt6YitocFU4aXJhZ1JrdlJEUUhE?=
 =?utf-8?B?N2RmYURGYVpQWnp1bG83VmdrUTJCbUx6ajA5RzRwTEtnMWZDZEVHd2NtVUMx?=
 =?utf-8?B?TVF6RWRGQmhkMmZYcjJGN2dhWkpKVE1Hb0tPZ2djdFdERitoWE5YN0Q3OHBP?=
 =?utf-8?B?NnZWdkp3TUdFaEF1UDRRWXNid1RBL0VyTG10WmZJM2RJNjR5N1RGNDhaN05P?=
 =?utf-8?B?K2lJc1RESnhENEhwWi84QWN2NHF5WlRDL3I1V25ocGlTM3JHY2tCd1lIMEEy?=
 =?utf-8?B?Y0x2aTl0ak1YakVVbFVDR0VEUDFUNUo4MW5WbldiMHFVd0NCNDNNTmJ6d1RO?=
 =?utf-8?B?Q1Rka3dOcDFFWEV3RXZ1N01ESFVlYjNOb21GQWJwWEI2UVdjMFplWHNsZTdJ?=
 =?utf-8?B?bHNYUTNrci93V01JMWlSMkhpUjNpd1ovaE1qWmdjMjRTUGl0MEJaTkJmWk1G?=
 =?utf-8?B?aC90d2E3WHpYQTZkVENTL0RMb0FEcUZaK0RjYUpVaGVHMlQyUFhGb25jMUdv?=
 =?utf-8?B?UUJ3OVpHSlE0dmlIcWNMYVFOc1ZUcTJwWitEWHFmZjVWc0lsaWZwREFOZHJR?=
 =?utf-8?B?bWlzWklnRC9BUlU1em9taGFIZ2VRaGlSYWovTEVEMDh0d0pLSHgvdndmdEtx?=
 =?utf-8?B?QlNJcVFJZmIrdU1Cb3J0dTVaWHMrTUNyREo0dllKM2hFUnJRYXVGTkU5cE1n?=
 =?utf-8?B?K1VBL2FPR2ZSK094RERoU0h2UDRvZlQ2VWc0TjFRTHVzanNsY1RuNFF0TXlQ?=
 =?utf-8?B?MytNeVZIalgvdE94T0U4REpuUG56ZXVwNExhNFR6TGdCNy83WktDVVJaRUpu?=
 =?utf-8?B?RU9hcFlqbWhiRzR4dkMxaWRxMWpCSW1OYzgrWkV2ZjllelZXeVRYSEtld2k5?=
 =?utf-8?B?b3RrOUhDbHlRNGhJSFV3clRMZmpNL21yTXMxeGJSSFgwZkIxeGpoM1h3OVF6?=
 =?utf-8?B?ZThnWEczMHhjRHNvNFc1bkFHblRuVExxeXhMTzJrZUs2TVRxNld5MGdSOEhG?=
 =?utf-8?B?b2x6bk1EM2xkSzJIRldSaHFGenNFRXRYVXAvV1Jkb2FTSUV4YnpPakdnRFAv?=
 =?utf-8?B?Z1k2U0g3aEtCaERWYUVEeWJCTldrYjduUDNjZTJnZndFdUlqY1NVOHU2ZE5H?=
 =?utf-8?B?RmpFS1AzeEFDa1g0L1A2NHlsdEFpcWxpQWFGUERFZ0JLZnludnNrRWdmYXhh?=
 =?utf-8?B?bmUzUDh4SDl5K1hjWm9CMUNhcEgxSGY4Z2k1ZmNCSWVBbFBFaXh1amtJWHpC?=
 =?utf-8?B?dUdYd2dkUjZvUHc4ZGxNaUE1TjFvSTI3Q3I3NUZJL1lpZnV4WWhDK0JOWHNB?=
 =?utf-8?Q?iatZs+u7+86dxM9rO6s6I+lGsaB93H8j?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 30deaf5d-d209-41ce-6eb2-08dee0f72055
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:55:13.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB997311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_085522_926739_FA0A28C0 
X-CRM114-Status: GOOD (  38.74  )
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

On Mon, Jun 29, 2026 at 12:20:49PM +0200, Juan Manuel wrote:
> Hi Chris, Heiko,
> 
> While bringing up a couple of Powkiddy RK3566 handhelds I ran into a
> battery problem that turns out to be in the device trees, and it has
> already cost me two packs, so I'd like to get it fixed for everyone.
> 
> Both battery nodes charge the cell above its own declared full voltage:
> 
> rk3566-powkiddy-rk2023.dtsi (inherited by the RGB10 Max 3):
> constant-charge-voltage-max-microvolt = 4250000 (4.25 V),
> but voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
> are both 4172000 (4.172 V).
> 
> rk3566-powkiddy-x55.dts:
> constant-charge-voltage-max-microvolt = 4300000 (4.30 V),
> but voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
> are both 4138000 (4.138 V).
> 
> So the charger drives each cell ~80–160 mV past its own OCV-100% point on
> every cycle. On a standard 4.2 V Li-Po that is an overcharge: it raises the
> cell's internal resistance and kills the pack early. The symptom is
> textbook — the pack reads a normal voltage/SoC while on the charger but
> collapses under load and shuts the device off the moment it's unplugged. I
> lost two packs to this before tracing it to the DT; capping the charge
> voltage at 4.2 V (verified at the rk817 CHRG_OUT register) stopped the
> damage, and a third, already-degraded pack stabilised.
> 
> Patch 1 also corrects the RGB10 Max 3 design capacity: it ships a 4000 mAh
> cell but inherits the 3151 mAh value from rk2023.dtsi. I did this as a
> per-board override so I don't touch the shared profile, which may well be
> correct for the RGB30 and other rk2023 users.
> 
> One thing worth a look on your side: the shared rk3566-powkiddy-rk2023.dtsi
> default itself (4.25 V against a 4.172 V OCV-100% point) looks like it
> would overcharge any device using it, not just the RGB10 Max 3 — but I only
> have the two units above to test on, so I've kept the fix scoped to what I
> can verify.
> 
> Thanks a lot for all the handheld DT work; none of these devices would run
> mainline without it.
> 
> Juan Manuel Lopez Carrillo

> From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> Date: Sun, 29 Jun 2026 12:00:00 +0200
> Subject: [PATCH 1/2] arm64: dts: rockchip: powkiddy-rgb10max3: fix battery
>  profile
> 
> The Powkiddy RGB10 Max 3 ships with a 4000 mAh pack, but it inherits its
> battery node from rk3566-powkiddy-rk2023.dtsi, which describes a 3151 mAh
> cell and, more importantly, sets constant-charge-voltage-max-microvolt to
> 4250000 (4.25 V).
> 
> That charge voltage is above this pack's declared full voltage: the
> inherited voltage-max-design-microvolt and the ocv-capacity-table-0 100%
> point are both 4172000 (4.172 V). The charger therefore drives the cell
> ~78 mV past its own declared "full" on every cycle.
> 
> For a standard 4.2 V Li-Po this is an overcharge. It raises the cell's
> internal resistance and kills the pack prematurely. The failure mode seen
> in the field is characteristic: the pack reads a plausible voltage/SoC
> while on the charger but collapses under load (and shuts the device off)
> as soon as it is unplugged. Two packs were lost this way before the cause
> was traced to the DT.
> 
> Override the node for this board with the correct 4000 mAh design capacity
> and a safe 4.2 V charge ceiling, at/below the cell design max and the
> OCV-100% point. The charge current limit (2 A = 0.5C) and the OCV curve
> are left unchanged.
> 
> Signed-off-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
> @@ -12,6 +12,11 @@
>  	compatible = "powkiddy,rgb10max3", "rockchip,rk3566";
>  };
> 
> +&battery {
> +	charge-full-design-microamp-hours = <4000000>;
> +	constant-charge-voltage-max-microvolt = <4200000>;
> +};
> +
>  &bluetooth {
>  	compatible = "realtek,rtl8723ds-bt";
>  };
> --
> 2.43.0

> From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> Date: Sun, 29 Jun 2026 12:05:00 +0200
> Subject: [PATCH 2/2] arm64: dts: rockchip: powkiddy-x55: cap battery charge
>  voltage at 4.2V
> 
> The x55 battery node sets constant-charge-voltage-max-microvolt to
> 4300000 (4.30 V), but the same node declares voltage-max-design-microvolt
> and an ocv-capacity-table-0 100% point of 4138000 (4.138 V). The charger
> therefore drives the pack ~162 mV above its own declared full voltage on
> every cycle.
> 
> This overcharges the standard 4.2 V Li-Po, raising its internal resistance
> and killing it early - it reads fine on the charger but collapses under
> load once unplugged. Cap the charge voltage at the standard, safe 4.2 V.
> Design capacity (4000 mAh) and charge current (2 A) are already correct.
> 
> Signed-off-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
> @@ -77,7 +77,7 @@
>  		charge-full-design-microamp-hours = <4000000>;
>  		charge-term-current-microamp = <300000>;
>  		constant-charge-current-max-microamp = <2000000>;
> -		constant-charge-voltage-max-microvolt = <4300000>;
> +		constant-charge-voltage-max-microvolt = <4200000>;
>  		factory-internal-resistance-micro-ohms = <91000>;
>  		voltage-max-design-microvolt = <4138000>;
>  		voltage-min-design-microvolt = <3400000>;
> --
> 2.43.0

While I cannot confirm definitively that the x55 has a 4.2v max charge
voltage, based on your symptoms it's likely that the factory BSP
was wrong and it should be 4.2v not 4.3v.

The battery itself does not appear to have many helpful markings on it,
I see "-YN 606090 4000mAH/+3.7V 2308 14.8wH" written on it. A quick
DDG/Google doesn't turn anything up, but batteries just like it have a
max charge of 4.2v.

It might just be safest for the moment to set all the Powkiddy's to
4.2v max charge voltage until we can confirm with a datasheet it is
otherwise.

Please submit these as a "bug" so we can backport the fix.

Thank you, and good catch on finding this,
Chris

