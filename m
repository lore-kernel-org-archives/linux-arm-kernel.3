Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIMECz0v1f4LVIdLn0HTlLUSx/SJvMxrwrh19eAWfPY=; b=CNT/EKCB3OD9Jbz3Nd+DaHdlkO
	IxoS2oUpEuvfAt0J0fJKabLEFDHsT2x624maVnxa93a7rx7OFTk8ZOxhgXvx4zy3qqX8RXBXNBZUi
	Yn60lLgBzAMqyTmgWvC96M1QNf+vBi9LE1MHbX+6xGZoHZzAv9q/aChx6l2YUlNJ6ruHVlJfF8XVX
	LVlYHlk31NL0BcR9NJhGAVvrGsAlVZJNTILbDq3/238T0kTWU86wcoN9wXrL/Xpncww8WGDEeEdDh
	fJ4dWRs5WY4zXtKcyIU7x0GrLl925ukHsbEMyoaMqpfYvwtY2fWP8jLhzP3AqTyUdctCyxnlfNWGG
	70jumtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaDP-00000000TUZ-2mVd;
	Wed, 08 Jul 2026 21:53:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaDM-00000000TUA-2Lqa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:53:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4758bd3731bso182670f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547634; x=1784152434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IIMECz0v1f4LVIdLn0HTlLUSx/SJvMxrwrh19eAWfPY=;
        b=pdC1i0iawblZ70BA5FtaJP6Qc1jqWF8EKxp+Qiy6YxTPVJH0DfATnHIwSu3zfVLNqP
         z1OTOwBpylHX/Z2vhEDsIWk13u7197G2tnT+d0K5UxuNIfgzPF93qcS9XalbLvIDONtZ
         IRPR2CKcJfujZkz/0+JG23Idzo0HV3EdU3VS9b6T5v68gnW508ds1SW5Q4saCi0LKJQJ
         MvcBHmVQyXwgJ6NqWzDwQRWbvansiWIQMQ6EVqroOyGUKKoKNjLNbddjgXAjAQx+Ck/M
         uGIoAXH4pVVvJUcXfJFiFUevndSx2W98+icmK0oDhGxFOckVO1FgR5FDIoCmdUYjVmQE
         weQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547634; x=1784152434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIMECz0v1f4LVIdLn0HTlLUSx/SJvMxrwrh19eAWfPY=;
        b=i3MeN4t94tmeadzoWGhT2zt8KQ1J8MorN8AKoCOqg/Cmr4+i5uvD/eEu1HGx9kuKSL
         G0bgPc8RYkvNLKa7kxnrU4vpSFB+bQFYiBkF89vmXQKyiQcTFHbVSKWJIrD6/8jXS2e2
         R9BhsAvn4n0uMBG0e662oTc17g8UnEMA9LMW5fqlei3pB68PenB6pwJUt8p4DA9PHrtC
         b8fgkus2Rjyv8eldqD0nrHN/PgNBYPPb1wEEcnIHJm+Ewv4R3sKaY0OQgnAyiNQg2VxJ
         doO0ONXXRGA17vEj+g7VItO0Y/EdXpOomF08BHf6Ebru1xonMmoLN17KbB6EFO0FK9dz
         aL4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpeza7Q3MYZPEAeYdQUap/47gq6IYW3pO40yuLtqUi3G4kD64zKObXQRB8vFCxiGeTleLAKyPdoy/EJD/J7r0E7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xPdjGUn6awywouOd/JdK5nrxOFVxWXdK8u2RJXCCQ3jzV31P
	iRqIgO+vMj/6pw3kC3aB70qst1d0xMYIWEU6GggTAEKIZhWoAQtIGadM
X-Gm-Gg: AfdE7cmX4chHquaCFESlAzd2LddPB+P5yJDE84Vrgae2JBvl83cWmqGqXxOG2OS1x4E
	pqPRhtvdpH8CcVkL+KhwWLYKxtJYTWalHhQ1QMqrd9c6aqqPI2asGxAon/jEU6//gnxpq2q7cIG
	VA+5sy2s8G4cSiF2A6r8RutS8qRnosLYP1MapAAZgSp6T82Wz6/WiRp6AbCUqnLbCShJZ0UNcO8
	x7uSiY+61x1NBpRFBRR+CMkzp4q0uS0UVQvcS6To5tDgSvw9dEoka55W3RTPf86UhdMPlvPC8x2
	0LyEh9C10nkvkdjvf3Th0TY8aE0ci9O+f7KbBF3km6OuSP920b+oV4lf6vzPxkreyiu0U+4GDR/
	xRJ2N9W0AZBrg1G29kNdM4QA7sJlNevwBk60ghCh5rsrn2Y7Lu9vBTS2tlrLQNc5BX5ScDltdrn
	MnHRuVnPBaweW5aiUUJrmLfMW6qd9YcWz3lBoe/M5cHWsx7mFhmQ==
X-Received: by 2002:a05:6000:4602:b0:47d:f6a5:1fd6 with SMTP id ffacd0b85a97d-47df7561c98mr84937f8f.26.1783547634411;
        Wed, 08 Jul 2026 14:53:54 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:7550:b182:7bdf:fbd0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm46622289f8f.15.2026.07.08.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:53:53 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/imx: ipuv3: account for active PREs in atomic check
Date: Wed,  8 Jul 2026 23:53:38 +0200
Message-ID: <20260708215338.147145-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145356_617841_9C815A93 
X-CRM114-Status: GOOD (  14.74  )
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

ipu_planes_assign_pre() starts each atomic check with the number of
registered PRE blocks, but that value does not account for PREs that are
already used by planes outside the current atomic state.

This can happen when CRTCs are updated independently: the current commit
only adds planes from the affected CRTCs, while PREs used by other active
CRTCs are ignored. As a result, atomic check can approve more PRE users
than the hardware can provide.

Subtract already-active PRE users that are not part of the current atomic
state before assigning PREs to the planes in the commit.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 67f2da7f2b65..d6806d1ae6e1 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -822,6 +822,19 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 			return ret;
 	}
 
+	list_for_each_entry(plane, &dev->mode_config.plane_list, head) {
+		if (drm_atomic_get_new_plane_state(state, plane))
+			continue;
+
+		plane_state = plane->state;
+		if (!plane_state || !plane_state->crtc || !plane_state->fb)
+			continue;
+
+		ipu_state = to_ipu_plane_state(plane_state);
+		if (ipu_state->use_pre)
+			available_pres--;
+	}
+
 	/*
 	 * We are going over the planes in 2 passes: first we assign PREs to
 	 * planes with a tiling modifier, which need the PREs to resolve into
@@ -843,7 +856,7 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 		    plane_state->fb->modifier == DRM_FORMAT_MOD_LINEAR)
 			continue;
 
-		if (!ipu_prg_present(ipu_plane->ipu) || !available_pres)
+		if (!ipu_prg_present(ipu_plane->ipu) || available_pres <= 0)
 			return -EINVAL;
 
 		if (!ipu_prg_format_supported(ipu_plane->ipu,
@@ -871,7 +884,7 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 		/* make sure that modifier is initialized */
 		plane_state->fb->modifier = DRM_FORMAT_MOD_LINEAR;
 
-		if (ipu_prg_present(ipu_plane->ipu) && available_pres &&
+		if (ipu_prg_present(ipu_plane->ipu) && available_pres > 0 &&
 		    ipu_prg_format_supported(ipu_plane->ipu,
 					     plane_state->fb->format->format,
 					     plane_state->fb->modifier)) {
-- 
2.43.0


