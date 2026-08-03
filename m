Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C86C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPmMmlUFRTUd7dbDhN/87zzLEt+ap2eTNie1lAG8C8=; b=amEloEN2ZYze98T01M9Np0xYfI
	mWprD08JiIx/AjBGEZHEPg+9fv2GIi/yheQLwJO6ZCK6QJfOt1DzxvkCrbbZv3bENgUm1O00vOGZU
	YLnR9wo3yROQsFzqEHpx4uuM6C9v+OTaQgWDXs7m+rvM36NvB2O/qjQX3sXhrsFdAUnCmBb/kwZxC
	NbyEusJ1wwmPPabka0TBDmJiIpQYA009JXfT7kvMVb1O+R4HI7foq1dp4BxNCXpWf/tXycTRJ4anR
	rKrKk4p5v3Uq1Vp7aZjaUTnvgQ9CAE6IGM9msyRglmnV4nq/4RiYYXFh699tWQ6CblRo7K92vEMR1
	dD9rNOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjOt-0000000GFFD-2UPO;
	Mon, 03 Aug 2026 03:31:39 +0000
Received: from mail-westus2azon11010002.outbound.protection.outlook.com ([52.101.46.2] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjOr-0000000GFEk-25Iq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 03:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAOnzmLm/fEHw6G94RZbry41vBJnDwAaT6iStI5NVlxxsrAoB/6XAWAX+dV993sv2e6TcMMbekF5TCuRiLlA/IaatXrpmzU7wLGnMXN6Wq6PwV93zkqn6vNmlqhzyRTxwJ87YDrGSgfqlIAUewPSg//LDClQMZ+GNrAsEheab185T6ucWeVkiYts+9XjJF92UshmlQ/Gx9WJDIZj5k2nxDNMDfk/TB3lxIwglPGaIhoStv9geu/T/OILBJ1x3OSog5a7cBqFF7FKQfAiEc+KDjl9IWxmZJSjYL1taEtEwIHBHsxyWww4w5uHpazngP3woFAn22VwrkH/2hK6to49Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPmMmlUFRTUd7dbDhN/87zzLEt+ap2eTNie1lAG8C8=;
 b=sfjLI/ZbmvbvFboR2l7jrXnwZk489bM9RYuXi9oxgqZLlFPCnyRCny7OYpvQkOtqeLGeWIug1oXNHIN0V+E7GwY6VHfpYOzRYqZaBmb6hT9taC+/9quTYhz+t9gcZrpRxROvhVXtK0xBGxAe8tGvNpwIlNzAnWOLZfDZNsGoeeAtrmuVXSeujnZEif+7U9ZUuyN2fNSdLLMQoGYQ4w0Vb9OWxD+4uRVDf/8LwMqrVsgPBTnFAJf7UTPbi9G1no7tbublf2DVvvd97X9cKhDfRRagyiVhQuoRCtE+SZczd6lYr7X14ZDCTWxQruP10XCU/nyqxsjfGQL5qe/ppAE1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdPmMmlUFRTUd7dbDhN/87zzLEt+ap2eTNie1lAG8C8=;
 b=P4WvQHZsqYUkZXOghCkJuNzpNSyPzekudqvkd0pHFoFYoAu6Dp2RVVSgyFG31yJscHscpr5rlpb0CwijYb6aVi3vjrIKk2kcg1k1UY7pmS3zyU0hBABw7+/4TX1sIpDDVY23JCihZbjlphCigfnD8CYO7gKUFe7D5wBhZgGAVIcg1MY6/zFUvNpPJRirdQKanlawNP/36RMNhz9tA9PYv0TZVeY1FOWpnjxF/Z2hJg9Y0V38OG/Wf9FJpQMn7ZknTwWZI4JxRvV7RQ3bbZigHNNmxeoO2rYqW0P5kSAJoaOF05Ja1p8WZomY7JN4Rd68GJTZqeLFcw/PdEbAmKm02A==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 3 Aug
 2026 03:31:31 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 03:31:31 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 3/3] net: stmmac: fpe: Move fprq configuration to
 stmmac_fpe_configure_pmac()
Thread-Topic: [PATCH net-next 3/3] net: stmmac: fpe: Move fprq configuration
 to stmmac_fpe_configure_pmac()
