Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8028C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2hiFY2hGnNXO1OP9idJ8z5hnLIO6tDBRKKroug1f34=; b=PX5D7rmxnZUq4S4rADIBPpv5vr
	QX83SWOcXfvZ6BxD98M1gCb8d0OTKLc7zQi8fOsgeYi9lxmaFbtWLC3tKtxhbdJ4p/cjl/TIZQgTG
	Ag9FaZXliwQMO0Y/M+LtzpXO6fjD9EfhneNcP3KxfR1sR0bbMx3ZLGdkAher7OCTj6kffYWCqPQ7n
	ttkgYEqGAYd7hp86difCHhrdzXOznBxHSShZzL/0/3JjE+W6TPPAFKQk4q+CJDIota4t1Jegr2Wbl
	gaT3gDWWRAQBZiJdxKKcvskbGanPAN8i6vVcTVbPEMLE7J3/l5DhaH2WXFIho8Vmdln5z47ObMoAr
	zAZpFTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oTe-0000000FP2I-1q54;
	Wed, 02 Sep 2026 17:10:22 +0000
Received: from mail-eastus2azon11010007.outbound.protection.outlook.com ([52.101.56.7] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oTa-0000000FP1A-2QGK;
	Wed, 02 Sep 2026 17:10:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm5LPc9duRFPONomTZLvOB7+E0HgkuXfq1YD6QQgH3LA/8MKE0bltL4nPRkmlyjVq7j8Ch+uzA+0pbabKOQs8IWkPH9GmhkpcI2sE9c9psWdyu5im/6xKiP7KPId/8jTH+g3IjNhBmLJ2454klREDRkQJtIMmBHqQk7VnrLpyWmZjO8FrnZ6JdDdi5k3yWWUqfNJBfav/AI1sXZdmExIyzwcS8arK7MebEimnXkf5xIYqF/d/zqhzmSTgoRAhbUgtwSGWjgQMg63ATMPBvP+Vc8R0D5ymbnTWNIJ8qYCCs7Er3zhdWijAaQXAVzbfkAwXnNtxTO4RbWTbGxSUMgtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2hiFY2hGnNXO1OP9idJ8z5hnLIO6tDBRKKroug1f34=;
 b=bDJ26EeYSrx3fovZT0qlcMVS+4abVNm2vOmApU6Q+C/LPQgo5rcFMhDZhkwP4kv3/yKM/yvDlNO4KpRs+XJ/NOCfuHXkqhKEltprrc7HgOTaKzoiVUOzYi955uq9o+T4ZKLEzGuZjVcwf4nNT0hFoKF1FWDtBc8uHnL2fBxC+V+/n17RkD2Z4ieyv4U4NKD6t7iJdBxMUPCFPKMHkP9FoF/fi+XpPvsBw4zJhXc3aBL4AnQ7vb8Z+H0G5slA2tRizABO4qn4Gs99o7XzmwDDKM4ARPt6e+My0i1F81IksniMiZjH3+O4v8PryykM8mtr/MQKtqFQPM5cKjlX6jmYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2hiFY2hGnNXO1OP9idJ8z5hnLIO6tDBRKKroug1f34=;
 b=YyXP2J1/6eA8LDP9tqcV8PqSUrFugaX6Ic0ggd9EnSPj8P5SB3ENFYR2oCy5jJoFku7nqnNF0mQsvNIiIjKB0Ey4bR6asRkyF5w9Ts4EUGtShazhuMe8oVurpvZ9VLo8ya7147b6pFi2kIiJ5T4Lk1rPJQmB8QLhN+/HtsgdB059AOOlVJh5YjFz04yCHXMUxewO1ucMvufXpXwRlSF5GsXg9sohaa/5sEjoWyUv8d4xFjF8LgCF6tfQZcVwHUxcsPogkncXYJEYAkU54VC0W9wZH0FbQy03xyizCONMOeIwsfO4eu11UKR8MxfgzxQxtbhoaBWOBQRZN63uFr7VmQ==
Received: from CH2PR15CA0015.namprd15.prod.outlook.com (2603:10b6:610:51::25)
 by IA0PPF92079A48C.namprd22.prod.outlook.com (2603:10b6:20f:fc04::d3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:10:06 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::21) by CH2PR15CA0015.outlook.office365.com
 (2603:10b6:610:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 17:10:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 2 Sep 2026 17:10:02 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 5239919244;
	Wed,  2 Sep 2026 20:09:57 +0300 (EEST)
Date: Wed, 2 Sep 2026 20:09:57 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 20/23] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
Message-ID: <aphYZfYAaLsNAR6g@zeus>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-21-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518180206.2480119-21-jonas@kwiboo.se>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|IA0PPF92079A48C:EE_
X-MS-Office365-Filtering-Correlation-Id: e17928cf-493b-4ccc-0277-08df091507a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xuw+GrTGElR/OkXhKZvjjHDrJmcd/3n3QunrXBVkUS20CnGaVSgBDrm3bq9XLMzb1IHQjdSnmBlh/phVnTElwcm1laKD/r5dROzxTPIPjWGhWT1SQRTia+TEpxGj+cT4bQqQ74gBguR2WZeliSrf6Qc8HTh98d3hABmzklnUGwQqRyA9n37Tak7Xqu13Yj7cvVRJrLdb7+F4Nk0BudB1GVPEO18TopKlsitaZd8xC7XNkevaObb6lvZcVTwYnILbGiwEB1WI2p6pw61HnSuE3LWS3PhOpECCpCItHctLlALf5xmEA1n4utpdXNAOZJWzWlTf8PL0AU2Li3l2F7PJ2pOlUaTq3MukWIpbG7ecn0WD97vUr1TMYRObaz7L+hW4Grw2JAcbbJ/uV0qAr6ZT1PPlo3hyv61dARH/UrymfSCcUZIlo4O/kMc6Bn3QvUzfCMGHiQbVjHuirLF3NwEz5lRnv9+6fnBeD6z749tYY9bfRJ/Qg2Tn0i0j6vAXHaccUqrrf85V07FRpLp3i8Eye5qc+3oll9lkic0qNBTOtfgCDPg5HfVh3sRjziGQ79BGynF9J0JBrCI/u1j7UKZ4g+Ytwpwe2yZIT8TBaMeu5NfkqW6kt5fu9cjyVRE0N0xEl5Epjf18dG51/vgpxOIfMZasJObq8vRxFq2K+fDp1q/DKNTFQ8aSdll5vCqCYt7zyiGidDkgmaDJP/hGUoKAyg==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sLAYLR8IZDQxXuu4TTwf79ZthXsiE18A+DImCSy6D4ILFZvBe1vUUDpvngANDfqlsbjL6eL6lBQvNQAmxBSimPVP8V2YO+b+CFCjrtOnXn2fA05i3QbQ+UA8E7hlBRZwmJ3WnnDkmZKiFcMhC8U1tdh58ddYgMOsZh/2mgbLqICrV6Cc37quHdzJyZFcFxBSm0Tyyz0OWeWcw867NOfzbSnbGCSIuyyt+/Q4CVYE76NjjQDOYe3EYUuGJX7ftHnczYDMtnDjM9pZ8HU4V+Z9nzl9Aph58uCuRvB/kG2ueFKp0iH0YjlBJgtA/TDZ5r2nJiVdvnOewA4m7cNrVRWULWNHJUz4h9wSwuBOseB/VxLYXDE2EJCFsLsMYKoh9EWpZxvzfQjGN8yECyf4ouQ2Yi/d5+xOw6B6ZQW7zJgFXzmAf+DfOuaQSHKUYi6gwbXe
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:10:02.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e17928cf-493b-4ccc-0277-08df091507a3
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF92079A48C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_101019_257002_26144983 
X-CRM114-Status: GOOD (  33.48  )
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

On Mon, May 18, 2026 at 06:01:56PM +0000, Jonas Karlman wrote:
> The commit aeac23bda87f ("drm: bridge/dw_hdmi: improve HDMI
> enable/disable handling") added use of PHY RXSENSE indications to avoid
> triggering a full enable/disable of the HDMI block when a sink use a HPD
> low voltage level pulse to indicate changes of the EDID.
> 
> HDMI Specification Version 1.4b chapter 8.5 mentions:
> 
>   An HDMI Sink shall indicate any change to the contents of the E-EDID
>   by driving a low voltage level pulse on the Hot Plug Detect pin. This
>   pulse shall be at least 100 msec.
> 
> A delayed work is now used to debounce reacting on a HPD low voltage
> level pulse when a sink changes the EDID. The delayed work triggers a
> hotplug uevent every time the connection status or EDID has changed.
> 
> Remove RXSENSE handling to simplify the HPD interrupt handling and
> instead depend on the delayed work to detect any connection status or
> EDID changes.
> 
> This also ensures the initial HPD interrupt polarity is based on current
> HPD status to avoid an unnecessary interrupt from being triggered
> immediately at probe or resume when a sink is connected.
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Tested-by: Ian Ray <ian.ray@gehealthcare.com> # i.MX6


> ---
> v7: Remove clear of STAT0_RX_SENSE in dw_hdmi_remove() added in prior
>     patch
> v6: Update commit message,
>     Collect t-b tag
> v5: Add comment about interrupt generation
> v4: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 147 ++++------------------
>  1 file changed, 22 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 270db58a0e7c..2e09bff5faf7 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -161,11 +161,7 @@ struct dw_hdmi {
>  	struct pinctrl_state *unwedge_state;
>  
>  	struct mutex mutex;		/* for state below */
> -	enum drm_connector_force force;	/* mutex-protected force state */
>  	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
> -	bool disabled;			/* DRM has disabled our bridge */
> -	bool rxsense;			/* rxsense state */
> -	u8 phy_mask;			/* desired phy int mask settings */
>  	u8 mc_clkdis;			/* clock disable register */
>  
>  	spinlock_t audio_lock;
> @@ -196,14 +192,6 @@ const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
>  
> -#define HDMI_IH_PHY_STAT0_RX_SENSE \
> -	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
> -	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> -
> -#define HDMI_PHY_RX_SENSE \
> -	(HDMI_PHY_RX_SENSE0 | HDMI_PHY_RX_SENSE1 | \
> -	 HDMI_PHY_RX_SENSE2 | HDMI_PHY_RX_SENSE3)
> -
>  static inline void hdmi_writeb(struct dw_hdmi *hdmi, u8 val, int offset)
>  {
>  	regmap_write(hdmi->regm, offset << hdmi->reg_shift, val);
> @@ -1702,36 +1690,25 @@ EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
>  void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>  			    bool force, bool disabled, bool rxsense)
>  {
> -	u8 old_mask = hdmi->phy_mask;
> -
> -	if (force || disabled || !rxsense)
> -		hdmi->phy_mask |= HDMI_PHY_RX_SENSE;
> -	else
> -		hdmi->phy_mask &= ~HDMI_PHY_RX_SENSE;
> -
> -	if (old_mask != hdmi->phy_mask)
> -		hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_phy_update_hpd);
>  
>  void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
>  {
>  	/*
> -	 * Configure the PHY RX SENSE and HPD interrupts polarities and clear
> -	 * any pending interrupt.
> +	 * Configure the PHY HPD interrupt polarity based on current HPD status
> +	 * and clear any pending interrupt.
>  	 */
> -	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
> -		    HDMI_IH_PHY_STAT0);
> +	hdmi_modb(hdmi, hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
> +		  0 : HDMI_PHY_HPD, HDMI_PHY_HPD, HDMI_PHY_POL0);
> +	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD, HDMI_IH_PHY_STAT0);
>  
>  	/* Enable cable hot plug irq. */
> -	hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
> +	hdmi_writeb(hdmi, ~HDMI_PHY_HPD, HDMI_PHY_MASK0);
>  
>  	/* Clear and unmute interrupts. */
> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
> -		    HDMI_IH_PHY_STAT0);
> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD, HDMI_IH_PHY_STAT0);
> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_phy_setup_hpd);
>  
> @@ -2395,26 +2372,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
>  	}
>  }
>  
> -/*
> - * Adjust the detection of RXSENSE according to whether we have a forced
> - * connection mode enabled, or whether we have been disabled.  There is
> - * no point processing RXSENSE interrupts if we have a forced connection
> - * state, or DRM has us disabled.
> - *
> - * We also disable rxsense interrupts when we think we're disconnected
> - * to avoid floating TDMS signals giving false rxsense interrupts.
> - *
> - * Note: we still need to listen for HPD interrupts even when DRM has us
> - * disabled so that we can detect a connect event.
> - */
> -static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
> -{
> -	if (hdmi->phy.ops->update_hpd)
> -		hdmi->phy.ops->update_hpd(hdmi, hdmi->phy.data,
> -					  hdmi->force, hdmi->disabled,
> -					  hdmi->rxsense);
> -}
> -
>  static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
>  {
>  	enum drm_connector_status result;
> @@ -2512,9 +2469,7 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
>  	mutex_lock(&hdmi->mutex);
> -	hdmi->force = connector->force;
>  	hdmi->last_connector_result = connector->status;
> -	dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
>  
>  	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
> @@ -2932,10 +2887,8 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
>  	mutex_lock(&hdmi->mutex);
> -	hdmi->disabled = true;
>  	hdmi->curr_conn = NULL;
>  	dw_hdmi_poweroff(hdmi);
> -	dw_hdmi_update_phy_mask(hdmi);
>  	handle_plugged_change(hdmi, false);
>  	mutex_unlock(&hdmi->mutex);
>  }
> @@ -2954,10 +2907,8 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
>  
>  	mutex_lock(&hdmi->mutex);
> -	hdmi->disabled = false;
>  	hdmi->curr_conn = connector;
>  	dw_hdmi_poweron(hdmi, connector, mode);
> -	dw_hdmi_update_phy_mask(hdmi);
>  	handle_plugged_change(hdmi, true);
>  	mutex_unlock(&hdmi->mutex);
>  }
> @@ -3060,78 +3011,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
>  
>  void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>  {
> -	mutex_lock(&hdmi->mutex);
> -
> -	if (!hdmi->force) {
> -		/*
> -		 * If the RX sense status indicates we're disconnected,
> -		 * clear the software rxsense status.
> -		 */
> -		if (!rx_sense)
> -			hdmi->rxsense = false;
> -
> -		/*
> -		 * Only set the software rxsense status when both
> -		 * rxsense and hpd indicates we're connected.
> -		 * This avoids what seems to be bad behaviour in
> -		 * at least iMX6S versions of the phy.
> -		 */
> -		if (hpd)
> -			hdmi->rxsense = true;
> -
> -		dw_hdmi_update_phy_mask(hdmi);
> -	}
> -	mutex_unlock(&hdmi->mutex);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
>  
>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  {
>  	struct dw_hdmi *hdmi = dev_id;
> -	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> -	enum drm_connector_status status = connector_status_unknown;
> -
> -	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> -	phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
> -	phy_stat = hdmi_readb(hdmi, HDMI_PHY_STAT0);
> -
> -	phy_pol_mask = 0;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD)
> -		phy_pol_mask |= HDMI_PHY_HPD;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE0)
> -		phy_pol_mask |= HDMI_PHY_RX_SENSE0;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE1)
> -		phy_pol_mask |= HDMI_PHY_RX_SENSE1;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE2)
> -		phy_pol_mask |= HDMI_PHY_RX_SENSE2;
> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE3)
> -		phy_pol_mask |= HDMI_PHY_RX_SENSE3;
> -
> -	if (phy_pol_mask)
> -		hdmi_modb(hdmi, ~phy_int_pol, phy_pol_mask, HDMI_PHY_POL0);
> +	u8 intr_stat;
>  
>  	/*
> -	 * RX sense tells us whether the TDMS transmitters are detecting
> -	 * load - in other words, there's something listening on the
> -	 * other end of the link.  Use this to decide whether we should
> -	 * power on the phy as HPD may be toggled by the sink to merely
> -	 * ask the source to re-read the EDID.
> +	 * Interrupt generation is accomplished in the following way:
> +	 *   interrupt = (mask == 0) && (polarity == status)
> +	 * All interrupts are forwarded to the Interrupt Handler sticky bit
> +	 * register ih_phy_stat0 and muted using the register ih_mute_phy_stat0.
>  	 */
> -	if (intr_stat &
> -	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD)) {
> -		dw_hdmi_setup_rx_sense(hdmi,
> -				       phy_stat & HDMI_PHY_HPD,
> -				       phy_stat & HDMI_PHY_RX_SENSE);
> +	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> +	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> +		enum drm_connector_status status;
>  
> -		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
> -		    (phy_stat & HDMI_PHY_HPD))
> -			status = connector_status_connected;
> +		/* Set HPD interrupt polarity based on current HPD status. */
> +		status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
> +		hdmi_modb(hdmi, status == connector_status_connected ?
> +			  0 : HDMI_PHY_HPD, HDMI_PHY_HPD, HDMI_PHY_POL0);
>  
> -		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
> -			status = connector_status_disconnected;
> -	}
> -
> -	if (status != connector_status_unknown) {
>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
>  			status == connector_status_connected ?
>  			"plugin" : "plugout");
> @@ -3141,8 +3043,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  	}
>  
>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -3343,9 +3244,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->dev = dev;
>  	hdmi->sample_rate = 48000;
>  	hdmi->channels = 2;
> -	hdmi->disabled = true;
> -	hdmi->rxsense = true;
> -	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
>  	hdmi->mc_clkdis = 0x7f;
>  	hdmi->last_connector_result = connector_status_disconnected;
>  
> @@ -3599,8 +3497,7 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	/* Free, mute and clear phy interrupts */
>  	devm_free_irq(hdmi->dev, irq, hdmi);
>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
> -		    HDMI_IH_PHY_STAT0);
> +	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD, HDMI_IH_PHY_STAT0);
>  
>  	/* Cancel any pending hot plug work */
>  	cancel_delayed_work_sync(&hdmi->hpd_work);
> -- 
> 2.54.0
> 

