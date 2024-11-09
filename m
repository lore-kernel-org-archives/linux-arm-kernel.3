Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D1D5E387
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKSRMiOUcm6WD8u8BC8dWSf2cMiJUWHKxDSv2viQmW8=; b=YxUXNopNEJyQdhUK5jhRgaO7E/
	J2e6TkS2LZ0tRlnUpJuN8WTTWQbnkotzJ+dGW4FFRAldCD2BMhRsVdvGG77mjnWAsWk8mYJxqdQbz
	onHfMTdYC8vtzt14hc1l5oNtX9qTItcvYdcMCTjTOY0EVa6tHd1kYyhsBrAln0IZlsnqxVxV5HFJa
	w9shzIE/PW2gnLuff6hD+M3Mc9Px+yem3wDMsKtuXK5DX8S35F247HVKXOcOU/5we05ZVCZaCXzQb
	KqNJxDVTT20GJm3Pn6j0cpHuquX5l1Boc2BmxwOpHzcXvEPobQzNwoi0nn+Ux0hwYE38y1pU0hXxm
	XSsE+hgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uOj-0000000E5E6-44kc;
	Sat, 09 Nov 2024 22:57:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uJZ-0000000E4ej-1L8v;
	Sat, 09 Nov 2024 22:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xKSRMiOUcm6WD8u8BC8dWSf2cMiJUWHKxDSv2viQmW8=; b=xPjXkOJtxqvG76fVuVNp5QubWb
	bQ0iI5yrwfAuEASUpIVWgtuMSVgQyuv66vDW774RBFsdR8ZiDlFVoofuhSxPJtG6jLnSf6ajXzDl9
	xK3xe+vi0ed0tl5t08dmKy5Qfq4HZWHbSJJwndZ9XvMNqBdasvMgnIc83x+4laGZ7jLOuEQDzTGq0
	YERZBfpp4KgNx9TPeyM3Xc+STaPipzugGrjpzwqsoyhJXSwsTawRPDpLKtZirXn3ue8FXpjTHuJE+
	FvNoEtwDkA7Xj+FYKK3kNtc6/PYR/dHvwpXu65IPkXoKoJVKH4Dl6OGRW2PZrO0gaYwYCHz8ySp4b
	J8TJi0hg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9uJO-0000NE-FH; Sat, 09 Nov 2024 23:52:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: tzimmermann@suse.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	mripard@kernel.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	Piotr Zalewski <pZ010001011111@proton.me>,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <didi.debian@cknow.org>,
	Daniel Stone <daniel@fooishbar.org>,
	Dragan Simic <dsimic@manjaro.org>,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Date: Sat,  9 Nov 2024 23:51:57 +0100
Message-ID: <173119266841.1201296.14807724034242534977.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101185545.559090-3-pZ010001011111@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_145221_378261_5CBBC1BD 
X-CRM114-Status: GOOD (  11.05  )
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

On Fri, 01 Nov 2024 19:01:17 +0000, Piotr Zalewski wrote:
> Add support for gamma LUT in VOP2 driver. The implementation was inspired
> by one found in VOP1 driver. Blue and red channels in gamma LUT register
> write were swapped with respect to how gamma LUT values are written in
> VOP1. Gamma LUT port selection was added before the write of new gamma LUT
> table.
> 
> If the current SoC is rk356x, check if no other CRTC has gamma LUT enabled
> in atomic_check (only one video port can use gamma LUT at a time) and
> disable gamma LUT before the LUT table write.
> 
> [...]

Applied, thanks!

[1/1] rockchip/drm: vop2: add support for gamma LUT
      commit: 4f537776340dab2b680a4d8554567f6884240d0b

I've fixed a number of smaller styling nits that
checkpatch --strict found.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

