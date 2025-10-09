Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D907DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=; b=FVbauswcTlMxhsyudbrdPwR3/x
	Hgs1ebsfB7yVbtjtQ5HEWq8PJUhhiY9xb93UrL2+XlW9ZGZOaVHuxe9QM4Pro7LQXBhytTb3jHblz
	xACU3SwlJkND3rG8i+J4okOX2Wbo5kmoLYzrW0zLpZzNy13LJuV20086ntGBY6zcxqasDsFh93Ibk
	GIT3ECnWBJRdQxW3R+i85fs1WrL5Ic3wxwo7IOakc6q7qarXsm0DjlkZq/Z9ZCkASWIv6GDe0t698
	gfc3AhgJTIsBqlTsvtK2B48zdhSizXX/Izvh0PLfz3uGKdYKFgbSXHTHDZAr2XqsXCUR/TCqX/u6j
	Lg/VET4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHa-00000005YGC-31rR;
	Thu, 09 Oct 2025 08:45:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHX-00000005YEX-453E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:45:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-782bfd0a977so596388b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999551; x=1760604351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=hux7a+c1FAwoYHxoPIUIhmiWUyanIpS9KtofpGVVxHR4F0hzUXxSfzmoe/cKcbVDmr
         zsl6zB8yE4xJuCe9vajd7fjvdgjTK89sy65BpQlFf82k+UwOVEEnxoS+7Q4CemwypUF2
         zw+JCj+AU4dnulEiCKAh59N7boHDGMKd2fT/6N9NesarKf50nhbI4wRQ5VfJiJKhF701
         hqRCj1jfmFXQ4GOgh88yjObV5kWqYYLkiCLFqRkuJ2LqBX20mjMVpAr6bTSpLcbv8NFx
         pX79nDcxWJqckFqtiON8fubHPGTIoQlUD2H1wFkrof0gzHdl0FLZQqZ9FvYW94O7241d
         ubog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999551; x=1760604351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=WiwKii92VBRNS6Rgem9ap0kIQU1MG7YiAr75OCY/nM4h4wGdQYB6ELfJTSbvlZR4Rt
         X15RXSQY/iTHpzzsWjn1JOOrwmn2plw3xPBuXezemWIPBMrgb5zUogIKG5D/iKGVSr3f
         k95rjslSPh+wAcqb7UJalWwjztKJqAdKj9ro/MSJI3/eMpgwitbfnjXKqUa8qwCzRpvy
         vdV1lZNxKHev4aUPAfcEpdZhea6xKeoBvbuBBWakqBmrevlwjnhUVIousuvOgn6P0ak6
         NX2Ws6EK/maSpeYK6nW3iPfnP6vrJp/cvk94If5CAnS/pw1DG6DKv/xWEYrEieETmkbZ
         bkqg==
X-Forwarded-Encrypted: i=1; AJvYcCVVTDJyKNawMrmxnRQcTC+Y9PMEcculQ7cRUT6/g+PoHlenrJOQc2QHx2DXDp80HG7kbJSMVCr4oGRiuFfuROuc@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTA24uMkH6yh9XtZRxX/NbdP31RFuhbsef/ppeU2/3F3iyUcm
	KywxkJLi+k2Ikxy6OkFS0yDdXpXPfBdNJAQaWQBYRXn9Q8SZYB4M88Yc
X-Gm-Gg: ASbGnctyiByiW9LbxUXxIPQT3D9RksQe3pfQg/SluCFRLY08EoE1C1ILpQ0OOftLcaG
	2M8Zr87WBYoravqhb+naOgRLc/LU8slaoyYANIzMfREiPU+yitsvBjQF91G2dZEwJBH5cus1nSN
	fP4kduejrl4PoFnPpqDPEHQcNsRxHCaDrMQ8D3bmhjNTHlQ4f9a7883HdpQAtLpO6OW7Qe/ZxOY
	wVN4VlIIrotEvkgMMVGx/MeejigLf9KXMILRgXhJyfhsk6FTYsN3hWfjlfCf5oCIxrMIDbF2ffp
	jLOv91uRIf2twH+2a/a10hKjKbBc4TREAjsQw8KBu2f0AqaUAvKxVQEgjAIeLyQPOCmRCRLIT5+
	Q8KwR8apc+X1BndUfmZAyx9ESglXynp0XyQYRPwrZzLfsRkBR3D3Jw8zIJQ9Yx9kDENAXYCmDkV
	IC
X-Google-Smtp-Source: AGHT+IFsUYI+Uzlw6afQAv8v8QE4Z1XIw1leKiEaEKz3k8e65BDwjgKJwZ8Au7x32eU9NmkOPg5Kxg==
X-Received: by 2002:a05:6a00:3cce:b0:782:ec0f:d279 with SMTP id d2e1a72fcca58-79385ed579dmr7200904b3a.10.1759999551109;
        Thu, 09 Oct 2025 01:45:51 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e1bf7604sm2130924b3a.55.2025.10.09.01.45.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Oct 2025 01:45:50 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com,
	andrew@lunn.ch
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Thu,  9 Oct 2025 16:44:14 +0800
Message-ID: <20251009084416.45542-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009084416.45542-1-jjm2473@gmail.com>
References: <20251009084416.45542-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_014552_029611_3FE360EA 
X-CRM114-Status: UNSURE (   8.80  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0


