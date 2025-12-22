Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC9EE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gjP35cBA/xLIQiDo38CPhxP2cqKO6MoYUqR4x35YRw=; b=VKvDc2wpl+cNaMH01rkHuuXN8O
	o4sMwqv3y/45nbS5hebWGMCoQHMywnvaOSf2v0kJKYk+eNuz+2jAmD/CcAN8F+jydYvRSErpiJMX0
	g7VvhQBK9gwVVk5ILKpDIf1ZzSRedzp9Y917Y5pGwZKsL6gZERfTGRKBOpq6Z7guiT8IM4xtl+R7s
	6PvY4CfhpjV701KB228feoEfUHYQqtp2h39tUtaBjjW59cFiIDuL7SE21yYC5JPGSfzhBzkJTaH5x
	3d7rqQFPIq+ebFJW7bQqE1LA/VutfUrr2J4/MdVD2ktX1oozxMZ/L9tZAHfDVv4Ha/ipQlKaYv5Dx
	TeJ+mjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhqU-0000000DvOj-14Wj;
	Mon, 22 Dec 2025 15:29:14 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhqR-0000000DvON-2m5e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:29:12 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c76d855ddbso1158727a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417350; x=1767022150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gjP35cBA/xLIQiDo38CPhxP2cqKO6MoYUqR4x35YRw=;
        b=NAWZQI8hem0RmCa44sP1kB79pEMYL1hCCe60pDE+x0UHqyRDSWP4xdBAY2uCA+/OhG
         chAqddjPkjHlcz5jdk0OO3KLSkD2H7io7R4dfwXNfft6JD4SFlM/HX7uVEi9Dwkl1oBc
         0qMrukhINrilEOuC4u1ugtyA48VJBQ+XIBCVSJ5Nqi1ve0SOduKqTcWhTZrvhNBrmKQp
         vhYvNkhdtGPbD2AWLYJ6OFZbh8KwW096TWYu9RwBJWr7kqyFbGPcCMl33JY6kkEDUQpv
         oFurQ3v6ZZO7AZ/ZprR9nnQ/7zoILnXVyRvzwAPGCU+wZiWoueSyPP9RIv0uz5FduS/F
         VLWg==
X-Gm-Message-State: AOJu0YyQK1sxMTuezTdo/10L/LTs80olJ11nfSKsD9Kujhbn3yoZTDxH
	9FGcBQ5zNR55HGLgzSAQypgYZu26uovJ7VLr0HGepAuMudZwbvue8Fi7
X-Gm-Gg: AY/fxX74FFGWgIEdSnsptOfnuL+QoPGWaZN06KU+cAr10J6mFIhIi3qK54adlmYe1it
	/8HFTH0IKUJq4GuXGEaGvLFF0h8CtGpOiYWYp1kfQ3SZJd6JnTL7+BwNoUgQiVII1L7qZmQUO2o
	opMdB6AF6gFnZWPzo1nAzxgtSaq9qXiF7ekxUXf9egcjRmShA2KXqvaBaHuh+poo00BQvwB03zX
	SwCk8u4AkeUtLZbyvKu3mz1s3xIkb1gyot9LdSPGDmSsTn7qMAAWhlAb6xBekYolgrc6PCcVJB4
	tgCzWEK9dCwAyHkbrXpX5fuCwA/Kd6Ouc/RSWGoQbavduGS7BeHbnuGjl8IOdL23tqrSBMmEltG
	V4OjY+15QiEqUhV98pQRvuiKU1/RLfzUygpszrx3zDwf1+jChwdqrl6CqgxZFAHvS+0ji2cm6OD
	wpgVlxpdY33etjJ9H4vrzq7smh
X-Google-Smtp-Source: AGHT+IGVcq4K1AuHoxYg7INDkNkuprMgNTWqLwhWLeF7yuLOnk9Yx0LUPU2KReQ0jIoNQtiJzx+f0A==
X-Received: by 2002:a05:6830:4582:b0:7cb:125d:2a43 with SMTP id 46e09a7af769-7cc66a1287bmr3846250a34.28.1766417349933;
        Mon, 22 Dec 2025 07:29:09 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d572asm7516062a34.14.2025.12.22.07.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:29:09 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 22 Dec 2025 07:28:55 -0800
