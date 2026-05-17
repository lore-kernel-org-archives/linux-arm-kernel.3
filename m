Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537BDCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=; b=lD7dGjBhzSirWnn5h1luJPxptu
	n3jCGAEnZIsF7sE1oV32kqPNkMslfBJDkQtX778J+OobBu+77/FUizsgeymDICsfsgUfgdVjGMv1d
	BYkQ2DuQrrfPjE+8QyvtQa5lwoF3AhQGeLFWRiVNyiKGhhdxOtMbYs+QAEhjn8DL22f5PdmvKd+n8
	KroksZYPymT8Mds5T8pGfnpDwvCRHAoxZoQYMd7wHEUh+sJRi9x4na59xfFPueSc1drryq0pPVhI0
	1DPoh9DpsSxJ9wKD4QpBbfej56QQaHC6OMvbxCjvKkddsVyL7jNx2fJB3spKXVg3MLoEruOJ2eNJL
	txuZEG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6w-0000000DgL8-3VNT;
	Sun, 17 May 2026 23:41:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6q-0000000DgJ4-2FVJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-441209fb77eso818067f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061282; x=1779666082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=JlxacUw5KN3iFJbvTegEtawCCcr8dh2hsbd38dT+clSuutQMSJtF9W/kmvgqiPMRHz
         xyQPMMBwc+DFmpwSkgTYem2v/Po/ieGJo/ZZAVlJh8dOmCS2Qsv5+IOq+X5aOHkwLWOk
         Ruwb7ypCLwuYUoysdaOsmnouMpXHEmlbaLBuWv+O1TbUbZPdqUyU+WIPIcSHdHn+LOtV
         fiwXVQXRYKG81W84cc8YTWVDN6p5VKtxuUEen5nPxA4IzGRqkE21NM6bC7uPn8pQ5ZH4
         Xt7j4pSKcZ9ZxLyoVbKQ9UDCa9I/8+5ytK/kI+yW5AwX1O5TLTy42tIGmg/fH2var9HX
         OsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061282; x=1779666082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=cNDXyjuAY3IQw3QoULLGvI4v3nxKKCPHImTIX5xDjAZM5qnILSjLr8DyCbeogTbdaO
         W7BytyLofp70epWfkkr1WH3vE8yM/PERbFvGew9iJhzs4NmshDDNJLBI7kuAR8mDjDrz
         PrRHporoXKjHJwiWzsM8UpHk3MsQvCAHkDf77OBLnX0zrkNnqZeJsiGhJrlFo9w8x8DR
         4+9XfrNqr5AsmLcHeMqW609NwvhRKXWybp/hrqhJ/K9q2ODu5WZahR/OJWw7p8sKizFg
         qpDz9fXD+gfiYHNyQ1bOUYhptS0Io4vCETF8SRfxrpa3aXJOejrQckyc6+x0VNdYqIvl
         sEKw==
X-Forwarded-Encrypted: i=1; AFNElJ+YbURG4SyCbHmM+GZcQuFAyrb+U8x+iBeAk1acXE9PLhyDK1sTFI+Ixb4fxQw5Wb1ZHj7a4z5DJ25oPfG1bRAE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyak5POKepo+uWQYVsfED/BqEfgBNaNM7Jzbl3uYucwm38OZOb+
	EdNIml8c6LStedt/5BHrlIsPV4poFlMeHtpus0TJqHxPbkUCLe0hNFKn
X-Gm-Gg: Acq92OF9xG1G8+UiQMtWxULOogrQDorCFdQjo0B+ubLKJc3tZCuiJIHY1jJ2QmmRhZF
	jyb7M7vxHKNm4jIh9oxPNs8lnplokyki8R0wVVjqguVaLfxqO5HZZKepvko9cLjKRsNT2B1t/bu
	VQB1ubWzOSGAB19l5fpJQRdKvCj98HElVwl/16s3I5LVRktv+qriIWTdNRkxAJdRbkjIydfKm0J
	jz7uar5ELVAqALc+nQ9BI9gt92rBzXKHcIXzf2eo5r0d1JjbAT7AQLkNJbKVgx+2BFiOREasHHo
	S0ETI3b0pfODoLmtOy2iNUsL1lgC5aY6vyLv4XcAI5A5Mma2S/OQDtz/YXd8IPSTwd0YeBrqt8u
	+ZaoHFZHBfEBCw6XnaJ1BahLWLB215xo3st31CfJDTclkjmzhCdcUxLoVtc+fRkKSuOlcUf6K0t
	ZZVtPlBYy4G3OI/UmgOsFn6C+w/KY43DSgopciSRPaCB4AR87EWQhR+05ydK8YpaTL8vYvOJqro
	H0xrE7av4wDvjsOyM40XA==
X-Received: by 2002:a5d:5f90:0:b0:441:2397:f40f with SMTP id ffacd0b85a97d-45d900ec71fmr25972014f8f.4.1779061282572;
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Mon, 18 May 2026 01:41:27 +0200
Message-ID: <20260517234134.2737320-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164124_578774_54F77A3F 
X-CRM114-Status: UNSURE (   9.05  )
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0


