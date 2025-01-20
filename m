Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C600C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=; b=2tqOWFYY9Axpx1YDPSu3TtZT3d
	gf+Y9O4Muxj6bzZ6yLMidIcLzj/GUYPOQ1uuaqO8TJBZTK4KatGVs6FENKTf31kNjPhXIV/Due3EC
	RCX0PL8hY66wIOOOBt2z9pABL5AlSaULzzNnlVDo7lQ1kK2oZN4bDlXyhLTf2yk+/fnJ795BcjNG5
	AAUeSK8XR1pt6sd0JRxLs9Rfaoaj4asr2jIBX6yNyBteXD193B7AxHrtp/TDcw9Kk1EGBAHvEKvhe
	hMHM7d3RCwk1ygAi31gc1st+HUbpomy0QQrLydw1RX/qY1ccaoE+hfHeuQtjHSja2sJNJIB41v3GO
	J5U0tzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoMI-00000005ECM-2veE;
	Mon, 20 Jan 2025 09:46:14 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo2X-00000005ANm-1Ok1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:25:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiQBe7LukFWNHt4xPx0FR5bEgIgr0gvcwqLIyozJoZ1d+7xPVsIfrl45Wp6EWnmR/qmjLMQOpSTPWUTIxANCPVGF9o/AbcZpAxgVFP+GYeI6tRdBI70Xh0f7WgXBvtK8qdXhlCABB4XrM3EJsNLCnk3rL7l30IPkiDDUtTrcp8Us76DXJqIMph0GKB9qgw/fPmr7KB5q0naA57/ONakMTdozFgwWjAgKoYZPsFPotEPAZIOj3+5xYBV4LUpinj6x1JXBOSAMNMmAhyukiFARdvXrbx7HuLmcaF058vdAxEJqbKtSUFZpolYCw3hG1RXR4jMzEhCZKWxtXnkuB4WCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=;
 b=kUisJFOr5wgbfd5wSobxaJZ2mdE8q2+/FYa+1zWkSJwEtPL1oZzPtRwpbUMcENTIMF1EG+O2ZjZpO37QByogsAZ3jCgsWPrxwi+3VFiWwXkW2KACvfyRtgBozJYxX/g1DQH6og03i3h2u6L74OaaEEz4How9qfXdACwaLGDjmparY8lqszMyvQFcCLrMys6KCeeU3cYCRw37g/UT4/FxWvYlw1/AFulqafgBHSzUQ6nuW8kgWc0bZZtraWLcpuqcx19r0bpG7d5hb9vTUOaghcoRXPyRQZhtrLYsTjCJQIc0zGtbxzSimHYHMeBTDkQOU6SwOeThgrQVmqmRAAfztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=;
 b=Yq8tcXPPgqchC1HOYUkx9dD82vFziQhL7KnbS/DVDt3ttJ4POSWIzlBhvm5EC96JYrbMm1lZHG3hQ5NprWNcOkgD4Q2vCFq20szXpTsohQ7Vn4ePYTuiSdmsnU6R03MpqtmjfkHh8YzRlYhtbsHpmhWA+tGr5O0XKPjOapwB8uEs4/odYO1Uu1rjerfzPmWRqowJTc+0lurBHsmBpAQtsSvVimvuMtY+drTlrXFPNM3n8twJIc0ui92OmqD2N0YCEcLYgAuYEC0Ws3kUpSC/H8b9lok/GjnSw10H4ezCV1uk7eMXt+TNZCY9S7yCrVPfxbqLaFreOWfdrdj+/k5VIA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:25:47 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:25:47 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 5/7] se_ctrl.c
