Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26098E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 00:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=; b=w2nmUUXJJvEexZqXu0WiXc85qj
	MnTeNm1e/r+lvr3CFdytKjoAfk5du3HE6DtVmdP1b0qERdoa21OLr1dhOALGldY+zHwRh2c5GecYF
	gAU5XH/54adVbXmURqbadIegsJ+SSy2v6keoFOLGJRxR7wJRXI6fypzVUxUIK37Niax4bF2oJwd/W
	jjscvW/1TgEuFHSZXpLcxV6zW2UDofM6Ie8clL4ko+IslxbtV+2/XU+etUq7bfeJWR367KqSnKc3x
	92LlZ+3Ib0JO8J895zxSYPLCG/6FyObYu/p89463gnrHN3qhEsAIxJ9NfVKlpctHOV6qp7NGTL3i2
	S0gWPDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPlv-0000000HRFu-1GB6;
	Sat, 11 Jan 2025 00:54:39 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiM-0000000HQLG-0TmK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:50:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so4770374a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556657; x=1737161457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=1GWrbGjeToC2RYU4gx/iFiDZRRFfQW96ANC4m+0eucYdwOcHhmqlAZBE3yhR6rcD5L
         DAMUjqb9hwUFXqN2Wp1gSC5xZVKeRYq+4o5YiLFnIuzcYvFxk06S8OEiSeSpiYGCc+f0
         IQUil3r4RxZsdrVLo+ui0xanNhvgWdLL9sAUjLn03NuJgfxDA3IXKeBuhww0KHlQE/Aq
         bdl7mGnLb2xJocv8h4NzP8Wts96SIHwNgRp9WtkoCtUtjWnBzy9oIDNWEc9XY+Hu52k1
         RncJcQn0QG/jmiAT+Yc0R2SbOWZPnAQbcIHQRO8hXwi4cw3R4+i6xDpUWipKWw+CPgCN
         lIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556657; x=1737161457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=IPhvod4AHFZMkihlxaQFg/yEWEKQ65orYwcK3u+R7vKx8ncowRgSd9tZ83PgLuq2sP
         dlfssUrf91Ke3+6rJ11uulFFqtA9kJzpuG07Yc1jYfrcMPBQ5I9DnyvhqTyDAIDJdn5H
         IxE7+6W3xHUgKXQ5sMkQ9p4l27hFCsLqiINBnMMJEE8n3CYW9qK8C0yeF4MPU3b2HdVF
         pcWtCEsCHQDn7cBlOxauixar2/7P10tsboqTz/LHPe6kzKeqjD75Yd6vMPzzdQAbOJNa
         BzVdSvygqWXsVNHtNlB+1NPrLjf5i1fYdxw5Sc8msXlgUS5eGMAKBeIFxAyOJOW7eQNZ
         40JQ==
X-Gm-Message-State: AOJu0YyPCGi6d2oPxsoM54KVUBipu+I5MleE/fsNiM52pUr7x+3jf07c
	GP2NUKzQE7CDub3tGuJLvq6lSoCVNPLhswK40iNvfpcAdDZWjt///NHKJrmvcCwZNgU/3VoWKAx
	qCw==
X-Google-Smtp-Source: AGHT+IEiPYhZFrxECLTpeRyhrniySkHxs86k154WoHT+4SPRvFRx2z0MZkxZdNLfF3LCv7K79vdra9fQLrE=
X-Received: from pjz13.prod.google.com ([2002:a17:90b:56cd:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc5:b0:2ee:c91a:ad05
 with SMTP id 98e67ed59e1d1-2f548e984abmr17519047a91.3.1736556656714; Fri, 10
 Jan 2025 16:50:56 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:43 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-4-seanjc@google.com>
Subject: [PATCH v2 3/9] KVM: selftests: Assert that __vm_get_stat() actually
 finds a stat
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165058_143001_1470B0BC 
X-CRM114-Status: GOOD (  11.77  )
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

Fail the test if it attempts to read a stat that doesn't exist, e.g. due
to a typo (hooray, strings), or because the test tried to get a stat for
the wrong scope.  As is, there's no indiciation of failure and @data is
left untouched, e.g. holds '0' or random stack data in most cases.

Fixes: 8448ec5993be ("KVM: selftests: Add NX huge pages test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9138801ecb60..21b5a6261106 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2238,9 +2238,10 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 
 		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
 			       data, max_elements);
-
-		break;
+		return;
 	}
+
+	TEST_FAIL("Unabled to find stat '%s'", stat_name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


