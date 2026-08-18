Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31AEC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc9isqHF9/2O7cZ5n5dIcPScw1H5VA3a1Q/Hgj9VQNk=; b=lbJt9uL5mWsE6nEG4IPsgFpeA+
	kHvqW3r/JXFNcT4izCkjwg4dmCNU0jCPPIVSksf6HzC9Lqc8d03ccWG0wiVw5yu0lGAXI+LdE6AIU
	VQgGXhlOFsEJZxfGUI8LB6frFqNMcKOPYcKVHIJcskIzqv8eA2hsA5Vo31xMvZSDmSR5pZHFIHZSZ
	ZBr9ovKC0WpRE0bDSA+oF2Jev6SltQTMilKTnFK80lRaFueDJ2b47PSH1rfJZC2/xJDRdBFyxFYcK
	yCEsiohA4mhO/iwG6GA8wf2lV8B176MB0MsIrBj8BvPGgxJJ9I8WS0q09UgXzeubBMTQz2wlbjLjv
	By9H1JPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEjV-00000007UFY-3A87;
	Tue, 18 Aug 2026 07:59:41 +0000
Received: from mail-japanwestazon11022104.outbound.protection.outlook.com ([40.107.75.104] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEjS-00000007UEJ-2BLM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4MypEeGynvC6QkdzJdDj3rdjFwh9pARn3fXcqcmTsLhjfZQELEsR33qP3gHCJQyQPJQycxWZqjP5/paZ9i1LtE325pfJ79UFOLKG7TQeI+m69hGCzrBc2lZEH8sSg73Ull4hjThLw03wVsPQ1DSa80vx9+QPfhXwCQAkRp/hCsj8BDQvGO5pnaaqF8H2lYi4VLQK5+xvTKs3dJZUyDLiBAxSl/40ya9lpKo21XCVmF1Gw0jaV7B1VfHz4pbCIExLDjUjXWyx70ZT1awx8i4gOZkNqjwQFc3ZP/jROHJKyh29hrZp7otIZ/P+rEKqYEpfRaZqjQHB9OlOb+MojxTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc9isqHF9/2O7cZ5n5dIcPScw1H5VA3a1Q/Hgj9VQNk=;
 b=LN2ZFfRLJxgVQRxi5gToPYoFIMgPaPA4AoYqkwSuWKppXiEkW42jioA3KFmLE+4upzoE8yycLKnkXwtTBxTNwuHdCR2P9j5xLGTFeJ6h8FYMBP90To5qsguAZxQY6wr2MY3ZnqtopE4K0f5giNSbAr1OijBgXUuqDa8vuraJ0b7w6VTPjNVbEc5vjDhb4XQKtm0RtWT3LUZgp1E/WOhtrxjcENVdbYkwxC3ADYHVScC7vLDvClEQWlaXee5ziulq0wMUW4D5JTB7zrx5Nh8r5gYayRE3qovxaetXZcF+zQG1BBvSwQYkF2QRp13Vhoiqxs22byceiQM3C2dvBKt1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc9isqHF9/2O7cZ5n5dIcPScw1H5VA3a1Q/Hgj9VQNk=;
 b=lzwGApLmnt+tzp/OunHqOgCjlgCJ8oLVV0IHiLjjcTyLD/Wba9JNWgmGDWRq2TsVlUhJlLUCkDR9Yex+meXWjh7TX8hLhWv7YjT2XGLFlxdd3vWWPoNw11JVPgSEjOqHUaIOfY00H4KkAlFvAoZWsD6Q81MxBYOkdztgtPt+mxOwz6Z+IU5fgRokZOqz7Jq9IOq4kXTQ9+0dlZmFirBKnqGSdDCdwuGOQyhJ8hzhUM+1UdsFSccQNye7vzOJoX+s2V5/v6voawQiv3UqeBgSIVeJ4n26X77oqYoQW1KNXAV9xvfHUvwfQI3DxZcrvYRH4sGPisKIA9IpoJ1LFUvwtA==
Received: from TY0PR06MB6855.apcprd06.prod.outlook.com (2603:1096:405:13::10)
 by SE2PPF74A3A7D4D.apcprd06.prod.outlook.com (2603:1096:108:1::7db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 07:59:13 +0000
Received: from TY0PR06MB6855.apcprd06.prod.outlook.com
 ([fe80::9405:99c0:aadd:7e05]) by TY0PR06MB6855.apcprd06.prod.outlook.com
 ([fe80::9405:99c0:aadd:7e05%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 07:59:13 +0000
From: YC Hsieh <yc_hsieh@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	ChiaWei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard
	<corey@minyard.net>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openipmi-developer@lists.sourceforge.net"
	<openipmi-developer@lists.sourceforge.net>, Jammy Huang
	<jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Thread-Topic: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Thread-Index: AQHdKu7u/dZwahPxaEKnjqQDQRW+irah2ucAgAGcBUw=
Date: Tue, 18 Aug 2026 07:59:13 +0000
Message-ID: <TY0PR06MB68554A393BC5181EFB3BEA3D93A62@TY0PR06MB6855.apcprd06.prod.outlook.com>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
 <20260817-hissing-beaver-of-potency-994d0f@quoll>
In-Reply-To: <20260817-hissing-beaver-of-potency-994d0f@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB6855:EE_|SE2PPF74A3A7D4D:EE_
x-ms-office365-filtering-correlation-id: 44edfb81-17e5-4a1f-f501-08defcfe980f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: JQE4JfykNf5HecNTwQNopH5yuJGRfJOERxEQljETbC8VKD+I4RKz14z39pgLa+G2wWQCmiBPraEz5C0vdObxSn/oSxYGyzOrYj0fLl2NLc1IyWzCjwUFltXI6wIgxoZvN3RhOSK8xlGbo4TEF4mFdjR7PcI0E//ajeFdxbM6ASRKz5OMDCMOkUoSnSeYqgdUJ5o/INrMImFkvqIoyJ2WvwwYyMhZ3F7zHJoAeCf+wLYvGHo7Dfgpgnc59i777iGEmgXRIbSsLei0UTcrP7+Iw7w1Bn4rvTtKk38vHrjS7mN1PRMICJqjkO5N8yAp4y0yf8zZOKWr3MGGj6lEvbmes4+eFwI4pjJiNA1VofNQQ2I51xXiflwBEyIHGt3Bw4dPJPv/awtCglXUTaS/J1pjgtVzm/FaIcv5VRjrPxgipe6i3WVCUVCBesmwQCqrEEUwBAHtoRAySEkX9y4UJpPSsbQP42ZCJSHruGAuddNnFKo6g4pZfI5HLXrUx/MNcoLaHojUaHYf9Zs3/WVicYSDk8oiF4UYeXe0w3NHe6Yv4fkvDDtMCbDy1ynnneaCu18UNrgnoPn1rabv298oGXPDxZWghjBl0UX6fdWxeHQVK5Wptu5+cZ5mXn3FCyuoI93KmrH/3OMESdrLo+fQD2t7X72rQ1avX6DAumSj5aFLAUia0TyYwfxetn8QPD6/xgIG8hTUaT3ORHIfYtVEKVOcZbYbYD4g/qKV1ZS56VvTlB8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB6855.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OQ+oz2RVjEBexHn/Wi+ug7kgIdOsreQDUuQbRHKjXAmpW9lQOpwrL+OzgD?=
 =?iso-8859-1?Q?o1EPXK7VW/Oea3b9bEcjQsQFGRQkPUTR8gqIBajiPY6ruJebHr1MjKb1aF?=
 =?iso-8859-1?Q?xOZAn/0t2B0yeKYH7Jf9XnwmrEh2ADRZdSzF5nEYjRwRQ0nY30nEHfY6ty?=
 =?iso-8859-1?Q?uIZI5MbPkVYPbDwpbgDuPMCBlkKfvVFath3w1SkLamEpbqZuXcGAcxKJHN?=
 =?iso-8859-1?Q?iJrtvc8J/dw1M8rKpj+Stw/FTVARHbWxOGj7HiCgkAPuWQkpkrv8eGGSpB?=
 =?iso-8859-1?Q?MEFF4/9MwH0uNAvJEYhY6Fkf+PpNVKGI6sGi28mUtlu30bscjjW0Q7mDtT?=
 =?iso-8859-1?Q?p7lXBYvGmJ4X1poes/nidJ9/9qaalP++q43Xib/6qzAhQdQn6mQWBuqPbP?=
 =?iso-8859-1?Q?HCux/9BM+FLSpyMBQuF3Dil/3v2kuJv2vTem0Uq0fu/tJvvtsy2AIO1eDX?=
 =?iso-8859-1?Q?BauJWUXz+f441BBlJKDIxOS5rZ2aQKbw77Ep/6YQXi0W+Jv1IGUXI+8y/v?=
 =?iso-8859-1?Q?1sOSlkZABC7VazM2pvcKzBNyzoLfmZSRud13SeWMym8/DwmsXcoGB+Sx3C?=
 =?iso-8859-1?Q?l5XLyJ5W1hn1nKzDz7kX9+vNTUx+LtajnreL3dUpG5vMqKOyyjDKMW7GG3?=
 =?iso-8859-1?Q?QFlU9tWTiImY6mfF8GUip0XaivDOVvZZ/+Po/8e056+cjUNmFW9cDyY0xf?=
 =?iso-8859-1?Q?V1184H0PTF5LiVgQr8n48eqqtZXPEQpc3cw/8jK+USLsZkfI8aywqWte0R?=
 =?iso-8859-1?Q?E+wWU2PDJyhEIfQvOvMINw0KZ1xtko/VHG1hL8YC5E/N5fxKXZuhPGF/jn?=
 =?iso-8859-1?Q?9zc5QQH7D7vfVM4u9bUvebeA6y9suxh9XdLq9KhrLkoSJxiKSPSG+Uj0Qm?=
 =?iso-8859-1?Q?t3I4Eo7xzmSBPEAvI/QEWavgdiZolsZ16PPCUcG3s82T1bcFAH5bny8tlw?=
 =?iso-8859-1?Q?r1fSA6/KJusCCyFnqq9HyTro+1ttMq2l6VEArb9LJbr3sNO0pnlxBM/ArM?=
 =?iso-8859-1?Q?0gWWzKLzAd5vqfFaz0A+NzS4slKXW9yW4SDLlpkoawANngyFtpIf9JpfQJ?=
 =?iso-8859-1?Q?SQVBlsn+64iNnCxuUinb684Uj5610EBqH26c5lIV4q3jrtOjWn6Wi3Bzn+?=
 =?iso-8859-1?Q?ZhEUQ+wPRIcpebgF8NjFb3XwAZdPSEMeoB3r90jSqZornGUlw8rm70T+Yx?=
 =?iso-8859-1?Q?T7nKl24E01HHL9c1P4v7PpnTxCekZmZ5xxjEl8VzxWBvWohmkCAOwseAS+?=
 =?iso-8859-1?Q?Ka+7NMoGVvFBxtiVyl66tw+kKVCYVulbH4m9jGad4iDklh62gUYfsUfqxC?=
 =?iso-8859-1?Q?R/3FJtlj84Pqq8UUee0WXQjm/KkKC+7layGkEz/Yzy+8UWDR++XTG6hMxN?=
 =?iso-8859-1?Q?8/QrDaohhobK6nhGZzjHrR1N6jixTau1KUxau4/WNCGPGg+J8moz1un/Lo?=
 =?iso-8859-1?Q?g4dGQUs+I/23v11D+Iv7nodhkbAvg11K5FqCUjGv0kDOF0r2U4ZnyKJLqj?=
 =?iso-8859-1?Q?7F6WQ2I7Nr5aPB3jHKW/qBVoA7/na6d+FKPms52GqtGR3JQvb9cE3x8ung?=
 =?iso-8859-1?Q?X9fk6yrEjWlnmlL5/N7hojRQYt0aI3DI41rFCiRSeOE6dUUMdUom76BP8x?=
 =?iso-8859-1?Q?hWw4f75VEDGUhe5l1jBBJCkGeFO7yWjsEh+oTjoga5RT9XfeB+wwYhoR0e?=
 =?iso-8859-1?Q?1PuCr33WQxC5W98iIqinJSw+Ywv6ZS51fXlXtr+1iH6Xw37X2QpcM+lNjS?=
 =?iso-8859-1?Q?nyTf4pQEulLB+/DWZKylyya4vE93nCKzRWTL3NQFswxq/WBLJt215QQ9ZS?=
 =?iso-8859-1?Q?VM3DnYxVLA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB6855.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44edfb81-17e5-4a1f-f501-08defcfe980f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 07:59:13.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNg9iYrcqhALZMnJ4JJWwq6OOj1XpTyIBn9T4ze3Z5ot5mGfIyzbvLrIvnRlPV4iTQ3Hm44s4txT/W3eISmv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF74A3A7D4D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_005938_564788_FFF9454E 
X-CRM114-Status: GOOD (  10.70  )
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

=0A=
On Thu, Aug 13, 2026 at 02:42:32PM +0800, Yu-Che Hsieh wrote:=0A=
> > @@ -526,6 +528,17 @@ static int aspeed_kcs_of_get_channel(struct platfo=
rm_device *pdev)=0A=
> >=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >=A0 }=0A=
> >=A0=0A=
> > +static int aspeed_kcs_of_get_bank(struct device_node *lpc_np)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 int id;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 id =3D of_alias_get_id(lpc_np, "lpc");=0A=
=0A=
> NAK=0A=
=0A=
> You do not get custom aliases.=0A=
=0A=
Understood, thanks for the quick feedback.=0A=
=0A=
I'll remove the alias and DT bindings patch in v3=0A=
and derive the bank index dynamically from the LPC=0A=
controller's device_node during the initial probe, =0A=
so no DT or binding changes are required.=0A=
=0A=
Regards,=0A=
Yu-Che=0A=

