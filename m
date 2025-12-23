Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85ADE6F082
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1lrhud01Tkkm4DNq9b9beIZ4pRUP61WPiTcci3k5Fk=; b=WknbcNMh9q+rcx6ZJEzBI8/q3t
	0CNL3of67r2BkW6H7olbYFuT5MNXU3G2MRQbSLVD5X65s7FOTcXUQ4ffWLKNXaUvNi0y+aCCTkIQ4
	mYBX+GeJrTxoPhY5/uXgILI40J3Woppo51V5/k+yQ0FBUF2rgmuSz10Xu0eHTJULcz4FVMuF+96wo
	Ykt7alpObztxExOOaD9H4t4MIpl7rgenPf7LXBVw5KP2cS4OxTlA2yzQc4rLv6iIJ6uPmD7W/F1qN
	XdJMWQKxiWJK2d7ICFqZOCC9d0HshioEWjT0zxBdm3F/ZrV/qin6s8nWB4SYiwG3QVsGntIR9PAzA
	yuzaKD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03q-0000000EulG-2ULX;
	Tue, 23 Dec 2025 10:56:14 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03l-0000000Eujl-2yhO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:56:11 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3e8f418e051so3450757fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487368; x=1767092168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1lrhud01Tkkm4DNq9b9beIZ4pRUP61WPiTcci3k5Fk=;
        b=nrVNEwKucRyoV1TLFDxr7MkcOa4rcL9VYNzcMBEmvwd16tlqX0cycLRS77+2Qfh98A
         TvPxEMIB74tU1QY9VQDDWtC+A/38kBafDMEMo0i27Mx1eYhREdn/uspTey6vl3n1nws2
         p4W1exKKc78fKdTAerPN2LocMJQvxFvGYmaeUNFUhHOrgiFvNkEUlQi+RqFiBEXIXlMf
         7aCD6/F9AehMP/lSIVVUHRJ4Vy2A+b0D/j5g2jO9GtfHjBAoEjhTvKMD+iFNmoOatGEv
         +3/NLF2KR8QXIsVieS0Jm0LJ9noaTSJPyxDckmMVj4oaxL3SSjyX8kEgoSvK8fV6SiHZ
         QjQg==
X-Forwarded-Encrypted: i=1; AJvYcCUkt0d2LnwOjhgg6Ge/IKIJXngcO5MxBm73RWqiKAmtrd4XIjrbFQjh3f55qacmIsgtsdGq9XI5hVqs/jUSF7pS@lists.infradead.org
X-Gm-Message-State: AOJu0YwuSxA7Cr7iY/OQRyNfmqM1czIaFbUoOjdhf5jYa4exIvTB5irL
	bncfHnJhslJgKa+SrPU4OMGaRHfj1MbvnboH3jqKrHLTpW4MsEdfTiCn
X-Gm-Gg: AY/fxX5mF9GjSC3k4tjEwZHSGc1v7O2GyI9WRj/G8pPNWIu5wjkJ4h2lExqVDG05GiA
	OUuRFHPHAnWGHgI8Q1ezse0U+3lRl57NEaU9DEEBxSe+Q2hSM+O9/ZdchKa/xO9D2Th5iKYs+kt
	LJzzcgJuqrhf+qEMaw6WJoGCrm7QYzTa+zZNrDHXqk2pPl8XWGlDRj7IMjSdKnWlqtklThW/FAG
	guFBiN26eSqylrexnDNs4xe0CHPWcu9zkPXYHt7cjFPom2yFf4lcAaXO6G7a/2FWmgWYAC9ZFc3
	3yAW/drQkt6D4sYit9KqJqiR6EWzTchr8ZY69bff1bAvQqZHp9QGEasACr5ZIv+1IbKjdNhIdPh
	HC/eQR3BC/uMcPWn7sK6QQlH4H2WYZskgQpKowPZWPZpzDjwgIIELJyREZs3+FraqdUVZuZlCqr
	Q9rHZDW79bq3dLfA==