Thread-Topic: [PATCH v11 5/7] se_ctrl.c
Thread-Index: AQHbax1JBKSevFJwW0iicPHz2bawBA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:25:46 +0000
Message-ID: <AM9PR04MB86046949AA75A51448332EF695E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 421a9297-5db2-43a2-76ba-08dd39346c0c
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DpMgUiSgH6eB8FPVQ7f+l1rBe/Zfmw0cjwElUI/5Drra0Qj1evur2e2u4a5X?=
 =?us-ascii?Q?En3vSZ24W4WgDFOT5fSDsy2uY4BWAZfnA8DDLf4oHLvSwhJHOu9Fkud6/ZsY?=
 =?us-ascii?Q?TRm97bBR4zXSbWe+BeUBwnvKD6WyOf5Mpl5wvUNIJgeZpoPFJV9XCJhJ2V7e?=
 =?us-ascii?Q?KzDh6hygnurovYELQ5W695wwJsPZW4Qg/54Mi2PsMrgNxp8VxLNi03g6kDup?=
 =?us-ascii?Q?qmLOM2VMFZ2Bo7s7KEvAFRikUxnNVqRS7NaLcHz9WjNp/tBQ8gCWe2+NiILb?=
 =?us-ascii?Q?gu7u6JdAUf3ao/BaHahwADYwW57ia6xt3lXUkeIRbcKBGUZQehVUx9eVLYSz?=
 =?us-ascii?Q?BFCNxbhG5kSm1V1192Wdtyb0IUWIphawPQuleQ2YbksDTvL9J+/FgPWQV3Jt?=
 =?us-ascii?Q?eWKuWER4IwG4hEmUvNqvc5TiXb6L7o2WPi3KYzofjYV+rh1YLvxF5NYwg2Zs?=
 =?us-ascii?Q?1UOzG8iA/UIWP272xupLkCRn6v1RMWP6AxeED5Wa2Kx3c/+e12tamHO9VIHb?=
 =?us-ascii?Q?Fiwcyble6tVqXmTFaz5bf1qdxWU21zDHP2XfA87Gi+ur/fgvxCTeKZ/falsK?=
 =?us-ascii?Q?99mupvqwcJxkgjZvQ4gnYndRYVoukaVT8a/ItkKQM6Pckd9woaiVthrLu1Rc?=
 =?us-ascii?Q?9MWP4fgiUUouFSaPa61afrDwtuwBXMfsRtCVFBRpD6/O9RSDrn3lqqNGPLzD?=
 =?us-ascii?Q?fXO7So9aIuGyyzbMIS6JLr03vGMcffjYGzFuUPfcpwmKrRF5pjPVCh2nw91X?=
 =?us-ascii?Q?WdHzuYHhmckcyUqhB/1Q2q+9RHwavT/oTZdW/j4nfEf+CAAvdAQl1JhTaeWy?=
 =?us-ascii?Q?mPZ0iFgrAJMBnRXhqXu7drYxrDZquEhaIq0mMaapZhokbe3ZmvPkKmz400Ae?=
 =?us-ascii?Q?DA+tGpSA+gmLqWWJhDsnnnfdGbRjq+HYm+gOVphmgRpS9yGnVT1aggWllDw6?=
 =?us-ascii?Q?kZCve/ln5bwoB6blHGkXbEYec/fcuENNcF/FXF5fpj3xB7nS2bp5YOcHeXO8?=
 =?us-ascii?Q?lCzJ88LUZjeC9DItCKtvZYdDk9ADlRono1aO9217LxNP8wtQ7SedJRFrWmMZ?=
 =?us-ascii?Q?nJacyh0T3YAK1b2kxf8WLNf62mcnkjbYPRqH4+DHcEVCfjk72GT6FOHztV8y?=
 =?us-ascii?Q?uMde4tYo+Dmg/dwnIgHQfhFUqUNrRj2PkVQKGBNWEtrQ+yEz5ktoka2AaDwh?=
 =?us-ascii?Q?9jRe68jX/SYsVqOjRBRQOe4vk/MV0MjQ6ixwznExB40DALqmHgXmA6QsWswg?=
 =?us-ascii?Q?z/H0AnRtTniFS516FkEsyvM8D75LKS4Nb3n13T6fPpT+QAI67pMhXWxJ83XR?=
 =?us-ascii?Q?tDfn7reeh+NlUFMb6b5Tj2hIQvFJkVV5ay1AflfASvH4ZqLQsckiHlwhHOSF?=
 =?us-ascii?Q?maBsd1Zorlk39GdKAFkmekcUBttTMFpPG/7LbTPGduSAUTL6cBPqHCGh/PIU?=
 =?us-ascii?Q?vnw7guKFBBUgbjueo4vHBUOtShiTdErs?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jEFP4wcbrpx+w5Dm2f/oqI41pBDApXTCms69upLaBoUF4tus1iWyJrBRetS9?=
 =?us-ascii?Q?eJUvlhOEoPtJKHz+39Wlr+ek15u6y7DCakXhEgS9a6Sr4NKS+xSkZyaXtXzy?=
 =?us-ascii?Q?bNtRczmk7hxXMbTnXLcHQIc8oVCKkZdvSzJmJ//DKuRmhvPN/QGcwXqi0wRS?=
 =?us-ascii?Q?OeGeqTaEYBDf2PzIDs4YAsLvMrkFTqah/854QCadIWoTahfU0wA7A7NH0yy3?=
 =?us-ascii?Q?EQmliTGbDA/Kup4NYPxPLIGLFIZQgtRAELhH7l7s7kzy/hV8g9vE4leNYQ/q?=
 =?us-ascii?Q?BGIvy3VKgDJEv53bE9vaScu/xJvi9nPDmXS0XTXIUjDWYt+4zMrwjg+8ITzx?=
 =?us-ascii?Q?Vgi5CezeDyYg8fH+AjmhUJ53FoQiUMK2HGNcmpU6xiudKIuEc1WcPbb4XxCM?=
 =?us-ascii?Q?F4u1fo8rNEhuZodLGNvoJZm/FdRiobMUsFfKL6qluHP/N+lhwX5D+fmry8d7?=
 =?us-ascii?Q?Hteep2IXrv7u9otkbyXe3KJkm1DpgAh6vRdYyk7XB2pE9Ltek8WPUXl6Xmiv?=
 =?us-ascii?Q?1eoGlz6hkSfvZmjk4rMD8u7jH7lUkplZq3Eng1CG3fawTgGsX1WXaranRsrv?=
 =?us-ascii?Q?6ku8wHMw7Gm8Rx1GV5zRGr/l96/HAvefC5e6cHH0mI7OtxbzZ8pmGuiYTE5m?=
 =?us-ascii?Q?uKaJjY2TeiCX30QKvU1rzfLBG3AZptDRNsGtC8QdgA4foKHdosJcYtn+smtO?=
 =?us-ascii?Q?f7GhxkMqALvLBbEH46mNAGqAhp17qSOrAMrZ/mtkUYxRD9NX2W70DBYekTl9?=
 =?us-ascii?Q?vY8vG9GFBxwzueMxsPnjJ4e5Yg9nDZ6ocTeX9wQvNIDQJfyp7pQhs22qp5Ns?=
 =?us-ascii?Q?6OTyhJ3uaqQ7//rKxftyUks4do9EMHDg+D8vduZi/teHfitupEpVGaiFofWa?=
 =?us-ascii?Q?TkMpdBu5Bul8G9zKUSKryPOeyO6UUoSHyFKoBKSysz8aqFSoUIcIw+lJZZ2P?=
 =?us-ascii?Q?9qE/qbZxK/CEbJ7EmF12pyICe64MWwJGg2V4lNsftrLZYA9a6z3/IVMcJLYw?=
 =?us-ascii?Q?/sy8EBWWzPJPvLfwTu+2Zb9ARQ9qD2RJWBMnRlAb+PWeYu3Q2euAJqT1WEdv?=
 =?us-ascii?Q?ndVBH5ntCEa9zmo3yDX133KjbpFxQ2G+Ar6cwspLjzAwDrXTYpy9bRY74hAl?=
 =?us-ascii?Q?7c0RJ9LI+Drfc8m3PSeMVO1LA8gWR6vko1iahjAsRkYYCl488l+I9jFbm5yp?=
 =?us-ascii?Q?H/K5CHbZ3LyBCMslO0JgAW10UFb2ywFdvw2qNXYA0vb9GRNDaOWd09Isk8v4?=
 =?us-ascii?Q?WoEDFr0wA7r69INIBUJxIk17VDiK7SnzMfrN7RNWorQMy3CRlaoDpg1VFb2R?=
 =?us-ascii?Q?UECfx8dg8CU4KSk2GUeUlb/LeTNaBlwIXRQIE2CJdkdGqF6DEn5JiJvlZMXy?=
 =?us-ascii?Q?z6u/CSH7livbxOoW22RhQbclJ3jY81sIfvihs6SqI6SUd9o7tZhBPMFGz647?=
 =?us-ascii?Q?k7V5H51hG20XlHuJYoo86/F+SdmrEzOFv72tDn4S/0yk6AX2c0apj9FP0EMy?=
 =?us-ascii?Q?x0Ps97P2oaRKZwv9g2OaX2blgY1M8s/BtVt1UlGmBQWLbAj+Hz1ni5bNKKIW?=
 =?us-ascii?Q?hNesqcA4Kl31FaMcX/P4LbsWXO/gN9l+kW4wrHXf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421a9297-5db2-43a2-76ba-08dd39346c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:25:47.0009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDSAC0oxK7ETfr5PGrwdJALCC+3i7NWuQ5Ea05abzn/zseswLEfekD/Lrqlq7rTO4xRco91AAFhB55NDAx3Hhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012549_378289_8067F6F3 
X-CRM114-Status: UNSURE (   6.40  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 5/7] se_ctrl.c".=

