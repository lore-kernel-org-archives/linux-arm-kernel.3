Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F3FEEF38
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=; b=JI4r6+6jjW65VC0lxxz9/9Usqh
	BpoHONYVQjTiZnjHeImpNh4rh4t8XhYaGmvn6p1FCWbnboL9N4WzunlNtyORPBmTomEQlaJCH8TWf
	wkxQSYuvR79kzEBZf3hBPOoz2Iqjz60jkKa6ODy0xqyk7BK0xHw81GOvFne98DWHB2oO/aklh1mpd
	aBfMaVxbpkNfgK23LNNf5vpSagOVfgFRAq4chnuvLGPLJN0M4ikMY+uLrfhJCgckLGsaRT6B7ICoM
	oiuUQFgTCOazA67Ff5Lj8euYGcdT2/0tCRPCp/hsTuI7xY16nU5yXRRl4tR1vntFOGVnPFOAvPnEC
	tyZNuLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6tD-00000006Xqx-47yb;
	Tue, 07 Apr 2026 13:54:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6tC-00000006XqO-0yIB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:54:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so4389486a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570085; x=1776174885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=YuEm0c0BzfJPqLEV+Of5YuOKEQQ4asD2MniR6w2Do7v+TFGVc6fmyfqrTbB3jam1h7
         Oq9psvFNVaIpxpRG9zXHJTqvladfPAlZQ8qwrHHqPKerljAXYvCKAYrvIC3Glgl+pIGV
         KNfIrqV3Sxa5VBOeo4EWobWcc59yxF+G/0kkzbb6ziu5YerRqwdkfaeFqjlSfZPWca5r
         DGAUl34kPr1QuIDD7RBc+Kbu2Oy7FoHCcmiZeJWYMicrYmb+wKEpJO11zuTfp7A56Hq1
         9rDSvGVDHG0Dz8nT8S8Faqs3wAOYMxiNrVcOVo7rwFFeWEt+fZ3NDa2iU2gWhykBCvRt
         rHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570085; x=1776174885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=He0l2L/b1w9qQYcHKIYOhti6geVIoa3ikZ1cHzvMy2A2Jsaw0mb+kpCECFy/ctXPNn
         ppDIW7zpp6uIp2VlQj3CLTAeJQXGMkXiwBcY60lXEJLt4IhjF1VMpMFZau0RkCDe59hU
         +hPT+ZhRAEFLXf5/8f359+4Is+S3UfEKPcOBAYvQEJIYXdfOeN8NmMOPxVmWys5XIB5m
         PdCyBT/CoxmERQe8+aJqxatIWoREmNwWuqoJNOd/i/RxmsGDKZoX/pKQ07yF3xojw2Fl
         KhZEH4kW4Q8TsRCvyH0MhIdttEFlBVGo/1IITHzBcJlTMqHXY2Y1TYx29UWabq7z6Pzc
         wLRA==
X-Forwarded-Encrypted: i=1; AJvYcCWTjFZPYyS4X6EOHDZPyhWtSV7s1LM2GbxqRlxgzQkdhxZJZ9rPkg4KO3IJ6p/DdWDupoOPdg7A1aIx0FhAvydV@lists.infradead.org
X-Gm-Message-State: AOJu0YytqolU03/C15XseH17ohFtlhmFH67WchQAIKH5h27QKZxjrkoN
	iktvYAEersgLXZt4XwMklORhuKIOUjLynVvzvsyG8IjayLq/3AbFcoL9
X-Gm-Gg: AeBDietp25ZT3wSO5IzlUwF9B9oNrMwvWYfmOY8N5jidlbMGXdtfLSA1JdkssHxsvh6
	2k2GL9fUYtgO/h20mG/WoskitBpuht3r2vhvJ4cc3FIlAD2NCOV8igcE2bsZWjuhrqjDt2eYmuO
	O/LOvpu3oz2qFhWafUNDvIX+I+rUnRocvONHOZWwo0wvjaRKBUXFHyBxpbKUggxlgKRkmUGjmGg
	eWqsvrijuoM515rLT0D74kY2e05glm5Gl4AGKyKD7rnuwfwedKiQLnnMRbfJvxUBTVj9M5kybJa
	OEHQXr43B40OJEdj92jXSBtMSB2KgOA6d8RBv1VBk7Q9u7OUcWw3VR/QSWfvNxc++vt3X6XpF8r
	FTtZHTvbrTO+DFeMjmFIT6nvx8+ByxF8JpQ272qxMNL9RULxsvi4kx9zdYZL0UV91yb+oi56UFz
	rnnc6s7eTgcAinvPfBF0k=
X-Received: by 2002:a17:90b:3bd0:b0:35b:e529:7089 with SMTP id 98e67ed59e1d1-35de67f0e5emr14853030a91.10.1775570085230;
        Tue, 07 Apr 2026 06:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35364edsm17111559a91.0.2026.04.07.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:54:44 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 07 Apr 2026 21:54:32 +0800
Subject: [PATCH 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-anacapa-devlop-phase-devicetree-v1-1-97b96367cac3@gmail.com>
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
In-Reply-To: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775570079; l=882;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Hk36uMGemdglD1N155LHlYS04DfWcX4jaFk3m0XEMoY=;
 b=zEf0wBENQdZ1MYnJAVX3kBcym3nuKDr8HTDVq54QHm8/2nimXbBwvrkgA8is59NSRx5y1G3xs
 zQAtAkf9TK3AuF5g7Xm3QW/N2AjpAMbHlUINbcw4/GCDvy0yRUUORZk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_065446_300442_0E2AA400 
X-CRM114-Status: UNSURE (   9.50  )
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

Document Anacapa BMC EVT1 and EVT2 compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..c4b87c014941 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,8 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1


