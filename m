Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1584DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=; b=zDJBnkvUqkdJ05umj4AOt2kMCz
	Del9zSjkTbGHgYd3ZMkoFn1nUb5Er2GjyKtPEzekki1GBE7qfnpRtNuyDdCtU5MST30ogk94YNaE+
	5lXilzr2BabNQcNk/vKEbXr3tJLS6z83R7HcChPeiLu0of46jt0Bqnnv4Us3Tla02of9Pw2Qo0XNl
	cj4ojCrsYQWkUs9J7+vB06RqN4oYHMwC8UT2otvC32wW1TVqkVgjB+8N+6c4vNNaXwnFR/5LoWSy8
	55OlB6oP+IGcaKm0gch+AcbvmUdv2gjxb/Hplm8d1f1dT/9WpN+dpBw9fgeDWvMFvE3TyD0VmblKS
	FyVOsp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIPF-0000000GriE-2aTZ;
	Thu, 16 Jul 2026 09:29:25 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIPD-0000000GrgY-138g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:29:24 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-80c5cb9a888so56506827b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194162; x=1784798962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=HVEDh9pI8t2mklM758aQPAF40UScAvApVT9QoXYsAPMVyiAZNwBpISFMqaBhQ8wDuR
         Ps9+nQ+fUdtEZu5Xsg7XNAi2oomMJEPkQ4x9xOo3IYx3hKCzljaSjFql29BNMIeq67dt
         G1rBo4unZ1zEAVLuEWbmaURfPR26w9HlTdsH0uZ7kv41i5qr0eoLlFIWHBLylb2W5rJp
         snSHLCoKlGeClty1AZjleTlxOrlFzFJwljkfhLRTdVXhWfKEdEQj69sVAmCiubP+9u6J
         D9bq/s0itjONbKHf77/o17VSPGnOMuc9I4M4kkSBnBlLtHatLOFLV3Um0eo7NpNtSdGy
         q2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194162; x=1784798962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=cIcuhFQ02Gv1r/03TUkvWzAFSao8oZO7Ioe/HZLiGkx6t8zYxkxLmiKGiv3lbVg53m
         GwYOQyVelJFZpcZytQ8hjJic+itPKc3nXvayMI6f4qEIdGCCe9LgP2v/Z+yu4wW8E3yY
         60jk8dY/ITADSqqwU/6rhQ5AXFUROwFhYrR/LbDLLafjOF4UUfpg1nozf2AVkwYNClDi
         Ii5DalzEnuwMh+TW4PWDVymKPAFYr84xF3HUdPVNYlsAgwL1J0EKALnPrm506dL6alcm
         nNUUHxYZS1WVqvojzRyb5a7KB0y1c9mvZPxHvAeUVlbhyZkx2y19Xll+nMqbfihN+dy8
         mcBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHPNoi28KhGtj4xUwrtlOzfjVutwBP9jGMA653tAlvf9vqcrbwqJP+hOHfhmgDhU7Keqe3+HrPHJukPx2d2xZR@lists.infradead.org
X-Gm-Message-State: AOJu0YwHRUnkc46qvhSE9K8AmQuWzWN5urnXanhYp1l3rvSm/Ic2B9zs
	XruS1CZO1xHxseqOICTq/uGjhIgXwm1jdpwFT55wLW8sfhDzuB7hklp4
X-Gm-Gg: AfdE7cnJKqQN1fUPOvq5SH8RHATxhsr+X2e0vNlYy2Qgc0urbMYcjwk1eK/cc8fucGc
	uZuHnbgH7M6Cy+28l4hCAZ+HEAnnQIgLZDUci3tEopku7Nnl+sw+2Ill5A4tEfGEIn9rKRDc/+E
	x+T+quwG7iXDNNnBBq7c7K5HhPlB7dNgMQngBH2TQwU6lf4kmaewPNcDp9UdrvxO4rjFOQz2KTK
	VXBa0zslWIx3o1q5ERGNwxmI+jAmbC4GcdovQcyjUB489ywpSxTfFmNpl6EfBMe+/xYDo3L7hy8
	ofQD4BwF5PbsC2/qNk3+mzAI3z2vcdEzukAakcRfiuMB3lsFlU/3SAwhTGu5VbItbYEgpY9I3cq
	ACCfsoKVG1zimXnuHfgS5XlN9KKPoUkSMY+gDbnukna0yJeU3I6l4awQNM78AP/s16k3u6KRxn0
	hZxpHIvhzXdw==
X-Received: by 2002:a05:690c:a87:b0:81e:528d:3625 with SMTP id 00721157ae682-81ebfd85389mr75472897b3.24.1784194162195;
        Thu, 16 Jul 2026 02:29:22 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm130241807b3.13.2026.07.16.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:29:21 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Thu, 16 Jul 2026 14:58:58 +0530
Message-ID: <20260716092859.512306-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716092859.512306-1-hrushirajg23@gmail.com>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022923_293024_D108310D 
X-CRM114-Status: UNSURE (   9.68  )
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

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