Thread-Index: AQHdHvz42UKnUwb4TUaBLbdr4sIKHbaECdiAgARZAoCAA1BSgA==
Date: Mon, 3 Aug 2026 03:31:31 +0000
Message-ID: <0e07c7d7-adea-408c-b08e-2bd1d86fd063@altera.com>
References: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260729015247.25774-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <07c55657-cc7e-433c-89e9-a21688ee8ba6@bootlin.com>
 <20260731175515.10e5eb2d@kernel.org>
In-Reply-To: <20260731175515.10e5eb2d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|CH2PR03MB5335:EE_
x-ms-office365-filtering-correlation-id: ee126114-d17c-4747-00e1-08def10fb62a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|56012099006|6133799003|4143699003|10067099003|55112099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Jtd0Ixb42DCfJgerjNMpUKZErN105+4KF8EwLJAF68CBu7B3mg4LwalaPLlW4zRXc4rU9bh/eQ4mmdaBKSbeQJsumFaHYS+TEooCDRKrJN+GVs2uoJCepgHxQioSEMU32xifY3uEotkKV6miDr8qNU+pS5OKmihCBL/VhJ7+4ChQNoIsBR9VC10pepj/+yXheZRcmr/JmuLa59f5X21gx3bjQ0Ld6dtLgRmw3yPQa1C8D/4+bnzo7kUKQhRxXhFzwCByT4D9uHx7aQbtKFzq96MYf57cH/rBGJyXvkdAk70Iq0BPde3In8IpLnlrhpUSYMBH3cEF1Eeu50Nw3qJXu7gpzHuQBuAQZys+M9PqI0cSTG+czWoaiwtJMM6hHenu4IiC8B5fgEh3dtekcdz/Fd8mbowQqGBI7J6FsezM48oqlU8lHKgbz4ED9ThRMW3ZptLEOCMD7UCrq9lllma/P4SoklVfeXKE+Ktla9Gn0NsbKOY8NoquHVWc8N0R9otqPHwPs6D2Slg8hvapTaCPZHzUUk7pRk9WTI4sjwpYz0hKvcTYqqgYAiAQLDdPb7BJVza2LKqgn5Tf1Pa7zv/nMzpoS3vWkx8FoFLzE7AmUMCghCxkjB/X5OF6nZLLxfA5LS3QYPFpWBRlGtKLsE4VMxaiyyP0FRMIfXBqUHqAQuijh6YpSkX+d/bvX1iJ/i9/bMeIySmc+y+A3/xqxOdEjisfOBruyqMhZly2MzORAa4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003)(55112099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3pha1BFYlhYS2Z1NGp2V3pSN3F3STRQWmx4L3NzL1VUcUs1R3Jzbkp3VDZR?=
 =?utf-8?B?NkRzREFZNEtoVVkrOE1SV3pLSVh3SERzUHRJR1U2Q3k1SVZCZUJqazhPbSsw?=
 =?utf-8?B?VlRGcW8rM0pOYTRvVWdUU1BtZVpzVkZpMldMWkYzRVNwZldBUjdlWldzdUkr?=
 =?utf-8?B?Z1R1M0UvRXczTkFNMk1SVUFyZWNlYmZrYWUwZngycmFWYVk1bjByOE5OMHVV?=
 =?utf-8?B?Q2cwZlR3R05DMHRNVnZvM1FkWVA4WlVhYUhYRXRyaWs4SFkwd2s5THc3eVFv?=
 =?utf-8?B?UHdoeGpUMHZRSXhIYlVhUEZFSEZjYmlkZnFreUtXdWFuR0NBcEdrRlkzMzlm?=
 =?utf-8?B?OWtzcnh6VHRvQ0luUWZzeHJKMEZRcTVYT3g1cy83YWljMDNsdGJ3a2wxazFJ?=
 =?utf-8?B?Q1FhSjAzbkxDWnQyWGhHWGpqUVQrVjF4bnJHOWRzQ0V2c2VQZ290cFNNSjI5?=
 =?utf-8?B?NWxYRm50Y3lEcXgxakpFeUpoVk9oUW5tcXZsK1R4bEsxbnFFR2pxbkNJMEdY?=
 =?utf-8?B?QzMyUktCdVBkekxOaTVNU01lMS8yVktyTGplS1dCc0VhK2R4MFJVdmNqOHk3?=
 =?utf-8?B?UjhXTm91RGp4UlJKSGp2OXZPTXVDUTk4Z1RxcFVGMmlweUNrTmlaZ0pYWjVN?=
 =?utf-8?B?bC9nYkk0bmhoNmphbFJPMW51WXZLcUtuQVJyUmFhakRyQVBCcHBmRzQxVTg0?=
 =?utf-8?B?VzgwZS9pYlN3bnhIblBRL0cwL2h2OTFhVTRjZEVoaVNZN0FMNlJnWGtqS1o1?=
 =?utf-8?B?dEhONXlHL3QvRnUwTHVWcWJkQlJnTmdSNW5BQ3JkcWRqMjlkR2YzNGxBUGps?=
 =?utf-8?B?bTBzdlVjd004am1LSTlDWUZsOGUrUkpXWTJCTXAyVXRGZlM3TUxZeWU4akRX?=
 =?utf-8?B?UjA4OXUvMUJQYVpEdmpnbnFDa28yc2x1bWllNFBqb3dLR1lBbTlSZmMvTFhi?=
 =?utf-8?B?MmJuSTNOaWtKVzhPdDB0VUNMZkZBNGRhcDA2UXp1TTVkM1BXcFl6NW02M0JH?=
 =?utf-8?B?RjJidWs1YUxJeXNnUWpBWDQrYXNabVJwdmdwOW9SV281VTBuQmtCRUFIdDMw?=
 =?utf-8?B?bmFTSzdRTUIxb1hrZW9uQXV1NGlwQjZUZlUyelYvOEsxTDBSRzdvaU00elI1?=
 =?utf-8?B?emJZU2VLTHUreHlGRFhnanM5ZnBrY0EvREsyaFRnVm1GcmRlalpsY1dJT0tE?=
 =?utf-8?B?UXZtL1ZJWTVibml6WUovRHVwWDFsaCtrbmNrZ0hTS3FENmZjRnYxY28wa3Y3?=
 =?utf-8?B?MzIvT1paWjZjU2NoYm5KcEFWTjhGdWM0TFhUYkh4a2paMDdoa0doWGtKVW15?=
 =?utf-8?B?dlpWREFXNGZZbmwrL0YrMWVhREw1SG82U3pvYTVVeTUrN0xlUXBlYkhxYllv?=
 =?utf-8?B?MGsraUdSWUt2dHYwN2psR0NEWHNLUGFOVzlsMjlwdnBvRHhjcTU3VzcvN2RE?=
 =?utf-8?B?T1BWYXBReDdxeTRxY2dZblFsV21kVmoxaEJNME5qb0FHN25kc2huYWMzZlh1?=
 =?utf-8?B?SEdZRHBwSGo1dG43VXJwendCL0ZtRG9UZW5icmlKVm1nZndtcnJEcHNiMjVh?=
 =?utf-8?B?UkdtL3JROFNzQTBMeHh5QmxOeUZ1Zm9kNlFEaHZ5QVd5d3lkZEpqTzk0cWFH?=
 =?utf-8?B?bHRXekZ0UVJlYnFsQldCTUd1dEptSEY4RVNGMGlIb1lwQ2pBYmkyb2NqV21O?=
 =?utf-8?B?akxab3d2TTN0aHNITmx0K0FIb0lEeUxzNithcWpBOVpiYjJwOE9sT2VKWDhJ?=
 =?utf-8?B?VFhJQWxUNjI0V245bzRwZ3Nxc2l2UStwTzZLUnlFdndZUk95WkFwTWk0bHpt?=
 =?utf-8?B?SG1wYzFtK1JNUHJoMzd3eFpDRzB2RU0yTldCTGZXeGJjRWUrTlhTRUJBd0Nl?=
 =?utf-8?B?TDl3cFlmd0pXQTBxc1pPQ0V5dEFFMDZ3cXNaT1U3eTM3KzhJbGdHdS9SelBt?=
 =?utf-8?B?SkIrV295WXc1VjZVNG9ma0Nqb1B0clREVENoVFBnODlMZ0JseDcyVjhKeXRz?=
 =?utf-8?B?SU1mVFJuU0hwa2VZaUNiUHdtSHRWSHQyUUplVEl5aVNXRGowNDdBcGNYSGNV?=
 =?utf-8?B?TFV2THRkL2Zta2xPR1UxemlVRVZDb0FEK2ptaisva3dkTE5zUmNrVWJoeWVV?=
 =?utf-8?B?dGp0NWNrYkcrclh6NUhxZFRaWGdiQ09Wb3h0bmI5TlF2MDZnQkJ6SmdjckJ1?=
 =?utf-8?B?N2YxMENHYnVkYmtBb0hWd09wYkpFUHJnbWZYcGd5ZWpZaWVxRCtBeXhZMUV5?=
 =?utf-8?B?Rk1VVFdUV21tV2oxL3RIRmdmNzRGdUJPQkl3aVJHRjR5bER1MlFUck9BZHds?=
 =?utf-8?B?cThPZnNXRVN1TFBHSHkwdEFZaHh5d25NN2FYUm01SWJSdE5kUjhmWjd2bzRJ?=
 =?utf-8?Q?uJoL4FqyEfda1e09lya+j2YuJgSYj8X5EGxBOgvfp8Zak?=
x-ms-exchange-antispam-messagedata-1: 8PVX7NoKkns43g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <728CF12646AD56489A1346A363E56B98@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee126114-d17c-4747-00e1-08def10fb62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 03:31:31.6168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kaKtKNjDhI8lFhyuE8hIiSdrxEaLvwSOGHXT31+rBFFHEwA/rk67t6UIN1exYbaE8uL4e8sp5vl0ErtHxA2DuOJDQ/CcWQwsimZ1xIFUqIQIR69VoS5bFmwTuXXrGKajf77qdQvemz3ntE6ls/UUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_203137_565918_D7900831 
X-CRM114-Status: UNSURE (   9.52  )
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

T24gMS84LzIwMjYgODo1NSBhbSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6DQo+IE9uIFdlZCwgMjkg
SnVsIDIwMjYgMDg6MzE6MzkgKzAyMDAgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6DQo+PiBOb3Qg
YSBiaXQgZmFuIG9mIHRoZSB3cml0ZWwodTMyX3JlcGxhY2UocmVhZGwoLi4uKSkpIGJ1dCBJIGRv
bid0IGZlZWwgc3Ryb25nDQo+PiBlbm91Z2ggYWJvdXQgdGhhdCB0byB3YXJyYW50IGEgcmVzZW5k
DQo+IA0KPiBNb3N0IGRlZmluaXRlbHkgKzEuDQo+IA0KPiBQbGVhc2UgZml4LCByZXNwaW4gd2ls
bCBiZSBuZWVkZWQgYmVjYXVzZSB0aGlzIHBhdGNoIHRyaWdnZXJzOg0KPiANCj4gaW5jbHVkZS9s
aW51eC9iaXRmaWVsZC5oOjIyMToxNzogZXJyb3I6IGNhbGwgdG8g4oCYX19iYWRfbWFza+KAmSBk
ZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogYmFkIGJpdGZpZWxkIG1hc2sNCj4gICAgMjIx
IHwgICAgICAgICAgICAgICAgIF9fYmFkX21hc2soKTsNCj4gICAgICAgIHwgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fg0KPiANCj4gb24geDg2IGJ1aWxkcy4NCkhpIEpha3ViLA0KDQpSZXBv
c3RlZCB3aXRoIHYzDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDgwMzAzMjM1
OC4xNjI4Mi0xLW11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbS8N
Cg0KTWF4aW1lLA0KDQppIG5lZWQgdG8gcmV2ZXJ0IHRvIG9yaWdpbmFsIG9uZSBzaW5jZSB0aGlz
IG9uZSByZXByb2R1Y2UgYW4gZXJyb3IuIA0KUGxlYXNlIHJldmlldyBpdCBhcyBpIHN0aWxsIGlu
Y2x1ZGUgeW91ciB0YWcuIFRoYW5rcyENCg0KQlIsDQpOYXppbQ0K

