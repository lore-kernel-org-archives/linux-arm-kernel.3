Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCECEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMKOxO+QQQnpK/gqTmp5of8X6K9CuNI4LFknE1hYc2M=; b=K7UyG8uXixTlhtenuxKurq342+
	I3nlEApt5IzKbmo8a+DTka/dX0UrdeFueIjL42X27sR64K9RrMxL4jRvxkqazg6uCtrLCSFhvZDAU
	1K1Av8pKhq27qGMgVUn4LOsGEsU4EaqezHn8rUFqM6TuAmc6GdgZXACDU0pppdHPMPRG0ZwIXqam6
	+vR1QwU3E48y7nx1fHO81tM43NLVz15RaAv9+QkWa7PWecTblfC0NsPtVW2Bza3V3OhxNmkDGgfom
	SbPaiXG5JXH6GbIzYauJEyDOiIHaS3vUxXXlbjwGkZWBjvhI9qlG+yk8ywd0MnSdx/leRIcHZtGSN
	ZT2JA65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMfLp-00000007KiB-42ry;
	Sun, 15 Dec 2024 03:31:26 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMfHy-00000007K8B-38Ki;
	Sun, 15 Dec 2024 03:27:28 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso172028539f.3;
        Sat, 14 Dec 2024 19:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734233246; x=1734838046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMKOxO+QQQnpK/gqTmp5of8X6K9CuNI4LFknE1hYc2M=;
        b=T/ZdLLrT4+0/n1lDPbE5ToJ9oeJXMG/2CN8Fn3HQRrEAbZ9Hn4dUjp9ojIMfJjQm8j
         X26pB/RGZ4JoS2ToXLcMRvlCmZii2T5RgpwINj94wehSfWBkZLnZlzvTj3JJnMGGyr6b
         9jmRz5Smt63o2pSeeDr3DYNPlsmWt9ozK89XHh5n8iXrrWUKYGGydbvQaKq5iS1KSlBC
         +oQwAuMO0LX/7B9eT5vhgomB7Sf25kwuKlqE3CsTP2pxQe9oKeGFlxa4F7RxkTfO/W9v
         T0qhB8u6RnYx5VopwdEsuu3c8bT1GGL/n0YS8qjPM+MIhu485lgSbaefza9qoe56Qu7f
         9grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734233246; x=1734838046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMKOxO+QQQnpK/gqTmp5of8X6K9CuNI4LFknE1hYc2M=;
        b=hLECFoizaWNcCaWrf5P7ReTd8fdPzP+GE3bPZfP0zTpHZMCxL5NLvyE85zy6oWbai1
         aavbqRdpgpYj+t+8w7vHNE7bAmTY50lJHmXFYPKrbb8BoLhlgigs2sObfOHk5wmlVYxd
         rk1fjci75rIi8Ymi1f64eZGzEnLXi2sa0yfEWiHpP40Ga15Wkz/8iLwR+b1V3P3d2SWs
         cTzYaMx8bqTs5FNFqP6wGOY5xEhV0j1NeioLOLGq07ho3pxp2ZYtogxhtGHRweLiiSON
         TIpzxjkdPvbXAG0yNjtyQZugYC80VwR1/hvFi3TTu6fuZ2jAZK6bv+41nxh9o/xrmlX9
         KRng==
X-Forwarded-Encrypted: i=1; AJvYcCUjlPybPIJwJDjb1c0q1qD3ZzDhFvNAURotPsF+BeZQnGZMaIm0s9Qif6RK7yOzS5cH18DcrDqQETwcHC1Ql1s=@lists.infradead.org, AJvYcCWdq45BUKRqKcCQauu4SRkgoxUSbRaYHMphbXxaYDso3qcC5LdDtLrCpgwteAug0K7uKr/xQJ3Q1mIw8IlysCY2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0TvngFuMh9Wmv5nKnySbwtkmPMtrxBPWJ9oLCD+AP3xaYQbpU
	ZpEv8g838Zf3eguQf9kxL8lTEEPmfmmKq7Rxu+w/Gx2fWUgoEee6
X-Gm-Gg: ASbGncvuYxy1wCkx+2R/6s71C+0LFJfsew6U80vcIZCeeseGxNweAZ0KGSTuQ0roOlb
	aPZtGO39szSJBK+8T3pFvjZo87abq2fhU38vaAFYCTRs4akNLtS23BmYIN4pT7UvLs1TV7tC2yk
	MvLPUX1vW6ZxU0EDEiS5KzTMunldfOCLZh5XFQKQ9F4x0UI9+99Q8MMLnhVdh2TVjLK4StZ1MTy
	Z5+1P7QvUNPptICLpvi1hiLH3ksJG0Nge3lmAk8Zf1EMwLQz15qMIArAUF6VYcquPDzDBTU7ffx
	odtmcIeDLP0gIMpGLzsI4ZqfYac=
X-Google-Smtp-Source: AGHT+IH/Ga5WHa4WgsKsLSKgbEehuyqvn8KfLn7YekgXK2iiDYMjq8AZzP29aqVzMkcLbvuitLywqw==
X-Received: by 2002:a05:6e02:3308:b0:3a7:fe8c:b012 with SMTP id e9e14a558f8ab-3aff8c92a85mr86513735ab.18.1734233245607;
        Sat, 14 Dec 2024 19:27:25 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b2482298c6sm7755575ab.31.2024.12.14.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 19:27:24 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v3 3/3] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
Date: Sat, 14 Dec 2024 21:24:55 -0600
Message-ID: <20241215032507.4739-4-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215032507.4739-1-shimrrashai@gmail.com>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_192726_829437_D86DC0C8 
X-CRM114-Status: UNSURE (   8.27  )
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

Updated DT binding documentation per @Heiko Stübner's suggestion, to
reflect the bipartite nature of the board.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12..fc7ee86e2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -167,6 +167,13 @@ properties:
           - const: engicam,px30-core
           - const: rockchip,px30
 
+      - description: Firefly Core-3588J-based boards
+        items:
+          - enum:
+              - firefly,itx-3588j
+          - const: firefly,core-3588j
+          - const: rockchip,rk3588
+
       - description: Firefly Core-PX30-JD4 on MB-JD4-PX30 baseboard
         items:
           - const: firefly,px30-jd4-core-mb
-- 
2.45.2


