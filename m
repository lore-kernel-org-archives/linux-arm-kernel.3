Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C1FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQsDpgf8u91vw/WrLSGz0iJXQ6JiA2bq0U/tEH5QJI8=; b=TFYR0VZJy/y9EFs7FaxJlVnv0+
	S7AeZE1ZsloZaHEwJjKj9ZUmei1tPl3C1+vMQP/9soxVk5RonsO34GPawG/7VlJrcLjD6LJPQrrm7
	8ImTgrJ2l+Qp6WLvWvEop1/4pMKZo7nnckEc2UiaAkjv2kf61Bf5E3Khia/NiJp8sVGiMcASdfCsu
	vru6wxyivifVAoEHPNPPjwv2r1iBneeisNutYQEQYCEYp3Fn1HPK4m5pQCpzA3IDBoj4lbxJ/mxxB
	zwJMSdYFRkVtjHfd+eGffCBUThy8ta9pVy9uvo/YMJREzm2Na0XT3c5FeF66M3t8/qLsaU/ZqS0YK
	cqE+/dhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhSr-00000001BcJ-1NNi;
	Sat, 07 Jun 2025 00:31:13 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvg-000000019HJ-18Ty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:57 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7377139d8b1so2154691b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254215; x=1749859015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsDpgf8u91vw/WrLSGz0iJXQ6JiA2bq0U/tEH5QJI8=;
        b=ivt5yQqMnu+9J4rtjbe60EHvNqqDw0l66yct7JIWcYfkazyJyVnFA6xKDLpquQHvtw
         OESq/UOVabfFvrUeyFPEDtvFNxFIyoPitf3MvQv3vA/cMBSAP8XUveV/mnggqtTBk72D
         BH10FgDEvAzfcRypGy6Leg1lV33OXWzI1+CIplHQC9Barxiu1eWM5GGTVrJdChjXzvgp
         lKVPFR4UmTxGUPhyT27gCHAQTvpNJqwnsXrLoRORNiTdj9pMckxajaiOuNpH8Kds6NuT
         6CSAgkJItLmLAngoq2uFVw1mE7K37YV0yOghHmi8bMm4YCxQZsRdEuKXSE8kr+vsNKdk
         DBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254215; x=1749859015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsDpgf8u91vw/WrLSGz0iJXQ6JiA2bq0U/tEH5QJI8=;
        b=iYKQ2+3WNkaaeWwfeHmH6tnMyTmimCxI16ZfnFpNGc6wbIFdNlh9PN0XIlomJ5Z+7T
         A77OD0Q4lB4KCuwmVnbhKwEwV2pXXwb1NcrS3N7bmeBOjfcaPX9+RUtmyAm6m4agX641
         8jjjMiTvW5/8asDDSJMQndfgfpezwHO9g4lFA0SS3msY7AvDWC0mGJwoH9UV8/Vv7t1M
         oFfPZTynfb+zpOQg3uF519XGnqFFjNbF06t0Vo/cLAc/5+/qm03+4IbiG1C1agT5gZGo
         GTXP2HPQjyO1czN4weCgwE7067ch8ewXDm+Z3UXb9z6QfZBJUhtgOyJrisT3FNxaoEsw
         6q9w==
X-Forwarded-Encrypted: i=1; AJvYcCXXzQV+qR/E+sYTHDFgeYOp8zB5yf43KXZaIXM+OEtnbXykZqqVCZlSi0f3qoORtaNMN2/IsAoZTg9cgVPhK2CN@lists.infradead.org
X-Gm-Message-State: AOJu0YxWzrPXfnPW0N5jnlfGQGZAN/B2a/D2v0YiN1a6JxRLGmJH3XvN
	Jv6tG+knhu0yWVjj6XKoVzh0N5t3ssLBRApDlzqDNApv9CwGOdqPIMHXu6HsLfhmqiW6i6lAjL7
	3ACWrkQjp9w==
X-Google-Smtp-Source: AGHT+IGyp1ZByaQWclr+E1KDubTeknVJBEMfz1Flqb1492oOI1nXyfJVxjejhM42yZAw1MjGchfJyqOnrrck
X-Received: from pfiu22.prod.google.com ([2002:a05:6a00:1256:b0:747:b608:3d8e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6009:b0:218:c22:e3e6
 with SMTP id adf61e73a8af0-21ee2555021mr6804011637.12.1749254215203; Fri, 06
 Jun 2025 16:56:55 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:19 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-16-vipinsh@google.com>
Subject: [PATCH v2 15/15] KVM: selftests: Add riscv auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165656_312179_F0EA203F 
X-CRM114-Status: GOOD (  12.13  )
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

Add auto generated test files for s390 platforms.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test | 1 +
 .../testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test  | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test

diff --git a/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
new file mode 100644
index 000000000000..d34b4b9b77ae
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
@@ -0,0 +1 @@
+riscv/ebreak_test
diff --git a/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
new file mode 100644
index 000000000000..5abb62c51097
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
@@ -0,0 +1 @@
+riscv/sbi_pmu_test
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


