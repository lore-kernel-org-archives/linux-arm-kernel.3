Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75382C5DF9A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei9aAhCyyRq9nczFsrb/oQ6US+9hvk5Rs5Wuqs8mBgQ=; b=hDY7icXSa86arOvTvKe4UsybRY
	6+WEN3wfCXRSRDoAXxeH7ZX6es3qurlwZcocObP8aGH94pnA4bVfjfpifRCbrV9CE1MLDq+KdVpsL
	fl740bajcomSk2TO5PA+QD0ab297bU7n/Rw8M7vjXJi4MMnlB6rS60p0TfaoInUF+8ry6K5uznsfF
	knNicyN+5YDdUQbIxxiU0J+QtvHuGz4paKHegwcTSpRdCmYZsF8aje1kxCO49G6WW6/Zuxg6CIApq
	+tjoE5UcWvDIno1Swl5clMJb9cs+2jFaf+pv7EVowZmW3qrzJ/7cVkib2nMU3GbGPvX7tc3MWZBb8
	IHJKYrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAn-0000000EYct-0njy;
	Sat, 22 Aug 2026 13:54:13 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAj-0000000EYZL-1EBA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:10 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4954dcd6131so17149525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406847; x=1788011647; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei9aAhCyyRq9nczFsrb/oQ6US+9hvk5Rs5Wuqs8mBgQ=;
        b=RFIOSeYElcPFOpROpd6UxQXqhSY+k8otya0YcPr8+w6xsh4UgrVN5fOb/o9JAkfU0p
         ZkWb+kIWdJgnAEukCu/EzFpCg3p/0+b9lolUZDntGCvtY+iXlowR6UmimXc9bfQYmWps
         LZX0HMdBjeq7qS5m7VbUXEruISvM0OnRXy0/cHOOdqKM02WpnamBVdHdaVh8b8/KZmpl
         O3/HsDoZAwe/ql6/7BwCzrXtD7FusQ+lnF3pIhzQiRpYVpWiu+2F2xcZmRUYyvBshfD2
         feWuA8IzDHB+vq3QyDaiTw1ltKPBReB7rVUBsTD3UUKtJ1N7KmsoyOY4OX0gs1Awpd0/
         DCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406847; x=1788011647;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ei9aAhCyyRq9nczFsrb/oQ6US+9hvk5Rs5Wuqs8mBgQ=;
        b=XraDDIwAqlG+SKtTyUha3XiFn8peMtaD9u0PHAOmw8Id2FxNJSyGgPBJwcjHx9VgPU
         5IUT4fZrZMbJ8dPECMmnfmab4YEv9Vm5DYS2QEYcMYOnICABpMVAqoiwGF5HCF+moXxY
         Bady6MPZGds4WUCn8rPelWNlFmeKJ0yzueXVQ/Q5m+Cb9Y85ILqwFNT963I/REnkxfzX
         oi7KaQ9qAjbFHm6yl9SQ6gqTNtst4xcNplTqYieMIKZgYZlqpYmzY4cvW0cfYgsPC5aX
         TLx5HYQAB/ln+NR+kgywFmtmCKhQVNvoY0MX2kGSIStYrGYv3NcHTud2HEy0UQoyAmcB
         L++g==
X-Forwarded-Encrypted: i=1; AHgh+Rq09mkS8hzH2PpxTq03q3iJt/mEsl7W2wE8zSnHbO5rnoKZwKWIU0wU24iAKC5fP+LpI9+lDjWXpQMFMFAYydVE@lists.infradead.org
X-Gm-Message-State: AFuF++n9YEumpbT+PepyBBxIEak0cOroSxV491y2aESLPcilI7Y3vp/V
	AGZcs5TnLxqsGl+sSJjyl0UzGRQw/6IHzewgIsG1S8ufYYB7ZS74chu2u0XJsUiMiuaF259f7Q=
	=
X-Received: from wmcu3.prod.google.com ([2002:a7b:c043:0:b0:499:8f0d:36d6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b77:b0:499:48bb:417e
 with SMTP id 5b1f17b1804b1-499b82f4163mr187118595e9.2.1787406846628; Sat, 22
 Aug 2026 06:54:06 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:25 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=ardb@kernel.org;
 h=from:subject; bh=LLSSaN9rhZ2F3aT4P4AsB5UNc3JBgAb9PUajizskM3Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5Y0AZ4svS9ISbTaf6Vvbffb640AuEdFH514lyFxeu
 vB339++jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCREiuG3+xHy5/ozft6vo39
 a++HnWc27J26lnlODVv1x/cTz/MfferGyHBrod6fpd6OR87MNvD91aMtcLL+0Su90/UXLE4ohsc 1yXMBAA==
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-14-ardb+git@google.com>
Subject: [RFC PATCH 3/9] module: Place MOD_TEXT before MOD_INIT_TEXT in enumeration
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065409_352499_70195427 
X-CRM114-Status: GOOD (  12.37  )
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

Reorder enum mod_mem_type so that MOD_TEXT appears right before
MOD_INIT_TEXT. This will result in MOD_INIT_TEXT being allocated right
after MOD_TEXT when the allocation logic iterates over the memory types
in enum declaration order.

In a subsequent patch, this will be taken advantage of, by allocating
.text and .init.text together, and freeing .init.text by truncating the
allocation. Doing so without this reordering would likely result in more
fragmentation, as the truncated .text allocation would be followed by
.rodata and .data/.bss of the same module.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/module.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 7566815fabbe..0336a46733dd 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -316,10 +316,10 @@ struct mod_tree_node {
 };
 
 enum mod_mem_type {
-	MOD_TEXT = 0,
-	MOD_DATA,
+	MOD_DATA = 0,
 	MOD_RODATA,
 	MOD_RO_AFTER_INIT,
+	MOD_TEXT,
 	MOD_INIT_TEXT,
 	MOD_INIT_DATA,
 	MOD_INIT_RODATA,
-- 
2.55.0.860.g4b6b3295ed-goog


