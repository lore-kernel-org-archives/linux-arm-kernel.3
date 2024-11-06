Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D62D59F65
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9aFwKcH7xfsxMqd/0dp9kMmenPJInTV5I1fxqsIE+8E=; b=4oMqQTCWsN4/XBq8VtDnRRhekF
	2I8feDwRmD8yqYJjUBD7N2g/a1E/qvH1T2mqVnLUd4FA3YqnDZglYaBdrPJzrYRCqS0cFmF+bw5TY
	Lqo+umD6x8DmL6gINypmPxZvsV3ksMTHswMGvN42QH3W6r3NoMlsK7knjxgdE16d2CA5rJiw4sw4u
	BiHl7HZGXPQ4PVS69fvAC46lipbunxPNUfiq+EA3cq+LWMmkeSfYEJelCRHYZMr6E6wNYn844a5Qo
	6s7bWyuB9HiZcRehzzyAZVA64o/eppZcWW0zQi9CMeVSB7GGw5U84ejWmLs9ZoINipo7oavW0VJpq
	r0jB1SnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lDM-00000004PsY-1fGC;
	Wed, 06 Nov 2024 18:57:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lBc-00000004PgW-3m2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:55:26 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so219809276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730919323; x=1731524123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9aFwKcH7xfsxMqd/0dp9kMmenPJInTV5I1fxqsIE+8E=;
        b=Jj+nUGsU3ZBmGtCR89RzjvQaTcWQQHCwD5TquwbcnHgCVcCxZsZqjUa6qGLsmz+RC5
         DkWMd4W03iRhLDmvuhOBMsLvBsbfwtqUiQVn7GjOijwjMV3Yt/V+FR5b8xfynooJwRUY
         j+uRCs+lsx7eJmoz+71QsFeUJTl7zO38qaKT5UeevKV3726tZ0kZTOtwXTbQHdK0pOmg
         2MXnNfy7vzGCd2MFt+/BSqLgcQNJY/Bqk8l5z+vZdWxa2/UboUJlvo2bBlf7faX6buzH
         ysRbkxd+ABPQ7UWSPzJpDjuu2f7JaLqHgUzx4Ipzr7BBCyWur1g6m8ntcXbEjf9/GDhV
         d14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919323; x=1731524123;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9aFwKcH7xfsxMqd/0dp9kMmenPJInTV5I1fxqsIE+8E=;
        b=VVvVUtw0lV3K9h3M/GuL17ZyRgOuGCFmrD+8yGfOqD1WtM+1IgtLt+AoJesNKGlJ0O
         2g24d0vlF3Tpi8C6Gd+AjcVDmYvq1IUUDi/MvmxFiLbK/aQQnEN5qeCRZ+eS6ExScH0S
         QIvB0z0MGv33JxlR3X8lIx/oTlTst8dXUZ8IN0lYqiANLfk2vyag7VtNm0FpkZhpOOIK
         VRoj3DSE92vMkAv7LQ9/A8VjTqeo6rJNdrgjosn75Jc3dyvLdwvoPz9Tj8C2rCvTG8ji
         3p0UhETFDeiHU6KBYPiwgNBKa5oY9Ta6QWbIGkEj2RYMABeOiTwaTHuGnByqvWXKm9ej
         PHKA==
X-Gm-Message-State: AOJu0YzYIEjbDfBpMH9XI8SbrzP2IsGVrJr4/nZ91N26NksT+BGIatLZ
	3+j0/wL4XmbpHjiau7DYKnqG5RiCH32O9i+MyZaKUwM+S3JZtRjSPFRPfDxyeLpbvE7pyaosbwE
	92KVZ/UzVUjYqKdO/gaZfgDCg00gQZuDuXiQRSrQWlz7V6x+KOJmPYDMMG141JZ+dxVaeZiXaUn
	ZbffthbHLLM4gbZ151rsWIBjQ/kpCf7eQe1kZMrFK0
X-Google-Smtp-Source: AGHT+IGPONLChWBzDaI4hMdqix44IABUjxLoSmBsJREILiyu1wMZy3UK5o3COAt5JlLKdKUIEutRpT70
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:91:0:b0:e28:f2a5:f1d with SMTP id
 3f1490d57ef6-e3087a4ed65mr73087276.4.1730919322888; Wed, 06 Nov 2024 10:55:22
 -0800 (PST)
Date: Wed,  6 Nov 2024 19:55:14 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=ardb@kernel.org;
 h=from:subject; bh=Wni1dkCI5u5ccU9XlEF9N93Tkgd7rvPGwlYBCgQrDjs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV179yQFyYTnn1+JzN51YdnKTOFXZgx7HI7LMj+VsBRLv
 iB4t9mgo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk6zSG//4nAjnZvMSr3rD+
 498mphi0ocvy9znvXKG95xNcF0+uP8DwP+lvxp/LIqvPy+1VvH5JYFVbbuTFa4tsFCM2edhGMrl M5wMA
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106185513.3096442-5-ardb+git@google.com>
Subject: [PATCH 0/3] arm64: Dynamic shadow call stack fixes
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_105524_971071_A27BADF5 
X-CRM114-Status: GOOD (  10.16  )
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

When building modules using the large code model, the emitted DWARF
metadata uses large fields for the code references too, and this is
currently not being handled. 

The CIE header frame contains metadata that describes the size of these
fields, and so this should be parsed and taken into account when
processing the FDE frames (patch #2)

But first, the handling of this CIE frame header needs to be fixed, as
it currently [inadvertently] used hardcoded defaults for some values
that happen to always match what Clang emits in practice (patch #1) 

Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>

Ard Biesheuvel (3):
  arm64/scs: Fix handling of DWARF augmentation data in CIE/FDE frames
  arm64/scs: Deal with 64-bit relative offsets in FDE frames
  arm64/scs: Drop unused prototype __pi_scs_patch_vmlinux()

 arch/arm64/include/asm/scs.h     |  8 +-
 arch/arm64/kernel/module.c       | 10 ++-
 arch/arm64/kernel/pi/patch-scs.c | 93 ++++++++++++++------
 3 files changed, 80 insertions(+), 31 deletions(-)

-- 
2.47.0.277.g8800431eea-goog


