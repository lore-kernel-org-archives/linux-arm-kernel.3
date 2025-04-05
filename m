Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe2bIRfllqLhJxxHpJNmnpza0I+tDqutdvnRlHikMBQ=; b=zTLO4XxFkaHFeNuzbbs8Kxa+8Y
	icrJZ8QB/qM9h+7tRSqBEllO/WJG4HoSd243mua/+uzcRF5CFGC/M/2swgxKiPHpbOD2viZnlgXk3
	IVlULRNYUS5rKnVQ3j76S3fKgTlmT8Oxo0fV0SkRotvEGGuT1tfFW5c2jvorAoAoVmFCrwEuEFN6m
	jgWT9EUj93SsPx1AB6HCabY3FnDc/DwEKBxbL97KF1IqHMrFYp+mQeQpov5+L/gGnvEdJFC2f4JDd
	Q0a36w1pPSd//lP4TZzZ80RabJgHVEeO6uqNeFLDNk+wpmaOYUCo+n5w01h37OnjscQ2HaLrBjh8l
	MRXSIncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rCi-0000000DAfH-2Hxy;
	Sat, 05 Apr 2025 00:16:08 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0r7X-0000000D9UY-3gn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:10:48 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85e310ba2f9so231571639f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 17:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743811847; x=1744416647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe2bIRfllqLhJxxHpJNmnpza0I+tDqutdvnRlHikMBQ=;
        b=in4PkJh4InCReVHKJ4ZE5Io8GNTfJRWxyqP2n8COnrdJDO7jiDcEgn5KbQfNYqRq8X
         1ZmriGOORHs68z3PRaqieYwMLbhsTwbEv2CmCioNzbICObHSTVQ7DnlofGzuI+rrwUFl
         Zj2J51ei50dUc1GFrTH/gQMC7dqooE53Y3nYDgZXYyjqW2C4zmHw4F6nIjwOZa+shGfe
         A5VPbw7UwL46pw+YgI4EZ/+vDUAqd4EI4N2BlNEo9WnhGblbMel+dRnRN2vPUTNNAUjc
         z7ZNCL5xNXSQO/J/zCZf+FgbVViWb4mGEGw6t377I+uuMW7NZ732GtAhUnevtoYfmqwt
         u4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811847; x=1744416647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe2bIRfllqLhJxxHpJNmnpza0I+tDqutdvnRlHikMBQ=;
        b=tPnpcD07xjX4eiDnBpN8Q/CmNfzWg/jdcS4RZc+j6w/XCgQjkHqPkCZyf53AMlNZtZ
         UxY7gi5+Bje1er86dLrHtCFhk1B9GImmuClJTjROtD6WkT1AAA92sQDiPlJOHad1lGLo
         ReVW5X1Oma/yFAoXyBFJlZzqs1Cbvxb+aKRUaHgJetBDVirM2l/StkOCnabnGpro8QY9
         AgUFpERluPJYTWtBQXppsWMo0ELLSGj9/SPatHz7+Mfd3QwqYY0Zuq/vgwoTvLZJBT26
         Gcw9xPdci1TeyzWqbhUEHa0UZXkrodJxCE5YhvGWxoHPAt23hZjDSsUCVKwDwYtQz77/
         WAgg==
X-Forwarded-Encrypted: i=1; AJvYcCUxjPIdjUbxrrsAQOBmQmaZPtsuo3wfMbVXx6/D7Vg/D/rFY4OHw08yKtDdGJPPsI5BnJPhUXCBkZCcxrvQQTeG@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwKvpgZwR1Fk2hD2X+kx/1rkrGMqG1yMw7G6nwwLBARtTjNbi
	dh8mpsXMztS+vf0/nlFxJ9fGbpT4Ui21kHhm19zqKccXFENm0cDPDCpwpg3273Jq97ZJbCOCoF0
	kLlxvlQ==
X-Google-Smtp-Source: AGHT+IF1StR86BOR3Add0XYDFbLf59K7X1ePZtATYMdVN91h6vHs+7fhLEgNJ0U//lXVpSgwej6JAhyyVci0
X-Received: from iovo14.prod.google.com ([2002:a05:6602:13ce:b0:861:1f46:a1e3])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3a09:b0:85d:b26e:e194
 with SMTP id ca18e2360f4ac-8611c2f92e0mr488329639f.7.1743811846805; Fri, 04
 Apr 2025 17:10:46 -0700 (PDT)
Date: Sat,  5 Apr 2025 00:10:42 +0000
In-Reply-To: <20250405001042.1470552-1-rananta@google.com>
Mime-Version: 1.0
References: <20250405001042.1470552-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250405001042.1470552-3-rananta@google.com>
Subject: [PATCH v2 2/2] KVM: selftests: arm64: Explicitly set the page attrs
 to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_171047_917484_FE96B457 
X-CRM114-Status: GOOD (  12.75  )
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

Atomic instructions such as 'ldset' over (global) variables in the guest
is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
was particularly apparent on Neoverse-N3.

According to ARM ARM DDI0487L.a B2.2.6 (Possible implementation
restrictions on using atomic instructions), atomic instructions are
architecturally guaranteed for Inner Shareable and Outer Shareable
attributes. For Non-Shareable attribute, the atomic instructions are
not atomic and issuing such an instruction can lead to the FSC
mentioned in this case (among other things).

Moreover, according to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte
load/store), it is implementation defined that a data abort with the
mentioned FSC is reported for the first stage of translation that
provides an inappropriate memory type. It's likely that Neoverse-N3
chose to implement these two and why we see an FSC of 0x35 in EL1 upon
executing atomic instructions.

ARM64 KVM selftests sets no shareable attributes, which makes them
Non-Shareable by default. Hence, explicitly set them as Inner-Shareable
to fix this issue.

Suggested-by: Oliver Upton <oupton@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 1 +
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index 7d88ff22013a..b0fc0f945766 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -113,6 +113,7 @@
 #define PMD_TYPE_TABLE		BIT(1)
 #define PTE_TYPE_PAGE		BIT(1)
 
+#define PTE_SHARED		(UL(3) << 8) /* SH[1:0], inner shareable */
 #define PTE_AF			BIT(10)
 
 #define PTE_ADDR_MASK(page_shift)	GENMASK(47, (page_shift))
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index da5802c8a59c..9d69904cb608 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -172,6 +172,9 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 	}
 
 	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
+	if (!use_lpa2_pte_format(vm))
+		pg_attr |= PTE_SHARED;
+
 	*ptep = addr_pte(vm, paddr, pg_attr);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog


