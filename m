Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFD4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=; b=k2RrN/ztQIdaFpIAax1rhc0fG0
	FwoLNEf/W+yRI9JZxF9eoBUcLY9oy8weF7p5rS0hP4B3cni9cPWr7KUOAeiLOhQKecwIYOjBlj89U
	kBclRudcXYIbsoyiOT2zWD+l2EMVX2yL1XRJK0eabySih7P2bj9+ljR1HIoWq8QxwN1eVosVhXomG
	rb9+vr3TteWxbojt2dNN/7K0A+HbdBcMprBNjuSwCaxtbMw2N1s119xO/cl9fr7qckNa1pYNadz+x
	A6W1J5l+EW96x56nZzO1fIKYnvNrH6MDmMOVlcdwVcnGhmMmuhLMcVAfvCNz7uh8IWJuA24u5tBte
	hZ7FNqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERVe-00000009Gej-2PjP;
	Mon, 12 May 2025 11:39:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERNP-00000009G0n-2pTa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:31:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30a93117e1bso5726768a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747049479; x=1747654279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=Scf9Jg5BIqsxc9/AXQS8IBS5Ya34SeOmAx4adbp17lyo/oKcSZsuMPQn7uORV6P9RR
         5cQ7vleGQeeWwGMqD99iK3qtB8wNI6Z1r0vP0gwbz5iX2LbnuEj0gn0AIN3vPfioAp7x
         +gPRZ+SBT0LG7ig+SiNa5nD8P2EWnTxtk5MQvseiqgU/eSb/2Lsk5dsFJg5EbeJQCsLC
         u63jX4tMeWScIHxjQVrhVMDfenZ+HoMDj0qFUOT28E5n7luX2wX4HvJGQdkTWR/pX7RQ
         R2pYwDcovVyoMnLB+DSpJtFP1cggcqbO2C2V0A92VbZvRFfaZSMzVYvCh3NDWClLlCUZ
         l52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747049479; x=1747654279;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=vkboGbKXsg8Gwaj27wd4wDkYqwe2dI+mUvmrw3rRHKVWtmse3RmdTJk2G+wY/BypKD
         Yj1fNe3JjPUGltus/lwqqXBQ1r3pGfpxf7sAtp4CijKTWOZwyxkomDLbW9O+2Wz5WUad
         uDe8MUuxEQYmZVB+eCma5yxs2Ra/OuznkJwvngICBoWKPKoxtQ6tTI7PUBwZPP7MQCyl
         xB/q0EDum3Caxfz+OIU4i67/QwoTgU5qfXU4jW7U10FUC+kLNNep2tHgbYUjcp8U5qmw
         f/8T5UgnP7xYG+8x+YysCl5jbkZtQ+QOHTMshhMT3IaL8/lp2fAZqZFX3beIO/V1/1l8
         a+tg==
X-Forwarded-Encrypted: i=1; AJvYcCUovt8rczJ0Q9KVXsrfjJyr0ujh0lcWshlAZb2AKL0BfEI0EoxZSssXhEplNW5DBY42+1JoHm1bvGM54N22lzt5@lists.infradead.org
X-Gm-Message-State: AOJu0YyFxA5Xp+6Z3SJ4tlgGARqBEU0pwF9+BbAGu8CQSSMPt8JykUV4
	qHGSa/MljS0S0iyNsAY/16L7tVYVMdTbRslFzKOzTa5r6CHzJJaiNa7QOQ==
X-Gm-Gg: ASbGnctDy7YM/r0OO6QIupW9KSZQD18UM4QJd9tjftul6bBXz6QtHI2j+jMYN449rqa
	Y+GrO4OAGrK9XiA27o4cTkUG13bOY40kvcbT4FonpS8orpdiWeyQ3vV7Fx5JdXnVE9VHOJG+vWT
	UjKwb0JgkjZW1PoSHS3uEyR9OsMW14iJQGMt1cpDGjYygUTZ7u+HV3Wi+jHJQjNMLu5/V+1DBno
	yeczgYRyi4bvCQ9NzFlNx89mzuOYa5r9wug3iOtdFbHEULbb0LcodOMXIri6nPhwnRHfW8jqD2Q
	IsZ2nuivceMUhWqFlXSSljPzT9kfYLYBZOCf+0mCKbFVfIwh/fFa0+GEJgf8ueFrgcSIGanT
X-Google-Smtp-Source: AGHT+IExxyFiytciXzSdjgPQ7rTz097bkIWdvh5taz9amgHJiu7hfwWP19TIewHg/quu33Cj0p6pYg==
X-Received: by 2002:a17:902:e747:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-22fc8afeec8mr186571865ad.1.1747049467733;
        Mon, 12 May 2025 04:31:07 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742ce2sm61074145ad.80.2025.05.12.04.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:31:07 -0700 (PDT)
Message-ID: <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
X-Google-Original-Message-ID: <20250512113026.264785-2-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Mon, 12 May 2025 19:30:26 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512113026.264785-1-LeoWang>
References: <20250512113026.264785-1-LeoWang>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_043119_711944_A751A3D3 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0


