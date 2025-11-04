Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C12CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=; b=G1UFoXSEVSi5ys3mZjlc36cBcN
	JFZy0S+9NaFQ0aJpJ4HBbQK+cHc15oKVGTtLRk5AWKe6uKnwlCbXQ22IO6lfSe2f9JQEGer9scCV+
	sMJzsjMvbE6zXYbTc8LtNXpDBhWcU8TAaQxVlz1gQDi0FOu9qhNGa8narpsfcnglmtVqyQxiCiDqW
	nj37pUIY6o/lvMn4/ILZ6n8wxvPoavxsXtgvnNvri2ZaatU3/lOA59uP+TC1rLUQhu+nB3wwPn56j
	xQ7GkhSWxACXQERSbuRtxxbZbRZH0POnHVRxgjnIN4Nj0VPnJgJ/PcdTRrSqD/FHN+D5+h4qd54bL
	h6jNgXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUW-0000000CM2X-1y6o;
	Tue, 04 Nov 2025 18:10:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUE-0000000CLbP-23V3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47755a7652eso8492635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279828; x=1762884628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
        b=ffvHsKKwzsr0wHl1Ou0aC8fwHQ0ArhnP3sOvl/CJZ3SAIZAyubr8eghUCvuKPRSkl3
         eXo7wSWI52gPbHnCOYdy93Y54hF3KDHH+JAIBCKtZ179Z1LSzyGoU4mnnvEmjKzUs5vP
         PFivyyZIvytiaDSTyXGljfgwk+rYiDmEUe/wf9uLCF8h2k1UW1QqQvQDsnnflvkFQoV5
         uVVqqQNseNHQ/cXeYNQX+p876Ep487XBJNCYu0OtbitI3JsDL0q5heH3O7THsJDwZTve
         CRcEqeq/YCt3BDRhsd9ugc6FILKI22sS4l8FMHZ7yr1Y5x8/bWb1zrNW1gNoS9JiWyJI
         lRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279828; x=1762884628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
        b=HWfttTvdPyYYyNcKfrSHucmaOqAZjoiEGpRG8JZsGt3AaaWnZMbZMC6Xtn4Bon5rYE
         KZ53G8nXjjrLwGz1B75Adm+V24WRt/L3YiFtJ4OwSk8L7AAKrIFpoheVYYqOdfEZeBDT
         QdorWEm0ycn0usraxLpNASgJVHY2VBqNHpsC0elXmvg5/A4uycC9rqVhHbLnERTHW64c
         MEiYtXpMbsvsmmVzOCN0djyuLOY2lwgXtfGfY4obISj3k6FP/UZxX4pe8OfkB+DF+tdg
         JVLDgY16Fm5LiB+1hQIN6eq6sTJ5rPOK/T1YV3z0HORURHhEgpL52+ja34eDvUggJJ2+
         iW8w==
X-Forwarded-Encrypted: i=1; AJvYcCWyO30x4yBFW4DdIsqUKLwjZAWbjz+VhGJh85kgckFN99Zm4KG+IGhbyeiqdPsG/cASepN7jzDywst65dwr2qAj@lists.infradead.org
X-Gm-Message-State: AOJu0YynaIL3Q1fP9OtLpC49e5rG60Y/G3HTynOMaqcFJKpQe1oUTrHI
	hT8hN/BeVMTujXl7hpRtexz7nwgqkxf+eJX7dw9aW8QXlfzWSnaj0j/A
X-Gm-Gg: ASbGnctSMXtowTj07jXlqBb5PCAEYkDBVsTXkrvcumzd0RZ9blwnGkEUdSUz3j+rQh4
	FRoIxapxM7883JzYmSAtdADdcDLF+YH3fwCCECHEXRUyJ1Sz3rR2L4z7JeACVseeg2oBC3pMkYZ
	SwajBkjmsjSZURWERyQ3v6ASckVC3PZ1lsjHM+VTiBwHogcXAsRyiR+yn9yelIsG/F52m/8OnLe
	ToeCKbg4B3EgJa6i7zOoaW3Uz+9cF6nc9ApV6kaDLwcqnbYUpHe3ujejWfGQZljaXlzApKZ3L4t
	yaAZ0QLSh0OXyhCqUhrLEuuU2tGkIcua21Ur7agL10nBtoLeFJ958lHE9kqUIT8f1S6FFw0dzQI
	WSIl52z5ir8Ms05ICPDCt7ShfzYKpOQoKLTV9eve08mwzee0mwr7l3OWwrZj9BvuMAS1N8n6wNI
	CHPVZk6/VQaPyIag0YIg6QQKxyA3ka
X-Google-Smtp-Source: AGHT+IF5c8+mHZzz90mVXQjinbLLHXZDEwGQ66eyEvr+K8f4HxTWYfLZ4fwJ/Z+IpDrhmhZsMsoK/A==
X-Received: by 2002:a05:600c:64cd:b0:475:d917:7218 with SMTP id 5b1f17b1804b1-4775ce7df88mr2080215e9.36.1762279828376;
        Tue, 04 Nov 2025 10:10:28 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Tue,  4 Nov 2025 19:09:33 +0100
Message-ID: <20251104180942.61538-22-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101032_306118_4F687DD1 
X-CRM114-Status: GOOD (  14.45  )
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

Layer will be more universal, due to DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ac7b62adc7df..c371e94b95bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -227,22 +227,22 @@ static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 	}
 }
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state)
 {
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
+	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
 			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index ce921521aaca..2a4b79599610 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_color_mgmt.h>
 
 struct drm_plane_state;
-struct sun8i_mixer;
+struct sun8i_layer;
 
 /* VI channel CSC units offsets */
 #define CCSC00_OFFSET 0xAA050
@@ -23,7 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2290c983e177..4f0c929faf36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -301,7 +301,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_attributes(layer, plane);
 	sun8i_vi_layer_update_coord(layer, plane);
-	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_csc_config(layer, new_state);
 	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
-- 
2.51.2


