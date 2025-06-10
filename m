Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11DDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=; b=FE4wRlwRO4QL2UDKHSvNuDdTO2
	6mlQddiEqmWKs/mxGZoiivFPGWLOIeAreylp2ROnZiddoQOD3Z0fFsm+SXHmPHq1NeMs2Pffr+nla
	pCQ1SfZsmsdRhjT5sQPs60HxEDndtnGwQlvI7hBBS/oI2vWNN6MgMXCJmVTZhPB7s2iCeYwHYWVbx
	Qf3wurvSJhDQTb/9tRne9iYakz9dyEkrEJUgoywhefzNbgbWaToYgc7yPMZVZAvCuSJvEUWeP7UxM
	EdXw6Kyk27BVK9FqVvkKsBSemceLMuq7pJcxXdwePLTTRlCMVqi4bkz1Zxa4oRyjJjeGjl20QMeQR
	Dy0zD/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsdW-00000005wor-1kAB;
	Tue, 10 Jun 2025 06:39:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZI-00000005wNS-2gTR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:34:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2350b1b9129so32760055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537284; x=1750142084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=bCo3MYkw10e5btgNkyngmSK1uxRjc6bZIPuXnb67pPcekRnJsOXjLuyXfxY0jjAYBy
         LzYG+LLsVM+6SWzxMOXr58vMZLyACeAljh/UMvHhQPsxrf80JfLMiQxWt1TEClH4vpSh
         OHWj956BskeM9hFEho9G07XkT2WXOH8csjtV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537284; x=1750142084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=b7oTP1X/IeD3H9wseNH84YFOpuQCLiIa/NK9kxId3L9tEkKhVYO0f0xK3rzlux9jQc
         tYudeTMenmOcd1z1Mwa9vfyAxBdOqXlVPArywSz4LElkcqRg02JuRabDpmg5f5dDWCbC
         JhBjner8ZVIhZW9ze57fKFPUox+Lf+Mn1i2CDZC+niQEA6sQtkYfiepGu2cahHTA5TGl
         stYEgqDgGPfzvFibs00wa0MarTrs+vVrFWgauQ5f8vXchne4ggL1L67TghZgNLWiFpDY
         DGNusMcakDX1U4oYzEaBr2TFjf6Mf2HEODmeCMSnCbx6OA0G6BlJy4Kso8FDhV97/JiS
         w8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU2hVzQWL8V3ZYnJATEgZYBehIoqJD8RbtRdHdll1Z/RT3CjLTegFlD89aUnLUddvIx4bzvyHQ7RcA6aVzHo50T@lists.infradead.org
X-Gm-Message-State: AOJu0YyQihJCxNFxzALNhJxIVkuRDOHqDoVRgjeLAc+TbsxYBltH8dFl
	B9hM/h67/XIvFATdq+UXlO9bkn7MAxPZbLj1LbVXCBn3i0+c/HOIY+uX5giqL6jTGw==
X-Gm-Gg: ASbGncur7SCvV2AvgqVE9hX78hJIhYso6jgDcMrGlXm0JNW4eqinAq0WDTmLU56voxa
	+ObN3XKIX3Fqh2LZZZr434mH99VhfBGrZ5h3mFot9gveRMUUj5mr4kAkx5MaSXEyng62KXrN0CD
	piGEha0iFM9CBaRLxAB0qi+r3bB/mb65fhjoDkNciG3u7AFR7JcJPqDnpgSs0pzpp6XiESj1gtI
	8bSWg8WY77Nnd09m5JP6W7hknZbLiYQQlOuvicVYHugZKkhgoz/TLVakD4u+46M6BhR5WNm4Fht
	atYovyqC5JBImnOi0zbJENTim78r1UxvoThqkycbTXp/f749CQLrElzh9IFWDDF9Y+DoOB58KXZ
	L9yiR
X-Google-Smtp-Source: AGHT+IEGQxJJmcWYpWGuVmdUnkC75qaMfHhC2ZYRcVR0LV2sYNBvIZJpm3D00eRQqElG+uElS5rHKg==
X-Received: by 2002:a17:903:230d:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23601d03dddmr221983295ad.22.1749537283922;
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base version
Date: Tue, 10 Jun 2025 14:34:29 +0800
Message-ID: <20250610063431.2955757-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_233444_679344_2D29650F 
X-CRM114-Status: GOOD (  14.51  )
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

On MT8186 and MT8188 one of the NVMEM cells contains the GPU speed bin
value. In combination with the GPU OPP bindings, on these two platforms
there is an implied scheme of converting the cell value to what the GPU
OPP "opp-supported-hw" property matches. This does not apply to the base
mediatek,efuse hardware, nor does it apply to any of the other platforms
that do not have the GPU speed bin cell. The platform maintainer argues
that this makes the compatibles incompatible with the base
"mediatek,efuse" compatible, as shown in the link given.

Deprecate the MT8186/MT8188 + "mediatek,efuse" combination, and add
new entries with MT8186 being the base model and MT8188 falling back
to MT8186.

Link: https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/
Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
Cc: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 32b8c1eb4e80..4dc0d42df3e6 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,6 +24,21 @@ properties:
 
   compatible:
     oneOf:
+      - items:
+          - const: mediatek,mt8188-efuse
+          - const: mediatek,mt8186-efuse
+      - const: mediatek,mt8186-efuse
+
+      - items:
+          - enum:
+              - mediatek,mt8186-efuse
+              - mediatek,mt8188-efuse
+          - const: mediatek,efuse
+        deprecated: true
+        description: Some compatibles also imply a decoding scheme for the
+          "gpu-speedbin" cell, and thus are not backward compatible to the
+          generic "mediatek,efuse" compatible.
+
       - items:
           - enum:
               - mediatek,mt7622-efuse
@@ -33,8 +48,6 @@ properties:
               - mediatek,mt7988-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
-              - mediatek,mt8186-efuse
-              - mediatek,mt8188-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


