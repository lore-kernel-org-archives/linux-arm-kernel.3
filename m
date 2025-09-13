Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D1ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 00:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=; b=adg0bPzxC7M8al0eLZwbQATF2h
	9OK9YkGg3udBDA5VDqfnRdvyHB4OwztwdnWqywXNBhVjjqaF2jOudgVyl61GnxKU7/JFPDxn2aH12
	Gj8XKB57t7ozkIzAds9BF+Gko9s+CdjCUe2EtXBeKFSwTMgfigv6d4vMjcBOzEBpyHV8g2f+aMb10
	O5xkK5GtkYgy3XJBxC+WoAuNCOuT2F38J1dTVulzIqxKJznnO272nICgN0dD9ljwzEo2zDtlHx8ok
	TMPVJMVWA+reeko2eYnxV/+y5VHnrVG8ZImvPQutt3YtfNWnqhZSxH9+ut/x9opAurLZ5A2Okwu4w
	+dQE0M9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1j-0000000CHmL-01d2;
	Sat, 13 Sep 2025 00:22:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1g-0000000CHkO-0UFN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 00:22:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-26058a9e3b5so2435615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757722919; x=1758327719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
        b=dj0JMGtdSYadext31wa/OeuHXOWskOj0mwU8AZQBvCzPvgKvVNdEujBiMBFuXoZhpp
         GVuHjJZVGRLrTnXe95zVIleNuSBA3qNA+T4qxmPySfJp1jolLttRJnvf/MmBuu0ZTPx1
         E1unzDpVyrB06jVsAc6avAp1yez1rQ4zjrUEh3uAusJ62jy/K+MSmbE5lx/XvpZ36bYy
         tN7ynugzQZZn6AOi4c4PVoaZ89N271nk2n83bGB2KbLbvptHUGY6xClGcRV95DWnRgov
         6UgEjrjqM4YHwnEalvIGQUL9pXu7P4mgYANs8XBlSXf2ZMWnIqS5uZmp3EnVFpecWJIY
         6/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757722919; x=1758327719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
        b=CrWbH/Opsx8rlulZIfejV1OYZsJfh2V04mSGfpsjeYRyGIMdM5TpC6DIISM90Vi8Ky
         lqHwW6+hPZYB1w18aYqBLTk/Wpv/k7/SMppRe+1kGAooaJ7peqCla5dkOFWrI8E005/b
         l5bU3D8XWzvXK81yD2l40+Ujf7hB75C2eyYB9Qp2RA8lveV9nuV7ZmPpw7HOpzwxTU6P
         XSJ/16JVa9z8MDa856n1TuMKXcKOCJokBPCXK8gHcSZtK9dkA4/WfFLm9EnIHfmjkQW2
         cy8Z03pAnRTldOnD/ojt2c5srxv1Wflr9jAO0ga8x9kIl5KrICjNCRMjsjvHEwSVGnGm
         4L0g==
X-Forwarded-Encrypted: i=1; AJvYcCUjIDXxT0DH56m79jf/SmOeaYJQVVmsYIuCXNIcUf97MBDMi7WsIxx9lap7rjscv3mSpIMD30g4K7dsCtQBgBa8@lists.infradead.org
X-Gm-Message-State: AOJu0YxP9sv2Dno+FDBkb+JFBB9ErmcqH3tGhIMjjS95Ho0j55lxjnNk
	tHvlAYBPsEcjabsjbXqmWZBemY6zvB/3vs4Z9TqvhvivKbh2zULpEiBF
X-Gm-Gg: ASbGncs0VI6fNIsW+Qrq1N9tW/AfFijKA7HvQSi5MaDj+/P6hkmSHZ0nPGGLOgbBSyc
	fsB9V1T9206uPt2nYkaqCIZ3CcHKOxECvJsMdx7E5o6yDK2VL0g0uvzZOVdpbm0hrcyAtUWGJ6n
	74Nwls9oOpGXxxR1EI+/fQMTujX3Oi5+MrL7+8sRGH6+s6IwWRMMqHc6fgeh5XzRfTSJKy2PcpI
	X7dNIqGFAaH87Olhhd/35vQwtcJ8uyvCVRTWI+UsxXOmDftYmkYubq+HihDVtJr+KXerRguCE8Y
	mYS8DhnWTMgGbWTZk6lgL/Fm+J4EcjCCcINFPsnOqzlnn03G/C/eNBY2H8i2LrDs7zb9hLY1Vmd
	MSm12t19lTC4YPX78gdiiBIIbvQ98p89R3a8R/EAyAFR1NEacbiP9nB7+unlZ93CcMeYsdBz7L1
	+/OVUNi7qt+A==
X-Google-Smtp-Source: AGHT+IFohPP4U81t22Ynet3qFVaqgBlL6dIfvElA14+ZZZffQX0/DiVAU8HTvR3Y0I/KjtcyFh/Pdg==
X-Received: by 2002:a17:902:f54f:b0:249:308:353 with SMTP id d9443c01a7336-25d26d4ca85mr45666985ad.41.1757722919083;
        Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32e0c2863e6sm406490a91.28.2025.09.12.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:21:58 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] drm/panthor: initial mt8196 support
Date: Fri, 12 Sep 2025 17:21:53 -0700
Message-ID: <20250913002155.1163908-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_172200_159582_992507D3 
X-CRM114-Status: GOOD (  14.59  )
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

MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
support recently. But the soc also requires custom ASN hash to be
enabled. This series introduces panthor_soc_data for per-soc data and
uses it to enable custom ASN hash on MT8196.

The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
be cleaned up and upstreamed separately.

This initial support also lacks support for some hw configs. On some
configs, panthor is expected to query a mask from efuse to mask out
unavailable shader cores from ptdev->gpu_info.shader_present. This
requires extending panthor_soc_data with a callback to read the mask.

This is an RFC because the dependent drivers are not ready yet. But I
would like to gather opinions on having panthor_soc_data for
soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
soc-specific code.

[1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

---
v2:

- drop RFC as this series works with the downstream GPUEB driver, and
  should work with Nicolas's GPUEB driver posted to
  https://lore.kernel.org/lkml/20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com/
  with no change.
- remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch], as this
  initial support is just about ASN hash.

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
  drm/panthor: add custom ASN_HASH support for mt8196

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
 drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h      | 14 +++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c         |  6 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 25 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 6 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.51.0.384.g4c02a37b29-goog


