Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A5D711D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpln2QNkvWJ5sCp9o6bclgrPsXPl6nuXdWNtqGeUArg=; b=g6rwCZdXARxVL4vfGakuzMBeKS
	ni1JmmDcmQVEWEVfrtcAh16HgJqW6hyyDPdaHE/S6iqn8PudVht98GtmPdOuSikVu6TUyeIrKqlZa
	cnwq3ZB/U8ayCrLY1uL3p+C6nd5tLVfo6f5FA7vWTUJrDQlnuXXH01kPqqW22g05l87T1kXXctF79
	x5jp0teYvzCBia3xfc1avEQ7cOhvsPX0sXY3LcU3DP4PRV2chg4+oQqek+/8wyZPs2PXNqUTomfdQ
	RP4zUnDkm6VjFCyTYn5QuMhmZ6LvN9kYgU4j5rdN/ObRP56Qn04XUnS2fYzEWrcvVHoTIPK/rI2xz
	IqdYXvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQVi-00000009Vll-1gr7;
	Fri, 19 Dec 2025 02:46:30 +0000
Received: from mail-japaneastazon11022108.outbound.protection.outlook.com ([52.101.126.108] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQVe-00000009VlK-0kHd;
	Fri, 19 Dec 2025 02:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv4dCIn3bsPYCG9I3GobUJw9eQDKcaNflX7Inf8zen462Rclwf/3JMejVOZ2iebZqHhg0y4YlXgiVsCcRq6XQukeJvqbPB1U26bX0pyNLFtrR8m1kYmVuFNyGbvkrK06BtjGYHCvONuQwfwnnbM0yfm2Wlj5Dl5/7TQmcSY9WCSax9GV/gbzEksSOohnjJJUnns0CrSjcezmx37u3aPl5W7XxJoceZcmz5F0vYf3TnsF/iRh/9o6rtd0fW12KzAfmMdUGkkTxhGc2yF9JE5pNaHOdalQ+R7mXMoOBMXk07RdNVvkGOZssfFLldJeK/2uKHIBEwDOhmD+QuhWGbZkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpln2QNkvWJ5sCp9o6bclgrPsXPl6nuXdWNtqGeUArg=;
 b=cp0JweqAICJyx9gkg7P9IBflL0/2Yp80mmnsLVS/E1U8Dhy0s38ZmPi5jlx22jQQ8M0mkBnTqkxcsEVkhGV3DM/GrYKt927nPLscwvYXroYtQj9LntatvNoSvVJVAmvRJ6Mye1FIU0yBnSFtevdE4Z/71q6Oj8DlEeRCmfiZNfVAuEk0FQV7v/BMULVKJ4aSIWE3ulA4P0jQ3JgBE3Fj2RYjV+0F0XfrdY/0Yg8jQYD7mftFa+42r79lYKPt/Ia5NMsQ0N/NTBSsVePtoXHxy7cwv7Hjf1dJlnJZyAtgOHJUcocOLbboldqlyJlyI9BbAwNL5gkGckbodOeru80ruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpln2QNkvWJ5sCp9o6bclgrPsXPl6nuXdWNtqGeUArg=;
 b=sJsQpPziobd8DJ+9i+MN1DrQfk7dItzccKa2c6ElmZSVL+o4UfH+C961fPmeBJe1YUon5zCHz3t34BNVN5gqy45joXSLtVuAoGs3NI/toA5401u3meHC8fj/bkcIPQMULxOtXArWxoCHsvTdB096Hxm41507Ne9xubljp2I/JB6UH3PGRkhDZk5tEQulpDd1Aasy3/8U4q9Kc+w1GM4cTDU9MfyjePL6Gm2gefqYpqOfakZpPMvCunqQHO07e+LnPvXPwNYabfYeHN0EpGyXjsmJvZdi9EIelTX9hVvqtUN+Vi4CJXF4ZsXPF02UG2aFDJ0+PO6LW6NGcUt1oC0Q6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TYPPR03MB9419.apcprd03.prod.outlook.com (2603:1096:405:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 02:46:21 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 02:46:21 +0000
Message-ID: <7d6084d2-3c56-43b8-8337-0b696614e4fb@amlogic.com>
Date: Fri, 19 Dec 2025 10:46:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: Add S6 Reset Controller
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
 <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
 <CAFBinCA19ws1OmfZLh+OSmiEuvY4owOKyzFpaz5KO6E8HaKmmg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCA19ws1OmfZLh+OSmiEuvY4owOKyzFpaz5KO6E8HaKmmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TYPPR03MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 70afa902-b5ef-48db-ab51-08de3ea8caa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1ZBTUE3cWk4TkNJYlo1NWpFMGJuTjVEaXNQOTgxRTJ4TFRZSTUzbmw4V2ND?=
 =?utf-8?B?TU5hMk9DWWYzanNjUmNQejRMM2UyNGNGb2lGd0JWWmlPKzVxeUp0akNvRGI3?=
 =?utf-8?B?UDF1TmFlaTV6aWRHZjF2dGVXSzQwUnRnS0xlRjlxdmJtdGtrSnFHWXlraENB?=
 =?utf-8?B?bmFxditOTVE5SW9uU0FYNzMzTUs0M0xJbWNSTWNlV01acVA1dGhMdGhyQ0Nv?=
 =?utf-8?B?NTB6MUFObmdDTlV0K0I1T2xsbDFNQ2l2SjVvZVFZcFpwcVFycmNxbEgyYVVQ?=
 =?utf-8?B?U3ByRHlJVldkSXF3a1hLamc3a2xWd3R3MmtzUi95L0ZhamdiVHN3UHlvMTA0?=
 =?utf-8?B?QVB0aXZRWkJXalZ0S1YvZE1wQ0VscHFRTWpuczFKbG5UdkNENmYvcmFDOXQ4?=
 =?utf-8?B?ejZBd1VSWVQ0RkljdDlKdVhyZ29IUTFlR2lHZHNtOTRteFdPRjZqK1prYjRX?=
 =?utf-8?B?YktIWGNVTFVIUm1QUEN6ZUo1Q2FOejl0OEhFNzQ5VldJY2V1bW84aWpxakF6?=
 =?utf-8?B?NWoxMEFLMU50R09EY1FFaXdhdU14ZkFONTBldklBMUFIZFVFczNmdjhxY2lr?=
 =?utf-8?B?Y055dDZJTVNPVVNBMjVlNTdTa05GSUwxYit5ZzhmZHFZd01QYWthbkpTQnpl?=
 =?utf-8?B?RnJ5eUxaRmtCWEZPQkRKTzFvOVhQTW9VUFlpdk9ON0V0Nk9WbG1yb01VaXBh?=
 =?utf-8?B?cjlIMjBmdVB2TEFuMk1SSTRBdlZ6WG5oVHd4Q25sMDl0WjJLL0p4MFE0ZHYz?=
 =?utf-8?B?WTB4TjVrYlB5aVpzNCsrTE1yR2FuRStCU2p3Z0RSN3FzMlNtQzVDZHB6Y2Nm?=
 =?utf-8?B?MFZubm4vcUVCcGNldEFmWEpzaXlLOWJHb0daNlJJQ2g5SERJeXdGR2RSTUhm?=
 =?utf-8?B?MXhNNW9LdkZ6WWxSc2k0MWtvS0FJdVNzakFFOHMxWXN3bDV3cHRDTktMcUxI?=
 =?utf-8?B?ZTk3K1dTRHFEWXI2Qk5qRi9mTXZwd3EyMXB4dmljV0h4Nmc3UTBQb1VLNHFh?=
 =?utf-8?B?VmVCVThtZ09CcHRwVzlseFZocUhLZEJaYlFMMFBERmRZYWNPaStBc1k0Z3Ry?=
 =?utf-8?B?ZTVmZ2dqQ3h3MUhYcmRFbDlMQkd0OUtYeTRVUVVyWnE5RjREaklkOTJ4Q2Nv?=
 =?utf-8?B?NU4xVFR6RVlUbG5TSTVuUlJzTklqbW4xQWVBTVFVQjJDZGE3R0Y3TjNzelMz?=
 =?utf-8?B?MHFCSWIySURJbHJpaU1CanpyMnNoVW9yWFlaelVnTWFJSitFT1RWMlhoZzQy?=
 =?utf-8?B?ZGg3M0xhTVBjeGNrL0ZzMG1oQ3JUL2xBdmp2QzNKaGp0M2NsN3VLZlZ6ZlBY?=
 =?utf-8?B?V3VjQ013bTJ5SmNscjJ3R0dpdm5XTFZacWJ3ZFU1ZnYxRnlwWE94NXhRQmpO?=
 =?utf-8?B?MEUyUGFjWnB6dlRCZjFXcnplRXZkdGY5Yll2Q0xXR2QyWEh0eUdxcW5rZW9w?=
 =?utf-8?B?U044QzhtUlZFNFpvdTFXSC9LdmQ0YjNWL21HbHp2VmFablF2ak5YZUw5WllU?=
 =?utf-8?B?azBuaUNRZklzUElzQ2lRckdlRU9EaTZibWFvTHpjY1g5NktnZzRxUld1YjNX?=
 =?utf-8?B?NVR0dURlRXo0ZUQ1RFdjekhSTGZicWE1K2dSNFFyVGVQRThQY1lubzlycVdK?=
 =?utf-8?B?NmpmejQzNi9qSnZ3L3kvaUxrd3dGVmNPWmRtZldCNFIvZGU0bE1FVXpWb0dD?=
 =?utf-8?B?ckFlbXdXL0JFQ21hMUZxNktQTHFzVWhOWmt5Y0lNelVFSm40TVVJSkwva2Fy?=
 =?utf-8?B?b0V0YzJ4bm9tNUg0YzQxQXZnblVhT3NPd2ZLNFp1bHREM0xyT2VqeUt1YjQ3?=
 =?utf-8?B?aThTWi9mK252c1VzRk5Md3lnK2p4TnFpQms5aStKdG1TUE5uUkp1STNRWlAv?=
 =?utf-8?B?SVR0a1V1cWZaVlg1MVlTWFVZV2Y3OVNISDQrZnFKODVucnFVZk93RmRLbUFQ?=
 =?utf-8?Q?2eLp9pk0r+uyXThKfgc5nFkIxT29E4w7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xUaUtsNWVHTm84aUtaUmdmbm05YmlDSThzSHdURlkwaTJNL0tzT0lNQjdV?=
 =?utf-8?B?OElUcDZKMkwzU01VcTlRT2dzaGRLc1NKTnhVdG8zZ3E5bTQzSHVZVzY2ZG9H?=
 =?utf-8?B?U1ZMOEhzVit3RW5wUDlabW9sR1g3RUpaMDR5d3lHU3A3MVROaXZLbEJnOTh5?=
 =?utf-8?B?UXdGV29keGNicjJSNmVVK3JSVE5yY2QvbU15eTI3c0IxYUJqQ1Y3VHQrelUr?=
 =?utf-8?B?Z09xUXcva3V5WXY1RmlwdkpkOS9JOFJWalJxcnIyZExOMnVLZDBZaXJvNE9N?=
 =?utf-8?B?RTA4TWMzWHIzL3BxdU4xZVdEUTA2anBrS1dQY1lHTnBGVzlmODhvQTNDQjB4?=
 =?utf-8?B?SlkxMko5Z2p0clIzRlh4ZWt3UGpVUkI0UVFWUzcvdlUzUGsvMkgxT082aSts?=
 =?utf-8?B?ekZFcCsrclo0UjBlZnVWcjlSbUNKbVVBQlByZzNQZFp0TlBaR2g1SmorbTVm?=
 =?utf-8?B?MnpQczhYdENudWlacEU3M0NWNVZnb2VuQ3pibDVIZHBhdlhKNHBqaEhCS2c0?=
 =?utf-8?B?QVEweDBseE9UbFdpcDczcFplRzJwTkQ5ZjJFYTNoYnRDOS8xaHFmYkFRQ3Z6?=
 =?utf-8?B?cW9iS0U4QTdkeFQvNzdLVTNkV3lCeXE4NElqbzdyMUNXL3h1SGEvQnhTYWhY?=
 =?utf-8?B?ejhGc0xYVkNIK1JndWx6MjVHazNseVZYaVJoMU9TUnBacHpjaDhMb2dQVDFv?=
 =?utf-8?B?ZGIrVlFMbTh1TTl0cXcrS0tVOEprTCtFVjRLZHRSY0dkT2NHbVRKSDZ4VHpq?=
 =?utf-8?B?NndvQVk2dDBjY1hJZFp1UzY5cXZvbitDOENSdlZHOXhWYk5BaFN1aE5EenZC?=
 =?utf-8?B?a0FFdGNCWkxtdURjT01rOXpOUFZuWHFDSDBxRFA0QXQ2Y2tEY1hmU3NYaWN5?=
 =?utf-8?B?b1FtMjZRZUxhU0JLYXB1c0V0MEhuZjU0akhJcHduaWhqZ2FnUnMyYlpGUXZ6?=
 =?utf-8?B?RUJKaVFkYkw4di9ZWjQ0Y0hHRVBHd0lWYk01Q2ZjbDFhRTM4NmNqZVBqcjZ1?=
 =?utf-8?B?NG9RZ25Ed1VVSU5TdVZheVJSa3hCTjRqWTFwV1ZrQWdBOVlBMG5BL21VaTlR?=
 =?utf-8?B?L1pUK0ZTZEJhdDRmMHFzZ3BVcVppTEdSU2E4dzk2cFV2NlBjQ3dNV2NJemxI?=
 =?utf-8?B?Yms2SFIzRlNxNXZ3aUl1OElQbVpjK2ZzZ3hLM0krNmFmTmt4TExMMk9mNUZs?=
 =?utf-8?B?RERST0ZuODRUQ2U4VUVNRHl0TXFUbmEvQmtneDFwZEhBQW90WHZZeU9JdEQ4?=
 =?utf-8?B?L0loOFY4UVMvRWxvMnJoVCthT0tOdzJmTWZGM3M2SkpOd1AvNUtCbG1GRkNN?=
 =?utf-8?B?TmdGVzR4Y21vdU9ENGMxUTBmcEdGdzJkSGtzN0l0S3NNc2NuWTdLUi8yemFi?=
 =?utf-8?B?RGs3d3Z4UkJSanB1Q3drL0VXVTR4cXhhSTJQSEdsWWRuWW1tZE10SmtROUtj?=
 =?utf-8?B?K0lTUU5WTElDc1BESURjTjBya05IcUZEaWhub1B4U0MyQi92cGpLK2d6Z2hM?=
 =?utf-8?B?L2VudGhJQnRPcEpoSGxQY1d4MFNjL0cwblpPcFlRa3Q5UGVzYlpERmlObGt1?=
 =?utf-8?B?RDhBR3FLbHVyYXVvR3QzTnc4S1M1VGpJVW5DaXNCTjBYM2pjd3BLWXNuR3Fa?=
 =?utf-8?B?SytHeFpKYVlaai9SY3MvY3B4VE15b05JZlJDdWtjM1lRZ2h5MUlKMm9PaW5W?=
 =?utf-8?B?UE8vbTB5OFd4RUowbExWd3pJUXQyMmdndlJ0UzBKQWo4OWFKSXhiUFZEaGdw?=
 =?utf-8?B?S1AxdWdKSTV0R0RBcDNFVkZsQkRucDBvSlJnc2M3OUI1dk9SYTltY3oyOXFK?=
 =?utf-8?B?K3h4c0htbmNib3NIQk80NDNwb016TUVGU1RWVG9IaStsYmdKM1E2anRveG5z?=
 =?utf-8?B?UGpjL2RsM1EvU3JiRFE3R01TNldCYUE2b3E2VThScitlUjdTbmd3SnZJN214?=
 =?utf-8?B?MDBKK2trV0lHM0x1UTRZTXc5UlhtZDU5TWtDMnF2WWNrMHFYTy8yMnpQcVJB?=
 =?utf-8?B?ME5wdzRvTTBxZ3hnbXJ3SkJGSUhmTTh4OUJ4bUw0WU45NW96cFpqREhDYk1z?=
 =?utf-8?B?dU1VVk5NSlduNkpvZFU1RHNsaFRvMUxTakhHV3NCK2FEV3F3WjlpYnZKRGpi?=
 =?utf-8?B?MGlnV0pLdG1DYldReHBpcWZsZmZFY1NWbGJTOEw4NzJZcWF4YVprQllBVzN0?=
 =?utf-8?B?Z2VQVS9BZ0dmRFhidXcwblkxaHlKV2FjUmh5aFVjK2xQZkRjN1I1bzMvSzI1?=
 =?utf-8?B?cjY3UXdGSjZmYVJUai8zdExNUXBzOG5uQlhaRnVSMjZmVHhmSkNjTWU1VGI5?=
 =?utf-8?B?Zkl5Vm8zckNQYldSdnBkaUNXVEFCeTN4aVJZL1JxNWJLUm1SL21vdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70afa902-b5ef-48db-ab51-08de3ea8caa6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 02:46:21.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lePp7u71yXUljzIyJDo26hk9bS4YKrjdMtG2b0bAQogxDqJGHNbXn6kSP36Z9bTvPF8tRXQSDuPAJdPdXRdqsND07OvILyZZR8Vx3ETuGwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_184626_224856_49481668 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

Hi Martin,
    Thanks for your reply.

On 2025/12/17 23:51, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Nov 27, 2025 at 8:30 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> [...]
>> +#define RESET_BRG_MAIL_DMC_PIPEL       167
> On the S7 SoC this reset line is called RESET_BRG_MALI_PIPL0:
> - is MAIL <> MALI a typo (seems like it should be MALI)?
Yes. I will fix it.
> - and is PIPEL <> PIPL also a typo (I don't know which one is "correct")?
PIPEL is PIPE , I will fix it.



