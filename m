Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S9VYavqel088B9xNr5QJlq+pbjgeAsubCPGEUg3TC48=; b=TGsbm2MkpjY/mhFKgVqNWL66/v
	wAzBal0uZJ1KswV8AuAJLXUog7IP0ZBzH7tjwMxmhHIZohH1Oh7/T6XqRt1s44nPslhw408Iqi7h5
	RAlL3fS328Y0f64CjVtQxwT51WZFSg4FFTCVs83a5DzEuM+79SKFsNhAcxBct+X4laxlI5JCFz+4k
	fSUjOBcrfMpK9bduUB3o5ov72QweThJxOysZgGt/DpC4RDEi772tC21kb7twqeEcMZpB2h7ZLIfkJ
	sL6cBDY84midmU7vrU9/3LY3kW1Rcv0yDPy3+I2eiowtlNrD0CHHEhnae3KwCvx+jedJ7e1VqSulM
	TUZbJGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjkq-0000000DESx-1y64;
	Tue, 14 Jul 2026 20:29:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjkn-0000000DES4-3raz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:29:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c564ed4dso3245195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060960; x=1784665760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9VYavqel088B9xNr5QJlq+pbjgeAsubCPGEUg3TC48=;
        b=ojWUetyczoocLoQPC8HoERlFbYRC/7xcGNmkia5c5EWNVhRMR4K7MeEi7YBx8fULJF
         0j6UyOLD7lt/WoL+ZpdJfFQkTBq1V8ygpJZdoDVxvrLrWz/A8TYQqOd81h7GVQC0mjVS
         FfVESb70HyR7IgQQSR2ypPlPuvvx4/nI/g7tKDa+973G6hg8L9mENiHw+IKO2QFLAp37
         uxythrWhNgIsLZ2DE+eTpC9g0VX/nWx7D5jYZqUUOVR2goAU4ivIhtCYlAO8HBpIBJ92
         qHX6v1gfGV2Jvq19Gc8yJ6E7LUNO9/WJO5WTPV/xQVzm+K5SvYfYCT2p5sVNnSGyFy03
         CjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060960; x=1784665760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9VYavqel088B9xNr5QJlq+pbjgeAsubCPGEUg3TC48=;
        b=cqK4y5TLPjuwjrM0zhkyCxyuGW+3zoSQlX+B8hr2Z49qzQ088i44sKAUcygJHYOzzQ
         glAzCXPMvsMDed6eAIVKDF1ZJpbejTx2O+87aeWQgQeuiZzZ+AoIyViy9MFS3bcD9b6T
         G43NFMAOoRVB/hM88h6yh62xwNF4vYwzaNjxefkXX4TSuimJeUtLRbP1csa9nJC+qQ2M
         7jK/kOUO1nqXOmhrOet5N02+F8HnAggXdN+Fdr9RSYxXWVXvP8pDTHFsm/0f5s+xtq3I
         fhKgC4XeTEH6WRPTBrdzifWHTQfpP4sVy8GGRbgtckpUtB5STsnh7zFnkmOSjK37JSZk
         /vMg==
X-Forwarded-Encrypted: i=1; AHgh+RqSRpOCXnwB0iVXD+cEqgXl5Wt7La9o0a13LB7iwhlPTRsg3NgGfY4vtVLQf+8Yx9sGDmKPcBqg9XQuHmRJmvCb@lists.infradead.org
X-Gm-Message-State: AOJu0YyM7reoU1Sa4bB0pRfkcGDClylz35gOot8mY8YgzVDEfb5WGso6
	OpIV2llnwc9I7MiDhkqFBsUxZqGIAaOMgay1H3DKvq2P/u7yBslfezLd
