Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE2ECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=; b=IY3Z8iT6NmtbCrHKHOm+6vijj2
	U/f+USMsMloIgK6lz2RNunAg4AvbSjopmYsPi2187Vqto80A5N2cyBd/TcVDZrKfoAHFTrFXGK8/8
	0w/uAlIgSHCuXXDbcjlF8nFQ0Kl8VdCgMaTtPqssEwWllYMnzRGFIVzBe88r71iHUr8ifjEmDN18L
	IB5cnTkVb9vFyiTLHmOoLQrM6TsZGZgEr9UAo+9KqzvodO7xROR7/ZX72ZO3kY54oz2I3FeP8VitL
	LFG0qCYTF4J6lL/lMmz+xtgGZFG9Z8669ZNa2EoDDIr6WebSYCt3M5B2wkq8CaHR9CO7E1DvbU7ku
	H4A8qaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SJ-0000000BXgQ-1kpk;
	Fri, 12 Jun 2026 20:26:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SH-0000000BXfd-0Y97
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 20:26:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so14368105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295975; x=1781900775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=X5LpsPRvVNGtGYdocyOowNSNdQCEyYvPLwc6dyATM3SCELw454XeJ5sMukiO/AQvfJ
         4UDdRoDxDthBx/4MdkN9vJhR/2BxtQxC2kozkJMVVFsobZjoQHW0A8sPTv4T/ygD6LRi
         4/u/TB1lLv7gwBjWKsgAq86jDwqmasc7sMRWOd8D5FTgOl74vvoEGGzIT7WP+nTdGLdS
         6p12dBm5h9MCaYNc+Wa0guptP7ui646+18ACfRzbnJolkh1i+CviGJXWcRHrWvCzuS6Z
         ozMPzJIXXB/Jc7nWBgJl4lUw3yT0wPmmPlBk8lS3Ln4hcxKBk6ZFSNBwA0LQ3VbbkI9L
         DIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295975; x=1781900775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=VtFlTqGQHvzgjVdQw1HDVQ4AzUJuBSJmdZklhYPKsIkd8Zpk48NN7knrRAQ1Ov9fwD
         c7e7S5Ccd63EoF9HdIHLZkrmQU40QuXWbN+3u/EHEe/fIsekh5zJDq+00QTann3I07uD
         Oh96/9y+RdySot2QG3WDDGc1yi0zeG57IeLIL1+NALUxg5Qh3gCo8gOaNfsxlC62BA8i
         X6IJMlbrYzXMltdWrdmTy40NGRBoPis+hzOmkE5LS7Ktg9IPhAQCLjeWV/tKC7QX/YFD
         RLr7Ifv0VqmNGe6/3aM7n5iNRQx01jj8K2CI6reLRoqwHhPaIXU7L0ucToO59ieiI3zV
         Ovnw==
X-Forwarded-Encrypted: i=1; AFNElJ9W4scubQaPcgUKjP1fOpE209ZY4Zx5gFnKqe+8xZbJvZX/auDrnhdTT1DbxWxnu+NGTNC+EZ/vLG2zbWwS7pxC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4LJkqOgCtuDmJG+H4NwIdrkzFX1Ix0ifpnDiSBo/nDTZ9m/0d
	RNdy47XW0cBNFk7Wf+GBmV0dyVxyvfftPJKkzDuNH5NPQEg7PNbA8L4Z
X-Gm-Gg: Acq92OEJPu7DCDXPHuEjU1uxm8G9PwBJF0zBxlJnSofJaSxKQ6LrWwaVgKC4i8IWe8H
	xm020xHSDUZVk9C69mcJ4uU+H1pJWFuj2Bh6sIzDguu/rLozYCYN6LjLFAN+nOmdx5y0ueYm2Zl
	FJSBVZWA49twLLH94dm3ii5LxdP7wdsBhmmAyjlkW7d7z54gRM9mW9hB/EL7Y+VGJYtFXTp2fSA
	jXegNsIKmrjGryZMfYO1lGS1Qw9Gy/KEkM8439/x0wxhSWeEp5cD2vOnTPI0CHy/ryl71PejgRH
	WCnu6IYym0Xx1HgJJwUJQPZ5jdX7WPDENl0mLZTVvZrOGxrGo3E+x+Rt+SWd+D6nxBv3g0BwCGY
	4nvyUfhGR4WGbAWZ8qdsRD4MGBuP6Hu35r+JxiAR39vgDougd+65JC0ERfa0Nzex5w3SV5Y8RkQ
	qb1rVWbCFTgMK0s/58
X-Received: by 2002:a7b:c7d2:0:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-490ec521e1cmr40772195e9.34.1781295974844;
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Fri, 12 Jun 2026 22:04:06 +0200
Message-ID: <20260612200717.361018-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132617_186580_D4ECE36C 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the initial bindings for the MT6392 PMIC and its RTC device.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..e39e81aa9924 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
-- 
2.43.0


