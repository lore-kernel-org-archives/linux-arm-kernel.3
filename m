Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4E6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=; b=LWcCHclX99Wn5T+dakGqb8m572
	arTPV0fQ0KQLt/BQzHCPNxdfbhXXakhfWSmy9ckq5PlxdmGko+Mv1PWDhiSJw9Gd6lFWGfWNbIvkt
	EAOeUx7CWTzrY8mphul2UZy6rLBl62em9dQYOEfJG3GHjLeEEc1+WDjxuDuUwVHiNlVH+yN6DYeS8
	ZnyezR7kKa4iAdUNnUQ3VTav2lCQ82tGJ1hoYm3/jjJ2ezKNb+S9rxD3hggrx4lM5bzWbBjBbwUiS
	B5KZrykRysyX8c6kLQB/Q7Fn678/5UC8UlLMQX/PGEkHFCSufPUwrQNlxOqJ/FgQLRQE507PfUwZU
	fA9cposQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo9q-00000005CZm-1BDh;
	Mon, 20 Jan 2025 09:33:22 +0000
Received: from mail-dbaeur03on2060d.outbound.protection.outlook.com ([2a01:111:f403:260d::60d] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo0g-000000059lz-1i1z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:23:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umTWaGh1aa2l5jgFc9zwDAix5ubnFlEmnpUqd7vaLy84zCYa9U92lHy+IPbwE20kePu8ztGA4kj5hhscVb+kucMU8z7BtZ+PxBLEVmNyLw+v2+2hQFfA03kRRHe3bFKmn/CeGNFD7CIl2klc1AgHy2gRlC/3NY0pNRmVYtBnN2GMrMsvojmSPtGwHPWo/5pml1vvJwL38QOEZqpvDI8arpq5Amg98LKNhbWVcOuE22VVpBXsVxegFCJZcTaqsu5olX/tCxNJX4XvolPhnR4byH5GtmH026XjRCaiMW22UW33T+h/DMKewyuOX8M/mxiYpZTpxn8LYG48MPm1NoqbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=;
 b=yNdDFq7rTNHOBdZQkQmIWi2aLGg66NqJIt+VuHVuIb9PTOpvc57wTdileAghyCYPC/AM6LLO/ucV+XJHGF7Wl5ZA/1bp9OdYS37X+PGehyPkAtzr6angE1ciV/64OxXVNfC6EFLhT4ljWXYqHtnHigV0pzSfgo/mc95bh1oRkBnmBs532eNDICEXqd5yxJbUvQnsKhWnhrSMJu/MPodK3lATqYS2z9okYSce6gj/JdIDSjawiQxtuq9q5T3mAY/4NLspuyAdwk9fGE2mp7guy00UwaJuHFn01Cqry8/Sgo1lwuJWrblZp7eqcBpFjh7FLfzYN5JfH0dOxGJDtVQIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=;
 b=MkdP0NChYYsVhfjHW3FrBHQ21v/JEbXE+A96+OKjToEomoj30DPPAQ5qXosNnfoLK8sKkhxB4QZgdZ4nJAIoavi5LXofA5sDZHRixFeEWSJhT51aK+fxd8ZoDMx9d50bEhYTIYjlozloXwXy/zxxWN5p4JtCg+swRWQHqy7bEctYOWF5h1W7obx2OAJAXE1+mH4MrQWh0L9P6ClpkE7aPiqgXrorGRvz/Nzob2oG6aYLtjpcWnPeuStDivBfe80yt3yYPCqPdr1t3aBDpuBa9UGXaZ+ynYa0P1wBndjHAtU9ammQCXqZjgjdoGaj8vj4s+XJpJR5W227dHXjhGI70A==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 09:23:51 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:23:48 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 7/7] ele_common.c
