Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Cc:To:Message-ID:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h2PAVcEkb1OhYUrfdcCm2M5r04BuS8QQ0NeJsDp27o8=; b=v5z7/dd0y0PS/w8XQd2rxWLcis
	ki1qFS8n2qeiIRssk8h327PPhjc7/hRhmFBGN4eYZXSUF7LwPufSunHLubTxwKTChIYMuEaOE+CtW
	3hE/ljsCcULso9pJotnWTR+aVVP0zDsX90TEimxh4R5UXYD7cRWz2YL8SfBadMwGS+f20km5vPc4f
	9qoXLjJr7aZjH1rpgYp4VHORHDvFUYuz0Oqn4ia0MjJd9mzxMAmlaqgyejZyf8+EHf5NvtmfYF8HN
	zNcroSAbU2x6CZDBk0xnOuMWJByvBQUPaX053nzjVDj5HiQG7QlahwzGRr5nPVQ+3xcDbnSs6Ojsd
	RqTIv/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWuT-0000000B5Fb-1RCE;
	Tue, 14 Jul 2026 06:46:29 +0000
Received: from mail-northcentralusazolkn19010005.outbound.protection.outlook.com ([52.103.20.5] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWuP-0000000B5EO-2NFq;
	Tue, 14 Jul 2026 06:46:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByzF3rOhs/esBgHeDvGbHPw+t7M4E66VqGMPJ4CnzxfvYuFvsl+vHr/f26ZbFJE8JmsgBD6q9yxc26vwEJrlDBbxxkM3QpuED/T3E+YECpZqIfDr3SYx/aKllVdcGX3UFMkm7+S/AeGXTujOrkv9qEOhvWo+XsJ2X6kaA3TI3cyLn0Kl8DkBDQzwwF/8hE4Mpeb6rGHJQI5ZP4tU5/WFGEazkVvX0gIoayI1CjYzZ4aCdRnLCfGnMmW3P70EXY1jfcEKDcRIPQaPggZBKu9psG+wPW8WX60h9MB/LpcwhsousYDyMMkNU7TTdrHQRb7CVMqRe+Cwu/82ozcgHVlcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2PAVcEkb1OhYUrfdcCm2M5r04BuS8QQ0NeJsDp27o8=;
 b=egE8HYyQqh+DZ/KZF2lBdqy8EdMh0pWPgt6mvIFI59gdr7Opp00Z0QZm+iLniPWCvKAjLRI1ZIW43RnHvBmAAmXs2Y3v8JwgGUc0d6afI6ZUrZYYes6FeRpXd3vHnYOqIQIi8d6nKv+NvAirWzHQcWtb4eqpO0EQOS+INhaZRv7JhBdKQItrMpmT9726dUyvC2CKjAUHDumdhqNtx27K+VXfokvXrVFEVQrecqceRSdrFTvZpBSuTJGD4W3BDcz5XWGda7gw/Zy25qkPzxOozCQQid9r758B61HgTEJACFB8j5GZyOhMOojPr5+1US0LFcSTfNLGE2G5f9pFZKdGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2PAVcEkb1OhYUrfdcCm2M5r04BuS8QQ0NeJsDp27o8=;
 b=G03HItb/ePAEY6GE1Rcgqj7Da257s82EOMzfl+gJjClkvw8Y2DWYczNPQlw9Wwo4Awi7NLIXkhoKxxvanjt9lKGFTwUlzLDzWAVaUI0P18IBkPUiiUKcSr/n1NjDooN96cb2m1zhWSowusSaQmuTqI3kdprbML86DqMiwchsMmRndWVFsXMuVHxF9j33MXojGtwlesPlwIgBLcwMOSq+/QyLXUiaiP5f+Fjq6uKNPCSCFqsrJCQDWG5e9FT6h9F9qDFe1l1UJy/EAdnbElqGw5NcKG4SApOPcqdKOMXCQKfhx3Ce2dSJDJvGv7FrK3pyYDupG28iPabiEQ2ilirUmw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CO1PR19MB4901.namprd19.prod.outlook.com (2603:10b6:303:f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 06:46:19 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 06:46:19 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Tue, 14 Jul 2026 14:46:20 +0800
Message-ID: <MN0PR19MB609171877109E10553B5DB5EACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: rockchip: naneng-combphy: Set RK3576 USB3 SSC downward
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <4255a8781c2f49428ec2290fdec6e3de.1784011580644331.tspi3m-combphy-v1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CO1PR19MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f1f08d-3f93-4d76-b4a6-08dee1739c4f
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|4140399003|15080799012|5040399003|37011999003|5062599005|24021099003|23021999003|41001999006|19110799012|8060799015|26104999009|440099028|3412199025|52005399003|40105399003|3430499035;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mSlhqv1/MG9DYmcxfIoq6JzlSZBmZz1i+WiIs0XI2tUBCPxwha5dJDtkyf/4?=
 =?us-ascii?Q?vk925TV5FtlBnMh7XPSHDj7+ZCPCxOXhbnojgGkay5zdOu9I/Dj17o+RTWf/?=
 =?us-ascii?Q?8APuI0u2ncTmyY/VLyBcq6IFl/SXkZZsa47oAXCguLD0XJUn5XDsfdPBAJ1a?=
 =?us-ascii?Q?/0IIxLop9p/PjVVeuUMOwxb6ZJSVJE5Ie5Y0OdaXab00WRhYYm4ObvMI/QxK?=
 =?us-ascii?Q?t1RWTF537nbwEcJsvwjRnAiPzlsaaZSELou7Pe3YVXZ+knAK5yty3jpffm6v?=
 =?us-ascii?Q?XNSxHsvfajqBdG4l4sPW+gBFSLEZc1PZaM/AIyGjcr2QmGhBcWAlZk6+QSu7?=
 =?us-ascii?Q?3CgxGj/3Fr3FD1SmlAwWWoeqhwRml9qssJag9/jbq7PmehQT03AzNMJGwR5A?=
 =?us-ascii?Q?HaAiXYwHtNtSs7MH+ARzBlibVVUbnUPXaMrIvE+vrL8be30huLm2bZGU6Wt1?=
 =?us-ascii?Q?1B9HEY9OUFpVRb7ZYUx8DS0A679kxgizBWMXGjLFMUA//BOQkHog7+a9PXCo?=
 =?us-ascii?Q?CYYjvEdOP/zu7E2GXU5ZRLg5P8GYvYAKh0hNYOxYJ6vChUAJkh/e84h3bn90?=
 =?us-ascii?Q?w4aSK91nAKXO2Xcrgf2CgY5ZZAFqlDCRAjZWSWXvzWcz4ffNmPgv8k/Wq5iY?=
 =?us-ascii?Q?w3l9hlqS0Mocx2PfslYKEYFHhtwdSqo9uAnZCC9aW8eCHMT8q0FPpb8hk3//?=
 =?us-ascii?Q?DB5+2jjx5oKasLL6yvrrZUEe/MTF0LV6hSNvzWuMpFgpFmO/TiHhI3MNoOpH?=
 =?us-ascii?Q?L/j7bH0t7pPuTsR7TY850dyaV6xnrdlB0MvvKdOvO79rm+HLmpCeO7v45FpF?=
 =?us-ascii?Q?RGD4aO6ryl0Mh+1nO2CZ9c9V40KOGHebQWwi5lIxnBwZXqlaCpBv/vo/FrSX?=
 =?us-ascii?Q?Y+2nvpEyfBgE5yRUrM2ndt0pRZQMWf+tlTojBTKnKbetyO9v1iIPgPlN5vP+?=
 =?us-ascii?Q?krGL9gygaj9BmEDlsJrB7OqLcHuVhDLr8/dYpB2KrhGVMQleeFgcKKhzX85k?=
 =?us-ascii?Q?z7XzbYsGQVo8JoRc5PmM5hSp+xpZrChoqdciaxdk8q71a6s=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvGLHSwfXDDTGt6sD9HGpscmb9XT8LzXQm5eTymtF/x8LLKoaAXtzzBNEJln?=
 =?us-ascii?Q?chd+6l7fkBIzUHTCI5i5oyQqG8iU9ZmaICr+oeR+MS0hHVhW9KirTLMdB6x9?=
 =?us-ascii?Q?t/qKbmJxv4ZmZdrXe4ORYGEpniPQkvniwjtpYm7yCCVyCtYGAOiUdLf2JDHT?=
 =?us-ascii?Q?9v4fuG/KZK1tyhwko69pPswKj35NdWtweLYe14hdbq15kIriwi946T6aCHPn?=
 =?us-ascii?Q?bL/nCH9Q7H0kBTLnqp0AMc94Lgol2sWz+/oxmGU8fMb2++fA+0vj2vOU3HpG?=
 =?us-ascii?Q?kM6FxPfyUUAm9ZX8zf2UUwrgdRNBk8eMGZpLUNYjpmlPjeeGHZrp5bwClQcS?=
 =?us-ascii?Q?22cnt0AvAkPCIfXT4mtB+yHLJFLPnyezkRd0XKEIedK5GiQ2Tm0UKQ5Ooinu?=
 =?us-ascii?Q?A1YayyQNDbjHhn+F52ksglOy6fEawVe+fp4B12OK1UD3iQOISKWTPUCl3fFL?=
 =?us-ascii?Q?0zNc5ijk67Wv4hUQdBy55A3i5NJ7DeiZBXxODOF3sDbM1+Yoqyzb0XZL7lrY?=
 =?us-ascii?Q?gliqyMoDpaG2bZ1NvTLJG8cnCmYV8muduC6UvZrKNtodbctCmBsFP9xk4dJW?=
 =?us-ascii?Q?ASTk+mADKCCZYddrfT6mAw7jsZy6AJBYdBCrNlDlkclPkPHJ9krm0e7209iT?=
 =?us-ascii?Q?2a99iNAtDD/F/YXROq7Oz6O4NGfPVRaT9HaL7u1vCvxPcHDqRwJZ04PJHE4S?=
 =?us-ascii?Q?ZgkdiZhqYWsSlXUR/FB30l+qfPYRz6DgrljkgtPnfldjOy2LucaCWUI+a8Lb?=
 =?us-ascii?Q?tkhDAmcf832T9YWDln06TnHjcjHETtc0lBAS6rmoYHA4365RxtaR1WtErs0h?=
 =?us-ascii?Q?t6IrEjw2lYwAeLTpzLUHliG3j+mekLJhOP4jR8V8Mve6fgvS/c+0+Sstdqp6?=
 =?us-ascii?Q?roGskOpWf6oNbtvREdV8SCl7AOBke4Mfaftj2p84UCtx7yn+h6Y5Zm/pjx6A?=
 =?us-ascii?Q?eaIuaNTHnyqAkhfKZ7aWbK6XTIZWr5pRdURW7aqq34qAGGTUtSDoGmaj1xH9?=
 =?us-ascii?Q?Orum6voDquGyTZvAkLkIR6JN6j57cx+p+AF1nQ/25kS4wRXcuhPB/5EncnX4?=
 =?us-ascii?Q?gqt+cY+lGfMpbSsn+DNZCib+hRnZPZuDTN9Y3uSHp0+BfjOYCqFCB8UERD3G?=
 =?us-ascii?Q?pWcrFEVc3Dc3gpKw0Ei5XqXlRgaKfFVeYTtUBvqcpoVqUh08cSYphwFIyo0N?=
 =?us-ascii?Q?i2ySAgkfblFfnPZ2jjNvTUFDJkczzgHWMFwUpvhRR9OwzpbYGB9+WO7nN6pk?=
 =?us-ascii?Q?t1q00pHXHcphoID+EeubMVmogwq5wnviJ0pnQQUywix56wYNF1t0zf0ygQc4?=
 =?us-ascii?Q?o6mdKy0gZIRa3BDIBz5cTS+rjEV2n+VD4623yEQStZVQtT7YMxGjmCjXHHKj?=
 =?us-ascii?Q?ed3MYpnpqG1GSfpqZK9hO7ZLrk2Y+Sl95xR8D8fTU35eOLxQbg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f1f08d-3f93-4d76-b4a6-08dee1739c4f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:46:19.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_234625_614882_F4BE07D5 
X-CRM114-Status: UNSURE (   6.97  )
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

Program the RK3576 USB3 spread-spectrum direction to downward before
applying the remaining PHY tuning. This matches the vendor BSP SSC
direction and follows the existing RK3568 handling in this driver.

Without this setting, a HIKSEMI MD202 (0bda:9210) repeatedly failed
to accept a USB address on an RK3576 Taishan Pi 3M. With it, the same
device enumerates at 5 Gbit/s and completes a 64 MiB read/write test.

A separate 1 GiB stress test with this RTL9210-based enclosure still
produced SuperSpeed resets and I/O timeouts. This change only addresses
the initial link behavior and does not claim to fix sustained-I/O
stability.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 2b0f152f5..324a0861e 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -1015,6 +1015,11 @@ static int rk3576_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_USB3:
+		/* Set SSC downward spread spectrum */
+		val = FIELD_PREP(RK3568_PHYREG32_SSC_MASK, RK3568_PHYREG32_SSC_DOWNWARD);
+		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val,
+					 RK3568_PHYREG32);
+
 		/* Enable adaptive CTLE for USB3.0 Rx */
 		val = readl(priv->mmio + RK3568_PHYREG15);
 		val |= RK3568_PHYREG15_CTLE_EN;

