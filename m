Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD00C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=; b=GmzXNfSsLh20bDH00BUpM1M2aX
	1TLIKNuNgK8Ti9eRMsk3iUdhLH1XwAYmuM3NJ+KaJfxrSfMupAoGFRzrjqkDVI/uhx59LDpjP6ceV
	d8AB5ffUKBh/xsLEIRJGmVOdsfs4Vo9EauO6bpFaMGABHDxiJ6vFmu66iKo434NMGDdp2POwNxfqU
	04ZJd65gIW6Uj5NwXim/gbfUGrjBdL/+2VQQYLrIokt+vFF3CpMkxP3C599K80qeG+l/mzcANX1eg
	a0nCiPIl/Ptn1lzOTq0Fndj+xRihzsQHIwZTU8nMpFtmI+B4JRrvIcqJbRvjXw9Z+xtPFmFAaELT1
	gt3Br0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzjvQ-00000004W6N-1kqa;
	Tue, 01 Apr 2025 22:17:40 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVl-00000004LIF-491a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:07 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-229668c8659so6678795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540425; x=1744145225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=j1lNkFG+qge8sZRlywaW/GQPPfM8It3trFuOd7MvTUpHPuv0QnC84CwlLRusISxcym
         Ea4TmqlVxGPIWQ43jlXaCKPM4YoI1Oq40016Y9uctbH9zWmAJSQw08dDWtiTCkUYVuua
         zxvbs5yecAESI16c7Bt6yBDieXznVYaAznumXw4XHM6+X5nbzd9TUcGBF2oAXIXLKiL4
         mN7rw3mLdHPJNQtSdtHPlUsmmhVjoX6UmbahSQej/gIfcQuc98Q5GyaTaCHlEmrhA9DI
         ACUPnbqsT4acG7pXIIp9lfGWmM9mUMbjRZgIThIe4cBLkkaJqcGLzAAl5g0zpIOK5qw+
         6vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540425; x=1744145225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=H+DhsvGsL39D5O0ZlsMDNOpY4IdWylVNF36mh0XZv/Gh2bnfvdvpZ2iUhnvLdgMdel
         yjzfqKavryW/Qc/j7IdhDXznowimPiGRPGh8in0G+yfxKrL6R5Bg0q70B6oXd8f3eIYn
         ErKR5zqTvxZgivVQ6rjKsZFB2X709Z3JkJkOloU1ve9/4KRUX9Ickd2rYJRZXPgfc4Kv
         G95ei5yxZLfYCzif6V2F/tD+C/PXoMATdbgRboj/PMfyTrUWtF1/UdVFkfCFEIFuyKkW
         CugT1yr7AwTuGWK+yWKfxLeo/ApA76GSNtDk848C0M9vcAu9J58BMINDCJ0vlGYwsO9H
         hzKg==
X-Forwarded-Encrypted: i=1; AJvYcCV71Dk2a7eo26xvmJroxLwPZ/ojjwwJfdGRazmBth/hLaKqubydtEYC72mlN5KxWAo3LWBVSXtrha5IjFiGeE6Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6exwY5IWuI9Ap5NTzQvVwQfecGkT30V0CuGY2e4R5i12klr5N
	+Fat2gRVB5TbNAN09wd1tSaXT3KprS261Z88p9TTjYmx2pscdEOXdQE5xxIMUrb80P6djVOFt4S
	rJg==
X-Google-Smtp-Source: AGHT+IFGVv11dt7rUK+obI9Bx4C62kJ/MvcG+5bk3TDAhhA7vlmUxcL80d04RZFegq2L9eKJhwQmELWuf+4=
X-Received: from pfnz20.prod.google.com ([2002:aa7:85d4:0:b0:730:9951:c9ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:84b:b0:736:6279:ca25
 with SMTP id d2e1a72fcca58-73980463170mr23448772b3a.24.1743540425095; Tue, 01
 Apr 2025 13:47:05 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:22 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-11-seanjc@google.com>
Subject: [PATCH 10/12] KVM: selftests: Assert that eventfd() succeeds in Xen
 shinfo test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134706_052132_B246945D 
X-CRM114-Status: GOOD (  12.32  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.504.g3bcea36a83-goog


