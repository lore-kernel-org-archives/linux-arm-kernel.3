Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC2AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=; b=Rb3eMgOZ9059cGWGFdvU0Rws6Q
	dbqheKAZ/La5H/L2YyIVq8sHuVL2qNq+iUu8JV8kM50PkusVGcsuNwxLls5Wlmkg4Xd3ydzYZdUXx
	x0vgjCBFfJT5K/1HdOaZE0xugRIeG0shLeO2sGKvFauJOahquLGQ7cOQC8F6vLFdNn6eVcsuvejCs
	C5sS75MOP+U8KWNFbW8EMPTa0GlhALi4HZq1i+WXNWlblwzCldE03EdfvK9ydeYzoeOOZD5DPp9X5
	02ohsP0T4BKwKLPERE/zZnWK7IrVtUflAQWRvlSKWEh+bcO8M9CF0+6a9Xs+fNIsuZHdMGaBBAHlN
	InqQ4jUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRz-00000002IyD-3fCL;
	Mon, 27 Jul 2026 09:16:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRw-00000002Iur-19RK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848761b5897so1375608b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143800; x=1785748600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=bz5736Yq5ct0WJDNWlVt2k9Jk5ja99M2KtK+i2bd2VsWoOULsJUr0wu21RuMxXRfpX
         fJYt7yvVd16iCheuRvxHJNO6RuU+d1hy7tBjFvP1wBoUx1ysvJDuSfcHmyJPkvJk76n3
         je9wKWRG9Pi/RFqJ8xtKKioW6dBRFwM+7ooQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143800; x=1785748600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=tI9/miEdrs9tIRwHWl0xvC1pLznkh2GUVqahy947k3MVPKu3Xuoy1Y5VLKpwvpHOKs
         lutYjEF07I2FA6f2nsTsH3xD1KRv0c/ak0GMbLByTRQbCUhk8bl84rSKzac/mBCA6xM9
         x2y+4CSbdYDJlvAIuTORL4nwTO445E+hWJmxMSXAn9CNMsQdamIKO2OHkxkac/ICgQPB
         39v5R8sSQo67OtztsqbAjNZcT1id1mFiak7Dge/D4YT6UrcBGEfdrEGVfIeUZQbLyeOA
         +Nz9SKyYJeB/lHsayRV9AKY0h8Bl9WLNKQ4AStmOySPfYn4++fIMl4TybEky4zCuv6Mx
         tgzw==
X-Forwarded-Encrypted: i=1; AHgh+RqfbwI0UOhwUoPt2LZqzVapfD6KxuuLk56WZh/O4AEszA4mpRbq1xJcG0qNxkyVdxv7qk+81NSt2dEKQrPaCvD9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/qFUXRDPsw6Nv1sRYQpEL4YNzR2gslyTGLrZLXoRHnGDO1bEM
	55GrEUTStupXDT9yRSL5PjSncfV38LCss0wxV25n0G27/yNuCR2PbUZmVuOdSbfCsA==
X-Gm-Gg: AR+sD13gKl8V2jxEY5T4SlKJT+r+5wGx5l73urujPUfqOPN3BMYI/Rt4cniLkKw4KQh
	EsEUIKAUCMzUpKwoFS57zJPOzNQ32IlwuRWoISItzJASbknrjdcDNfsa/zfyvEkr5TwVzOQkUFr
	nGzxcp9aJxuACxn9EPB3f5LZg0evCwFYOgjqWT8Aybvc/9f9pl7TUOVgWCvvmT3+LlUf/G6NBaL
	sktUMbv0ovEq3wOvCM89+yk6yET2aFIFHa9SgByRiF4U+7QvGxH5GqmIcjlTfhicYXEkPI6SVBr
	05a+ueufPGFfektPzrv4dnSO6g/CJa9XpUN8SH64P1sDEzeTAVoz/1EdCUBB8KUM8WzWykh7vId
	aOV7M0ucDKc48zBNgjdrVi1sAf4pBfojDP4uuIdgaLGdrUyUJ6cHUN6CgOEyWVDQ/+X/NqP1WmM
	m8za5UKN/14KBCIQK9pF/Rf0NGBnfSSIM7gAIPKqvMNIrQDYf94wEf8B/7dg==
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr6235745b3a.13.1785143799693;
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Mon, 27 Jul 2026 17:15:52 +0800
Message-ID: <20260727091555.1023910-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021640_317095_5EB34534 
X-CRM114-Status: GOOD (  10.09  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog


