Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59TeqgAKhZvxIms330HaGI06DkqMrz/YA7lL8opNhPQ=; b=MHEo7yzwWPR08fp46zfoQiLx4n
	nfz65J/6vglHTstgbl6T626t6+43xGeoOkm4R4Qi0zgW0rUCz+jaMfb4Ii1mHbOjW8n8gpy7Va/Il
	I6f5z3E1smKuaAhtJGgitWVMGaBtB+JdCgJX03p4ND19G49EHGbHOk5nHv8TQkQrOWUn0F+HRue4Z
	M4A8lvyOUHOdQlSMJP8tIB/K6gbbkr6Q8O78ub2rETekQO7g1VPTPIXK1LYCIjk7gWKfkSYwMP9OG
	d74LdRIq6iW2go2nJt3wUbBX+46g9i2rvxCoN2+ONMAfp9b+ggxJbsTkF554CXKpVabts+7hNZYuy
	r+Jg3PQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gz-0000000EM3f-1E11;
	Mon, 04 May 2026 21:19:05 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gn-0000000ELjV-416i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:59 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-68cfc614246so6160231eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929532; x=1778534332; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=59TeqgAKhZvxIms330HaGI06DkqMrz/YA7lL8opNhPQ=;
        b=Yu/DmdkywSR+Iey9hfD05n6nG7QGA6bZGOv5A8aFu+uqYZXAQwuaniqsdjzag0f99P
         aokK7wjeFjnuLe7D4Kl+LNK9nPVSwIh7yTvGe9hX1naE70280bKOUfkjQP1Y+SB/xnP6
         UDGHiDZ5cpJ7HtnQhgBPHUu5VXL7HQwK5+BEyKri5DWRDkAfKypHp2uf0fehG0a7HdBA
         AfluS4dslzRX3QsZJzC30emQZqKIjJpw1yfuV99fo1KN1hBFY06RabwpTJRGGebY+pde
         6V7c5sWoQrWq50AeBZYTgKiQ9jB84WL+h//kkKVRgt7MuOQMHvSQPc9wu1XH6MyPfEWv
         b+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929532; x=1778534332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59TeqgAKhZvxIms330HaGI06DkqMrz/YA7lL8opNhPQ=;
        b=gFTGJxSShAjluCdNoF76KGXfkZxM5tqO5/XFe9BX6Z68lpgwsnyY3QVz4LzZjmRjlP
         CqFQlwY+EA6wScLyvXpjXZmppMlPUSRSUAxDZOwssCwqDlgVKtdZnUbdP0asTGX6jiqL
         Vo2PPaeo1Xfsbm6AztxYAbrmf/+FeRGnpxEfyRcMnPxrC3HgMQyKq6ATEGHse+/y+u4D
         Hp3Xpmz1Ke8ybq0grfOiG32lhroU0UBurL0joCL3btKu6obzQbVVIAboMktyua1nxIEc
         gEOlvi+MjzR/i20YfTWWKRTwx0HFlf30NatJCzFi04eZ12ko1H7Uo0aTOB/pN8xvE/tz
         fhqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CyIh26aHbiEY0J4mgOnXSvBsNwHtjzAh43JkjEaSNdy4djB4TLoeWDtH8RQeI8nzZZwKudfatUpW1z3f2CZ7w@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZMVN9R6Ar8ewXyqLnQN5juWPCYIL1ankUWui6dhwTR3GhsXz
	WkQdwFxGbbI8UdUmb9+06fcumVFGLGTTazmVqsWgfmIkqasrzwZA9wxiF9Y8YnkX1iR8BYHSWvV
	Rml2BebUJ4+DgxTwO9eq33fAuvA==
X-Received: from ildm3.prod.google.com ([2002:a92:8703:0:b0:4fa:5514:a367])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:629:b0:696:757d:1942 with SMTP id 006d021491bc7-69697c60c82mr5023525eaf.32.1777929531976;
 Mon, 04 May 2026 14:18:51 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:11 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-19-coltonlewis@google.com>
Subject: [PATCH v7 18/20] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141854_174519_0F404E41 
X-CRM114-Status: GOOD (  14.32  )
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

Some selftests have a dependency on find_bit and weren't compiling
separately without it, so I've added it to the KVM library here using
the same method as files like rbtree.c.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6471fa214a9f9..79a45807865b5 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/io.c
 LIBKVM += lib/kvm_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..67d9d9cbca85c
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1 @@
+#include "../../../../lib/find_bit.c"
-- 
2.54.0.545.g6539524ca2-goog


