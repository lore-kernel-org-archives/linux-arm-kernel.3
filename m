Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40848FEA831
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=; b=0G9tGn+pR3Ga0JZ0lrKhcnw7Cz
	rVgSo7C0gRQOBpxmzmDxPRU8Fj71wnxlpRy/+mLRQW3z1xSnruc213pem/FDvOZWa9vrXQRValLG0
	fBymTHxDyB1/L089iCvRH8/n7ZUJUk20+eGMzVnqBT4H7SpP72Htnjn1IDh80XfZwwIkrDbe0blys
	er/0RTXCZrgL6rQJsNfOONPfTtKEkornRPtNtTi+KuNIgDiqAaQbh2hzvXTjhcFhFcGHsJlint4we
	iVuMxev0KSC04poObjMwRDIRcAam890nPYdY4XBvxCzXpjkZtz6pKCtPspqd3MWEWRvw0eF8PvA3+
	LLnVYoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8S-00000002t7J-3wuu;
	Wed, 25 Mar 2026 07:58:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8N-00000002t3G-0pIv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b06d33e84cso13142315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425514; x=1775030314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=EV2Pmegup/WNwInGCXO8NsdWdRaJ0S+LWcLX7NzweXqj1OlTrRZPwGrTOkYjtno5c2
         o2/WEuqaI8h6T0h20elYz/eg3sWPNpJjaELAL7jLpnHFf7X+0f+hoqSa7ktmG2W02ryg
         ZmhCjKyLuR3lHD/Wjog12q1Z1d+h2CvekmVRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425514; x=1775030314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=emaCG1wNzaJaDnV3Z6ZmIV8rrSYs9VuRv9vsIy70yn4fgXEUX4iiKDhb4dNMNRlc6f
         bqHDpOPkRRc6k1Fr8R2UN3LQEPFm6BUKfHCP18sPN0GNi4ye+xHwj/pyILQlkvtzESME
         hJ/+gSVM89y/CwXBgZMCgvga78XRDdAk6GZrACRHtmyHRXh+K+We4idBWdGn7GP59oIp
         bFlY1F+w9/Fz6+0XM08xUJ41xLS3C10/dJisCWpkGT9aGuU9bNmeNelfd2Drk8xM3x15
         +9ZSmHC21EYACHVDbpESjtsccvfzZZ8z6hAB7oupC+Jsc9U+MSKzQpp8imW+TisSTmVM
         uieQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4mseRQUi4YQ2XaPw2VFpDCFP8xi5wUbyMC/nS8uY6le210fq7y1pU8hyTouHlK8bPrtPn9LHQ3wxexo97nsLF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq4nNJDJ5jZVisFUA6NS7PsF1eKZU1Um6a4XWiARvQVrWIKIhK
	ZYbtd/me50RwYdhbAN1VhkyvViQfVcx2hqcS097y+APKsTnxBXqL+EXR2mFP01thtw==
X-Gm-Gg: ATEYQzzdq46rfZ3oWYIRj3uAAp9pLl+k9iJVcAkyUe6/tCIk2wXOtdLH4Gon1VC5xbb
	ZBTHvVOyhLtCzNuupaEnysVUj0DCYQIEnCGudrVG02khEPBWjjXqhxe0DzXcX1CT/3J/72cIYNR
	8zWMMjuV68kUAvi+E4hLdpuWiyTiAzCzncLSpXzDznO8GzgCIWsGdmT3BkylEHsMUF8vWjKdKuG
	FkDZg6PHWXzN9CWYJn+L4als33n1yKQwuMQ9Qbwm2qi5A2I5qSQYY2qvz8XtZR+M2v6wygfCT17
	ItVCmC6irXzSsfcb7dzGuXbU3a5I9ZlbyN66XWkR78oNMuYtEb9G1tFMdqwiUFAoHJTdznJU9wQ
	i+MDZrzdyGJ/tmrXEqGgHi653gIVQXVxBB65K02WjmDl3hs3i0n45sM/hfoFqjsvr7wPocGYWcn
	YwvWaL7RDjVIpQb1/VYsH3orcKYAoXA2UryWEybufNZC2i+B7Nz5hLFYRRHOQ9ebCkZvTFNX41d
	Wo5JPY=
X-Received: by 2002:a17:903:904:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b0b0ab4cdbmr26299735ad.30.1774425514658;
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Wed, 25 Mar 2026 15:19:47 +0800
Message-ID: <20260325071951.544031-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005835_245842_C509DE53 
X-CRM114-Status: GOOD (  10.37  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Adapted to recent changes, now only adds SoC-specific compatible string
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..53131cd4cc2a 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.53.0.1018.g2bb0e51243-goog


