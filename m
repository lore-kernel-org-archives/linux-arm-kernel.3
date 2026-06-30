Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQm5ublkT/i6uTUOOLWac14y6BN5gj9X/bbk6pxDzBM=; b=gWt2Qs9sif/ZDZXb53kXJI3K7s
	xiGX3H8MwBP6TDjJPmzyVTG0JbJqQTB0mfTkAxnrl2xRoBQhOfYulXAk/kPpWx2FDovcWdaZb900O
	eawsQyczLRRvHb2D+FrJQ8RcVP6Oh1IJnQMQ2cR/oK+i6nJxTNtMs2eUNLW8qXfZIBrCgsQr7c4DV
	eY5hno9KKY43/eQUOySjKlgo70iBKmMOiwSWX5fFB/pH58WUzluMXfFSEyl5KwYCL5zELjHI4f633
	VHZh3FpH2eZ/Crt1zoakaY4pZ0RvMecPjyyhoETsAzXxQQmpdX9bJiRXUO7tWmTw2gUfzj4cxc3yL
	AhjAKeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYYj-0000000HAe9-0O90;
	Tue, 30 Jun 2026 13:31:29 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYYY-0000000HAYO-30mL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:31:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zlu0CGV9dBY3PY6gPq8Bzcqm4+k2H0cIeerPlZipAVokPrGUKptYrwbeWUrNU0AaZfsG2UiYg153+nBgXdU02KghlmVf7MFaWAvtZiuUj2GdYYPrFTYzHp1OktR7gDev5qf6Q0kTEdW84kFPEqiaq9JBkSqmoaHnaGCqVcDkwAwZ/ieSbTcd0OVLRI/Kc5wnDgUlnfESncjoEaDY+W8/WOhUC2Bi5urzofkmuIn9W4X3QbBakeDR400j0qUEUh4xIjvIRDb6HLIpCbW2CMZ9kYl9/ojnNXqZEdElWDtB+l/+F+yG6cM6IVQDgDCM605MQqOXKqZ0XXV/ebmEeW8mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQm5ublkT/i6uTUOOLWac14y6BN5gj9X/bbk6pxDzBM=;
 b=A1KGLzPFbrfDkrHcsQgowbENg6Qny+s/rVewWh0R8WNJD73z1RLs3WMXyt9xuO4b2OGLKivItmLJj8BuiplwM6QsLUD52QY0iigeVGs1q82Wr7cnsrb9BHi73IYqxG+03q+wqy3GNiLp/shvniSsULMDI6VF+xew89oGGhkz3t+oTK7p5TBPYnWbnjlbk9D7ub4RLSwZZVHTofAGnELZxVftjriBEFA6MgW1lxK3R2UD1APtDBKRrwMWpscg8QgcqAI5gfPIpqJZb1WLsxisB8yhZVQkE4tNERkUbAcD2u2ZxjtqTxH1FNrdgqfdyX46v1WR4CqL7iZAdPJ5zY/FFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQm5ublkT/i6uTUOOLWac14y6BN5gj9X/bbk6pxDzBM=;
 b=AqXKfiki5XJy6MxL3HXtDRj6JyyDyiHMNuOfQhNlOUJ/Amrgwoco0k+T95K7hZueSWK8nOcWvY2lYzOSvWkt0hG47YdLHwHmZSSw8HPwSByU0ac3zTnQNo4IyHWWr6lDDC77Wkyu+OWkQtykl4XUx560Qj17Ago9SfjhY6FTm41QwIU9mwhtehaZOR79ZPivNadykbFHSKDXfdW5cx1QkNIMBy9xN45O8YUohiYOzg9CpzySV0Tv4ey7ru6zP1PoyGbauob0RSlYDKSQi5aOo0m2ymPsF5BsoZxeoXl5ltlJxequ9xn/5LW5sjhMZKuCMf5Kzxv3THR00b82yI39zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB6955.namprd03.prod.outlook.com (2603:10b6:510:172::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:31:11 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:31:11 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board board
Date: Tue, 30 Jun 2026 06:31:06 -0700
Message-ID: <20260630133108.27244-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe4340b-3043-49f1-622d-08ded6abd948
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|55112099003|6133799003|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: PvaPg1Kf9AVc4AQWdxPUgEgwSEuaJ+ytK9tu1TxlwyxHhXCW9oQ7O7kZphZIUADgxR0fyM3boYtzYD1yQobNpcoP5jJdhC6y35bnykPcTeKrXcQA52H7KUUx4C3wAfZnrBWpgORjfDbYyvtk+2a/sqzX4dSkt6dp9DpZw/+9bZi1i+0fVTQWfYlJgVQx69qVYmRfunWhN96GFTyXz5xIAYJI/EreWhUhgZjBbyECRTQx1zUxGL7PxlUUQ6nsHWXSM/5V1jwFi0yBgMa01EWGZiUH4M8c2fK3uMKlsB1MggwECutjW59Y/gahhkM3CXL/L42+SRxRXeIjrEzdWz/7gwlsyZNmMqcT43EFe4MWxUTw69tn+eqi1tYr27hd2SBQNbWhER/KgOvLtLlrkbgP0A2y4DJwFCwl57bZ1uAa3ONbk7B3GSUWAupLZZZ3tulkdeO1Qu+WyCSEHw5upfBDH+/Ix0/GrJz+QYfozPCIPlmlsGousn+bHWt43u/6mkgza9/CBVQMF16h50zivBaTbZ6f9X2wh0yP5IWizTMnL33T/zTrypmQOqpYk6XtNUCvTA/wDHV3nRJMi+6CCzAJNifdY3FcLtG0WKyoEOdbQJx4tba8AosJVlbVPxkflnFtkmLrVFUN2dQbGlxrmsqn3UuRujakoI4hVY+6qsyhE7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(55112099003)(6133799003)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUi6rXyYBL5rV4ORuW9vvUwglhkUCn5Ad4cQ7ZflbG5J2wcXrAE/GizkmyHo?=
 =?us-ascii?Q?uM8zayMcRCHE2FYR0RIfGZVye4cqmw28dneDenBa85/1Qaq3EkZisbCnS7ol?=
 =?us-ascii?Q?d7eoxtzd2O91NN2h1M8cE13QYMCKF18VbIjyhVvZOhDma4yveFCHqXM0D1Bg?=
 =?us-ascii?Q?W1I7X2hutj1jPCKOoimQIDzhwIDkYHDRNOwfwtvMp7oM3iBa48bm4cMlgQO/?=
 =?us-ascii?Q?qTGKbE0p9Xk+RyCfCKEcVjJJqSsgJZSZqzArBdIirhz/zy/VFElP+jXAM2aH?=
 =?us-ascii?Q?FB/93WzYKL6hOCJNHNhIMr6e4lLbWQx+oYeEtEUmJGRngUQm4OlxneU0gdgI?=
 =?us-ascii?Q?aRxoGQgDdukUiF1vm4dGQVzv1adrtS3BlwGj2B/vUgjJqQlhmwVKLAO8MXTE?=
 =?us-ascii?Q?CdkJ/P+SRtuXfxNVtZTzXdknz2fFNd2Ybz0FucYFxM01H5c8/ThCww6oi0v1?=
 =?us-ascii?Q?2Lb8RSJZE8LKzjxQiyZ+kqEfUi5LSNq6+DK/Lq+FXGBlzmAS+Jj0YxqlpJVc?=
 =?us-ascii?Q?fTHRzYlBhnectiNUAi4l1IuUQlE/EbQLZoesPy/EOK8omjw2/ltdtg7Pbv9e?=
 =?us-ascii?Q?9jvALP+KvKr3JJllG3QiIJo9AU57n1vmiV+ccGY1WZDuSMdlglC2QrUL5Ouw?=
 =?us-ascii?Q?xyP7ZxniDiU/BRMTHnhTEQp3irAKMZ5Nt0eCSrgoOgY+v394vf1hdEr0DwYp?=
 =?us-ascii?Q?NvMvY++FwYBt3FT/dI7iTOOA3STeDkn7TeYZoV9yxTUozD2lFOokopPZePu7?=
 =?us-ascii?Q?voYwQeKF7JUnZR4FEeSlDTv/0H9XS0swj/zBa4eafdDR6JdgtqKSCLVL3moR?=
 =?us-ascii?Q?xKeFkfEQnxFNYgiUYf1R2M/NBulFtfjWStjZ/NNoPwWwu0hvocYPOlcfZHnu?=
 =?us-ascii?Q?Z3A0hRbVjpzikwCffrqtAvF9CoHNN/xBGDhuH1E1OSFxRSh+4gNfswjKGZ1A?=
 =?us-ascii?Q?aBLPz7yxCaKKgBkAqFAlYFhc8Tu5OhNFOvc3mRwWatAvtAxNP1iniCdQi+17?=
 =?us-ascii?Q?SpcQWnZY+ILdSNmIm3r3WJ5JGWPSlo2fFd4G5R9OTlFbk4bLMzECuY4v5OD1?=
 =?us-ascii?Q?N6mWfM1hNQMRTuazsdaJGYezBngvozZ4GQjRhbRiPt+7mcimpVdsd539t5ch?=
 =?us-ascii?Q?OAea5sou7/fw8PHGTN11RmocK6Zvnr7PnReEX+OTcLRNYEW8xSStYZWiJ3D1?=
 =?us-ascii?Q?NUwu5UVRKn2SCWzDMfqYUMYovgoDW/7gzdC6GWLXWFcdc5U7GftrcP2Xy3TC?=
 =?us-ascii?Q?xmIt7SpxOGrajM80A4UKCB/6Maqk2pZI//2yffElSoxSITdbdrIvUt6PY3CT?=
 =?us-ascii?Q?RPZYQo4reTCB92xwhl9mcxFu9PDt/SSVEETAwj6ZINvavz/bX19jw0akKi3j?=
 =?us-ascii?Q?h5n4pEh7ayV1GHIA5W0yOl4UKVE2MkarZBWJtJe0Cu/H/MoQpE9rF7QotkwH?=
 =?us-ascii?Q?/MZ3F7ejcjvc9kEvbta35WwsYtzvigAP6PeMSD+3Mh3ijGWovgwvMMgUH5zE?=
 =?us-ascii?Q?NUvkn7ZuoLwC2zbbfZWSS/nYw8e9hm6MJo9/wQZ9q1q/ytwuH6gOny/ALbgs?=
 =?us-ascii?Q?JIjIDkKrVxAwt1VdcWkeAej0ou9JhZtuZD64H91PbHMPLBd8t6S/4wesK1+w?=
 =?us-ascii?Q?zx8O3LOjIk2kaCS3RnKEockyxSh2VMd+6+80hRdNet1LoSok4BuY+0acY5wM?=
 =?us-ascii?Q?9OgGSmhDwNJFYKyLSs2UEkxMCmJZAW4q3N8ZdQMTWR9r5d395JUkvIp7BXpZ?=
 =?us-ascii?Q?IwV9EYrp+24/Eu4W7eG7MdrwbsvAc0Cr1qLVDZjzDZYXJ0+Fs9wjfeD0ceFh?=
X-MS-Exchange-AntiSpam-MessageData-1: kj8YdFXwpIHjmw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe4340b-3043-49f1-622d-08ded6abd948
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:31:10.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AG1pGuadpJThaIi36h0HkY85duogEDfgMhlVlbOObW4M/HlFXFNLOQ/RI8RAuhe7wIf41oGhPucXPe89OQOCrIwFDx4o8GGLXvhh1Irhff9KH+/ioBLD0JJspOdCiabYWrRTwT/UhykheAJNA6FKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6955
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_063118_758082_10FE17BC 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add compatible string for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
board variant, which uses a dual-port TSN configuration where gmac1
operates with different MAC-side (GMII) and PHY-side (RGMII) interface
modes.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e431469a7175 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -114,6 +114,7 @@ properties:
               - intel,socfpga-agilex5-socdk-debug
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
+              - intel,socfpga-agilex5-socdk-tsn-cfg2
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards
-- 
2.43.7


