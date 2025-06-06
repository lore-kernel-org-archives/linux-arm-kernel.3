Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F676C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=; b=AEdqzb9yO7V08btET/kjCGso/M
	3/uwtFsQ9bwFRIwEt2T5Wf2QvX8a6NrtfPAHaPjRD6KlO38gqMUwH3mlqKfb5VEPfylzxxa7pjKaz
	dIr6i4Z5LFwxcJvAzeFmiveD+WrDd/CVIGJ6j/EeA/CyNR7Z89YO7xadaDFv+kWpSqvf6EudjvhzV
	FSblhMeiN0z8znfQX1+pa3V47EMnmV8XjeDkZVp2rmXECyqoI4RpfnMCtgVa8evLDGHigyU744qU8
	FF8FRTrKkCPqum8jhQl4PZqme7whs3gYOZ8RrciABFZ/R0HEzwTO1ZO24qAB/cQWQDmZZjmyD9ZlF
	TzHWXY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfJC-000000013rm-2UiZ;
	Fri, 06 Jun 2025 22:13:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfH3-000000013kd-1zed;
	Fri, 06 Jun 2025 22:10:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad69e4f2100so433872366b.2;
        Fri, 06 Jun 2025 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749247851; x=1749852651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
        b=Ex2XYQRKYqRLL2YmXPAwi3eEBN2cKcdYg9/4TiHBW5p4GWTOm8ePBuaMXD3UZK5mrw
         vBOaZpMyxZZ+kf7qwr2qyk7aTRpjFZ5O3Z+n4UTB6tjOT6+D8NsF0QgmOtngpbgD+/sb
         rmlBkRuP0w5Og26YzL1XezPygsHXfrCamF7CMQ1QfQo9eau0LqLDuv8nHTD4CIfRb1Ei
         wBytCXn4qnZ+1wC7I/n9Uf/1HkoCSm/hQJqZujha3EOMDbeBy5tBsy3xXBWfidLXN+7E
         2SmjKRK1OrbQ1SyRXk5XP9L3lODLSBosXHGd4zN6RbIaajvCzrCl+tfzUcjdFW6zvIM5
         xw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749247851; x=1749852651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
        b=uSGvai7S2r1nwC9jMkpxuD1UbPnVNhFsdwP7bt+40XPAGZPhpRs9a2XLv6x8n0C7Xo
         a/y3k7g/QgsTox/Tsx57P63r7GHyt3DgYoHQydfKmI/Gjyk7S6CEAtJm1DhJ92ljGV82
         u40Vgca1gekklMFoOIQyIVIYZt3x6AzbOMcIx4Hf9U/yURAF2HtTn1Ts/bQMe40Ylex/
         COLsvHA0plVfyTsPqLu2LAB4PUZNLNHPfC+Z2I432uEEh5DmJ0GWuuD/1qxntGAo7WxT
         jta2FDiS+qlLas7OywHm5HfMj3S3Utk3WmyQm5MF6Ti6ysRUvkGo5MVxXMWGrqxJ3exI
         vy4g==
X-Gm-Message-State: AOJu0YxLuZkB5cWY7tPehoDZ+TW82ZsYyesP2pGKVnNZsuesy5rvDWD+
	NU2b3kwnW+LFemZ3TW0Q3tRkcMNt2Sup2S6Lc6o/ifLgpybqNtik+ySmIjGtZQ==
X-Gm-Gg: ASbGncs6mGL9v03TajjmHr89piInrXKGgt9aLs6wUKomvmfvHYw9/uesE4dlMAorrQk
	pj4Llk4vF7TWplXZk2MHLlifIw4q5JclkUQ8sCRt9UbolaBXipzJoLmnZspm2XN5Tea/jD7JQgi
	JLj7nJmA+p70gAzi/prGN2lfySrUxCn3LuIOMfzmEIsEhm28yXPvEiWJdB4W4lANN7+iqBklqyF
	YCKWIlL83OES7ET3ZRJJStd59c730Q/jd5b4Bf3N2JHKIRWRxBXiTkGfUfF7WDgt0r49WbngpFU
	EUuv2ZBZO8CKhgPEwOB5bbf9TXqEc5Io+6QkVhanAX+CQ6KD8Mi41JfX3UqobJQo3N+Ls6CIKnZ
	gEJa9DhAAzU+ZKSSSIcdn82lkc32TFTvSZser5DOHHVWlybn01kFkkdmy9UkmDbMYQeZ4Rfhe2U
	2KDAPymFK/w0Lgg6+xPGZBgSRnBEMfJw==
X-Google-Smtp-Source: AGHT+IF2GDmxSpU2PUP8gOk0whzGQdZbH1jzBstBC+SVXNfKpbrPiO7RDCeI9rjuTtfJwFYp3Msy5Q==
X-Received: by 2002:a17:907:9628:b0:ad8:9e80:6bb1 with SMTP id a640c23a62f3a-ade1aa933admr431541366b.18.1749247851398;
        Fri, 06 Jun 2025 15:10:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a032-8c00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a032:8c00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ade1dc78f47sm178605166b.153.2025.06.06.15.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 15:10:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug print
Date: Sat,  7 Jun 2025 00:10:31 +0200
Message-ID: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_151053_530647_FF69DC4D 
X-CRM114-Status: GOOD (  11.52  )
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

meson_vclk_vic_supported_freq() has a debug print which includes the
pixel freq. However, within the whole function the pixel freq is
irrelevant, other than checking the end of the params array. Switch to
printing the vclk_freq which is being compared / matched against the
inputs to the function to avoid confusion when analyzing error reports
from users.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 3325580d885d..c4123bb958e4 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].pixel_freq,
-				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+				 i, params[i].vclk_freq,
+				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].phy_freq,
 				 PHY_FREQ_1000_1001(params[i].phy_freq));
-- 
2.49.0


