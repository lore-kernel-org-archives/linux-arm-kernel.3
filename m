Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BB3CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 00:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=; b=S3f8W5ZG/7FFPBKm892sio6khb
	7ERXq35hnAW8pfUSu5XAqndjdj45aMCiP43LJqrn/KfYtS0LwQ0OJjm3bm4Z/P5avazARiQJiWzNc
	IYo55p/U0juo09PLZQ7Uq7ajf+oU+nXq2T3cLEOiO6qq1tr2NFdi1lvzdHdlpLokE5hN2IWpEXA3O
	tw9u68HwXh3su482bjPaeu8dLk5MqtpSXBc7RgvffK4WBKkNhYWj7Etc0nkkr0fyIGlfxDRAjwBgG
	LT5UJ2ra7WTlxyS9EX85Tb9bkzOC3mGx6tG3dgbt1h6q7a9PPF+yBa6dd6J2oZXk39IdN22F8hFUV
	LCsSj8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9J8-0000000GUuY-0hXG;
	Thu, 15 Oct 2026 00:26:54 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9J5-0000000GUuA-1dKY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 00:26:52 +0000
Received: by mail-oi1-x242.google.com with SMTP id 5614622812f47-4f6dcc0e8ccso4078291b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 17:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792024010; cv=none;
        d=google.com; s=arc-20260327;
        b=IKe+FcK09Bl+qNCNovUdxQXxwNiwxVWKlclhUOKoEgImjjPPr3zG89UIz0hrIlVBy1
         MNxetxhiwlSfRMPRpqlz/66WUwmj/Td14Wd7f7a4QmiKfvNwhRznpEuyMBOBqwoYo2Or
         cLw8rWDCxt02di932XtM8zf7VBmQzUFMQRMUQP6lOUbLkJG+SJgfwbMU7zfRcmbN4TnH
         SnvWWsAh6JGb+cPxeDEWs4P2L9E1mVzUtEJJZO040UTBaw2UMLxueDpBEY0M0DT54K8b
         aC1SFsHgA6yQD1zMeHeUoSL5cVNeBSMWYhJcJAUgbfak/OXIM56KS+jiQz4qjH2iiT3L
         RGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        fh=qNb/FUewrUYUIwE9pg+ivjhQBBjP/TdOQIZMSOL15Wo=;
        b=ewAHHKE1HpHNdq/N23xX3Ef+p681pO4HABHsV5qpWF0F1kzC5ZO8OlEmEXNYFo5NeB
         5YnOjkrhSwOpvAPpNhMHRkVP8SqbXnk3gzIHIemHEtTstx1XqPe+f6ZbEwdc0WVArKvA
         kIp4YpKqwvzhUIL9y1eDX/fbXcT33ZdmTI8BVQljy0BObHgGoLqhvpEcFSQj2ha50i/j
         el6CL9sdIMfVZ06uyZDXe1BBliLbcESYESQ8G3TmMNsrODGbtGU5aHdmMfcuya0gT2Cw
         eCildUzczGVu6IFD+GcoyRgdzbLg06lkeQxTt5rrqwdcAYr66hpgRKFInZwpKEVUmbp6
         2CBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792024010; x=1792628810; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        b=XzKLdG+1j4k1LM/BkUvsraX0k7eX/NGxvrL6EDfyxvN2I1rb8SC2jJcodXFl7ZkiPv
         2Tagph+2iISUT8xgJx11NM29EDAT8libiAX/SXqNte52bioXPmmYCjrKUC444QMDscDe
         SMHzbltO5iYGDgvbInDySMZlPQ9TIYyU3WWe2iG2OKUXTt5FORQ28GzB/VQli4zQVWvQ
         85zRAM8wDu7sD8YlaCUQtBe6/TYRE3uV7pvHIE07090MFLWmqMGR/jlzxkcNb1ije+MX
         odYwF/JnjYkeqDJSyNOLeKsmbCfRmiAPZPNRKvgW68OjYA4Ip6gG+lphYgUfxizZn0v/
         HzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024010; x=1792628810;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        b=YGIqoOwd7xHU+1/+1RwWnE4y8XqJM41db1jrtbb9j0yWs3l7HDascIayEAQKAPpY7g
         xh/Y+VqSlr8mbJYx6PYpDR0qSsbEd0SwOnSf6Tt3pQ33NGwcIzl2WQciaB3/iw1fOO/3
         L62b+y98mARcGczJ3PgzrlmBG6TewfIqXYvPd0aS0P7cf7dTZuMQaRzfWhqfNhcAsy67
         O+ryB4P7oKUsoCn9WBf7H/fn2JKM0Rr+994Sr64H8BJpjIoNZBt67oQT+HwPpzu1I5yV
         W+RnMWUFG1XKQuiOuaXkhbvDsqn1sdQxmlz/U9rE0NYFVhBNTZS0aNOmFoJY3Hi3BtMd
         +VJA==
X-Forwarded-Encrypted: i=1; AKwUvBwuPpzE2nWiybOkrnE4kamXvijUqhAMYT/pTS41iZliNm/+xxqY5OirPTPXaXO5ISE3vnZlqONJuzhOVouhLbC7@lists.infradead.org
X-Gm-Message-State: AFq9FYKOwT40FTtIkSwudJ4R2Lh6ot37lnBTHsCLQqIEQaUSO3dU6bfU
	Wb6AJYfx4qKErB0u0o04qJfOF3p69l0HNQ3+uXJ+XjfzEaZCIDHUgavTlyhMbSDrTS6KKKWG0ip
	HHWLBe+/6aVMNiKAgM9A3IqHDB9FFQam0FF48iyyx0A==
X-Gm-Gg: AYBFou0Z2jvAXsVZ1YosNo61sBhCQk2SY1hvlaTcDn/ygPQaoBjju4rqmYAbwjpFACc
	nIf9UFnSFGgfE9L0HDqOgtLUKIAJzBJ+kNC9nFHvtSzmbSkVTuBkrg774uZwdNYb3N8gUXkRgnF
	0VL+p5UFqnTvYVtEQW55f9x6WUHp+ejpVJhGoto1ISc/eliTIQbla2QGz3FEGIG6xc9FJ6oBFat
	5QRpQEO8YNz9dFaiup/JDiwP1yG26iI1tZixFJ42sFhqB5AoqhkOmMu9WutZKBZWH3kpgHKMN62
	2euDbqhLLChB4AJ8k1QcVFK+Z/xAs7KkoAbvC2RrAyBZreytvj5kMiMxjfezpKT1sRiTGOa/rVn
	b6IX2U5/EZ4Saumxc3SFqJN0bi7BKak4nqA==
X-Received: by 2002:a05:6808:221f:b0:4b2:8e26:bdd2 with SMTP id
 5614622812f47-50b5c4ecebemr13933676b6e.16.1792024009676; Wed, 14 Oct 2026
 17:26:49 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 19:26:48 -0500
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 19:26:48 -0500
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 19:26:48 -0500
X-Gm-Features: AclHuK91BdsMHJVbU4wd9iqYKa580uSZ-OhEQncSjljqKAdBVeh9GoyP5sy8tOU
Message-ID: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
Subject: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_172651_458435_4CD66CAB 
X-CRM114-Status: UNSURE (   7.19  )
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
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
 arch/arm64/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..59a53d7a75c5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -313,6 +313,11 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 16 if ARM64_16K_PAGES
 	default 18

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

