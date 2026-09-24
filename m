Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDXNTscT9mKzWNXLRmPqiMgiEZh+nFQVdJuFACvc/Zg=; b=mqqwxtk+9x7/X85jb2eZx8Jp9u
	VU1mhTIeSPimmooE27jvgmdzZD3tus7zs9ww7WdM7H/BWdoJ+zr2rHR6kwpQEvnsZdWluqWWY6KZx
	9OxYNsMLMhk28rbTWgwDgWFA2Xk6JDB7agCxUnn9DTg/7ircRX2MS96U9FLRDFXQgqbkMX+FUi7WG
	4gcNn71TfnbySwfALCNUXf3Ddy2XR9hdzefrT/STdeiNEiITb7RxYAg/VBJsd6v5XdwrP6TaQvN5M
	rrf3TZBHqNTY0vPGa02kEpJX3+C/8atRN+nqtegfLWdWm5MNSAfJvpRp4UfzfayltmJ4HbSrY6X95
	B2JLT5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHn-0000000Bkpm-3tKv;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGl-0000000BkF9-2PU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:30:04 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4cd3e90ff97so140347b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271002; x=1790875802; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDXNTscT9mKzWNXLRmPqiMgiEZh+nFQVdJuFACvc/Zg=;
        b=c1F7QyvLw3NVI9xEyucuXqxXCCYvWwmE9aIFKuSyfLwd3A/TsEtNHh7RwceqZBDHVy
         OVDvwIQfdaqjXjz1ScesegBPzWFK4IrayEF81Evs+6taOJp8vqrXsDs/BfBZUZTaDrIM
         yjvUvGV0Cz8gx5Dpdy1QXzumTewIxmr+VYLlGN119QSD1qpY3zZ+VkzAdcscY0cCW4EK
         1aM7maq4K+F+4SQo7zOKFANBwJULQurKcFtKhYS10BiT5ZzReqyVvHb6mxsRrK2wuM1b
         QKXCqvTAqEclo8LeL7AeI7OBJHRsujmHuRKDJ4na6B6SsJNc58dmeLDdHSw8G2pgaaq6
         NACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271002; x=1790875802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDXNTscT9mKzWNXLRmPqiMgiEZh+nFQVdJuFACvc/Zg=;
        b=ehBy5i7eZuuQH+MnuYVb5IpsFOPvUrzw6r4uNT8FujsNz4RJxP0+8Ty+GyncOz29Eh
         HfEUsVAwU5UC9+aICs7pQSwzoiYO9V2L+32phcXP33MgIuscmo7obpPoIejELh24Wn4U
         fpx5OG5oOplmDpctAPArEYy3m3sGgJ5TPGEszFCVDS32m3QwrxWMau8n3fHp0JAM7kA8
         bb3uy8uS4JQMFPhq0Oe738MR2GeNKYT9jmJa8aAkYEiUhm9OxePNfDt4IXKqY0Tx1hOx
         nSydw6b5AJ3hVER2Wpl3OHtkMkQunuxfTdDPV+7kc+qb60yIONa4vmwVCQOAH4CuAa0h
         xPXg==
X-Forwarded-Encrypted: i=1; AKwUvBwG6p30qVDgXrLjPQtslQKc/ZTcEnncgkPM0tqeDuewH/++PMNxaZY18kCsNjf1/Q89NmaVQlARYuLAKqhDdstm@lists.infradead.org
X-Gm-Message-State: AFuF++mBeec4pa1O8SohkgD2jRnQg8LYqoC7Hz2cab7yQAhGTISAtRnw
	hA/Y/D8obkciapYLn3OHLSy5XUyyypVDIwrvTLt2Bcwc6NvUvaS2CeUkiy7DA+N6/VvxLU0v/Iw
	0gIN1Yr/Q3QLhLzbYG5Bi1L/s/Q==
X-Received: from jablt1.prod.google.com ([2002:a05:6638:ac01:b0:5f1:a6b8:62bf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:11ce:b0:4b9:a88b:888b with SMTP id 5614622812f47-4d72c739696mr3040492b6e.33.1790271001357;
 Thu, 24 Sep 2026 10:30:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:27 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-22-coltonlewis@google.com>
Subject: [PATCH v9 21/22] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103003_638300_BEB64B35 
X-CRM114-Status: GOOD (  14.80  )
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

Add lib/find_bit.c to the KVM selftests build using the same wrapper
pattern as lib/rbtree.c so selftests that depend on find_bit helpers
link cleanly when built standalone.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 96bab7002d39e..cfd1a4fe09ec4 100644
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
index 0000000000000..5534248c663f7
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../../../lib/find_bit.c"
-- 
2.56.0.rc1.310.g51773c2048-goog


