Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8609C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQpilYnt4FgOjs5+1tewTfyxrC4VggVjH4vFHfgXSYI=; b=YKqKRLgnC8UQjanaybpZrhnAEB
	Lu3XoMYAzFCD9ZHgSu4kbyLIv+enHvleq7z90zwtzLIZzRDX2ET/tKGETOp2yZPW6UtS+Va3Z3V1N
	leFBgeixkvrBOCuoKPJBG46YSTQOmmJhKnaGT8XsXCU7CzUKNs4oQ60gTq8nWmtbOTaOLirVMBbHL
	Jt0xj+DqIcrwrrPRBjUlwAHuITGEB5UdMGGkBPXJG15s8V7+7EokWoKnXurK3elDoM3EoJz9CHPqV
	ZXRiveMEhGc8wB22BdLdu/AxqfXkffgbzjaRiaPXS7lB9WY4oLrwrt8N/zlLAaKf6OCUiS6kWmvo9
	UuzEfWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulixV-0000000A4oI-2xRn;
	Tue, 12 Aug 2025 06:58:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliuq-0000000A4c8-0Y0V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:55:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23ffdea3575so33482675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google; t=1754981722; x=1755586522; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQpilYnt4FgOjs5+1tewTfyxrC4VggVjH4vFHfgXSYI=;
        b=dnjc2umO7jgv0nLo/9obmfjmWg0n7YaH5GY7Q8jbaC3+kSm8lDhg3u4O4otT/0O+JP
         Qnkezbqg98iEHN/CXsAuytbMEAhDiUGwth8gpBSQY4momkLrUym2UQwXlYK31KLNFUxD
         KflXZx7lP3SOu9pAnRXOdckx9MmJa74LUBpUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754981722; x=1755586522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQpilYnt4FgOjs5+1tewTfyxrC4VggVjH4vFHfgXSYI=;
        b=NVc524hwfBedR/NsfHb8FZKQfVLjCZSCP8SvPqQYZ2QxYd7klJisOSetz3k0FaK6tQ
         dTCjpMKWPnuT9MbBMUq2hOK0DZQUEfLCq2qsb+NUXp2mN3+HOh1a/Q1ClCopPqJINQpR
         2oP/reWB0iBAKSZuqAG4BCrXjSJyiMO37kf0yoW5Z1KfieASVjKa+GBohWFUmR5+8mN9
         GY+bk8jdxDRjJRx7uPOEaadO1FWooKVO6ZBo1KNEG2CJs86GthQ4IxEpp2xCq2MfpvWf
         CTHJvtSX0XvdHpTSk8krdcN3B0VrWbX0CTFnbputqXnAn0FY1aBVYJaMO7GGobAUy9RZ
         XT1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/z618U+rHH/PBbAHQp1ApHBf7OrQA02u18YyL6dxZ/JjcAgWZCBwun1F6zojCeLD7eL5mILUlvMwQiPPkxmDf@lists.infradead.org
X-Gm-Message-State: AOJu0YyWm65FxBSQRoF/xS7nE7QZ07QlEsG0XI1RYfI1ZP0GM3KiWJeo
	SVXWyWJlGiTuth55fg698w93uBnrk53yohwOIdDeB0drHMjptqH47R/jy55AWEP1vXs=
X-Gm-Gg: ASbGncuW7B6gAE3woDOTayQgWlpbKqjEwFJws2w4zVU0UEgtcQJiDq4E3yVD3LOlMw9
	lrkDvTAcGEtyRB3MAMSYf42IqcMEzsjBP1Ai1ZXKsyvxtfEnHe+xCXmiZJKLGw1RBztgMkVkS+w
	J+hcB1BV1Y01mbWDSGLblo5vVmMog6nc+73JbuDTJoJSooibyxcXeRoSQe1Kv6ZakBrLd4N31wk
	32hDCls7XhbXlbXRppUhrNnVgGq418N0yF/3YvyvEUVowDIHXl5kHZ+zQ9ngOq+hnMz+NuINr3S
	MM46vKpTeYxF8bHleqSfFbXUkn7hKOjJGr6qDaveh8s1qFB33I6ZFYbDm29R+Ut7iSKZGLAdY4A
	MsvVfozykg+B3OKZ7IZ3ZLMtmRMtYsj3xKFZegnDHKSwi1Rasxylye5E=
X-Google-Smtp-Source: AGHT+IGZE5ejnVJXLy+u8D+y8H3N4C4rUcjtSocvHp94fOPiHgfZuivNo0dcelQy8UmjKn8/qCY+Yg==
X-Received: by 2002:a17:903:124b:b0:240:11cd:8502 with SMTP id d9443c01a7336-242c203d160mr209522875ad.13.1754981722075;
        Mon, 11 Aug 2025 23:55:22 -0700 (PDT)
Received: from 8eba3d7b3083 (122-199-11-121.ip4.superloop.au. [122.199.11.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24300f8ca2asm7538825ad.141.2025.08.11.23.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 23:55:21 -0700 (PDT)
Date: Tue, 12 Aug 2025 06:55:15 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: rudi@heitbaum.com
Subject: [PATCH] drm/rockchip: cdn-dp: select bridge for cdp-dp
Message-ID: <aJrlUzV1u4i65NRe@8eba3d7b3083>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_235524_386434_DD090E08 
X-CRM114-Status: GOOD (  10.25  )
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

Select drm bridge connector when building cdp-dp.
This was missed in previous commit causing build failure.

Fixes: Commit afbbca25d06e ("drm/rockchip: cdn-dp: Convert to drm bridge")
Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index ab525668939a..faf50d872be3 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -53,6 +53,7 @@ config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
-- 
2.43.0


