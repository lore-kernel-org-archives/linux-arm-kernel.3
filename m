Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C0CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zfgCd9JZmx1G3JenYZxMpetacJxXe9R/CJ7kBOkKzAo=; b=B2N1l14myQ2JTGsH427FbRcFZk
	dBpinKuTGQ5Qwcrw2jeDRQjXXVKFOfCcNQM6Wcgv8FBkQFFbnA9G3eqaNba3AbaybquDoT9FWWtrM
	D2SDGvW0sd0lSLuouHJ7fXEdg0lBOPUdQmfq06j8JbiqRi5l36henj60ahePckPH9Rpxdcz9eTTrY
	DhjJftBcWZCjK7j7xsGGoV92eAuXyfvOpjPB3kyeHnfAjUFXzagJsgkrryqB+iQYfy1gZXPDdFZCG
	DUyBUKR4xMEs3MXsNhAEArae90wl44Cmnqxzhetyjugldl73UMlVb+M24CJRd0p68VjIR8Au4qf5F
	OwJOyw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc4-00000000rLk-2P1S;
	Thu, 13 Aug 2026 14:40:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc2-00000000rJy-2Tex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:40:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f502ff678so239117f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786632052; x=1787236852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfgCd9JZmx1G3JenYZxMpetacJxXe9R/CJ7kBOkKzAo=;
        b=cmk6WRa/WNX04NhZ1FVYDqoiFGYbm66RMqxEekirV6ei4jHJZzthhA2HXzBAGPKZvi
         3FYBQ/67ia+T3cRS/qNlSnHOMICOutUBLNFGyMguXsvfMqu5CP77o/VCEPa2wIrd889t
         cLvrbqPDqiq5Sfj9KlBlg72Ru5JlwgYLrJ47Tu7g75mGC6A5E7Nw6pfvBWy1MISgjEpe
         zmNIDXxUygehCWbVdSZJvL8nsYWyqyVkiWqdouimPVqt2S+9BpsQomTe5cnQkSPVEgn2
         vKd/5/euE5Gg3Q0VLh8RAC9DtEatRFOgkWheT9c8HmqGstRUF0nNJa0lNVmYROYRXIXa
         O0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632052; x=1787236852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfgCd9JZmx1G3JenYZxMpetacJxXe9R/CJ7kBOkKzAo=;
        b=WfEQB98EJSfe0XJS7EO82v4GvYj+ZOv1OqeCy5v8dLjar16BaRkcLMkqXLtRngZMeX
         ete1khuCj5kKQFwHPySV4CfPnw7y+kq7L/bOxzLGZ1gQCgeCyAbvCr3PxmWoScynZFdK
         zjMaLt+7mzt539wt++kUHdJAj8HjAE++H0YJb1e6p1ZvNYelC+LOLtIY1nCM8pT6e1Uo
         4MrzlkyGhxwOuU/P9hP41vteGnrDfeMC7FSQH5kUGtJwuu0x0hMUaV5cqgwbKorHJZgc
         WF4bPGBqGHebmu2TVE8DgjX6Mkwx7/Q8cP4mqhLlVgLOSvHi0uS5kZWiTxpeq/k8gc/Q
         XQ7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr2WE8l7y55jvLBMz37f+18xbZ/3uteqmcY6dC7Ew1qSHOWxQsNyABwFARGSCMLnR/a3BFhMdTm7aZuNvjYHvoD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqklq5kzgx3W1wDn2EOEdTtt+F2ZneoBdGBe1ii/5AUGxrh46I
	JbB2TfjVzK7kOWf3767oMY0Gm5fwY6M/SPSvBPWMXN4N74qltgLpF76s
X-Gm-Gg: AR+sD13QavOxLrY9EtcfukTzaOfm7B/ZmOR4sDR1a45R1d+1DMzzXFeR+rIiTtc2IfP
	azr2DGcztkYfb8hLJubZpQGx5KYWZ3xfwQ27tyTVCoSVz2WJnW9+VW3V2L3+J5CAQnSHV/vqDbd
	fUdwGwBqYC5y4eY3xfTPjZD2OTjYXpVawkFaWcdSLUTYAfYH4FJJulL2RDFvJJRn0Mt1NxJI3xe
	ruy7ucdRauYNbyrhw/aPNPQOqmzG7D+HX8Df2BkUj+42dTLJwB2m2rPQUlImjdBHb+vfoK2KQnS
	SYthwZabBFprU05XfCrn8lvOF0vQDjhAi2Dmcr9TdwzUNgVpI3thjcevWCqrdQIJbd7+LdfzfV+
	mQ0OdDxTxJwuz/+Y93bpkjDI8cz5NqxerFq9s9DKphCHdxanmXpOsGZolY4XKvEPt2vQxYa9v9U
	db9DLqg2YVBOXpn8T2yCgtFVgkZQONixhFSrAO6lURMDRrnxOHch9P6UEti27StH2QNSefIkTDg
	cP3yaDi61KsNZ/CAXBJTBpczYtBYrfVPjiZwMc74aA/+K+Pja26B7Dx+h7uLBSRmSNXXvcpiyIt
	slNr
X-Received: by 2002:a05:600c:3ba2:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-49982617b0emr35862875e9.1.1786632052215;
        Thu, 13 Aug 2026 07:40:52 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C00AE6C52CFC8961284.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:ae6c:52cf:c896:1284])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b58700sm66426445e9.9.2026.08.13.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:40:51 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Marius Dinu <m95d+git@psihoexpert.ro>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 0/2] drm/rockchip: Add missing DRM_BRIDGE_CONNECTOR selects
Date: Thu, 13 Aug 2026 16:40:17 +0200
Message-ID: <20260813144019.12089-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_074054_635532_17452FD0 
X-CRM114-Status: GOOD (  11.12  )
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

While testing the dw-dp v11 series I noticed that ROCKCHIP_DW_DP does
not select DRM_BRIDGE_CONNECTOR although dw_dp-rockchip.c calls
drm_bridge_connector_init(), and Sebastian suggested handling this
independently of that series [1].

The ROCKCHIP_DW_DP gap was in fact found before: Marius Dinu posted
the same one-liner in March [2] and dropped it when the failure
stopped reproducing in his build. The failure is
configuration-dependent - any other enabled option that selects
DRM_BRIDGE_CONNECTOR masks it - so it can come and go with unrelated
config changes. It still reproduces on current drm-misc-next.

A sweep over drivers/gpu/drm/rockchip found eight callers of
drm_bridge_connector_init(). Five options already select it,
ROCKCHIP_INNO_HDMI gets it through its DRM_INNO_HDMI core option, and
two are left with a latent link failure: ROCKCHIP_DW_DP and
ROCKCHIP_RK3066_HDMI. The rk3066 case additionally needs
DRM_DISPLAY_HELPER, whose module carries the bridge-connector code.

Both failures were reproduced on drm-misc-next (d85a5e9dfb42) with an
arm64 allnoconfig-based configuration enabling only DRM_ROCKCHIP plus
the option in question; with the fixes applied both configurations
link cleanly, and an arm64 defconfig re-run shows no new Kconfig
warnings. Both issues are present in released kernels: the rk3066 one
since v6.16, the dw_dp one since v6.18.

[1] https://lore.kernel.org/r/aneNCDU12OzG99UX@venus
[2] https://lore.kernel.org/r/20260319155051.1944-1-m95d+git@psihoexpert.ro

Igor Paunovic (2):
  drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
  drm/rockchip: rk3066_hdmi: Add missing Kconfig selects

 drivers/gpu/drm/rockchip/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0


