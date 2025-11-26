Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23E9CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SJuhZNExCqQMugpeBqSuCp4/sWFcqR6NYcpSf34oxY=; b=yh6C3Tz7fcdHNI6EWBgTSczi4q
	0BAdH9wvBACryBLxbxhCMdyuYP0pIqH+Co+tAt1pku/YsnCTu0jhwUHs5KK8qoN0nlZimnCo7YT0G
	Cx+mhwrhMCa+DN56RDvephdgcjWWKQhXOKGIK1Sx/k6KmyOQvW2pd2/9ypBSEmgGLw/jqiTUhrszv
	YrMeWLkXh5H0kR6LWVYRWUop4jNOzY4QG0N37CSSlqgrBxTcGWAXV9+tsVf5pL4FsvakbLtAes9+h
	0OQeTSBWKESut5QI9Ru/aPkKcZ4qVEAYr8h2AeP3sRd4xKcIQiL+4vy9VBRlQu5na6wrio3OcT8eQ
	Btj8hWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONy3-0000000FiWy-3XXk;
	Wed, 26 Nov 2025 22:26:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONy1-0000000FiWO-27sm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:26:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso7843205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 14:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764195987; x=1764800787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SJuhZNExCqQMugpeBqSuCp4/sWFcqR6NYcpSf34oxY=;
        b=EyrUEIYpsrUo9yQyteHhM5Ytba4dE43yqenOlDUYFk0+N3G+6RkNhP3ixw2DOT+iQJ
         mPliTxxBwvofYqRxCT/co0LDo6qdSTWuURYoYPWEOUZc1YfBMR26eYJSvchq4jYFpZS8
         FEkmpwB5WaXazhNyfVvQqjWvRorhvmq4ScDMuaE2sHmkrBiTQlxLN6AGZ0dty7TkQlkD
         fjPlI/86XUvpEz0rEHjWd/7mQByO7y/vn6rLSHQuLoHnp9WN7oxRuc9vpGpuaGVjkckU
         g71NcIWM1QpKK7T9cCoQtO0pdHbgbT+/Q/MHGxTm1ibZ0/hHo/tlF49fEE33opbhrtE2
         OIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764195987; x=1764800787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SJuhZNExCqQMugpeBqSuCp4/sWFcqR6NYcpSf34oxY=;
        b=uVw8ZRyuuqkNdy76vMCnpegEuQRz/sIsvbgDEqUXPWowBNMvUmc/cg/EB3X42KcO5q
         Bt42az/dda5expUDhaXqWDTz8OFP/z3KXbt6a/YZpyxkmiSkQnbMwyYiEH71Xhw/TW5N
         Cya1FZ5XKwHvpcIAexNQ/crNsy4ehU5zSTAQp/AACUuDdJV5BB34VtJv3gqfobqLODX3
         mzvlKUVK+ORw8SggwEfwCZ2vwxZlmZbGqZ9qm8ZCdtUz6/PXKsM2nI57hDk71dah62eq
         qoYEB6UcftfAyRWV0HWReSh9v6li79it4bb4QupiiYrF8Xl06tlZP+70Ks7zOSY0xeH4
         48Gg==
X-Gm-Message-State: AOJu0YzmiWX2Dckt2BOYhQ8+25CETY++//bfj580/NlTK3zCYQxfuZLW
	dXJeDxJwUeTdHh9axRMY7IkFwpWqhERF4xaHoZLSCHt0npP3j7yudoQ1
X-Gm-Gg: ASbGncsRlbV5yNS0rilBNntLR6qPy9nupX+sByGGRrUbSNFRd5Zw8Frlp6xo22/CV57
	lCLODTERTJZKI7V5DwvcRppeSgPF82GYergW8nzbFWfkYK2VYKPmgwQYv/RpsS9HaIcy8HXSqrZ
	YwR4Qzg6BZJHtUmfwGoaqN2nov/LuvkoMzg3T944EvSttvoJX2U9OHnFsn6vHlmhWPp/vAh94GY
	GeSt5UF/za6osGTdDF12CKLkUmGzgvc8I/9x6KRyF8BmVzgCk49B18i7t06io/c2S85VG82LuHm
	2XerAO6jZPcO/7bCNbYyjsFIeQveeDcQx/yrmKliTWkeHSLd7TI650/nc4rGi3/ecnhFUiUqynz
	U7Zbz9gG8iTmTP9Npoml7z8VUhk/EVN6pLXbEZiJzGg571dG1rPueICqCGm61XB9VmjopyDzj+p
	T1U1K7tkRYuSGkcKY=
X-Google-Smtp-Source: AGHT+IGFRhfKwd0O9NuIoXvf6KEKvdve+8muU9KsMCG0UwC5refNIeG3tBGirL/CPfCmXHPQAQCl3A==
X-Received: by 2002:a05:600c:4515:b0:477:7a5c:6a8e with SMTP id 5b1f17b1804b1-477c0513800mr199456735e9.9.1764195987375;
        Wed, 26 Nov 2025 14:26:27 -0800 (PST)
Received: from osama.. ([2c0f:fc89:129:990a:83a3:6137:cef9:6de9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c3a28sm67152705e9.9.2025.11.26.14.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:26:26 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	smostafa@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] arm64: Remove unreachable break after die
Date: Thu, 27 Nov 2025 00:26:20 +0200
Message-ID: <20251126222620.215245-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_142629_546429_E9334B32 
X-CRM114-Status: UNSURE (   9.18  )
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

die() never returns, the break is unreachable in arch/arm64/kernel/traps.c

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/traps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 681939ef5d16..81dd2d7759eb 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1003,7 +1003,6 @@ int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
 	switch (report_bug(regs->pc, regs)) {
 	case BUG_TRAP_TYPE_BUG:
 		die("Oops - BUG", regs, esr);
-		break;
 
 	case BUG_TRAP_TYPE_WARN:
 		break;
-- 
2.43.0


