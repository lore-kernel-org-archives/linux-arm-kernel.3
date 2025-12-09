Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC1FD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avZ9OXi40r9I3tBhG1OZSSWwPglo/DoIFRIQKLTo7zA=; b=3lwtEtVebidzq2di7nWIj36uXe
	rZfqyX5LFQRGYG0sRIK6EA8xh8AeHZJiWoV6pleEVbCfG0ZSABXv1t5+QeHUjd0Hwbe6CM6u1q4Vr
	qt5XaAlaWVeu8zH1Vry5XzWIU9CrFC8PBc+hIBu3JCcY/ldf+suAB6A6SiHK8FWwyiPmwrxyZTHKp
	kGbZ9ZGZtYm5LKwixdxF1S/DsUG09oWwq3zkxaJiGSSrVR47TjKrBoUMntfsDEanIk6ahXX5eWr8m
	KG/Efti2ZazcIsdy8z1WhsTjel6GQL4kvYJ3y3RqfNfwd9Dd2q7huFNduaK7yUtI1NeQHl2cts9zo
	6Jgf8DBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hF-0000000Ekax-10Wy;
	Tue, 09 Dec 2025 20:52:33 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hC-0000000EkY2-0UMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:31 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7c702347c6eso6664164a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313549; x=1765918349; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=avZ9OXi40r9I3tBhG1OZSSWwPglo/DoIFRIQKLTo7zA=;
        b=2PB6cRpAjoY2DMAfG42+hiK4Ut1S72MPNb4iKTCMmYtvrsm0sQALBlFMGmhZpRewRv
         azjTkWal7TpP+xbj1WNOhSTnnncav0enxuN9DZ6uNpdSyYvsTBpVrKw/XMQGM+GHcduy
         QTxH+3wJNkZMtD1dgdQWqXm9xdoAPLdUGGF+mlSzzErreYzKboczlDjXB+t+leDeBN7S
         8kjM464FzCi0hNY/eXoUxsvQe5zWGnZ6MsaJGikZBlMN+hfEf3MQeANDgZs4uXWOuXZ4
         ydIFW5qE2bZRS3TmrBVmPrtUEQzeLQigrA/4yrxGBS/zKnxdI4Jc4kd/vQ3+HTF+F04/
         Fa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313549; x=1765918349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=avZ9OXi40r9I3tBhG1OZSSWwPglo/DoIFRIQKLTo7zA=;
        b=e5LBgPlMqjEUd/4jroDOyEQRV4zxQsFfnV1NIxkLlWmQupzv7DigwwgmMgtoLM9TAM
         1Y0eWmYDzWGxdjb+NRAbAm5x2EQzBmPwxYyoZuF97rZNSTU/7VNd++26ywGgV/BQNdeh
         XKaRqJ0AqIksBKaJLuNC7OK8fmyQlL+eU3dtMo+HcI0QGOkqJEh/UiHfUcuJMJD8WsIT
         8lNMX9wUIsiqtJz9fHLXqa26Xh5gzBEMBGLIcdok2SuA1PzmwqvxDIuIHvlCZD4MzUmM
         Kk3iAYOrSuVdqZvjrHW4t5Md/Ual1fjCUhfO9v9LEblXLReg7cF0qcoJHsBsi465dnv9
         KY+w==
X-Forwarded-Encrypted: i=1; AJvYcCXWTF7zYfchcN4CJS3rQJuUkimvt/CZy/IgNGZVC/RkL+8yH8trkU1ZwkeZ5XqxJXzXB/zpHbiNPrYO+SxOE643@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwO/sZ1DazLmPurfMdon6tCKgoCRBLUzL9F6HzVqS/uG5vRGu
	r6QLAQlwbzo4XVLJuW5tO/01oeYqcxaVuFwSEnLXwUDboAYySf4QYNE+hLJykjRtq0SRSW1BPy3
	6VL988xgFHN16+P0XxCeDjjIB6g==
X-Google-Smtp-Source: AGHT+IGBJBO46UR3T81/n2L+V0opSJVwtEO5cO1rJLAwUl/wZGtRFy5mrcug0+A8VGtDI6JSlEB8C9Gz2V+VpcB2Qw==
X-Received: from otbbq1.prod.google.com ([2002:a05:6830:3881:b0:7c7:583b:2e9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:4411:b0:7c7:1e8a:c9e0 with SMTP id 46e09a7af769-7cacec42631mr79191a34.23.1765313548734;
 Tue, 09 Dec 2025 12:52:28 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:00 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-4-coltonlewis@google.com>
Subject: [PATCH v5 03/24] KVM: arm64: Include KVM headers to get forward declarations
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125230_161238_30AB66E3 
X-CRM114-Status: GOOD (  10.60  )
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

From: Sean Christopherson <seanjc@google.com>

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-ID: <20250611001042.170501-3-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 7310841f45121..d55359e67c22c 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b4116..baf028d19dfc9 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.52.0.239.gd5f0c6e74e-goog