X-Google-Smtp-Source: AGHT+IEEdQF/gHgq3UyLobX8GobuVX0tUFKwYAoMjIMFsmgE4CYjBTAFdX7i1k9CtrdDm1Wa+O8GLQ==
X-Received: by 2002:a4a:de8f:0:b0:65d:be3:311b with SMTP id 006d021491bc7-65d0eafc4ebmr4785903eaf.78.1766487368481;
        Tue, 23 Dec 2025 02:56:08 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4c::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f723ab6sm8713620eaf.17.2025.12.23.02.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:56:07 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Tue, 23 Dec 2025 02:55:44 -0800
Subject: [PATCH 2/2] kthread: Warn if mm_struct lacks user_ns in
 kthread_use_mm()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-efi_fix_619-v1-2-e0146b8b9d73@debian.org>
References: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
In-Reply-To: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, riel@surriel.com, puranjay@kernel.org, 
 usamaarif642@gmail.com, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=leitao@debian.org;
 h=from:subject:message-id; bh=JVkzh6Mj6r18BxTCZYOIUvNWS/o6kmzf/4mUqtZjoM0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSnVE+bi2ZoQldtZ7u8jeYGlbnlyMfIcy78o4u
 qgOXEr0OzmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUp1RAAKCRA1o5Of/Hh3
 be7LEACHOsztZael5tTqpe9CNoDWhqU8isXgl0v5yAwcqk8Fjm5MKLgC2z7XxxeuUgCxNF2dQba
 3ZNyA7Xh/twezTl30dyVRJX+pW3qbfL5irGxa1AV5ua9kSUObxME9BJRk3AReZ0+v+/Cdv1NIbm
 hYeTxSZg0CBZuWtWvtB2JkNna3nH954ALoHtSiHdSzAI+JBIXvbwP/6bHrhzBioX8g9A+JRbkXb
 DZtAnS09cTmABI/gYH3ydpbK8zM1ATWLIH5cVVm6oGHT+/ocSpW98EuJdvwV04VcUr6S2wCha9v
 iULKzhEB7ZJJvA4e+f2lS8Wol22Ka52YSCv9WTUa1lJKhhR/JQi5niFZoN2A7+qD2oCyjUxbKj/
 Z5W+R1fChfCj1Ak91hQCKiYh0QHa3Sy7q5Emgo8hvsEekSTwRd+H3lfZaSgZ2/pyGSwkWh6myh5
 IxzvT0EWz83bMSv1DPXp0wEOdvLFBzRpo2lOEzrtjsIPoMx7v5V0L5p1XrLrt1IdDmV3MMs7Ijy
 yD2Mcu36gtbS0aukBFiGH/E57s2DMKGS3mFcvU57Ug4BQMo1eFcBRbAu9jOvdi6r9EUn0p6oaEb
 tyz6zNpBvpfoFJdwrZ5RMszVcrHK8lxuJqPrcbz6+RQcKL+A1lRn/H+9PA6wOcYnUaYvT63Su+f
 MnT0qjGWX+M7iVA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_025609_757142_9ACC81BA 
X-CRM114-Status: GOOD (  10.92  )
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

Add a WARN_ON_ONCE() check to detect mm_struct instances that are
missing user_ns initialization when passed to kthread_use_mm().

When a kthread adopts an mm via kthread_use_mm(), LSM hooks and
capability checks may access current->mm->user_ns for credential
validation. If user_ns is NULL, this leads to a NULL pointer
dereference crash.

This was observed with efi_mm on arm64, where commit a5baf582f4c0
("arm64/efi: Call EFI runtime services without disabling preemption")
introduced kthread_use_mm(&efi_mm), but efi_mm lacked user_ns
initialization, causing crashes during /proc access.

Adding this warning helps catch similar bugs early during development
rather than waiting for hard-to-debug NULL pointer crashes in
production.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/kthread.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 99a3808d086f..39511dd2abc9 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1599,6 +1599,7 @@ void kthread_use_mm(struct mm_struct *mm)
 
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(tsk->mm);
+	WARN_ON_ONCE(!mm->user_ns);
 
 	/*
 	 * It is possible for mm to be the same as tsk->active_mm, but

-- 
2.47.3


