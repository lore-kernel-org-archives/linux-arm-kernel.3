Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3B4EF5870
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=; b=GH8mu4FCOo/uqzwVlga9NOB/jL
	BdwYwnCT4BEpFbg1JQxCY4F8gosZy2c7GUCSFJbNixWJs8H0M3eebn/vefVoWGqVjK+GugFOkfR6E
	jpQFbxh1Iiys0cbMZtpwDt7LW8/8SmUlueHSTVSiRFfZ1b/cq4oSSYknjdg2GpSr2R08HHBKc7IHE
	/CgwGW9xcZlwEQdpuldDd+6Q3BTKvscLGkDDLfGN/FIlPvMtRmT2wJbDWJ2fJniYOUP5u9TjsvhNg
	PW5wbvHoqihJuavidL/vBihf2B54N7CURsI5epvV/0eQooSyWeQg534U8r1cbmWJx4L0T1eeYG9en
	0E2ceJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXur-00000005H8f-0aNk;
	Sun, 15 Feb 2026 08:55:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXum-00000005H5g-0VIa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso16494595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145738; x=1771750538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
        b=U2heVTBrA2/Ui/qJncYndQuoAnc5mxg0uvsRkm0IRnby6WXD5AQKpzuwvkFSDN42KN
         dInghujX7WhpiyGbXsf8h/AYpFVoYbFx8qvyVzndd09dw48sT55LFk4ovsrTLUyxtSDH
         m2SiSHFjAgzfrQko84NL15OTrE/8HNPcv0fSN885re9cx9OXo0vqRuOAuLZ7lKbr7fze
         3RkCHaFH8tpvE5YtxraS13YEU+tlxmKMBF/6fDcag/dexnXNghPSvINeOjv5Gczv8q2O
         7CAZfBe4WuAHLzA1Hx3x+ZGyuRbsZH6rMLP+9dBhVeGVNcwsDokkO2XMSrdEFY1m6vyZ
         o+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145738; x=1771750538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
        b=QTOtbsvxy8j9q5DFhmY3j/Lox/ON0nI02mI5fA02Ammy2adZ67hDnBSiqujplr6DMs
         9X2OpM98V1a6p/358S6aK+D+bIPjyFnJcPp3G8GxduyKTwg9kqiLGMIaKKupb1jrzSKd
         YDznNVNw7es3/Lp3dSqJiosM7qkGnhnQ/ohNPcsQSfQuTBFGjdD/FcaF/uGi/C6/CM0M
         Ytodal7Wwczil3Bu25jrnHqdcgC5uhXPekThQu+s8qLX4AYKz4r5TMmFHG6Fe834lZ9i
         8GRxuftcNb1C1eEA2WJqCHZ2vhPbaH5GyzrOp/B5V7jxbX5KjEDbbPaI3fmjDKORINIe
         d44g==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ5hOcWs8MKzuJECo0ue75SWSF2rjJJCZgtklI6oxKpLJvxYIM9VTHmmLQKtauajG1pGjQO+VwO825e6ObWoi@lists.infradead.org
X-Gm-Message-State: AOJu0YwBhen9Aeyn9OafEMksxkQrCrLxg7x4vpykYAWsThynAP0OGXSZ
	94c+k7FurWW5Nt64Y17503k2W3UL5xPvbqxLz42gy1vd5aaZ/vngEJLu
X-Gm-Gg: AZuq6aJiRzvPAEZ/J7AZSvR4SCtB0b4JL3gtGfjxbEl4lf+k/yS6GLZzOmEBl4YC8a9
	9f93iKn9jN4hyJS0wNww0wi9+u9AtBqh+Bq69f9DvZXOKCZ1TYX1yHF7XkMMijzJwdUfBPz0Jcl
	uQ94nmqvMa2L50a3GoEXcPWsTQakzuh5RNu++oSyBbjwP5FGtxaBeoMOzPHxOMVwea+xMizXGf8
	N0aqvJJ8KL/AS0eIkh0suTzghpyTj3UWg+/oewvxZ1Wd9T47PuklfLxjSeO1gT7dbAvvqzmOFPj
	lvFlaf/Vezi2OkY269TGC8HGlh3G8Xh4qetJ7RQcV5SspvPUE6/jDJU/j+XsqGBdgtDKx8+cf8G
	PGwJjvTU3XFb9WHnJN0s+GTQhz4B0eYgchJK7ZxUVbnss0Nz3ITF/IqW0o8YGY+DHm7JF8CbjEa
	W1qK2ZprAOPrx7IUm41f0=
X-Received: by 2002:a05:600c:314f:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-48373a73ec5mr119238475e9.31.1771145737543;
        Sun, 15 Feb 2026 00:55:37 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:37 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 0/4] Add support for mt8167 display blocks
Date: Sun, 15 Feb 2026 08:53:52 +0000
Message-ID: <cover.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005540_247184_C618010F 
X-CRM114-Status: GOOD (  10.81  )
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

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other changes
as this makes later patches cleaner and easier to follow.

Luca Leonardo Scorcia (3):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,dsi.yaml        |   5 +-
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 450 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 446 insertions(+), 35 deletions(-)

-- 
2.43.0


