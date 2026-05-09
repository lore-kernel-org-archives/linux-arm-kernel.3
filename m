Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D3CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 05:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=; b=gw9nrXi4CHRsSXGJM1NZ+ndHwX
	SSZQ2LWlt4oMWB8ccYEkmbIxrOWAEKVeHbvX6/mftuXqbqVfUwIEKUk+QwdBSUXgRQiAHcnXzJfiF
	p2A7912XyO9r3mU0XO3KxE5Kr7d1D4hpoXzQ3MtL8jzaRYI2R3DISOrJBgyrnhjuEZ3PdbMb1S4al
	Wjn92Ei8qnv1P357c7X86QABldj+8UqvEeOmV2+N8x4cGaCsvt8htP79zQX6C9R4dL16Qwiohf1b3
	KiOeeZfnFyPIuOEQIF/V7IoqdcDfvD1UGgr+9AaDAME2MaFk7O1UPjnt5029Ocy1OBLR7p6B1EyDG
	SVF8w9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZw0-00000008Gdd-3UjZ;
	Sat, 09 May 2026 05:09:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZvy-00000008Gd3-2i6s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 05:09:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1625957f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 22:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303340; x=1778908140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=RTJ+aBnpz8bkvdkHf3cRn+fP1zEgq9Ax0DqTKqA2aC858cCzMFXittmLrHHfXejKdK
         mKT8EDUDSOXLujIhc4progYaQcPRYYpnfIGNIIrOylK+CBdPVi0Pp+/COBdB4lRe8w1M
         Rs1eqk4N+O3RTOfAW/yubKSUXll+X1OB8mwoE7mzVLB4b3Pbs5tzTPlw4UwBU6pZCliU
         j7iDzxu+WVDtf5H5+nAc8EkzC0ad1SZm06VuG0UxPN/GuXF8UQOezBqpjhsW2W1YBQy0
         eKbHioTj8NW/Jr0ov/22i+jj2MR1EW0IotuMMj5OhRjjTmeYjgvVJPSamlQD67jH4EG6
         oVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303340; x=1778908140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=gbfyFl50cKBM01EvtZDIvlOL3UtJJX3tHF7cpJgD2eOfuGHqnPs2Gmrg8612gTAqEZ
         8Rd9ry/sCrbbyOERPif+TneHKNdYgk8+Uc+KaYPZV0QKPzlEyF+GAFrq5yWmK3vhM6YR
         UNpoqFpK+XR2V/7MrH/+WjX3dr7pehRHCjljOT5gvuPb8g2ZBChfzW5esuXxFHVE3YtJ
         FXVwjTF36Iyv6oh/WpgOTXowQ7ciwGq9zDkDiU8E3UMAnkT6T7h3nRpiVPQq+9wI5q3M
         VboXdZ/PgOh53bmGuWP2mzrsVKNnds6rk3x5YAL6djNaON2rETba9GHMJe39aRYDVJmm
         BgGA==
X-Forwarded-Encrypted: i=1; AFNElJ+wemNbU+NY1OQDhg2Z8aLFEWgLPVj77OzMpncrpJmu0butJi4aO6QxXFJ3MJQBEPjM5Vf+/Zd6FZJ+NP90ZVF1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy59l1p9VHgKD5rksLuTJHdJOxkpLZ+IKv7OYQSQMk/MvBGALKV
	f+kFM3Pdvc/ixXXaZqroNW6KClo0NnRl+rIOxnyKBT0goSa8b/fyn8t3
X-Gm-Gg: Acq92OGrmITwLab49czWYwzCL2Zyaei2jrS2J1pMEk7vnxKaI90tABau9/sHRwNJNkY
	X9zMGAvdNYu+KS/3POsBGTccTad31Uqa6RFY55bT3g8p+HtY++j7puzGUNL5Ueosa93jzeWCbUB
	KtxdnyVlliGHb8RWJJ3WKgztiZU7Twwb78lU+Uw8y/R2YPfWPcQ6DxtPh8m01AQeMzG0mjIMSCd
	hoyX6CQoJd5gs81Tc0BXQ1TYJS/yXnXtRpm6ddNWthVpVcqd9O5LgGtOiG8mUpuf/EVIYZFXKZa
	ati9mQep0wj1flAhcyA50zTyEaz3kYmImo8g0MRzOHnuIzmGln0kHHzkc9Q5FCdaZIKK3bNNcZS
	/vmq2B06Ue/frjysfIVaaCa8xdW+YA8MdKpN7xuV5REat3ucGbYXYx9YN/lj9qY6WAvyXQv+c8O
	CkVg30NyVuOZ7pR/NSdC+JjCwZJyLFWKRUiGsBYngULwy6jWcFa/KCvcCs1o8yphSMLO58fkA+9
	Y70JAVQlQ==
X-Received: by 2002:a05:6000:22c4:b0:44f:aeac:5f66 with SMTP id ffacd0b85a97d-4515cc31c2bmr25655234f8f.31.1778303340455;
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm9721296f8f.12.2026.05.08.22.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Sat,  9 May 2026 08:39:18 +0330
Message-Id: <20260509050921.22158-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_220902_768396_8857946C 
X-CRM114-Status: GOOD (  11.68  )
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

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

The final patch adds MC-centric format enumeration support by filtering
pixel formats based on the provided mbus code and advertises
V4L2_CAP_IO_MC to reflect the intended usage within a media graph.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 144 insertions(+), 108 deletions(-)

-- 
2.34.1


