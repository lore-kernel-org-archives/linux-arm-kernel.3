Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA3ECDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=; b=y2K0ACHb14f6aCWwiOPe6yv5UX
	PfrVKAi87sVTRc0/UQodgAD9EiRotrs+1Se5xKtNseb7r3Y/dJzoTcpWU98NetedkvSEB6AI9LZ+0
	6QCPJDSUPQrrgIuuhdsn75o7xvGkGxSHgaNGEaaKsZIujZwrS5rrQtQBD8r1R6QfD6LLZ7hug9Xt0
	6HUBsDU3F3E638G5Hme7bhLfbXe6+bhwZnSw4r8mHk6gqTBKxd9OcsWJnDw5nlQa4UhytpL8EidoN
	wsPgrUABhVDSMCni/CAHBurdSh07ojT/RzyIoPHMVHwedcw10fD2vaUi+XqYrSTh8rKzTTjvjYJEG
	LD4XIkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc837-00000006sJj-3XhF;
	Tue, 23 Jun 2026 20:48:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82z-00000006sG9-3CDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-462cdb88d01so251934f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247720; x=1782852520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=WGaVTvqcfbO/E8zDzgojLtwO4O7ztMEhabTXfRqgbutiF0n4xtbgzYrrdauT0AqIoU
         GRFD2bRH0z2Y6JwD7TMpssuWw20JAeYblMv04PVBvvDpjkDrYUendwZ0IxVI5BbbS7ln
         Fcs3dc9+qPqYPQsJlARoYyHfDMIWusoRTS9mUc9NKE60Tq4veb82rFMqKbJsXSRlDADr
         u5eVYp/SFQYI8kgSAktDB2nUcxuQ+x2xcNW484y/mBOsYm5ESBJEzbZ4fmbOBsUMDtw8
         X9fbO62gnZPRFSSdHrh4Dyw8imnlR8+/YnDFaHUBpq2VX/TXX3E+bOzTv/6QGYyCZmU2
         3+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247720; x=1782852520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=a29tjIixQxV1eawA/WDkOkCCK6Rn+DnG3dP7y3fB6r72OIRaEma69HPwvNninSipCg
         4vYBdqmAsdggB929yvNPf2A1L1at8wzsMvDgpew7a76cj15YEb3RhO+MXVT0Rl7HbsWb
         XfNwt537G2vR5dNkO/OD7hVncKZxFIPvZ2Vi7Q6E9tU3pH+Nwputn2uLhQ0rOF9PFOjH
         IUgfgbsLzobQeB+Tu7ls2lFv/6cHcJ8Z9qW1m6c7bBAU5GcxbdYgs393sqcjI3EA0wev
         j1K3v9XTw7mOsy3HxP5cHd3XGENK8Q6v5lbxWZcMXYfhAEmAhPlopld1Ecfzaibadrif
         bqQg==
X-Gm-Message-State: AOJu0YzLUMjGyZLO89r/xsD3dzXeIZjKe/cuNAkI+90J4KctcsSvq/vH
	BbzjLEus/5tgomxwr+0jsliBbbYonKOXi5Fos4qPspeYHTyKBcTXJFOdMqVakbzLSU4=
X-Gm-Gg: AfdE7cnGPWcd6Iv41v++X1fB84QoBFy4oqkFhozhKPez5dULbVuH4kS16T8ShMjaaqp
	aHOTXQDhGtnXEK2U59lDQ+dPUoF8j2HNFAUHR6Z8VFMmB+12ASvYfMK/vpKoUzI1K9RX0b8ZjVt
	cZ4kEdtutA7eWCE07yPlnemlMx8WtKGIh2A1xpN1Fd1N2LkoXmv5W2tWLbw1Ix61i+TPTeI7M5K
	dw/P5m2IVtxJD4kgRQIOOVaZHbi7c/BzyhUM1al8++oXoX62Ne4Mrll9JFYuyhP5QsnxuhQric4
	mAOcqf312Mgo0QIfX252uMf6kZ50wfFo3QsBdAf0LKfzch2V+Yfdv/RLVQV/4teHHEHD2k5G6Cc
	zuXlx6g5RRBPItWCKFogeRHiFytNkiguTevzrALPTtB8TsmcZ3SuYH8UTK68JYq7LQ/tHwOBIPB
	yiSKZZ1Q0UMSiSJ/jtvL41a+ahLBoRCnETvRCgcDZuTg==
X-Received: by 2002:a05:6000:401e:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-46a7ebdf3eemr8161239f8f.4.1782247719719;
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/6] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Tue, 23 Jun 2026 22:48:15 +0200
Message-ID: <20260623204824.691832-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134841_837177_9257D4C7 
X-CRM114-Status: GOOD (  10.75  )
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

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- no changes
v4:
- renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..82dd58b95f8a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie A133 HelperBoard
+        items:
+          - const: baijie,helperboard-a133
+          - const: baijie,helperboard-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0


