Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF4CCDE01A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj1M16iGUZrj2YD74PPip2mkXjyrq5giQF1465pvfVs=; b=KgVxsWxH94Tjca9sr/FP4f3RD0
	oy2n763fy4DOQix6aGnBatuiNSP5SIySGJ1KNoZtscLJHRP1TFuonHWKh6zbgTFI5ZNKaHXPFmJDN
	JY7+5R680vsSa3BcPimw+zBoXngiA3uzAirow+1V/z1/XhE+sTsbNcP7jgRxVrIAL7KvVcpvP3WfI
	95987sgIYjPge+vvm+10Ci1ErYYOm4/jQdd42ZblekKGfCcBenaimUlJjOg8fmV25Zq+HBc7ndR+W
	dNE2fBRewS0rc3u7bnjU+NJWsquOEGtRkwBeStCIZ1WwKDx7t9UEw5l862BquCKGUjzerE0kTRoOK
	IdXDw/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo0d-0000000BjRl-2BF6;
	Fri, 14 Nov 2025 07:14:15 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo0a-0000000BjRI-40xf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Juxv63IwwWe4cRlV8bcNGqIGZ+YKpiN/UXtEBr7lde79WO3AXaAzUWTDu4TmrodvdrpSTU42yTrCCf1KZ9QKSJ599xedpdUuij9bjEc+qcbiWOFik1FvXkjq4DbU6EYXiL1sq6hSQzeKR1erUBqlJYxnY8jwD6YfXZdKNaNF9hsJJ7VxLs4djFMonz7s5Trqh/QldvINUAjHq839smhyQon3CX/JI8jZinADE3pFmi21CAdqUtcUSr0pio9VepA+0p7QGFGe1Sw/QpqdPMmsXZ3+FAQzYsmIcl4y2y/TVe5nzGBVmvAfiiTJJMh9gKU7kALqh3DkZK8bWGmzsuTweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj1M16iGUZrj2YD74PPip2mkXjyrq5giQF1465pvfVs=;
 b=JtFkMSV16eSllEb8tTHgKui9qdCVX+qn4n/TjLQvTj8pDvuoAyvnbHolgy4gGhn6FlsSYBYYl8x6UfuLe8xTe6zTK7uivfy36d1R0HqErYiikA5JdqbYDxcA3k/Ig9opwam5k3/GjSAeMIdqQfO+70dKTQV64JVsaO+NJzd70BBaO2mwhPjWjyOlvHXDyOsQ/0na0dDGrhZf3NrWL/bLTiL1VtUWoB7WdWCJHbUnCue8VZvMWQMVxHWVf98EDSVxOScNjz8PToGfsogTjCxwBWisoAzXNZ5CaA2U8iJf/1MR7bt7cCGQg0LjMeeW2lAg6sM9warTaI700wBDLbB3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj1M16iGUZrj2YD74PPip2mkXjyrq5giQF1465pvfVs=;
 b=eknznot+OsnWoRsFF2f9IHYqohU3uRUVtOPi0/ydh6EdDoEPgnjD7EC5+Z34HEwzlX00GX06L0yL8Rqll4ntzjIxL134qa0Z6PAgnmMvgcCy+wE+LjK0FBUSB+nrMTiFrDgxi82iIyNwRplDHTDaBUE7KNbnSuryz+htYT2RyOxFhD1YghYkLwHwzgS5kMmVV8bkmFsbGIgpGSPGV9r67gJAmZ1kZnzluTGNQtb++QK+8UaGBxMwQ2n4U0AQPgah+TNH3bBa3JwtrhsE2fUolu6r5XfT0Dlvat7hT6Q+J/1VaK6Fd8+B/8jeHenGz9YwUDNVXEuBsc0/4L6eZASQFg==
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OSRPR01MB12002.jpnprd01.prod.outlook.com (2603:1096:604:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 07:14:06 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 07:14:06 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Ben Horgan' <ben.horgan@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>
CC: "amitsinght@marvell.com" <amitsinght@marvell.com>,
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dakr@kernel.org"
	<dakr@kernel.org>, "dave.martin@arm.com" <dave.martin@arm.com>,
	"david@redhat.com" <david@redhat.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "guohanjun@huawei.com" <guohanjun@huawei.com>,
	"jeremy.linton@arm.com" <jeremy.linton@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
	"kobak@nvidia.com" <kobak@nvidia.com>, "lcherian@marvell.com"
	<lcherian@marvell.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peternewman@google.com" <peternewman@google.com>,
	"quic_jiles@quicinc.com" <quic_jiles@quicinc.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"rohit.mathew@arm.com" <rohit.mathew@arm.com>, "scott@os.amperecomputing.com"
	<scott@os.amperecomputing.com>, "sdonthineni@nvidia.com"
	<sdonthineni@nvidia.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"will@kernel.org" <will@kernel.org>, "xhao@linux.alibaba.com"
	<xhao@linux.alibaba.com>
Subject: RE: [PATCH 25/33] arm_mpam: Add helpers to allocate monitors
Thread-Topic: [PATCH 25/33] arm_mpam: Add helpers to allocate monitors
Thread-Index: AQHcT+NQhz08mgRcGUqg/ZbndVwoXbTxzIsQ
Date: Fri, 14 Nov 2025 07:14:06 +0000
Message-ID: <OSZPR01MB87987CFA10963E279F2F7C968BCAA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-26-ben.horgan@arm.com>
In-Reply-To: <20251107123450.664001-26-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=522d86e9-f471-4070-b268-a1d5801b59aa;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-11-14T07:13:22Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OSRPR01MB12002:EE_
x-ms-office365-filtering-correlation-id: aee22f0c-342b-414c-9279-08de234d6625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|1580799027|38070700021;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?SHEzYzBscjM2NENIdm5RK0V6VkFLTS9ZVTNCakl1L0ZqZS9VOGhkeDJC?=
 =?iso-2022-jp?B?eHJKak5GMTdnS3hQS2VSWjNmSk42L29keXhvMWRNWEhCZWxFdUtKRWxJ?=
 =?iso-2022-jp?B?Uy83RVYxbFhHWkg3SnA4Q1ZLMTNPbDFwaXdrdS84ckZ6YnBRNjJkZXRl?=
 =?iso-2022-jp?B?NGNCNXgvWXRMamYrc2hHS0dWS3hseUlDTmZyRkM2VVM5MjZSTXhhWkZ4?=
 =?iso-2022-jp?B?WGtNU0VXM201WFVXamZPcjJkMm1kWkRKb0hoWjRTT055cXdJeklLZTk1?=
 =?iso-2022-jp?B?UDg3Sk9nbDVuK0NDZzRIV05zR0JuSGxpRDhtRjRHd243YWRkUHA1TjhZ?=
 =?iso-2022-jp?B?bGcwc1hoeHY0Q0d1UFNPQlowU0F2VFNqRGQvTDhlV3pSSnF3cEFQUVBM?=
 =?iso-2022-jp?B?TW9SczNKME84bTJ3UWJ3aGxrNUZIN0NwTmYzSTYrWTZaeElFaFFYakZh?=
 =?iso-2022-jp?B?d3R6VXRmWUJrTytjdUo0TEZGWTZQRFB0S2x3MGlZZzJBUE5wUUJ0elNC?=
 =?iso-2022-jp?B?YTIzMXRVQk16elV1Z2JCWWo3cGJkT1BwaUgzSXBaRDVvdkYyRkh5UEJ3?=
 =?iso-2022-jp?B?aGhBQmFCUTBGNVdqWFJnWHRqTEQ1ckpKZy9SUVU2dmUvSnVlMkVHK3Ix?=
 =?iso-2022-jp?B?TkdYQitHa1pXVkE4ZDBzSE9VaVExMmhpUWVtci9oeHA4aWpTVHlvam5K?=
 =?iso-2022-jp?B?ODJKZnV5VERNS2hpaytUWnRjS2lCamJ1QVpYeEg3Q1hLTFhIZERlRkNo?=
 =?iso-2022-jp?B?UGRNbE4xVDlDS0tUZWwwZnN4MU51amtKN0NMMTh3YUx6SDhwTlJ0aTdZ?=
 =?iso-2022-jp?B?aFlpajJHZkZub1Qwc1VzQkhzVHptSTJQRXJta25jY1hFYkRhNTB6ZXRL?=
 =?iso-2022-jp?B?MDZvQlMrWWVqTkR3NG1aT2dHck0xVVphenZyRlJtaktWelFzL3NNUHpp?=
 =?iso-2022-jp?B?OUIwUXZaUUxCT2Q5WHRnTXpFMVEzTlp5cnVsakg2VXdXRUxiRGxJTGVL?=
 =?iso-2022-jp?B?bnF0ZktqZVBiYnJpN0x2Vk9WSytvVjdKL2N3ODBRdEFzRklJMlMxWXBr?=
 =?iso-2022-jp?B?SXhrTXNheVpEcU1IOVRxYkg4Nk1ZRWRDd0FHMmlqZzFDMWVhQitwdTJw?=
 =?iso-2022-jp?B?aGNtZGpWbTlkQzdhLy93Q1ZkYk9EZlR3aUxlSUp6TU1sWElVR0hCdVY3?=
 =?iso-2022-jp?B?RGxTR2ZweDg5SUxuRng2bmhOcjRnYVVmbkEwZkRkZVhreFBYTjE1VUV6?=
 =?iso-2022-jp?B?eG42V1AvRHFlL3Btck5saElscTZwNmVscTBCRnZCaFMzUS9jZDJHWDdl?=
 =?iso-2022-jp?B?REp4d3VSdElpa1E3aXBJS0piaXJlemN6QVVZZHVoNm1kQ1RuVTdCZXJC?=
 =?iso-2022-jp?B?Ymt6VmZURVVKaExEY1dmcEZQUlFHR3lMa3ZrcVR6cldodXE2ZXpKSHMr?=
 =?iso-2022-jp?B?WGFESVRqTjNKSERzS0w5TzF5YXpsTHBkd2lXN1hYOTBPQnFQV1VJbWQw?=
 =?iso-2022-jp?B?dkdDNjJWbHlPejdrWHo0L25odE8wdW93VVZFb0M5aUk5Sm1CMm13WnBu?=
 =?iso-2022-jp?B?NUhsUHJ1cHpCMXJWa09kTnJGVnA1a1dSdisxMWRlUE5uUnUvalRTdGRE?=
 =?iso-2022-jp?B?VlBoVEJYRTZzZ3A4dGRjUmdLdEZnSEFSVDB0NDVtMTRCYWc1VVo5V0dC?=
 =?iso-2022-jp?B?N3g5N09Yem1Uc1pudm5SK1hYR1RkaFd4NHZESDZzMW1QRkZvR2dOTW4w?=
 =?iso-2022-jp?B?ZWp3MWlYVWJHQzYrN2h4Wk5PcitHd3hXaWsxZUEyVTd2S2czbW9FUVVh?=
 =?iso-2022-jp?B?Wkw1S2VIQS9DVnhZWWpYTDNydTd1ZkpuSjNvb2NRYmdDTmdqSVM2UFpF?=
 =?iso-2022-jp?B?eU5nRTIybHRyM0pnZ1hjWW5MWTJNNE1CSDRKVTJLMEN0RS9mcDJJSWht?=
 =?iso-2022-jp?B?NkNWQnVSS0xQQ2tvKy9OeXhheDVKS0tNZEw3aC8wbnlIR3lUNkl2RkU0?=
 =?iso-2022-jp?B?L25aZnRnaGFGSjFNQTk0TnZtMHdwZVJUWjB1V1Irb3hWd2QzYjVmODNj?=
 =?iso-2022-jp?B?ZnZ1L3A0Y2kxTVdjVGQ4dUFqcWV0dERmL1VlRTFtamVLazdBV2VBTDhC?=
 =?iso-2022-jp?B?QlFPbzNndytzOHVwZTI5cFJSSlhNVUZ3L3kvdEROMUlZbzkxcHFWMFVN?=
 =?iso-2022-jp?B?cm5wS1N2RHFzMGtwY0ZBYjB2Mit1bkVPai96QzJPcVhDNjR3b3hEempM?=
 =?iso-2022-jp?B?ZkRlUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?L3B4TUJ2YUJoN2o3VHJ5OGcrOTNFVG5JWThldTJ2blZUTzlnUE51Lytp?=
 =?iso-2022-jp?B?eDZEeS9admpwSTNmU2NYaFJYNVJhdEQrRk8xT3RvRk5SS1RnZjlaaEpS?=
 =?iso-2022-jp?B?dkw0NWpoZjZjOEtTLytvWkREVlZVVjYrcmFXaXRTSWlXTlJ2bUdKd1F1?=
 =?iso-2022-jp?B?MElzcEExeisySUEyT3Z4TUdrWnErQjV4ZzVxb1ZkSXd4NHpFOHhWM3Jj?=
 =?iso-2022-jp?B?OEs1NitVUXQxdzJXdXpFejdqVVB2aGVva082dUJPcnNlVUZXZ3RRWkRi?=
 =?iso-2022-jp?B?cTBhYVlLQjFJV3hUVjFYSjVwSmR3RDJQTlhlQTVRczllaEp3a3ZOaVZs?=
 =?iso-2022-jp?B?d2JLOXZRcXlrQkhBbDNNeElTYVNnRzliOTJmTWtic0RFZ29yeFdNclZG?=
 =?iso-2022-jp?B?OXZkdldMemxIUFF3cDJiT2d0NDE4S1ZUQlM5OUllSEVQU1ppeC9XWTNk?=
 =?iso-2022-jp?B?eDlQREpHRXFyRG9XNVUzamNYR1laQXloVW9CZldlaDkyVk1KcUxKZ0w3?=
 =?iso-2022-jp?B?NkVIRjlBampZSDkya1RBT2dlMFIxYW16bVA5REhNSUY2ajJiblgrb0dK?=
 =?iso-2022-jp?B?cXNLSUV2a0dycTBxbjBrT0EyMjY1Uk5lT0VWNnNTNjZjL3RDdzkzbllE?=
 =?iso-2022-jp?B?dDFPUWdoSlRTSDkvUUtiTE1pOEl5bGVQZHdMYTVYb1FJUjNsMFNNRjVo?=
 =?iso-2022-jp?B?Z0k3ajVUWklaSXpMUXh3TUZZYTNCQ0pjNS83R0djVmNXNGo4dFMwUlNo?=
 =?iso-2022-jp?B?WGNvM0Z0aHNYZklCc0hUUHhBQ0d3aWVzMjZ4ejJTSkJRY0pPZ2FmeWdF?=
 =?iso-2022-jp?B?c3NXQzhIdTVtQVdVeE1sMjBNd0NPUndPT01Ja21CWVp5czhxK3ZiV1pU?=
 =?iso-2022-jp?B?ekFocVA3RFlsMXBkcXZSYm5sWElVcVF4MkZGS2p4bWxjdWxHZ0JDUEhH?=
 =?iso-2022-jp?B?TjFFMnQvbWUxbUFQMWVmckZmbk9PWmJwNTE0UTBIQkI1R0VRK01NUTF1?=
 =?iso-2022-jp?B?TlU3aHFyWUFXdnpKUytCSHFPOTRNWEllU1hMRFl0NGhOSmR4b0JRWWhO?=
 =?iso-2022-jp?B?VExkUWtoWGVxQS95R25uME1OODArRkwxcTlyNEZ6WC9LYWFyR2ZsNDhu?=
 =?iso-2022-jp?B?U3BYbi9OaGV2SDNIdU1qeFVhQmdzSU5XZTN3dXpDS1lsU2JRQ2pXZ0tT?=
 =?iso-2022-jp?B?bEV1UHVxUVBaTnFBZHJFeEs5eDYxYXFoOXlaQ3FLbks5MHE5cnpodXIw?=
 =?iso-2022-jp?B?c1NTejZTRVYzWWd6eHNlZ2N2Z2lQam1uWWU3bUNvVGxTTWVVL2ZRdlFs?=
 =?iso-2022-jp?B?bFk0ditmV2kzSDlKY0orOVBLTGZhZmxzOHNncXJPdC9iVGZDWlR4ZTFj?=
 =?iso-2022-jp?B?RFRMN1BWNGZPZzBlTEZ3aTRJWGpWL05vRGIyaEVrazFLU0tQZkwxRTJJ?=
 =?iso-2022-jp?B?SFl6YTliMmtsN08vVUZYMFhEY2lvdWdvdk02ajJvZjk2THdWQ1V3UG92?=
 =?iso-2022-jp?B?NVpZYU13QUp3ZkhrclBPYkxiWnZIM0Jza053MzRFbUFna0x4dDYrYVM3?=
 =?iso-2022-jp?B?Z2FpdzVTaU5qcEtFKy9xK3p4S1p6SzljWkNJNjFibTVDRkVuRDRpZEdE?=
 =?iso-2022-jp?B?ZUJmV1VzOWVJaWM1eHJubWdoQUpwa1dmUDgraWhQU2pXRDRDSDBxZWRP?=
 =?iso-2022-jp?B?Zk84YlJhRmpVZjBUT3FBU0c5WVJNMUJERE5NTjVKclE5NTR5eEgyTnor?=
 =?iso-2022-jp?B?aFA5UmtzS2JXOSswUHA3MUJXNVUyTStVRDZsV2Ixc3ZxMkgvejZRS3Bu?=
 =?iso-2022-jp?B?QldRaGE1ZVVmNndUbnpMNUUvTjM2eUYzbFF4S29vYzI2dzREZGVoMVN1?=
 =?iso-2022-jp?B?a1VVbks0b2hZTU1MU1RjSWd3TlN2WkdMSzljODRPYUo0QVZSRU55aDFi?=
 =?iso-2022-jp?B?YlJITE82N0lIWFZWeWpGblRUS1NTT2JybVRWanlFeThSR3ZMYVcwRVA1?=
 =?iso-2022-jp?B?bFR0ajdjNGFVOHIxMkFMcEh3Mi9VbzBoTG5sVG9FcUFmSDN1cFZWakNF?=
 =?iso-2022-jp?B?UWwxYk84VVJpb0g2Qk4ySVVPOFZ6d1E3VllTUlBxZFJnQnZLRUpEOEpO?=
 =?iso-2022-jp?B?K3NaS1hOR3R3M3F5WjFzWEVGVk1GTjhUa1lNb1NHbXlrdnNIalRxam52?=
 =?iso-2022-jp?B?eEg1RGpKOUxSN1UreExMUHJEWHB4bURJMWFyTDFPWVhMM2RQWmxDL2tY?=
 =?iso-2022-jp?B?bFB3QWlrUVRuQ3V0Z1p5S2RLaVhXYU50MWxzTVBOQUFoeERQUTRHdmdH?=
 =?iso-2022-jp?B?KzBTNXJXdEp1c0lWS2JGOW1sdm04aHFmTHc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee22f0c-342b-414c-9279-08de234d6625
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 07:14:06.6120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6aTtjFY/u9pF6dBbydN+P0mQuvGd5D+ejJw/Zbc8MMAZD2F2sM12Jm10D8yfWpgGO5LnsaXes9AyX4ZM3LymCOoPZS8bBTqjKYBVPYABxZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB12002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231412_996696_44986C61 
X-CRM114-Status: UNSURE (   6.65  )
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

> From: James Morse <james.morse@arm.com>
>=20
> MPAM's MSC support a number of monitors, each of which supports
> bandwidth counters, or cache-storage-utilisation counters. To use a count=
er, a
> monitor needs to be configured. Add helpers to allocate and free CSU or M=
BWU
> monitors.
>=20
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

