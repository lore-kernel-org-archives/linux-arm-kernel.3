Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1CBC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5h/jAHWXWXDOWdVoAFfHtjsJVJE0oZMUnASj9to5Sqc=; b=DPw42mIqYm8bWiOxouEeASLPb1
	G+YLJwVM3QLnPzhrvp99IZMD7GDCslMMWCBHrNBbBB9ZP1JX8yNbYw9jPXgQcm9XlF60UAvxHOV4x
	5SZqPtG9Rs9d6PBCYRY/2fv4UaXh1E2SnynOGGvwzIFlWwiYouN6RhWHv6X2TOmSng0n0SjTIyprz
	pS8bEePxgH4yAjI4xmSRaFxgXUrxLN5eAx4U4mKKELcaYFAtZJJ1XldgEOwuW/RYPJxOs7hrOPhWH
	zX5+PXl9RiJnK8yI5kCe1aAuIKoBg5LUR9zX096QoYvernJFv785wIAypz22j0CJCgTbT/4pyWfHW
	TFxpeWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsg6X-00000009Ldi-19T5;
	Sat, 08 Aug 2026 12:24:45 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsg6U-00000009LdN-3pjm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 12:24:43 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-ca957432c7fso392642a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191882; x=1786796682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5h/jAHWXWXDOWdVoAFfHtjsJVJE0oZMUnASj9to5Sqc=;
        b=U5DGEm2peEvwuX+UxJ7pMYjNgRzujNz7ifngrmxlkqMU6AP2dxfp05WA+uOEBr3NrL
         bAFI/9Nx1mfaHPNFZKwqZyeIkQusiYu9NnKFODVQbKAbWsfZ3tDxMW2pvK8aPS4PKTxs
         G0S8S/wH0NW36aPww4G7lg1BsSjA8mmKn6K2sLLStyftbZT12mDEKBx30BQ84VxalBfF
         iB8cQAhwSLQEPW9vxfchpXabD/XVXyKwUeIv8FCeeWVJslS8kuirKvacuY2Zh53fH37G
         mA3n0A6zfiZfsnOHiiCTDAY2/UEDQoE2bAkVXND8zBKvZ0mq9XPv8SIXQh+YBgDmTdIN
         XPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191882; x=1786796682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5h/jAHWXWXDOWdVoAFfHtjsJVJE0oZMUnASj9to5Sqc=;
        b=qh3eLJmDSuuDe6RmbCuWdoS0qLAajCl9+r48q1Wr94TM8AZGFSJtGOkyiBtM3VLUDO
         dOiaZm7JCBDD4hmNvt4CZ8M7XSCscP8tvTTW4hJTaWCNwb4DhzQKZpWF6Y2H5RZKL22o
         pb6l2KSshv+vNE7BVOzkTyItdTcD+VVJwmC5xV5xqQP05yClLfSi/1S+cZUwwCWffvYL
         8HkFLHEh6ZYDirkmyQGUCh/8/6klN+epNZRi9shCuVMSsnTabeMLJk0FtI39kfo/gXHQ
         r8B2uFJN0um7JXz8Nn2Ph9CLPpmuWiM6vbNbOAyt3fHL8LWKbPYzmPLTN4dadvDWr+RJ
         jcSg==
X-Forwarded-Encrypted: i=1; AHgh+RqBr+iijWTUIubZsPCowl0aKt0W3xrX4bKkcyAQfQp8BRnOwja2AceWUTJlrnjZG3rJILkVpQ3DKKsYWAiI6w3W@lists.infradead.org
X-Gm-Message-State: AOJu0YwErtT0K4yiiVYjPWdJ1IkzqYb9N+fVrNoBIJD4sy/LPMZj1tNY
	y6XQg44/RPGSPpox9/jIVZXAT6FLP3eIVbNZRsyLJv+p5NOd22Lff/9NvyTmqWdGZt8=
X-Gm-Gg: AR+sD12YNIK+8PPScCR5ePHeTVk4gXkzcSFYTYPjjYarcQcy2Tv/Yyo6/xCvfFpc/N2
	YCRYK4ZhjtUUDLBBfBWyJgvUFt0gZPRKt0hw1No9IabelOEYA3GIEuvfX0tQu2p4gjok4fKMAnB
	8FDYWM5PypU/NN62ZTey2h5PyL5PJxiFySHIIECTLCV7W9vzvObxyaD+f1fPy3rgHCm23W6wVIh
	JH3e508z7mrhYybt2lEmzoZYX9HX39jGdYnarskw9XZzMSjUbjqxyOZpBJiqsVNCLRWI18etE1r
	YFpqesehxxFMevhHX5EPGbot0edd2hf1GqCZ1Hu97KzZfyP2SxYI+nS4SQSaNRdET+fNmFKWtxz
	rVO83wgwkQ8AGQoOUd1GaZD19BM+iKnbFhpVKtSJuIyqNlq78AQAAWGwHhMPgJYmHoeopEZEJrT
	JW4dKnrsjehb7Z5LTXRjskC1TGwuRfaXski+LK8Hzvp+MXWTv7lWDWH6u+6w==
X-Received: by 2002:a05:6a00:c1ca:10b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84f2e0dbfb7mr27063894b3a.37.1786191881768;
        Sat, 08 Aug 2026 05:24:41 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm2145040b3a.45.2026.08.08.05.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:24:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/imx: dcss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 20:23:54 +0800
Message-ID: <20260808122354.2825209-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_052442_955398_712EB206 
X-CRM114-Status: GOOD (  10.45  )
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

dcss_dev_create() calls pm_runtime_use_autosuspend(), but
dcss_dev_destroy() does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call before
disabling runtime PM during device teardown.

This issue was found by manual code inspection.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14205..51398852cdc2 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -240,6 +240,7 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 
 	of_node_put(dcss->of_port);
 
+	pm_runtime_dont_use_autosuspend(dcss->dev);
 	pm_runtime_disable(dcss->dev);
 
 	dcss_submodules_stop(dcss);
-- 
2.43.0


