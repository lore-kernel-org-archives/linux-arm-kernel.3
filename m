Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF85EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=166qCuS3GrAlXI6brs6QxvJQpFd4voxu1ZjUSc4jdNI=; b=4BTFc3k7tvADkDWQHUP22hgeiz
	+kbULblYgjtkRIes1thbuYxImZiDe/lBpzf6rvtc2PCwkplBpFPU17Jf7XCJ2yYYRIUNQ4JkwF5Vj
	kHGpBHFaQ6+ZnHjZAfF+R3FcUchqLJKK1iVbx7LUqSkqqROdsC2eLZlSsNTfyVBTlVKLj/octaUq4
	KtLnNt6kxRCg6yK8MPXjkQNCIywamAEAIrmbRR859AC7mhJn3f/hC+zlzwRk9cFmixbhPuws7pX8r
	C7Vdo37CFw0BQb/HvjJkMWDDbAv5HldlACpZPcPbyU2dwaf+mKmN1Y8xMRHCWctPEu+8HkJesiE8U
	7rdUDIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt9Z-000000093TS-1svQ;
	Tue, 10 Mar 2026 09:13:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt9Z-000000093T5-0qwF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=166qCuS3GrAlXI6brs6QxvJQpFd4voxu1ZjUSc4jdNI=; b=CMQvtRrfdmVHWmZy0a7Q1+9ENY
	VfXVFSYCO2Y8e0YbZON4GYKE1IVQ2L1YuFbKs1dF3pjRqCQ21CWWzslz1xczfH5bnHXAiRZTpf5jI
	SWhcPeEZYmG6A2VnHFmwKAlxMcBS95EpJhOPJ86i6GUdang+nU/io1XLXrSmewx4/Fw55ejYeYeuF
	7kWvlChMd69KBL9RiN2daQszopTDI0REEtJyWAeILj4hewsQajSYT53XQmlC2t7YR5tUCG02WpeYt
	VDZV/qXwPSS/LHOjp8pdGeAejr4I/nVZknGBNrK6KjI/5vNHpFXZS2WXnL7f+TzMu+1U8HGZPDXbk
	JMO40OaA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt9N-0000000E4t1-3xES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:13:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8a-0005gc-A9; Tue, 10 Mar 2026 10:12:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8U-004fp8-2w;
	Tue, 10 Mar 2026 10:12:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8W-00000000385-0VM0;
	Tue, 10 Mar 2026 10:12:20 +0100
Message-ID: <7414fb775dd4c9a0a1c00f1452ef128de300ee06.camel@pengutronix.de>
Subject: Re: [PATCH v10 02/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 	tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, 	krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, 	dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, 
	jani.nikula@intel.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Date: Tue, 10 Mar 2026 10:12:20 +0100
In-Reply-To: <20260310012458.169272-3-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
	 <20260310012458.169272-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091314_234558_8F5B4CC0 
X-CRM114-Status: UNSURE (   7.48  )
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

On Di, 2026-03-10 at 09:24 +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

