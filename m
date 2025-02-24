Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F04C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=; b=bj5stFOUnznHf9o8SVRQrNbZW/
	f07sow66i6Owg6p6WmbdNuEawAo2bzdd0qTtsBuJtubut37yZeyPR3o6jh8kTI8/5pwkTNisCQQhr
	zbJJNNOMm9RNnEtywgLkd3HmwH/zqUHT9zu+mNrEPKLIzJ+Ridb+OXTE3EFunrlkvPCkkWiGEF5rN
	lNcVo5hQ1cuW4u2Y/eiJ9uC+P80XdAXRkGlzvxH7e/NGR7iXXQOhQfRsm+mBCEi83StymC/+01NzS
	GR6CV7dHom2efCd66zzCUo6SLiqaR4Js04uT0ArQRV28s24A7MBhoWjOo+RsegJQAbupqYtsY0GX+
	EhhA9F6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiQI-0000000Fa4W-1yeV;
	Tue, 25 Feb 2025 00:03:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIj-0000000FXyK-3Ny7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so10382486a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 15:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441352; x=1741046152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=;
        b=OWQ/jmZk1+2ZI6xH5giXzL7pP6FcUMuj2eW6WxIRNDPufAUQUplaIMKtc/Oer0Khnu
         +AeMe2iK3KyZqVmq7Qrf/2nG0+cja4yaGnq9qbQ3t1yHc+5MG5+Gnh6PYNhARXTFq7IF
         UxZ0NOQSk+q4PClXfAXeOGu4QRqyK3pATgd/B6MxEZ9LEV80DRlUQ4aXcYBqpd7x4Cy6
         dZiHCM/2MtrhkYNQJYQOBEn6C46aQ6VtlIH3OhC4hAPvolJ4e+Yulo9ts8W6nvm9cs0H
         07qtwagPS6Q9WV3EgQw9Ys3GYxhjuSbpmmGuaFUKpiZi//iFiJNGzkTA2nPkRTjSeo+1
         wNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441352; x=1741046152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=;
        b=PxSuqqVU+GD4P1O8VnGat8YDK/x/+5LIFJ8ClNeIjdl7eYGc+3Udtrph8YEnCxU2r4
         7AeDM/QvOpWnTdvCP0zKK4YD+7RT9dCrdlU7pwdUIKa93NofjLXz/BEfm4vNXdBFYpKJ
         GDgotkPExwHD8rMSLEYJv3lmQt+/LoOIxvedexYE1P9c+vjmYj4dFw9sIJ7fjtGSyShL
         EggbL47FzO68sfdXa2PdQ2m2TCFuYERJrYJOLqGUfRkak22vecvIpGCywDHs7Ao1lfnM
         Q/kSzp+1yNA1KHf+D68bJ/+GCR/RcLXEvp7Uyy4vskyYNGNib6ERggmbri/jyjv5Nktg
         E8uw==
X-Gm-Message-State: AOJu0Yxyzt6Tl10+KrJNLmQtkSfiFElceMHtB26T5BnfvMgAGlrXitNi
	BfJtZX5KxwT2vFsuRgG1etiSsR1h5HieGm2BkOUt+sLPR9v2Z+GE77N9GowshCCMJWbXXWtv2uQ
	wGw==
X-Google-Smtp-Source: AGHT+IGLhJjtwIM7JWkK50LEGpVa5IYsMEMrJLtXcv45TfVI0Bcew2BvOmcJCUf4CWX8wuCtTe3G30kBi3Q=
X-Received: from pfbhd3.prod.google.com ([2002:a05:6a00:6583:b0:734:cc8:a107])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:695:b0:1ee:bb7f:9b39
 with SMTP id adf61e73a8af0-1f0fbff6aebmr1778237637.1.1740441352385; Mon, 24
 Feb 2025 15:55:52 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:39 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: x86: Don't load/put vCPU when unloading its MMU
 during teardown
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155553_841040_D5402A1A 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Don't load (and then put) a vCPU when unloading its MMU during VM
destruction, as nothing in kvm_mmu_unload() accesses vCPU state beyond the
root page/address of each MMU, i.e. can't possible need to run with the
vCPU loaded.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 045c61cc7e54..9978ed4c0917 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12767,13 +12767,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
-{
-	vcpu_load(vcpu);
-	kvm_mmu_unload(vcpu);
-	vcpu_put(vcpu);
-}
-
 static void kvm_unload_vcpu_mmus(struct kvm *kvm)
 {
 	unsigned long i;
@@ -12781,7 +12774,7 @@ static void kvm_unload_vcpu_mmus(struct kvm *kvm)
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_clear_async_pf_completion_queue(vcpu);
-		kvm_unload_vcpu_mmu(vcpu);
+		kvm_mmu_unload(vcpu);
 	}
 }
 
-- 
2.48.1.658.g4767266eb4-goog


