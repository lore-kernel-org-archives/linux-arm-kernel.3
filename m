Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2848C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=; b=cBoXIE2VOI/uyCr/1Py9qNlTRf
	p7+kGk7adQwYWUH5IC3jtasd7fCdmf5z72x5/ap/4Ko8DM5l1g55RgwErD2be49N/Q0+C+BYHIYY4
	/0XxNZt0NdP3BeetUCcv8sXDvOlOSOo2Pm38cNplWPryaYhDFX4yWrexobvwmZUk5X22tqCnsik9h
	9xu6Ep+LyjBfY1lFP43fnP3y08RKUrJ7rpQ0Ghp3rpU6BqYLGr02ciwHTPgQxhMQ/YvvJ0xwwc21K
	JmXmNeXHe6aRsfi3a931qywlobSUKVrcPOENllaFC98xONWyoYK0k/5inohveCJQ+ETFb+BD6jLie
	eAzeXyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzOJ-0000000H48a-3Mop;
	Sat, 08 Mar 2025 18:59:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz18-0000000H0N4-2lwE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abf42913e95so422712866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458921; x=1742063721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=Tf2WzGXC081WJiZAjxrKtp/P4AI3sp8//dGMXlGpZBz71nkIWZ1NR4VmwxQShGwje+
         THx6h3fi968kHG4IUIjbOCGrUlzVD1tx9wu5RKK6UH+cQ5KxdyX5g09MQdcy0seb5GiT
         E+RJURMU7CTPT4KVvdyhdluJWc5pJIbQuB9xtUMMDEtyiYWWcMqFziK3tEWaTXAowmVm
         bKNMXSAnCiox3zQMBuRC8RUFFp7Cf5zmPLlbM/SU7yJJCZs1ygJfOgKKogUuficESN/W
         y8nx+3CLiGE3yWDracUm15Ciq6Jcc71gGMWoeDPekGKcOTjHKbTZRHwAk1JuzIbdcMdW
         pBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458921; x=1742063721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=U2AZNhUNsBz4v7yfs3OQ/Nil28Cn+Vph8E8ELOizdWKDgGBV9+8eO5PwOdZ++vRtLF
         aA9n2cCTcMNpiTgtjpEAXJOmHQfyJ4q8bK6Tcxibf5Bt5Fy07B9FYm5/pf8CVFU7uyR2
         MOQ9/JqCl9GAr3bfWZRac5JMH9dCzk8DM2Y1N1TeC9rmwF5Owd0Q8bLXD/vXK+p/ebvv
         ofp0eGV5prZtodQnyWWvwJ4M3kOFNtONXmTe7sa3QmGJ2cDZygN7DngHBF9X1EHOMFfF
         gSmRcYZ4I+nCYDhpwLmkdHrNCG23z9vcvSnUHfFkbK0XUCF1g0QRhDCAzAuX0Xk46VPi
         5fjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVorgPyQoDBKHyDGNhLNLi++TT9AaeaaBM9irgf8ORvF0IY6XNwzZPjrirT1SmFty+OW0yVa70CL6+sW8fJdqhF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo64euFWcogX/VkFR83bkbFTEv582ogRwz91yw4LsMOXuodF53
	qQNl0ARL29MLEqM6/fUnwswcOZ48Gqr3DJtftAHAAJJxiViV4/lZ
X-Gm-Gg: ASbGncv0mXr27jw2pti2+Mw2ZymYU80IpK2BaRW++MbqEnhMVTFIpM+2xmuj52468rH
	G5dYufitA4qfh/ISxq+tIcbAIClNRziXpLBOdvwjOMhJyQik2yEKyJECADm1CYn7PlyGMxVpRBk
	6x6GjxBfn9GhCgnjZ5WZMZSwPraCUCawQLQU9v9/41a26AWphzmrk7osWXs5gKWxJk/YOzCzZyz
	c4nx81tK4B5HzRSgqzf114B2pXQMosVFDQ0bzrokBN2TbJR+gtOFvR480ZtyvIRVyWli7fupemR
	YBylsbddZBSFYR4GcPyUoLVQxoAHuKluISa0kqWIcyxxuG4dlEHAmw/dTA==
X-Google-Smtp-Source: AGHT+IFeoNQFzdeGQAk7Bpgr0BvM/R3lxDF9QM900UyUvrHBnqHPA0/fWbTTYKQNUdbDVHoVSrFw+g==
X-Received: by 2002:a17:907:3f2a:b0:abf:77f3:d1d8 with SMTP id a640c23a62f3a-ac252a9e1c5mr850948766b.19.1741458921149;
        Sat, 08 Mar 2025 10:35:21 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:20 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 14/24] dt-bindings: media: i2c: max96714: add support for MAX96792A
Date: Sat,  8 Mar 2025 20:33:43 +0200
Message-ID: <20250308183410.3013996-15-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103522_701146_29CD6E60 
X-CRM114-Status: GOOD (  12.57  )
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

MAX96792A is a newer variant of the MAX96716A, which supports GMSL3
links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d4055ecf673f..a392da39c154 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -26,6 +26,7 @@ description:
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
   MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
+  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - const: maxim,max9296a
       - const: maxim,max96714f
       - const: maxim,max96716a
+      - const: maxim,max96792a
       - items:
           - enum:
               - maxim,max96714
@@ -120,6 +122,7 @@ allOf:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96792a
     then:
       allOf:
         - $ref: /schemas/i2c/i2c-atr.yaml#
@@ -163,6 +166,7 @@ allOf:
             enum:
               - maxim,max9296a
               - maxim,max96716a
+              - maxim,max96792a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1


