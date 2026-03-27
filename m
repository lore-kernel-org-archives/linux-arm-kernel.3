Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0160910AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W02U2fHEa7XzPOK5MVECzCG7MIfi3riob6H30UnePHc=; b=BkBEpQM3uPRrfRuVh1/50gXVjh
	hSIDgXH0i8oPD6tfX8d7TssFHDcyJXKO2I1+uPsZ3l3co4fImGB9kdxmrLIXGlH89fumW9xQGIqbf
	JfRTr/wyhlKutDXeR0DEiYse7AL+rqvTLRjDCqJr1ob3/raPXyr5CWVJQjmwhVXMbTeIa0U+lJDqg
	u6vSywEO7HFiLaWcP36K7bKJ15CPV5J8ryBnchml/nH5yCMJO9xo2KjYs/FNIiQqr0Fg1qcXuHSLi
	xe04L9n5MSsf0bV0OleKCc7fLD2i9cnzLJrGRlJGISZirbra5y9CWI+Bo66cuzh1ovdYRUQr+mYNC
	/cuHpNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68TZ-00000007dS9-2Yh1;
	Fri, 27 Mar 2026 14:47:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68TX-00000007dRo-2LBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:47:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cW5+BNvInfy1xFortdge2vzfAvMUl9sGkZMWvoBJsoiPGl0Fn3rtxf7y5shTdhuak23eTE8PC7XnNUETOyekB6TMWoD6osjatr+8vDPO/+4pezQJetN5gIDJll/4R6yaVbI2dSABWHOUgSlSv0VVjfnUsniCHaKZigqBm240N5e8q7Umc9tEaWUdXbY5QFXwn/qZn75Y9+tq3qk3lmcPhvIk0yGjviINQ4VacAV/v8+iblzbBqbMTRDdl1ihH5AlqpBTXVz+EQ6DlFypgaqD7RsAvlJKGdYbYFfAi6HuQkiF1T59Ih17odxefPTdYKC142ZpWFWQwqptlxV7JJXyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W02U2fHEa7XzPOK5MVECzCG7MIfi3riob6H30UnePHc=;
 b=psUQtAba6It7+9DjoZMd5kP+achzI8nQy8qrGwEJ8cYqVQ7FuGhRkvKsikdXAt3k/VcFBKPCwob1F17P+Iw/TlTmG8ihOrXX3RLKDh0XPwE58t7Qa/AWQjfYw53eOJOakTpCW/3qZC2F3p6rb2MSATf/oSHEH15aZw/qRAceUnKYzukeQgeEaWfQBH1to8mMqE7Kau3ak7B7Ee2hz6wGQ/j1rjy5Z5gfFLO00Buhc8Xibz26A087iICwEUb7hXeg7y9X7J1PqVf4/paBm86e420aKtCtvJ3anKxbQ8xhyiuyrvCUWXL9DIk5qyDBQqE5vHm4PrEDL9wob8PBczgE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W02U2fHEa7XzPOK5MVECzCG7MIfi3riob6H30UnePHc=;
 b=Rl+Z+IuA0YUxYA+825b/nstfwJfNqgVyJoByWmn9Y5ai5Yxb1OzMkVVXQPCNn1jzvjEi7wE890xMyQpYZpHD8uJPdmuBEQFUfegIyX0Mei8cfH17CSkqEubsFmXeb/5uIk6JC9PD6+KO+u+TropRcmX/ykk/D6qWBRJBdqZtXMyLNsFyS5RwH7XFgUZkJHnyaIQV9uyqaBQlOIknY/tEPR5EvpedrDzxxiEqj5ZsoP797SsotcuPCgqoOGxrly3D/L6rLA/e7vu/jpTwsVAKiueX0b9bOzIh+7+9M1nqyffacjMMrUwPb/j7vY53ShL3W/XcTnE4Qr3ccF4yxkpBcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 14:47:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 14:47:46 +0000
