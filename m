Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A9AD59D90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=; b=Fx5/adjVui+iUIliOOyMvItTG2
	tAKpr3VckNJoznnxXdkSiTaIckavI4nee8FsJDyolLPFzXIlBtqbrsXcVsrWTiUQLm9UY6NAAjleY
	JrIV+MkggdP5j8jWHJj6qf8iExyHIm+i/mNIqvjF+4OSIlY1oEXjK0F9s98Ti0fReLC5m7xU4Xydz
	q1Xb4L8XMlqpNH6lIdDq7hm4cMagzatD18h8n4Kuxdh1XpsvKV7ho5mQXmffPzIhOJk7pMLohEbIR
	yRdNcHNZ6grT1l0dIcFPY2xllcjP9YDVWYokV0ZiOk6DTa2O3HP3M1fXI8WlQ0pdyxfHBOkVcGF4Q
	tAvqBMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFswr-0000000AKCl-1pBg;
	Tue, 26 Nov 2024 10:37:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvt-0000000AJwe-2YU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:36:38 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso86940521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732617395; x=1733222195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=EJMmbCHZ4ira8P/UaldYrpZHS4Q/Knhm8jxJo7Ib0McbF6e5AXrVihH27aD72GjSCZ
         GaG/NrzmajkjIel3yuiFtAPDox+0mnpshuKMofXdHx5ZIjKQN/+yx+r4Ft0orsXoAORo
         8SlNbA/uuL0u1/7+WcHq/cxrqoGWIp2ZpCcWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617395; x=1733222195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=oy3gD7xBu36DhTqOT3HOV3ZmNw9WN3Plr54ahykui+4xyrInqEIsczCwEhi5/S9V4b
         iJq2Nq2/0fww5jiHM37rOOnXcr+f5Z/FQCw5yge16PVuxyKOVceM6VRmxF+TExohSxde
         5tE9++wwy9B4l2R8lAAq0IJQzahjpOUXk714uzDolpSKRSGs3RjbkMDlrScXdTjgh3sV
         WpNnKxtxWN37Byyb941pAu/K9fOYfUO+7KY2pypDWK5TPtDWPsgajSDPdWh28qclh6Mw
         bpP9u67PwOVR91QhzTQh44DDWTnmIXkfFUft8fxjUpfUVgU/LS6L5pUE+A098KVZIvZ5
         A92Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAxbLAkDUYXahHpXXRJUSCKY0DriXfDTy0yI7lkQwYHMOaN3AUGXUY11t5nXchIPsvybyRjG9sD+Ng4LG+v5xs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy99rn7lalUddCyVUTQxHBFPIunHYVH/T6Uv3XI7qBLDOZuFX/Z
	Dg/+BMhtMzWOwZFEsnx0BAtYIiXl4TMiUvkM1GPlYLqYiqrPA7TfzxDvbVsUgQ==
X-Gm-Gg: ASbGncvfbeaE0s5+XLrOX+1fxCwgur4qOemn+GIc+FMS9dNJIQHgT5rAj8uBFyBLmKZ
	m8vdzBUxB518T8U0Jc5VMJo6YtIWS0jxbAMeFk6eqmJq3vj4NGXmqT5R3Sd5OqGlnx55yX+88j6
	1xyBPt96HSSEy1Bb26Fs0aBhH39YB4RSCtnovaYHtjKEN20GblYquLI8HoRZ/9va0ak1BVDlPAb
	VECQrH3/aKMDzTtaNipeageYGfvUoEpRZMFNwQ5IWYDCDTzQxEz4lY9kbIANAxyCB50P/nmd4cB
	4eQ5hFC0
X-Google-Smtp-Source: AGHT+IHUd82WHFzG3Ngfmo9+Qx0VDQrc7wt1+aqc5AYj5jle85lRZhKtCbEOP9pPHyNo7rQmWMAmcA==
X-Received: by 2002:a05:651c:54f:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2ffa711f902mr117712941fa.17.1732617395232;
        Tue, 26 Nov 2024 02:36:35 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b5b6e9dsm578926866b.172.2024.11.26.02.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:36:34 -0800 (PST)
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
Subject: [PATCH v3 0/2] Add support for Starmie Chromebooks
Date: Tue, 26 Nov 2024 10:36:30 +0000
Message-ID: <20241126103632.419469-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023637_638628_12D0997D 
X-CRM114-Status: GOOD (  11.74  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 ++++++++++++++++++
 5 files changed, 542 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.338.g60cca15819-goog


