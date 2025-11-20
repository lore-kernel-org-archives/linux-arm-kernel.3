Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFFDCF64AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 03:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDrbHAeqakxwaVb5OH9Xqsgz6QLpHBbvOedQx3ec/FE=; b=4QZoCk6E+mAfEnVaGVBqyyAfFv
	YLvogOU9pEzPlsP/tppGRwI78kASnkFkruHOaaOjHqr069QX+y6I4BEF7cm4s19FTn1b1nP2r6bNP
	bUTiDZK4jK/ygCzYbY2hwK8X/uyXRZl0AO2eCeZ9ZfKmfaZ8fiLTTN6lJiy/BiT6lRquuDGDgnDYw
	FiKPmaV+vcQKuWtktTdFTgdTTESjGO81kqY11R9Kvai9rAc2ukLAV5gsSEoiInvMWidOar8h9oySU
	8RLhqIDKA+q4/qcaKEhqdbu7ER/sXIJ5DNhcRKqv3b3ePE/jLtVLVFcvu9UjXpolxJSLB1o7F/qbW
	9LXtPTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvEN-000000062ox-3IZm;
	Thu, 20 Nov 2025 03:21:11 +0000
Received: from mail-japaneastazon11023107.outbound.protection.outlook.com ([52.101.127.107] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvEK-000000062nJ-3z5r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 03:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFADnkBpO22z9+RRAzsr6wTONgXcIsbiii+pmiyylij3xDKPe26kejhrdY3bsSDahL28VGXv0LJGN9ghFqr5kF1mCC9JK8iGqRw9gecleGCO2WD1V+gCWvTaDJm04c+xwL0hNlMwh/gnCR4+G2BxdkK+lmcUpDS4Re32bMaKrCTN39p3a4w9Tj6gFy4raWhMie5Joo0dfB57EBrRlTWUXtQZpBtMcP61+pRwLVDFyDGWHzZZm+pATB1NOrErP0xekCrqRjEY5douS6exhfbsR0WYCKgUUqe57+2jbeTlHLkTQ7t5R8iGLeuFmosq4Mhqn7JZpnniIJwo4p5DOIsiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDrbHAeqakxwaVb5OH9Xqsgz6QLpHBbvOedQx3ec/FE=;
 b=QKeXLnLo2FhsVXi5eOTRqryG76QfI/xUtYatoLJjFQI/5UY8m+tbI88H1Tm5fpYPToEYOCcv7ciCwenSez7nTPMNvTCYhHNGLUXKstm2BoTpJJBl3aBrJb7sJ5ga77I73SGvyG74uLrtyZE3CRBpIJfdaQtORTaYDB4xDsUJZr/wa3H0LNfFqnXP0b/IhrIZ/vnGzx15SQR5g/9NuzMYptMdzYy61UZsry/KbzTmtFdQnFm8alsZqbRrodyoebkf6psg6LZww+YRI4G6qRpw76tFIwPEfr/vyq4f1wXR+tLM80Avif7HMW+HAjiMsH/aO6h2sC6U2HrZoAFNJMKoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDrbHAeqakxwaVb5OH9Xqsgz6QLpHBbvOedQx3ec/FE=;
 b=NHb1fyWrh7xeKpF+Xp9h1fRuRYrR1cMv9Em6q+gRB6cgMjNYCqeEeiPJNlYxg+R8pl/XfQI/cl4kvcE+XAakDmYrG3lAczWugejj4qPHr5B/o9QDz7Gpw73TrhWdPRPJLAaPIE/C0UMwCORxB9bTrd7bUmCVi9qEl9pWsKF3GHp5t09GsOd/wegfI2A9ckIgk5MH2xZTgEiNw8nFZVMyfgMfgeFuBQYgfFl9yakdntVA6i0rhF+w85Ciy5U5H/8ZzQOh107Iac5ZBTr8FDfkscgn25O/jsXwDiCllRDIfVI3SaZ5yF+dP3IEBoCqriEyblsm6DZ0XfbHPukzaDTyZw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB5072.apcprd06.prod.outlook.com (2603:1096:101:38::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Thu, 20 Nov
 2025 03:21:00 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9320.018; Thu, 20 Nov 2025
 03:20:59 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Andrew Jeffery <andrew@aj.id.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net-next] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
Thread-Topic: [PATCH net-next] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
Thread-Index: AQHcV5QKJ5VIPaLZTEq71FmUXYXVdbT6WPeAgACQeKA=
Date: Thu, 20 Nov 2025 03:20:59 +0000
Message-ID: <SEYPR06MB51342B45A91BB4CDA4302B519DD4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251117-aspeed_mdio_ast2700-v1-1-8ecb0032f554@aspeedtech.com>
 <20251119-gooey-wifi-413598a8a1d7@spud>
In-Reply-To: <20251119-gooey-wifi-413598a8a1d7@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB5072:EE_
x-ms-office365-filtering-correlation-id: 75424bca-9d57-426e-fa91-08de27e3d3e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?xHW5qcOnbROaV4wm2qhLMZK8HUra+JXyWIzLMBpRU/zjJAn01619msEV1foT?=
 =?us-ascii?Q?e2/9mzZxWs0eW0TMG/sVX9vWvoIItUTZoCsknr0xkTxyrLjHLnz2AuK45He/?=
 =?us-ascii?Q?roXPDojddL+ZoydyZQtp/w2FDUv1FK1mi+MWmviCRwzaRqY2WlAbDRI0+0D/?=
 =?us-ascii?Q?KgK3/qIYhQlytDuyQtdEGjpessGNj2JttEYJyHdkQXJv7LFnSHS9YUm8UBlr?=
 =?us-ascii?Q?BosLBeZaobt8O1Cmmd10F+HoZ3atkuyXuyjzVofBiT7RbrCc/V3kxexnX8Qv?=
 =?us-ascii?Q?i7Xd1cv0GSYcjt0RCbyXj9/ILYWA3+P2rLUwziTWUKZPaAXrv2nDSlUqhjWx?=
 =?us-ascii?Q?pZ/6fczbQGOKm95XZl9/irO2dg0vHy6w58vK0a8o7Kairq847Y0okx3M2BOz?=
 =?us-ascii?Q?UR/iyTfL/NsLRcoyjHc4QAHKT1v/CNfxWbxdu6VcAWWhGE76JmwlbcVhmCEP?=
 =?us-ascii?Q?sQtN5rLd5AGeLy9JnARbWHiIcEGjS9QK8awC7/kq9S7SfhAoqaN1NPERbIBE?=
 =?us-ascii?Q?Ah1sScJAOnooLw0TN4sHOH3O3Lsv+HM4KmUOdg/cHCxWK8hA3MLbByoN1SC3?=
 =?us-ascii?Q?kaDnFS1a/NsCktJaGoiAWW8iIrN4boCBu2POTndZ2eqG2fljDHytdfZcioZe?=
 =?us-ascii?Q?eqZNKdxyDJDe2NgeYxc8urvMdGqZV6ig5OOVlauRL1M6MeD/nn55e5kxHwWe?=
 =?us-ascii?Q?YJ0eFF7V0pJafvh64CwJZSTjiv0QE3DX0HY0LjUC/u6FRCuPwQze81jiZaWM?=
 =?us-ascii?Q?emKO6RTZxvilNGHAzTFsYbb47j0d13NYc55Y8UV6hSOYpLiui4woSm4Ylv7x?=
 =?us-ascii?Q?0K+AQapeX30tT6StMxoYloe5YN9mStv/Ex38Qt4+oDXiRMalei0JD79zV3i1?=
 =?us-ascii?Q?OoU+vrp1duSyjSNRIYedqOBp/tsdOwo5/ekO27XWiAdfAxjfpObtDI6NT3sC?=
 =?us-ascii?Q?iB08RKBhOID1+m3WzM0O5qfJ74VVlDRrLqUWWQDXYmPfy4YxgGz7jlQVlbER?=
 =?us-ascii?Q?6jH1cX1ZC32gL1YYPWBvTbqtmVB4Ar8etNA6YbCBE8xSbjlH0edDiG3/YXfl?=
 =?us-ascii?Q?3Q1J9aw5b6dX1VONBOTCH568Ptjnf74xdIWyQISuK3vZYhJ9BL9xYReJQdiX?=
 =?us-ascii?Q?iH1eY6sKNda+q2F4UWyJYALf7Kpf5M2g+7sZzxwxJMVhYgwq5EjVsvlJeouj?=
 =?us-ascii?Q?07Nj5PTNKY29fU6clO0b/b38xmtwqrS3igNoDS9Taba7fYHT/A02pTppuoV5?=
 =?us-ascii?Q?eFtly7oGPYpeENKhnFEUPJFKBV3eOoHktEA2Z+ueQRqe6OC9UkVgPkwhe6aD?=
 =?us-ascii?Q?d6+SI74LnI4epBCrr8UWGxw2R1COtwZfPsS8gfcsLN5bloB5mVq/SabJI21C?=
 =?us-ascii?Q?DS2Zlg8Esk8hxIhgE5CmRWKivGuosKYk3te9VfTSKE8tK4sehQGhOhxS+vJy?=
 =?us-ascii?Q?2aA0RYUJ4Y5ShZWhHR8N8FhSqEhrEzkHwHY4wxqjvull97v625UspNWimdjz?=
 =?us-ascii?Q?E9EZFEYU7VxdCPDw9c9x4gEKTVcquqCp7w39?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hgf3HEinCmOi0kgZ4MdAGbmfSfiWdxQBUXCn3gowQTsCul/F7n6qo+9/C0zD?=
 =?us-ascii?Q?EU0r4dvnCIIT5K32YeTixi2fEinrdEfGYmhUMRnWFMpbsMLmK/OtM2UaWM1Y?=
 =?us-ascii?Q?36GKX/sPEDo5WamKTRqpiT9aCPvDwI+IhB4Wd4WdPnUM4dxjiM99RmUKTrGV?=
 =?us-ascii?Q?LWSvhlQMYgm7JqwHWEuKd2i+30QIF1zOdnTamjeIik2RphOSgGMxdmKwfq83?=
 =?us-ascii?Q?ODNJWCS31C0ngZ8H32pRU/mX5Fh0XCpVO6cSAUYl1dEZ5Wfsni7QMXfgC4ML?=
 =?us-ascii?Q?u3L+QtU/VxFIBVt7CL6BDWcXRzUmw3p70TZqFCIdbX0X7Gz7Opjhs+tMJVHe?=
 =?us-ascii?Q?q25nEQg0q0gk017cvzw47Ojdz8L+zOPQrWXkXROUfWGeeDPqrdFpJ43Fi8OR?=
 =?us-ascii?Q?djPN3nZZnqmYjw4qYlXPtNAEgo9s4nP4M1YF4pwRuFrzlOGPodjdwvA8a6fn?=
 =?us-ascii?Q?NPfOQTIxRMlGBOH/xO5J1Rsb6UEWSFeAo7tDZMyqD5o0lu9qIlHjh5nhR2ho?=
 =?us-ascii?Q?vvfNgVIj1lwn9U2Ys4W0wsXj6ud61FGlZlFhpoh2bQfo7TD3k4FnARIFEeCV?=
 =?us-ascii?Q?8CiXOpLUfKqGSuWCA57dL1QBtIDJXXVcHJCLURO/Sqs08xuzT0KufElWCrwS?=
 =?us-ascii?Q?GjaaelnGK4yGV2imEtX0OmubgffzDjojdbKaWlMas+5+Cpsk8jHWQyejettb?=
 =?us-ascii?Q?r37r9bIIDUCA77aR6/ldbfo9gRRfCCp9sM4MPufvR1NOD5VlmW74HWnRTHfe?=
 =?us-ascii?Q?Ck/bxd7RqC07ZH9XtAoraTKCjavNIKgIAZ9ZhSUNv3ov7EVBlT3g/Dv4SxoE?=
 =?us-ascii?Q?N9dKVL6Z3iZQSJ0Nr64+C2nv9caF+2btotNT8maa1zPDXzqN4E67X56SyzOA?=
 =?us-ascii?Q?779OFteGU/H+IV4iHgtUngqRqPvUCAw9YiH6YXkfn30vXs8DGZRDZEeJViRD?=
 =?us-ascii?Q?fKZAaWMpXNOtO+0iFY6yX7AFA9cXbyEqt+4QYbPd7Z7AhlH/0rnzMlhwuye2?=
 =?us-ascii?Q?azBMkPawv55YparQCoV3t+MmEbUy0KiwawzvpOq5S2xaDj8LeNVDh/5pow86?=
 =?us-ascii?Q?gKsiGnn1ikRa1n/Gpby/2gIW5DYCBwHY4fHTioek6X1lMdGTGQrZu/TG0vLR?=
 =?us-ascii?Q?XNcTEdGPPa7cd4Cq1dA9n3ZTBrrtMDdh6gQEWFuqRFnOQKkegdmSzWQzV0U7?=
 =?us-ascii?Q?rtPUFTnb/htcCpU4Bjr818w2rKTD8wL2NVwUOEpYD/D7hgOvfXwDzmC/1mOT?=
 =?us-ascii?Q?+3MH3Eblz0YGTjgAx5gJ9gY4NBDbXr7kaAoHrBi2y2f2h2XSQktSXAL+fMGK?=
 =?us-ascii?Q?2uPYy5p6bzVxi2ZOzf/U6O4kuS8EIerFdBhg5lntotf9OJtc28V2F9+j40K6?=
 =?us-ascii?Q?J4+aeoz4XOysPvOqaR9Tm3eFCn5ngVxLQpDNNzB5eJ4yaTnMaFCTmGIEtFaC?=
 =?us-ascii?Q?3/BXHajy1EQM7jus1dUabrm+/ioGaCZHG5llBf6Vfs/P3vnS0DTSqM7cFR2U?=
 =?us-ascii?Q?SXXQ80St2MIdc5dmb/UbMo0vfGWRAp2XAd0dTknhh3+IeyGZWmGz8toAw/Ex?=
 =?us-ascii?Q?aHASaqFQR+ar9m12GjzbwO6s4RMevai/atrOSMqU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75424bca-9d57-426e-fa91-08de27e3d3e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 03:20:59.8613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23o1nxUg7u6MMI0uTh/C31nnNJJXJo/fm2dFcfCPOAEN4xL7azMrczcRV/XjezmjS6hIalFy6K3PFH0FBfrEXqh+dfjk5mrj48KZDqAoa60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_192109_315833_6DBED470 
X-CRM114-Status: GOOD (  12.48  )
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

Hi Conor Dooley,

Thank your for your reply.

> >    The ASPEED AST2600 MDIO controller is the third iteration of ASPEED'=
s
> MDIO
> >    bus register interface, this time also separating out the controller=
 from
> the
> >    MAC.
> > +  The ASPEED AST2700 MDIO controller is similar to the AST2600's.
>=20
> This statement disagrees with your commit message that claims functionall=
y
> identical, and implies that the 2700 supports some extra features or what=
ever.
> I think I'd drop this entirely from the patch, rather than try to reword =
it.
> Remove it and then:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: changes-requested
>=20

Agreed.
I will remove this description in next version.

Thanks,
Jacky


