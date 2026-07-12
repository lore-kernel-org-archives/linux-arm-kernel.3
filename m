Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFB7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 01:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IH/34IPpqm+flKepaUz3IWK/5zpVie015ZDy8bQoYCs=; b=h6VDq6blFrFzEyObvg9NjkcKP6
	o0TET+KwFO+rvB7rms3X1OZ1Oem3fQA1ghvux4/SCbFLC48S/1kVv7WVwW7x/aoL9NoyrYZAbMgOC
	+aXtrzdtLC8oopxs9N6VBQ6LgIV+o7eSjJ3sb8xnbWIW39hvHTixGSnWepdAhprbXTRCxnLIIiwfB
	bcfyizUlh7xdJrtleF4tbcvc5y9QQQ+NBYOB6/EFp1+Tb3ezwLdYgIbg2Eu+eJGyEzaNjL2NqCoDU
	2XpG0aTcRySkwwTCGYUHcvcWVBbxHlkdoXgFcraqRFLTKOWmqdiPIVzKPcl7b9eSnpjxeM3QRUgtu
	q4IrL3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiicC-00000006yRe-0hh3;
	Sun, 12 Jul 2026 01:04:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiic9-00000006yRJ-1hGB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 01:04:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493f45e206dso8749205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783818251; x=1784423051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IH/34IPpqm+flKepaUz3IWK/5zpVie015ZDy8bQoYCs=;
        b=MxJbHDzaOWOMuMVyZri/NUeahJFfaDiWAn7yz3KnNBuoigU/iwO16HPm7fjc6PQnkn
         b+Y4ecPv769hXXGzZXklCMhAMUo2WPKtZpGu+2m4fnJ0UjcCVD8LlLNN57G9f8N6fVAB
         aaR6nfogReEOJW2l9JXL0kBg21XDN1UCfFx2Vzl4lqRiGFhVhR3GoEYu8wlVe87Qtof7
         1O7Q+enqNvvPkXSVWn8ckyaN2cRVw3TntCF9JsuaWMC3YQPH2T2FGUdFHXmhSjoJd/G3
         ebfQ3/IfILtiiyhMsB5N7YbiTih/mMMXQ0adUZNW57RXQu0awIKb/ZX1KbB7ZWHlBLqW
         hw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783818251; x=1784423051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IH/34IPpqm+flKepaUz3IWK/5zpVie015ZDy8bQoYCs=;
        b=IXEvlNHeuBXDEkEYvbBSb9IOgGyjZwgYztrsgQknupZ5i7kdDHp+yW6cD6ShgjAp6N
         4rYi7g4uylYSr96w5+QKA/4WapwYQhG58iP0L+vSh5k2Fl/jfuIAAS0q+RLB5xd2d0E5
         hc586DdTW37sZe5xAPthpLZuiorIqNZTuERye8p4d2iXle5eLw8X2mb3+SoATgXRbw6z
         vnWv4vaQNDIlgNydWfGqsIhR3sKfhD2nm+ms5BbOQcqN1HqGYTQ17MzLomTV/CQbixJK
         9IrGFvWIn40Lplb4hlkp3IceD27xhS4BRvqYAub2poqOolaeURDTcv7yjD2V8HwXAsCM
         hkaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9L9g6uGwuUYGautY0KKyddCp9H5kfGTEvN+FAjwicoKzpWWaC1HRi+XGmzHXhLYa//qoWYe/3Yt8rfQFzQa+q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6fM+1CQ+nmEIPMqV3WZ6NkiGnpdP1xv3ZpvQHlbe1ZbLdHFFX
	TZB0GFxhlZmtlCP5jf1WIkt9Sa7iYW+U01kytPw2QkHXNPy1wIyMAVeD
X-Gm-Gg: AfdE7ckjrjFdvhdEW8XYiou+OWQQk8hNgjYt8uevtXA+guzHcielRi1QBwyl3aji1jr
	ESdspD8Kn5W8HnBmOnWhWrJa+jE+nyFJavTZETbQXxUZMoOZp4nNhdWrIlRHAQMTJXlLVQC/XZk
	JnZup72/CmcvbLhGxKlVsgNTx/XFPfb1y6g89URdexKLc4g6QFefuPQRUnNPV+9DdlPeBN92sSc
	MnhW+WgnOz7D/YU5a5bf3UwenKxR7yH2b2rgFQaRzm+YpbhdqkApMgEHRVwhU/x2tQ7g4VIFdO8
	QHXbIK2wGio2MAWyN1TPi4vzvPp49T79o85ErMbXiyg0Oj5JYQxmRgvZNwW+Is4ZsBRG1wdzART
	7YaZWkl/ZtKEmehtxUuenyxBGMuFEili1Kp8dOQf8jvWAO2VJjtHudwS08DFmIhc4vbt7QjkCSu
	pl2TK0Nw6KVeSrnIoc+2uLlGiuK9R1mtBd585CqKp0NsIXavJGDpg7cWehoC4MGlYJ2uh86m9Fy
	rg1
X-Received: by 2002:a05:600d:2398:b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-493f88d2f7cmr27656375e9.17.1783818250715;
        Sat, 11 Jul 2026 18:04:10 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm188580565e9.2.2026.07.11.18.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 18:04:10 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: arnd@arndb.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lumag@kernel.org,
	alexander.stein@ew.tq-group.com,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] drm/imx: fix unmet dependency for DRM_IMX_LDB
Date: Sun, 12 Jul 2026 02:04:07 +0100
Message-ID: <20260712010407.2387049-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_180413_509012_C67941D2 
X-CRM114-Status: UNSURE (   9.30  )
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

Currently, DRM_IMX_LDB selects DRM_BRIDGE_CONNECTOR without ensuring
DRM_DISPLAY_HELPER is enabled.

Other similar options select DRM_DISPLAY_HELPER so let's do the same
here.

This unmet dependency bug was found by kconfirm, a static analysis tool
for Kconfig.

Fixes: f673055a4678 ("drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 3ca237515e46..c54b176649f1 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -37,6 +37,7 @@ config DRM_IMX_LDB
 	depends on OF
 	select MFD_SYSCON
 	select DRM_BRIDGE
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select DRM_OF_DISPLAY_MODE_BRIDGE
-- 
2.54.0


