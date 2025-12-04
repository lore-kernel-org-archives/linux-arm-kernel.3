Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1474D2A532
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5OBbaGawSd3zuwB2zG94CYQFa0ZhdmCDQUS3f4NQYYI=; b=pgg9UsXrHKZU4vusFOfqzWcAza
	gu2DIahx4+XipTu8eKmaxB+GqtAwPy90QsuEXgtI/feNv8IRjVJeF8s21ioHS0rrkc8BEsl8OhxfE
	G9kM7yG+sq2/txQ84Y5vXgv9vLRvgtRWZ8VrvllG9s8ZuCUafDlfdZrCcwVVJVSL1vi8kc4hLjcqC
	L5Y7vZNyXmiQ41bTO+yt2IPome3Xov4I+9cQuGjSjRqqQ8vBJJcAKw43O9frNtPV8Swd3FJ+qC3ja
	QeO1xTKfUS6MDJRWjlgzR+jbs6h7eymY3r/5ELtdxaB+fXqBPdeLDNpmZ/9yEiXvzm4NhyGt79O0t
	6/vD+C7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGC9-00000008ckC-0aCx;
	Thu, 04 Dec 2025 20:44:57 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGC6-00000008cjf-1w2n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 20:44:55 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7c7017d5284so2676878a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 12:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881093; x=1765485893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5OBbaGawSd3zuwB2zG94CYQFa0ZhdmCDQUS3f4NQYYI=;
        b=d519mn7HIiHLWog7UvXnYE1Xox/FXv47Dqc2b8Z7bNqDd5qUvupPAAfnhgir4uP+lq
         rMq8u3cwDf/wwZSQJRvPTfiYrB5e0YkbQubRmX1zo7NBg4zk06BiyH5gUWkNRkgYDinf
         2ACP8ulKF21UQbvog878pTRf4orxGAz55doYKW3t0DqE88lvv7dXpvdCu4TSvZAvBoa2
         6zKsI9wnSni3rUU9NmprszT9mCrFhy9X+UCLbXO4Aw27bJMA5/MQGNejrC5ZLm8hcg7L
         IhvAx1dDxeRuCDC9bgmI8eqXj3iA5lGZ93j/ZruIn2W9FlFsha1IYu9Umr0HOnFmp8Rn
         dHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881093; x=1765485893;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OBbaGawSd3zuwB2zG94CYQFa0ZhdmCDQUS3f4NQYYI=;
        b=YemvLzfS/12gFjBeA6z8ZT8cmntzs2HS6UZpTXFsQoeYbBXS9fvXpYloxmgQY4L/2e
         /UH6kgZAzkCOAjbqKwNlq2HVc93mSHTIWRJgdK7hqMxnnP8DucXloNGJHiHOpsZL29q9
         qw8yZOCi3FfEcvmfj38RQ/idEuyLdSiwEzE7WXrGQjw4J8/UiOqweUSQ8Hlz/HItx6Fq
         Wpo/VP6Z6JrJg5nY3tgBDbOlp6sEssGb1rCyJqi1Atae7Yk5Gdk4bfmFEouTyGF2s2b0
         bCpBgXsGQe2nNDUe1XN7e/Pud8DGQnUMsXUK/cH8Pl27qoKcbC8BZdbsulg3DTYmeaai
         +Fxw==
X-Gm-Message-State: AOJu0YzPsdPAI6yh0sPWE5OBcsIUcZKYarHCzLv6hvzNnpvU9Tzu05TV
	NSaj35rxwoJGEiak8E+Y0FCKdmq4Yt/007lI7+TB6mwWQ0MwnDGloHMOxQqLUik2JrtnJ5EfdzJ
	vUatmLu51VQYq+IIX4SZKVGo2Cw==
X-Google-Smtp-Source: AGHT+IEcuhqU1li6sdaSW37CrgBCboSMB9naa4c5cngUNGLEZx1liCv6AqNlZif0YU6QUfNpDohXjlMOknbgvyUj2g==
X-Received: from otbep14.prod.google.com ([2002:a05:6830:6d8e:b0:7c7:9b8a:684b])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:410e:b0:7c7:8922:ef7c with SMTP id 46e09a7af769-7c94da26dc6mr5006480a34.4.1764881092785;
 Thu, 04 Dec 2025 12:44:52 -0800 (PST)
Date: Thu, 04 Dec 2025 12:44:48 -0800
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL/yMWkC/5VOvQ6CMBh8FfLNfqQFK+DkIKuDjoaBlgpfgi1pK
 0oI7y7yBk73k8vdzeC1I+3hGM3g9EierFkF30Wgutq0GqlZNSQsESxLcpR79KGWvcaG/IYvQ4Y
 CDsHhu3YGBXKBiqmikWnzSNgB1rLB6Qd9tqE7iJiLePrZ1/JWXs5QrbQjH6ybticj33L/jo4cO eo0S+u8ELJQ4tRa2/Y6VvYJ1bIsX0FW+wDvAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764881091; l=2150;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=DkT4IoaqkNBfsju7O9/ZY5rQLx27/V6FGQJUG42Mup8=; b=MQ7J60MWDpuY5nepRRb7zNtHXX4bLPtT6AZPE1FKfLerM+41qAbUKMX5CNiL5AZEagtry6KBj
 gOL5zL1DMZTDVJPugwXeHn5WjWgPy/8e2W2HlNAaRr3yziNifi7kXGj
X-Mailer: b4 0.12.3
Message-ID: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
Subject: [PATCH 5.15.y RESEND] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_124454_526869_B822C582 
X-CRM114-Status: GOOD (  12.41  )
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

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

|  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
|   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
|        |                              ^~~~~

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). Since there is no upstream equivalent, this patch just
needs to be applied to 5.15.

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Resending this with Nathan's RB tag, an updated commit log and better
recipients from checkpatch.pl.

I'm also sending a similar patch resend for 6.1.
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..109cca425d3e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,3 +25,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o
+
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)

---
base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
change-id: 20250728-b4-stable-disable-uninit-ptr-warn-5-15-c0c9db3df206

Best regards,
--
Justin Stitt <justinstitt@google.com>


