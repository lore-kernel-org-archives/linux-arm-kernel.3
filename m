Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACFCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WHMuCKDp3YbDDMvuKoLEQaGreX8W6rFv5szF7QtOh38=; b=el34nX3RmbL2G4St43aCCwi77o
	xqAzaghL0GHf6K5EvpWa9TfORBlE/l8MJ8mwBvnDRoWD9wigkLNRUt7/SpADjuAfeJpo6Xow0u8mV
	bGVif7kASvYTN2Zr9V1ULaJzKgeXBnc9JzxlpqeHViHCcUw4HnUVO8uW0iUiR2tOTQkxCWpOc4Ksn
	YOvIJ44kY/RqTccWtK0jgMIFulj0I0hg9Uz13LACqgeOs/liHZYRrwb/djPh/YSKFUNbB3zrh2ktI
	Ojx/ZGYn1NQdRqELL2DjhaZ+fFul7pJGPTQG9SrJxm5Bx1FqF2cvrhiHn2bajmTtCgAxGoZ+ANgvg
	3KvJ4x1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfuq-00000008rYF-0jeA;
	Thu, 25 Jun 2026 08:58:32 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfun-00000008rXp-3Ujy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:58:31 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7dbcb505578so23321497b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377908; x=1782982708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHMuCKDp3YbDDMvuKoLEQaGreX8W6rFv5szF7QtOh38=;
        b=Gr3Ny/OnGOXVS+AvM+yh3GMe0Ebxlq+4O2tPlW+NcMicEEff/dXJcjGbeUZPnMnnkj
         +4t+jAY/eQb0jxuJ5BBG5MURRySA8Xt4HrygLsXWrgspVFUv14ru8zkG3bcLRjy8hmrf
         GAOv1AaZY5PErX7DxUmNLUXU83BOiqGmOSfNLnt/ZGrGU1NJ5SK38zPsiSfr1PfSyhnT
         uSisu7S1IIB/oXyp7UENrhZYiETjq0TjyKwNAPuMgkAhUWw6gZuzcVUS5tUipqLfFFMZ
         G1uWdIxRjJGDgt078F3591A5WZmkZ5vUYRVzj68YIf2v6Dy6y91HNyA/xM+jSovsrHTa
         AgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377908; x=1782982708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHMuCKDp3YbDDMvuKoLEQaGreX8W6rFv5szF7QtOh38=;
        b=EJehIbU5wDaxY88RiSNGbLcHo7/PQcURKVKc55+/WQkyPud1bM+WiEvb/vEp0qyuvm
         VRS2nlIbE+KSKSMWt2+A0hTHxgzK3QQOKtJyn+aA6mPlrd/HXYj+stUpswPmNOwonpLF
         FXYeIxW/V9nZiK8j0fqBlGkppbdu22kov8EJy/w/eM58TEGsnVV3w0NHwlEzZ8HURLlR
         cbbvDxUWt90jY26pskG/+bDpkSpJN4IgQG/u999RH3dYMvIX7yb6wxgqjLaV+GftMK0K
         ZuLz/tuntdHpZuy5uDSA4Uj21L25MSB9f55F1hmagZ6wb3+R/sXNXOtT5L89PxG4Oa0b
         4MKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0p6KGxXvP1S338nI8Bkl4PkEUU73+p90/ehZKsEJcZEJfYLbsHh5j7Y5bG0uRIuGdG+o/HNaz4GXt13Y5yPgR@lists.infradead.org
X-Gm-Message-State: AOJu0YzZRhImJX36N7agG8X3LZqBAf3YRUyXdW6ZHVFyG07Ahi+xukUP
	iLRx7l3OzWFoSd5JMwaET5v22nCoLjAEplphW7YzxVcoH1x9CqVx+2fg
X-Gm-Gg: AfdE7cmm+Y7+KmwfvDF/DwJ54OBClGkzTgehYZeF6P/0YAjgjXtNnfWV4ypL9bKRHcP
	XPk4g4xLqwKP5w3RDxXiTIJSSSzIR31CMZjIE1v2EekCtdalXSefsXAyN5IyybhL35R6DdxwHji
	EtnociyqDiR7w/Gn4PcwJpfQXAeE5uaiMyPLokZ6ukRqPTzpmUvRkIA/ToDZcYaXHkPATnOxyAP
	U+Yz8cf+Mqwro+1dtG/lRLbsdFquO6h9n635X178M7mXhP7tU0hssIASnjNkOQYa/7qs0yVqQ5R
	goMGRO46vRDLCfdRZbgujHyoSzynLLgazJcJ4ZDfiCa4IjSOZcp740YNI3s/N4jw8UqQLcQRXeL
	fFu5mCuXUAmJfXbIRxItANweTjxD7ai9/NF+o0HRf9cI1sje/nrv3fhod0q7kcKmkShTV0wjJ5N
	I8FjT2wyzFrDAcC9c8O6id2cDXzg==
X-Received: by 2002:a05:690e:168b:b0:662:a4ee:104b with SMTP id 956f58d0204a3-664882bb9bdmr1048451d50.48.1782377908381;
        Thu, 25 Jun 2026 01:58:28 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f917b1csm1059566d50.13.2026.06.25.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:58:27 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sh@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] char: mem: keep arch range checks overflow-safe
Date: Thu, 25 Jun 2026 10:58:00 +0200
Message-ID: <20260625085800.4505-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_015829_878472_694CA348 
X-CRM114-Status: GOOD (  13.47  )
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

The generic /dev/mem physical range check now avoids validating
addr + size directly, but ARM and SH provide their own
valid_phys_addr_range() implementations with the same wrapped-addition
pattern.

Use subtraction-based upper-bound checks in those overrides as well. Also
make the ARM mmap pfn check avoid overflowing the pfn plus page-count
expression.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 arch/arm/mm/mmap.c | 9 +++++++--
 arch/sh/mm/mmap.c  | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c2..7467ce8cd 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -150,9 +150,11 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
  */
 int valid_phys_addr_range(phys_addr_t addr, size_t size)
 {
+	phys_addr_t end = __pa(high_memory - 1) + 1;
+
 	if (addr < PHYS_OFFSET)
 		return 0;
-	if (addr + size > __pa(high_memory - 1) + 1)
+	if (addr > end || size > end - addr)
 		return 0;
 
 	return 1;
@@ -163,5 +165,8 @@ int valid_phys_addr_range(phys_addr_t addr, size_t size)
  */
 int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 {
-	return (pfn + (size >> PAGE_SHIFT)) <= (1 + (PHYS_MASK >> PAGE_SHIFT));
+	unsigned long max_pfn = 1 + (PHYS_MASK >> PAGE_SHIFT);
+	unsigned long pages = size >> PAGE_SHIFT;
+
+	return pfn <= max_pfn && pages <= max_pfn - pfn;
 }
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index c442734d9..ba7aade46 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -170,9 +170,11 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
  */
 int valid_phys_addr_range(phys_addr_t addr, size_t count)
 {
+	phys_addr_t end = __pa(high_memory);
+
 	if (addr < __MEMORY_START)
 		return 0;
-	if (addr + count > __pa(high_memory))
+	if (addr > end || count > end - addr)
 		return 0;
 
 	return 1;
-- 
2.54.0


