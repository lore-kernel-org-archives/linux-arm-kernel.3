Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E142ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=; b=VU87dFbmL1YR4u0IFcgobia9Ky
	oqCVkiROh1vq4dzxFbvYphfIwb9/X71uEFY95OraSEyeYS+vVG4vSwfaBZLLvKySPZsChtubNZtro
	kVhLTVJbYn5crw8Pu1PfGBG297QSgsTCcnml7EIcKCFQBxehpfdKobaH9NmxtefdkWHNuzURImgyh
	E3jvGIYEnCN/pus4hpwcW7olkSL+DVFAzG76LRHWC20F4+wLe5ACw7tAVzCepRpbS42WWLW906rjS
	9hWFz1qSLpLSu6HPyEnVYb5Y+tzIXo0niyfmMPpdPBuvaJUe1Cnqf9z6OWwddZU7oZ5Vx4ljmTfDQ
	Z0BNOhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YWh-00000006IU3-3xTR;
	Fri, 17 Oct 2025 00:40:59 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YWf-00000006ISz-1C9C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:40:58 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-427811cad57so40686475ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661656; x=1761266456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=wISL10VArJIPgfU3poFyGGz4aHacPt/zeSbldBcl8foBjcJfqMynsF545ZMOoCo7AX
         1EJnMJRb3kzQJQKSRqHA4b3yVCglfMwmM6LY9mHlMBx09V+52e26MgV5jCTJMsEy/KZJ
         B8/LD+9Hwjv7TIX1avp8oLDVY7f4KysI296Ht6bVm47joMC0W04OcTyV7CszhPeIpH07
         ch1UJDf3sywzUM3LeVsy8ojsXM/kxaICR8T9OrFiqd+Csq0oNPXybkOjKxRQ3Lx0Le0Q
         sNMWc/934nhPFIwwKsCkBR9CKEznrjqBItMzAiqBf72QRNK2qcWe87SBce6bMgVqw/8f
         6mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661656; x=1761266456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=jY6A2rfwoYbY3i9XbjzdeFV7mDXfqPhL88bgT8+4Es8O4uzn+62cPyfLdx2j9R02ei
         4vg5GXiQzPhpGmEei2KAt2UXyTNHNMMPo0a6JwRvcYLoVnIxVF1I7vdssWOLmlowcSK4
         q88wTf3qahcTrhJ7bQgvFiaP0cBTSIm9qDC2UU7jpnjFeLT5RBiiaw9JLeRym7LBu2yj
         KZt//lCpdoOlKgu5t9H++XHFbGyA5wD7khzR/p5llE+GNCOt6sJS9BCm8gbHTt+by7f+
         tPs3lGWudQQ8FFfAIFP7QGPor/BzuGlyzydAc6b0Nhm3Z3A/C29JtUyBlPfdX+1xwrFJ
         w5BQ==
X-Gm-Message-State: AOJu0Yx2U7/6oNNTioneBdgj1N7uMIqnYeNNjh0+kPB8ZgPSyvYOJijZ
	76wQV2lsb3bF4gAkqdFW3FxZyuC+68Qf5ERwUkF/5aQi+w/t6cxulLp+kum8eHsqjUjBsS+EZHc
	kIGWB2A==
X-Google-Smtp-Source: AGHT+IF8DlOutKWl0i8m+B1TfQqXPthFr1585kr7hlu5o2md7/0QzZzZHhKvSNGyUqeTAbPYZaEbqdnIEp8=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:26b:5346:5857
 with SMTP id d9443c01a7336-290c9cd4b82mr18056465ad.24.1760661200311; Thu, 16
 Oct 2025 17:33:20 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:36 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-19-seanjc@google.com>
Subject: [PATCH v3 18/25] KVM: TDX: Derive error argument names from the local
 variable names
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_174057_318712_C56EBDC1 
X-CRM114-Status: GOOD (  10.24  )
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

When printing SEAMCALL errors, use the name of the variable holding an
error parameter instead of the register from whence it came, so that flows
which use descriptive variable names will similarly print descriptive
error messages.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d587a38581e..e517ad3d5f4f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -41,14 +41,15 @@
 #define TDX_BUG_ON(__err, __fn, __kvm)				\
 	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
 
-#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
+#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
 
-#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
+#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
 
-#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
+#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
+		     a1, a2, a3)
 
 
 bool enable_tdx __ro_after_init;
-- 
2.51.0.858.gf9c4a03a3a-goog


