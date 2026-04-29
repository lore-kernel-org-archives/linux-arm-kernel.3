Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03078FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=; b=NepyOFEoZuXj8jWMY1PNJDKH16
	pBVBv+3jY31fgFzaRm5CZjBDUIklXdC7BBux5qZ2Fjq80xlaF8Vj2q5hS3KegIK1nO+LD7EwtbfI5
	WUZcOYbvI2s/f9mlRiqKkYxC1OK1hcUj3NmYxRGUR/6j+rkwywd4vBNXhfzwigBbGf68bKH/ZmeVt
	udCJ2bU2b7Xu46rG4fId7Pg7L0HdiBauEetM3ACI2ySK6EPth1lFBSYs2HGghNgoAuxm39CWLS03t
	MZJaKs5QzBlBmlnLyuyCiej4VgmKVlWbV6M468yFhVVBf+gYss1FFOdqVO8gQkpTTAuD+BLQc59hB
	UkiPqFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuO-000000036I7-2Ys8;
	Wed, 29 Apr 2026 07:00:32 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuI-000000036Aq-01uN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so5699436b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446025; x=1778050825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=LB/892Ga3L4yzc1K1BR8eKlf156KaAaemU8XBppsluWiht6iWH3yuuXFtKI+0ckR21
         xMLmY+aYoKI1osiu7UrSajyMNQY/Y9CvGkdIXGAI1GeEP0cJj2MwMacTZaJJPJUa5HFf
         WXEebHP95CE1irO2oGRFDx7k5n1rMSsYc+KRYs0AcofCJAz5zqLQ1kQRoxQV4XpgVJo+
         f6p1WHTw1IGd9JmYvnHe0KX0bOhRymvCH5HuNtyX23V4WYgM15vpdPDbz1YIloqtHiiU
         s2rESb5hWIQDfFona/6hwmJy3Cf46YIvOCDK3HhpBKR+UQxK5CMoedxNtFcHhZ29WQpi
         /1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446025; x=1778050825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=FMwBAnxrIBH3pnVAWAy/9tCgdW9Ctnnkpj0vblcC47S1KcSRcFBUJ4FrKv8cw4WuRj
         CZwlgcnX1TgGDkzX84oKd0N5XXxmt3OTowljXkX9c5q0c+YzNIgEwyJwTnwE7dl20FTl
         /oHdcnUrUATn0ah8NpnuECex51gL0872F40dd6YcHK3OZ/5JXgblYu78ERcgJAUa3Xu8
         E1AcCTr17NQMmwvkBCsjm2MAgFwDMfBxxdREKhiJx/3bketDUPhfPc2ZsWuW53uwp0nD
         vDwSj8gzDbtYjwQ+4ODF6EBO0ki3Z38NMfEyVDjYiA/zEIS7jR4OI/ZDCaAyC3Ug1k/r
         QSWA==
X-Forwarded-Encrypted: i=1; AFNElJ9sm9fLWy1+9UByoTfuqSNLeBY/ZBiTLrxC/hKafzcM5eh6EaKpcrxhrAgsbhKTP6UxT+AtZ6O58NayTfcflgON@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCctq28FxhsH4zQN333hl1RfJI6v2nfKqw5+gF67/dBZQn2Ui
	7lL3uqJrGHLRGgJc7tlkscX/WHXo7HYHavo/ZOjZtVP6GB4jy72SxSaj
X-Gm-Gg: AeBDieswgCqn3noNKwhJdh7Z+rudgefSdHWDFksX00m5J7jsbB+SCnD01Z/tjUNkUg0
	/yleI7VXr6DPORBaOITrvA7bTLyRAFm62iM+vuo6ti2cY57DQoUyc7OLkoHQUCXc/PXQ3FxdKw0
	G+CNyudg3UDhL5J9ZuV6bEtgj9PnHy8nHspBkz/qhgiZx81jjm/bPw6xIkWqly5gaR1h/iGUalp
	4hx2M7kLhPeJnmtb7CvsONynQWtDer8Nkrm4WZ6CRvbh5hAyo18A9aaOA4xoEhJh6lMGpYMPJz/
	W9IqWv0EeZ+vuazMPhWIQqeFesbd2UXYYJPR61w4cX/FtMPsqAALUmj90jVs7UaxKBKCZR7Y6qs
	WsGAbDKXBJq+2oQYVMwGv3+nIN2e0snSFY6VNOrGiCRunr8VVJdJ2OqVBbsr2HSg54AF+AcuyC0
	cZk0l7NXECCejp/9M4aZExhNlgYPgh4Ddq70/2n8W6N9PDTOFF
X-Received: by 2002:aa7:88c9:0:b0:82f:b519:a5cb with SMTP id d2e1a72fcca58-834ddc50c40mr6750211b3a.37.1777446022861;
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 10/11] loongarch: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:30 +0800
Message-ID: <20260429065831.1510858-11-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_000026_088604_566E2305 
X-CRM114-Status: GOOD (  11.33  )
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

Apply the same no-dump reserved memory filtering to LoongArch kdump as
was done for arm64. Use of_reserved_mem_exclude_no_dump() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..742fb9affcb9 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


