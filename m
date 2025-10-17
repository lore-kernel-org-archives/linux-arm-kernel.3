Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBBFCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=; b=uEH85ciSEoxVlmzeJkbOUjzQpm
	6o4TTGwDctoGpzAaPMSi6snKM/DQs/+NkVdH6PS234+gcPMjp5mOhGyGCv5hnFkDOk3ruOa7qFrJM
	xw/ho7MYZXdQoVzP1EQIw2HvJ35C/bO24U5IdEldgeaOWTh1DGhrCNmi3GEa5q5UVXkkwKpCfj9Zi
	Za2GS53ipb2ZOSKYCDbdA2a0cp3fnuI2eCz8a/uJ0/8cygIRJt5gzcHxaN1gPRnTdU63LwnKIDojm
	1Y+Qy2tqT5NBYBPIblz1kyKfFpQemxKx+S9yLlW7u1HhwiPmNWlJgM2KYjRsph8NJ7qmZRP9A5M3c
	6pbke1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQP-00000006EnL-2V1o;
	Fri, 17 Oct 2025 00:34:29 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPO-00000006DK2-2mjU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befbbaso1593965a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661205; x=1761266005; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=xqVq3Aj4Y9ujrNNOOvU+UTlc4pGeyZJL8zE6SJ35e3eY4eigmEALCAg2BWHFyeF6fW
         0g5+0+1gJMyLYXY8f7pzt5M1L83aMWvi5PSgDo1/AWBFL9h57IeWpUVkd+cD3AQK1e2T
         HdZh1YXiH9ey81LACg7mdZTwsgYO4mwYXTBXVoU5t6eiUQsqy6OpuFm9I53+yJZmmEUa
         Jm8NIi0GyIdsE5PsqW7NoNQqD6XhSKb0p9mDuSEq1Mp9q2kMPXgSYPM3eAEvUkqLzFwd
         aefpZdHuIoHakxQoPsxtEym6C1xv0kPzMjC567A12gnTMLCFiu21uFFgz+1rh67Tn3jO
         2Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661205; x=1761266005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=r+oByVTRhVYMDyY2X8JQvqm3jylqmE6YkCY8W8mkmPwAPKthKX0H0cUCZTEvBmy/yU
         cXAkCeP6Dlw9t2bJagNxJlhBKDuZ2CIT1O1vEse/EC3SGNGp7kthQ0xvVqyskjM8FXtE
         KZ9cQOET8caRDuVYSS9L0A7ALVLUVVirP+WzedOe4SwKkVNkim46NxUgOtjTMForTjx9
         tGcl+H5lxK+484/SZqb97jXPa07cr2BxyJdIksbdxtICW59WVD9d5sCZMfThFZnKyHOb
         CJBCdE48OfvjGFALnGIqiOYSn6d+pB6wK1e9ScJ4FF+QOco/WVRjoECOEViBzblIqxeg
         nk4w==
X-Gm-Message-State: AOJu0YwKCnEtktc4YVrPMl3Ou05Fv4ieFOVR27UlYGb9kQP10g1fwRqi
	xlV/6TXeCdn7hxkyFv/OxDuIA7jqyW5Yr3O6YV11ex4MF9SP6TV/ngMgf9HlXY3dVSzA+/pZebV
	PNlQy/g==
X-Google-Smtp-Source: AGHT+IFb3cb9XScIkfIbQA2oQID7nhqxfExRyWF6N5UGcVhE3T71y0SJP1d51io6pNMM6/KZP3XG25y1rx0=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8f:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33bcf8f94b6mr1826093a91.28.1760661204960; Thu, 16
 Oct 2025 17:33:24 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:39 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-22-seanjc@google.com>
Subject: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
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
X-CRM114-CacheID: sfid-20251016_173326_878158_D397A331 
X-CRM114-Status: GOOD (  12.71  )
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

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2e2dab89c98f..d5f810435f34 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	if (cmd->hw_error)
+		return -EINVAL;
+
+	return 0;
+}
+
 int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_tdx_cmd tdx_cmd;
 	int r;
 
-	if (copy_from_user(&tdx_cmd, argp, sizeof(struct kvm_tdx_cmd)))
-		return -EFAULT;
-
-	/*
-	 * Userspace should never set hw_error. It is used to fill
-	 * hardware-defined error by the kernel.
-	 */
-	if (tdx_cmd.hw_error)
-		return -EINVAL;
+	r = tdx_get_cmd(argp, &tdx_cmd);
+	if (r)
+		return r;
 
 	mutex_lock(&kvm->lock);
 
@@ -3152,11 +3157,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (copy_from_user(&cmd, argp, sizeof(cmd)))
-		return -EFAULT;
-
-	if (cmd.hw_error)
-		return -EINVAL;
+	ret = tdx_get_cmd(argp, &cmd);
+	if (ret)
+		return ret;
 
 	switch (cmd.id) {
 	case KVM_TDX_INIT_VCPU:
-- 
2.51.0.858.gf9c4a03a3a-goog


