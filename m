Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865A1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2HkGuPdjC+GNCrApZe3pzlcGnX64te3qygbh3oqdwo=; b=NIInBURA4r0IsqOP2eEu4yA5vg
	tIe0V6v1SI2B28k6vDwNtaTQKN6Y15FonThrIl1Iii7x0P355gXYn2RKBwEqclAAEJiF2G/g0HPsO
	zDcLidhX2S+YajeYlwnXIJ91DqaUeVkImO6vdExXk2hqKgiM6iMVUE2dLNsZcl3huq28v9QR3mBrH
	MJsGTnmwBzLgFx8QtmvIfUqq0R74rc/UI0tAItUdVvFaFLk18pAHXa2TZ7ElGS81O0tRSSCk8jLEq
	KxnyXD251cZEzgb+hLImjolPHlVC2c9ljmabBfonQWtcw4DEkr76g/QQ4iZ4KmBPvbKAWOcaS/N0/
	cdWdNpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugV3r-0000000FR5X-1raH;
	Mon, 28 Jul 2025 21:07:07 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugV1O-0000000FQwS-2Lwq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 21:04:36 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3e3e6bd9e7eso6050885ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 14:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753736673; x=1754341473; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g2HkGuPdjC+GNCrApZe3pzlcGnX64te3qygbh3oqdwo=;
        b=x30sHcUwKNOsE0dmozafuiAY9UGEWGJ1HTKzHtOtqS9NtbjmPZZFcN5fLO/QXYywB/
         zFu+nSlJX/Oo/ClRaYX6yfaQb0q9236QY4GoK2jpvLM4lA9nmfQnmIxe/dj9FxXLLhKx
         FbpkQgvsf3OwTTsPlyzUGrggay+KCQ/P/utDfNNPwqtkO3BbloWgMOt2CBloDyHD5LxZ
         wN8IVQbrSfry1P2QJn/ZoXDzQJUpRJKP1qRrDuPlQDNQCUl6ZoIkR+5pMf2bQzYdrIkI
         UfyOZsGgHNL+zxBH+BE590Ahn4IqnvFt0oHNocJ+w574XB+LMZU3YI5iHPlFS/A0/+EO
         Ubcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753736673; x=1754341473;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2HkGuPdjC+GNCrApZe3pzlcGnX64te3qygbh3oqdwo=;
        b=lMkl82pimDhBvWDve1X0LJqar6pGbD8LVdNqe6htiT0GIQMprrMJ/VGd5k6tEp6sWc
         cJ8UtGTWhPGysSRR8q6YhSfXkWdWxnDpYMfbvfnxhlA9JGOO3sCvUbfOyap3prBj3RAf
         Lvh2qnl9dKrcdooPlI8hWnayBE0vRBTW2thyHXRzgbsQbTQuoVbXI9WNwcQ0nzYcgDrL
         pHrsLqRjdAdRTphLmwKEf49R5zP8cw8+2//7my3CzOQycuWbnnOe7bdQYZAeSJSHYiiQ
         rum4tZRNHCKCN/JVpD8+Yy9SiMMQjwYvivMSaPVZClaw1SmvZeisRMNTdGzT0/wRUh2x
         i0vA==
X-Gm-Message-State: AOJu0YxWOOXehlk5Y/3oSYst3rEKJcRAyv7Wlu74VTrr6Yx2bKmTqrNd
	T1a+hrjtUylkA3cD3OYjoriZSLtCLire25Io0/gRFXt180yvOkcXHcp0XE1+albW8r7Ee5fAwXr
	tErVqRpRACsvFJJYjA8TK+njJ4w==
X-Google-Smtp-Source: AGHT+IF3ElRNmNEgLOiZ+XFI0ik5ZaJq9q7/NhwGFbXXUTCuR7C+nhEBtW4V6iPFUdR2A3KToowq+hl+CNEjc4UEBw==
X-Received: from ilbbu29.prod.google.com ([2002:a05:6e02:351d:b0:3df:2bc3:4c40])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:19ce:b0:3df:3bc5:bac1 with SMTP id e9e14a558f8ab-3e3c5250ebdmr229349785ab.5.1753736673097;
 Mon, 28 Jul 2025 14:04:33 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:04:24 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANflh2gC/x2NSQ7CMAwAv1L5jKskELavoB6yuGAJmcoJFFT17
 0Q9jeYys0AhZSpw7RZQ+nDhlzSxuw7SI8idkHNzcMZ5c3JnjAcsNcQnYeay8S0sXHGqinNQQY/ WYzLpkuM+j84cocUmpZG/2+gGvre+/8Gwrn8ZZ8nEgAAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753736672; l=1896;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=zFb2Oa6g6C1AFnPxXLdZtpXeNv9w6hxscbJigmNdpCg=; b=HH73qpE/zdS+HCUqoI7QlwguMOVUWIcr2Ny2CgnzuAwg/gvWWMVd4GqIurLvfypFGt3lDRlob
 13Mch8agVrpDeZ9Y0oMMvccLNTHA6rhTzU/w5faraqws/Vx98Q7G6j3
X-Mailer: b4 0.12.3
Message-ID: <20250728-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-e373a895b9c5@google.com>
Subject: [PATCH 5.15.y] KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer
 warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_140434_619007_FA8F1CF4 
X-CRM114-Status: GOOD (  11.56  )
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

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration").

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
I'm sending a similar patch for 6.1.
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


