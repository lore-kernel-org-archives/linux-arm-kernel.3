Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33498CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bafyIACgjKK14wqI7+UpK/XBf9Tl8hwNLLXvm7vBUiQ=; b=3ZUtPR8QT4BjTrz8FumvE2+iHz
	1keVUhg3aAfOYx1jJFSAvUp9GAp4FjZBJHD9PNszDU8enMVE/xFfgWZuQctI9SZg9abl73R5SF+RB
	FhKIZAgzhN/3mf6lylbKYh94JJwIzCH1TnjLLbpPLdl6/In9Qljbyti9YAWm8LZVo8AOs7KwT+KjG
	Gt+EGMopF9gO9VIasShU4Ltzq/FQWth0sU5rqCK6/rDCUoOZS283V7sW/NoG0ii//WM/FmNiYStLU
	LIERTjUB74fsGbERo3qvPbAHFCpI/Vs+TXdbxVk9f1z3WJiU6mmZ9RqOWKnRP69Jta8dnTpi6s41x
	3KWb7fMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseW-0000000Gm0f-2KcX;
	Tue, 28 Oct 2025 22:58:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseT-0000000Glzs-1hrN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:58:54 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-290c9724deeso58322985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761692332; x=1762297132; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bafyIACgjKK14wqI7+UpK/XBf9Tl8hwNLLXvm7vBUiQ=;
        b=gh5YM/52Ek0GqkWICj8g9yRRmNzfjqGSV0JL+j8w9PI8Y3MK+Qg3CxhSDbN8OS7F/c
         5YnYSFS9kofL7IoX1OYkRc+K6uYn039DHBkx2NQ+9FKZqIdWG+kGo0JopC39cOem9avb
         rr/8ljUbTYT6+ctqvE/DBf0lCGTH+p2swqryh0qxxCxt+nzirTRWm3VFHJl3ofBDTBZm
         35TU8pLXW+VRDGQkBdw/xRQmrwXgBEPe4OcZ50c/eKSAxKKXAFJF3dr24+VytZ+04a2O
         PqeqqYbcAfd3Yk3xn3NJUVH/eUnkiiEbrmBXvYaqrNb9kCxwozOYtGBRBTOwcJETeh1G
         0YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692332; x=1762297132;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bafyIACgjKK14wqI7+UpK/XBf9Tl8hwNLLXvm7vBUiQ=;
        b=ssgdJ2CIjOx45k7ilgu9TFgow17j/eG0uIpVXuBmsukJ7zbU2+x7/FoC9qRwW1r5cs
         zrnw/4W1Nym4FxeP053H8i/QluY0BJ4I/oQek7VQ4rRjTS2z7ZzgwxSqfAUEg55dg4Sa
         2he0Q74WXZBpkciXi6+nh+BsdNSFo/FfRjJ/QkSsf5A0WX4wIr8oeOKpImru7+XM/uZA
         AapxiRTKtwRHf+LHN3K6/APJZ4Izk8sK6V8xvxWBv6T9eYjWxXCTQG3wVstKPeRUVhU8
         d/Ja2LQio8Gu3SK0y0qBs6oSKdJWS63TQEzTrZLoYiYIWMJrv5Q7N1WQUniKXXPFtasW
         mMFg==
X-Forwarded-Encrypted: i=1; AJvYcCUQXg0qiY2+VNQ66fmQW8QgilL+SPsst50veIxkZwEBMpqhwPZUGBCg1OgrHdxjJSeMGWYqV5K1lf07tH5/Hr5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwKbi+cKo9cq2hD4U0rviu0d1GwdTnkzvEiFQvrRUaV6l+cMUbS
	kAnXulluhqgJs/MMIS7I2f1DOGLzgpoGac4SCRlEN9kU40rLDBOOOk1k6xebJYR1fDdiEBYpdGT
	cUvaP6x14f+uJPQ==
X-Google-Smtp-Source: AGHT+IHKY2pClvohg4IWDjCOvNKT01DkzF2lTStYT3sIYIsj1O8Psfszn4vksBsANMyqzlJojr3dGZ1p5DLaig==
X-Received: from pjbgq17.prod.google.com ([2002:a17:90b:1051:b0:33d:acf4:5aac])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e847:b0:293:e5f:85d7 with SMTP id d9443c01a7336-294def69091mr8641645ad.55.1761692331928;
 Tue, 28 Oct 2025 15:58:51 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028225827.2269128-1-jmattson@google.com>
Subject: [PATCH v2 0/4] KVM: selftests: Test SET_NESTED_STATE with 48-bit L2
 on 57-bit L1
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Jim Mattson <jmattson@google.com>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_155853_450693_9F417586 
X-CRM114-Status: GOOD (  11.79  )
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

Prior to commit 9245fd6b8531 ("KVM: x86: model canonical checks more
precisely"), KVM_SET_NESTED_STATE would fail if the state was captured
with L2 active, L1 had CR4.LA57 set, L2 did not, and the
VMCS12.HOST_GSBASE (or other host-state field checked for canonicality)
had an address greater than 48 bits wide.

Add a regression test that reproduces the KVM_SET_NESTED_STATE failure
conditions. To do so, the first three patches add support for 5-level
paging in the selftest L1 VM.

v1 -> v2
  Ended the page walking loops before visiting 4K mappings [Yosry]
  Changed VM_MODE_PXXV48_4K into VM_MODE_PXXVYY_4K;
    use 5-level paging when possible                       [Sean] 
  Removed the check for non-NULL vmx_pages in guest_code() [Yosry]

Jim Mattson (4):
  KVM: selftests: Use a loop to create guest page tables
  KVM: selftests: Use a loop to walk guest page tables
  KVM: selftests: Change VM_MODE_PXXV48_4K to VM_MODE_PXXVYY_4K
  KVM: selftests: Add a VMX test for LA57 nested state

 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/include/kvm_util.h  |   4 +-
 .../selftests/kvm/include/x86/processor.h     |   2 +-
 .../selftests/kvm/lib/arm64/processor.c       |   2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  30 ++--
 .../testing/selftests/kvm/lib/x86/processor.c |  80 +++++------
 tools/testing/selftests/kvm/lib/x86/vmx.c     |   6 +-
 .../kvm/x86/vmx_la57_nested_state_test.c      | 134 ++++++++++++++++++
 8 files changed, 197 insertions(+), 62 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/vmx_la57_nested_state_test.c

-- 
2.51.1.851.g4ebd6896fd-goog


