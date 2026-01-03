Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A99DFC6171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=; b=MdQw/AbD9ME1IggQbn3dNuMiRP
	5htYN/XQOfupRX8IKvEUT2aGg8+rc6oYoQBiyEVlDYi9QOPTQQ4h+3AJJYxQYX8ELIsOJkLtD/wWH
	wWRuSgA7njsHPk2jolIxiMPQTsN+nTjpC3Gpwo74oTjtTPMxm8B6k1w/OGmvKv/0eW1f65gPdi3c9
	YzW3+lDfAZGHsyAGSj/TjvbIOj8hXdZOBE3CK9ePaxIQZyzsFAA5akguWz3+oVQ3Png0yYAtKu2dM
	/PS/woBhCgC5zGVdp9bzJaagKAIHgL5qaTuKsFaxDg7Bn4hkG0qh4dolAgTrdQpKurTCWgMZVtiEb
	zEEOdj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIy-000000097LP-21Ey;
	Sat, 03 Jan 2026 08:48:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIu-000000097Gi-1g6T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7f651586be1so232661b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430087; x=1768034887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=D+XAV7YN6cVLQzR2LSH1tl+GP8pYDh09oIJm8nsybzEEfLg1O9XZcrsuUr3pZ4XClU
         D47CcN2xcG8zGdHqsN51MEgbQh3PaWVSGcC5FgIOFXQg6RtQ99cg3plfGoBW2yekHaN4
         c4shuL4CEhL6RPmyR4v50doPU/O3bYUVVMlgHk8OKMAuNSP1+98AR+D+G6UGFiMiDNnA
         SAXKe5plWNmYjIJSPn8PAPzeUse4vqOZQy/LOISmeU2kTmsMP4ODRCXpDghd+wIfUvOB
         R/kJP+ezQWbWY2O1rwO6CB7hqTxX79RotF5KgXyXjyHUFBs+6iuxH98Sw1Yddj2Fn3gp
         P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430087; x=1768034887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=MVnV++89YDp+vAJ1NRYUrOrkkMAOGU/5FJe5XWuIwz7g9V/R+jfr/ct4IVMDrzGi99
         4Tva56zanMiYS1V6L4VLUTUTcf87BSantlCtNGFK8eFWAodTZ4Gxwq4IH456/GCmeLZN
         HQ5L+0yU72fsR+2px7ElUvZjz/dTDM0TU7fBghznUp8/db9QVyKjm+SUPXHn4WYWAzFZ
         Gkad+eInbKvTf50tvEdUsYlCCL1gLb1DcS5kFuotnJBPyOJj+jJm6h6AfNszHfEyk/v5
         6yTBzWfj06jdFhN3cHZ4EpzeKMsOKzIzzuK0xqZvCKNbXYpOhHpUAPK76cusCBp36IrQ
         a7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUvmdWUklLC9lsFGXx49oR0QaSQXwrO80EaDCzpVyz4w4XoDxXNBwQpErVc1JHTrXOMWKbb9Ejhs8OrIzO6eyZ2@lists.infradead.org
X-Gm-Message-State: AOJu0YwGdLRjKzuzjqoyZNtXUDXxL407XHAQhZSgo+B0UkPRUIEel263
	P3Ah8rrN41N85HdQs+NPOzAwpx1Nwx5Scg9RZ/WbiSFNNl3x4VETP38Q
X-Gm-Gg: AY/fxX4s0oNvczqOM4NbGkTEnLu4R1gsoNJVWhRm1VCocOItMsfgMwdkZMKbUiwivEv
	aP3mLcSRJjJBcpyvoN9bBf3AWPY7dSy1x/waDL/+AKzOb+hT7Izl7uyOgY68Jb8Sljdzf14Jy1T
	/HA8JaSKxtt8mMjYS+FW0aW6TngXNyAE3yxWxyYqCCNAvXJzgo41oSRkOwjGlROfV83xsHvGp2l
	IpnR26ynk2yHVwtgNDywKALq2cvrRyGlN8zo5UHrlyTZ4hbRJQUoB2XInbMFHYBVu4piNSfJRME
	cGvyg/W8M2oi2DNqQa7Njx/9cuZgj0TRmrxvVxFZloXQg9RBn9ZGR8FAN2ydkJALb/3aebeBg7r
	tg9g8asMeDf+8FIz3Mf8VHJ2Z0OMeLcfQA1IJDwu8q46u2w0/J0bYQGgqI19kyyl63djam1lsH1
	FJQ4dFjbAXF173bftKiAOupIey9CtsMJRpvfk=
X-Google-Smtp-Source: AGHT+IFoiqDv7u4QVwPAsnB9Ilz+AGYXHXN7Krwf9OXzvHcyBpVKkqOp/lFBq/KGwKuFExK695g6Ag==
X-Received: by 2002:a05:6a00:4895:b0:7e8:3fcb:9afc with SMTP id d2e1a72fcca58-8148ba1ab36mr1175712b3a.18.1767430087435;
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
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
Subject: [PATCH 4/5] arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:42 +0800
Message-ID: <20260103084243.195125-5-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004809_575936_4DB101A7 
X-CRM114-Status: GOOD (  10.74  )
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
 arch/arm/probes/uprobes/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index 3d96fb41d624..0e1c6b9e7e54 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -113,7 +113,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	preempt_disable();
@@ -126,7 +126,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	preempt_enable();
 
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 
-- 
2.43.0


