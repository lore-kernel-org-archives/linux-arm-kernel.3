Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7568CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 05:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1MSLGD5ViIgTD+Ev79mMZNlXRobPrkGX7NNN0xcmdE=; b=oxsoRpZX4HL9tVA9AN9apUYzDq
	rSqXlQFHu9XJbivx9njl4EFvfZqf9xCBV8LnfQ6cOFQ4JAbsKjgZvjn75QEevw/H6fB4aqxwV6Yty
	AA0Y1B86p/QVd67/hWp2Jr8JNoLSm18LbqtlWvGQB6l0z2jsBOsHJAYkgCe79TTmVULAlGjeYUPF2
	pjGwyRY4mz2mB+wvTIlcQ1G1W4PT6ofriwOvSRjhdF0wPJFnUJ9PKOcM5WaJC9Kv4fyMjgy+YPvLs
	/rlCmM35SitaV4/VxfJ9RCbm0IpvjLsSOvx5uctguVAmujExWj8KUiVoVxSMziwnAcNkIx3sJ++dW
	/Os/2Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZN2z-00000007VF7-293F;
	Wed, 09 Jul 2025 05:08:45 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZN0R-00000007UYP-3nuy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 05:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgOUpwKCGb69N9GzKwcypxJ1KAFxQoZ3VrnNzS7gGsz5mP93XORTjtZH0jpNfPvsO0BViOXmNOhmBC2D41CGhlRd6S9VFB0YVtg796Gwz6ClzXydibKdXZ/gvpfXO+mCFr1BHlC2B4pQAgcqip4cgT0sNo/sstcO/Z4IsvlLBuDZL7OJDR7jbjaURl5jRVCx6/OVVN08l6S0qF/85ERAk3f4CQinJmlfbOFg5qo4F1bh5U80ouTwZqS9nF3dEA846JpbuHPhWJyDQXqAyVLiwmyTxeShdqi6UHOMj7GButYMZPY9Mq6mj1x00iGyFm37b0w5iM1/okFntPgIhzYIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1MSLGD5ViIgTD+Ev79mMZNlXRobPrkGX7NNN0xcmdE=;
 b=WMpfmsVzDRBvebutH8jqVXNVaTn7uKI/mRDK4Zj9bfYzLW1W+PDNPtjJRZGowgXGeLgVo4XcP2vSBR1RrACAOOiDFMa/YjFQsMR9HEIovJB0HOQUlAO5o/SfP2Y4XTkq/GwMeD0zSgRu+7ffIYqyUj56sDVVSlLQEMhRuuFjSyXvx442qSJJWb751Ga+o/6M/mNjFwvxOxVp7IVPf02BCv8UjgU8/LREQuVfe/eS0zDUlwwpSrP3ZG8NcvQmOXe/20BAYuYiadcdjeAAe2U4ED8jgQP4Qr7I1P90q9J3C+Ofgqa4ZxidTuTx8vcHDnMeVIGLOhqDHH2L1TODg8MOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1MSLGD5ViIgTD+Ev79mMZNlXRobPrkGX7NNN0xcmdE=;
 b=jcstiYaXpxvk0cOa/DHE/sRDBg+xnlLikVe+7zVx8CfTvEOHRlQ2wW+EDoabtfKOJF8UEaJfohZckjfX8Jofl3IPSKOszp1dllcI+EH6ccmGvWpkWF5KH8WLUMMAv6NWV84DKWJOfdxvX2xaJUDONsEFvVF1FK2oxMDOz42RfhQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11598.jpnprd01.prod.outlook.com (2603:1096:604:22c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 05:05:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 05:05:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lizhi.hou@amd.com"
	<lizhi.hou@amd.com>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
Thread-Topic: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
Thread-Index: AQHb7P8PBMpfnLgFvkWQvju7tLKMl7QmU8ewgAGzIoCAATrXgA==
Date: Wed, 9 Jul 2025 05:05:44 +0000
Message-ID: <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
In-Reply-To: <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11598:EE_
x-ms-office365-filtering-correlation-id: cca0d5cf-7dc1-404d-bc82-08ddbea64239
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1A1Ui83MjJ0ZDNBNjBJYTFCOUtIcjBJaXdWakt0eDlNbUNLbXFRTVorcHNU?=
 =?utf-8?B?YmlLTlBpa21wNnQvR0VNOUlibnN3bTJmdzkzdk9ocXFRTlJwc1lDZU82azZp?=
 =?utf-8?B?MHdJYmNScmRsZFdWQW1WeTdjWVQrZThDZEV4UUp1ZTdUMHpGRE9vOFhGOTNk?=
 =?utf-8?B?OWE1c0xPZHg5eGJBS0xJMHJYRXFhVnJIV3YreVhZWlMwbjZnVGVERlo5c1U4?=
 =?utf-8?B?NjJzMzB2NnVLakJNZWlyU1FwR3czbUxmL0N4SDJzKzN2V2V3bnhYZ3BrUHcz?=
 =?utf-8?B?UHhZRmpDc1NNS0xrcEpLWFV6bnhUTFFOVjhFWDhmbU5CdnZxb3J4WDV0MXFu?=
 =?utf-8?B?RXNYcGxpTTF1NVY5azRaM0xzUXJhc3VIN3lqMWNqSVhORllEWVZmRi9LaExn?=
 =?utf-8?B?ZXZqNzJKOWhubmVvY0VJWXhXQzNXdWdNbU16a3hVMHZuZ1dNNlpYdXpHMCt1?=
 =?utf-8?B?ZFN6QmE4YU1wajZXZ3orL2xFdXg4N1c1UkRBVERBUHdOWUVEQks4OUllY0NX?=
 =?utf-8?B?UlRRMExwWkQ4VFRKK2NtNzgxTEUzWDJXb2Nad01CL1Jnd2U3dnl5ZlZaVTN2?=
 =?utf-8?B?cUZDWlVhOXBRbWdPaTNJeEM1Ky8wN3pJcUpUOHh6QzkwbmQ5NmFqVzhLMzVC?=
 =?utf-8?B?Ynl6TWU2Q0hQOGtLQ1RQT0YySjJRVzVQako2UnhxZXNjSGJVOEtVeFZpa1pa?=
 =?utf-8?B?Vi9aMXBwTzVEQUhSeU5PS0RFQlhpc2NDNnAvMXJlWGtmeVlMdVlzZkxPbm9j?=
 =?utf-8?B?VjY3RzljY2dKWkhZd0JRVG5DdWtpT1NpUUFFdWhPN0tCRGNtUjh5VGNQMWE1?=
 =?utf-8?B?NS85bzQ0R2ltS0ZJUktDWHdJNnh6Ykp2SkUzbDZUb3ZQN1ZqM2c4dmJqc3FQ?=
 =?utf-8?B?eFVaSTZNaXY1cGJVNytiRXlYdFljNUFWRGJyblhxc2tPTVBUVXpFaGRDQnBu?=
 =?utf-8?B?TTFRVG92RWtKb04yTTlRNk9FSFBtdmozblcrSDNmeFRUTUxyc29zMnVqQkR1?=
 =?utf-8?B?OEdRejFSVFJtYlVqNjc1dnhRbTV2d1RqZE83Mk5UbjJFRGFJcG1RR2djKytn?=
 =?utf-8?B?ZHBLUStIZ3dMR0xDVUZOMitGbVR4T1BIUzdTeklYK2dTTlg0UUlRUzhlTlFE?=
 =?utf-8?B?b1pLTWdxWVhTS1VCZzZzSlk4NWlqT3p1YmRrdmlsaTJEbEVQZDh6NkduRC8w?=
 =?utf-8?B?cXU3MXU3MlgrVnNkaktBYXFONHNFQ1UzYkU5TTU2T0pVNEZIZmlzUFpXQWJL?=
 =?utf-8?B?VEJtKzU0VW41VEs0amtzVGtqaERJTS9lRFBsUk9lVWx4dTVGVGRPOTdRQ1lr?=
 =?utf-8?B?azlMUUN2RWtpV3NsNFpZOVBjcDBNeUFMeGdYSnVDc0VScHRoYWh1WnJxRGlD?=
 =?utf-8?B?UTdxS1VxZmZMNXE3OFVyUm0xSlVUUk1Day9CTXdOcTR2bWJyNEFic1dMdmxj?=
 =?utf-8?B?T2hkOUJBWWFZLzNpZHhLSXFMYXc3ZHREQ2pCS29yaDJacXpZVm9RUHJZUlFm?=
 =?utf-8?B?VUJkbVRaS1BQTFAydWtYNi8rRC9wc0FyQnJoSXU2cGM4UWdjVzR6dDJXL3hJ?=
 =?utf-8?B?eFNyMFlCVytmdVFvNDlidnpDZG5PNC9rRkxxU1lmb0V0R0hQOGVQcWV3cjgw?=
 =?utf-8?B?d01YeDV1QlpwSXJMMFNkWEM2dnJabnltc3d4REFXWG03bVdnYmpZQVhnYklx?=
 =?utf-8?B?RWtSaHVDQUFsckt4czdIbHB1eGJHWE1senYzdEhHbFdncXdNQzZGYzYvc3R0?=
 =?utf-8?B?VEltRllDYzN0TS9WcnBQL1dYSURvY21IZjR2YTM4YkRsYnpicW01Z25ldlhO?=
 =?utf-8?B?S2o0UDJiZG0xcEJQejJZRlRQRTZEN1hTeTNIZ2g1V0R5SVNEbDFrbVZ1VGVr?=
 =?utf-8?B?R0lOM0ZDV2RkaS9QWHkxb1F1d1ZQb0NqSTVaTnBrT1RPU3ozNUhsTE9ISmE4?=
 =?utf-8?Q?Rn38qRpVbOhL82t7CS9FlOJo18l1O1US?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmlUbElINlhyekNzRVRIbjlyZThQYVY5NDUrWWY3enA5TDRHZ0EzSWpaQmhS?=
 =?utf-8?B?dzh0eU9SU3ZTZUhwL2ZwLzd1ay9pZ2M2YmtHbEJiWmRwbm43UmYzNzhMSXVv?=
 =?utf-8?B?QWl3cG9LZGRNdVBmOTZzLzU3dkhvcmQxeVJOV1FvNUVWKzRkNjN1S2xmSHlX?=
 =?utf-8?B?V2l5czczVkZ5OGhRT2Z5dU5MdDh5c1dCb3RpbXVsdi9XMzViQjZMa0hWZmZv?=
 =?utf-8?B?OGk0SUdqN1U3d2NPVW5zZzlZMWtKcldLZ2NNaGZVSDJPcEdUdDExMGdwemRK?=
 =?utf-8?B?d1Z5V2Uvb0hBQkRsYnJRNkNEdy8raDNyRzZpbVcvZHlMYWdQdkh2akZTODhJ?=
 =?utf-8?B?YnNZd3l0dVNyMXFuTG1lMUo3dlhiL2FzRVdobXJpQ3hrQmhGbi9FN3ZybzVj?=
 =?utf-8?B?eHNUOFBFeHhSZmdBSUQ3T0gxeWZ6MDl5M1NqRy8yNkp6S2x6TmJVeFgyZUpp?=
 =?utf-8?B?TTZqWEhFWkJEYXF6TTd5Qy9DQXJRa0xDYkVOSUQxeFM2aUZUM3dhaXExNkVx?=
 =?utf-8?B?S1NWaFdyeFBXVmRvS3JUKy9WYmN5RElOUmlqOWQvTTV6T0p3bXR1a3AzNHBK?=
 =?utf-8?B?YVFpSExpN3U1cFI0T0VDa3Q2RUNmZmZnNmkvdGUyM05BRWVyTVNYdU1FNHRT?=
 =?utf-8?B?em9nZGRlbjNrY3pUOE5JMUhORGRwYzFkR1AzaVR3MW9XNkhzSUFGd1NyWUVY?=
 =?utf-8?B?MW0rM0Z3ZHdjKzRNNVlWT0N1RWo5dXpjdGtGWHVBS1ZnWDRKdFpocmRIRGFa?=
 =?utf-8?B?a05SRDkxeUpycmxpUmlaeFEweXY5ME1tVnRGMUZBRnZnS3N2amRqc1VaYXU5?=
 =?utf-8?B?ZGdXd3Y0MDM3UUhxWUpUQm5NTlFaYWE1SnF5SWxoTXljVFYzT0IwcTFESWRC?=
 =?utf-8?B?YW5kUVZMSGVyd2JrUU5qck0rK3NpQ3daK2xXL204WmdEVGJtYjJETWUxeitW?=
 =?utf-8?B?OXcrb3dISTgrVms0RE9sdmJLNHZ4YVE5Z3pqdXRad2NRTlpQZUVNK3FYanFZ?=
 =?utf-8?B?emJ1S3JMTXMrb3JZcGdjaWplNi9tQklVdG1XcklmZVhUOUE1WWZaZlg0ZTNq?=
 =?utf-8?B?MHYwM2oxcjZsM2NCdG1Bc0JnWVVNQVdZZFVzK3ZvSHJ3RS82VWEyOGliQmhM?=
 =?utf-8?B?UEg3TzhDNnIyTlYrU1djVVdYOVgzdlRUQ2hmN042ZkR0WkwyaWM2WUEwQmxY?=
 =?utf-8?B?Q3l4NG5qamh5RjlHWXp6R2RYd1Rrdm53OTFiWlZjZWw5WVRuaDVBZ0Q5WTNQ?=
 =?utf-8?B?dmttREJtTlRaVkNXaDMvVTBNcmtkUmhKMFB5R0JJK2FMQ21jbnFnSEZVc0oy?=
 =?utf-8?B?NDcxZVY0NU5SRkMwVTQ0TmhaZm1mbHJZVnhXcXRiZkx0Ri9jc29CNTZJeHpD?=
 =?utf-8?B?ZTYxcFVZUDZJVzNkM2MrZ053TloycGYrZnVaRXBjbXpyWVFqUkpxeFhlM3dv?=
 =?utf-8?B?RlVJSVRGNW1sUWRuVm1rcjBrZEJ0REF5cE1VcDBzUzVoSlJwVHZNR0tQajlG?=
 =?utf-8?B?dUMvcVIxT3lZaVN0Ym1EcXJqbnhUSjV3c0N4UzhrL0dGQlZ4T0VhSjcxZWtN?=
 =?utf-8?B?dGMzbG1MMVlQWkR6RXEyMnl4R0pmMmZTMWxmWkowcDJ5dnhIMERrTmR5b2Jn?=
 =?utf-8?B?WERWWjVuMXFncVJjS2VPcnhCUXVMOUwxd2YrL015QkJkMk0xbHFBcmN3QVVu?=
 =?utf-8?B?Sm9sc1A5cW9CV21CNHdaeFZGNCtITS9Gai9ybytLeUErQlVSNkkvQ3lFQzd6?=
 =?utf-8?B?SFg2dUh6VG5pQXhNU1F1NklOa3J4bkJSOUNzb0xCMng5bDVaOVlYMFRFUWVj?=
 =?utf-8?B?VDFsSFEvR0YxQXFiVU93THRONU1tSVYxRkFIVnE3NmFTM0Zla2RJbVBsZXNv?=
 =?utf-8?B?NjZVOURLOFVCWjZ5Rmx6UVhlZ3VxdnF5Ykl3bVl3cmdFUE9tWk5mOWc5SmVC?=
 =?utf-8?B?Y3BTZkQrUHZZVnhHMjN6QUg3Q0NtR1lLMmtxa1ZhZWtGVlNJd3lTZVVYMll1?=
 =?utf-8?B?SDZIQjNhU3FJdEtkUDJEMERtVWNLN2FoZDkxckt6aU96ckwwaVkvRzNiOWlH?=
 =?utf-8?B?SmNObmd6Nm5pdDZHaXpRWU1ZNU0zaVZhUVV5S0Z5ckdydW1QT0RRc3lRV3Ix?=
 =?utf-8?B?RWlMajBldTJMVGRmbGZGdXN1aHBMR1RrSjBENktmR2lRenFqZWsvTGpvM1Zv?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca0d5cf-7dc1-404d-bc82-08ddbea64239
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 05:05:44.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/Q6JT1c4UjlIfZDbQ8P5xVtainRqFVZaxX82y/2ejb2mtu0UmRrWsof8pVR9u07XkbNDkcUuUMyaiQfXSatEWWIduOlsHFTMibu0r8O4A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_220607_940718_82224A89 
X-CRM114-Status: GOOD (  18.99  )
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

SGkgQ2xhdWRpdSBCZXpuZWEsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDgg
SnVseSAyMDI1IDExOjEwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNy85XSBhcm02NDogZHRz
OiByZW5lc2FzOiByemczcy1zbWFyYy1zb206IFVwZGF0ZSBkbWEtcmFuZ2VzIGZvciBQQ0llDQo+
IA0KPiBIaSwgQmlqdSwNCj4gDQo+IE9uIDA3LjA3LjIwMjUgMTE6MTgsIEJpanUgRGFzIHdyb3Rl
Og0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50
OiAwNCBKdWx5IDIwMjUgMTc6MTQNCj4gPj4gU3ViamVjdDogW1BBVENIIHYzIDcvOV0gYXJtNjQ6
IGR0czogcmVuZXNhczogcnpnM3Mtc21hcmMtc29tOiBVcGRhdGUNCj4gPj4gZG1hLXJhbmdlcyBm
b3IgUENJZQ0KPiA+Pg0KPiA+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEu
dWpAYnAucmVuZXNhcy5jb20+DQo+ID4+DQo+ID4+IFRoZSBmaXJzdCAxMjhNQiBvZiBtZW1vcnkg
aXMgcmVzZXJ2ZWQgb24gdGhpcyBib2FyZCBmb3Igc2VjdXJlIGFyZWEuDQo+ID4+IFVwZGF0ZSB0
aGUgUENJZSBkbWEtcmFuZ2VzIHByb3BlcnR5IHRvIHJlZmxlY3QgdGhpcy4NCj4gPg0KPiA+IEkg
c2VlIFItQ2FyIFBDSWUgZG1hLXJhbmdlc1sxXSBhbmQgWzJdIG1hcHMgYWxsIHBvc3NpYmxlIERE
UiBhcmVhIHN1cHBvcnRlZCBieSB0aGUgU29DPw0KPiA+IERvIHdlIG5lZWQgdG8gbWFrZSBib2Fy
ZCBzcGVjaWZpYyBhcyB3ZWxsIHRoZXJlPw0KPiANCj4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIFIt
Q2FyLCBidXQgaWYgdGhlcmUgYXJlIHJhbmdlcyByZXNlcnZlZCBmb3Igb3RoZXIgcHVycG9zZXMs
IEkgdGhpbmsgd2Ugc2hvdWxkDQo+IHJlZmxlY3QgaXQgaW4gYm9hcmQgc3BlY2lmaWMgZGV2aWNl
IHRyZWVzLg0KDQoNCkFscmVhZHkgTGludXggaGFzIHRoaXMgRERSIGluZm9bMV0uIExpbnV4IHBy
b3ZpZGVzIERNQSBtZW1vcnkgb25seSBmcm9tIHRoaXMgcmVnaW9uLg0KDQpJbiB5b3VyIHRlc3Rp
bmcsIGhhdmUgeW91IGZhY2VkIGFueSBpc3N1ZSBsaWtlIHN5c3RlbSBhbGxvY2F0ZWQgRE1BIHJl
Z2lvbiBvdGhlciB0aGFuIFsxXQ0KYW5kIHlvdSBkb24ndCB3YW50IHRvIHVzZSBpdCwgdGhlbiB0
aGUgY2hhbmdlcyBhcmUgb2s/Pw0KDQpOb3Qgc3VyZSwgUENJZSBjYW4gd29yayBvbiBpbnRlcm5h
bCBtZW1vcnkgc3VjaCBhcyBTUkFNPw0KDQpbMV0NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM3Mtc21hcmMtc29tLmR0c2k/aD1uZXh0LTIwMjUwNzA4I24z
MQ0KDQpDaGVlcnMsDQpCaWp1DQo=

