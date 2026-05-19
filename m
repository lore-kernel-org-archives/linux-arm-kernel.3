Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLSJynfj/SfMKra6MuoVzzg6ibW6tvdwMbY0XP2994w=; b=n0hP6TN8fkBxR34PGSwt4uKmvq
	Ky8PKl20CHQUHuEV32KSn/DkfptAuexQUFGR9/mZp2lnwPRkDZYAedge/UzEdjkLp33ewf6QiniqL
	J3OO3ULgr1xdBVVYPWhIbfxMhbT9DCGzVKPIDlVhlAvqfCqZKCQ6V4IGGfZFA6ZSCa1Cye3pMfvlC
	eQnPPr0QS20y2zGnyTypFzXfdeSDUe6M/OJQCxxgZ99Kx9022Lf4xXLDO+fx0q7HhBSTCNpyC/kuH
	P6UCx6eelAfsWTYTx0nKdXNyk0YaBBHqMVRATDzGDlNARNqnfOdwtd6qyithEGXCZ/uaRjExhN4Uf
	RWfPnXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLkw-00000001teF-0bRz;
	Tue, 19 May 2026 14:49:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLkq-00000001tcb-1LPg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLSJynfj/SfMKra6MuoVzzg6ibW6tvdwMbY0XP2994w=;
	b=Vh3K2p8S6Rdre+e+cMWxUM0fbUj8fr2EJr/itzZA838USrzCisNarOCsfxzzvtJbvTSfLb
	Y9gN3SlT34zo4Eb5iXhi2TIGFOCqoN3X2r/O1bOarPGSRxTlbxwrXjGnFzQHF4LISA8Qwz
	SdIfeVHRzW3mUvrpaDauz74kM85mcos=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-9Fjm7GtkOl-ASfiJ8tVIRA-1; Tue, 19 May 2026 10:47:37 -0400
X-MC-Unique: 9Fjm7GtkOl-ASfiJ8tVIRA-1
X-Mimecast-MFC-AGG-ID: 9Fjm7GtkOl-ASfiJ8tVIRA_1779202056
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45e7c7289c3so2137638f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202056; x=1779806856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLSJynfj/SfMKra6MuoVzzg6ibW6tvdwMbY0XP2994w=;
        b=KNP6UjbNOotAPEJLnEG2vvaf2I0wJCu7ckbEnu/tU33DA5J/EoOSeIC4Np7SbxM7nb
         xjnWXl36TyeBfYFuGnEQEA+xT3Al/tNkZBkiwT3ELgVjXNtbI0KcERFnmQg5229u1nQ3
         T4TbhH6yBBw0kqFIc62K3GIK3JtPX+bc+Js86FDXEa1BQHvpn6CJmxu+4Q7hX2fUrYx6
         JdB/LFfCIPHJBLh3ofk+iTeM+c7GkBtt37iJ/QzRNjOnyE31c+09lwxfN7u2uMgCfqR3
         KBIBgqXWEa0AlMnxaU2KVbcnQjAZBs1mZgRs74w44zr5UlGqZwBTkxAw+YqSs4cDu5bS
         IzkA==
X-Forwarded-Encrypted: i=1; AFNElJ/x594AFpv12jxOvmRKB0SLz5flDgyWa+e7KDHuBsOLwU4NIddlJrzAghLtHK9En3aAqHb7skOTcHsxP5fcV6oq@lists.infradead.org
X-Gm-Message-State: AOJu0YwdldRnpb+b3Knt4T9sG1Q+ASuS/3sPp3VS6hALNTLrP4U+XqR9
	ssogbfZGBH0s3YRgIGP8NYY5TNsh8Z+RQPMG9NudYruUvOk++jMiqFQj0ewVELP+D5pyKQ9GRmS
	Ll8mwiDnwAQKqMUQQLr9RebVvKFO5GeRq4DnMtCXZdq/LOMJGHpU4q/ArnMo/w3HD0Oy6SFYwJB
	N7
X-Gm-Gg: Acq92OE0cntoKTZa64/tb+jrtBcYLHd1AQ7k5heAKsIJFN6ydFoyNdjh7H5Pu/iubBr
	7VrvxcJNixUqDgVlQXFRdAhY4HP2B1No6LIBRqAJySjDWMCmVLLcfeSLceUdAZsFGUnqFzxk6pI
	Mv5h7+tKz1+wpCY5O3uSowgw2mDL7DybBUfmfZMo5WLiIFAp0fDLffNWJjSx73WP0qvkQyI/qzS
	5MU1lC1WQUATFVk6TDTDmp2RWfEoACy7czau2ALrp2TzzwBnbYDTrstF1y1hly9W6fK47Ev3plH
	4RsTf0EbbwBg4SFnUIQNdyQ+qCI9Xc8gjrY0Q/qHjW3BSLUKBbm/Q5x9Ru24QYLc3A36ZXWVTWD
	siKlOFXIqgTyVd/vd1lebvDBnQQmZm/umI5qavRiLDX1axuM=
X-Received: by 2002:a5d:64c6:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-45d955021f5mr37986703f8f.30.1779202056261;
        Tue, 19 May 2026 07:47:36 -0700 (PDT)
X-Received: by 2002:a5d:64c6:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-45d955021f5mr37986653f8f.30.1779202055797;
        Tue, 19 May 2026 07:47:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2f738sm45113118f8f.16.2026.05.19.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Samuel Holland <samuel@sholland.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
Date: Tue, 19 May 2026 16:47:02 +0200
Message-ID: <20260519144712.1418302-7-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519144712.1418302-1-javierm@redhat.com>
References: <20260519144712.1418302-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WcHdJ_v1trQNgbkG5QHSUuBUlJDQRxP7o5-u_W2WhYs_1779202056
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074908_428207_A49FED22 
X-CRM114-Status: GOOD (  14.75  )
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

Replace the 165000000 magic number with the shared constant defined
in the <drm/display/drm_hdmi_helper.h> header.

The old comment referenced "HDMI <= 1.2" but 165 MHz is actually
the maximum TMDS character rate defined by the HDMI 1.0 spec.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 07e2afcb4f95..723a6a11c94e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -189,8 +189,8 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (clock > 165000000)
+	/* HDMI 1.0 max TMDS character rate */
+	if (clock > DRM_HDMI_TMDS_CHAR_RATE_MAX_1_0)
 		return MODE_CLOCK_HIGH;
 
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
-- 
2.54.0


