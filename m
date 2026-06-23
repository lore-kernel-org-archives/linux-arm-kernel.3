Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3FBCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7PhzB9IpnBw2GMjA06F7mqNVMnbUZwmTYPMzQKsAxjM=; b=ujIw9dE7Qz/vbw
	aN4yQr8yCYY17noltMbTP05HUL64LkEQMLK/AK+qgFx35a0DWMWTTz1m+JIMusXdzLS5rJ5uf4sgI
	3PPCYUhyA9F2Rt/nGGcJUlfN6+ZXNyjmEUgNJCSkgQ2axYpEzOyOnjugtx58bby5q8woiMQJeCMnJ
	6D2tXOJHOyU7+weCkWm7MxIV7qWga5WZkZekpHtQuINM4xx2eFcYOD3z0jD3T93ZAvkKpK/Z7XGQI
	hkTrDSP03YkfC6Rwgwy9J5BFdvm5rPBAqs2CVxvg+qCM/qjFS53QPnpbToTc3zOsvTxeYyyzai+5E
	b0tOVcOsjIp+P9eRKIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12n-00000006KbE-06B9;
	Tue, 23 Jun 2026 13:20:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12f-00000006KZp-26JG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:19:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-697ebe536b6so20252a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220791; x=1782825591; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PhzB9IpnBw2GMjA06F7mqNVMnbUZwmTYPMzQKsAxjM=;
        b=al3T9D5XJrU1D11piIBN78nJtFfyxdOSkl/7XDipFm2EhokIzdYYeiEQaxoRM0dgqw
         wW6HoyIpfe4bSK1iVdFKhHK6wVWTL15K3DKRsinclKFmUBQr/VHiPnBb3/Nj/b4EyLWz
         t2JHR9D3mw/7fdwz3jt7TpN6V2Z/5MlCRb+HIZsUpwML3RzXtqEXpo7NdIhhDDzQkU6Q
         3PQbLl3UMxq8N9eRjhpmf2pdeTRRRft+94r7cTmlnrfdNURR5zld9Lp7MYfcG1j5bK3N
         vv3mzMDE9kEoYRq9AjSIrdaDa3g3gxIQgwODANCZsfAwFhL5/klZJEFb1nrishEC8xnI
         h4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220791; x=1782825591;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PhzB9IpnBw2GMjA06F7mqNVMnbUZwmTYPMzQKsAxjM=;
        b=MHvdUkbleRxIckGWiOMn/nZjimeDBQxF7NxtdqCHcasdVU6husA215tisPiRIgKrEe
         PhbdglDU0EdChpGkxOBqh6DeHX4pEIFm+lyTGYRza9VOBhpnXUuchv4f1J5Vyo9iyanm
         SDj2OnTZnvVBQUznYsAMb10EtJoWl1ee/1vQc1H+Xi886Tl/Pf46rEIcz4vF2WvWQ3kr
         BHnw+gZP1nkHVejblPnbWTeZUIgrzdVnDeikCdzNCjp1Ae8nCile5q5mbd/GXAOQ5FM3
         DwOBTZ9JFG6DyO+4PWABhZnOF6oRw2Wl6MZb2zKcM1jwmDiX+IYvVPb9cm45t4LYR2+n
         ekxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LnF8wAaxZROUx6zSDGttG7UW8wvJLfBm6Yu6QG+dvWpHtUNcMRE/F2H8wFCkcbqS/BTOO2aI62Xnl7w5nJZt9@lists.infradead.org
X-Gm-Message-State: AOJu0YxEJtbiUGuB5IaTO7GX1ahlrXYGGczmOECWXj/w7joiZctf+8zk
	Nncig8DvLuh/epcDceszOL5Rx729nAMRmTVB5TeKUcrtaqpTUTJswQ56
X-Gm-Gg: AfdE7ck57WwWJU8h4jpHBmSa9lR/srydgKAid6PgT+njhkjFjVFVQ/h42SLxcXpzYph
	hSrm/Eju5ipp4TZH4srZjagsSA38hqiMKxa68C89OvegUw9MJptkXhfZbrsC21DhoV7pvtQ5kzc
	RfLK+JpAjmbF4ZU7W2H1mGl4cB3uR33uecSX3/OVFcYgNkUkPSA7lWByKvv3b4o1fL26z/1Ec9n
	ndTWLpxne0cTefBEWpEj8xidZcfIT6XyFXY1ctBRQ6sk3CO0u2pKJ8tXrNnJYEG5howMIMpIwoM
	FIewrRn15IuWRLdn0zrshooQCn//zD2m/Y47c8nnozDsWM9qwoHMCBsw7OjR3px36GxG1zmp4iq
	VutId4IQGsUNyihLOB3/IdEZaiTpT8tw7FGt+r3I1K2vgzjqWq/ho2cLCZ+7RO1TaQdn66OluV0
	GIFCZ2iYtaS+Wd3QuLEIXE
X-Received: by 2002:a05:6402:5107:b0:697:bdb9:51f with SMTP id 4fb4d7f45d1cf-697bdb909c9mr3759928a12.4.1782220791355;
        Tue, 23 Jun 2026 06:19:51 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:50 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos
 devices
Date: Tue, 23 Jun 2026 15:19:29 +0200
Message-Id: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGHOmoC/32NQQ6DIBBFr2JmXRrESrWr3qNxITLqJAIGGqIx3
 L3oAbp8L/nvHxDQEwZ4FQd4jBTI2QziVsAw93ZCRjozCC4kl6JiuO3WBaa9YYHMuiBTqq4aqeW
 jbp+Qd6vHkbar+ekyzxS+zu/XRSxP+68WS8bPpBh526gS8T2Znpb74Ax0KaUfj96zn7IAAAA=
X-Change-ID: 20260623-exynos-drm-simple-bb5386d64597
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_061953_565932_C6004820 
X-CRM114-Status: UNSURE (   8.60  )
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

This series does two things:
	- Open-code drm_simple_encoder_init() since it is deprecated
	- Handle the error code from drm_encoder_init (previously
	  drm_simple_encoder_init) to prevent silent failures and
	  cleanup of uninitialized encoders

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Changes in v2:
- Fix mistake in exynos_drm_vidi
- Fix indentation
- Link to v1: https://lore.kernel.org/r/20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com

---
Diogo Silva (2):
      drm/exynos: Remove dependency on DRM simple helpers
      drm/exynos: Add error handling to drm_encoder_init()

 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
 5 files changed, 57 insertions(+), 10 deletions(-)
---
base-commit: 60326b17f877e12846167bf8ef83680b9875218a
change-id: 20260623-exynos-drm-simple-bb5386d64597

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>


