Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB368C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=; b=YmESOD1Sst/bhh5ETGRV/0EPXJ
	04bm7YWfOI6F3pswiiqic4PmVaQxlctQEpujPa9cXsE12/NAWkbai9C8z4lGiq0X0rOK7/j27BDNi
	bcgNwUSfILVfKB5Iatyko7kj6mwMt1Jt/KT3jfqA8a5ctS1+TPbR4uKD1qAwpZwk9dYatrl7ntXWB
	AezGLA1lOqe+xqX/kcrY04DkbNmhCxzFi2UnhW4nYQuBI30O46ZexaxRmVLFFOfBjQcgOpOM+l3XM
	TzCH9xgXccwvbDxYI8r7J7tYmRk3gFGkYHXeN/u33inpcbv5bzSy9cSgrQf9VLRcfVzJWvAkgBUN+
	rTmedgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdEu-0000000Cc3o-2Zax;
	Thu, 12 Jun 2025 08:24:48 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgk-0000000CVSu-0ehH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23633a6ac50so8721995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714569; x=1750319369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=DfjpXB9MJ4jNcfiko4gCDOol4CX20vwo85Ag2R3VAAiEBpAvBSbaQv9GWW1L8w9VsO
         vcg0e0QL9dfT1W9mcaV0vzKhHTMIGh69Yq+WFakE+33GJiufoXbajpGcT9TfvtN+hk8U
         O2DBNIYzASLBA8+1i0GKl6Mew9Xo1wwFNcq3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714569; x=1750319369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=TVNEL8xSJ2Jc0MI36o3ABc/GM+6oyBhFQDkhghMIZXIWBA5Y81GuPejWkA9PZQfHJ+
         hQ3Vxd1cK804Z2/VtdJR2NofqSHFytaqN7Pqz6RvWVILpiULUF+asbsKciQ7agGGs/Li
         ihN4RfBf5MLexpOmFPRisTiIBuum+o40zgtS+jH/IpKitiQq2Zffm39AyfWhIB3/+jLF
         AUYX/wseg3whXGXDAz51Vi+DVzb1c7i5C/UU9bFdWBhSjSDdK9zENIY8IE8mSPZcfOsr
         PMCk5YzTaDRNuoV9PmSs/cpIG5Avab0zMgbrcgHDfjBKjrKYSfQzgfOKdN/n6chJ9YE5
         GH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4aD7BYJ8W3xHvKQlHVMbYpkL3ilNlqUedHUzE3vPMS3/VhjoZa/TC9ftZoDeae8XKHry+k9uXQrReGSVf22ns@lists.infradead.org
X-Gm-Message-State: AOJu0YyGpGCc3DWRn3HwP89qFh1vhh4UNd+pt3iw61ayhZ5B9FEPMlNE
	EKQeINHao92g/PuqpDRYCOQO1egye45xrjLNSIS51zHELDyGqpScqwK0OoIBv6hKlw==
X-Gm-Gg: ASbGncvmVsJmWNtejWc64bwcJu03i/Dfv4+e+p9MnWzXOPNM1mEKL2qt8y8oFV2VS0B
	KkWIXxkl1sO9sZovdWAhdv4bMYkER+k2KIIhuXtzqvy5VXhzQq8ngtAbbp6qf0mrvbEcCqbpC+8
	h20RaXtWajux3U8g1dhKYLhpvzCnW+LuwqWuZ9QrsgXWCVse4VSbzd7eMa3m2C4ebbEOIbB9TrO
	FEjTRNyMw3W1rg8rF3FZ15W3P40xVrSKXihoicmawVj5vv9TnFxg30fWr84KuMZ7fhiKUx6bBHB
	Rmqsysqcp9k/jaZZgSFCjCJGctvTnVIOefLqj3PJvEnF3SE5Op4QTO+TvkLvnFsEGLL6W4j8NXN
	qm7G/LEmwO+aduA==
X-Google-Smtp-Source: AGHT+IFE5DvvPsxXV+bi1JEfMtSwm9K9UZ18IP94fohAyoCbLtffwhmgBBALXCfno10M7kxbt6Y0fw==
X-Received: by 2002:a17:902:d54a:b0:233:ab04:27a with SMTP id d9443c01a7336-23641b3fa11mr102085905ad.53.1749714569502;
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
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
Subject: [PATCH v3 5/9] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:56 +0800
Message-ID: <20250612074901.4023253-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004930_185040_D3AC9021 
X-CRM114-Status: GOOD (  12.33  )
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
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog


