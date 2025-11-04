Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE49CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=; b=qX8YPlD1jbljqrRBh5bAhmWeUj
	nAeBAHsroouXh3S8cpXsjXkNec302cf6As/e9AfYJDm3jSXKmVBbHlLq57mkkdtl0V0//eIJ2GI54
	3GT96M9v/NeOeXh45vF8pHMjfjtmD6KmNN81L3YZnc+NloVQffZkzW9p4gfz8jlxvQZusGkHou1yt
	7VaGNB/spG2DpGjuOHVxjZtl9iMhkr8rk7E4oqEtbMoH9Z65uVZTx9JOzTB6wBlR09GHj4+JCjt8q
	wTyO8PZlVx2Le4B662aMJNzJoA8FfZ6nzKhU94/dqREoCUh9TQWyPr6HXIjXCRiR2rglW+Odiazed
	9ZPryJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTq-0000000CLAq-44hK;
	Tue, 04 Nov 2025 18:10:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTn-0000000CL9k-47Oc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-429bcddad32so3561134f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279802; x=1762884602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
        b=bU8xVGwa8C2s+znKEyDchfTD9iQJX/O/nqfJjjUoph6atBx8l92u8HPQm6lbLEBrNU
         6dRAuDmxv2DgFbGI7GxZKkp1TO+j/34wLvTACoAMtYWr2OMdh0xi3gcd4Ljqo0ScqKER
         HwbnFfcgXcQd8pqUsmC+le8PyVOji8/wJmVPtcirAzZ84N+Ja73JxtreM4oER09PmxlC
         IQS67Plo+E23gF7e+qNf1jeq+bNxhIL0IqSF/TtZ20nDKSLAyo+FtWkKbRB92d6FHCdX
         62Myq7bp7PXAqMHMJPf5aWbx+mgGcu6ay+ZOFkAYDTPWrrSXex+cqERt0WQfztIpSlmK
         NEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279802; x=1762884602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
        b=w6ZIt3+XzVnTCuN0pImiyTT7jkAO+knNQrKSF2y2Fg+LOmM9B3WTMwfBi5+SKG5KPd
         6rSmc0J3+h4QMfKpKpA+fcpl0JFyRY1zAKJfw9sajG6PsXLZCZbL0tDTEZFiQk7qcVmO
         s8OM6RQyi+PPveRRRJvJRz+kjoT6XATSLUjS7xdyvYGCo4va+uXiA/6fQ4bkck3U+wPW
         ZKTfMIeTf2ldqUGD2QYBjuKwd+mb+ybc/zAXVUmqCe4nskbcWkIcfjXw2cGuCVmOZN8q
         eoibzgNJ0AmYfcDVDf+8+UNMz2lNU/QGdtR48W4r1MSpSQy1uRFGk19/MUYWK3vjzuM5
         6KUA==
X-Forwarded-Encrypted: i=1; AJvYcCW/vpsDa4ailoDStV8zHoWMBv710L105mOfv1XoDePP4a7JSsK0QXct2+m3v6sCIwyIydOcKVzJMNdR2OyU8pWO@lists.infradead.org
X-Gm-Message-State: AOJu0YycJ5oJ8QjYBuSv7kAYCcN7LrYlkzXf6BhR2hUVrysZxKAfiCN8
	edQeZ1oZP3uaqERuV2WrzWciofeRO8M20uvgkjpmAtMQkMS3DfcHVN38
X-Gm-Gg: ASbGncssGmZPlDq/MY9c+dtFbNyxxyeYdtOgxWz7U1nGt16XN/vi09uvHYbpLrS48bo
	Js4NgI4CUIaTy3JXCt1j5PsESKKz0Vb1DJZnmfzwXGdy0GoE5iZqqdUTot52FvuqvhTdLfRYIk2
	P1vx8e5OccNIc1DI/OZ857AtkXfWpfYkqZReTErbFpdqEQ7fgJNnEQKtNQbIoRGROHjw4KcS1sE
	pclbdGMZkPiJZZ9VG8nDG+8kOZF2XZy8sQxvnuM0BtYcMo4lVIwGqDPIrXkhzjhKFoRr+ZEIFVI
	WkH18OusKTGB1z62flOv0jKOGft85WWCuPwTNNgcnWFXdkbsnIDuE+UB1GFktWLEf+Po6NqxVOc
	PfLC2SwEMB3pedOU+NZ6z7cbnN9Fk0AJLdnsDIOvHATLf9oOj8JLCZXPUVMCZmzcQ/mJQ69xtRz
	oAffFB6fH9YpPUc1S8Tg==
