Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74A5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=; b=pT3uIL9RXHIF5akpux+6WFB7dn
	8SexkjZQiixQmHxT/4UGU9um7FPKncvCK+BtMgLY5UI7j81x1zulmwCPwNUzKB37kyYJhnSA+RRQ0
	Ns/NXj4OAdNJzY9fokwv8IEIqCizVOX9JrM6JNe7+PG+WwjZAfDbf0GgoNmvHF5e/HVt6utxnj2pB
	XM638sIWo/X2cAkgUR6jz03MshPwj8wmb2T+vzpNcxLivEVvBZ5OjKwyDnsLgzChfJyjlXhetoIgr
	hg9KmXOQhaZYBPxM1ZpkJoSf0HDCzOV6o7EL3vsF0hMuWZdl9D4qQSmmHaJ+MyVXDQJvtu4bDZvO2
	H3zlMWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9sf-0000000DRtk-2DgV;
	Fri, 28 Mar 2025 13:36:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nT-0000000DQbg-3Tng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3667993a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168654; x=1743773454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=SHhCB8UE1x6wmz9Yh8wC21Cnb1DmN51GWw9a/VTsfCn2P73V66F7aiIH9KfkDM0nvV
         DqOfXfmvM57FaRpLJLF6NJUR2KiLaHZvHP/WdQ8dvlu8UdaYoKOmELfEFT5rJNd/xq3S
         ag67qH0fkHlCNn3EZiFtxs0ihvBZMUynuV7waabchJgN7IcVGEj2ApKzlTIE44nJUr+5
         W5ROVeLgvsa6ohfz9GCNMTiYxTHj4AlZ7TyihBry6dD6WSEYKu5ZCGjpW3rw9iyypSGP
         +GrXSXdv7T3838Hnpv/pggq2bUgcZNXRQZeU453sywPUByLMop/nh39pluafwDMpUcNh
         xfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168654; x=1743773454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=JlA2j6n3LLbRBt0XjgpQMJM+NDDI/9/BY3ThHxQgdOWw74EFkiXBbvIoCCdPAvgpXz
         gkakyZPrgDNV7d0AuVY+nHDM4+7BBCt/JfiGMV7yf7Aavncyls7EF6oOMDMm2eVU1Yql
         +ZQ0fPb8l/4JxPTp9osV2fkCBlrSvoTxnbUKbe5Q8w184/iRESaUV8vIXcQsmNCQUwqz
         4v1W1xK2MIqpW/ysKJ8nFBUX2wYQ7lKEvTMzj4lGiou/e4XlZ+uGa7f9yvjM3mumhPDv
         NpPpV88FLppxUOwxsWDf8bEGC5QNZsjowGduYiKQOC27+hC934fEHmYziCFhWD9Qx0ZF
         8+XA==
X-Forwarded-Encrypted: i=1; AJvYcCUaMcprb8B7opmOPkW2BuMSVi//G05ECFbrlahWTXMg+gtZvdw57iZVBLKy9bTsgBVbHTcocEP6ogA+aJmM0eiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv6ESvG9Uw7BfnRKYTgTrBAEnuHQt75TjTPYXHZIbfFxWyR3HZ
	hktHjplUtq639T2K3N5O6G8LApEfXOvzsBN6zUQE5ubxNjDKzCzWP+YzqSJfpW0=
X-Gm-Gg: ASbGncthVNxs9hh4HEdT+ow9smP+/WdlS3arYHpITWy5S9P8X6H4Na/QPgPeMNWq+0l
	Bi2KCWXk8jH4c/mzVM3D7Ztz4ZbkOwza3u7e01yMb0f/ynzsOO4XZmjYTNuLugBmYBuD/XQHlzo
	PaD0XvNbrdryQR/3lVvxK/J6GkY9aUbuQ68PktuaPqLfU82Irb0M2YNmrKPxAm/sS6O1CzvgLjC
	01wtkt0aMO2bho6E+xlu6edr1ne+01mdi0110DGpsmCLJn+5l8ZKX8JY2fqN4aFgnKjBi/+kTRQ
	NFn1OFaBBVf+HfqAwu0xlPjCu30JgYB/S0DRB+2Q6oQv198uKQXF7kEmX/yEIpAj61hxwr63u+t
	Fu74yV+4JYHqY2mtwedxtnUVTkIza
X-Google-Smtp-Source: AGHT+IFNlBH/xFV1TxcoV9Ofat0bwBhbNapLP3kxW0K3XFCOMqRnzn5sDn6+P7lNxf9DYLlCo5zX1A==
X-Received: by 2002:a05:6402:3492:b0:5e7:73ad:60a2 with SMTP id 4fb4d7f45d1cf-5ed8f901fb3mr7761660a12.30.1743168654052;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:48 +0000
Subject: [PATCH v2 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-2-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063055_867308_E42536EA 
X-CRM114-Status: UNSURE (   9.62  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog


