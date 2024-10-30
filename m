Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAD7D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfKgEMX1vmb51ux39nniqld7dR8e9BBLpTa6gc2HtA8=; b=bOD76S5nh+JBayRjoxxnf+YqZQ
	h9zQ4Js5Cf7bOt5kOhlWIagTor1WzOvsYWvzvvAA1k25rmte7dGiCNK7dnAs2rCdVz/0BNT1UyvAx
	cb5Cp/OqMn31nNHYe943+QcwvJrzzeQpI6t+jK5Q5/SNXy5pUjzXxm3611mjxTaPCF4eZSvCefkKO
	cwrGTpGwCIjJnIwNZrX1ox7ZNYiZmmQlND33DTNJvJaXdw00JCwm3q5DlQWax6yyf9LJ2czHLLppw
	QuizrwBx5P8B7qC+SfnyEuQUbUulRLnxc7imsrKeNHL4xXFC0topXrFmiXrO4/0C7D/vxeH5qQulQ
	K+R9fiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69hc-00000000epS-3TKp;
	Wed, 30 Oct 2024 14:29:40 +0000
Received: from mail-vi1eur05on2062b.outbound.protection.outlook.com ([2a01:111:f403:2613::62b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t69fx-00000000eRY-22V3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 14:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2CoJmCHO8d6tPvosPqTEYCrDi966o3c914ysX/6foWZNXpaBHnznussNTjJxnKywjgHz8DsP3nWRkTYJ085oZWyxEW3Y8vKinD1RW0suLIGOUZ+vOcssRJN6ahx4N5e+/wsxDJxT2D+6iS6PB+hkcUbNJ8k3pks20oe/5FhtlndW8DkfNjPlXzvL/lYrvMim9D1OpDKdXUCf/uEB+V6DY21wkHu8y+lt1s2vR9xf8+nvdsILt9zgnC6z54VZ00MOmwwZX/d9hRFcSWBr7hV49ToPkOxau+fTBp1XRDnX6jOC3th7/7KxDlIym13Wo4Ypl5bGnydWzOZAubOygpFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfKgEMX1vmb51ux39nniqld7dR8e9BBLpTa6gc2HtA8=;
 b=GYljo1bH/4+kLk+Vr2bShh8uuprDuqDR5jcGkyH/w8E0MkIDLWoemkqfP29KAyl+geFveXsQwS+OXvQbOMXR2FGOMszlv28ELOaPXBYhS5MlQv65nY615ek3aZcdZt507rld4bPzC1ROcfzajn4Am0wcTHK2HvgSJ7etZYppZ8B62UuYNlALfL6BQd4eaYAVgODwzNHBsG3i3o/7HtMOysKaJHEEJQzxhhICmLjtlpDly2/pqVTCaaKqjpLgv7oqhJaPslqSrmwymk4W4bv8C9vB6Lh9cQiNT4HFP5WmgDzVkuPcl/Ds0a9PJz8MEDl5T5U0bxTqLyMJzfG450UJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKgEMX1vmb51ux39nniqld7dR8e9BBLpTa6gc2HtA8=;
 b=C49FTgs2k5pNOiZYi7sL+Xtl0QhdWtZKumEw7joDXOR+gGVP2kVp/kgkr5PhOWMFQZPpXjytfb/EFs4NugywDLuphqT7rjbTi6AwXA86/zRihGLTrUkiGfYqX4BJUIVpnxaNMF+xon0bydWAHbaGM+QYaEfX0B0etvNX+4ArW19D2/QG3XBKmNxN1HMZU+HUKmWhBab/W2r7dTBDkemY1BI52cf7DWyay5unaREhtE73GeJyL+W/XAqRpGZY28CjSzGiOh8e27D15mSyBpgrf3mKIJZMPz8vU+GHvPkqEPlATwSDsvsh+NTZd5zg6tHIeMm24Ys0tpOxUIbNhaOs9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 14:27:47 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 14:27:47 +0000
Date: Wed, 30 Oct 2024 16:27:44 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 2/3] net: dpaa_eth: add assertions about SGT
 entry offsets in sg_fd_to_skb()
Message-ID: <20241030142744.lt4vhiayg5gvnbuw@skbuf>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029164317.50182-3-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR06CA0227.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::48) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 985bef55-0827-4524-9c13-08dcf8ef06ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s14WVn5W3hwXepPzC4tEu9qKTSQbe5mPb7aSD8uDpnxx131HvpV2YDw0SRXD?=
 =?us-ascii?Q?kSUJgA2kVRZoqy06gkrQiYTgisa4JB4nRnsDbQyiT7b/jpaYmoQMqes28yU5?=
 =?us-ascii?Q?Afz0HRtTSGiG27XVZ2mukyXUHrlX8H+RVInBR+FYoHkThz8ocU/pYcrloT8K?=
 =?us-ascii?Q?oQwHcdYGVJs8XT9yvOojcm0Dpg37tU/2qH0oKEStxA8KCAvvVI+BYV+FG8ci?=
 =?us-ascii?Q?B5Ynzm6Rw5qAirWVK3fAlejtreXYN6wZVFMTAomMU1xbyLnmJeUQdYo15sj2?=
 =?us-ascii?Q?T3UUiQ0r/kSNR1u72e7G43V6Fo5/R5EL5eBQMtaVjkEu8/DZJ/VeUKMKFXs3?=
 =?us-ascii?Q?F4RjaL+jk/hqzFHrjKAPnoFwmKgnMMsGVcwg63XfFjSwcdHd5dpQVlYOtrHG?=
 =?us-ascii?Q?P/suNMKIsrX9lppcVKWrXh7LBeDfvivTFc79Ol5Le918ZTIqV0alNJK8KGMq?=
 =?us-ascii?Q?M2Ut2UysaY9mNRhmR01TsERckiTTMqJqhgL0AXvBFm84VEnO1TiYTjONaB5n?=
 =?us-ascii?Q?W0vsdLYh7ho0osj2JiXrRWj3ReO/gr9kqH6aBe7Bwd9NXlW4WxnGfJX61jgC?=
 =?us-ascii?Q?TXk5F1FRg69Ceh3I+OVs8XvH4WwdsBVMw5Hc9vwkbRH2TUMPXfq3Zbw0BFpZ?=
 =?us-ascii?Q?d683O/HT9xtfnoY4hI1MLjNLDSRUpKWiyZ6FhfHJMoC10m7E1KxqWnT373Ou?=
 =?us-ascii?Q?zPuIwAKdp7XnYlRZN6N6gfnkqxM/X38EoAvBDOylazB0RPAf99p22iOCc6bL?=
 =?us-ascii?Q?RtyLDN1bhZMWH2qPhItBE/Nu0hl7EfGAFBrLXUowu/tnQx5APpCtq7nP32vk?=
 =?us-ascii?Q?G/WM/4204kV483Cp9T3bLbqjnTPCdAcjxAFQypnk+iSS4OmyUmMsDJQhYdgR?=
 =?us-ascii?Q?0zhVDvQYbIRu34DvM9VIhSYds7DW63gHKdVkILbrqugA6LOhiqv++CNIKV3u?=
 =?us-ascii?Q?RnA0t0GqjCmcUX2KMkG3oA0pFXlsKVOGKKfsz3ic1jMWOwdHYVJrNI3pb2JK?=
 =?us-ascii?Q?vHHqOd0EiSDnwiIGAgDJcJhtK/IJ89Kb/sBXyr6Ln2oZ2JhTFJVJsUji9AKB?=
 =?us-ascii?Q?NvAfM+sYeaF+2uzAfE2pxCtBNjpB0i3HWtetR3Q+3yETtBdjJV3AJggZztUq?=
 =?us-ascii?Q?xB35MzKpFpUmewHWGL5wRmJOMGmTaRMENX5zwkKwEXS2pMzIU7wtxtIL8dw/?=
 =?us-ascii?Q?rrqcj24KliZNIgDi16FCW1Noy7Qnt7iqUQPm+PUZWkDHEVSVyI/VU5Wj4Lvy?=
 =?us-ascii?Q?r0G9oKPx5seDeK97OHY+5hpxBeqztV4c65op+fO91bPI/XFyXiL4daQMxzkm?=
 =?us-ascii?Q?1ls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4nbuDI1urim7IDDbFOeMUrrCyL3ELIHt1YGOQ4UpndDFAMi5/lridHn8ynkc?=
 =?us-ascii?Q?FyRt0mSNt4PVdSONuYPKnzCUyTAPYEcaFJV00Y4E+K2O6vKvxE1gtt2LZDZx?=
 =?us-ascii?Q?5Yr+FcQd0mAu99C4mtyybKw6CKay9MC29tK9D0vjqUvPGRqhudxfiwM8hvI7?=
 =?us-ascii?Q?R9zn9JsQkQ10HVgLAmKLv/OiI/QI6V+p1kxrmmeTZvlF/lC5lFEgk2itlUqt?=
 =?us-ascii?Q?R4e6aR8V9yRST1smPHzMQjIcnhwb22Q/vFdJqNVu5oAV3ics1/mmI98xL6Rx?=
 =?us-ascii?Q?y81/8Mzr8Nzqay9jLmTuLkwdyG3/HA10VXh4J/QJFELbla6YOEWkbIDp6hYQ?=
 =?us-ascii?Q?F7NZt/Q386Jbjb4W3ZhYEdKcevFnt+aM+CP4NtaLzlZ0SkXFmroc1kVihuta?=
 =?us-ascii?Q?/TLmmWCfEKSLUxSJCPpZ6MEe0zWRqZIYVG390fWDGwqiPXZvHHZcE5RnqBgH?=
 =?us-ascii?Q?oSEu2xKT1ikt/q+c7oXJjRmTqEAX0eArF+8oWy8iJiH/0X0cr5jSQasmgbC1?=
 =?us-ascii?Q?7dslBg86zHOwfzTBIaFrLpslyk2s538uNHpDLe8QgyFO/Miz7PEwY2Sr6Y1l?=
 =?us-ascii?Q?3fFeYvBFpA6h29q1VQZ8krGYhWkZ67nS3nPzlHrnD71q62ILjRYBFftG+gFn?=
 =?us-ascii?Q?dRc6PcONypcPEamqV/WrK+iuKs76eJc2XMECaIzUZgAOi4eLQ0Rwb1udW+SV?=
 =?us-ascii?Q?c2hFPu/7V+XhuegZ9K54KPh+lYufrDfxT7iA9T66mfyo8mXwdcjh+XeW5ELu?=
 =?us-ascii?Q?YN+NnVtI5k9Wvh6qZP/5HyhXuRqeRnMxPJqzYzurQ3M4VDq2EzFSPSpaNek7?=
 =?us-ascii?Q?ASEBGqw/D66CHSUHVhd1d2Cmg4DNl10GFin7K6xR8SVht2rqgP8uWjWYuCju?=
 =?us-ascii?Q?9HnZKkvixO+0Eby9sVH68VFWp8QDN1pyTqmWxTM9pxZclT1URG0sDPziKBTj?=
 =?us-ascii?Q?XY+IneUxVSsXorMXHBojP1lgl2JkCdB8PnH+hWDzqa12qJ+os6UIKd3mlAEJ?=
 =?us-ascii?Q?lkyjqJ7koD37kesq3Ab1V+KLseKGSYWRiR051PA+ee2lreMCjUAIBqzpzL69?=
 =?us-ascii?Q?6pGlNbViAbFS3fSuw0GuBVmA3yrpc8jqUTDwIPW2P+HTfXznQ6860yD2nbNY?=
 =?us-ascii?Q?87Jj3bHYOQrQReiCd2wBbNHc04yiXLHzs2gnPi527gzaOS9Q2vSOVBFOrczt?=
 =?us-ascii?Q?qg7xOA0npHspQxEpOOoHMxDWlr11+rnFUO2nUPt+4DYmjADX2cAfavmHMTvA?=
 =?us-ascii?Q?j4u1vWWaEN+oBXZkc785DTTuX2/UE6Wcfn4R7252CPPrhvtCjm+vq2L4nK4/?=
 =?us-ascii?Q?ZvJ1h662yo5HARfa5vnEVsQ/WlbNuAbEbH8JjwCzEC4fVSkpys1Xd7uImudm?=
 =?us-ascii?Q?Dh5DKctE0hlC/wSU25S6KGffZF27hP0UpR0gQUfQyTmYygwx++KqMYjGM42a?=
 =?us-ascii?Q?rhRht4i3Wu2jj0jCH2WOZYYLsAohWtYhANON6SmgbU5syvFkvYJaeDXgJNun?=
 =?us-ascii?Q?QdbgSgDrhmfXnJsZXN6+Yi6PQrKfM2SvpSbEX/t5GiKr4L1caXXJvg1MCtS+?=
 =?us-ascii?Q?Mv8Y3T5EFOfQ25Wv9TyhEagEKee2NM/1OXEYdQ3koYzjZ7rcr5gqdRSkGg6q?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985bef55-0827-4524-9c13-08dcf8ef06ad
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:27:47.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seT524JYjOvUPeBWwrVJUX870NoV++0aG2TVL+9DQATn0Xdz6hRm/L8Tahlb4fD8jFLtYdsDD4Bt/IMRN4vuvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_072757_577904_04C69089 
X-CRM114-Status: UNSURE (   7.94  )
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

On Tue, Oct 29, 2024 at 06:43:16PM +0200, Vladimir Oltean wrote:
> Tested on LS1046A.

..and now also tested on T2080 (PowerPC), no apparent regressions.

