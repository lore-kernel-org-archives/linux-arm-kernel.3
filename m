Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF578C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=; b=Th1f+XSBnhYgp9f7FPQnJQQ69Z
	HXz+C92IoFMANj75d3ibExcUsSSUpAzpDwXv/lIpSx9sO1v9q8egWdge/xPl+vZDStlB3u9qR9XcN
	0lCmOMSkaUxkrglN7iTeKNGNMMAwhfR0e4lonwYHrh9+r0bEStozx5BZm54uE6i//YdHlcUosDo0F
	q4xYCl4tLG9c++lZCeQ6LmnYbxU4E2ccmsGYQSxdIko8bAXNmM4oqbA8Bv3nHmSrmyd9uLWssL4uv
	l573KSz25oGptZmLI1det3ZJ2exlIGzpb6Q4J5g8S349VREMktUcnVLvKOYr2Q7QnxKmyBry0JgOL
	t5qcvCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Xk-0000000F40N-0JoG;
	Thu, 24 Apr 2025 18:43:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Qg-0000000F2dk-3cey
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:36:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22928d629faso14983065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519770; x=1746124570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=lup7810QO2eJRlcoxVONhtYBja4Q5C8qYM9epasy8UTysLtbmHWrKfu7y5llcwN6ob
         NuCf0Vo2dWDSIeoIVCn37EGlA+BnsrZZ4tBnxh8l34smfhPsSr2Wr5TH6d/UyQf7d4do
         ijVQQNZSoJvdokvP/4XBIbTdrBzTr1txHs4Dga3dXbAPuL73GhZTH70qNnNYvHgzztmG
         nJ6OEx/GeTu7kEHJ/9/AwNqmaR43RoZAMYVrmpRkszuxMOn1MBnX35U0WgSJatzRALYP
         Yewku79lcUKU8BDBdZyXj/lkw4zFT9afISnmijpzHLr3llhvU3VCegZpyr2+xEW+5NGg
         uPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519770; x=1746124570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=L9kUKpZfG2BBVtXLkm5AR8iiG8XFUkjEmsvMcCx7P562e44lkSU8gCkhqD58xG9ETD
         xlnSLIajVGTEGkgxO9ro0kR1jyhA9eX/cbuJG5vhjdlof8J/69QwkDbts+hUWgF33lh6
         +Mn5VtYoURdilNQgly4jRodWJ4zIlvSVQDLdCA1Z46T6cPmFAvy/dRLZnXjow5V+wMUC
         gg5ZEItSK/qODMsQSYD7IdU1EnLvua9CDiuhloHfJkDfoTYZYAUsl1bqljy4pBSqbr8v
         h1IM35kXaKOk6GkiWQCh/iZFSjC2rBAssMjTRixQ1d8AhXVQ1iW8cgkxIpXU+iM3xfWQ
         GsZA==
X-Forwarded-Encrypted: i=1; AJvYcCXQXlaiL++s4uuHzPyZkJ0h91S3FNnlYPQqdcnq1itQB768VC+vnkTretOxvqCBHgBrNK1m1U/c8ql0yfZz3Jrz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0SjmlF2qe78BYtWP/ikZR9WVupk/tCSRlqhu1+/g8YJFYmkF0
	gAKY/jDPZqzSWcfycuLuSgW8y1cJ7jIs11SRBEERVRt7QI6z17Ha
X-Gm-Gg: ASbGnctk3YW3DhKaEqmOMFcvowcbvlgSN80AQ/ZcTGXMq9IYW3CIjadw4F1SDQbvx+u
	P8JCTho6d5FxbNHKhYD0DrVPczDvltWlu87yeHismsx9Z5qiS51mtRQrXPaqD4SFY8Nd211ebMT
	xl5vNHUuEE0X5w8oSgHCRGpxojD442OFuwRFhvJEh/17AO4IFjqBnrD425xXzTJjXy3EFlLTQZJ
	UdTYxQVNEh0QFOWErrgsJwNVjKWMz0W5uON230YiVeJ4EOdiRmSHBJF/bJLbBz3cpbk8llDVaQv
	h+jBi3GZdi4HxQmYn8iMnVa4iwyIE7nqku5W5V2rpy6iWSJ8hLyZ
X-Google-Smtp-Source: AGHT+IHqLH2t4islHCN7Xsxvq/NEq6ccj520erbcioNpl3nA4bpgChYKH6CToUgPC/7beqqrzgGCyg==
X-Received: by 2002:a17:902:ec81:b0:223:fabd:4f99 with SMTP id d9443c01a7336-22dbd43fc8emr7760115ad.5.1745519770146;
        Thu, 24 Apr 2025 11:36:10 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:08 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:44 +0400
Subject: [PATCH 3/5] irqchip: vt8500: Don't require 8 interrupts from a
 chained controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-3-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1330;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
 b=Glbq3otvptbFSsdcQRjXjts5iEYe4uLGA6irB9favgR/xaAVY7e0Cm+voNcmZtDw3B2tcydc8
 RUPsx0DVE4IAre19Fw2E5tie81ktqVAIrYohjUOogGNvhu5CN2C0TNC
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113610_903562_0A5D3074 
X-CRM114-Status: GOOD (  15.56  )
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

VT8500 chained controller can route its interrupts to either or all
of its 8 interrupt outputs. Current code actually routes all of them
to the first output, so there is no need to create mappings for all
eight.

Drop redundant checks, and only map as many chained controller
interrupts as are defined in the device tree.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index 6d46e1a0fda953d76679ad2318674fdf0a977f0b..cf24a88f52d1b90f033d429288c88398439b92d1 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -220,16 +220,9 @@ static int __init vt8500_irq_init(struct device_node *node,
 
 	active_cnt++;
 
-	/* check if this is a slaved controller */
+	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
-		/* check that we have the correct number of interrupts */
-		if (of_irq_count(node) != 8) {
-			pr_err("%s: Incorrect IRQ map for slaved controller\n",
-					__func__);
-			return -EINVAL;
-		}
-
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}

-- 
2.49.0