Thread-Topic: [PATCH v11 7/7] ele_common.c
Thread-Index: AQHbax0C6Rk7lyRvvUGTCgCMWctdkw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:23:48 +0000
Message-ID: <AM9PR04MB860488F4796E84250659BFDB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GVXPR04MB10731:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de034c87-12bd-4cad-5850-08dd3934257d
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?quLxj5n3yxpKv7V6vnk7CTtjy9+xleTgpiMTtwweM1/UVCffBseOatcYdtr2?=
 =?us-ascii?Q?fQXJizORXvPyHDY1K/ixI4qQQoBoEVa3UgAWX2B0NAzu72ya6IYrwcFciaya?=
 =?us-ascii?Q?UwZ3mh8KnmxErkaPBaCCL9NAipS+2xWcrat1GsPraHaRtPJp+8+YZvKu82o/?=
 =?us-ascii?Q?aQsx9LXJFd6Nt1WfZRWM6JYwrg4efsEpXKhcVaoIQDTCHi4Hc+9/5ywFzCeT?=
 =?us-ascii?Q?K1DAgEonoJggbadjKt1TGXG4edb0jtoipi59MDls/FAQUXqeTDSL/jf6FYsE?=
 =?us-ascii?Q?H6xdpNSPjOXQFQf2lQA5ZUTpW16+8pwDsJFzW52gHbBG0X60LnA2Q8s7LuZJ?=
 =?us-ascii?Q?uv9u1b4VGD60zqCoYz2r0GwWN8nKZ/Si+fpFLgRT4jm0eIRL17G/wkjbHm+L?=
 =?us-ascii?Q?ffof3tDJ5GjJhAFbUhUBEIiLG4hYMs5J81wz/qf6a3JppUnJcd+4lhzMlrNs?=
 =?us-ascii?Q?0PXih5vbqvYOZ8WJ5vAPt8fix6T8++ZcYkv+7i9y24x/3J7Ur9sqv2jA8KIH?=
 =?us-ascii?Q?Opkt1fN6FKzC8hfpBUbfxIYC8WdpSjjDhk1Nwfkhr3zz62xDqUq6iC/yfKtQ?=
 =?us-ascii?Q?iVfLtag6DNJ6DcmTAyxP4YDagYnFb8xzJOm4q8xVyXjjkWJHFjaDMTmWcvG7?=
 =?us-ascii?Q?1fqslP5d/c+rWNRxn8qgzLOkB7y2uI9gtGgt5deCwJ8VoCpKljb1/b/J+7yu?=
 =?us-ascii?Q?3+R77uU32FXiffEVOLPOC5Z7NnSYVjTo8Ye/9//PK1kSXpMm/5n0c4HMcop5?=
 =?us-ascii?Q?O8yk85dIALxIv+P5UL0Q9kp3YfEFuTvbcnYWYO51JkVzZUsPIJ8urCweZlOM?=
 =?us-ascii?Q?0sE7uHt73rokaREAdqCWdt10gVT5cyYDQY/HkyzVQZzr66qdsJK6pwqNVsX2?=
 =?us-ascii?Q?uh4y1IQAXfBcFonAKxOZZo4MnsFpIgovPlJc3ZRfeHNhlPXx+U8+Z0FPLuOR?=
 =?us-ascii?Q?9QRb3aiAch0mB9xp8e11s6oaL/lu4lvhlvbBofCJjdLm/z/XpeECGU2px0wL?=
 =?us-ascii?Q?UjEUSo96vmGRJjTJbDGiWAQ3NjBQeXsEqjfzTE5pg1biP3Dv2yMDlv8NzuH6?=
 =?us-ascii?Q?KqH152pm8RGUE1xfzvT8qi724LdOfpxzdQoWaMorxIOeZdfd4sMRjjJyxyPT?=
 =?us-ascii?Q?U+Ek0G+FiZHz65MctDF292RgIPfj/EXsBNZErxvx5dRpe5jc0/uInalFl684?=
 =?us-ascii?Q?J31zb+ioG6e81loMsq0IHe2kDFLPLizee69Bt3JahKBTnGAsW+aw9azPxf9D?=
 =?us-ascii?Q?tq1D3g34iPG4SpRgEZ3jQkfna5PA3O4kmwcVHQQVm6daMw54xg7MCdtWmHRV?=
 =?us-ascii?Q?brBRkYAYohRZk51i2ylXEs7mre5/3gEFkdZwG6XSnzEtllUjNVEhs+4frVuY?=
 =?us-ascii?Q?0RN493snBIiMIu7A7x6RbommTlDB5QVaYdYikn1vNTDdAqC8IL5HhBUunwwy?=
 =?us-ascii?Q?XZA9xtQlqWhVu1RAB92Tg1fNuHKcrydr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qpv1zl+IowRQSt0W3UYUe/3wT2Wal+UNJAw16Blb/j6I4fttOPfHbbAYUPYu?=
 =?us-ascii?Q?/labVM5csvkNsVLb6KNLEK19pxQwcwwOpKl2mNcQ3ieZzL0wjcHoOY8cafly?=
 =?us-ascii?Q?yAvxD6k/Bp+KBJVbyPiMz/IDXyJ0fgl2jMMPN89qm1+bJvQyvu3bX8BBlfRr?=
 =?us-ascii?Q?T5RQEoEdMpOkAbb7mVdAgSs0j0uP1tJ1gSstr7KFwLAmOKNL8Bb1IUMNpwAH?=
 =?us-ascii?Q?zGnvJl13hGddbZUryMQ/I9jSZmsd/fBFrGJwiz99m+JBl1devjQdka4oSf4i?=
 =?us-ascii?Q?D/mGzKwxrLTZl6hySZnbuAfHy0Z9hVZoPTzDIux/4Jr+gSrxTSLnf1crDAHE?=
 =?us-ascii?Q?BprRa4gDOeDXjv7/0Vqtu3kCFVTs7ybSy+a5dhsrqw0gw8gGQkneVAPL8PAQ?=
 =?us-ascii?Q?H+9Y1uqWkbD1QT72qxSM8zU7+J5PaYawKCB1iOSbgknuTseL/zPwuOvSCHLZ?=
 =?us-ascii?Q?SbQVuNFkl6WdIu+S4fom5sXYNrGtudB0Fc0/S0l6D9clObw0L1AfVmvJvc7e?=
 =?us-ascii?Q?j2hLxTMtFIiLtgN7A0UIgkDDG6adq1WpTgfyIiYa/m7SiGgvYN2/baSzyXC2?=
 =?us-ascii?Q?VPD5560eXhBi2vvXrmvYhL/tqQHcGqHOJboLkCjsMizEYGuQIskJIv8XRs7l?=
 =?us-ascii?Q?QOF4R8f1+R9rhfUztZIxdO32BM/EV3kQPiqt5BNC2cGIxjbjLF8V4k6rPVA9?=
 =?us-ascii?Q?ja4Lrave1Nf5iQX3ow2BfcVtZpiDx4QKqhoygfqMN8haxrqha0LT96GqLj0/?=
 =?us-ascii?Q?Jt9bueLxpx2k3GA2OWcw3CITiulwq/uZC9qdTw4vN/i8bpizksKonubircbd?=
 =?us-ascii?Q?35IqW6rrTwyVm2MfRNrt24ZcBEkXNAqQl7Z7IUy3qk1fxTZNKldNEJrCvxVP?=
 =?us-ascii?Q?PQK1h2vnUVsfew/1L9jdTLMWZt7j73e/Jk1rosuI4qNzz7w/p54VNvP4CBcK?=
 =?us-ascii?Q?9Ia3BvSii4eNCzHEZSVJ1ncoJeFbXr7gN37KaQOj8H/feQ8e9hnju/GQXktV?=
 =?us-ascii?Q?h3gQirlT4MR82ulQCZU0qgPADGK9UWeYs/oW+tkbMMHl/9HFEJHlF61VJXFI?=
 =?us-ascii?Q?pJ8zkG3xFvZh3urAt0HWUo6EccZKZO8FIay3wNIAw3cvvS+4RDC2WLRVUrBJ?=
 =?us-ascii?Q?uAxJH6Zk8N+6rjRDnJBEZ+2ooMzoNEmloXtzU0VC4qCCJBvYBKiZHCgK0v9K?=
 =?us-ascii?Q?nhleSs84FGwDHmHoQfF0HwYMmnCbSr5SXFQxumOh3QhS9bRWT5r8RuNX468/?=
 =?us-ascii?Q?r2J96AR9M8eos6M4LXtVj1q8KVwmWwO+uqphxCi9SnKBvOnFNbTD9JLei8Sz?=
 =?us-ascii?Q?WDZRYJHu0R8eUzEzDYACOWnUEbxDRz8Jq0/64osYtRUe0mn3q6UAeVSN3uQb?=
 =?us-ascii?Q?Jcbs6QENbi8nlc/ZjbAZrpt9PqGbXBdY5YGjmnyXOOygdXbK5XauEYS8pMl+?=
 =?us-ascii?Q?jlef4ClaMQpezvFGGf3iuIF1JgrIEm+w2yi0Y8GekmepJZWu58vtU1QwKTvt?=
 =?us-ascii?Q?lIIQE68mePGlxl8BKM60nD9NfT3/wqxOJUwS1jgGfgGQVZe7TCd9usBAJOnK?=
 =?us-ascii?Q?gp3OvXB/eVnUQn6DlBh1RhgpX9xRgxOqJG2iQG5J?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de034c87-12bd-4cad-5850-08dd3934257d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:23:48.5913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7bojso6JDfKTwCVDOVqslLzEipmb4VMdl7wxnPxOHwPlVQBSGQPDW2P2Ljx90RcyPn6OqFXkbWlbMx+zhM2wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012354_443576_B5781651 
X-CRM114-Status: UNSURE (   6.27  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 7/7] ele_common.=
c".=

