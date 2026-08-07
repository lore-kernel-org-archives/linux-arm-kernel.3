Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139E5C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=; b=0Ve4jD7JmDonfAnYMCUOc44z2H
	218cR92pbAdjggfxGpLq4BdKQ30YpzXQrEnVnWYNxNApoUBX98zQv+G9n35TRf6v3hEm7mKOei8fp
	QgNF8kc4wIWzUV5xdaXpBqIAmmepepdMaB7ZSd7uRHZCV6SgNekH+10QC89sRxRpK5TbBgObi2SoM
	G5SNDr0hvJwBROzO4VnVguJ1e8zQIF9LIPU7SAwK+QdmOmnB3/JgK5r2D1pw0XwHjxJtPAmtTuw+2
	vH+wRsH6ZLuj3M6KXT/WQ+0q1xvxY+ZY1/ZdAunRE264e+pDaSbp/Hp15eK/sQ9M6UJkXvM5l/33y
	9WWGeFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCY-00000007G6f-1iWM;
	Fri, 07 Aug 2026 07:41:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCW-00000007G3K-2ZPl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fde295992so1464418f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088467; x=1786693267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=H7GROwV0A1V71D3py6rvPabYfOhzoSEoXOrCfPzVFlJ6HWgQXNSbPfV6pmS1t6a4Nk
         NIm60D9CDqR+A03VtlEVtIsPd3mIcJD5V72FeDJdqrUBFhsqtI1oF9pFFCauIieAjgsV
         OND4CVZaofQJZiwtcXMxC+Jzbkw7SntA4iV4DXA+vH/EeUULqYcCa9F0xHV3zoVQLFtz
         Tx4vkFmJk+e/sch8SzVGu/Yl6SANRq9dUuUey4/6p22PAlk2WqYKW1txrVT0GGz84+Ua
         C1MsEsvFOkeNucxDs2/7XXRzKyRQwGgjeGa7Uuxb5TtgYm1ZddAVY2qtrpwZXt0DXkl3
         peNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088467; x=1786693267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=I2L1dA0V7clQB2oLQPReDRU8VDQEqD7QFDk21X9m+1K5IlSF9e+m7wpr6DQk4e0XeP
         I+n5qRsZeLsoDEGV/adxaCIMqS3xzgATptrF+PAvNSDhW/A/+Ccr4inlD1CWta6LQ3yI
         ZAvH5h5QPtIzHSit2Eaxd/BbFKyT/kwGlnjIf+SbvTRb1UHkAsm6s7NivUejw8obMAcD
         Smt0VkWqTjlm8xIfXGENN6epama6MFdiKfJoBJ88Z6/9c4oo9Hw8szg0bZo27uXvD9tj
         NfRAsld4TpkjRx/lbrmoEWmqtKFe1pQFP2U/+vu35b3M4xGqUCwSkWcaFOsThfowY6IS
         g8Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rpch6IBh12knWGkWNDw3MZB9tV1AOxR75OLgOSRZr4DyZD7zybLhIsM+ly3rzubTfJq/YwPQFgGv09CCbuxpC/d@lists.infradead.org
X-Gm-Message-State: AOJu0YyfFTr9DzT1epzoU0itT+vidFU5ZHx/1AO/wpe0XHWNRAhINm1p
	fS1dBd/sUUaAR2G0SbsOP57OFP2uMK9N4/2wazwPAKXXrolALgm1Nm4zxX0vYAjMKaYN
X-Gm-Gg: AR+sD13bLAej+OucksRw2QYbT69vmFH7dBW2pJNhQd07nYF815sVfIFkXb49nEeEFHM
	zglhDFm6MLdVd4cOo9IG2esWjheNBDExtgev4wbXBFLrvtcKN4OX4sbM5Yk4t4ZpVjR4Btn2O+B
	tPMzOxJNty/bmMIOlBNB5ILNTEGM94LFK6iPWUxmIU3OR1Yv4hGVu4BZgF8mDobyWlmSUtrqGxc
	erbW+B0x0X0VzQmetZhgIzwWiv67240+2/8mOo5zl5vaUFxTCrYK5gTir6sXH/Zpan8ruytWg9u
	LCcabXFlPWwbTxjAXYm5oYLUwHMkmGw6Suq9jo250BHT7iqdTG5tZQ3UBULGPM7rbEHi2gjPpoQ
	YCwd5pZiA4xuVQTPpLX5JJ6p3p6L/Gy77ACOT6QlOJIoXr/vUieIHxIWEinAW+/65QjxCaVKtY4
	V5x7XOm3uMVKEC3y1VfUziUWs5Bc0l/0LXefy7mQLGH/qSpmHNwElxzLh06ZhzHzM=
X-Received: by 2002:a05:6000:2913:b0:47f:ecbb:55fa with SMTP id ffacd0b85a97d-47ff4bc1a11mr16115409f8f.5.1786088467028;
        Fri, 07 Aug 2026 00:41:07 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:06 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 5/6] virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h
Date: Fri,  7 Aug 2026 08:39:32 +0100
Message-ID: <db869ed90e16691ea1f0aee051e54daf89f42de8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004108_681339_ED8F0B0D 
X-CRM114-Status: GOOD (  14.90  )
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

The IPC shared-memory hypercall ID was passed as a parameter through each
architecture's bao_ipcshmem_hypercall() and defined locally in ipcshmem.c.
Define it once in include/linux/bao.h, next to the Remote I/O hypercall
ID, and reference it directly from the arch helpers. As there is only one
IPC hypercall, this also lets bao_ipcshmem_hypercall() drop its
hypercall_id parameter.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Rewrite the commit message to explain why the ID is consolidated and to
  describe the bao_ipcshmem_hypercall() parameter removal it performs
  (Greg KH).
- The helper now takes a single argument and fits on one line; unwrap the
  remaining few-char line wraps (Andrew Jones).

 arch/arm/include/asm/bao.h           | 5 ++---
 arch/arm64/include/asm/bao.h         | 5 ++---
 arch/riscv/include/asm/bao.h         | 6 ++----
 drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
 include/linux/bao.h                  | 3 +++
 5 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
index eca258cc94e3..a7d608493723 100644
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
index 1dc09a2c261b..5bd2a8c9905d 100644
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
index 6dc0cb13c94c..a587a6abd54e 100644
--- a/arch/riscv/include/asm/bao.h
+++ b/arch/riscv/include/asm/bao.h
@@ -26,13 +26,11 @@
  */
 #define BAO_SBI_EXT_ID 0x08000ba0
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
-			0);
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id, 0, 0, 0, 0, 0);
 
 	return ret.error;
 }
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
index 0d46d89ee788..5bf37c1c7933 100644
--- a/drivers/virt/bao/ipcshmem/ipcshmem.c
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -14,9 +14,6 @@
 
 #define BAO_IPCSHMEM_NAME_LEN 16
 
-/* IPC through shared-memory hypercall ID */
-#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
-
 struct bao_ipcshmem {
 	struct miscdevice miscdev;
 	u32 id;
@@ -104,7 +101,7 @@ static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
 	*ppos += count;
 
 	/* Notify Bao hypervisor */
-	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
+	bao_ipcshmem_hypercall(bao->id);
 
 	return count;
 }
diff --git a/include/linux/bao.h b/include/linux/bao.h
index 076f071086b6..17d6ea472521 100644
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


