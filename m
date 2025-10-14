Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12EBCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 05:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=; b=QwEFKtzXb3ZLMWKe8ztMTrAASH
	7h8vQlC5X5mk+eyVLcaH83u7Attpt8zRy1hb+0K9hUjks7LOZg+B+jVFUJdT2Hj8kjxZQbZewMQW/
	rrlSYE6qZMunrpyevroZpQC7pByrQFatYvqfK/ofRT9uJzgi5lCaWCb7rSiNCNBj4U4K3kvrpsfzQ
	S7opTlw8LlscO/sgZYbgU/yqC5YI0SS90xkw2otXZ+G2PftvxCOX5W3zhkfQxj8kSTAhl/BXqfv2S
	/V7ZO4PdzGUcrDNazXb2iryLqNgRaq3fD0K1e/PPAFQXYpYlbDZ8r4OcgLzPmjSlfj3sZ8WoL5jwe
	yLShjNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLh-0000000FB6R-1zPt;
	Tue, 14 Oct 2025 05:13:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLe-0000000FB3r-3D9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 05:13:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-781997d195aso3490279b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 22:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760418802; x=1761023602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=C/7NJUSG3rmYTlFlb6SqTqsIhJGX1XKNKITCNSIr7iad5rsF7y8Z1gPDqhHBeQN6GY
         a7LgUuZ8i1BBkPtuJ7VWXEJAI/s0YH8Kvgc4j/w6yyOjVw+nEFIsPp41s+oBT/Y1vl5r
         oXO3zfL/Ae4ch/3MD3M3P8q2yqdh7ScwF3zkPkFy+79d7TMy4q0/B+PQIsX0pDD5Vhyp
         qxACG9aR2gmccPYOh5bgP+cRWpkoAeknahXnyr2NN+vKFs64VseQNjaCSREBHkxJr2pS
         LpQA0q3f4vwG18hO05ODtjrWkyICaiREQHr0bjW1g8LK1n6ak0WO7L0DqDT/gAesxBHU
         Onpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418802; x=1761023602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=KNUvQ9enoVplFMyu3wO4xxmP70ImWtf7Pg0Nzn7mJlsKzVY92nvfk7tjvlcQhwsb87
         CKd7NYWFkKshYUt1vtGPuddpOBItb7HIKzXazPDhAkxiDFcV3HEihZUpLe/+4mZqwlaB
         z6TX5dR1Lud8gAutiHsIMicijnV4e+Ceyo80N1lUcaId55mRwpwFH77QDPLuiFvU38TX
         l6VFEKBNbSWuwPfDuBJ1sdi4zw3v2sZ+ffkVWyHkgE7WwOvjP4G+oXHzq1DVMTaD9iNq
         /Q7fXFNx9mvTHinK61kJJ6RuvgG9sNG77VKxZ7sZlgsPSiomDaErbKsQPKNNsz+anTsi
         6Kcg==
X-Forwarded-Encrypted: i=1; AJvYcCU2p8yRVCNfgNjBCuTD9T4/6OimSgXeirAGRhOeg5PPyQUD3+4BHBCntxpSZ2udKGOsmECScWshl5Cj8/+l8LYh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv3B5WQb53iK99rKXQ4e4Xw7kmMh17KZ1GG9vJ56nvhKA7B5SA
	fthZdGrJswCLd8vxmhiPTmGjJdazgiPKcfgT2XgBv0s+mB2mFG51VPPn
X-Gm-Gg: ASbGnctpCjQQwkMD5GOuybVfuS5BiaW0Fxznjt6Bjzvf7H8c+/Q8fehZo/abrqij+tU
	OHu6ORg/6oC5Mga/WXXdaznM7AUXNXXFDD5xquYtltqhApnzpIK1GHT10AGr8i6FkKe+Ps0iJ/s
	yqLfTWiDyF1lNcVDK/d+HKAoefC9uPxq/jYLtgkzIHFzEo26MVop2PkCBG5/D27DVmiBBemEHV2
	qw2+rqv4e2Bexd1Do0WN8t0loCmc1Ym9/RBZZUc1ahiRMzehbqQsL7JTbdxitfFwuIVV0pTIXCo
	7ReAMVTbrsqUOhmg+k1d7D/AAsEv3xPyXb2mQ6nz/vQ2KaLfhfjLdlQBQKyFG2mGKcQRKdxppy2
	Ai9Ap5xQCsxXAePA8VeDU5iLVLQj4DHc660bCJAW50V31GsNBMQLa00VcUKyGEKBf9gzfZ0zyvg
	uzeJc4x6F9Vhw=
X-Google-Smtp-Source: AGHT+IFdGEyJI+FP+jgDwvUb1DBtqjAdgYlnNf0O+uLevyNOD0Ahuubh0DHStrxuGa26n0WttHzXtw==
X-Received: by 2002:a05:6a20:12d6:b0:2e4:9004:52fb with SMTP id adf61e73a8af0-32da813449fmr28943523637.4.1760418801797;
        Mon, 13 Oct 2025 22:13:21 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddce4b6sm10902353a12.13.2025.10.13.22.13.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 22:13:21 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Tue, 14 Oct 2025 13:12:25 +0800
Message-ID: <20251014051226.64255-3-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014051226.64255-1-jjm2473@gmail.com>
References: <20251014051226.64255-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_221322_803210_77DABAF4 
X-CRM114-Status: UNSURE (   9.18  )
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

LinkEase EasePi R1 is a high-performance mini router based on RK3568.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..ec2271cfb7e1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -726,6 +726,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LinkEase EasePi R1
+        items:
+          - const: linkease,easepi-r1
+          - const: rockchip,rk3568
+
       - description: Luckfox Core3576 Module based boards
         items:
           - enum:
-- 
2.51.0


