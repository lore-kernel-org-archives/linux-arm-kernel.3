Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6D1CCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=; b=4cSBLoCjnJau2bV0XakD9JiU8K
	7qfCy7CfBArJTbSWaqfZ95Xn9WbQThGcgaP4jlFMaQHIyNegnchQ3sQtfamS0ghYCu4xmgknxnFIe
	Y+nVsgeyWxK2rVXMe0vSPgf3ldjEz+K4Fdq3Pusd9Oci32I1o9T6HJnQhyYlV5C/H4jbiOfVtPC1s
	V1VJIoljUMtClPf1sGmYi4m+QyDYvqsGQ3oBvPcB+h2GlgmpND6b5P+pAk0CRpCKcC2dAXx6v4689
	yXRkp14Fm9zWajPhSmJyq7xMMuQEPXpeul7NkoKJoiQR1N+pq10Y/I5de9HxKkUdeUqbEJ5fkBLV7
	WEs+P+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD8-00000002cub-30EW;
	Fri, 16 Oct 2026 10:30:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD6-00000002cs4-31dZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=; b=lm6zF6GmnIIOKGfY/SHFiAsJqg
	JCs85fONeCnbpsIuLzqBCYWIVMrDhE/sB5ydW+6nrt/bADxm+DTrm3OSITgEag+NKaU8eUm+QRxd3
	2PgGfSshX/83ChLi8H3tnFEAPDoatx5Te7KhWt9SHg8PINtCkM3+zHB0xDMhaW3u5wff4IJY9NJQk
	mT9rlX93RcqmFMEiwlWw1wZNrk0YRMqh/okf8rSnFBrc9PSc0deziRjNLYeZjoeBsnWuMzhG5Vj9N
	N5XzZ39QrvtQDqTfuEaBeXXKR9Zz3DnLxuDa5CTY5eH1plk07pzeIDX+fgeF6N3VMl4eAdoNwgu/0
	YHW9OmHQ==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfCy-00000001NoC-0LOb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2a4e013a44so481801966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146638; x=1792751438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=C6V3ImT+wy3kHVPmiZqrccxnfjSmzC+TWILEdhAVS64SU2YIGt/PEt6L76ITJBvgI7
         TPye6k8zgD01QGC45ruiUCM2zIVIiQEuN+lwpBxWxG8SmdwtO9nn7Lvp+tJRl89A2pUi
         sNlkeccydxQobypXrFQ6s1cvEFWkcZxVjVO82cGpbyG4p5//iZ1NPzCGMqHi0vDyQa7k
         9+fq8Yx4PduumIdCw7gHPytFZOgKBzYEtZ+oOSRTk5hy+QRZKXc3AhHfPhRwT3HOAvoo
         DKo1pUxrIlqY6TvMJuOp+vp+u1ME0h+mNQBUUigsOfbsAtYFPEyF6tt4J9NIviR97DWR
         f/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146638; x=1792751438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=ub+XtfQaT1kZcZ7yWbOzc2I0t82xZLHW52ufa24KGq7kgD0u0hIlATKSAuiPxcmvaa
         qQyHcDk4mBCGLwi41G0ntkmor7z9EYeESDRpdNB0jdUequkOTnE1jD+GSppubbGdEyeR
         zdmSWI/J57pEgF/CTP5Lrb4usrBSxJfukiYlNQ4v/i3QyTILjqBCXwPhkuwFpqGcT5rU
         EBJeXULjHfqpCH0g5DPIpxcBR3TeY31VDPSlLHL5AwuaUk19cczDkanjaO9t0TfLJbgI
         kmDUr9n4jcwyl9LyEfxylmSvzRVOsnxF9h4tmZcI4M7vWjz9VDEDunDUOYa9fBq1O8og
         hKvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoe6LcdGNEt8+CNFHWPl55llMFC0SEMk1MrLsKM27f3xepOrMiFv+BHunZMJK3VacwR09wPWCr6VJlgnpJyNYk@lists.infradead.org
X-Gm-Message-State: AFq9FYIIs6qqw/93XVdFiuDRxxWzENc2GFwoGscapHL9jjWlWs0lS5FV
	Z1Xf3s1VmW+oL5mClGp5aW3rGm5ZmZ20mOMXfDT4+X+ty3HeZ5+Wu40G
X-Gm-Gg: AYBFou3M808NA71YOgmBpoKAinY00BnSbf6f51fbMGI5h2VNTUW8Ab0EzTkNqf+a2zb
	QIgjErGvf/FKZK5UGGtFYAuZl9S2HRYRGjX2p/hkuS3XnwZsI2hyZlrNIGxqoweiKBbQ7dF0Cb2
	0jnKwJ5rtSaYcnuw9AR7qaOIfN7ckyFx6Ua8eVIcMKx/9CWgsFirToeTBFBLP6iTYxsH5XrVDAD
	A/l1GOlgH8Xw/rtX01143rr5XHA2J0G0IczdwMfKu46TfMk4WKddb3w/otEUjrVZrw/md/Oa0Jc
	+LNF5HBzjQN5+UkNVj1bcTRPovZ/QHU0NOWnalNuL7rvLvUfpIdm/wDPZNchhyIB7Jsma2y8hKa
	9fUPyh7Cegdznvdv6x/JfHEFeagbnlBnGWpgQ+3XJQOJ0UgZoNBbhvhEbUpESY2TOAsTCcg9U4t
	WJd9kDEoGAGd2QvQa+18T8iFHJk004ZUUCJ801NKBWZJXw+NdEgjtK8XY7rUHpwBKdKi2bfDYym
	ImqWXpmxXXl
X-Received: by 2002:a17:907:9411:b0:c2e:3464:6e36 with SMTP id a640c23a62f3a-c31a9ff9da2mr1920745966b.41.1792146637456;
        Fri, 16 Oct 2026 03:30:37 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:37 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:34 +0500
Subject: [PATCH v2 2/5] dt-bindings: arm: rockchip: add Forlinx FET3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-2-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=1181;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pPsEz//R/5mbHWtInqzwe95ndZ3s89rfdZjnVNEV7dE=;
 b=4huMP0THyaTfkAsa/Z+xPB2qx+6GFhboW2FltactI3p9iSfU3lYO2xAjfuB9+FMcO7kUieeHH
 l2JDbETJyivDuimoNKHkJiyCmq2Wn3+4BD3xvC2ez4gNDyW3iWzZIMx
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113040_249341_468B6E3D 
X-CRM114-Status: GOOD (  10.22  )
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

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.56.0


