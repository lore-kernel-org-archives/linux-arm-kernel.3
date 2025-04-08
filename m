Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 23:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jSfFK6BUAK+Qxfp2fpBiU7pkFHlfyZI9MOMS3C7WUDQ=; b=cyTbRmY762HIZLNN2WQVXXwtjy
	MC1XMCmKSNkW5Tyq9X+nc2GIbfCIKQx2bElkOvQeltD1YeSk9jYH5n0/BxplNeWLyxqUgOWZgD1kv
	e8S05STIhdUpyxYFQBEPMuKdP8VzZWg3NqiTgIZpM+0yT2A5Gr5ECghd/IAByev0fjmIHScbYIlnx
	nfTwuRFipa6gs81PqljGfJyhISOFA4E9wGUw75mGrqwYXjH0SuObR8rfO1PjI+m108Uuv9TqfdBFq
	hgyybOSG+H2X6o7OpDxtAYjzuN4/eB5zPvSo2gtyHtpLWaP+dXx9RZ8ecRb5CLUTnIteiXA2t8rA5
	RQAQFiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IEt-00000005g4W-3UUD;
	Tue, 08 Apr 2025 23:20:19 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ID7-00000005fpc-1ECI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 23:18:30 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85e15dc801aso475881739f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154307; x=1744759107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSfFK6BUAK+Qxfp2fpBiU7pkFHlfyZI9MOMS3C7WUDQ=;
        b=EDNaetON5oVkGYPtDYAb6PfQdTaESBUuWYes78Y8SHqfRf3rSOAXtZtHu3WUtcZskv
         uGZznK8OpIg/zhHUDHV94etPnqX1WcpxRDmFRZtI9E6to/i0akcSyOFjwi1GQhaBww7Z
         BLZ5BHt2TMA/JMvB04HErZuf6bsMLDwngBfwjs2Ld/1UGge5hTfGAzoasrQKO0m6zOyb
         9AYq8Oew7bETjj+PKsoV0yzyT4HZWC7EE7iCBpzN04TLs1YlUiMF3CcbqRKfx/OeGY9Z
         uLFn3FWXBF3zG+t7e2pegld+fBYNSenQgs0MFN8supcTNf0cMalWUj/fWYbeTGz+/LMv
         TvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154307; x=1744759107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSfFK6BUAK+Qxfp2fpBiU7pkFHlfyZI9MOMS3C7WUDQ=;
        b=ECAw+tEFyD6jEPC/wM16iyWxlaeq+5FVGUPh5APgcIjQpzUKDPPqX8BjUsX+aec3zf
         wrn0UZJHLPt1kdd4YHz6ZH5xmFJF3bdwLciXVdL7ox75vUfuOhGW8THD1jl+dhygM7l9
         NReqBYOERfRzABoRaGxRGCFTDO6z+WrCgZalJlwH3/GJpwt2e5O2gsMJtQQTHgw0kF7g
         r+jbV9uJ1KFB+j2cTi/KnU4PGP6Ae3f+3PZSJ21nDChC0AFW/JCnbww8jLPLXyEO01XX
         Ih1BwrCIBUvOq54CKPww83c41ccn7JT9ax6OPxEVmO3SDDct+ftHHSMCAm8rvN+2yXK/
         bKlA==
X-Gm-Message-State: AOJu0YxwxgEK5VMzxY5G+ntnt0eoYCtDDfgW85JH2vKcZCwzPGB70rFU
	5MrWf5s/wvagDmUu8c8wNrZ5soXqZp9nrj/sLleElRPHtbc2Rc9jte5GLw==
X-Gm-Gg: ASbGncsskd4JUluEcwroZEuSBrtZliAUqu7phVoQ6kprXfCxSc1dG0c1PssUI/3O8Y+
	lSEvLWCOAqdvMFgGoSvilgVxWEczFkP/73Q6UvT6uQJakAi/2uZ6rJy9DtmCY21Ci7J7/rz2f4s
	12GDrwfeZz1094tXISI/phI4YUlxjli8d5IhrGRRoqe9RpBx+XORArKQXWOq3mbigIjoFPf6gWo
	pe7KvCDbmy/ujmyOpD+VAsAIi7JSL/6Fg8oSaXJ7JKaPVyieVavct75snf6Wklutd7Meo7ouqwl
	Fqvu37PnqhKNS3qkXBO9rvj/w+3jxecQu1R3PfV+RVJP+4BsFCIuSlZQnJSJKnfwwGwxn/N4NtU
	pVlEF
X-Google-Smtp-Source: AGHT+IHYg4dISZi5MgFUiEYdRjYsvIUqdiL+bhUuYp/Fy7sbHYzH9I/h1mFQvjX09fR0NQhMOw2CjA==
X-Received: by 2002:a05:6602:408d:b0:85b:5564:2d51 with SMTP id ca18e2360f4ac-86161265dfamr143772739f.11.1744154307543;
        Tue, 08 Apr 2025 16:18:27 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e2759sm724244173.128.2025.04.08.16.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:18:26 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue,  8 Apr 2025 18:18:22 -0500
Message-ID: <20250408231823.826163-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_161829_334124_09ED5E1A 
X-CRM114-Status: UNSURE (   9.06  )
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

This board is based on ti,am625 family using the am6232 and am6254 variations.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v1:
 - Apply acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2


