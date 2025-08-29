Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB22CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=; b=ZJoxZ6F8uii2LTKnBwoIk6H1OX
	ItEAslKV21JpyJYU53GTUgVGQKWLdxZvor4Vu25Vc9VdfiyifFSgB6HPgiJJ50fYovMzOoAR0uqJS
	+jv8hIzT9Hco7Uqe0PXGS30ZSNZYcOk+j+2i59t/i+J/ZIHxzSUokb3fpss4kn2u8rQP3en27k3Zj
	ug7wIErxVbB56p63Z5gBrBOsnpF9mQMlvRmkOX5DSMOEVRtXPIUXqHRuCXg0Be5sPNqt580090+EL
	pjm6bBxX/Ks854oKPrFVpjmHxWJoOLh9GSzzY/EEAedM9eptO9YhqK7vF/RQ509jN5A/qe8d6FPOe
	1hJVD9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iO-000000076df-0l73;
	Sat, 30 Aug 2025 00:45:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hz-0000000645U-0rAF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77033293ed8so1939309b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478475; x=1757083275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=OFePEh0V3xPkBy1hgGqrfYg+fPI+dVQpm0zAj7zJD450mFlrBtXL4Eiw4IMVU6A4Hc
         lh1q0jr1vytc+8/fmVSb04r6OLuXJv4opNrsRj2Id87Cy2eOVOXlvL+8zhEQsBNyw4kk
         afeL/xrwPL2gqz9DHfRkDILC03+IiTySSM3Y55C9uMRFZ4opjlqXzRknX1MhNKtvWd7G
         u2pM7KdQYh5LmSCQJxJmlfAexXXqLlSLLOwrqfxTrOWQ/XuYyI/rkKMk6urZ5B5XhAap
         hKhMJ1b+LyJ1LkE9oHjx6l/WMdNDe1wNE/rA8TmqIYnwkOq4Rn0yZpfut8fcOjh0gtrg
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478475; x=1757083275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=oXMbZcZzUs9PDwtj6FVrufFroYWhrgouiwsM7ocleefzzklbOieU4+4KJcICDBaNU3
         ufMqjv8I6Kc3JTudSAFeEkRmwJ+VQv7dsLz6ftTA1NQ0rxeO2uIhc4OmjkUvx0Yqzzs1
         qoiOThCEdpieZpQ+vhImQGV8arPZAkm9KtVD/qf069qHYtCFew+AvFcKJIKSd4PGZw3R
         hVNTCnOzoFpS/gqYyEkREfr/g1HhKcOesei3U90McDwGaevMwECqrLHjdmagVtOm+NEL
         ayBSdiR6DFZoWgS/BeSbS2kUaLKMZtGjTiVW9rDZxB8ad6tKzrRaRRoxLNTDFJecoxQj
         udQg==
X-Forwarded-Encrypted: i=1; AJvYcCXWE08RbE4BfNp7mzss3JI6gm2bQyp0Pcc9Tvuu85xX5ackfzfMcqNPk50S2O9AFyqS4HcBLBSutIyu/b3JFEHW@lists.infradead.org
X-Gm-Message-State: AOJu0YzBqI5fE/slVbE9vmxzF2ZFoZwc8D/YD9SNlZUaVkbCyL2S2bI2
	9mEUt+YdM39g6JlgU4VXN0WGMCyAVDD07VrTwo0QBpI0F200NUMxAJGWbDePH6TJTXk=
X-Gm-Gg: ASbGncvM3iRdNZpvKbBv6Yb8BQPiImtTWwnERoOyVJY/TnY1lsUHUWmIAohFEFbPbao
	Z7ymiJxKdnHakEwZoPEP/eaYwYJKTunKaY1X/uXEtJlaGoyUuxmlDAE5YGH/Vp9+Fp2LMbHZlWr
	bTGGhOxVGb+BOKGsmF69TLumHMwftXGzuO+Z3q+Hfv8OLeidYn7rE7bHs+olAcwzfuNCvwplcvA
	9iB3NNS9Jm2cSfBtZGoDpMc60HJ5CvPE3JEXOQvQStk+2ZabpLx/quqzYeZvpBtNUXucXMzAI1u
	APOC0svryKUMyunoHgtGDmdOchUaLvoA9rgT1TGJQjvO7awyS4YNc/pIFCqJtRDmXeC5IAwXlhx
	HwdFUM9Rrox9s58zp6D9umEguoQH4IusqGzRSoWiC8cQJbw==
X-Google-Smtp-Source: AGHT+IE+tippTw8I5Rjqj8J4MuD+XFXMLrYSoKCBTNLNIx4D19MX2vzDRgyVPUrBIKEMjW6IJPF1lQ==
X-Received: by 2002:a05:6a20:c127:b0:243:b8c8:a247 with SMTP id adf61e73a8af0-243b8c8a5b5mr5669681637.2.1756478474637;
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:07 -0700
Subject: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074115_255545_38DDCE37 
X-CRM114-Status: GOOD (  12.02  )
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

The arch specific code may need to know if a particular gpa is valid and
writable for the shared memory between the host and the guest. Currently,
there are few places where it is used in RISC-V implementation. Given the
nature of the function it may be used for other architectures.
Hence, a common helper function is added.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..eec5cbbcb4b3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
 	return !kvm_is_error_hva(hva);
 }
 
+static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
+{
+	bool writable;
+	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
+
+	return !kvm_is_error_hva(hva) && writable;
+}
+
 static inline void kvm_gpc_mark_dirty_in_slot(struct gfn_to_pfn_cache *gpc)
 {
 	lockdep_assert_held(&gpc->lock);

-- 
2.43.0


