Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA5AC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=; b=VrjR15XO4b3UP7iHO9+GpuU4os
	Qu54NB6uQlg7Wp+J0KIqHPg2Redj3pL84mJr7nyLClR1UhnLSIzg+BLYXIOkq0/Zp8vBK0O6KXlrQ
	+5Jmm7uNIEVmd3osNoc79jsFpz/J1d0EV570YBg4+zIyDOMMLST1VyF0ahfJ5uHQtRFzbRdtClWZh
	W92bQPNNxY4Ycbp7SMAz6qTNEti7ImjxAz/EpJWszAzVDzbbnUyDfnjK67DDdTwHYKyXpmcEE/5Mc
	YXwvmhWqnIfbo1gWMTsnK0VZgtVVlvTE3BiSALot8OLVgk/fWSkqr34dkK3Ccg0QYuVM/3DBcWWKc
	naZcgmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDV-0000000CVOi-362i;
	Wed, 09 Sep 2026 17:36:13 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDS-0000000CVMq-1doG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:36:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-499db17b40eso2293705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975368; x=1789580168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
        b=gWgUbP3cr1cg+wOoSQa/cB00ZQ48MrgdKdI0lGtXesZZGbsZ48wBmkuqembfLUO21v
         HnQ7oMdR9jP7MbFA4RLwg4Gs9KsQQ0TCG18aulr6TzmQuHeKblgd6E0Hfu0qJMgO/LCh
         IN6LEH2NOu9V5hPgfkONUIHNm/xLvK13acJSLwvahco+VAM2LYiMJjR6mh8HIJ5/WIH8
         YSxsUwiM/Y9C40KBJRy8ecG8Z3O9ysg7NTp8tuvOtP2ayY8idXYaPd4KAxuxM0vGMhDT
         3XXZoJ18q+X9MmrAquUU+/AHbOpQA2YZSWe3sGmzJA+zRYia+6yfQ74+txM2IeTaXzuh
         r4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975368; x=1789580168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
        b=sCjv+I7LlyNylXPiwgIxTymxrKQ4qK7dzuBv61cyqSFlzgDfXLIbNRswLJEEzMm3VI
         ZCBdGK7Spfv4ZIE9zheqzZoCP9CVKbuKvCRl1hD+zx0w0qKyuivTDOlQRZMvSamIh9A/
         oi8buGfBk7Rd1ud1tx3a9IYq2yAL+Ge2zq/k7HtrS7JW/svsyaOjSaL+02rF/maMJV+8
         /i9jZGOcYoqzNXgKsiQdr98bE0B3ZmKLy8wgwTi7KD0fZ5I+NeCXD/bZP8lnHxlhO0gg
         pNsuGZTyzGj3E97eIJyfxG3IT4M6hWjbxSg10qcZFQ/nrKP6MZU03a5r5YcHsvZeSVzv
         B/sg==
X-Forwarded-Encrypted: i=1; AKwUvBzM8OHLxijSNXlcl1JMcBrxo6uKj3+ubTOzzjRJJEQRTOz948aVzI/Wh8t5lAoPuLjLQ54M7h/3opH8A1bAIhrR@lists.infradead.org
X-Gm-Message-State: AFuF++kGw2MpeAVf1XzXzdpIkQx7RiXhuX2yyEa3fVi37erAclR9zrFa
	6mTW8/fhxxwA6JFdBUuYhyWnmUl7NtwsOi9HBsOV+MjQOuiUciSPitYc
X-Gm-Gg: AYBFou3/l+GFywCwsdwdbs9vxHrJmxG6kcu25DgRyfxVZrjlNm/UNOizBAik4O6Vra/
	axbE0aquu8vZBuMqbQTgRaxBgYjgnfZnE+gEvmGnOxWQCxYQd4nCrYMOGZN3n4yTMP2htIH31hH
	2ZbhJRgNRTVn7RX4G6Lhtn87zq35VknrGudrv/ZpEyMRUIJr+rlRj52kKJCsvw26dMtdqFtsD6c
	ny/c2T5UtJwnhPip/UYWgCFGGKyRo5gmGoRVmpBarxEVytxvs2mgP3n4LZs7aWnCPBqn/QyBEAN
	ABpPrQlprKjhnQt5gKC0VI4ddfkzTnree2S1w8AL+2fcNVSPEu6TZl97rijls9zihosHLKjVerQ
	CWVfS3W2rajl5F0Kk6Vcu5CgPGPRkEOGgqzD1Q34IdFUg5JSe4pbx5+bAaln4fM09hGnJoMliVd
	idy9VGbL7BI/8QFjAZBK8WUywfQ1L0irTne7ui2rVt4SKe/4KZaeLCvH2X7BgK/BNJDtukXuSfI
	ZVFeWTRkLI7hRG5oVNU8rKaGEiBGZQ8FlrLTpFP6zs9mUv2zN23mGs1Yj//EjJEmVAAzE7GrI5S
	Cw==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr256409415e9.1.1788975368210;
        Wed, 09 Sep 2026 10:36:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper, and max bpc for dw-dp
Date: Wed,  9 Sep 2026 19:35:37 +0200
Message-ID: <20260909173542.14030-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_103610_447048_060A42AF 
X-CRM114-Status: UNSURE (   9.92  )
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

The three patches of this series never reached the lists. The mistake
is mine: when sending, only the cover letter carried the recipients,
so the patches went to nobody but my own inbox. I noticed while
checking the archive after the fact.

Resent below as replies to this cover, byte-identical to what should
have arrived with it. Sorry for the noise.

Igor

