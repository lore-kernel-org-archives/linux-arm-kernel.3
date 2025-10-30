Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC79CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=; b=ItMOwdo6dtDU+Hk8s6q47/ji/J
	k7Ou8M/xyavLyrRedB5QFH4whnd1UIcunYDMNePkpVLdzv4rNzzJzfqWQPGxnv09QrbF7xIBgeH4g
	1bmgf1DzRtqNb3gmu2FNmVklPFVcBkz9WhY43PPIO7+7UQQxU5GMhixLW+oyU+4Y4doZDYFoyfM8j
	xA5upYXtqb1jXBiSEDRfGy4VRtklNTMRWvtuHodSq4gB/jpHfRPOz/BJmpyJ0jZkRh9HUfDMG8Yn9
	XBl3ocYFqfFFzU4T9n6bUbuLJAFqYDkJpRXJtKj8XTJO6M2Y7Qb8KWF/LcMtjxqoy0AzQ3JpdZgR6
	wGAUiZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1J-00000004n1t-0kTy;
	Thu, 30 Oct 2025 20:13:17 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz9-00000004kOd-2g8z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:11:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-294df925293so13425445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855062; x=1762459862; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=RFdCrUeTt4Nb82GrPeLAJeN3m20VXEv3x1T3MPFJU2RGIlY+enRUz+EmiWOS2iLOrS
         9dJyX7rBiapHaWg5Bu79UKGD8oK9TWGnLJw6+nfZq5qUSSoJeAIL1ZaLvdY8ZhLPy6XO
         0xtdUAQJzFf9+bAtzDXAi6MQbE/B0xPzBHiH4uzd4X6vam5IYodx844goxY1rl5fE8yP
         qVrlMRqNwyHL4IQBJnD3bk5UzT+n7GdMmSo7eauzQ4WVAWTwu8WRIa0AQgQU1uQO1TU4
         ynxttJ6dA8jtuUbaMBDmoEdLRV3WjsQA9aG1uqDDmGgdeUf7Ru3BVKy8F0X/R0haUqzZ
         QouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855062; x=1762459862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=gyj20nB71Kf8Vs6HXurC+kNXmc0YAVgFdwWilHNiKppoq13uCQKfvBiTYJJ/4/Whmw
         GXCUca3IROKelC0b3Y8KFHdWE/agGKQl/2sz5p7outMANBc4xrOrhUZkrqz1eVMBSUi2
         Eai2kgMqsWvLhNTo8NbliXn8lj998y2NYFMLNSfvYiJ4WkPYmT18Tzd1lJMAnXtE3AN9
         paiK199sl5Mx7pdJnkybRmLXmI1qRTm/tMkcHnZQC3MpHa4YfT9nebHbWRIb4O7r0/A8
         lS6RcuSoY/mwBB0vX8FSUlJK28lNt5RWjhK2YjLA3RfzsKedJZp/47Sd+y+olXfCl5/q
         hClQ==
X-Gm-Message-State: AOJu0YziDIOCjEETVsv5AY+agU/dtK4cpUYs7vbncLIfkvGGcPgDIux0
	4Pog1nuzZ/cjF1QGHTm1vBuB/NMV9L3lHaFDjuLynNgfECEXhqYvu6oFg3uj40NO7HfRphUdx2N
	fS+QOYA==
X-Google-Smtp-Source: AGHT+IE/OfQCQRYqXElzN+OeKvwnTKdqn8Aa5qkU15JwMNXReTeV5Yh/81ZcfUEIC9p/s1OTRodzv1oDE/0=
X-Received: from pjbms9.prod.google.com ([2002:a17:90b:2349:b0:33d:69cf:1f82])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c401:b0:295:21ac:3540
 with SMTP id d9443c01a7336-29521ac3a29mr3509295ad.33.1761855061339; Thu, 30
 Oct 2025 13:11:01 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:48 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-26-seanjc@google.com>
Subject: [PATCH v4 25/28] KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
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
X-CRM114-CacheID: sfid-20251030_131103_802592_F07E04E9 
X-CRM114-Status: GOOD (  11.75  )
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

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 037429964fd7..57dfddd2a6cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,12 +2806,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
+	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r = tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r = tdx_td_init(kvm, &tdx_cmd);
 		break;
-- 
2.51.1.930.gacf6e81ea2-goog


