Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BEEC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQbaM/nV7s8rQwS5hxI6vhWiwkwOmBmwl7dlesgVmd0=; b=QAHev7bZo7TwNtN59VwJOg2JBT
	OwubiOljbjagU/FYjisbQOoN8tSbSCQyhzNNfpd+aMFxQNyAPlqOwPZJcwhe6AuVe4c4haGa9IUb5
	KwvW6cJ7FwXkObUUmiW1lPMsMpDKCQDWg6DrXaPUAvw8DAgocV2DS+HXw9sPkyB2fNMdNWON45oUh
	zoJNr41DfOnN9DyBGQagsD7Ni8eLCV8XZh/s1/Xp+ftDjToujqG0pPJnG19He0cgzqHzi+G5VhzQT
	TeTGMTtnFxGQrj86jDpIauTFkk+COtkJFTsqMKerb2k0bVE6oOr93AHik19G+cEYccAKpuQkoboBe
	RsSdLU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7KA-0000000FLKA-41tZ;
	Sun, 23 Aug 2026 12:29:18 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7K7-0000000FLJ3-0yx2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 12:29:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so575000a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787488151; x=1788092951; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQbaM/nV7s8rQwS5hxI6vhWiwkwOmBmwl7dlesgVmd0=;
        b=gLANTptY7CnRqkp5wmjhA+4mPZ2a/lZbO4DfU9T/+xDD8zHIBzMhXuMhkFV4UHc5+v
         UzLfa5M1YXFoHfrt9Tu99qSg0D+YP0Uukg0otDjHxmxdFrEqvDORpEtfRYN8Lk1VNWC+
         MCYQVNrx5HLCLVEnf7KkjDvUksbUbQEEhdI+bqUM9HC9bofyyYha7cUehky4vCKJPaxL
         gOxYN0TNojKwErGd2AOYFSHiF2iJlHU/daqvesSbg9WYl4xKYoObVCretQYIMM/mC/P4
         d+4/uL89C7ESKCvIIaYynhaRzfplZcqNKQmyEMbN7s6gLInoWSBYn9g0GxB/g46ltFYR
         auuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787488151; x=1788092951;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQbaM/nV7s8rQwS5hxI6vhWiwkwOmBmwl7dlesgVmd0=;
        b=a3sLJaE+LpOPLCFpWz4KuDCz9oOgebxFihhAvf8v6iEBH3sBi3f3pl8Z+YCc+Ga1F5
         kDTblE/Ezux+Lb+KxRYs/JCjj/Vb61Y5mxGGSA3A3Pd8YSfIzfDf6GalHtnl5vIl41nj
         2kBwBo4sN1w/bu8Np6a2mGblEVYhUzVyjvQqSQqUjj8PMM8QIZ26fs7FDickRC3/qrWi
         zMRNxCzvsZYSBV7NmMv05sKGP8ukzHlN1P0vFUUgp4fP1VK0tSTvvsmTC6fGmFgxW8z8
         U6/tM+swtMVpiuQ9aZWJ9z3IzvzEuhaC8WJgazrMMVbEQf57f8iRmPznE84D6liZTAGe
         v3uw==
X-Forwarded-Encrypted: i=1; AHgh+RoAR2/T91V2ZHaZAorvDDh7FaLvsN1L+KEDZOV/d1ZHMAieHBu70W6Y+YcQy9rNiRmNl5bNyT7XepJQaVEQ6Dz5@lists.infradead.org
X-Gm-Message-State: AFuF++kmG6nJ2RJqwgQBz3neR4SVgj8HrA9UYiS60LON0WlbVVMUwrs9
	Fu7jUY9cDIrmxQmCK5a6AwXxy2cjg7gPJbU01Zihjhd+2E0JrrT061Tp
X-Gm-Gg: AR+sD11T5lvVGkmSpOoD8jEgLhBK/dpzBo05/TQsx2+gIOjqN5LYvXW+qiJ0LHWjhdC
	TFBLqXHU48lztnBlQIDk67w3PSwcTOe9mc+Z740IKSKcridU2Pixx/bPh5So8ELlaD1NKtnuE9z
	vsr0PJX12oxyK4J6V0+BvAh1sayNkCpu6sKOyPgO7dVmoR+ZTXdrQJDIUjjv18VR/MG3ewhOFt1
	cBL8+veNjK/InlEtw866602h74b9q6KKre+cDhR239e0Lfr8VPB0IqYZmHLqVhOh+YWpHCqbB/0
	OFW2N+J/urF4Zyn36nS5dCUAdKWZDWU9q3hlKaIjCFJ9bJiLJbWYvjC88yqybWU2iabsuJgynig
	NmJLQYcosSldiT36q6fQ652jYePOAQM8NdyKWcpSuhluY8+joOsbkExukag6C/bZUAF1TqizWGJ
	B6dpwNWIn+c/BjJNuHqjgS2VZNMcSBMWuSP8t3adPBajxZpSML27wUg5PlBLj3is5Za99InLc1h
	qx4avI7uqFtE7yCMcZAXwshkZk=
X-Received: by 2002:a17:907:1c26:b0:c21:8555:5f55 with SMTP id a640c23a62f3a-c246a65eda7mr1238908466b.2.1787488150919;
        Sun, 23 Aug 2026 05:29:10 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm738037566b.39.2026.08.23.05.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 05:29:10 -0700 (PDT)
Message-ID: <1ab6fb88-3b84-49b5-aa05-202a84edbd3d@gmail.com>
Date: Sun, 23 Aug 2026 14:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [RFC PATCH v1] drm: rockchip: add
 drm_plane_create_blend_mode_property
To: heiko@sntech.de
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US, ar-EG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_052915_285659_3DE4A84E 
X-CRM114-Status: UNSURE (   9.21  )
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

A validate_blend_mode_for_alpha_formats() function was added that
fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
Add a drm_plane_create_blend_mode_property() function as fix.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

https://lore.kernel.org/all/20260526181700.25310-3-leandro.ribeiro@collabora.com/
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 0090d8ff0c79..0bc5b606f021 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_plane *plane,
 	if (flags)
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   DRM_MODE_ROTATE_0 | flags);
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
 }
 
 static int vop_create_crtc(struct vop *vop)
-- 
2.39.5


