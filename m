Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=; b=l+Aqw0JXwmhzu3SLsHIvWAkMjp
	gM+c4yxOjc7HsvUbVZPVh07gPzWkQ89tmUwvCCjC90xZFCAG1XMuM3dCkI2Iy+GdecE4AaRnW53y0
	yxKPIGmp/xOpmGD63pF9VaJz1Lk3yDI5Hc3s0DqrHuUK6XnvdSB/q11rwEh8v/hwxg1ED6F2TSTRY
	gEoTKYKpfromUZ/pM919pf8HYqD8tm/QSiprBzGg5+XP9FRjA0lLlcwYrs9BUzB1lLthQ55esaC08
	JCgJWNXDahtJfwE/F/DpchBTxJRfD7fi2FF6u6W9wGir/ci1i2ru1pLiApKX0cu4PhPieel00Qu3u
	jp69DsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnMh-0000000D0Og-1nRJ;
	Fri, 18 Jul 2025 15:51:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxl-0000000Cvq8-2Ais
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45629703011so15937585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852328; x=1753457128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=ROGa/KXYaRHxrrwaXyH8g1UpH+jxY0uJAS46T4Da3EywL3a6HcWVdOhfpQLw0r3JNQ
         2xvfp0KdaD0upIuvgCoHoXqvvCm5lLtupq9cjSssfca0OLmGErlNsbxvFGOOTJw/pnI5
         vp/6ZZyUyCRbyDvmIpQxqmgJjZSzGj7wFFb9/QQahb5Hbbc6UrAGbeOCVYHRFafSQuso
         m3i9sLhQ1TDhGdFVwXvr1SrannbRwZRfrFUX59BeV36rNmeiRbyI08h9xJ7SgJ6T4dM8
         1US9klKJtaSY8UF+H7epfiQhs3MCVpVTH1OEfff5fIYq7FhVL2D7SYkTGyK0oMRZziwJ
         NJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852328; x=1753457128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=UTy5PBLRQ0imUL2nYfRp+q7j/hkK41XgDVPcD3p3nNLL8OWCX2gdsGgHZvHZViTFFB
         ctYR9eHDFLRij9EiFhlodjMv8nXp9aYzjSENBwVjirtdMyZC4u3D7VmZ9/QFcNBSwON5
         pfgvvjLZRPRIRKEt5c48hj3AJSQIbkuZ4PXlOoR7gNBigfRYCFv583duevHdF97oNk7Z
         ozmlGk91LnDP1BZFs2RNyYiM6uMBiNjhdfFY7HWVwd47sQQhLGsmWu9XC4HGE5HdYZ+E
         37MkVLMV8CYu/UwcSef6JbTL7aPZs3ry1gUNBXdAlggOgZckZre6WZz+TpJraLLlx3TC
         ouXw==
X-Forwarded-Encrypted: i=1; AJvYcCVEk58uNZqSCCwngKLPxv62moL0R5RjTbY5EU8pN1o9MLq5wl+2LgV87evvXPoXWl6/laV8b2iraDIORjRV9TKp@lists.infradead.org
X-Gm-Message-State: AOJu0YzfUFmgL7Wr2LrHW9PYFqepIyyuP70CcepHd3kncHSd1T+HYyh2
	wDgfukALktW/B5upmN9/DeQgxjmHWbllbA9QnWls/16OFG0VKIaqHwer
X-Gm-Gg: ASbGncti5aHnyaaKuTXGFCPTFv/pCj1W/CMCWpVSeLh4YCHorz17QjC5/OeSVNr6WBY
	S3bnhS2b0jIG6LDbptDz5p6vTcX3JRzwTLZS8E5WNkmwqKuJeVwMcvpmrcOW0y70Ir98qcxPtua
	Jd+NKkvsPi0QQdC1shMMGfWrcaryLaK8BqjmVvK5lc58d5krAQZRpWdf442cws0jiAVNf2hsNvg
	pIdwceNOSZoRo9NMpf/lDSexmifrilEzXczEvn/b1IavIex+72mwwGQSy79S41hNf9NrxAn7tU1
	n1/CQUBTrJWrL2CuC+fCX3mYNJVnZffg3WCAGS0QACT/qYTAZt6OxWnCLvngbPA8NWDNtVYASx6
	itP06E64dHu8Ss03Q61ircCy+5AD+WUF0sPY=
X-Google-Smtp-Source: AGHT+IHMaZ6xEx793pS+VQMOqZMScf0rd6McvymX91J9dR2zouCdkLclsbNOoq48C7pVJzsxrGBGSw==
X-Received: by 2002:a05:6000:288f:b0:3b6:489:b7e5 with SMTP id ffacd0b85a97d-3b60ddc5a47mr8778911f8f.49.1752852327784;
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:43 +0300
Message-ID: <20250718152500.2656391-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082529_548445_005CA09E 
X-CRM114-Status: GOOD (  12.70  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd3..efdece2b33b96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index e973b0a985815..3117345d0619c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14747,6 +14747,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.1


