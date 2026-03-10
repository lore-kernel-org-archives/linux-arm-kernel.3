Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E37FCC9DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHXgwg3UO2oHcwz5o+Dc0bqrhRpvooFlcGNa8aVLBUI=; b=pbGMSX+c+ZfJ29zCXDgdgeR7WW
	AuB9eBzH5DX/SDP8t4xVMDEKJttJCf4Xn8m8m0TYENuZNM3WTcprLJV98EeiIdQeEl011HiNGckpt
	hlba97jdFL65pN/MhDlxGmObgHMTr4DN8re3883peF30egYMMAQITjgPbOUq2f3VjNeFDnFRWMtbM
	E69STPEzZqK7p+mfqWLAbVNmgFPKZ3/WLSkibDr9gvkId/y7Ws8EmU47eVgPzgyalRw0c9cRNLTyz
	V8lPnGrzDaVoDKOAS0IscIll0Fhnq8xuj2e9Ajrfy4LFVcZsd/R1twbihiZietAGBONTiLFOuAyVg
	xSlV3PCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsbX-00000008xKJ-2xDa;
	Tue, 10 Mar 2026 08:38:15 +0000
Received: from mail-westeuropeazon11011056.outbound.protection.outlook.com ([52.101.70.56] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsbU-00000008xJ6-3gTU;
	Tue, 10 Mar 2026 08:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR/11+mCfgNKg8r3o/8i0kaJ7O233jzaXp+pyjsDG1K79btBAyyyW/tP3z4RVVoqGmwzZ3xct6emxSiDFNmN6dUC4452oOMd6yJIvCW3eV2pmfi3C2teHibZqrtjHfd8h0LuPshIQW8fr4IBvexeNnedjycnBy63IuhSvogBFDgfdoZcgI988EYBXbdxPl1Zo5emkdns0uHMQyRL0QT0K4WDaMqW0ejdUnlKZrSmn2AL8xjm3jBtgbRc9DwxxqbO04DjMC+AbWHzb6sSdy3J663FWio9j8+95ItUJS+BuKIla8wAdJvoRwJN7BjqoPtLbuFZoROCZhxLNzijEVcdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DC/WAtPBttyO3YieGx/3i+uqZRqK9wrBUGkfPza3Tg=;
 b=yVEAsFhF2xjP1PtHcShjo5vCoJ6YQDqj7VHEgY2pKjx7skLiBuKdLHqQ+a6RS9ZcFbt3f0LT/Hzd+m+IPfaqcYVeb54BvzvoyW7VKD5O4cKnM+2m0WQnaozt5iEgwTXSuTeb/CHoLnc0T/SFKMhEldPpyKMe1EoYGNlsaVMdHboi4NeEONv+nHjt+wEAtQlbse1TKZCPNA4VwdWm9rzOI54msFOa8hW2qr3FDgFttWNbjQrIzJKh5VUGo0CHxpXuBysaVUxyEaq8vYfWkMLXNjQwT2SnL7qRF6hUDeFTEFY3rcV/Er+8krq+7QmDCtjBgrSiycp31KUHGNUpTxVbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DC/WAtPBttyO3YieGx/3i+uqZRqK9wrBUGkfPza3Tg=;
 b=cI2HDijV8u4poMLbMgSAKiqHQYao38kFB6rI6uWM4tWEOov4BdjYDHNY49qQumGNbOMDbUwQQ+LF+xEycN6t78Q3axGv7LH48QEAD9n/jY7FJSTN89awXWBXzhEQcrWEkMLe8TOGrEsLl1JnKM6lqaDrv5GSpSbNWKCz9oKH2Ze73oVH8DzcqGtggc64p4ZDhwqHSv5A5p5e5X8zk25HuUyhm8UYCBYk0NYWQbq9u5xTi7TcU4NN9DveHMoqghNdnamwm3jeySW0/edPjCgrkWUTdolrZx0uqXQnYPpjvDiY0n9zPeU/7M0KoqVgX0Vz5IKfQZLyhAP2O16eQaUtdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI0PR04MB11537.eurprd04.prod.outlook.com (2603:10a6:800:2cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:38:03 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 08:38:03 +0000
Date: Tue, 10 Mar 2026 10:37:52 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct
 dereference of phy->dev.of_node
Message-ID: <20260310083752.ms6u4qpy3snl4h6w@skbuf>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
 <20260309190842.927634-11-vladimir.oltean@nxp.com>
 <2218670.OBFZWjSADL@phil>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2218670.OBFZWjSADL@phil>
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI0PR04MB11537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9313eb4b-b391-4082-879f-08de7e8057f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 7zpY0fGF0FZqFMnBqsVHmqIGFfq+MhYwIEKQtvt6B3eHRjhzALOhIpxh9EF6nGj1Iroa+q9xGMzJDP4On1vBSs+mlNE37hLxx202BmTFe4QS2ECrvsGE51Gcg92ciRi+hJ6GhkGUBTDQatmfMFGkCoQuQS5QehVBvh9B23EDX+QWPxS9xdH1y/9gvF/FBK/H8+zOXkgtYel3/47Lq26oKZAq5YMmqeIE9head2wiQtgL4fBQlGsR2uFxMwB89geDucdbLO20kM8rEcel84vcVNGErfur+eT3tyRaZEG8GOwBdQMulQEil+B/imwBpwbnAnFJAQY6rWT6qmgK1/v85+/MSnzsj0MxGYe9gozUmXO+EmKAwUmjc5x7A4Wr/94rtSM9o7z9InmSRfgzchtMmK01UR55Bn1NR55CBrzlGiMbA1hOdUbO/CTgqVoh6jOBxdgQyb7gW+KuwKr/EEaTz+Ba1naftgcIi1DaFqvljdKzsE1ZsdCv41VWF5tsRqjf3l4ySxGrEjrZXKjS7BIRXbr3J7cuNydsuUectf76+TmP1ajQitFbFdz6dhjiHq4J2pF3buSYgtirggdoBhBOw/JHN5Wnz0964H0ScPwdXaJ1UXaxS87oDaNfRo7EsYd7KABIobrT5H81mU6S76WUiXGkSAAj3MbUz2+rs+haJu0C6olfbO69PeJEJZOkuka4fxYrhwRUosPFeRCjbb3uzVEK5ZQ1Fw2XOipZ8UZ953I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/X9TwhBn8TlngGFdwqJeM7SRp3oOxjqQHJG3h93PXwdwM0PAsIrwLTb/Q+?=
 =?iso-8859-1?Q?OTU/u5l1m8PcjtDtbXnSQ7OSTlR96gnL7ogDNAHpHuLNinnGuyaf29tg2y?=
 =?iso-8859-1?Q?58/xA3TUnhxSgqHXTKm68uF8jiZUbWF3n7Y9cdmE4oKGrOoczYaQyKg9eB?=
 =?iso-8859-1?Q?jvgtntx1JsG1x5lI6BL1Ljd+jIjIWU/tvUs0Bvm8/VNUfceMY1E/yBjRqH?=
 =?iso-8859-1?Q?9/ku7pZtj2FFYkVYfZQovOuKNmIbRxEO07Skp9OOVyBbKfKMDf07yq8ldn?=
 =?iso-8859-1?Q?+Wj44LU5q0AYdarTPlSaCfDhGzkEg+O94xZTgQxFvqNsPuQn1K3f9v3/lV?=
 =?iso-8859-1?Q?sZq87629tddQm/h3xwSTBr1BEIwkDIRV1LGBJQeY8gvtLI82c8yjNCAd++?=
 =?iso-8859-1?Q?0mB6+VXoqfnaDt/gahH2kONhmwap//YHpkbEl1QIpAVDwOJDtD/sV6CZBI?=
 =?iso-8859-1?Q?VRltTEWOiqitXOgBtd9SYMvZZ8/tIS1h5eq4ZZo35ZSv1erJKdBv3vNVev?=
 =?iso-8859-1?Q?rVugQfmPwZ33kv0pCsfOAIUURU5MIuysxq4umj1egNB0sJy3JbQ3gtH+l/?=
 =?iso-8859-1?Q?Ae/RgkEkcGqEj5n3NTHuWdlG4b38B7rLTW9FOo/fm7ZNpE80iXGzLcny4R?=
 =?iso-8859-1?Q?+mUEfpI3jLrEb01ggaQXkZ2ROraXHjsojXHx7PxYxnVCqfoKqAN+0jRKUc?=
 =?iso-8859-1?Q?ll39zidn+kli2ld9xRSSA2MK08GPDxe3WHXr9xm9bqqyjrKqfHH6+31Cj5?=
 =?iso-8859-1?Q?cMRGssaxqS2sxhZqd028kq5FP88tGee9yJuLByiaDh6rVY8pJmV5VHnaHm?=
 =?iso-8859-1?Q?eSaJRFYDwAYr2ozn03EzXV8vqAMrer1dXTWxOT8Fo0mco5KVYgdgEyZrnn?=
 =?iso-8859-1?Q?iWpnvjtbUSdV2k7E641NSIr3ysaMP+ognJivPUL8J5YBmQMegOFshhBApS?=
 =?iso-8859-1?Q?ME67nM63aEK691+Ar/h78E0FSF0oYlSH/77kAsalpik/jydjENVrSMWnkv?=
 =?iso-8859-1?Q?2h4klmgd3EdfsH8s+uQPuWXZGEM9jrP9QZ4Y/9P4TxQR9GgX+jTC+56ulA?=
 =?iso-8859-1?Q?DBg+9vv+LNzU1kSsatdtGREczrbT2TUD0ONXQmwcV0wVmAfIsu4oyHaVA1?=
 =?iso-8859-1?Q?eVl82pFfy1/MDdKEigU4OqrvLIB1KYSeCfrcPrdsQCMERCy6F1VoJWDn84?=
 =?iso-8859-1?Q?n85F76hJ1WJ3lGmj8pvCFicS20DPeCDjYz9SN2rUEgfouT+m5qi4bccPlv?=
 =?iso-8859-1?Q?1GfJscobDR5VEEz0yJekQreGfOaFt+7mIow64OL7MaXs5Z/oOFNmpPGa7P?=
 =?iso-8859-1?Q?T4ECeL9sUCwq9RDmlt8g2sYvNd/5i9YPfUC8IlXca8GHsNJAuMy3mA6E/2?=
 =?iso-8859-1?Q?iNt3x5GZLHcfqVDy/9PJWaFSox3ZiBbaDcUfwm9skOKcc4fyiXmYY2EHJ+?=
 =?iso-8859-1?Q?Zx3QE7UC0/0NBPnjYug0wOnJ5gWXvh8Dqaj7nB7aYTRcu88q0U6XSt81yi?=
 =?iso-8859-1?Q?JQs6IOgH1d7txktwluYzDhRNxwlrO2uXDIT6Rof+1E6CXL+O3nHJV+weNS?=
 =?iso-8859-1?Q?V8CGER6uO5PIB9DKLCNCt8kT3pQTOnh/131tKCkJEb0v8C808G7gL8nuMQ?=
 =?iso-8859-1?Q?PjYvkD+XSD/iYnvN/tgJsNyInPVL1KUc1Q9wc6h9VvL5/+pR0P9zTnNO9M?=
 =?iso-8859-1?Q?/gjVf0pvAUPzn9kNEhUEsiz0vZ7nqAnkpX1AzxG6rYmE4egw98vjJ65ZxJ?=
 =?iso-8859-1?Q?K3bSlNHEH6FRafc+17wIlBFhvEK5QYsfSH5cVV7gnxluV+ogMZWAUHiVqF?=
 =?iso-8859-1?Q?XlQck/aLilftiqo7q0V6dXubxPq67zRJrCr+n+Aq/5FOnhoC+cg2TUFZDk?=
 =?iso-8859-1?Q?Xm?=
X-MS-Exchange-AntiSpam-MessageData-1: Ycz3yQtf/aP+NzPqFzdy0Ogc6SF+HawrRt4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9313eb4b-b391-4082-879f-08de7e8057f9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:38:03.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqVT2VgSBkKdIPyFRLndoMcUU0mT8iZiPoQKwY8Q6MPgw+kH+GA1YCWUTG7iTIjZ6W6EfGE76Ztq1MwGKx9K1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_013812_917596_5B8C29A2 
X-CRM114-Status: GOOD (  20.09  )
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

On Tue, Mar 10, 2026 at 09:24:43AM +0100, Heiko Stuebner wrote:
> Am Montag, 9. März 2026, 20:08:28 Mitteleuropäische Normalzeit schrieb Vladimir Oltean:
> > The dw_hdmi-rockchip driver validates pixel clock rates against the
> > HDMI PHY's internal clock provider on certain SoCs like RK3328.
> > This is currently achieved by dereferencing hdmi->phy->dev.of_node
> > to obtain the provider node, which violates the Generic PHY API's
> > encapsulation (the goal is for struct phy to be an opaque pointer).
> > 
> > Refactor dw_hdmi_rockchip_bind() to perform a manual phandle lookup
> > on the "hdmi" PHY index within the controller's DT node. This provides
> > a parallel path to the clock provider's OF node without relying on the
> > internal structure of the struct phy handle.
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > ---
> > Cc: Sandy Huang <hjc@rock-chips.com>
> > Cc: "Heiko Stübner" <heiko@sntech.de>
> > Cc: Andy Yan <andy.yan@rock-chips.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > 
> > v1->v3: none
> > ---
> 
> [...]
> 
> > @@ -588,13 +589,17 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
> >  		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
> >  	}
> >  
> > -	if (hdmi->phy) {
> 
> nit: a comment would be nice here. I.e. hdmi->phy being an opaque pointer
> so checking hdmi->phy != NULL is not possible.
> 
> With that being a "goal", I assume that information is not widely spread
> so this would prevent the next developer trying to change it back to
> "if (hdmi->phy)" while that handling change trickles down.

Testing the NULL quality of "struct phy *phy" is still possible and legal.
It means that you called an "optional" variant of phy_get(), and there
was no PHY.

Just that here, the ultimate intention isn't that. It is to abuse the
struct phy to get to something completely unrelated to the PHY API.
I wouldn't have had any problem if there was "just" a hdmi->phy NULL
pointer check.

> apart from that:
> 
> Reviewed-by: Heiko Stueber <heiko@sntech.de>

Thanks for the review.

