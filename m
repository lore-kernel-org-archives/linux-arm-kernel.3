Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D16BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q4E9RiNY5xxeH8v0CHIC9N3hVDQi7OzQEt/odZrgvSk=; b=K39yBJMFT6yWRlLtqC9CX+Kp8e
	qYDMQMXk1Y0bCHTmVvEKDCk/1ay1Oh2bjUTII5P+MzaJntDy0fFs5zkOVP5aillcaE4fULZ9DMaI1
	l1Crh7ZWAtwvNoEvLVX0iqRTHLmWgVgydc5OXjdhDSNwhbTBdByUaNNj/dh1KTwz2YpLcF3FiWz7H
	5LYz5mKNeXHtFnNOGUWzXcn+qtR2qYjHmyrt3aHr2wS7MDVahbFpf0z+O3yl/F7jAHY94EOPLjpUh
	uaD0O1rEOAC2BiI5hepD0bZKvSW2yVMOrfL/+F2rZAlll0CLl1efNui0IcJ2J4zzd7FCo6NNgG12X
	03tW5X8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXDG-0000000BwE8-0rHE;
	Fri, 22 May 2026 21:15:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXDE-0000000BwDY-13Tt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:15:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so80659875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779484518; x=1780089318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4E9RiNY5xxeH8v0CHIC9N3hVDQi7OzQEt/odZrgvSk=;
        b=Z0vnl8xjislX+j5MIGXyptiQPkQRxwM/gPN+Qf8w/aMg5+zwAg6Cxv1jLKxTNdqUGY
         rnazYxXjIVj+8DmmUd68oWfPqMUaUk7BbduCXOyJCyFgO+yaEYc5oWLxWUdliSr0cDzb
         vYMAg0YDQ9c11MN32TwxwoiqxPl17NzngOcwBlDhEDshV5jZ1C4CNjYihzPpwyahutAa
         TwurbYAhw7rwdnHfrsH42QiS8EqY7m8+ZRVUpFYVqUWrD/j63ajYt00NEUKbrBaiHks4
         OMt81wfqGNB6DYvEvxa+sNCTUVFiHARAO8Li2dCkNk4X8M1NI591GkL/O7Op7dqlTXaa
         ImKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484518; x=1780089318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4E9RiNY5xxeH8v0CHIC9N3hVDQi7OzQEt/odZrgvSk=;
        b=W9G17Gtgsukb+3BITMDDWGxYj+fYWahejAJ9X0j5GLWJelBhpvRj/tlM8qqLVuu8W4
         eqtlkzWTHhZE6hLTxrZy34XIeo3u5fX/TcTDayOPaigCAtulmnHxi3gKnYya3h+vQx8+
         sFVgsfWsrEytU9V3dKDB/LtGd6D+Kv1xz3xa+Qp6Q62Vdyycnj9TeY2VIJA/glHKAgts
         spmlFBGjyTF7JwiYHMiSupgQyI5VHRvze6Qfv8FSz9T6zuvqmF1VnJ9hxUNvNBGRsPdu
         ipS4d5d3HOk0fhwL+3kV+gQkEPE3aOis6/LSENHhEq9XOm7o+5CJBe0HZ9ooiAYJB1o9
         ka2g==
X-Forwarded-Encrypted: i=1; AFNElJ+mRaktBIR66YgFWfyYT3QluXPQDfwESXV34f2ym5ANAbN6fjTX7gDRenJNgYxonRMDayodKzdY81DIOMDOOTdW@lists.infradead.org
X-Gm-Message-State: AOJu0YyYAX1bFV+sdvViPZoGJZaM98X+Y8a6A74MEcTkQ2lm0poQGKkz
	DG4xNVCrJUNnuPA7D7f/S3vLQVciMYaVKQEvdsxfhdxPAM+DpxKlH6k5
X-Gm-Gg: Acq92OFH9m4JGKfT/nsszuiRwYvLx7Beht2jQViypuaCeemOJHQ9dmc7nLBQ/IOktD1
	N8Lb2Udky8uEW26yz4VVwj4xQZkvlEbf7fPRS4bo1ixTzHXXkNes5uYJffeyovK6tN+BL4ynTVh
	jEvHUL/cbWE+de3GOfd2zlyY9tmgWFnRdt51BHz7G/c2/kf4v+nra04fwMJ6oYZ20SAZov0xSWG
	O4HCEbjRx1Gp95nDWe3o/F3OwDee6SrNJtgD832IKPB2ncZjrdaW4tB7S0o4GKAxf+hRuq2PXSN
	YuLSiFprGcaqvu8p6XitwYt6U5o5h1SrImAsAHgOrAnHisglMEIpHEFrEqNkfqiF0Ye5yh+xqBO
	NP6a7c4tAQPGsK3pIi7rHoDJPAn9IXr14C0UrODLV4LyDns77+bkxE2nE6kLh5APWGrsQJ9Yagf
	4mOwPUjNqw7B0XB6hXI5YnrTmMpHbktpvUy1kS1TMdXuc8kn4Za/iUCSJvfwCRIzetlPXPnHhCp
	uU2hCMiO3ZwNdO520/SmfzP/6NHdqgDCJ9XGc4eYIUdzmYGvpFPuvKJ8jGDiy7ctEjToAVGxRHn
	MhdN+7t+eA78kZ7/q0uaR78N4bZUkSUvtDugB1zw6w==
X-Received: by 2002:a05:600c:4ecc:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-490426cd8a4mr74193815e9.21.1779484517821;
        Fri, 22 May 2026 14:15:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ada3-3901-ad33-2cf3-cf37-617f.310.pool.telefonica.de. [2a02:3100:ada3:3901:ad33:2cf3:cf37:617f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49044775266sm22135525e9.33.2026.05.22.14.15.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 May 2026 14:15:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] ARM: entry: use byte load for KASAN VMAP stack shadow
Date: Fri, 22 May 2026 23:15:03 +0200
Message-Id: <20260522211503.25219-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_141520_310593_EC1BC25B 
X-CRM114-Status: GOOD (  12.77  )
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

Commit 44e9a3bb76e5 ("ARM: 9430/1: entry: Do a dummy read from
VMAP shadow") added a dummy read from the KASAN VMAP stack shadow in
__switch_to(). The read uses ldr, but KASAN shadow memory is
byte-granular and the computed shadow address is not guaranteed to be
word aligned.

Booting the QEMU versatilepb machine with an ARM926EJ-S CPU and
CONFIG_KASAN=y, CONFIG_KASAN_VMALLOC=y and CONFIG_VMAP_STACK=y faults
before init:

  Unhandled fault: alignment exception (0x001) at 0xb91037f6
  PC is at __switch_to+0x64/0x88

Use ldrb for the dummy shadow access. The code only needs to fault if
the shadow mapping is missing, so a byte load is sufficient and matches
the granularity of KASAN shadow memory.

Fixes: 44e9a3bb76e5 ("ARM: 9430/1: entry: Do a dummy read from VMAP shadow")
Cc: stable@vger.kernel.org # v6.13+
Assisted-by: Codex:gpt-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/kernel/entry-armv.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d13..a3d050ce9b79 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -567,7 +567,7 @@ ENTRY(__switch_to)
 	@ are using KASAN
 	mov_l	r2, KASAN_SHADOW_OFFSET
 	add	r2, r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT
-	ldr	r2, [r2]
+	ldrb	r2, [r2]
 #endif
 #endif
 
-- 
2.39.5 (Apple Git-154)

