Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0200ECFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=; b=Io5zETOJpmqS2S4byLHtpmjstz
	/T2RUrSl3SkVQVrOA8LQRyK6YmWC47XGb8x/3Nz9pk6gz+bhFUnZEs2tobAptXxzNzorUy7niHBXO
	8IpqMRhPKXxD0lUD8l35saEH16VFWAf7jS6oq3CYv08ordlu6+pkABusRPtEwM5YdrUr/bWAQr/Cc
	ctgcyQu7kXvPV5VY7TrFuLAOHh4CvbqxezUh6d3XlvI6lDQ8xHpoYzXE+8pqRtW/SJMVoWMDJfB1M
	uAiu6yMvBgWgadCpMQJReSiTeBE8FLrNO0HPsDDy1o5yPQyJ+xw9l8WS8ZoJldWeTjrEHltiUXTTQ
	oU/VAAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPy-0000000FHzy-05Wk;
	Wed, 07 Jan 2026 16:29:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPp-0000000FHt9-0ezv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1953023f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803383; x=1768408183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=2PNH5mizUW7AklaO/ySxsQAPCWnqy4RHgaX6TICaxFgfCNJ8hQzYu6Ori0KsGnwJ+B
         oWHvBaPHZPnwMii31t0+A53HCTzDxzud7gpG7WPb5yal4Lff7xPjPPvGgNq4OSzamR5+
         rBmIQv8mQMhotO0lsucbTjftQ5Tzs7BVFITE/8X/GQdDLyiEFg9r6NHFSAXuyl1lIFgz
         k3RRK9Ez9iMQJMTU7ynualng8MoTzfqZeR0/CQTulFWPR4q9Q2y0avqYi3CbjsWGkVHI
         ClpcZ1gFSJ93PRdyFvKswhBQi+8xTrWRMII9+I6aXzUrDM3S5outGrSYiU4BAtwzt6zp
         gcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803383; x=1768408183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=Yh+XJoLTYOo95ehR+IxmUUVwBV2r19/X6KYTAV9DX8+zj7qO8YEMMQj3M4grK7XAzg
         LBVn0JXkkxbA6dmAuIor2E2i5qgPNDvJoSjqD2KtJtWsoVux80CYV/YNXhjJKJanh0X5
         4849Nt2BTjKXIxZJBLkr3JGTgrq1oX4MoCZzl7BJQGRYJ8Es8lkrYRj6+FQk3bBRTduw
         4embH/nGQKs/mFfvNlyFZJiBsUopCAUjL/Hip2YFsG64q60bZmEfp9yfrZTFOQYadA4n
         I+lIYLuNZf58Gyfn07a2utsoHFVSHEstBvSRPDKHUsMyLGTDRmei1z3m1alQTunxnWg/
         WB9A==
X-Forwarded-Encrypted: i=1; AJvYcCXg43XHIVjXOQxvQr4dMGodI6Y85Bryg2bE0TgndskqUrTa01GFv1a5Cr1JLeSG54f/uwOTML3S8sDPLtYv9kEe@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFk4eI/kH7F6MNukvlaBP2ttCehlCoAJRc7aqbYY1DFfwc39e
	yzZZCSD7JuzXaW9bT/Mgn1D6gNoUhpzauAnuXQ6fQnGKldYcD4WYt8xlM2UWy24Hv5od
X-Gm-Gg: AY/fxX5LwlLjY+Qkbu527GLdBCFjoWKzB1DwXKw7rHRnW9E/c++AQ1G0vssQDH2HIaJ
	HZI08Frag1HHNgnCk3BLWSvNz3oyrXwYU/ZA6hsgb9fJlTLxkmsk/KkXdKqVXrws5w/EfdqFtVj
	rkR/+/G4UiNgEyodVGI7/mjCZsBAFJxOeeYD2/OjeksPCMN4mfZTYLeTXHpyJngtW5QbD82p/p9
	udjpYXaJXT0aDyReY77ZmHZPGML299vcLfTOboBIic2XGvgauNZ0LM8KpDfrumRNFfxAWO40ASe
	v9jAb0d6czpeY2koIJV/dSMAip/mFUDlv/2WHGCPUMGnKG3Fc/W8pU4py3+8U3MOtOAk5Cl/O9z
	rZasJATMMugQZNMqR30ofiHwd0AKCYAs2AxkDvwZcXUM4CQ+YF0a5YjAlcC3dzFVdu/3xuWkZgs
	HYQUZ82GLDH+ugsDxo+g==
