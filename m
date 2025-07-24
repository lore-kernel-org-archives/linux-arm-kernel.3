Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D036C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYbBR/vjtvPGQp6a/iAl/VH02ieL5RdhqTwrGy8yYEg=; b=iHo7y9rxmQaDOGEPb5aLUm5KaS
	8OsapM53XCpHJ/UvkD0YhbH8KcguAFtlG6vGHlIu5vP9BHKXYy3u8T1GtuEi4wCwFwJTqQCCQmDaV
	TkbWag+Dh4hGdKtAwwZyimxbAo/UdI7TsLfcvopfmPtcwwcom+PqZswiNPKTAAJWbumYfJfHEQ8fR
	l4Llb1+ty8Lyk111aPZ8kPHBsWADZDfS4TvIcJvTRWCyUQ/8rAyDfo+yI0LCc6tjLob1h7qa+b7mb
	Tl5REvK+lvMPULICAkezKWGYyGKs+LFysLsqh7PHD49umftEto7QZFLWkFi5FQFHjEjStaJUfv6Px
	RatvOheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPL-00000007dCN-2r0w;
	Thu, 24 Jul 2025 13:54:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevh8-00000007Tu1-2FDK;
	Thu, 24 Jul 2025 13:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HYbBR/vjtvPGQp6a/iAl/VH02ieL5RdhqTwrGy8yYEg=; b=gMB3Z0Re5e0Ku5KUYsXpWeF6CW
	QTTfHmKKsDRzxk4T4aBUpRGwLEoZrxHmYjiovGZX1VOCUh58SwscvBejmCwgkSNdaVonI2jMY1dfT
	6EDnSdXL5pyB2j/4FW038FEkOKguyLnl1YIxkunwLitGklZFTetQ4A2KBe1p90S2t8y7RYuAnNHT6
	iVTPEVC8iAFCxbCcJ7X91AQsohrM5Pww0SCpXexABY9T99TZuntmT9XD+bVFVq9udOzushM1nYBzT
	TEfGEUkZR8FxrnvwukqxJ455zKRq/IPB8bzMJhvjW+ff6MxSVeYIDRcAoH9kKMIsl3vMlV5Msy8nS
	IvCaybUw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uevgU-0005mk-HK; Thu, 24 Jul 2025 15:08:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge helper
Date: Thu, 24 Jul 2025 15:08:29 +0200
Message-ID: <22774005.EfDdHjke4D@diego>
In-Reply-To: <20250724080304.3572457-15-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_060910_571694_57291E92 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Damon,

Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
>=20
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Unify the API of getting modes to drm_bridge_get_modes().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

To keep the code bisectable, I think patches 12+13+14 need to be one patch?
Removing the panel-handling fefore this conversion to the panel-bridge
would produce a gap, where previously hooked up panels would not work
if a git bisect lands directly before this patch 14, I think


Heiko




