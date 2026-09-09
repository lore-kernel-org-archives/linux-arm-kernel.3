Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6BC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9F29pgqzSEEGhdKXzSoeSjrkWbfxwwKzWWjbfaJg52M=; b=lxaq4XBXp4BqdNDZtwmFMik3SN
	SwhQtQlj/pxfUjD9/GV0oFLorJLuiHSZy0w4UGSwWBXyzpuYvWqbLFvyW4uS5uXBhIVjoPq7LDpG3
	1p7uU+8b8TyRJ/4uQ+k5E0F24gL+rmk9MZN+uS1/5Qx96Z9iRsE+N7+eZBVLGDOU8EK3IgbCHmMdA
	jgeDkoaSLdiDxek3lo7PeYLZSG4MaJe6Yzmn+QEbAFljmnRaNRW+IVzaDSgsdygg7NxWcdre16dEa
	pUO9CO0VnbxL0LL0MA12TGfCFXeUuHF+o9G3MAW1myrutNx1Es363yQO3FilU6eYpSVg2daXje7HG
	e+z1LCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEp-0000000CKjO-2Nxv;
	Wed, 09 Sep 2026 16:33:31 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEm-0000000CKhR-131S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:33:29 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48585fce16fso1225893f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971605; x=1789576405; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9F29pgqzSEEGhdKXzSoeSjrkWbfxwwKzWWjbfaJg52M=;
        b=jBQf7x6Dcb7PXL8cOpqstr7JnINQJEsGFfuArAuChX46RY1UQEURMzuUiR9qQo1te3
         X9DLRnMu/YjeK2WSjhABX7nxxMjqNBJdrsAjiq7B1YfWByP+qAYSZiHt9aj2BojwQDwE
         N5+M0WQbWI2oZSBWQtvaAlDLWNB+VwdPEGJTByDIuX2yWsILnzsGn62iSXhFWXHhAXW0
         AlGWGL4J9UqcnB4TLLafiqZgNQeIHn6ZUndwr8Tz7DwmZK62JGFBRGfoRb3WsUbQIxIU
         IL61Z8Dt7nnJKZPwOd1k5d82HmQF+n3uWhJwqQULgyWz2LRYJEhw1CoWY7rnFx7nePYt
         chLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971605; x=1789576405;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9F29pgqzSEEGhdKXzSoeSjrkWbfxwwKzWWjbfaJg52M=;
        b=a+cgdzkSnVlr1kirGW4G9fVCskwXEsnWnIaPCTniA+/uJoFZEct90VqKoEG6ouzbaj
         ZX4H5w7o1MvxuhZn52MPuOABnKJA/IymwPbXNhjYoGX5Y3NNssSpViD98LHsTkPbs1fG
         jB8uTAvZH6sLkq5NL2oWacgX4Vn9gGz3knIfJuq8mwZ+uggZUPELVjeq/sT9LHMnEzvl
         gfjkiniJP1r7UJM0PW834rAtpPhxS6YSa/A0znxsMZzbB6JiwySHBe56eR1e2mKtJ4Hj
         W8BhL2JlfZFHvH3l+09PmqUkEJsWRsGEdVrCnWxDJiP7hQ9+kyFFd52VxjEKMVO8qDzB
         eVjA==
X-Gm-Message-State: AFuF++nuvD4RajrXrAexh3B+fJp93db2C99FxEn5p+0HpxhwS3WFdrKT
	Mcm120MgvvbHi4J1/bWB5jgR3+fwOSMfMS8xI96Grs+cNNMnJsGP2rI+psnSFxRIHXvkp9XhTWy
	455FLJ9LfpiL84INdtPl5ELq5f+Nu41RSnT1jn7Hk5MaXhZ7VU9GCV4D2LU0rbdFq38XZf0OA1J
	g6GK9WPHAQWD8g+yUfd365NzWLlrq2cyOlXqh2TBPRtSzB
X-Received: from wrbfm8.prod.google.com ([2002:a05:6000:2808:b0:482:9ac7:bf8d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240b:b0:485:adb2:625e
 with SMTP id ffacd0b85a97d-485ba5ac434mr5089735f8f.1.1788971604178; Wed, 09
 Sep 2026 09:33:24 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:20 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=ardb@kernel.org;
 h=from:subject; bh=BN5mdi+XwJG6+zGaZF/ZnbkuWncM32zZoRVtJEYNAIU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV8Bqf5uZVoJFu1eunuMvsyBTRXrrVpNvRxzb5bmbX
 zabpP/vKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPhiWf4n8M6XUJFWvTICnXB
 PMMTv4UcYqb/fuV343ns2pWy/jd+BTMy7HhcG+ZhOe+g414f1zBng78K9jnS5SuUpy7a2RH0v4m NGQA=
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-4-ardb+git@google.com>
Subject: [PATCH 0/2] ARM: Use type override hacks only in NEON code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093328_294465_524AAEA3 
X-CRM114-Status: GOOD (  12.19  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that the RAID-6 code can no longer be built for user space, we can
drop the direct dependency on the arm_neon.h system header, and include
asm/neon-intrinsics.h instead.

Since asm/neon-intrinsics.h has all the type overrides needed to include
arm_neon.h without conflicts in the uintXX_t types, those hacks can be
dropped from asm/types.h, and so the file can be dropped entirely.

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>

Ard Biesheuvel (2):
  lib/raid6: Switch to Linux's NEON intrinsics header
  ARM: Remove hacked-up asm/types.h header

 arch/arm/include/uapi/asm/types.h     | 41 --------------------
 lib/raid/raid6/arm/neon.uc            |  2 +-
 lib/raid/raid6/arm/recov_neon_inner.c |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 arch/arm/include/uapi/asm/types.h

-- 
2.55.0.1003.g10538fe699-goog