Date: Fri, 27 Mar 2026 10:47:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: vivek yadav <y9.vivek@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: fix style issues
Message-ID: <acaYiWOKW9uye_gB@lizhi-Precision-Tower-5810>
References: <20251202161413.92230-1-y9.vivek@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202161413.92230-1-y9.vivek@gmail.com>
X-ClientProxiedBy: SN1PR12CA0071.namprd12.prod.outlook.com
 (2603:10b6:802:20::42) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: c63f7706-4587-4de8-1a1e-08de8c0fcf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 7oak2ar6i3dW8bLGefNG/Sns5aqkS9qEg0rF+JM2t2Lc0EYMoRnhJfesgq7ayBrSZfgTx//alxY8AQ3464ywsb/Tj/0S1nK3IMosCmlMEBTz24SErpH85TVl0J3QKI7Fmc/BDa1vi2wqqkMN9pYvq7UF+XFZRZDGQNmSAHu7hqczC0jZk6QKNtUKpx8wScB6Tf3QolaDnMZURMANjeKcyi2HfRCawH6AYfGVSL9IHXEm3AZ55OG24RLyTrq5epA8tYMW9Xfekt7zvUMX4cxzNlEvUvMDs3g2Ec/16L5A5mIHZqClVLknBFyKcwpZK4xt6RMo+YXaySCBcpyMJLlzw2sZ59zrsqoRa1YnKpIPk/EjMh2FB4FhLl722cqjfLvybE8APFpOjQ71Usoe9mgOgfLu/4r7Qz74RHMiSUjkj9ln3ePfY7XCgcTU32LpSWf0q04YvoKMHP6JhsEQqerQnBR0Ae+9HToeBoTCMsOGsIGKuX3D09wv+ffp/PuuF8IZNeFkWodKaNlv0W9VTTf/ZF5LhawhgyFjPd7v/xOIR4AynOTTUtAF+/9S4T3stB0WvIwpuI35xcDW9tKFHnDf5+y+3x1piVPtFMdZla4kEo2NhlmKw66D7f10HNFFLsD+6A1RsLbx5VRkys5PZcQcHfNFVaByL7Bd4vQR29OTm/IecY3TkUgq6xV4cdUGXku/qpYfFMhY9EBFkaNJRCYDBYILebjGHHrR3cedtRGCg7fGI3NGYiwCwBAReH1RHdaHH0252LQ8zX8bgHiMMZ6ZYyzWmlJDL99V8b6DlnlEnSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtKD9/zLyLAf2O+e5uPVLIG/yICArO0PD3crO25rCW6LZwsNNJAmF7c38a6x?=
 =?us-ascii?Q?ZdM8OQ7onVUOWPaP97D4d6J71hWNpl/lGcXD/koaPERP1XcktBM0Pzt52242?=
 =?us-ascii?Q?ctzh//3Wl3o7bslV5t4l8Lcxjtf4apIjmwDZgSAOzUOlMvaF/yyabxO0222n?=
 =?us-ascii?Q?92ZW7+/mQD9cqgtQ2tBvZwzRjTa2IITlYTgGIXNtQLvpTGRxipoAwzDDBG6Q?=
 =?us-ascii?Q?RYU2Y6Al8JVXCwI7jygTnK4XXtzyIvmvrpqEZnKxeFRoxfd/vHpN9erYLewY?=
 =?us-ascii?Q?M0WzUHBDrIzlAO112TV9QGR5JEs3f3ofeagE5UI0YUoDGaUOb0xavP92fAes?=
 =?us-ascii?Q?LjMdYEc0wEWruyB3ySLqIcG4Y2uJpiw4ibQfIF6plqfFNqNzAoj9rMNhPnYp?=
 =?us-ascii?Q?HlmywdnS55MIDtTpEyysfJewgnU498DDc0kxqFMu8Iu/CTGPNRwsBbMmWdAB?=
 =?us-ascii?Q?rrtJyKGq+tr96jICXKbpufHrA1NbFGmxGz7Y41+HLn5KfpHBoGz0DOIRbhM/?=
 =?us-ascii?Q?JQBsExy9dgc8sEfomyiwiOjyvMdWhBSnVSjaFWrreyXh+95WEedw5ZtRHlOU?=
 =?us-ascii?Q?ajoVKUey2bpGlCKN/Emur/sTmNcTha8BfpBRLrtLC+EWe5OdHgOhp4M+dHX9?=
 =?us-ascii?Q?PbEEM9dqpkUebFu3xQxij7PKD5uvYqfTIvlvXWn3fpj38IBpAKtlO0cvko0c?=
 =?us-ascii?Q?xLpc02KWieJFRzG8ZAq5469mF0woUazLKSXdfqWKWEdzWn5aT4htWUeTF+pN?=
 =?us-ascii?Q?C5+w9CvAehDYqWN0ZLW0QIPjCs98kHUHQSRbD7qp9Qbzlkqh21TmdtfDrcQR?=
 =?us-ascii?Q?xoWP/7TK1z/Wb984KKLIb5OY2d+cKaw6QImc9DJFrmde498FPSYgJ79ID9Yh?=
 =?us-ascii?Q?lnUtm8SE43CX0R8LJJMb1nevyIfJForW+RBZaa3aJDBqVuhVUAklXagACF1d?=
 =?us-ascii?Q?iIqFJhrHEAPNXXadVEYSpkLMym5SgHWGL5LxfqhVdtfLS6lSm9+5bk0l7FzI?=
 =?us-ascii?Q?hfP0Vv04BzFDU4tdmHOBvTFhylsmNm6mUUq3ORSNE1Wu9s1V7+RC7AXWvCyZ?=
 =?us-ascii?Q?bxlu9aUGbOetj10bZ7VSIBIjtgrVsMo+Y3TMBYQIVnpqOgB/clxTgXuksbnX?=
 =?us-ascii?Q?0QqcEirmAKho9NSsfuNN5QjQ/1/1ds+uVPuBPb0RhL7EfkMaDUb0VLIVSjFd?=
 =?us-ascii?Q?jRqYdC/K1JMtf6Hb4ij/zTraMfpgyodx3YK9Df3TgWKpCERg8LP0NRssB2QI?=
 =?us-ascii?Q?RhKkWf5XMoPpw9IkF7JHb9/shMyXeq8kQIW/+j2Now73i4PG5pnJje6eXivj?=
 =?us-ascii?Q?4QDMFqy3w0U6aLQX8WqJIpQ2SRTkRXw+8ieDQ8fJaZQHpjyj40gUkVGSBf41?=
 =?us-ascii?Q?RCeQdkAFUW8IsWAdi7i1oNZ7MG9xhYAsZGgkle0aXNHzpxaiU/0lQW8LUl2F?=
 =?us-ascii?Q?EcQ63CEbxa7rADvYUytastechp1a/nxvvWCe/HKvREjGSJA+prYdP4x5bydl?=
 =?us-ascii?Q?UGqz20pia6ZgVmm062ywO5zMJkpdzaSWEIDL/RVPkJjnKezZlGAIJFQyzXII?=
 =?us-ascii?Q?8Bjle2lSrzRHduExyjsa5oJOBmeyYwmmSTzUNbntiMgwWVJHlPQRcgiO23AV?=
 =?us-ascii?Q?pUhImNIdSYizSOT4h6U4O8UShLOPQwEWDLMVfPtgekqt7NpSTrZypDj/pLba?=
 =?us-ascii?Q?UkkJTUd/rMwyECOSYTkWVitbnkBn3zc86X/LnrRjxpiY83tT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63f7706-4587-4de8-1a1e-08de8c0fcf0b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:47:46.0443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8dR4/8gHdRfWd0neXG82IA8sZlBiqKU47CILjWynOJPMFj76NmJAxe0P0yg77lmqvG8Oy9arcBfj1dwFd1RRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_074751_620073_029CAAD0 
X-CRM114-Status: UNSURE (   8.30  )
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

On Tue, Dec 02, 2025 at 09:44:13PM +0530, vivek yadav wrote:
> Applied checkpatch.pl recommendations:
> - corrected whitespace
> - fixed line length
> - adjusted indentation
>
> Signed-off-by: vivek yadav <y9.vivek@gmail.com>
> ---

Applied, thanks! It should be in media-committers/next.

Frank

> --
> 2.43.0
>

