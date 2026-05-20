Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1tSo1G68Ra9imzMIPMx7cCxGvcqmHD7eyQZ4RzsS9c=; b=bAPOsXbF2m0ArsYijgnU9WAVWx
	3Hpy8BX04hHpxWVxk9goUmGX9MR+lSnP0gM4A/NTqL9+X1Mj4QHThlPoJWKx+G1uwsHka3DZ3KuRc
	uqBC/PlkyngvnjyehTdp382ALgU1WSr9weBWVdCTdeyc8CplHLUOHOrunK+s50FD1kCG0jt80Odd4
	99+jvfHfGOIYuiKVk688rCyuQ6iNlv6ru0+EJHhAfiiltUnjA7vudUxYGhU5cwXeq8vKf/U54fwUC
	08XDrKTz6Zu/4kBET8Xytn9PTu0FkxFGAsXKi5QIuLSQPNMVw82oFuCkq2Prqi7dunf5ntvo+IDMT
	sR72sseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiAK-00000004s49-1I2g;
	Wed, 20 May 2026 14:44:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiAH-00000004s3M-3eGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1tSo1G68Ra9imzMIPMx7cCxGvcqmHD7eyQZ4RzsS9c=;
	b=YCu7z4dVWhNJWYN6FkEuCiL00nGX49fTTpFO35cVMAyMDWpZ76PoNHsQIfc3W1VjkznsVb
	4OM/twFwK9nXqB+j+y8Pah+lEQ4mfJKTSLo0VnRB9NdwHfuzDhviDUUvMYKy8sv3Xha0En
	VzSpGfjmq5zhLPDXPkd1uguKek5Yvm0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-BmRA8S6vO9iPa3CI05BIRQ-1; Wed, 20 May 2026 10:44:44 -0400
X-MC-Unique: BmRA8S6vO9iPa3CI05BIRQ-1
X-Mimecast-MFC-AGG-ID: BmRA8S6vO9iPa3CI05BIRQ_1779288284
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d7730e9e3so2856895f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288284; x=1779893084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1tSo1G68Ra9imzMIPMx7cCxGvcqmHD7eyQZ4RzsS9c=;
        b=J0nMfHdvh9Vnl14q0DtzwYY3OMtQeGUsci6Z7FBnr8I5jpnfRxuQQki/Dt0aJeugNV
         HBcgtWb5oif+gDNXI6A/l/wQwPvUWrEYJ5ZNpGAXAzNBZYoqbUKGIYhxsJTH1Vaa81sN
         FFN3LN0WhC9PJVwErjyj1Pbh2fShxZV3vAtT4bIEqfoXvvSPXLijlHT6k0Pn9tyT1IY6
         HEDIrjhSSiL8OepR95aodGsaSd6duCjhzhBXfM8QCAf5oSoGZ0UnOmNZ3d82jsiEhaWY
         DRNpIcscAWQ/lP0K23Jp9kVKGOqf2uwop1EF5VPiGgYxG9S9sISXRCa0oZEMH6MksxkE
         eHPQ==
X-Forwarded-Encrypted: i=1; AFNElJ97S9X7FDoC6k+sM5GHguI8ZcAQMQ2OrfVw2ybslH8wVujPkL2E1/LygIRIDKRtQf+1bFDujUozeL3nFsKFe0ux@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyti764LqHhoMk0cLS2FlLNZsZThWjKjd44pK05wxpvl/2j445
	RxTt5WqFIYfSITXzOgmJ9xj1q4FClkba8qf0qvNryN5HkJR0aKGLb2u45Z5uREOtHHIv9cyOuGX
	lkBSx0TIxCcE3jzvbBYoTzv7Pyp+DZqr8RXv2K3xIK/HsYamA4AeYo8RqrXbTzNH6jvvk8/0sI5
	Bu
X-Gm-Gg: Acq92OGhgcUSp2SDyGCTBm37XZ5dss5DehMbo3j1qJkSRBK5B2UQ3n8VDeyvF3NU49k
	pCSzFd8cTQ45P4wjXSOwD6zkbMWPJx1TgNgtaOHdK9ipP7CNSIsR0nbHO24VUjxFfaixG0O5XMn
	qqniFZGLgWQDYDKUIJWhJ5u/lKGNnpIbKvs9PO+CHMhmyu59Id6c8puRNVHGI2tUHKfj3PSSQM9
	KqtQ3EDtlvOi7CZGN0Gh2nET/SN+gRYHoypPXY4I9OGO+B0B9xfZBhTF9zcG+qwAKjNvhFve6Ne
	a1UMJJSgOdITQBqpOsD++IGXWTwWF+6gZdIUHMTZi79I2V5drA8NOfNE5G+5Dt4EH4zhbZ9qD6G
	Z6y2mrjId4cxK/yQT1UZiCXgYYw97au5FbwukcNak0zDHS+8=
X-Received: by 2002:a05:6000:4301:b0:45e:93d5:7bf2 with SMTP id ffacd0b85a97d-45e93d57c00mr5545574f8f.15.1779288283659;
        Wed, 20 May 2026 07:44:43 -0700 (PDT)
X-Received: by 2002:a05:6000:4301:b0:45e:93d5:7bf2 with SMTP id ffacd0b85a97d-45e93d57c00mr5545510f8f.15.1779288283160;
        Wed, 20 May 2026 07:44:43 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm50145145f8f.11.2026.05.20.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:41 -0700 (PDT)
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
Subject: [PATCH v2 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
Date: Wed, 20 May 2026 16:43:42 +0200
Message-ID: <20260520144424.1633354-7-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HsxgbzFB3cv4p_B2Tq2izHywS_6MtSl2H6jZE9QbewQ_1779288284
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_074453_974414_BF989080 
X-CRM114-Status: GOOD (  14.64  )
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
in the <linux/hdmi.h> header.

The old comment referenced "HDMI <= 1.2" but 165 MHz is actually
the maximum TMDS character rate defined by the HDMI 1.0 spec.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 07e2afcb4f95..74c7c3720ba8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -189,8 +189,8 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (clock > 165000000)
+	/* HDMI 1.0 max TMDS character rate */
+	if (clock > HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
-- 
2.54.0


