Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD29FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPC/fPRplTXrPRJP9WPEDmAAHY+62t7UA57bz5CaOyI=; b=veBEl5lsQZ0zMeH3J7ptDgi8Ja
	d2oVSWdQP/5rsmdl4DlOYuv/VCz0IXZKGvWwPp/Nll/R/XQkpCmeX/pyi20iyKFXrEQt9FnV+/REY
	JHsly82uyebTFi51eoU8WquTgxgzp7JUwSw4hO8IMwdT3n05OCKMcHYWN2vbOBgu7yKbOzLewHvwi
	7i5797VGJeHeMDgDUnutq0gGUkgG/yOYMDqNbEmCqLUA0gQH7Y8hAFcF2ZTcayb9MNJOLLXTO7k5R
	OECL0WoNXbTbeYZ2JGwbgykT2pd7RyT/v24kqApL21CCv0ucrXoQ/1wl+3kcJppA2FqGhn51q1dWs
	neR7FfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYlw-00000000Lii-4AFx;
	Wed, 08 Jul 2026 20:21:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYlu-00000000LhB-2fv0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:21:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c7902f47so8640515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542088; x=1784146888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPC/fPRplTXrPRJP9WPEDmAAHY+62t7UA57bz5CaOyI=;
        b=nZW9m8oXtvFvUdw18vHQloFzykFxRZu9aimgLZ8eWhsx5zggGk0j5EQjhppS3kBc2B
         gdJZtDIACof83OwcWBsW4STkWMcmb5zQWfbYYOYssKA4bwJUmTdnTYJcVL+egQbXdp8V
         8Yzm+yockOq1CIV4dikG4vPPAmZacTUs0uKltxEh0Vgpcj+yjHSWzFCqAcZ5fkPm9FUI
         bYvGXV2aVjbuIcPAkdqabnaUerQPzpHdPe93A8XUfvcKaxFEFyWjty/i7I9fEokae1yi
         HVVgQnAngYaJr0Ql6guinRAxHp4X34m60V70r3+ij621xz+zkQNh7QLJ6hnDUYZT42dx
         36Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542088; x=1784146888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPC/fPRplTXrPRJP9WPEDmAAHY+62t7UA57bz5CaOyI=;
        b=qjmc11iP5aebJW/elmoxMo1E+f0TVi16Gn6lQ5kH3ycrIzMAWRC011Q4HbTMc6iPhX
         vmxSCdxGnoWZWJ/1TYWa+RQqDGvVE4mfvNECME1PMRjhPxx2o5es676UvLzYQTflnaLQ
         TEYZREpnmrRy3vQVL9ymG+DhahU0lLBpB79t0f4SXERrBwN3GpqpEpA8CMmK0m5kY2uN
         +KfiVDP3i+7RavV3t3TMPrWGuP3r+yE322wR1saz52TrcWJ5ZPXUcSpUshArlFsweUXw
         0jhSqdYTD3tcI0aIaF49XraWSXhGuml0PQxtr9hSU9fHDDe0J5NCLsa9/z/vMSM2rcb3
         074w==
X-Forwarded-Encrypted: i=1; AHgh+Rob1hSenUQyqsmZXdA6LApcf6Y1GfTxtN234jhWgYrNjlaxK1tFf6XvINtz+uBSTV7UJrcnTXCZP6TvvWnkOMBF@lists.infradead.org
X-Gm-Message-State: AOJu0YyDiFGUMBO0WnimYbilkJ5xJ/zLox820+ntHU6T62xTsHQziWRk
	we4d7YwF6x1zE+sQ/VNvfNpyMZ3zrT5T0Fwla8kIPyaYZXL7amY7fwU5
X-Gm-Gg: AfdE7ckQ4/2qK84rWnXKXoeKaPey+X03AmKGSt4RSSA3EomsNsj4wYQACp6FS6NHpUq
	QKg50C3t+Hv6xHjDcQJYD7SxDF/dRcxN6LqR/+kv0kmR4QP+hxif2IhQrDG8/FmyZDp20VbRnMT
	JVAvzo1TvwOfmCmN9uzJe0FF4LqbZH/kq8K8mzS02d7R/Bctlkgs3afzGhutOjCrWv0gKr83d8L
	H/DH2yz4pAVcqLX0EOH1a1cj/0xj20bzUbGOV7x8wPjSIGwuQcsRJNSUv0KBsyuNkeeGndD4eYp
	KsmY+eFbGbxe9YhXlWwxnxWDdvvk78Bvcm3JJm3op552YCzgKCbkwBaBaKGm5KkoxVUV/+DCvFg
	NoTXXsyvktKsej8txTd/FKCPo6M4kH2MvFWt/RlyBgY86Mtx0dtwU6oG4A28X+AM7673Ey7mzHZ
	xZ+0ICeySkIAh1TD/wBXV99tMBuanx/epnRWC9dib0gWxjutmgjA==
X-Received: by 2002:a05:600c:3e07:b0:493:de89:61b with SMTP id 5b1f17b1804b1-493e6868766mr42351155e9.26.1783542088002;
        Wed, 08 Jul 2026 13:21:28 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:2b86:7192:b44e:9f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e54a25cfsm97381485e9.0.2026.07.08.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:21:27 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/imx: Fix ipu_plane_duplicate_state() OOM handling
Date: Wed,  8 Jul 2026 22:21:23 +0200
Message-ID: <20260708202124.12560-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706140246.41506-1-osama.abdelkader@gmail.com>
References: <20260706140246.41506-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_132130_688022_AAF822CB 
X-CRM114-Status: GOOD (  11.69  )
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

ipu_plane_duplicate_state() could dereference NULL when kmalloc() fails
by returning &state->base unconditionally.

Return NULL on allocation failure, as the CRTC duplicate helper does.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- add Fixes and Cc tags
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..67f2da7f2b65 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -323,9 +323,10 @@ ipu_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	state = kmalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+	if (!state)
+		return NULL;
 
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 	return &state->base;
 }
 
-- 
2.43.0


