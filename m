Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=tu/NLVFqjnTxcqfp6P7QEWZjTb
	xZrPVWkGIpgWhCSXFpsj8OmtVs0noBjR21gBW+SC6jPOYN3WzAmJmRKpdLLw9YwM63MiyZNVcyWka
	ZtSmvtsxyvdbWGjhxHVieso0HdVi/D8Olbr1KZ1xHbVUGLZihof8TT2r08ntIl8iIiPCqSbBx3bex
	kfHZYOzesyS3ME+G3mh9FS846+BORypd/M1hYQqD6ypqtUsCHoa1zA8VgcrLVEoW9n7XiNMRri66n
	4u7JevpQRThPAJOoIB/hkiucP1XOCrb3zaGq520NY3rIN6PaA7CJatuEvmKVKXW9t81Ym3m/PVGnM
	Jqt7hRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPV0-0000000CKqn-07A9;
	Sat, 27 Jun 2026 09:38:54 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPUx-0000000CKpG-0CRP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 09:38:52 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so192208eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553130; x=1783157930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=Lipa4fxCTL/jIu8QxcR15vAlkludemcDCkx3n396d1B+l0qXAdr12rUOLEUYse430t
         6BjR4HVcGr2NDLlWOot9Eq7b0bsyX3R3gRiVkrOQUCWPjWGCVvjqVldX7quQui09rCqi
         kpa12lIVm8XVLOFiSFLn6pzAAeLvm4jEoKFNmi6K9APeKyA70+lG4vsNzg4Plji+xS8y
         beUQuJ9blSO+dMEx77o1WgSjGR1d99oTS/osfGBAr66FOnIDgtVzNoY9ctlbpdD1n1Iz
         7s4NCgq75OBRQR7Hrhe62v2abLtLMOXeQzwyBAHuFkMii9poPkpmsKeC+zv5AiY1rhY4
         gXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553130; x=1783157930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=LAywHGSCfnWyLKVPpDYVmhm7WI3V5BQ1Wk2lu2JkWEpnz7LNnEPXRtQVcWZj/IJ3e8
         KSdjnYvcTpF40mieve5jY9zabcnl7CiGj2Wc8mOdxYbxHYGmzaoGkBEAScBefb3z2nR7
         caxZYpWoSKwz0S18SXktUyTRbxuz1+cen176f2YoWJy8f6dwbeQoRzmw4mej91VfIdA3
         FkiAtxjbtXWOkXm9tXsWPeFGxOWmn/QEIYfIiCANR9492QQ6m4WnD1XlxC5LMZBPRexI
         xUc2KAW0Qle3Igwgrgj9wbnsBe0XgnW2w+zwYDC4OP4oo+MRDJToYHMr63Pb9Bx9Fpq0
         zRbw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk0ehDcZOzx0nJwZMf2PN7swI7kGsK8RgrIOjZ/BuE5Sv9mueJCv6gs+zX05Xrw6mq1plOs712TDyCPCnaynXZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyAfQiMrfmPOlzmfuyb/bKVSJNcCXcprXSNUJ6r33u7jQBW+HgO
	zCqCtme4IbkaFKgj2LlLB/7lMfsiAKJaakUMX4o0IYhLhrTsYQzPBdPT
X-Gm-Gg: AfdE7ckik/VzCKO3H3FxKJFpGzl3D4ZqSNx65+gprtU2Ya0FStcMumVLYze+ob60NbS
	RUn2ad/npFDd/g+GdXMC3VlKhmJ1BVG2uPYaNS3a1ESwEiZq3O8I+X5bb4hrmpbb6jQuWFu9X72
	tamhI/ADbTQ/h7yL3U1lsKyKg/rRhrHrFUgg92nUhWsXrVTVVi858CLABvhO/LI5zK3uuVZ+68t
	GQvzIJrZxkB1gFPjbt5yNxGA2Z0EkCywxxRR8KX18NorL4Hziv7IcNWmYPh2x4iQaaM2srr/UWr
	rhkrEdn5BMC04QF+kTsxt+kcKyeuuo1psXizatMiF03YfaeC7vjMF31hhdiSEsKWG3jh83yUg5p
	gKEsLEQQQhTPR5uTlIS4bKiak+k9clwxJMoVbMA92cWs5UfQQlyHEoOMiTtNMyqSOWvnaNnkMX4
	TqCR8p2IBw3OBOSAyrljM=
X-Received: by 2002:a05:7300:640f:b0:30c:6a50:3805 with SMTP id 5a478bee46e88-30c85009a5amr10727758eec.28.1782553130073;
        Sat, 27 Jun 2026 02:38:50 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cf86deed5sm4902948eec.1.2026.06.27.02.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:38:49 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: heiko@sntech.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Sat, 27 Jun 2026 15:08:29 +0530
Message-ID: <20260627093831.80495-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627093831.80495-1-hrushirajg23@gmail.com>
References: <20260627093831.80495-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_023851_091123_156DC8F3 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