X-Gm-Gg: AfdE7cln2VZiSrVa/w9DwmbdG4FMbD+t9bDy1IJwZE1QGBcOWxY/5t4dH+s9AK8gMHi
	vGHCQWbD8A5E7NKCZ74tc8uS6h+g7/hxgzQlV1YzYcz8tBEOCV3TuKpHwacA4PUEa5KQtP6zmEJ
	3Ir90t3X+w7Ffbxrk74fRXEMLeIQZKB0MayBfcGUdHfWvvxCj8IR9YAdhRvxqqN7Z6M/yIxumSw
	9//xWpl0hww7OQNUt3Wvx22MgePXfKtk8RZHmp8L+iYYAATBAcSoH1ef/shJp+9WKUpEPdav/gM
	JxpnWCua08LtwCzXG2DyA22EAZ0gsek4pxIBtfIgPrNhtuiwRipP5ce/y1C16AnFCJ6ALJ1PJU5
	98PFUXuh0BrtDw8v4tYItamZ7dSZPz03ShWNyXdDfnMjloRR6Ei5qiLedl/txn+V+wjqnbmIxpD
	HGtqWY1W9XZ7VQ2Aldc+5vzNjbSfQ5A55GGFfNFQ1CiZ/GSTFeeXxA0wARmKD7BgztUVal9zIqN
	VpA2/Jbw0vBUnoeGckNlvNrp597C0TU
X-Received: by 2002:a05:600c:c055:b0:490:b2f9:d9a4 with SMTP id 5b1f17b1804b1-493f87dbb37mr64625065e9.1.1784060959738;
        Tue, 14 Jul 2026 13:29:19 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9381005FD9FCFE1353AFE2.dsl.pool.telekom.hu. [2001:4c4e:1b93:8100:5fd9:fcfe:1353:afe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32c65asm98332125e9.14.2026.07.14.13.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:29:19 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace connector property
Date: Tue, 14 Jul 2026 22:28:50 +0200
Message-ID: <20260714202850.40999-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_132921_978121_E5BEFBC4 
X-CRM114-Status: GOOD (  10.53  )
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

The HDMI connector framework already consumes conn_state->colorspace
when generating the AVI infoframe (drm_hdmi_avi_infoframe_colorimetry()
in drm_hdmi_state_helper.c), and drmm_connector_hdmi_init() attaches
HDR_OUTPUT_METADATA and max bpc for this connector. The Colorspace
property itself, however, is never created, so userspace has no way to
request BT.2020 colorimetry and wide-gamut/HDR output stays effectively
unavailable on RK3588 even though the rest of the plumbing is in place.

Compositors gate HDR on this: KWin (Plasma 6.x) requires the Colorspace
property alongside HDR_OUTPUT_METADATA and max bpc before it reports an
output as HDR/wide-gamut capable, so the HDR toggle never appears.

Create and attach the standard HDMI colorspace property right after the
bridge connector is initialised. Passing 0 selects the full HDMI
colorspace set defined by the DRM core.

Tested on an Orange Pi 5 Plus (RK3588) with Plasma 6.6 on the Collabora
rockchip-v7.0 tree, which carries the same gap: with the property
attached, kscreen-doctor reports both HDMI outputs as HDR and
wide-color-gamut capable, KWin exposes the HDR toggle, the property
switches to BT2020_RGB at 10 bpc when enabled (verified with modetest),
and browsers report an HDR display so streaming services serve native
smpte2084/bt2020 content.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -603,6 +603,20 @@
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	/*
+	 * Attach the HDMI Colorspace property. The HDMI connector framework
+	 * already consumes conn_state->colorspace for the AVI infoframe
+	 * (drm_hdmi_avi_infoframe_colorimetry()), and HDR_OUTPUT_METADATA and
+	 * max bpc are attached by drmm_connector_hdmi_init(), but without the
+	 * Colorspace property userspace cannot request BT.2020 signalling,
+	 * which keeps wide-gamut/HDR output unavailable. Passing 0 selects
+	 * the full HDMI colorspace set defined by the core.
+	 */
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0);
+	if (ret)
+		return ret;
+	drm_connector_attach_colorspace_property(connector);
+
 	return 0;
 }
 

