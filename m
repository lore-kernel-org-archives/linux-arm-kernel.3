Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E62CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=; b=qhV+1QE83XL7gFfPc9h6nw4rmq
	4qBi3Wnm92BquZuY9TPwCRmzXV6JnssE5YD3U90EnEC69ffEmqVcJfn8wUIgZ/NfpqNKthR2Lieds
	wgZytVHM6MlikDKF75g33dZLAMGEZbPt2697/9rDhJmK7xvXA9yb6LvoqjzZF7NQRF++fFOvW3c7Y
	qLsBoWYR+uVjnqzCsvtlTE9YvLPgZgZKDcXLdtGoM2HrPK+KztNiK6ZrGCZBk0wzrakGxe7z2Gqnp
	5rpE5gOWO8RnNuPm5H55dcWz5OaBjsaEvM4arACxxphSOHM+Yip6i1FpfhYFhQtYltELjIj2wX28U
	0poK47dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59s-0000000BQpL-3c3W;
	Mon, 01 Jun 2026 16:06:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59q-0000000BQnt-1qNh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:06:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36da8439078so1253419a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329990; x=1780934790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=QW6Rf/lFfOLFXWRVHFlyHbS9JIgzCAsx525jWGqHZ6gVc1Hvb8PifxMcSrosV1Q7gW
         7iRJCj3T4ZzIrlM5oV/bel73AXigR7MYtEmROtQ39UzOMpCEZjxOxEHwf3RkXARF+jXU
         fkrwUKk/nxPBj1ikL9REmj4OUDgt2FZxcZk+rbfpXTYKsrl2Kywanr5y3QRr6BhzElRR
         n2ihnzl7mBlOwKqQDtNlAtsq4otNuBCoH6xy14GxuL2mKJ9H+Ybavx4y4bbQCiigpaAV
         MnVusCAN+gvo0wnXZ68LnN3FdfeG8iatttGy3aayd2XLrw1FJomPDqMiWUAxdJcXvNSC
         2s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329990; x=1780934790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=GsXC7w5GnxyuBFczDXfMIJGi7vkHCRw+ZYLBZf6t8WQZ5nJDzQVWeos08HP5c9MpY5
         2fD2JrkGJUlIR65ZMjt0I1smdQI1VVKJGNCe1WI6XSebg8gYXWJkdub1sqkq2UyO6k6L
         j5+l5vjBKdf1XV3S99CxbdKDggKNvM5hnJ+exivobM2YGBejKNu7t+Pnx+gJsDTYe6cM
         cwsBxzfdvqjMlBRdZzEmvISa4sCQCuTPuZ7q+XOmtW9vCc7lzP8LLk2FBaSkwfL/dYLF
         t+rBDjrUTyNELpSNvsZ/AD5hQ3b4hwGWF6d1iT3RzT8gZJVARMuWy5BeLsBAUhE0FOcv
         DCbg==
X-Forwarded-Encrypted: i=1; AFNElJ/g+sfxu56VKYoaNA5bCpNWHrV3WaMGcNq9wPFv5P0q+3cwl3X23B1vvaS2Y0lhYpBVRYOhIlBRCc2/ekwJOOoV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu0jwZ4/PqOS+FvX4VQioEltbKfYcnGFUINlBRXv/+1Y8w+1A7
	m6Oi24c4yu/P33K424RTfBqbu1PZRDGvGgvQFiY7a6xqZJWhDjl6HeO9
X-Gm-Gg: Acq92OG2MDs2NPfSPU1SZjp5cLrHCP98HJsLi2ay+uwVUsVbzzrudGFac49Sd2V/r0/
	OTCUGo66pQQHowV2vffsZH9R9mtNzaDlgembkLLcUpLdqex86IBZWLR41Bomq2s/trfLESx8BL9
	S3Z14R0pcu4EljZtCDlDsgstMMPfWW0GoyK8L08Al4dzuI/Lo2aUOJgk6xltXPg+SZKDkXkxdBq
	ekjqFxxnEcF2oilLu3dxDXoVH5MAHIa4dDrppb3RobKkLa4fFKfPSegw8JRPbIIuhVJhnvvuQXE
	kmcbJ1voAAUTEwKESzW3GRojAdxRhemNScX/V8rWY+oGqsZcbcjPqdG9V8plJ/sdhxZE2vkIE2S
	Q+AX8GE9joPQbXq1zKahqAlScOsvKsL76WB1GbX7FWEopjawCWSx6gMjJOL51sr2KPCcGFAXwyg
	MyV5bwOSKkBbMXHAol/RYpQiqEyfjug3aPTCIdj+d9
X-Received: by 2002:a17:90b:17ce:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-36c4ff0b6edmr10563499a91.2.1780329989691;
        Mon, 01 Jun 2026 09:06:29 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:27 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 21:36:01 +0530
Message-ID: <20260601160603.167706-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601160603.167706-1-hrushirajg23@gmail.com>
References: <20260601160603.167706-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_090630_474842_0AFBAF0B 
X-CRM114-Status: UNSURE (   9.59  )
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

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3


