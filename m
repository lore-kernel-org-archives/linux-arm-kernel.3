Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908D8CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjuDF77Nvin9wqVFgToN8rViAxLn6q03uh/wAmweEAk=; b=d6zk/7ojzdjeTOdxldWzYXoHkr
	pnPzAb995uHh7jLHJwctceiVirth6VCMEjecuZfmr/k0tFp2G7y+cNaEqCxQCi2HFN3yqXmYwPd4W
	f41TWHkXzh7FsBzszc5DsmRaCbLz2t26xZ/1JQO7cDMqjqrjVokzo7KT2CIqcEV00qzMXHzOvJzOL
	682KsVNeJR7jNqpY/lvzRsMqS45Jgy99TpIuIy230vHSANXit3juhUsfPYMWofItw3r8R3U5S634C
	Cgktfc/QnyWADiLs7eXP/ayc/r+JGVWl65oiIuYBqDl4y2OYzeMbRDJkmVjr7jXF+J51XLhzYixdk
	3I1UV94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI9E-00000009WNU-3j9F;
	Wed, 12 Nov 2025 21:13:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI9C-00000009WMe-2U4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:12:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29808a9a96aso786745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762981978; x=1763586778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjuDF77Nvin9wqVFgToN8rViAxLn6q03uh/wAmweEAk=;
        b=g3N3Qkw8hHPeTu2tRm9sNGRz8q+gyNp8/AxzyRQRrjqnIHu1/J3OhY5IyaYeHWdnDG
         rBIBZQbRhLrood4K7lrU1ziHi4DXOY+ilWt35+MO7Ufey69yjl/fLJlXrNeJb7nHNVob
         KL+q5ihy/+4wvf0g1H/NzIdpqN1wHwHMTeXX7FEcu875vJCqCMRcrOtJvj2C/ukVVMET
         8P49cAINyQY5HeWphINSKvbflHcne4fFfH69sVICpSVfJMFc6ebHxR0FPZtoxTrVniUD
         Um7iIsCwSMaeGQe8thNVuqMAR71MncUDZSztBYFaqXK8Ra5oIqGMrpb2pAmZ2dzOJjSl
         2fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762981978; x=1763586778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjuDF77Nvin9wqVFgToN8rViAxLn6q03uh/wAmweEAk=;
        b=i+A8PgkefU9nix3DyBjnxRfEC6kPKXSqTCGsS8XBvpvPEsOfI8CohYDaaPrY87PzWU
         JyZ/KJ4q1Tt/32bCqr7fuCZniKbjLcoaPeb08wS3uk2fp73503Ua80EL8uXCdp2Dk3Sc
         G+/O4YG8Cij4I4+TE4KWqo4cytVKy5ZtUiQFLi/CEVlWP3QnnvnYgL5nBxxnniTGe275
         V4si8uzUIkxUG7aRfiU4SO+F52GytO2MaGta7j9MaMglH0VgqMLWFnBqWxegyckUdpBE
         IH3yXlakpj4ERQFn2JxD7Zz6QyeW4oKZaD9x6Rd9+Qt/1nwJqWD8TDlPhYD27MFwCLiE
         X79w==
X-Forwarded-Encrypted: i=1; AJvYcCVoWzwBDwcywGukf+aMU4s6DZYTUTpJgY8WWPk1EgmOxEp79A4rVjXRb4EGxoQI5hkaSO8X7ppkj1/AXCX2RbWf@lists.infradead.org
X-Gm-Message-State: AOJu0YwXzND/mm3mFZP15t2Tl5jaYuTrxnIiwxEkrUfrCmD044jk1nim
	AWfErb3CnM+Xk/Q+P0T+eJtlc85XW5+KMlddHZwhH5rA+2MQhrNaGZNP
X-Gm-Gg: ASbGncs6WzwxfUlx3JMl0yJTBmLI7Mu6oIhT/mn/1u0kZlQdVi0DlWZBA+KvfS7Kff1
	TEEwRKP7f2fZa5Hmzyc5kv4ZyRrz4/f3jmEbz14a0dE6bkxW76G/+giFN5dNHFHRMDaEWYbqBch
	L14+in3X90wCAk1NXhnsDmmISHstnL8rqXEmk3z8K38IopcReUfbZv9sFTS0jzzloA4vQ7daGhz
	j3Jf7ircosIUQChwj8fd9xQ9bPZvJSrAaUvGGGvDeX1koJUI7QTDb0gGWK9s3skKrj40QmJEEve
	mbh8eUpsMKOPI1QQue4xZXB0E6FKce47dJ14j1EuN10M0BdY8Y/5kpM/+/OHyvuqA6GM8pBQczn
	PGkEujD3fTe1Y8Ups3qpTLeJtxVTR55j84jpHQ/dmj/25cjRrttlsAe83Al6br6pBAm8=
X-Google-Smtp-Source: AGHT+IG+mV9xg3XsxHHZk9IEjI2mp5r4vWAmColXzizBEHkP0uzY8AdSktbXnLxB4bTq6cCi6YDFug==
X-Received: by 2002:a17:902:d551:b0:295:6a9:cb62 with SMTP id d9443c01a7336-2984edaa8a2mr55489145ad.35.1762981977752;
        Wed, 12 Nov 2025 13:12:57 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm1011525ad.32.2025.11.12.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 13:12:57 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com,
	Peter Shen <sjg168@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
Date: Thu, 13 Nov 2025 05:12:47 +0800
Message-Id: <20251112211248.3711889-2-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112211248.3711889-1-sjg168@gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_131258_653157_404F5CD2 
X-CRM114-Status: GOOD (  10.73  )
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

This patch adds the compatible string for the Facebook Anacapa BMC
which uses an Aspeed AST2600 SoC. This is required before adding
the board's device tree source file.

Signed-off-by: Peter Shen <sjg168@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..bcb874ebd9d2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
+              - facebook,anacapa-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.34.1


