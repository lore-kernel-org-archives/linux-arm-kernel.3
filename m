Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2960CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=; b=0H3WBHUCcRxyaSQlb4/Wg9XrkL
	RR2kUoWJNqwF8jjCQI0GLkfnfYkh2tSGP7wCx6wpujXF+yDiagvGYDkDUJsvmrmZHz+8LjAVDZVxz
	5+1Wv48Gy3vfvr81YLc7bCWr4P1AtbCgqNTWerC5HUBESkInbeSWFCkDOuhT8RDH6hm9LA98EXTZO
	giOQqkygj09lN5tQRX44OqJEcs7YDiqIWPrRjjd9rdlZakkHQfHfMVIp1tboTz15DJmiIMy1LWz2z
	jNm5VJ5VrPwGKPEJTJfHHjP6kbkj/us7+tQkzQ0ShK7UtWpAuLSwhjn8RejJTBRmKXJSi/P9Fs58J
	q31Kj0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1G-00000004mxQ-3epi;
	Thu, 30 Oct 2025 20:13:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzB-00000004kS3-41L2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=; b=UrKhnUkOKHoSkF3kfGpWSXzFNU
	eWnf/TOoy0fzcdGCFlgEOegvpTBNOVkVAav/iQAFtX7BOYe2j7/amtTqNcacjWXW0Ov+NO4RtL7cB
	KEw7XSRkZdc9lrHtyNQj+Ol/9uyQebQsBc3vqhLt0AehUUeGJD5el8ZzT93tKvMJ3MeDPRBQgUND+
	iutLtGrhWW1wB908SbEyRtYujYiwm7hS/84vmIASRqG7YbBqT1s9VD0u6lEgk+pSbZAA6SFYzSQ8e
	GiOkqbwKNWOUclgW0Lpxg0RAFcLuJ6r6M4zqzS1PKwoO4Mrt8I8yf1+38GRUHfBdw5WZaeF89khu0
	Mm0ixdlw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7P-00000009u2a-0uiD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:33 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7a432101881so2610775b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855059; x=1762459859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=BZEy6sKojx1/5VyFaR7VFj7gf8fisYugky15YQtU4iG42ImKOkFdkp1sC5/4DaHYsa
         HjOHidf20oKX7J8JS7PKtn5D/LHOXidgpKCCYNHr5k04Cv+QmxaI8ymfVjl1M85ZyQaH
         cGmo/dOdEk8CgtObaiAHrTJQt2Kv/6cf/HqQC759katrXs9mm9mGm7qWe+6AzWJB38yI
         TGXL9WyVlAoc3vnsIe2+m7YronPGQgZ22o/XeSKcmSZMZeCdqixlgNPCGh8NgEcCksR/
         j+R8CdXlWnIUs3rU4FSEOysVjGnjTajr0K9nfx1fGAcP12qx2MSJc4QdvP36Dg7yXt8S
         skyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855059; x=1762459859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=chNjIzIEEoeYRI/vfz4WRWGF9iaKMwG/wDlsN0hz+yPMRzvo+++SgDRkdxFi0/m6su
         IE2OQLE0ORjFQcBvxnW+p5YKJETSeP4HPgJYryGdJfz+eZlzHuZmk9YPp5KxyeqbL5VA
         Q6qs7HMUplHoYrXSPWMe5nZhCOqvC2cS72/LB7WFwdoyLrSVfJ0uYALqTYOAA1q/741E
         uwWejBWSLn/WMeAg7l4UovzZp2ElQJMh1iQ/rCicDzf7cUakZgSKsgfQThwsxNcoR9Rg
         duhFZa2jrR7oMg6rchrszeZVw2eoXIO5epVl+oqQsjAaEkP3+6DsCtMXxxFhq0g9/1NP
         T2/w==
X-Gm-Message-State: AOJu0YyI3Kd4GdNKSIbb9Pz9fhcU6MDEFP98U/IcXVtEN7w5yfljcyix
	fANNArcg70lqTk4a5QxiJbu5EktBRTW7+ZYN+PLg2rqHZ2UvoogzSBgqPr1cn5dUEbddTWTkWMV
	ededIuQ==
X-Google-Smtp-Source: AGHT+IE4oqFNhFQQZr1IyqSPUxhZWizKY8+4h3k61YypjXkX/4HyRwAM2GyKD7DH49xWshMyjNqw52ssRLY=
X-Received: from pfbgi4.prod.google.com ([2002:a05:6a00:63c4:b0:793:b157:af42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2283:b0:7a2:721b:adb6
 with SMTP id d2e1a72fcca58-7a77a9cb11amr747302b3a.28.1761855059275; Thu, 30
 Oct 2025 13:10:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:47 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-25-seanjc@google.com>
Subject: [PATCH v4 24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191531_314005_AE003A80 
X-CRM114-Status: GOOD (  10.20  )
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d6f40a481487..037429964fd7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,7 +2806,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2819,15 +2819,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


