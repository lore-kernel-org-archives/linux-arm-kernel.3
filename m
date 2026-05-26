Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B87CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 05:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqr5HK7fPNRFJtyD36b/8CmB3cO19aVrDoUmGzRHfYg=; b=V3njRfTD5qtD7FOii1nBxv807O
	GyFy0UYbnqBPJRJFpcpbNTjzzfPm9AnTl5Lw0HSnMDGJkGqKavZ8MHl2M3AWHW/Rkv07Aam6mojZR
	trNOto0soWJDvyJvWkvQ8CqEW6S9gH8opuXjlJCKDa74lHlf02/v+zaeHm/RGhaa85GWHEiSR02Gm
	aP/lYaYVs3/WeUYXc5ji8p6v74JIeyz8E9BwIEdpSU3DijkB/Q6Y8pk6/gY36IUzBv/abuhXyl+p4
	/DT7OocRCZdgInt9Tb7vo9znoQqGl7gtzdG++IhiVy4fLg2pjb2bNByRap2QIJwZP/c6spwGzJcRN
	zOin/1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkEJ-000000014Dy-3WHX;
	Tue, 26 May 2026 05:21:27 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkEH-000000014DL-0epi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 05:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpWoFX8bFONCcsOhgUTTx3Qd7pow5OaywrbjYfY0gEDxXZfuXy5Zd5acVSWeCBSC1SrC4pytgdxBdzZGSNDBlxa27Mu1b8OoOV3H6+F0bNe59C+jg/Rcu6QAfck0E+WFIBcN2E+UpYiqmYxtMFStFaUJBSAh17w6YzSUcn5Y73ySjw0hL1nUewGFqxNYex5XMOxUE3QVHyz8rzWf89snNNl3FxL2vlDFWPtsFqlqvU2T4/g3ylkcL/6COLJNzjwYVfjT2ZmWlIjmjR4kepnv/cIyes/seBZKYssV18odml+Ti376jBlolIcX9FW4KNXh7ou6h22zRbdE8UXgjhS3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqr5HK7fPNRFJtyD36b/8CmB3cO19aVrDoUmGzRHfYg=;
 b=UfJn1y6yeYD60Du2ObljscGjY/1S4s3dWtlNxqAR7gBAbumrAj57ZtEq5MqAko3clARJZUvnylaua2CrPVixu4EhTcmxv+l1AGyBPsWPU7OYvdmlwa3q2bKRm10kZZkPiDqgwB8q2Xl1vY1cOQC6WHhTxOQIpYLQ9CnEQIJx3jNgm9XzUdl/na0PTv0rdqACuPA7c5R81LxLsHuIoxPoPngDJsguQirwIdiuSluV78L9K4LEAwjZv4ByvI8A/VMKMmacwGX5gamd+3yzCrOTkMAJEFF7wlSSVFXwe+BinxZ0OKHrYcRfTZZLjtlzHKq9AujpHQFLXrV02n/luF3Eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqr5HK7fPNRFJtyD36b/8CmB3cO19aVrDoUmGzRHfYg=;
 b=d9i/FGI4sWaCJ7ieTKXEEBDfz+SBxhm+fP7DLtVESSY7QSUB6Ypl8yGgWD+R0F85X7xoPwXGK/Gp0GcIsc5WUxMZnDMsysVeSKu+RIK9JdeZCcaurrdi1SNZRjvVl//NQnFJaDzBkzUqPfFfXijOM/NPbs/MQ+axDFVE3nlwoUpgAtHLSYMpgMXQxRRR8QYOSsWb5QmwlmS30K2nFLYfm0sslhDSzCamRJFSzdo4a8+AOiy6qkbHMnpfmG9lHeykaPAcgB+jxIpX2Qc9YxLGw581G4gfxjTLUvf3RLsK4HZaopb9M3Egv3vPnUk4hFj/4+Dl+wtTGF2hFr9E7GN0DA==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB989270.namprd03.prod.outlook.com (2603:10b6:806:4f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:21:20 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:21:20 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: Improve Tx timer arm logic further
