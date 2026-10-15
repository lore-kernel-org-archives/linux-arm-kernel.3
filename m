Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217BACC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 05:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=; b=i7l7Y5XQJ4aAbTtt9wzQr6+NL3
	wabZ0Yk2SrtlA2ZbsYI23+IJ1ewwYDNAeGX8CNrH9MHVGLfeybQBj9P+Xoo/ImmuIgutjkTKI5ZM+
	VgcdHG/JiJEMjy5PJ1h6eK1JX88/zHewLepLFFYsWbKm+bsfH+VxCvUUrBYHDDh+BWvLId/zVEfzh
	PzIcpvkDt9C7YIgiIqXSyg1uqmQDHXWl+RDxyenfNwAPdgLqEgAwQawrYvv8jm8zHVAEs0Cnz4VS7
	/CieJs+NILVVBX0gC0aoa5DdyTJnZEp0O828SHcO/Eji02DnkMieDKotFkzaVCviI9ImC/Fm8bO/v
	qRMBWTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDwK-0000000Gr1u-03Xz;
	Thu, 15 Oct 2026 05:23:40 +0000
Received: from mail-vs2-x00.google.com ([2a00:1450:4864:3a::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDwH-0000000Gr1X-3c19
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 05:23:39 +0000
Received: by mail-vs2-x00.google.com with SMTP id ada2fe7eead31-7565f2f85c5so1179741137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 22:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792041816; cv=none;
        d=google.com; s=arc-20260327;
        b=Xx/u0ar5cHCq0yhygLKdipZNrty8EUDKMbl5qUXK/AV7g5f58NharBVU9uyP0103TV
         m+gqJCyockISInarUI7anPRSQbsFev2/8mzic1TfqP0gg+re/N1V7vr62eAS1EVer2KB
         eNQeqd5G2KaRoF/rJyTvKMQ/cyEkh85Y/a5aq/s0gL2V9BdEa76fLG2tMUPbB30TgpBP
         alek193v3RhL6M7P7ars7LwfBn2fsX3KUJuBmL2YXzQ6WdQ9Xfto4d1mQ5XrdMvDqiUy
         HY8+hWnCaE6U+4fEe33KtMh4A5dzPgbJWWvquxleBTgQYHXrkJv8EmnfG47pCzzZ9KPg
         60gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        fh=BETfeaWVzjnto6E8XIRtlQfeDl1KuGz9Y2DEFDftMAQ=;
        b=egmLrJEStH1aCAJsW95cb4gfDbvLz7lLwtiLKvJ5imWJ3eFPIQBRRVfgStk50sYnam
         uhAqp3h02Ax2gD8HyE/PQpw/DtovihmyoKtdXvhUyNmDiVTKHmn03kn5LZ6MyNK/FogW
         El+c5di8KBSyCzbhxiS0MIs5JWuW+j9UENAjzV83/v0HtQmbxcTc4oOljp41hS1riKsa
         AaDKA2Wm3wtU+RLmHQrhx1jCsaiuIymR0vjq/2lVgArLv8a+Xwf7B7LEvyssnAvqUJjW
         krTSZA/EXPmi2Vn8gF4dvVAkyycKzmwwqZnT57b6Owj+sy1P0DpMIB1/vTSJGUjh7Z8x
         3RGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792041816; x=1792646616; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        b=PLmtJU2jn+lK1fJV9guyePc7J9j3flGm0uvtoXEWvSHW+OAsig2koDUndhiKcczmHZ
         A4mIWQWN1IQSn52ZBoKi3MRTTWxlCK3XvA2uQGuNFdrRnmGI7kh7PnMFZ80WeoyT2/0e
         PvwTUmJD1Jj7VaOur6+lGpW0hkuxuG7bS+0z/URQDAPYjp8uY8rijv17HCG5D22ErADL
         D6IfRC5Ltcphl2hlp3Ep9snTSAC+nvdefo94cp3c5FZDEs071Xek/HQgAG5ipwDfj2m6
         DUGTtAjShCjMdHiR/Dnu8AvZDKGxOXIfb16iJGWFJZvMacc9psuPhGq2UQSR5kCKsT8E
         P1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041816; x=1792646616;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        b=gdwnxAz5dYAiqNreYxMrySrp9vMmafVOWagcIigyBVK63ZAs05TfQ5y4Sa+Lebf8hW
         mbLGV3hvst6d+bOfq9fgN7iYE5RHL/pM/kAqFf2DyHxXxIJVmf/Zf5P4jBq/igf2HxDD
         IN3FU6XAU6SXDACvWMGZYDbS8dR/aes6Q+LWGVypowEiGBlyB1S01UpLMgLv1XGYtSN0
         IZQc5JpCUKkm8bTI8wzE8H2eurdnuIT5OUM3YBIeCluK88r/oBpUHCeWqQDblPZAwaGc
         a5xDSaVbTnJ/0uBdy3Cb1gXFR0X1hnf6KDbWEFNzXucHIDzawDa9dRobiS+i/SFnzOlP
         RxJA==
X-Forwarded-Encrypted: i=1; AKwUvBx8Yon+IdTJ3Uhhf6cUYi4hKBChjhbP2HAyVP3XbikQL29oAjecG1mGmhrgtQtdIKaNbgPfKU1ZP0zbQZvaL6KZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKFQc5HEO6SZ1uA9zBjx2VpIBaSfOpBubJf6oa4JzuIxBInMQxH
	8H6wnUL0viy6TEA4ZEs5Aan2oftRU5pjlEj5eb4jaFdnf+SXM9cf3l3U9imEfVM9Y8P5lXpPN7r
	zitT3uY1iB89Bb3eGKju4emwBFQpXVmXbJv+VoQb3RYZfaKeiewsX6dVp0aBIqlfBrA==
X-Gm-Gg: AYBFou3Af3CW9SNI3dLS5z78yGK4WI3/fJLJ3A0p3x57fnSlW93iTQorrfAZg4FcHHT
	idsPM3gjCU40x81r8IuHV58eoxKIanAacEXfKnoxgvtyePi4JMsVTtvxHkcRQU4ZosTU1h5UhIJ
	J9oAtqX+jQZOi09DLHAfMyl8rX8cK2oDAr2XIJ+JVtyqT2Mmr0oYIPfy5P27IpYj01UkaWgbwXK
	a91R8Ck8nUOPJ7XxlqDsGg2NgDxUBJN3IAyYcQ2czHTOugnqLmXdBkjjqVftHHP1Z5UKLJ5B7HF
	iccNJ5pwuplBZM4eACfWSuqwAcoxFpXSZKVncz/g8qKkH3EiGKdvZ5FxZOXWn5nZnP1367bncjB
	wbDs46/gJRxqRdXBjJzZsO6hiiV1qKRX0VA==
X-Received: by 2002:a05:6102:370d:b0:7c3:9464:efaa with SMTP id
 ada2fe7eead31-7cb36590225mr4707868137.2.1792041816136; Wed, 14 Oct 2026
 22:23:36 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:23:35 -0700
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:23:35 -0700
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 22:23:35 -0700
X-Gm-Features: AclHuK_YYfxnldX7Bh0B9i3Tow6J5A6qSw_Ioe7q5Yt1rETlptfRJUA_JUSnfjQ
Message-ID: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
Subject: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_222337_932042_54220B4C 
X-CRM114-Status: UNSURE (   8.68  )
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

Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
when 39-bit VA was the 4K default.

Set the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA to 28 (4K
pages), 26 (16K pages), and 24 (64K pages), matching x86_64's 1 TiB
randomization range (5 bits below ARCH_MMAP_RND_BITS_MAX) while keeping
ARCH_MMAP_RND_BITS_MIN unchanged for smaller VA configurations.

Closes: https://github.com/KSPP/linux/issues/371
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
Changes in v2:
- Add a comment above ARCH_MMAP_RND_BITS explaining the 1 TiB default
  for 48/52-bit VA and the fallback to ARCH_MMAP_RND_BITS_MIN in
  arch/Kconfig for smaller VA sizes (Anshuman Khandual).
- Collect Reviewed-by from Kees Cook.
- Link to v1: https://lore.kernel.org/r/CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com
 arch/arm64/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..7bca47269dd5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -313,6 +313,14 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 16 if ARM64_16K_PAGES
 	default 18

+# default to 1 TiB (5 bits below ARCH_MMAP_RND_BITS_MAX) on 48-bit and
+# 52-bit VA; smaller VA sizes fall back to ARCH_MMAP_RND_BITS_MIN in
+# arch/Kconfig
+config ARCH_MMAP_RND_BITS
+	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
+	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
+	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
+
 config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 7 if ARM64_64K_PAGES
 	default 9 if ARM64_16K_PAGES
-- 
2.56.0

