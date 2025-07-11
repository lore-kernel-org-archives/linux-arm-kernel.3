Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B31C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=; b=wwJ1Gp+BA0FlqFz4DR3fjcvMDb
	l2sVIK6e212Iq+AgB0tI1qU/A/XR2scHaMwC/CqlxiYxbfgafcxTMktK7AEXgLEIa4l6YMnq4d4Im
	ZW91b65nQ5dkeybd1RSXXTKVn5ZGuIrJmxuSkYMZYBIisV63esLer7z4f6Z506AgPCyNgvmN9nENU
	0vBc665rnZMlVjMPhQspS4S+SfKsHGFaoFzp7E50x6K4lexoDrAHamsIs0rHUq6ighpGSQFeSgYgw
	p9VK6FvBSYnqG7lbWnUWDsly7m/5oo88Lb96z1n4YNeDE6+qhY5TwYgTKr4yiyKtp9uGxWd9LG8cf
	i5a/nJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4wL-0000000DcaP-2aS0;
	Fri, 11 Jul 2025 04:00:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4u0-0000000DcJy-23cC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 03:58:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so2123095e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 20:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206302; x=1752811102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
        b=VQlLwYhKbWvbbhC/Z4jIqddduJNfL6w7Xr+G64xlP8ZYYV+C1Xmh2pk66Mr6PQ2n/x
         4R8puzNKOxaEvpw+HQa4GgaB6pGC6c9KOqaxpxAP0wnE0voOAF3M+WdsXCUDDa0XTPxP
         Jzpv09X2/IqadU2xamXomywblkUxhpYfB5boMIJGiXhlqPJ36prjNR3rCspg5+58/YDR
         qW4GqMQWpzmgJ0DyGfiHM+xJQ4mq7KaeCyT5HVIGyER/d6tZ2i7D1M2v97QlkahwN47S
         UuAaxAYVjd/USIyo+SbRZe0b2jS3+hRHwFZaU4I4BtpIa7Zbsn04dVKX3z38Px4dX+Tf
         qEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206302; x=1752811102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
        b=bEEsWz63bvGLHwpnlRmZoEa2vqSdO3iCtUhrLHztvE+CKjalUD78PdfT1nLZ6qoMwD
         uM0OL2zI+RxB14IY14UL8kBuWS+tc9GoEmBG39NZI5rQ7h/G8khmCTYBZNRpfWyJGVDJ
         D1JDNUsd+KVxrdlRC1eMk2iYNh/5pOKbrwR6dH7KXfHAu7rePOXz/KGT6usyZaFwqZ/j
         wHwu+4dEm3X2EmyQZ4a4amqOiGEydWfR4wz1YXjngljlcSdWCHZgtyQdXuGD1GFlbOs9
         wM73Y4Tqgqoq5nMrX2ziW8z8Y+UtFwhK4UJFRVMBlTwSY6WO6bonP5DscsTlQPb7zkNy
         0N2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhYozA6EspoGZfsJDahaZQqad4knwiZHfIbAH84HkwCP8cjxtUJC1h9qJ2/kP9E//kmk/VKPPNUA4pMJxfcyHh@lists.infradead.org
X-Gm-Message-State: AOJu0YyKMhuuiGgEUMGRKH9zQAjtYEUbkEa6mQTBy6d/ZRKUlvdpqgiH
	U93MHWWIHAAqwyRijRzwIB+QIQR/3QBcVho7HFUGyx+D7J74dC2Uj2YN
X-Gm-Gg: ASbGncvAaiYQODgCZFyOtl88kcOZbReMRl9zyBoZULbuXzV2n7fXV0hTcH5mh/nEU7k
	j69MPPuqZU4Lg4gS2N9R3xsKN23ERRDFDJkdCImNcdcpeHcH+/QasSdTp/my0qc8QHOSvIK7+p6
	WQGf9mTzX3Dp/hMJEtyo5KkfNPq/aLK+47GhVUKNTy5SL74vBmhYPxRErtJNIXpGqfIzzIeB5Bh
	OIpaz8P/HGEkoy4OKw+oH0/8FC7+qvdXHCiKPKLptTbxkJ541yvzDdJ7VvZhAj/P+TiChkIl27x
	aBIG+3ot3V7r3ZxxwH74UOPkXaVuTANYKSxJfrZU3XxFDxxjX1x5+eGDuK6qUP7LbVjYFePDo9f
	clIo4/nTRdvk=
X-Google-Smtp-Source: AGHT+IGqjUC6+LzbpSLGosnqY439fvJxlZO9uR+Y1dc/WDIuRFhbiDBiR8QodGnlwa6oUPkK4Xs4TQ==
X-Received: by 2002:a2e:be11:0:b0:32c:ef7a:ccf9 with SMTP id 38308e7fff4ca-3305348a960mr3406601fa.32.1752206301782;
        Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] arm64: sunxi: a523: Enable Mali GPU
Date: Fri, 11 Jul 2025 11:57:26 +0800
Message-ID: <20250711035730.17507-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_205824_531469_9162C13C 
X-CRM114-Status: GOOD (  13.57  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Since there is no support for image output yet, it may be difficult to confirm
functionality. This can be done by running weston with vnc access using
the command:
$ weston --renderer=gl --backend=vnc --disable-transport-layer-security
--xwayland --width=640 --height=480

After that I was able to run glmark2 with a terrain result of 30 fps,
while I can see that there is a load on the GPU in nvtop and the CPU remains
unloaded.

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc5 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/

Changes from v1:
- added compatible to the documentation
v1: https://lore.kernel.org/linux-sunxi/CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com

Mikhail Kalashnikov (3):
  dt-bindings: gpu: mali-bifrost: Add Allwinner A523 compatible
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml |  1 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 6 files changed, 36 insertions(+)

-- 
2.50.0


