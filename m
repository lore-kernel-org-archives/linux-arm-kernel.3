Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83744E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTTJ7OXYyAx1ZfgndTqE4h/ckOFQ/YcOcAae/xgQEag=; b=XECUJzdgWbHU3wz78xbYBdQJnE
	P/0pusVKCI2Aeq9CdjRZ4FU3mCd2x/BQoQjNAJdJUptGT5fgRU1TSNLh/hhzJ2/W7ksGop7D7OUTv
	0Cluemw/35CfGzxykvFM0P3YPdPi7bDEUJhXArfsicYW3MLF2llO+bxUsFhwpA+hzj8bnF13fZK3m
	dm7Q7cDHJG+ZAW0pkVNGwZfA9FxCpFhYGL68w4IV6K/DjCY04VmZwlZrW+hqbDkONAjHZ3Q3xLROA
	WL+ZxbB971tlz4v+WVTa+hrg+tN1TGhsPBShvFZBZHZ6/DGOxr9iEBbUwXNk0fuDh6Dzra8peDdrB
	V1dTlpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVVa-0000000GP40-0Zxw;
	Wed, 11 Dec 2024 22:48:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVT3-0000000GOff-0i1g;
	Wed, 11 Dec 2024 22:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hTTJ7OXYyAx1ZfgndTqE4h/ckOFQ/YcOcAae/xgQEag=; b=p1hbNECZEwBWUAgaxNeC1Tlcoj
	wAQH2rQ4G3jlo2BreciTOPns32SqGt38zjTf7LxF8wwkkyf7+4LH6w/smAq3z6jn9Fte6HWOitOtS
	0vYKD3OdHneMetLfIFrero1Je8c65M+mLpPAZVQUDEINo0xtMoOrnjbgQiCnV3zZUhYzYWX8rd9xo
	SshdGUMJnPcIUDtJallL68TdKMw0/8jYKMigH/VbHjFzRPJ98ieFiUrqy5RHwH7mRQjH8u7mwhfQi
	H9uOrhMCBUtZsiVdkFIlx2A+WF8DSdVHcKZQnoP4byn5/jeWEbF5eRc60ZmPMe/VLkUQBrSVfZoDz
	Ci6wvPTg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVSy-00000003uQZ-0rTI;
	Wed, 11 Dec 2024 22:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hTTJ7OXYyAx1ZfgndTqE4h/ckOFQ/YcOcAae/xgQEag=; b=rxk48gwtwxdly6V7kB9jzrpiHP
	MHVGl65qKQC+teywOmweE8tYOCUobbt6HUZXL/4IBedWNWsIhmmdYWNioXllEWuH0HDWaCHKAP3C/
	XvvR1DhmrKg+EJ7MZXHxQO6epJgNCk5Kg1OvGIZA1gPiC3jm0apA5YCoRiYXpRy7E+bTBMI+bxIva
	tfUMM3WSfVeQV+MnBlEgSz039UVtbHKuELZczrjjcbHvmMrakp1uKkvQ6Cev/CVw0y3nsKx5Acoy6
	OuPHNGQYFskLSOdc2yC2gEHRyrgqNv01AAefVYe3mFCXIedNyTlsob1yJJ+NBuq0it3elEty/1VAm
	MwtRSJWg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tLVSj-0000ON-3w; Wed, 11 Dec 2024 23:45:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Piotr Zalewski <pZ010001011111@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Date: Wed, 11 Dec 2024 23:45:41 +0100
Message-ID: <173395708760.2509957.1013367330408721282.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206192013.342692-3-pZ010001011111@proton.me>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_224600_470092_0790E85F 
X-CRM114-Status: GOOD (  10.32  )
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


On Fri, 06 Dec 2024 19:26:10 +0000, Piotr Zalewski wrote:
> Remove color_mgmt_changed check from vop2_crtc_atomic_try_set_gamma to
> allow gamma LUT rewrite during modeset when coming out of suspend. Add
> a check for color_mgmt_changed directly in vop2_crtc_atomic_flush.
> 
> This patch fixes the patch adding gamma LUT support for vop2 [1].
> 
> [1] https://lore.kernel.org/linux-rockchip/20241101185545.559090-3-pZ010001011111@proton.me/
> 
> [...]

Applied, thanks!

[1/1] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
      commit: 9c22b6ece2e5c2308f41ba4bec27cfa158397fa7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

