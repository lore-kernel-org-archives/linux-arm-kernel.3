Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0546CC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5kLuTPe1ZjtYfZALE1yPZ1I7y31mtKy+cX6Moc8i2s=; b=oSU/AZl2y227SmbPrl7ZqrKfyr
	LmN9M9A5wAQ1GvHPb3kNw2BkTDotbcM+vb9EkPBdUgnQbCkIgQ4kylBwGrd8V1Ez0SZxVCMXxIHHd
	sFSMAfqs2ObiiH8iRcziBq3ylpIIDmsn/IZ6MC5yHnmmFYEfcHjWdXG/bcDZ+iPn7Ha0Ew9x5aE9W
	sI6pRSSUHXvOqqsiVMLup0dzHtKkiaNRBz7bzWkMA0YXLlQOMbD8XWve1sjtBu182mrFv9jLqym+r
	ZOFM77M2kVuVPPTg3kZHD9le0Sg1a/Glf5VPxl/MQV/3jMOdDSTY09bcjr7ezpgvy17Xr6JRCxy+5
	vWr5l/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpj-0000000AHoF-3mDY;
	Wed, 11 Jun 2025 14:53:43 +0000
Received: from mail-pg1-f173.google.com ([209.85.215.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJdb-00000009kFw-1TNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:29:00 +0000
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2d46760950so6360108a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641338; x=1750246138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5kLuTPe1ZjtYfZALE1yPZ1I7y31mtKy+cX6Moc8i2s=;
        b=KR/jH6scGRJ1vQvqvkqJyWXqJGpMgVJ3Ldp4p3l+TLMld9GEpuTWwCOcmVJvcEwNuB
         Spi9gyWcx4YDp1UbBFk6VQAqzZ4UvNhf+4ELcaZKC+7B9Mqw80VA+iQb3+e/ZRT1oZXK
         /cCx39OClAQ8gejK0hR4k0x0LvsvxWas/+8L5XDnRA4H3Ka9pHFgrxRzbmA5ZxFrc/Qd
         jqHpLT9Rnf5AZRh1ZbKLO/qhypJYZprPNkpAd9qIAQS/MAka0IALOF6DSGuSTDOYldTf
         /MbVWwDuNHyJWcKVqFENaNYXaVHxKzg5wAM9xT671gL5kuiZbdSP2oaXt4qG1V8hOUSj
         x1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641338; x=1750246138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5kLuTPe1ZjtYfZALE1yPZ1I7y31mtKy+cX6Moc8i2s=;
        b=r+20QA9T40yPEbw7vt5qeR2FONur+tyrnlx+4x4gBYsF6EQcro+p4+YULsfLk6T/V6
         xuWLXVASHpDpC1weCHMnuZcZltlCUIXPiTA2L72QFKDuWIq9RACLthfzBoq6aEzLgkTP
         mFsjJKhBfStUTkUurZf5pNocKyc3ZgS9Uqd/6evgzYfQExhwS+QhECfuRoZwkFubgCuX
         kU5TiD+o0snUqCLegxj4BSSeNCcl43S/qHHWPUBvpxKUH+1CtnzLmM4HX7FUPO1kJj0E
         xavDIZlp2JQEcNy3q1NOPD+3gqbA5lHPUufMjmsMg9ZXpesYG+xwHkWxhGBrHQH+uRlh
         R/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKXQHsogpOuEKevcMDj2oFnEU+E0ZoVPmBcwslgrglEUawOV1vVLCrfvuvwtP8s5unBetiXE4R//qM5lttKJq1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40eTyVn0P0RwP14DZEvCls69fN1r2jST8otps5UQcsbmVta9L
	ei1f/D22wozKWbw9Ny6R0G6jXKPruKo70M4tPJWQGZR+Z70Ups8V3iRZ
X-Gm-Gg: ASbGncsJ2in/eUzKlQOecfyg8bR5X+vBEppJfWpGvC7Yj0n44a4USV5YZc/JjadGpG1
	t4pA9OWi7oYUvxBnclQsLcZ86gB1oo01sX1EenKSoOiHLRkXel9wIKA0QaOv7x19m1e0SfZc/i+
	ER67gV9XmSnj9qw6pCfpoKkmlwCDwn65/dvH7h2L7ughSap3MypuA07Xpd0JskUyfsl2YD+hDKx
	ME6JuRp7e7Sboo6UO+jZU+7OW8vgqordtsm4yLHa4EnOlLQ6dE8LZUJQBBOxK6hBfJvqu7iTt+B
	U8QtHA/5O5bvuVP8Ri2fD8bOPIvRUUCLPq0Mde2H2ZPLhduLl+sXZWS9jDeDDBCZa8LM7DoQjWY
	3sbzaI2Rqt/8Wh2Xqk0Ga6Qgvxe3PqtiS1OJJRxKkzsX7mvgGvlUnvodavZXGtopcjdwb9QhpRM
	g=
X-Google-Smtp-Source: AGHT+IGWw068vvXp3+yEPF8FPf8vG5yufFWpaOywJh8DgaLYGGbghT8z+gqFAOziW+6BeSzW7/P0rw==
X-Received: by 2002:a17:90b:584d:b0:311:c939:c859 with SMTP id 98e67ed59e1d1-313af28d147mr4395082a91.30.1749641337938;
        Wed, 11 Jun 2025 04:28:57 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b1fee63asm1082246a91.3.2025.06.11.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:28:57 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v8 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Wed, 11 Jun 2025 19:26:48 +0800
Message-Id: <20250611112650.595554-1-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_042859_389425_672E47AC 
X-CRM114-Status: GOOD (  11.89  )
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

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
Signed-off-by: Jason Hsu <jasonhell19@gmail.com>

Jason Hsu (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1481 +++++++++++++++++
 3 files changed, 1483 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

--
2.34.1