Thread-Topic: [PATCH] net: stmmac: Improve Tx timer arm logic further
Thread-Index: AQHc7A4Vc3yflw27/0+TxDAE53/a+rYewa4AgAEFKoA=
Date: Tue, 26 May 2026 05:21:19 +0000
Message-ID: <15badd19-15f2-4dea-a57c-334baaa66637@altera.com>
References: <20260525061653.22548-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <3766daef-80d0-4657-935a-579bf17a11d4@lunn.ch>
In-Reply-To: <3766daef-80d0-4657-935a-579bf17a11d4@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|SA1PR03MB989270:EE_
x-ms-office365-filtering-correlation-id: 2ba7f9a9-1f1c-4387-7811-08debae69ea0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|55112099003|38070700021|4143699003|11063799006|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: qzIcq8sSUkcrpfBYuJbWSqMAZgWXZqAYmWRT+LZ8Hog81tHEBJNf33klIa+LmQqC7Mljp+EEh7rmVOrJJ9Tiu5F80amfGf2O1jps8scFPqFmZ/Oid/LZLX9CLf5QkzNYezYKNtPfD2ohK749p8ESzCyTE+M6BKlhPL4hw/2e0TQlmYKWKHlzgJp8tATWzAC7/98ks9ddxXUeFGzPp4S5nZ4c10dkVrARPpnEOBdplJiG/bxYPDLdueJVKEMr1tbTw9IUO10ckP0+vY5wijKvVkvVvxCOgM6T5HQ3JVGjG702RyMYHieLWd+iQG34N0JzOOs5ABl5BP6HZwCeA9cQAfvMmkGfnGDHqo5F8qs3eDtbY/FdvpI2jUDdS/SaWTT0ck7lg1Rsp7WXK692ZhUlpIzC4+TyDseC7/lu0wK+pwRvd3/AwJ2+cZdEiYHLgPb1/AcCk6/U7KkYTVgqfKG27sah8fqK93QP7HPhb45Y98rrAN4MpnuVNSBBOrAnCCWxXTFYFvVTQmCcPYB7SOZ5nTKh+jTflzA2weIQRoXlECqRAj49KT0nyTtISHQGUzJ+9KBdtEMbaYGfne41s0AL19LnToOEA9SyDMAGhJLchlmdSELCwPm9tjGDUcRIfrlZtgOGb1M6/d/gNkMZf25bE4Z7/J2VzSXyzvDJTqgZPPlidUHJZwQk57z04JDjkNggQ2LASwTYJQLfx50y1LAmx1ZVw6ZJQU3wOFpCUql6tf1qo/cgpmYsBDz/YlW1qXRo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(55112099003)(38070700021)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDVYYkNINWUwVXhFbWFrNkQ4QnhaVXdGTU0vVFR3OGtjVTNzR09GbndQY1Jq?=
 =?utf-8?B?MVpvNXNlWWptZzFLWEwxRWxub09WcHRKYWNvVnlNeHpxbCtmenRnYUxVeUFV?=
 =?utf-8?B?ekZCWldWa082a202NGtJVXF5Uk4vbVJiRnBxNlVNdlI0Z2NUVGlpSU55OThC?=
 =?utf-8?B?Qi9lNFg0b0wxSHRTdEhHd0hJeTRUMGUydDZwQUVSem9WZ3UwaUdlRDh5emNK?=
 =?utf-8?B?UHBQaW5XQXZQSUJGRWk2cHptaCtQeHc1M3ptSXR2RGpZQVhKanpycEFjSGJR?=
 =?utf-8?B?ekplbzFvclRYRi91VFBOTlE3Mmp5ZVlHSWQxVll0eGR2SEUzdUhocUVKRG1V?=
 =?utf-8?B?dnRpVzBWc3l3RjUwaWhHbnBSY1JQQWRWT25vaDlHUDRwT3JIT0p4SUdZelRn?=
 =?utf-8?B?SGlFVGM1ZlFCOTUxWmhjTHZTZ1BSUVJwVXlBZmxGNWtkc3FyYUp5RXFmb3hL?=
 =?utf-8?B?OWc2Qkw5cGwybzJvR0d1S0pBT1dERW1nQVpRWW5WVzNNTzd2d1V4MDFhb2FR?=
 =?utf-8?B?SklTVVhSdGdCekl5TndQYnlrajhkejg3QnhEeVZyY3FmYUw0TzZNRU1NTFBy?=
 =?utf-8?B?OHRUSHlPeXlBU1FmeDhzL3lvbUIwMU5sU0wrYlV5ZEJ4WjR3OTlkRjdQM3VK?=
 =?utf-8?B?aDhvNXp4azlqZ2l0ZjNmWVFWRFZ2VEpsMUZIWmVPdWxPTXdPVVVsa041b2dH?=
 =?utf-8?B?OU9ScDNCeGUyNGlpTGZQd3R4NUlLOFRnQVdFbTVYOVJlL2QySUpYNzRyTllD?=
 =?utf-8?B?TytZZjVTamhFTkpKV3VOK1BaN0VCRXN0SzluS1RnWWMzNHpMbnJkUEYvZDNv?=
 =?utf-8?B?dG1PYS9YSkNFKzlOeExDNVBHTXBiYnpNQWRyemlBU2xESGdUYkJlNCt1ZUd5?=
 =?utf-8?B?QnVmTjZEWkJiRzU3SUVDNmQwNUVsakg2cWt3czdwSEpPU1JKVEMzcWFza0Z3?=
 =?utf-8?B?dXNrSkZ6a2JCaXhyRDFSSndzc2ZMYlovZHkwQnlqMnNQQ21LQ2ppSUdwRW1w?=
 =?utf-8?B?TmtKSDFtM3h3V3JleWlRdTh3MWhEQS84QUk3RjNZckZQYkNrTnVGV0U4cW51?=
 =?utf-8?B?T0xDUUtZSXo4NkcraEJLZk5WTUpwR29WSE9CSHFJZk0zdW8vdjJKbE5jYmZS?=
 =?utf-8?B?NHVTS2k0YjdYZ24vOHFrYUZpY1RhdGNIZytmUm9IQlU3VUZPMWt3VWR1Vk1Y?=
 =?utf-8?B?VGxERzRBeStTczhvR01GUzV5QjU5VDU5Q05Pa0MxWnhQclpwZTJjMFFyUmFa?=
 =?utf-8?B?TFhndHZlbi9iTUprcDd0dEF4cFFHTzRDemtsaHZKTEhJQlV3KzBMcjVId2JZ?=
 =?utf-8?B?RUxnT0IwTnlTM210ekVRVE1hZlBsNkROVkVvYTJMejN2dlhJWkI1ejVuQmQ2?=
 =?utf-8?B?a3oxTXFFbGkrUmw2QzdiblNBdGp1Sm42MHBaaVFMeUVrR0hKRmJFQTZTMTdO?=
 =?utf-8?B?OVFFVHcyZk1TbGlPcVVLZU5Zbk0rRitsVENXdHJBT1p0M2srOWc1cTUxN1BL?=
 =?utf-8?B?dE0vLzZ2ZGg2cWRSMzYwRVpHUTBiOS9vRVg3aG9MV0NiY1ZrVC9xVTBVdzFW?=
 =?utf-8?B?NlZoK1RyYXlaa3RldHdWd3poQ1VXL3lpQStyMURJelVyQkdyNDU0RGlqUE5r?=
 =?utf-8?B?ZTErTEthaTdhYUcyeXZsTm53cmVUMGlDb3RXMmRrV1JLNk9xekZvR290MHpY?=
 =?utf-8?B?OG5MZGx2czZDS3U3UzlBRFhzZ2tESnZ4Ujk3TWU0MGZURXcwWnFvbHhzMkts?=
 =?utf-8?B?a3lncjlveHpEdWkyMTMrZVI0WitSck5LaXV2WVdLbkJzTjRUN3VSTzU1OHZ1?=
 =?utf-8?B?eWhyS1BGNmxjenEyK0djYmROTExOVDBRWUNabzE5NjBCWVVhdExaMXF1ZDZB?=
 =?utf-8?B?MWlhRWRBME5zVzVhYWkwNkVlOVVvYW5BaHZ3SkFUbHZDV09pbUtyR2RQRXFX?=
 =?utf-8?B?Wkd6VTlFdmhYdE12NFVrL0prMDBxNzQrMldCVG1yM1FkT21YQklMUVlmeGNu?=
 =?utf-8?B?bTV1SGhFT0VUME4rR0lYVkRYOW9CbGk1VEdYcHVtSGFab2ZYeFhWUTlWRmZP?=
 =?utf-8?B?SUsxL0o5eS9TU3J1SmRNcFFXQmx4T2NoZHdTWS9pemNvTk5xRFFZd29iY3V2?=
 =?utf-8?B?MU1pTDJoeENzYUdwWlF1REgwNjNhRkRtaTc0OGpmblF6RlZRZXhmeGlnMnN4?=
 =?utf-8?B?RUtkNSt5ZnhnSlNiMzhoQjgwc08xQS9BOXllR0diQS9MK0Q0L3M3dGp3d3Vp?=
 =?utf-8?B?ZTlkRS9qelBqTXJWd09kaUhSM2VhZ2RSTy9kNEltcXVuaXdVOUpOVkpFUHph?=
 =?utf-8?B?eUpKcjIvOWsrK0lrdXF2UjdMcWpJa2lFRXZUdHlycEtHb1NreFl2MUx0eXVN?=
 =?utf-8?Q?Gv02cLZlMruVgsD0f3gkq96HCIc2Eljle9s6ojvqImLoK?=
