Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF12BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 05:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWB9xUbuC9ZZF7GN4R9hjYXfuiqehEyAMCDY4g5eDqY=; b=SdoJtu5lKkQJAGk1cqWW0E2d9M
	385L1mWSubCYM3ygra81sXahMnBKFte1q5UxGdU+eUN0DoM+bZSnMNG3FsNNIckxGrI0UHadDKYIn
	rQz4xezPu6/sWg9w1Om3xWiciu5Ew38JLvqbCYI0rNe3WX7wfAf7dvMHJ4pzCSa7xIlkePSkBJ7lg
	pWhGBcwHugTavdCBOfPUslJfxoc/19iMjn1mQPC6+hf0Qs0I/9B2UyJUXKQjNREC0VKfXxdCs8aHU
	4IGrZbdFYKTjcikJPr5rjNryUOQnTnru0qRK2YFzYztn/jSaE6jfDlL+sx2cFz3i7iV42kIhf7GWq
	Pz6SLhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhLS-00000007S1Y-1czB;
	Sun, 15 Dec 2024 05:39:10 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhJL-00000007Rj2-0XDS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 05:37:00 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-801c081a652so1924556a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 21:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241018; x=1734845818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWB9xUbuC9ZZF7GN4R9hjYXfuiqehEyAMCDY4g5eDqY=;
        b=aBatdac6nUVhwbgbrAeIIQGXXKSwli3+2/os0RVxLaSf/lIYWUeTFZJc8kTrNvGxvk
         aSt/lwfYEgkry7qcbjgHmSIO3LIGoyizexCI9ZUErJ4lOk4jy0yzg8W9TEdl64alZuop
         pZZ4oNik62kPk7jZFYLylSa24SCBZCQPYIRFFKX4Q12QjaeLB+GnqZSsZstRXrj48Mny
         Nv1PDNiWoCqZNjRZSlDQPANNjtbw/6QIRPfmlaUTtJhyqIY4/YAqmReJg6hWJyK8Cbqm
         SJ4D9rNnic1ZSWEZGMuEyyVAYc/b94UtI6tgdMtng/uq5fX3L+H6qrqNx8HfV+0ZvWft
         HyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241018; x=1734845818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWB9xUbuC9ZZF7GN4R9hjYXfuiqehEyAMCDY4g5eDqY=;
        b=dCNmTRa4YnF0Sz32EGg3xHbWoHPtv02bKTYRk+gkxp/1nAAYfa6/7fLwcAk/pQNWsV
         p+Zy+XWp3MiPSona9OuWjA1ZXzXVIILfJeWVTsDWDLgwlEphvpblfoYIKRqaFY75N1Lh
         IbZhWe/6PikU9kHGnGXGMIMuiqHtENNfkE3RFS75iQi1YEHdX3mnJQnjTRJsqgL5Va39
         oFecfKvtk79GnYtKJEqYafnPKlUtIYLfQHIwHDLYfXq3GLy3J8jo5qU/db/mEpf8jh9j
         rOf1a8vZAYPVBoNA4F7TqZLyyISVbQM/9DavKjdgNVG80mk4vKP7AbNqeeowSvghqa/3
         L6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWmf6BZpvqHeFFFI2cS/KAj9uztFftsTQ5y+WdmDJhcBY2QcbJmrCdJM6hRAPcB8g+uMbXnDGyNCIpSJ8I/huOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwniSKeDX0BD1cq8OsCrYvBalVUQM9QOl4q9TBB0RktTGtj5wLX
	uYJr4Ek3NLeZjbHg80q0BoGjKV7A7vRDDXu5c9ZfUNNT7F6uUzza
X-Gm-Gg: ASbGncs1G2G0XgqsmYUce6cPsBr3n8cUCIMerkm8iNFa3LQ998IIrDlc7nkHBYszI2t
	ChyXBITEhHGTAKJhKzprz0M4cFNoWSrflA1cpPjVRMa+tmijKW9Z2B3edhtONo1pJ8Nzcb27ABS
	uL48avwOUddZ/iiiG+Qd/TOquTk25Zs+JlobGtlt7TJJP0quocCIpddgO/OhFM/Li63uWXIM44z
	8IIZhPsis0toYZ7WE3W4E758SNlfDKlOhDWVUs1Qz+Awe0NcA==
X-Google-Smtp-Source: AGHT+IF2jjiTuuQytVaWgmoT11AJ2AJQUADdSWheU2GdN/FSM7l8KDl+72eN5xP8lMEWk1y6CvNoFg==
X-Received: by 2002:a17:90b:3e82:b0:2ee:edae:775 with SMTP id 98e67ed59e1d1-2f29153c0c4mr11837653a91.3.1734241018179;
        Sat, 14 Dec 2024 21:36:58 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:57 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
Date: Sat, 14 Dec 2024 21:34:57 -0800
Message-ID: <20241215053639.738890-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_213659_164568_D4EAE9A9 
X-CRM114-Status: GOOD (  12.90  )
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

These will be used to explicitly select TCON0 clock parent in dts

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index a8c11c0b4e06..dfba88a5ad0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -21,7 +21,6 @@
 
 /* PLL_VIDEO0 exported for HDMI PHY */
 
-#define CLK_PLL_VIDEO0_2X		8
 #define CLK_PLL_VE			9
 #define CLK_PLL_DDR0			10
 
@@ -32,7 +31,6 @@
 #define CLK_PLL_PERIPH1_2X		14
 #define CLK_PLL_VIDEO1			15
 #define CLK_PLL_GPU			16
-#define CLK_PLL_MIPI			17
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index 175892189e9d..4f220ea7a23c 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -44,7 +44,9 @@
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
 #define CLK_PLL_VIDEO0		7
+#define CLK_PLL_VIDEO0_2X	8
 #define CLK_PLL_PERIPH0		11
+#define CLK_PLL_MIPI		17
 
 #define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
-- 
2.47.1


