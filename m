Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7751C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=; b=5FBN54ratAxayj15HjRYHRVT9b
	CwWJqTztqbLIREE12xOROsiJYdbcsGHNcdFGUZseC7ecf3slttR3zCH6I1qb4/+93TqWpnkCaC8A4
	PxXYCs3FTipH+rtSh3AgWP+HIE9t1At/LU5PwQ6wJDIQ1t9VaVwxVpkY5IgFWpJosp610AJOX1HQL
	6VQNuDuRzQe/4/OENHtWs0YQwTNda2OfWmw73majCo6rNAGuhBBfqQFMlIs1WynfnO84R8cg1XAEH
	K0q474LbaTSkIoptJEppmM++MmPcpabSXGltxj+cmTxW88hEpzD6MgSnDlkP8hcCLB3AQP967Agkm
	Uu9AGcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxM-00000004n2x-1qEy;
	Tue, 28 Jul 2026 09:18:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxH-00000004my6-2GUt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceaf8a1265so43659185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230310; x=1785835110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=lDHZ9mSt17rtL366xE3A429dZkHbDVd0Gen9DibDX0T+x2YKlLCfqgHgJH0szVZp9m
         rmdML/urWOAdpXTtwJqI2bF6p99e4Or9bj6XY/IL3G2Im7P18oDoW2ctuaVINluu9tEy
         Q1pNrjK8PUvtjckeAcNVyPX4CIVHWua1FTTHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230310; x=1785835110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=KCEicvpIfj5AK/MgLIgDDKotLe3HcRxVtGMbowQyGcSU6pG2lYQlgxICdd3mO22HfH
         OphTqklwy3nrbwWn4Y4NO0SAzlewvyIcwh3UJImu2TWDhUC7Tu0VYIXdGheQ+VvA9rSW
         KSl543oOFS+I6Rb2BOAEwTYf7GZ9hOOe4yx8gIbEgNpWp4zGP43acwhPCW3auf1ES1pC
         KTUFT0SO0I/EcjgVft5lXHiOZf67m7YctoDVTrJF79f4dp6AvhTFElSBjyaYnIuSTc5F
         Kg5PeJBBiKC9HEO+cn02YB/sB3Y4c09E8QKb5TjFcupkMNFIVzdXvND/ZE/XUrmppfBt
         7xNA==
X-Forwarded-Encrypted: i=1; AHgh+RoUasqZoCGrk+IAjpCMV0sqbWp3/jfcbC4qZFTUOrDbPgd513rQdRpMekca7k35Xur91DHxe7iL2FkXKmB8Dpr8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1O40lIfH5Em0OmZEjZehMLFK3ABoKcAe3SLlWhXRz+kgite96
	C2LJb/FzR4uKOeF81uT1fdRhTotWqNnDrwhC7uOkpVaHRgyaAvD5btQY2fA/2Tv96g==
X-Gm-Gg: AR+sD12tRsG585nKmP0VKhS5hpoeGythVApc0+e7y+R0Uegu6f093dXxmOHN40t066R
	TPZVMBPc/cQCJSnDERD/zGzEWPZQzo7BXkjM+M36kkB8D11XWD4v7qr2Qck8FTMLp8IDj7awnhd
	LYpXafM/7hvwkYxgii8ko92qzC2xeAnFWL+6Va8EhN1qG9FGRWDAC3kfmiD3BcN6i75jw9Ge8Ca
	6lA7b+GT4LI4DNel9Rwz7EVbHx/m+N/Ri5whHBNHrfPVfwWhvBd2Lf5RxRv4n/gtpzRjQKcZRjZ
	sQ7gfAkvj5nOIBJdB7zVG6zXKboy37PU4ZCKOrVQj/OBBmrc8U3nKzbKP3NleBYDc7dwgXntOFw
	lpdaFwfqDyPCkXljq2BtcJwKpnx7xkfbtAGyI6MzYDLlU8l/XE3xdHf4kQfu4ilfhziF6qMUGwL
	lzZmTtDTRvWO2QqgPaOKwLMPbZTu6qPpJwJM8HTW6NID5xRPLfzGn69IfapJVw2zX4Fe2h8jlY/
	Dh0H9W1KXi5XMJmEWaC42gpX6TdGqpWBpZ3rOiCqyjzmw==
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr18293065ad.7.1785230310643;
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Tue, 28 Jul 2026 17:18:01 +0800
Message-ID: <20260728091804.382753-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021831_607022_98FB32E3 
X-CRM114-Status: GOOD (  10.46  )
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