x-ms-exchange-antispam-messagedata-1: h1Lhb9opcX0oeA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <79AD26E532ADB14AADFBD37FFDB35A2D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba7f9a9-1f1c-4387-7811-08debae69ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 05:21:19.9557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79LpqjMvgSjwtBK7rvPqJyMXvmfhpGfQ8OHrifCHjEQe+W8QNWsU7d3rAgGx8pN5oBT9dLKl1eEsIu6s+ktgg3gFR2AtbrkixIQ3L9FgRoTKqHpTJSUH80+XYxvP4Y6b5VqB4E3K3QYdFWplHxad4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_222125_237243_F1EF4519 
X-CRM114-Status: GOOD (  21.92  )
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

T24gMjUvNS8yMDI2IDk6NDYgcG0sIEFuZHJldyBMdW5uIHdyb3RlOg0KPiBPbiBTdW4sIE1heSAy
NCwgMjAyNiBhdCAxMToxNjo1M1BNIC0wNzAwLCBtdWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUu
YXNtYWRlQGFsdGVyYS5jb20gd3JvdGU6DQo+PiBGcm9tOiBOYXppbSBBbWlydWwgPG11aGFtbWFk
Lm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbT4NCj4+DQo+PiBDdXJyZW50bHkg
aHJ0aW1lcl9zdGFydCBpcyBjYWxsZWQgZXZlbiBpZiBocnRpbWVyIGlzDQo+PiBhY3RpdmUuIFRo
aXMgaXMgdW5uZWNlc3NhcnkgYW5kIGV4cGVuc2l2ZSBpbiBzb21lIHRhcmdldHMuDQo+PiBUaGlz
IHBhdGNoIGF2b2lkcyBjYWxsaW5nIGhydGltZXJfc3RhcnQgdW5uZWNlc3NhcmlseS4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBHIFRob21hcyA8cm9oYW4uZy50aG9tYXNAaW50ZWwuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTmF6aW0gQW1pcnVsIDxtdWhhbW1hZC5uYXppbS5hbWlydWwu
bmF6bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDEyICsrKysrKystLS0tLQ0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFp
bi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0K
Pj4gaW5kZXggMzU5MTc1NWVhMzBiLi4zNWRhNTFjMjYyNDggMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+PiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+PiBAQCAt
MzM0MSwxMiArMzM0MSwxNCBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfdHhfdGltZXJfYXJtKHN0cnVj
dCBzdG1tYWNfcHJpdiAqcHJpdiwgdTMyIHF1ZXVlKQ0KPj4gICAJICogVHJ5IHRvIGNhbmNlbCBh
bnkgdGltZXIgaWYgbmFwaSBpcyBzY2hlZHVsZWQsIHRpbWVyIHdpbGwgYmUgYXJtZWQNCj4+ICAg
CSAqIGFnYWluIGluIHRoZSBuZXh0IHNjaGVkdWxlZCBuYXBpLg0KPj4gICAJICovDQo+PiAtCWlm
ICh1bmxpa2VseSghbmFwaV9pc19zY2hlZHVsZWQobmFwaSkpKQ0KPj4gLQkJaHJ0aW1lcl9zdGFy
dCgmdHhfcS0+dHh0aW1lciwNCj4+IC0JCQkgICAgICBTVE1NQUNfQ09BTF9USU1FUih0eF9jb2Fs
X3RpbWVyKSwNCj4+IC0JCQkgICAgICBIUlRJTUVSX01PREVfUkVMKTsNCj4+IC0JZWxzZQ0KPj4g
KwlpZiAodW5saWtlbHkoIW5hcGlfaXNfc2NoZWR1bGVkKG5hcGkpKSkgew0KPj4gKwkJaWYgKHVu
bGlrZWx5KCEoaHJ0aW1lcl9hY3RpdmUoJnR4X3EtPnR4dGltZXIpKSkpDQo+PiArCQkJaHJ0aW1l
cl9zdGFydCgmdHhfcS0+dHh0aW1lciwNCj4+ICsJCQkJICAgICAgU1RNTUFDX0NPQUxfVElNRVIo
dHhfY29hbF90aW1lciksDQo+PiArCQkJCSAgICAgIEhSVElNRVJfTU9ERV9SRUwpOw0KPiANCj4g
SXMgdGhlcmUgYSByYWNlIGNvbmRpdGlvbiBoZXJlPyBJJ3ZlIG5vdCB0aG91Z2h0IGFib3V0IGl0
IGVub3VnaCB0bw0KPiBrbm93IGlmIHRoZXJlIGlzL2lzIG5vdC4NCj4gDQo+IEFsc28sIGRvZXMg
dGhpcyBjaGFuZ2UgdGhlIG1lYW5pbmcgb2YgdHhfY29hbF90aW1lcj8NCj4gDQo+IEkgdGhpbmsg
dGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIGV4cGFuZGluZywgdG8gY292ZXIgdGhlc2UgaXNzdWVz
LiBGb3INCj4gcGVyZm9ybWFuY2UgY2hhbmdlcywgaXQgaXMgYWxzbyBub3JtYWwgdG8gaW5jbHVk
ZSBzb21lIHBlcmZvcm1hbmNlDQo+IG51bWJlcnMsIGJlZm9yZS9hZnRlciwgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLg0KPiANCj4gICAgICBBbmRyZXcNCj4gDQo+IC0tLQ0KPiBwdy1ib3Q6IGNyDQpI
aSBNYXhpbWUsIEFuZHJldw0KDQpUaGFua3MgZm9yIHRoZSBxdWljayByZXZpZXchIEkgYWxyZWFk
eSBzZW5kIG91dCB2MiB3aGljaCBhcHBsaWVkIGFsbCB0aGUgDQpjb21tZW50cy4NCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyNjA1MTkyMS4xNDU0MC0xLW11aGFtbWFkLm5hemlt
LmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbS8NCg==

