Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E3D3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=; b=Z9qWzqpX8mQ6V3Ww8sb+s5WN5G
	gR56MsKKoRwBZa4A+pvHpsvocleCvRdhHyBs79TFZiBGib/T4qZZxZY1B6hrnOAwsh+147yyk0Qkm
	s/Xg0GXWeOd0OkkIl0Se6m3/w7zGnnWSq3F/lLrnJv7El/fAvKLTHtgAJTO6QC+F7GkOYNqHWxUs0
	IQXvvlBhvXvEAMexdgToKVwlXI8oePgrJaFYQcnrVme+PCfFbbcREiKDI3eYHrFfXY3hjalBFGHUr
	dv2SMMqa6sA99E5cJtQcv5bksv74z4tpZZZmL0kpE3NEAPv1hdgemdgYzfGPNOi7HJKk9AgHJeRyZ
	fCUbsVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUYX-00000007Oko-3WD1;
	Mon, 25 Nov 2024 08:34:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFULm-00000007Mbg-3dGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:21:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cfaeed515bso5472746a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732522901; x=1733127701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=;
        b=OawZgF8lLm5FNYs0r+o7i95RnMP+LmjsTI9vZNCeNE+8qxX/ytrLWU5myXR6oGWjI9
         0sfajnQdeVMgDOEba2l6Dq1x9H4kx1w2vagNiUvtMO0wQcM7MqVL4XctAZs9uwf/poSI
         WIXoCtPLNT/Si/aYzaZ8J9z/T/LpKFdYDs14Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522901; x=1733127701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=;
        b=oxlxtbEhGQ8sBBg4hhmlk8IFwiv3FRVHUA69xMOpdPlHg8kLPWY95YPv/AMLEBOa6D
         Jr4dlM1tNJS+l0pDz1I6lbdFq8sMV5iJBpDYsPLrj6b3+t83loQpwoo06f1GH+vvPYYv
         Vb/mnN9t71ZY/vr4UPoLb9oHChpF6W3war8aEwi2kZ7m+G1coz9A0WJDAKA0S5H+u/Er
         SAJwnMbF45i0ZqsUJqboWCCJzHQzDNmW47lrQ21kerI9Vnd/FfIIZKAb/iWTIgye9rv3
         2y+mgwIjVQZ/aA5M49fBoB35sesZ3CLMHvMK+e0C6QJ4aDauTux4UGGxl5m1D42FfTTC
         aNVA==
X-Forwarded-Encrypted: i=1; AJvYcCUPpqhDDyaGUswZId1KujlYEpwAcYwz7MM8o5nlfLeT2MEP5aZMxmnh8/xSYDqArmiPoEC2kf7r5KAF9OVhFjmm@lists.infradead.org
X-Gm-Message-State: AOJu0YxAM856/Hjx+qS2MlRwBKQSkNyGsgldDBaVb/F/Vd6vwOYtpvEr
	Xig/YJwgAu59ulasfyk5k4MmnoRKv4sWzGZchOjMQvo493eP87xrdL74vDkV4A==
X-Gm-Gg: ASbGnctlpkigM6ymVZaQtsCSuJMhGHYs9T7oyUfjGfHgF30Vnw1uNFKV3PTTfpz8SNf
	DUlnuqeM99BNY5doGSC2FXxpsJgVpji+s8vWtSfbbsXaH4BejMXi06d8Jq1ATO2As+zYGjQbi86
	bkj8tC5qlhAueVcE61PLqypX18x3/VquXcIR09JTopXUWak4IOoaba0q5Nzk2mDM/BoUpt2x3rL
	8+T09fDAi1knfy6mJ9Pgs+duUi+8fZw+2T/NRi4QpWC6tR6NlNbifs4k26Aa7XKefdSvL5pDF28
	T2nuJbhy
X-Google-Smtp-Source: AGHT+IGY+FX04mfzxmplompk/IW14NqbgJnlcBAfKd6jUF+oXS9F+fBvE0X/zqk8o3s+U3ZXOSneZg==
X-Received: by 2002:a05:6402:234e:b0:5cf:e894:8de9 with SMTP id 4fb4d7f45d1cf-5d0205c6315mr10497739a12.3.1732522900638;
        Mon, 25 Nov 2024 00:21:40 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b28f719sm430537166b.12.2024.11.25.00.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:21:40 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2 0/2] Add Starmie Chromebook
Date: Mon, 25 Nov 2024 08:21:27 +0000
Message-ID: <20241125082130.2390310-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_002142_920571_19D44BCE 
X-CRM114-Status: GOOD (  11.04  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also
known as the ASUS Chromebook Enterprise CM30 Detachable (CM3001).
The device is a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  29 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  46 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 480 ++++++++++++++++++
 5 files changed, 570 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.371.ga323438b13-goog


