Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815CDC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 02:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sCHwCKyWw8sq72dejSTrSVAee4EJg7rmMPvIvja2B2Q=; b=CTYsiw0QRGsWtFSxZaPxQnOHbS
	1D0Ot+1TGoCSvoEtk1yk7uGAP1c5JTun/MJNuJGyFbHTEz9sv2lMmh/JhftnoCkLEpKqR3Sqn1Wnb
	JXC4F57K/sVitfya3Ib0BicvLP2NQHmIeJDB8f7YNFvrwg6VVeQmpTCPPz0zgqRMp8CUWEyum9pvA
	3teJqQRdHs3r5CH79qJuVFMpm/2khGYgdaCwm5HlPt8i7On8LYflS74cr/MLGytSmC/HuYD9ZxN4D
	nglY3l/6XKNxIHq+af0PLx98PQYBSn9hrnZSHL9sl9R/d8xURl9AF3/kRZr/5NZbIrCaiTqGEkKqE
	/kM9ZJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqicZ-0000000GClG-3pXY;
	Mon, 03 Aug 2026 02:41:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqicW-0000000GCkr-2Z2L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 02:41:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cedda2ce6fso23431005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724899; x=1786329699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCHwCKyWw8sq72dejSTrSVAee4EJg7rmMPvIvja2B2Q=;
        b=OJxUsoAJLqvORuRR59qn3rV0tZGGFxL+aEW1K93VE+oF+5hopmKR5qpyJSZSMyCnU6
         aurDM4iaGcKV3Mt5ef/bOR9/NS9NSHHNuJxEJN+sk7Ibk6SrZdOihEpJymvhoP3+Kaas
         q/iD91hxDMp2JLWwlVCYO9/uEIK1xSdyB3GDg2JGFkxOS9UaJHeAyYlSpmVi4wtip5TT
         ps8MAR/0DDp0LGR+7zEN4u8Z0jGm2ijWXprqr98f+s4gGInEAL2qhVfSW9HJSFCWR531
         9G7tZwXilYrQo7X0UlvUrJSgLdW9c7hgFf9lIZP4Z9OUOJvLPe4GCEjYNrjtFvd77Hld
         65GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724899; x=1786329699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCHwCKyWw8sq72dejSTrSVAee4EJg7rmMPvIvja2B2Q=;
        b=cbRF/OI3kucJF7cIg/kGi6B0bFCSN8i09LlroPPdg6XfhHLGCxGfsoPYXPaf6MRti1
         YBkD7ZDT5Go3cUhZ2Rwl4eqE5360ryWXHBZE4HYY+vhoiSdnIPcorUpojgJrjt7hCroc
         AOfSNbdk94a2NrdsdIK0R81O5cEuTNx80m8IK5TeM9l6+UjO2DgBmuS0XLcgShrk6hSU
         tUCrNCp0qCde5AkIz/PxFK8IQNupbNoqH9fbK+XcCrIN/yqRHRUDHRJ8HY7N4/1ipBsK
         QNhvCny1kJuTgBOMXvrOuixeDz29qYJrF8nnklfqCSShSyfgGKpoNl4ewDUMK1RqPz6U
         /hRg==
X-Gm-Message-State: AOJu0YwR3+XWQ3cnvHyth1nEQ+mmMQ0Yk+KvIIT6WHYWhT1PnzJAXyo2
	2W9g2l7TJdy/zRekRvpY6cbioQ4qGuvnV1uQKNLBgKAH04nn/rm+fjoP3kKAdA==
X-Gm-Gg: AR+sD10IN3wFRJtPhn3kJKcZ7Sp3NCa88mCSw5/dy75624YLD/fanKQlGFF8/znqtGk
	DDQvz2FJt/q+NtRQP0UNqH+dx7OxVQvWbrVnUq7ukDv5nqJouDtnOnbiUGFOOQTZrS6EVWIl0WV
	4xMsKGIDrpaDCOwViso6iF5GVoo9VRv6gOv/fUUKj12ccbiM1my6h/D0lC1CUXwNiup/VoH0w7z
	m7woTaz1tWsRv9JfmEXO8yxfT9Xdm7FeOaXHgNP9AIne6RR//1i6vAPbSQRBJQCGtCaCe19flCe
	t9QHcQmEody8LQdqge2U7DFHxo1fyL6UIrE5Ab3oDL/hgpbajmpqzSh6BbkhEOjiI3aXOwFCZGQ
	i1ilpc4YxTKbQd4luS0qcTTmLcCMrZtzaqyJYHUebYTwPc3R0ukm+Sv3irJd4cuZ4J39JGDo8Li
	n+KOAHXp29bDevVUPPfcObTVKlE6Kervs3t8CB5spLa7LX/Fl8DeZsVUg6B67jS8zfz4cohb0GK
	QliT47Z8VaJ0c0enBzxNclmxMM92IbPZEshFrlSlS9/yKBguBQ=
X-Received: by 2002:a17:903:252:b0:2cf:b6b5:9cce with SMTP id d9443c01a7336-2d0524cd574mr99284765ad.46.1785724899298;
        Sun, 02 Aug 2026 19:41:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5abaesm30827645ad.27.2026.08.02.19.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:41:38 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects
Date: Mon,  3 Aug 2026 10:40:48 +0800
Message-Id: <20260803024048.1641756-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_194140_671453_3BEC80A7 
X-CRM114-Status: GOOD (  10.04  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver currently supports only the controller's native
chip selects.

Disallow the cs-gpios property so that the binding matches the
functionality provided by the driver.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 377ccf4fb224..40965ec5163b 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -33,6 +33,8 @@ properties:
     maximum: 2
     default: 2
 
+  cs-gpios: false
+
 required:
   - compatible
   - reg
-- 
2.25.1


