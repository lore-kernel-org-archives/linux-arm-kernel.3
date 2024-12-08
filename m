Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAF2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=; b=wrJnwwmhgaJXlh1MuYYN3spdgZ
	RjwGQpKu7Vpf7oJh/bR34r7ICF41wyk5NAuMmerq0dvOikUa0dKMSNFoAhyEXOqWE+uwoSrH+anyh
	SWTOT92hpSGDh7hvyf60HDsqFEdHvmQUXuEk6F9rZfaYoO0Og6kkgZpOcDtKVOthqjKeMwFvEg08x
	TRyt+FTc7myYqT6tc5bShtW6vB1zFTvBAXGCTPSZgNNFliwxL3g3C0O0T/Idcvz+UUXZJyqciOiHg
	v2tzSjgHNbshED/P1jvoXIcc2p3OhhARdab3jU/XI2karbQ7z2odcRiWq9vpiDntHmkvpXgaIcQC0
	Q+gUNxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIta-00000005QJx-0SKS;
	Sun, 08 Dec 2024 15:08:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsW-00000005Q3v-1TXC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21561af95c3so29759135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670443; x=1734275243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=PcCKFOmcHdbLKwex7LqFkmlJgr6GrmZ+atzeNvDWpFztHDNvPJXdCV5jQk1Hpw+Ytj
         kBCIxyRX57FMkJzSiSOKV1BWeTi+jNlDSmnTU2OJjF4l0kTekEic4F33jTx6wC4N98eC
         +Q2yfO5886yzrteK68854vyGU60410+mzmqKRYtkeY62TxMvNn9/zdIinT292Hz5GiOc
         0faFy6ay+ncfMQ0JOQ3UB0eCUoDsJn0rNBG2BYXVC8sOh84xfq5VrGdzSCjwMg+f7f5X
         1DgRz8fp/aqbRN+G4Be6vuhZhN7IoG3zHOPS48tqbiAquSqRsEY+jx61ffk3LZVKB7vF
         lfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670443; x=1734275243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=WBaaGXSpBQxrA7LDuK0JPEV+OJRyLJLpx6R6NY+WeJfIw9nR+PnKHvbTK4oSAJIYGD
         T4lom03byV5CnO/1uJ3g9MoL7NnzL7IONjw0wSv8YnA9vhuL05co712dM0vF9LXBdSaJ
         UuuXmIzUGjdld3CP1qfThIjKIPPNOza1zFguLE7S33OzNwN66zS8A/WFIvEOQnHhddX6
         2qmpcwqRhtFPJV9tX9yPzGdXdmyid6yec7hWKRCm2BOA3GKzW1SHkd6slQzhxQuuB7CA
         zLO7/w/D1B1iKoHc97DOQeDDGRyiDKM/FBy74REy6VZMAYCJR6/4+lIq9vriMpJ3dH60
         RkkA==
X-Forwarded-Encrypted: i=1; AJvYcCUsNIRU0EXuuaHziPobCdl9A5VMcoYE1Wb/g/ps9DgxzNteDp+dYn2kCLAC63N5iknYPpBvQC+vCrJTBoKfK55k@lists.infradead.org
X-Gm-Message-State: AOJu0YztYpD7q1irdjqkZylyU9GvRzYjqEBmkpFkNdeL9XC+oNMaColh
	O7l3BA4QFzDOOluIDlW9L6o0KMrmtAe8fok891Q74cPkiAJTNfAWkuEc8b8SbLi/23yd7rKegDA
	P
X-Gm-Gg: ASbGnctauO4zS7zXnoL6w3SNrRiGO7K6tmJA92S59+FlGkWYUjk0twErR8wVtHVsPhl
	49R0jhcx8KV0WNlsd0CKa9OXSkxnMpOkQsQsDgiokgtSYQ4PX+8ri+o+yxgMA/BmwltLhcx/rYl
	UNHJjKGse8XMRBxjLYjITsqNDgrPOvixD8D2+QpuZYAnsQ3JpL6DbkBI9nC1yLDdgyHqETNYxD5
	jbn/5WaBri1mPxleOM3h0XF88x5MaUQP9reUHK6ghYolVvPMFrPOyNSWwHKu+AFVqy30Qc/huFL
	/T03DgFxrLEislU=
X-Google-Smtp-Source: AGHT+IHVg6kIJU/hjxCaltB8c3VofoPFS72J5bvbHqE3/3XeAkWqN7rWQDnyGstJdvLaD8pQZcM2/w==
X-Received: by 2002:a17:903:24e:b0:215:9d29:9724 with SMTP id d9443c01a7336-21614dc51d0mr152817175ad.38.1733670442680;
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] Move RISC-V IMSIC driver to the common MSI lib
Date: Sun,  8 Dec 2024 20:37:07 +0530
Message-ID: <20241208150711.297624-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070724_394769_8A063386 
X-CRM114-Status: UNSURE (   9.58  )
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

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving RISC-V IMSIC driver to the common MSI lib.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib

These patches can also be found in the riscv_imsic_imp_v1 branch at:
https://github.com/avpatel/linux.git

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (1):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 155 ++++++---------------
 drivers/irqchip/irq-riscv-imsic-state.c    |  27 +++-
 include/linux/msi.h                        |  11 ++
 10 files changed, 87 insertions(+), 130 deletions(-)

-- 
2.43.0


