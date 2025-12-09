Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D61D3B997
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv1AwMKfqms6xWA28lythBC3EJWNFQ3+8EnRHrSdP2Q=; b=iNvShD8KiUfXixVuUi04+1YbPE
	3peHjkYORxyUcgRu8EbBsSlGFY9ZO7XspFOZywVuP74t43tK8vm83U4So3E20CjYS3HtcAcgEZEE/
	cF1pAu81o/uRa2YG7nJkGy72ejDjDIHMIynNXMTCT0mJZW3u5Ic+o3hoCL2nPybuOBQ12H+CzO3qs
	/znDGzybUSdCbGxpgG6Zg7zequ8FUWC+w1tUdcpQwjWpN2b2YCG25i0hOdvE3hTRU1er7NyDymR/r
	xWSFj2jJaOLu4t1lm4XICANAb9gmC5Kn48VbDFgCTI17XWOuz6ZAW2mXx07Epz2hecHuMKjaQfPay
	rIY4uczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hw-0000000ElTC-4062;
	Tue, 09 Dec 2025 20:53:16 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hW-0000000Ekup-3Q8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:52 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7c6d329f19cso11054921a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313569; x=1765918369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kv1AwMKfqms6xWA28lythBC3EJWNFQ3+8EnRHrSdP2Q=;
        b=dTCU7Ta+n6mPlGLcFgg/tS2NkcHjy4RErwgZVoawJSsTFnP8lotcx1H5OzGLgrTfaA
         pkKJIiFIyBNHmjHOPpqFtT4dVIHEPAcfL+4ONS5pKAlfvB5Kse8aKAGoIMZZ+e2lwqDr
         nCm2OkmnDFpO+k44tD7+UmDH8efMSXiQUUZ34AaZTaCYMppSPzcw7hJZdFDDdRtkod9q
         T7UbksVJmvS6gvqk0do+lJzuBg373wzTPvqDka+B2/Fx/XFLPgTmbeShQ3+VGtsjmTGg
         BMH2AQ2YtEhKNqjz+hLORJJt5a19NpRHtfwS946fmE0d/DADNfaW62uVhJtl+yXyKqJu
         gh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313569; x=1765918369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kv1AwMKfqms6xWA28lythBC3EJWNFQ3+8EnRHrSdP2Q=;
        b=r/mT8cYu/Y68/FnYeS+9hQbeks1GNeX4sh47wYbvxKx4f8OacYuVWDLFCx5qAX94lF
         WYVeVo77ElTBjKP7YqWlsnKnRhdd74xKPqYtLyTwRTgcyoXIuKyJkr1uKONaluJNu96S
         InynT/DYefU7SwzZ/u5KMIw3tMqE9hppboFhnibgPDsCRBAZvGgUciugRE7XLw8dTaXm
         5fkv47iyyZuSRGA6fIMpMVSRSOkbdYccPddD+S0xPuRKGHzsEssJwf5ldrsWSH22DfKg
         iucLLgfkXUKabRj1ZK4tRvDn93b3cLJ0oL5yPOOCJnmYyga8JujR0jg56BsNl9lj9ty+
         6jXw==
X-Forwarded-Encrypted: i=1; AJvYcCXBcY+lUYmv5YNJCmy4PIF4B/ANd448LX+deusNJVHdgbVFilDkcosaN4ldAXWrTtyWqvoig6g80J/iRY1f/fM3@lists.infradead.org
X-Gm-Message-State: AOJu0YxkXyub1EeigX0L+30xXu+Wde+UdBiVHALNrDlSjOFp8PopgRCB
	Dj1hi5hXMNphO0nvn9K+TlWDkLcp7HYm/ncTs+b0dCDFtb6uJQyPaMJ8m8QHf9xveiYoKIg2YOY
	Jv4cQnydCAdaH8UpA/T29YWalTQ==
X-Google-Smtp-Source: AGHT+IHsfvWbHL/8tFP4Ochtqb9Gms3M4fhZnid/Y2W+XVpjJijy4/NNK2sgiQPwkhfDucK/Gz477ZQXRQW17NPhgA==
X-Received: from otfh13.prod.google.com ([2002:a05:6830:224d:b0:7c7:6609:92cd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2685:b0:7c7:5f6e:f26e with SMTP id 46e09a7af769-7cacec2e507mr73093a34.24.1765313569578;
 Tue, 09 Dec 2025 12:52:49 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:20 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-24-coltonlewis@google.com>
Subject: [PATCH v5 23/24] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125250_957252_D1485325 
X-CRM114-Status: GOOD (  14.07  )
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
index 148d427ff24be..f44822b7d0e20 100644
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
2.52.0.239.gd5f0c6e74e-goog


