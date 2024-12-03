Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBA3E6C605
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=; b=Sb6nJ4BS8gBltlcz3JQ8CKY/oC
	SHhZDbEKKrN4rhaJJNQW7zQzjh7uO4Ea5IwEdlHoEOvysHTcyhEDfr/tHoI4xUnSAbH0CEdN9hBNc
	0omx2IPhyP5NKD+hV9nqOxt212Tr32fh3bk6RklovfSEO6bBcpRusTV6xGlLZbRnr8dm9k2yxlTWy
	fyMhXNG92yNMjqAIp0fteqHFbah3zCQ1+EXFfjIljutaB/XOLuj0DaiInchaFp32Y1N6UzjPgqO+t
	PWfjX5dTJ+0hLX9T22bUI7hi6UUQD5ojA52T+rhQcM+uBHfYyEXvjWP+wLEm6h0DqXUCotj0vDDJ4
	DX25APHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL9z-00000008HtS-0Puz;
	Tue, 03 Dec 2024 05:09:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL82-00000008HL0-1tte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:07:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7251ce598adso3437664b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202438; x=1733807238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=AqF5qDU79AwjWgk0MnUfXo/hoXglPhn3GHenNs2ndN8CAYWkCutWTKP1uxHcowlSNB
         iuqX3gRzcCTWLbbgz+CmKBkBK0ly3vRu18+yyBsQL3DAqh/nq5kGLYQtsAOSmlueUStX
         dT3WoVCQSalIGeEob+JRiRPjbXnwcQZE6HY6DwuCOrVRieOLaEh0oaJm89POGvQR2FXn
         JN9jNKnD5ChAYoISJ6BNCZEb/K8sdB6UNRCI/YHlZN8C/SfHm7XfcW83+VlkgZU3kkhi
         AxxRK5C+5xIzOM3whElHJykukOMQPIea/fGeN0+AOudIx//WM2m/rDrOBjj/Yvc/c3OE
         ep/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202438; x=1733807238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=RD/7Ijt+jbAMjqm48sSpm6/Ohf8bgjEKpdJU8s5mf0SElCtBUcLy5tPuBtVbPq5d34
         +iWTZbZXEYa6RB+U3iRC9x8nRiuYCN9RUnp2vs+7QdZa5mTrpGJr+gYVt0fDdG1bskrX
         jA6yam095wzzOL9MPSfjgj4WBDDRwgLfGyFZWZhkUTXdYvNT7IsY9WTGBghovEdmjvtj
         rOAH+QHsQSYoDvNUzDmzvJqqhDX1+V6q2623x5K7HFSXFIqX1qJ6z1FdOLR73ooHaUyX
         l+SJtTFsQGx9rlDaPkYc+hXSAyHi+BhIWHmj1HzV52FZ2kF2j+5ZBS+SzSaR8F0dos4S
         yJSw==
X-Forwarded-Encrypted: i=1; AJvYcCUUeEXgMdt77ahjNRYmb5UXZhN0W6isDenxvb54dkFwLvLOf2kMFLciiPfrYecMXrx6bB6M7Mo7iOZkQVj5wlH8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb6VsRFF/ZI560c1S/29G9BJOYBLxyg8I1IT16HS0vPhYdFW4H
	fL38iGtMhVJfQkDTvfUV+SdrB11nGd3gkvXAmD8qQIthvvGumRAV
X-Gm-Gg: ASbGncs6wpz3JflBTVN6K5xPbXbBXSwowLlpqI0kMWjnxQ/Oeij6v/KT3dboXcQxUU5
	aJrbZog1GzKZCGfe7YZAz/f8rjW8mxgQh1LsNiMKUnpOHc8k330oQO6voCP7CTJQzx256Ei07qf
	mT1baPV0/I6ow9aNUEth4PhHMgU+9IukHUKtEAWzsmzNqm1CvGAiVC+sawdXSGareCbEFqJ104o
	CJByPjsko1pJbnsS6GWhWhgL5Ja+ssWslP66wBRCKz/hIMLmJp8oJ7uwP4TXouapQ==
X-Google-Smtp-Source: AGHT+IElMVKx4Nxypl81WAMWqHN+sikDERzQLkt8r2zBkiZ8BQoWhKpWu6v4bc6zILe9UH8q6vfqsw==
X-Received: by 2002:a17:902:e548:b0:215:b9a7:526c with SMTP id d9443c01a7336-215bcfbc21cmr19308075ad.25.1733202437604;
        Mon, 02 Dec 2024 21:07:17 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:17 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Tue,  3 Dec 2024 13:05:31 +0800
Message-ID: <20241203050640.109378-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203050640.109378-1-towinchenmi@gmail.com>
References: <20241203050640.109378-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_210718_490353_9E025C89 
X-CRM114-Status: UNSURE (   9.93  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1


