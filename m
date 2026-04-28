Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48182FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 04:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6wgqnNTFtDcKp2o0kJs+RT8360ErkvcZ9Qy/c4fpeg=; b=DTDyo7rCDai33h0N5hI6YqoW7E
	NyzNUgcQQLFSL3Xa3dsIY4uHpZeiyTpNWd4mhD7mgejTy9UVKuXuJGNcXzG9vmVFAC9drqS4gw/No
	m3MAdJrOs9yhGn5T6BipO8D98dmFHGRQXqLLZenfaCAnKDfmZOXo9c7MBAqMxgPi7qTCp2NPrhPZb
	v10jgd8bGMmDAf111Tsex3bNGopwGNjidhWnLgTcT5TlTq5Syt6GVyqMMwcgjG47146hvgEWYJW5C
	1P+v6C5N+oOLh8G0hH9erjPX4Etj+v+oPDJarOIC7p5u11h8/DaVRq9kHAFyDQGFRsx4KWCPxzcmn
	zBv3EMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZwZ-00000000XOY-36x7;
	Tue, 28 Apr 2026 04:21:07 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZwW-00000000XO1-0PbH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 04:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwyKQf2BKtjweuHVmDc0iEUj1lx6hglSspcpc5wJRo4L/wd8je0zIHJxFwESS7tGwrnSRh7xO/hJ7zkDdOG9s65FaVQPpvuP54b683dPVYJ3g9gAod2lZgOjTMylrVdWJmbaed2FUOuIUgSgDXODv/Y8DF8Tmm1tdypo+MWHiOPcr6w+xjxVY04QDanjvzXbhtaO0PIXPuqaQZGTmuxk/oi973SlzzQqznQ18EYJuvO77OlUVSJUCQI5rCZquv3aOqeByePv6f+sSy2nvXvy8P2bt3LT48J7f/Eiitgb0EPtA4+8Rk1kpDhLTj/B7N/lDP3/8jHmjiLGeJyBZR6+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6wgqnNTFtDcKp2o0kJs+RT8360ErkvcZ9Qy/c4fpeg=;
 b=KKs9Z4nqDGj57vw4Y/Ti2pDsZvk7n7IL2yP+PbfkAsxsgb8xiSGdmtzNzPYz1U+g/6CA5QRt0AcYA7pbMLmhw9xlDtapQ+5FrVnt4YFXctFj9N2Ck+4bTicMktYwboLjhU3XsSs1jCsGEZ5alP+MmYyVCCxuJ1jm+57C0pfVhVMu0l6Lt2wBxu86Hq3dXmPTO2BoVBwRrqERPVlhNs0l/QKe4823ucm3mfoCV6FxetKuH+tMAwtWcthrfUAf2o7SkDTsZC5bRlcnXOItPUl9BtFRUs4BeXArh6FX+tDphdFf6fHakvduLoys0vsteTUtnz2NomqGrzfs3cv+TpiDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6wgqnNTFtDcKp2o0kJs+RT8360ErkvcZ9Qy/c4fpeg=;
 b=f19+OyLLESmH9FyxylXt15WNsAMbclbiLgiMA++QFMOcg0o8ShDRjBDuwMuE/LzJzzN0q3C1LPqMsPOQtSJC/vUP9qk8a/kiwPMKhs+CJZcOMfiXuRPT69TMYzV8ib7DGuEJUUwxwrI05odvUqiEo7Ml3Qg5WY4Ib7MFgDHztRlO7janb6geH5kbaCOuiS+WiFLtUC/D6B6xx0mQ71DhneKTBezxxRXv+Mhq7tS5thU4VgKHJ1WfgqFQHagXg9xoF0AFuxXQvpzrP120gA8yGtH5WuDD1Rz386bkhkjOm0BaBViwZNubX+wnZgaVkZemhEcZraUF2Rm4tmrEUyLAWA==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OS9PR01MB17912.jpnprd01.prod.outlook.com
 (2603:1096:604:447::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Tue, 28 Apr
 2026 04:20:54 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 04:20:54 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "ben.horgan@arm.com" <ben.horgan@arm.com>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"reinette.chatre@intel.com" <reinette.chatre@intel.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "tglx@kernel.org"
	<tglx@kernel.org>, "will@kernel.org" <will@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>, "babu.moger@amd.com"
	<babu.moger@amd.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com"
	<TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com>,
	Zeng Heng <zengheng4@huawei.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>
Subject: Re: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID
 feature
Thread-Topic: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID
 feature
Thread-Index: AQHc1rtPQXHvBFTZTkST5OP+0gORZrXz3am8
Date: Tue, 28 Apr 2026 04:20:54 +0000
Message-ID: <TY4PR01MB169309175E789FEDACA22619F8B372@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <1d9cee5a-38be-7115-51ef-b7109aa4ab5e@huawei.com>
In-Reply-To: <1d9cee5a-38be-7115-51ef-b7109aa4ab5e@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-28T04:20:53.906Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OS9PR01MB17912:EE_
x-ms-office365-filtering-correlation-id: 6eccb302-fa01-409c-8a9e-08dea4dd8a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|921020|1580799027|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: naY7Ua+zFrUT1cSEjaEOu2/ppy0lMTtcMI3mdFHrKIJ8n4iMwQO4V6kOvCDPgkTDMWnV2KVhV4bd0cKU7o41E3HECNfWXe3R+tDPu3nBU4baXLUpwRhqRbm1p5WQ4HOohcc0E6RF5s2G0Lw2/8wEsz/wiz/GhS8eiPZV56qmfmHGZJEWTQ2gVH6FGaIlgL59R5fETG7JiJEJ/Kh1zzyAFuQfTb53yVF4qVbdUQx4GG1gsAqBgsnDy8KR9xvXLqjd1uGf/sjuv+wR5w4GIgp3ALDSVpWWK5xALS79ybOZkyNZqQBRKs0Vyf1z0H4GZagTqcmqrZJEk13rz1lIDOY/OHSdzLVGoUQrYLkCjsVWSioMalI+8s0V54Eub0iQ/a/3OxV3NKcvg1hUzoWEmIcYM24+5U8qUm7SY6VajRFFZikMOVdO/J+wGgNiIcQx5a6i7vOomp4zd4SfqGiINrLUPscPNJphT9pAPVgnO3e3qg/oAN+4Yhy3EbED+q1TiHwtyg1ZQJe8NrNH6MOwm/IPUbDbgaxtwhcR6b07L4Ec/nRuL1jc1hEgYBtJv/x2VFHeM5+F5jy07K0njxZvyDHE65RQRoUdITt5GM+/J0CMPYVP4u4z3YmqNtwF0ccv9JFwCTKmmNvwcocrHdK1Lw44jY+kTJsdnPvy7s/xlv8LWs/+Uw68icwn0xGVOZiR3Pz9U5ny9eCCIV0jqfTooKCoqcH80J0RfF+q9gJVOv1LVouUeGXk/CRmsIlhVl0wATVPbGB0ZD6A/csdIPwq4FYZrmtCEoJr5dKFjIwdN7CSyYxm+rWAk/mvYTAW+KP2dzJfozrIJ4NQuCL87Xc74EwpJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(921020)(1580799027)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?MEpwRmlYYjlDMHp0KzdMTVZ1emV3L1gvSW5LRlpzczBycU9WRWVrWEdC?=
 =?iso-2022-jp?B?MHpPd3kwcDF2NGJ2ZG54UHY1akZxKzRFWkFHUTlLS3FQSWZPcWJBN2hT?=
 =?iso-2022-jp?B?Q2p0dlY0K2haRFM4NHYrdE9sMnVFRWhKb1RzVUE3aDNSSTd1S3lBWFdh?=
 =?iso-2022-jp?B?UnJDRGFha1BGSitDRG1aS2ZNTG5jYTBKck1ENFYrejdSUWZsUG1WS3Vl?=
 =?iso-2022-jp?B?b21LQ1BrN1FHc1JSN2V0Ri94ZjVhRENBdjRtV0JBdW1FbTNWb3M5MWFt?=
 =?iso-2022-jp?B?TUZ6dTZ2NVVWdjNLeG9SRVBLQm5VbVE5aEE1NHEya3psRndMVjkxSWY1?=
 =?iso-2022-jp?B?R3NEZ0R2eVhjSjRxYldIL1d6T3FhbVJESzh5SmgyaGh5L09IZ3h0R0N0?=
 =?iso-2022-jp?B?TTAvdW91dmthS0kvK1J6aUp6VCs3ZkZCMitWUkdaOHBkRTFXcnQ5ZVpO?=
 =?iso-2022-jp?B?OGZ6bXR4U0lrSmtEVDJiaHZlT2NTRWJlYmRycVd6N3hseVRhaGZUSWpU?=
 =?iso-2022-jp?B?dW5IT0ZrK3RjNkVrcnBVcTZNZmlKUGtPMTB3WURCekJiVzJlaW9vbERY?=
 =?iso-2022-jp?B?Y1JtbTFrb3BYTUw2d1JycFhLR0R1bzUzMVQ2QlEvV3Y5QlVoRFJMUXJm?=
 =?iso-2022-jp?B?N2k0ZXViYzVidWVzSEI5RjFTZzlqVmNIVDUxMGJWaUNqVWNjWU5SUnJO?=
 =?iso-2022-jp?B?eHlBdngyUmdUOEpiL2J5aUp2eXAwZS9yK3JmTGZjRkRFVHIwZkxoQ1gr?=
 =?iso-2022-jp?B?RG8yYkNQcTNNNUxnSk1yQzJHdjFCci9iTlB0MnJiVFBOQTZKSFNqMDdB?=
 =?iso-2022-jp?B?V0tpcnl4c0tjMWIveUJubDZHV2RwdGd3aEwzaDdENnZzWGhKYi82eE84?=
 =?iso-2022-jp?B?MlJmT3I4UFJBUDRVb0VnZDZFRS9HR0Q4Z29xWkY1eEhVVTJYUVpzNDQ2?=
 =?iso-2022-jp?B?RmtaSVliSS9paWlnVjhrT1o1WkFyTTA1UFc5STdQSDZRV2RPaFdBRnk4?=
 =?iso-2022-jp?B?U1BQcVNmWFYyb1g1ZWc5Y3k4VVZwdUFQZkRPdzVXZDc0UWFPNnU0MWw2?=
 =?iso-2022-jp?B?TmtMUWtXeU1pckwraVFxTmhTbWFkWjhqV2JvUHgzOHhpUkVwZk5PNXNG?=
 =?iso-2022-jp?B?YVhFY01KeEF1cW1pbmZPNllpTzZvZjZmYUxOd2VXNjRmallMbHRIRk5a?=
 =?iso-2022-jp?B?RHpqWTdLc3FsMFRYRGhBdjdYZTVqeU1mQnZMbUZOanhsRXRVWTVLVHhl?=
 =?iso-2022-jp?B?Y21tVE1Lejc2QjllTGhCUDZYTFZMTm9XcmFqNk1wbkJ1OUtHVFFteEhK?=
 =?iso-2022-jp?B?ODFVT2Ntcm12WlVzN3ZETXUxbEZoTWYySzZIaTVJN2E1ZElnVWY4M2Fs?=
 =?iso-2022-jp?B?NWZtTEpGTjk1U1pRZnlCK3BNeG9WNE90T2NXZFhFMEJqdG1mTFdKcFFv?=
 =?iso-2022-jp?B?TWtKNjNNaGNIWDd4cjAxZUFERUFWa2htREs2R2U5UHMxTktwMDBGMWNs?=
 =?iso-2022-jp?B?NnJUdzM2ZjdOczVlbEJSaU1kdjliVTRWM2EyYTJDdE1VdUxQNzhwK2FI?=
 =?iso-2022-jp?B?aXhBbU5oczNITFk4M20ydzhDcVlUV3JBSHkzcWRWWldOTy80VHVBaTM4?=
 =?iso-2022-jp?B?ZGFYSFdlWmVzMFBhYzFzUERvcGxBQW5uczN1emlMVE54Tll3a0dyNG1l?=
 =?iso-2022-jp?B?KzJsdmdoS0RQV0UzdWR2aWREaVowQjEza2w0U2hiWlZsNE81aEpSeDVl?=
 =?iso-2022-jp?B?UkpFMXl4aFdxZDVoMTR4M2FWemdrZWxOUFBTcng1YkI5MkVuaXR1SGZh?=
 =?iso-2022-jp?B?bUtHSzFSZWpYMFIxbGJ0U1hSSWtyM05aQUc3eXRwMVhYcFFsQ1FtcHN1?=
 =?iso-2022-jp?B?d2Zud1B3UHhYNVN0N1dqZ3hRa0M1WkhBdGZmblpYTEpJYndOcXRDdDAx?=
 =?iso-2022-jp?B?RkRueHE1c01VYXVNcUpwY2hXalIwRFpLR2d3bXVpS2xBbnhCazNlVGJW?=
 =?iso-2022-jp?B?ckpuenVZaVR3c3g0U21UTGFHeCtvZktUR0JndXlldTZ0M21pV1kwcy9W?=
 =?iso-2022-jp?B?eHhuZkNUN2J6cmVJOWw0OUZlNGRENWJhRHNnMXJ0bnJ5T0c4VGNNU01F?=
 =?iso-2022-jp?B?N1U4U2NXeVprK2lSQlkxMUxrd250eDBIWHEweHdnY0E4Uys5NnY4SEVY?=
 =?iso-2022-jp?B?VjhIbk5PSVk4OFZ2Y2VIVmxGM1hPejNXTWpiYnNQa25GQ0hYNFdJcTdP?=
 =?iso-2022-jp?B?NGRPcC8yU3hZV29lUlNIMW5wb2ZNK0pvV2w5S0xxS1lUUHpvc2NKdVJa?=
 =?iso-2022-jp?B?WnRPRHdxckVqQ3JhZnBmWG5VZEF6N1ZMaG9NUTFZcXZyS0d4ZVdISVlP?=
 =?iso-2022-jp?B?bVJ3dGpzclRZMlFkSVF0VCs3Y2ZZVTYvd2hWRWVQa0JZQXpBK1l3bXJ4?=
 =?iso-2022-jp?B?TW9JbmhjUW0rNnFXY2U1WmZjeU9OUmhjTFE1Z0JjdW8yLzkrK3lMSlpU?=
 =?iso-2022-jp?B?NlVDZlA5dHJ1Q2lORnJZdHMwcEZOdnlNQU1Sdz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WBI+2jQ56OvAkfdAG9Vcmd4UEg/y1gUI+Dt7FCCNQz2wQuB0Rtv3RaP7OfIRHK8hlLtmTTb588mJRy7aWxSZxvT9nY86SN6TdoIpjEPPn1arq/fyXxSns98w+vpwp2J7KB/Erjdi6DxHk00FqZzIScbv9U0889Wu50lO3HwkLlqGiF1YuYmVYgu/df/UzP86O+o05rB48uRekOILK8epaO3TdrE+Qa1aTgP1HxWwr7/MhYTf7H5uLo9QO0nGfu+wRPz52XiyCoIVkVsdOz6xEQfRgtcbUuC4xKZjAkhjz58XC8CBqa47OqJWfSu2zK+uSJ7XCM28UnDu3AF7dxKXlQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eccb302-fa01-409c-8a9e-08dea4dd8a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 04:20:54.2905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnKJ4v4WD+klOHiw0PocyfqSowl0pEzgrVO3Pnquo1KhBzQDPB0Cjf5jUl92hjmLnM7OdPjnnxByIX2nts8mqV3fFA7XYEBDTD4kjeu5nvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_212104_358218_8CDFA0DD 
X-CRM114-Status: UNSURE (   8.25  )
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

Hello Zeng Heng,=0A=
=0A=
=0A=
I hope this email finds you well.=0A=
=0A=
>As indicated in the patch series tags, this patch set applies to the=0A=
>linux-next repository, specifically the master branch at:=0A=
>https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.g=
it=0A=
=0A=
This patch series could not be applied correctly to the master branch.=0A=
=0A=
=0A=
>Keep me in the mail list for follow-up responses if you want my feedback=
=0A=
>in time. I was accidentally dropped from the mail list in a previous=0A=
>thread (see =0A=
>https://lore.kernel.org/all/TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR0=
1MB16930.jpnprd01.prod.outlook.com/).=0A=
=0A=
I've confirmed that your email address was correctly in the recipient field=
, and the email was sent successfully on my end. =0A=
Also, it seems that I sometimes don't receive your emails.=0A=
I'm not entirely sure why this is happening, as my email settings appear to=
 be configured correctly.=0A=
=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=