Subject: [PATCH] arm64: mm: warn once for ioremap attempts on RAM mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-arm64_ioremap-v1-1-30ff5f718b61@debian.org>
X-B4-Tracking: v=1; b=H4sIALdjSWkC/yXM3QqCQBAG0FcZvmsX1rE12VeJiFVHm8AfZisC8
 d2jvDw3Z0MWU8mItMHkrVmXGZHKgtDd0zyK0x6RwJ5Dycwu2VSfbrqYTGl1Pfuzr9omVKFBQVh
 NBv38v8v1cH61D+mevwT7/gVuG1JwcQAAAA==
X-Change-ID: 20251222-arm64_ioremap-d20703b85358
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, clm@fb.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=leitao@debian.org;
 h=from:subject:message-id; bh=POVwh7CIkpm8OwgtoG3u426PTzAyYheJiuT2ffXLjeA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSWPFksJ6Y16yNrpT1VKRMJZnwT+KP5gYsNMZt
 1BLT/2eSp2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUljxQAKCRA1o5Of/Hh3
 beU0D/4i52o2SEZrAvbmPRFBbfc8u+M2tKF0LgG7bE8z++2znri4naTPcgKk+F4NhwactwVrdEA
 UZ8NHI8bQGwpGNgO6tCFBQrcgd0KkWRY1lmY1mjAWM9yIydWfW1rKLJpS3cIA6PNsxy62GT46BH
 lE+GzgzzfYFK7suk9fRgsiixLF5ciWpVrCU5HX1HvqMiqFH6EwFOVcyflVBQn4EIQ/Y4cOVvjiP
 q6PDnSP1coTVHSiGT0xYBDuLg/gC8OTZPe1wZcQZBMC+k9xxlywwZIwS02DbP/57EL3jqFajtVp
 QHikwRvsiQobDfS3XEJtyHxt/IGNNcsMwAs1zIFVZwx0pnJgcNh157a7PGfdLZPHHL8lQmY166X
 RcM1bNgLndjZzOxzXqUbVGoy06rNLDH7qXmmAJIqE294+QBGddeZuYI/4m8xL4MqmVqgTiPp2rQ
 G3zNyLwXZ2jSa0kWF6hBfjrA59wpWmjbU+2bCbFwagG+F0iWdNKi75KCaTq6/rKWa6nz9WRTQXg
 D2NLwg/IkqDRWS2NMvC6+66Gwia6UBbYS9C5iwfp5TbMgfoQJS7ttEQdi0PTXJefDcfea6zGV5Y
 2jfRn3LJ2alPGcOSCnSAX8eNguDS8Gd2UOjjEtxNgc0JbczVeAVHhh3b3y92or5Dos17Iz+/9NS
 pe/IbjWa3088Wjg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_072911_718450_E9F40E3D 
X-CRM114-Status: GOOD (  13.84  )
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

Replace WARN_ON with WARN_ONCE when detecting attempts to ioremap
RAM. This prevents log spam when a misbehaving driver repeatedly tries
to map RAM via ioremap.

A single warning is more than enough to show the broken code path, and
extra reports don't add extra information.

Warning floods have been seen in production environments where broken
external drivers hit this code path thousand of times, causing
unnecessary messages to be printed and pressure on the serial console.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
PS: This is crashing a host due to a lockup on nbcon that is likely
fixed by commit d5d399efff65773("printk/nbcon: Release nbcon consoles ownership
in atomic flush after each emitted record")
---
 arch/arm64/mm/ioremap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index 10e246f11271..b12cbed9b5ad 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -24,7 +24,8 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
 		return NULL;
 
 	/* Don't allow RAM to be mapped. */
-	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
+	if (WARN_ONCE(pfn_is_map_memory(__phys_to_pfn(phys_addr)),
+		      "ioremap attempted on RAM pfn\n"))
 		return NULL;
 
 	/*

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-arm64_ioremap-d20703b85358

Best regards,
--  
Breno Leitao <leitao@debian.org>


