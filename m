Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234F9FC6160
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=; b=KIATsxxID7tNzr9E7IlBEk60La
	OUljzjy4fqXxZQ2D6HtgMzZkdlt3u4QoKghSld7hX0u4XfXBSj+yz4qjw4iH2W/U5bMPAOyCqfdqT
	+qyP1o6uXT0IbanRjvBE2+6HkOW86yj56vnjZV8AppZjGfix6Ui69tF2yL+dLKULSX7HnSIoLrEeR
	9DiU9sfTL26Cvk830Qi4gAk6AnWFGY10dV93VeNxlF6rlcpTsWcvP+yNfzlglozVmVGMaahFmo3SF
	mEbtiRd/9AkLyEDaf3lvb2yUAHT75JNCNZIXZv4lMCstv2/OGVJLJsgqgjJQtKtj2KQDWpJBXiDzw
	P5ZQYqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIh-000000097C8-2tmP;
	Sat, 03 Jan 2026 08:47:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIf-000000097AO-1oo1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7f651586be1so232616b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430072; x=1768034872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=TPOodpDcFF/Yxpb9UJ6vwKjVIVG/cl5BGnqITcFBfeHsGIPEELgBx/egraNyFpOfcQ
         CV5Add7uUQyxBkICRgRhLmUy5AziTCl6YkxtSdo5hVwScsc2vjtRrvOHqBsp7/JOx3Xs
         Z7DU940dXqzfuV3N7AhO2VAO7I6Mz7qtIfzBsoZ5GoW/pO9y5/rZaWzQUQUKmicjCwz9
         GA3rZmeA4ewpw8KRe2VwchvLci2dNHt49GpzC10BwQEbJDgYdamcvyzKZwBewA3QmeOW
         QHI8T/V+aNsCiZ3ts3a0dXA4JYnZgIr3plkRdE5X9aezJZ8oSH92VKCy8sKahJiJL3TC
         Asbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430072; x=1768034872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=qOniVDRpjDg4kjfMd5aVOuv6T2NIsXDLC3R4cw53xHMceSebi5NGEzWBnXcdfkTvpp
         +9zP4oBqMRKFCKSTRLZWcSXTIBog+7O16Qq+0MztMSGiSeVZf9CA5SjyBGp7gh3rm5I/
         McmeEBxQxfklFHmg2ViY2Qewp2ZALWM3d6WCvp8Ldc0TlEGl9r80kHLNNuWYELDXACfQ
         fSG1BQq37eP2cMDXLqOadPQyGV/Nx2I/piskl536e+ogEItEbzM3J9nKZvSiDxMiB7es
         3muNrt81MdoJ5NyVRXgsaatzOU3aMLqPq2YEfoPg+UKLm0xAA1u/lPof0JrNKFjMOE+g
         AGxA==
X-Forwarded-Encrypted: i=1; AJvYcCVi2bZqnyBXtylEvgGJmPxYEHwPDot0LBuUC9fE7VJ8SBcCLgZZPZTWm0VCAOHqBLH5ddnFJsbAvXrsJ7LChjqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJoA9K11YHb/VSiCGw5Kf6P4r46ELwZ09/1TiuEoIXQ1p6jFml
	XqyTMXbGBQHJ4k2Fk61jX51zSIspj4YTqmS+YNcebvsoq9bylm8hhV8/
X-Gm-Gg: AY/fxX6HGQhQZknSHHoEtRyrL0mQgj5h/ciDnXO1Ix844BSWM+1/YjTOt0DlZlX13L+
	7g4LIrj+5SWzXcAEiQX0tgVDYr7+tMHJMu4hGRZX88+MOaTh7GDq0nQQDhlUF9Gw0pZl8h27vIV
	+x7TK0zs3SqIaoUGUpgtuljrLrbSY900o07vD0ZuBCRL/IErY0DoN6mZJmeqMqoVxP5beJ9QYTO
	x9ABL3BK0C25oJcDNQ/Y3EVwxdBu6oqR1esTjUlrgK0Ml2W5pwyUNJuu2g7fq+Oc+BR2QMz+k5W
	B7IbMm7unUY+tZHu1JnkIuMNZqBvUh+I9YeXyrspgY8jnYa0fB7ZXOw2gn/JggvjMiqjCcu+xn9
	SC1Oz0vgCqt5TccNftBqGSvqvjQVdd8ZAkaikvYTlSdZyY5torZTJ7HgNRudB/B9WWCYLONWCU4
	ookEO8/WVKF2ULE5FiF4Oh28a+0B41Zt+s/r0=
X-Google-Smtp-Source: AGHT+IEE/qkOzQdehsR4JxutS5UUMjtZZSX5KqQIX0KxALxL/oRTRg+GqK0LQ65hB9xD4RLyoqIiJw==
X-Received: by 2002:a05:6a00:1f04:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-8148b5212bdmr1895799b3a.27.1767430072502;
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 1/5] riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:39 +0800
Message-ID: <20260103084243.195125-2-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004753_466852_D6F0CB84 
X-CRM114-Status: GOOD (  11.14  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/riscv/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index cc15f7ca6cc1..f0d0691a8688 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -165,7 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
 	/* Initialize the slot */
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
 	unsigned long start = (unsigned long)dst;
 
@@ -178,5 +178,5 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	}
 
 	flush_icache_range(start, start + len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
-- 
2.43.0