X-Google-Smtp-Source: AGHT+IE+3VWITYfmpHgFCOUqnzMrVHgHtPMl6DRBEJeRwc9yMJmO7cxC+Ce40qfK3g3txnNqIhsCKA==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4775ce1874bmr2405065e9.29.1762279801598;
        Tue, 04 Nov 2025 10:10:01 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:01 -0800 (PST)
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/30] drm/sun4i: Refactor layer code for proper DE33 support
Date: Tue,  4 Nov 2025 19:09:12 +0100
Message-ID: <20251104180942.61538-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101004_051019_5F57D4E6 
X-CRM114-Status: GOOD (  16.35  )
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

Current DE33 support in sun4i-drm driver is based on my PoC code. It was
written with *a lot* of hacks, because it was never meant to be upstreamed.
Fortunately, DT parts were never merged which give us a chance to do it
right.

This is first of three series with proper DE33 support for H616 SoC. It's
the longest, since it prepares terrain for new drivers in remaining series.
Point of this work is to completely decouple mixer and layer code. Till
DE3, mixer and layers were intimately connected. However, from DE33
onwards, this is no longer the case. DE33 and upcoming DE35 planes are
shared comodity between all mixers and can be assigned in any way driver
(or user) prefers. This requires planes code to be completely independent
from mixer. The only exception is mixer clock frequency which is used in
VI scaler, but in that case mixer pointer is obtained through currently
assigned CRTC.

Second series will introduce separate driver for DE33 planes and adjust
mixer code to new DT bindings. Third series will introduce TCON(-TOP)
adjustments, HDMI PHY and finally, DT updates for several boards.

Current WIP code for remaining two series can be found at [1]. Code has
been tested on Tanix TX6, which has DE3, for any regressions and on Myir
MYD-YT507H board [2], which has DE33, with HDMI and LVDS panel outputs
running simultaneously and independently. This confirms that plane code
is properly decoupled.

Please review.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/
[2] https://github.com/jernejsk/linux-1/commits/okt507c-v3

Changes from v1:
- collected tags
- updated commit messages
- added missing kerneldoc description
- moved vi_scaler_num position

Link: https://lore.kernel.org/linux-sunxi/64c0a4e1-15a5-4f41-9fba-852b0e83fd6f@app.fastmail.com/T/#t

Jernej Skrabec (30):
  drm/sun4i: mixer: Fix up DE33 channel macros
  drm/sun4i: mixer: Remove ccsc cfg for >= DE3
  drm/sun4i: de2: Initialize layer fields earlier
  drm/sun4i: ui_layer: Move check from update to check callback
  drm/sun4i: vi_layer: Move check from update to check callback
  drm/sun4i: layers: Make atomic commit functions void
  drm/sun4i: Move blender config from layers to mixer
  drm/sun4i: ui layer: Write attributes in one go
  drm/sun4i: vi layer: Write attributes in one go
  drm/sun4i: mixer: Move layer enabling to atomic_update
  drm/sun4i: de2/de3: Simplify CSC config interface
  drm/sun4i: csc: Simplify arguments with taking plane state
  drm/sun4i: de2/de3: Move plane type determination to mixer
  drm/sun4i: ui_layer: Change index meaning
  drm/sun4i: layer: move num of planes calc out of layer code
  drm/sun4i: ui_layer: use layer struct instead of multiple args
  drm/sun4i: vi_layer: use layer struct instead of multiple args
  drm/sun4i: ui_scaler: use layer instead of mixer for args
  drm/sun4i: vi_scaler: use layer instead of mixer for args
  drm/sun4i: layers: Make regmap for layers configurable
  drm/sun4i: csc: use layer arg instead of mixer
  drm/sun4i: layers: add physical index arg
  drm/sun4i: vi_scaler: Update DE33 base calculation
  drm/sun4i: mixer: Convert heuristics to quirk
  drm/sun4i: ui_scaler: drop sanity checks
  drm/sun4i: mixer: Add quirk for number of VI scalers
  drm/sun4i: mixer: split out layer config
  drm/sun4i: layer: replace mixer with layer struct
  drm/sun4i: vi_scaler: Find mixer from crtc
  drm/sun4i: Nuke mixer pointer from layer code

 drivers/gpu/drm/sun4i/sun8i_csc.c       | 113 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h       |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 217 +++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  65 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 475 insertions(+), 482 deletions(-)

-- 
2.51.2


