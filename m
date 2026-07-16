Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWs04zmRhwhbYBG2seCp4kn9pc7wv+8tpSxzop/N42g=; b=KafnltV517QkvdCwGwRBN/3SV3
	nbMFp4Z0YLCt1HRxrSuMJxhmCfTMsdZv7MuLBG1CD3gTMZ2G7MhBPxTg+Ipk96pJfG3kO6A+oxpvb
	49aZqDKt7SN82o3/zT+N3YJYRkKlK04QK2XIZIA6cf7XNbeunjSZfl+iWnrMirZys2kZ+SObHS2Wb
	Xr7yaMgQqmiZ80/giOZhhVyWKLNv4K/YV+GYj78UdsM6JUeMQPiwoIEveO+C402pqr4RH1igN+eQB
	gHNxo9Jsq6MvQQFcno2LpNuw/7YgKHNxRXCD7Mx7vpxTy6aCXaBsofpLs4axtudw8/XXEfwepdU5O
	maGqcDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAuH-0000000GCDo-1gmu;
	Thu, 16 Jul 2026 01:28:57 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAuC-0000000GCBO-2dET
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:28:53 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-8486ac3f347so71308b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 18:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784165332; x=1784770132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWs04zmRhwhbYBG2seCp4kn9pc7wv+8tpSxzop/N42g=;
        b=O9tTS9t7urCKpdvd3svtlfdH6dCoeY0Hbi6aCjT46+y+tKZfgATOjwArYpvzUue4GG
         xHhm/5/fK9PcSbG6g/UNLRsZoaX4ZanealZFReDAatOFaYJSEqnjZyYNj2nEPo0qW/Rp
         mbyQsiqIO7fmDfvvWokoVRkFbsNt1Z+yRUp4et1E63TwiHfBx9OLJZywFSWW0hI+J0BR
         OMdJXyNZR2OS0K2T4l41U+Aq7ET5+CzCt9oSIYZE9CQusSdJRUIgyCCY+N9DIHu5lDFN
         ebFtbZS0vXib7iQGn22M/F8vG7p5t/bBUalqxxwIE1yOmgMcMI6T41/01gXDpTjQwaV0
         K9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165332; x=1784770132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWs04zmRhwhbYBG2seCp4kn9pc7wv+8tpSxzop/N42g=;
        b=fqgLkLYUNehuDRehjJgRpey8i7zjnaYU5b3hWgKDMEBBfCgGDzPIBteXRhDH6NX0uX
         NLx0QGpPlLFsajO8nVc5cFuURLmynaPptR73BU7ifRmDxn997ptnjTUBHMBomwWBTKXB
         CbfGBcvgNhTS6ZuKKKOAtZ2LrvKPP9p+6cDiJsSvzyAIAK7DlSNR7wZQNZ28R2SN/rdk
         N08XsMBKxiiX2Kka9oF0A8v1iMoNjckxXr8U6XFDHFF9OcR34TFWmgrR7oMUABK0TTtZ
         a+54eW7fDOyHBCd+t7Ezy4XxIghQGIWs2bYRJIE88Y8c52qOQRP74UK0aAfXR+Csp8pa
         SVgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5G82iwMQx/No3ibW9guqUHgdbZcyExzB+n0G/IRjcHgGPQ1lI+o+oo5le6xsJtREF9OxeWRCR9N1xWCXmstws@lists.infradead.org
X-Gm-Message-State: AOJu0YytRSsnqGkdZDE1s4KZ8iaNun5hi36rgPRkAweBvXkdrkjYKyap
	liYuIcJhL+rAN0jr1yWLwipy5yrmbqlhOJ6zDaWfdXR3afseuEk/IaDA
X-Gm-Gg: AfdE7ckyIY+yuSrUKi1A4mM2d6kTFzrDv/f2Vr6WCgIu5WARaS8qo+JoINuHo63iKQP
	YdtC3EuF7lPGNxUXfOC2oJbzDfVK9/xHzam4feejpCEWSmG5JqtDfcMwNFQsAUt/wdWrq+mqEd6
	Zsl+AdEnixfeN9i1gLzezotfsWMPyxcjT+ghS4TukoetxAhZevdk7bYTTP9KuUM9n+eoR2JlvRU
	i1tctRxPUsjchbKeRdTeUCRajT2mWbL9XDCma/B9Gl4Kyrgr1wvKax8r+TbiEEV8mkIXM9BiyPL
	CDWgXpL7qu6X6yvgefTm2qdnLvg6okCJcFLOEaKO6klwkO2Rx/pm3RkINfvdt/L1mttg/olg3la
	G8eJqzvaZa+eBtGAT++s1KD6MsmrTo8jBe+kXXn7kkquMdENu0j7/76cjWX+zEkZZ4gxuvinbIs
	p3tm0Uu4JYIqCOivS/4umJVzDgb2C+kQFMDg/kMLGYpUAOeT8j3RGJeaEMitc=
X-Received: by 2002:a05:6a00:1a93:b0:848:2f58:e1ec with SMTP id d2e1a72fcca58-84beb57d6e0mr419869b3a.39.1784165331660;
        Wed, 15 Jul 2026 18:28:51 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:3ca8:26ce:2345:363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm3901362b3a.23.2026.07.15.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:28:51 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 13:28:37 +1200
Message-ID: <20260716012838.2353939-2-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716012838.2353939-1-huhuvmb88@gmail.com>
References: <20260716012838.2353939-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_182852_691723_18EEE006 
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

Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.43.0


