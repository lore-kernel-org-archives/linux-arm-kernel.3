Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3061C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=; b=EaaY7L9HkHf5X7YDm3C/xQqh+7
	x7M+QSzAqfKueYVmJCRMCp+I9VMCuD580BPipZ3g4ZGAU82g4YiqQ7Ig7UYW6UOZnLK2TIKZJ1m96
	j21Y+W7okZWFK8TWEuzQLYRxjWwOiTyXeSSeO13p8g9EkQMNTtRWRe7maX6ncjrUIuHxEM1KAt6J9
	895LsmYYDax+cev6So/cyw7K4CtaFdkXGZzMFK/06ME2rcU6P1e+kNTOXPMu+nRQmpGG2HCV8ofRV
	VG5YYQaj8+4gZaicI6QRYPTSKoPUca72wJgRS3lTY3uf++QNEnSple5xt65+USG8O0eFwCQDk2EcH
	sOGf1o0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdCp-0000000CbiS-2VLt;
	Thu, 12 Jun 2025 08:22:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgg-0000000CVRL-41VH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2363497cc4dso5939805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714566; x=1750319366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=HQwGtO6Ebaf3dvQ4YWnEwiAoxq2FooZMgulpm2HPxFiXc8F5SGFScNa1odFP4YfXDZ
         /m+5zrIl/xI/xUiROLWfktk1DHJwOpS3DXDEud2i2NBrY0RgQajBr84ZGiU6AwTUwt2d
         Ps1MJYaVg9NcJbJam+H5uYZm3GacmB4l2nTuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714566; x=1750319366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=HmlOGD0cIf5CU/z6g7zbRBxr5+EKv4F6XjZ9/9i2e2vaX8+DjjIwEro/ZIoibXu99D
         Kk6SAJB5I/hFY+90IUoC6mP3twxG5k5kbfO/ZBMJx7Vmyn5ueG94AcH4+Pb0RTF9gUnu
         PUUoJ3nPWyLiOsKxVbIZkbot6zqpgb9z4zlGZON9hiOOaG3VjjGFfSgERcbjkjbe4bMQ
         ImMfNmOsZq16dsVRKax3fS2Fw0yfQuAw9ZsGPaL+ivbW7KjYEG5TYl5HEGi/w3sf6iyx
         TJLmeEl/xb5NhbrOBWLOI4pPTchLmBnAuFGDwerrppf3makvzi4BTWJt3Z9WzYibC2eA
         InNA==
X-Forwarded-Encrypted: i=1; AJvYcCXjwerrEE6TOWgH6yZJzgM6ayCTBkFFGX8pkr815ul5sqeR5oDG8xc5N3jZvolDXNpKTpDGx+Cgg/FfWrCLZuNF@lists.infradead.org
X-Gm-Message-State: AOJu0YzZgaQpup9erR/m2b3HlSIm1YxXK663SLP9KdkNE1n6nPczfsx1
	tr16GJHnVVOhQ2ajId8T9IkVNMG4sh27+EkrdhTzXeBYtsYCB8B9UmxvQfxKgvAOlQ==
X-Gm-Gg: ASbGncuoVL0CuLoE+Cog2LMdfbQn1ip2ZGVwKUxrI/pE43wshIeuIiDLYLx6wHA+GON
	Yc1an5ic2kuwgLCqjzmz4Ay/qbTEopwSzaO9drjrh3DbB5QN+jgGTj0NlzugFggflljwyHs4dyB
	7TVUN1pHVi2VyjJ4KN5KWMdi3nCOXlFbH2ZUz4urZBiMkQ/oacEZVWmBR02biOip3+ZwHidylSJ
	hYCf29XNCSQgD4/N3W8RU54m68CRp7rTYkMCUmfXYcTgHpVdw9+CcnsQBjuqm2hZuQRCemK86IG
	SfUKzggoLhvNoh31JKdvTJHOjqoAP9Pyeqrs06U+mgI8w3egL+j3Wk/h8H2n+A6Hv1nageLwRjK
	M7k4=
X-Google-Smtp-Source: AGHT+IGLmVy09OL49mJ9w79Slu0toVZtoekmlbumEh4gtf04pg2yxxSPvNOvb9XVQc/93dY7TLT9gg==
X-Received: by 2002:a17:902:db08:b0:235:f632:a4d5 with SMTP id d9443c01a7336-23641aa22e5mr78622785ad.9.1749714566433;
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:55 +0800
Message-ID: <20250612074901.4023253-5-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004927_037028_4A00A9E2 
X-CRM114-Status: GOOD (  12.53  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog


