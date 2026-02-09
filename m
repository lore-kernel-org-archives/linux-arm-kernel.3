Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF72CE9461B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N13aFr3ll/bgxK3rlveFMtlg5cOY53+sxi39a+VtEUU=; b=GS3Mdm3/6BOLvs+R9jue2jrvpK
	Hv58GnROZeZu26pex53JP02F0gcfuCxBMuyV+Aiu1x63w2JdYt8hrPp5DHvWPVgp1loZCa9qTjOtI
	V0zfwnTjy8DB8zAP/gOS2yojJcYlQqAa5AfSaN9IOzfI3vrF/Nqyzne8YRxQKlSt0/d5SlucYLvp/
	BSY1h0NYO9wI/5OVK4talIPBtUAHTs1oBBo+r6WjWoypnbn2OaLh0a0HbrmW3hvCdl/f11GQqA/va
	SaimfpGK83Ic4efAeY00EFLMMHHL2XWzJ4Mon7YCcJbKG1Q/lz5A9lXwxndEKKqK6qOPkxi5ZFZi1
	LF3AHRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwg-0000000G7y7-1jik;
	Mon, 09 Feb 2026 22:41:30 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwH-0000000G7RC-0pey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:06 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3f9e3c7de14so13682425fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676863; x=1771281663; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N13aFr3ll/bgxK3rlveFMtlg5cOY53+sxi39a+VtEUU=;
        b=fhTVj885pLJoFwbiOHGVA2W9BbixfPlQ9zzh9PCFc0ungaoCiO6BMVbvgutoeCT7Ql
         7+bqWDLp3y3IRRX1ujLUYwgESuZ8guiQjpWZdcj8BjgwOlu3dx+wuzC1BhJ2WCLmFhpe
         B6OV0crTInXo3xMQE98VtwxtA8jJYmC7l2MBsF5c9ixKG+mrfAYKYDpmwi6qUqjjTaHP
         hqhB+pWu9Dyyp3qKhXrXRd67NNu1haqBp7zVLckIALpjruJNG18xfDbLnhGFfwKZd2P+
         NVJxt88K7DfVsZD0yji77HKv0eYWIFlSUvj4gGRrT5h+OKLNj03WLEEXX/xuFkBPP0pL
         F4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676863; x=1771281663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N13aFr3ll/bgxK3rlveFMtlg5cOY53+sxi39a+VtEUU=;
        b=IuvdNqGtrI+mt0BFNCXZATCuX+Fl8mmeL+kLKbk4KX6SHYbOio9LYKbXpol4T7nEzv
         DmFHCcnY3bNRvYw/kA8eBknUBFB7RVWU0iY1NL2nNTEgQXyd15W2n89J3qCpuNvGLjqc
         ZybmP17S/9p6Kpc4n5nBsH1l/+ikZ6LQ/8SjAQZtionVBm/jEj7VsRUtFgPEbSh6qfrF
         sZJYJpexGs0YFjY8cSje0XxEFAAyRAhM/5sH/+q/amwJIhhc4Ko0BuJ1sik/I12a2q9U
         ELywOwpR8PvEUoVIVhV8L9Ii+dDV1umi/jcUSqZ2wXAslLKPtiq5NBdceh52mToGvIVv
         eVgA==
X-Forwarded-Encrypted: i=1; AJvYcCXqf2mLMoUgwsqyulHJDdwzIqy8gMyicLMWGGvSEFSqcHg2Pfy8dV/gIZO/nKqu/NC92tXcogR8XGcoONgQ6oxx@lists.infradead.org
X-Gm-Message-State: AOJu0YwufuzqGW+le0iCBIvWgqF45LYPq7fxpVuyhz23fvVfmP6dl3fe
	LxNi7LJsQdazheXbx1FYZJvVS73vgkGjxNEKVeZi1In5yrUwNuZeZrlUmJzBFw99tlSS0X6f6KI
	2EPup0J22Yejh1dpO2PsDIrErtw==
X-Received: from iobfj4.prod.google.com ([2002:a05:6602:644:b0:957:6f27:bbe0])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4b94:b0:662:f452:648f with SMTP id 006d021491bc7-66d09dacae7mr6166360eaf.17.1770676862961;
 Mon, 09 Feb 2026 14:41:02 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:12 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-18-coltonlewis@google.com>
Subject: [PATCH v6 17/19] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144105_259237_419071C4 
X-CRM114-Status: GOOD (  14.59  )
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
index ba5c2b643efaa..1f7465348e545 100644
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
2.53.0.rc2.204.g2597b5adb4-goog