X-Google-Smtp-Source: AGHT+IHYX8ERrMEjplERjC6ixgzkBNgkXhYStxw+rahyUBYDlRtMCSfk+AGXhNnNExJ8kz9EYuCSDQ==
X-Received: by 2002:adf:f4c9:0:b0:431:907:f324 with SMTP id ffacd0b85a97d-432c38d2312mr3237384f8f.61.1767803383134;
        Wed, 07 Jan 2026 08:29:43 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:42 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
Date: Wed,  7 Jan 2026 16:28:28 +0000
Message-ID: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082945_227878_D477DD74 
X-CRM114-Status: GOOD (  12.18  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

Move the IPC shared-memory hypercall ID from architecture-specific
headers into include/linux/bao.h.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 arch/arm/include/asm/bao.h           | 5 ++---
 arch/arm64/include/asm/bao.h         | 5 ++---
 arch/riscv/include/asm/bao.h         | 7 +++----
 drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
 include/linux/bao.h                  | 3 +++
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
index 5ece9ecb1455..7d13591fe669 100644
--- a/arch/arm/include/asm/bao.h
+++ b/arch/arm/include/asm/bao.h
@@ -16,14 +16,13 @@
 #include <linux/arm-smccc.h>
 #include <linux/bao.h>
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct arm_smccc_res res;
 
 	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
 					 ARM_SMCCC_OWNER_VENDOR_HYP,
-					 hypercall_id),
+					 BAO_IPCSHMEM_HYPERCALL_ID),
 		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
 
 	return res.a0;
diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
index c7b7ec60c042..409f4058d56e 100644
--- a/arch/arm64/include/asm/bao.h
+++ b/arch/arm64/include/asm/bao.h
@@ -16,14 +16,13 @@
 #include <linux/arm-smccc.h>
 #include <linux/bao.h>
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct arm_smccc_res res;
 
 	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
 					 ARM_SMCCC_OWNER_VENDOR_HYP,
-					 hypercall_id),
+					 BAO_IPCSHMEM_HYPERCALL_ID),
 		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
 
 	return res.a0;
diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
index f04e6cd33fa9..d168aba7d8ec 100644
--- a/arch/riscv/include/asm/bao.h
+++ b/arch/riscv/include/asm/bao.h
@@ -18,13 +18,12 @@
 
 #define BAO_SBI_EXT_ID 0x08000ba0
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
-			0);
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id,
+			0, 0, 0, 0, 0);
 
 	return ret.error;
 }
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
index f3892d41248c..593e89cb76bd 100644
--- a/drivers/virt/bao/ipcshmem/ipcshmem.c
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -14,9 +14,6 @@
 
 #define BAO_IPCSHMEM_NAME_LEN 16
 
-/* IPC through shared-memory hypercall ID */
-#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
-
 struct bao_ipcshmem {
 	struct miscdevice miscdev;
 	int id;
@@ -90,7 +87,7 @@ static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
 	*ppos += count;
 
 	/* Notify Bao hypervisor */
-	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
+	bao_ipcshmem_hypercall(bao->id);
 
 	return count;
 }
diff --git a/include/linux/bao.h b/include/linux/bao.h
index 5b06d2a17d21..b29830374788 100644
--- a/include/linux/bao.h
+++ b/include/linux/bao.h
@@ -15,6 +15,9 @@
 
 #include <linux/types.h>
 
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
 /* Remote I/O Hypercall ID */
 #define BAO_REMIO_HYPERCALL_ID 0x2
 
-- 
2.43.0


