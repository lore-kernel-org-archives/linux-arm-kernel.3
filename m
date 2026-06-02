Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC712CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ivGt1S0OiiOp249bVc4Q7TnMYrm/Fs6AUzb1TqWbuUM=; b=bP0ERZ1GqvpW+y
	5wbY0gmvM1Iql/qx9B2lble5vFwjQnQ5ANjMSFHTMfTn6QHEix9pxaDWwkf/EjcFL0opu+RxJC+7o
	MNEG440YHxBa6QxMa76TBXxcDQ3jzEzsJ36g2vMAWCLAuSMOkCJGswh6ragqSKa8C3vMn9YfnoVwj
	JAuu2i1+bZT9MS6ew3yQAS1YlTm8G7EZKtLyzV6QE9NtmO7Vwvo3WYzBYbPwtzesjaOYsZ+m2GX35
	aJ11Yr5WQ18St6EAlR9cR+xIicmJopi4qOlHh0ur9LS0WSAQqZ37UJ6EIZhLwovPOIR8TIcbICnqj
	TgoxFwcfW/KCfS6KKJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUW-0000000DWQx-0svj;
	Tue, 02 Jun 2026 17:01:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUS-0000000DWNS-2Ybu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:01:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ac357c55so23328045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1780419677; x=1781024477; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivGt1S0OiiOp249bVc4Q7TnMYrm/Fs6AUzb1TqWbuUM=;
        b=LXXXvaT3qLJaVvQqCzwlqsfPjoKZCv7l05xdMt43ZlTDI197cIOG2pLC4C2MNt/RNe
         yawVlgF+RD9AwHCoIpi9QktelUXJK653IZhsP+GdFlKvXbjnSokpvbrFAGN30UIBrwyp
         ibAE2gfxwx0io7oix5lICgZ/lfzQqZaNgHoOWFvOkAK6NWXjP3zyPKGvEslcRf3xLiGE
         LmKKNkMXicvjp6yigvtIq1/LuoqMGiv3uP/pq0HOI7N8I4+NAIALeIBZ9m12XCD96ndU
         I7QMty+/n0Ui/NMYzQ4yWr9qSrRhhZoGpJUIocSwjv9WwpjVpeQxp/GuYGbWU4wx83PG
         YeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419677; x=1781024477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivGt1S0OiiOp249bVc4Q7TnMYrm/Fs6AUzb1TqWbuUM=;
        b=LkYfPfQaGUZEy9GGRS/v73eb+b5kyFZ4XrnCfyemyg3XBhUz8h1zKZpWyYinSqZn1y
         HqCfqjajDPjbzsxan1WtyGU/w+AXsDN0U/b087RlVx+jMBOGb8JBLBql1oAFadGOUuQ8
         HTqWMJodAGduCADaKKX/eMPfXZoxQqeywgZPFDcNwFxBcrpLC1nriIfJ7+78FTRwCSlC
         Lp6cikF9P1IKcDlD8EOlhdwaPazBRw8xwe0LX85Rk6EbKBuJdQ3YM/TF2HhVW8LCHmS7
         56/APavHO+YKfF7vED6cW+xSkpUKzXThhjVLh88rQCINTl6wmP1huuAv2RuHehiWXlgD
         OBmw==
X-Forwarded-Encrypted: i=1; AFNElJ/WzYFl5aBSdESRAhCdzcGiujUHAJ+TwC9Gy3fL46+v+BJFddEl9KEStrwmNJMRY4WHZFb5ITIbaSCZqO3st9uI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2geJDG0Ue3ZtB2gpan+bfoa7z/6HlNvz+/JhfaMF3bE2cHBno
	WhGx9hbnnUyjcZHuaDNX9IywmBUKluRwuWWg1R9Hi8J/btgJbdJmSicliM8/RmVoToU=
X-Gm-Gg: Acq92OF024WVJ7/F/H13NBwM9Pv5p+tecN8g7OB8uKqeua0jalNTBVNeI8BmYV5j9iJ
	YkcEkKn+Je2g63VI5bt7Jq+9K3YgEgx7tXGrM2NfYTeUr28JDCjSL/6F9JpPiMhHztplp6bGfj1
	wfthqcY7pQuXLQ/K7lLwTJdXLkUR6Bv89kX/R2o57GIlXT8P6ZuYdJzDLrx4QWLMHUY+0ndhHvg
	0neRzANn4GEZoNCudq+cPwsVKJxa2XGusIC/AiY1UjWR4ouBXZuQkmc70EYuGAyoVFDmXEj8Z0Y
	095uxgmv17N8PQc4xCUm1GvqLsk2ZrArTFLp+/PRHhj30DwRzjKCX9fY2M/xlsjlgvOO9K6AGdT
	MNLkQIYNY/t44kiBlUWftXm7mDdahtjaBJGHPBn1V0mpc41EAg+TlZRKyH8lMQ7ifzZ8fssDHHg
	5fTA1g8XAiyDzfrwKvnh3crNm1YRo21I4Kmq5BwJDcI2sKtwovFcc=
X-Received: by 2002:a05:600c:1384:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490b50c2008mr8721775e9.30.1780419677363;
        Tue, 02 Jun 2026 10:01:17 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm588495f8f.8.2026.06.02.10.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:01:16 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] drm/rockchip: dw_hdmi_qp: Add support for HDMI
 overscan compensation
Date: Tue, 02 Jun 2026 21:00:38 +0400
Message-Id: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYMH2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMj3YyU3Ezd/LLUouLkxDxdkzSDFAvLpLQUSwtDJaCegqLUtMwKsHn
 RsbW1ADtlkBpfAAAA
X-Change-ID: 20260602-hdmi-overscan-4f0d89bfd981
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=alchark@flipper.net;
 h=from:subject:message-id; bh=mr+rOHka+rwyOFfzI59/eJ3S3PjIo4G5+vOSklSi9WQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTJ8/gmM7HPdFlsfzlmuwfbuhvmzJMVmc2YUs1tgi/oO
 8eE7DPtmMjCIMbFYCmmyDL32xLbqUZ8s3Z5eHyFmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoXNzD84b59tIy5/sjtcxN85I+zlATPjdlpnNfjarprsWnEVN9IM4b/CY+3igg
 9Tl5w0PjVp7Up58/IFnm7Mz14lfc74wsjU1IQOwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100120_700365_86AFFBBE 
X-CRM114-Status: UNSURE (   8.45  )
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

When using a TV as a display, output image may be cropped due to overscan.
Rockchip VOP2 supports post-composition scaling in hardware, which can be
used to compensate for the overscan.

This adds the necessary pixel margin fields to the CRTC state, and sets
them from the TV overscan property of the connector which is understood
by the userspace (tested with KWin's display configuration module).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      drm/rockchip: vop2: honor TV margins from CRTC state for overscan compensation
      drm/rockchip: dw_hdmi_qp: expose "overscan" property

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h    |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   | 17 +++++++++++------
 3 files changed, 29 insertions(+), 6 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-hdmi-overscan-4f0d89bfd981

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


