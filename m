Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F0CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llK0KM02OjlQ3dfGmbUJ3xamz2nXDZo+cJOrJzYBrAM=; b=Cx3Z+s+BDmpwto6es+9u70CCuE
	xjnE/vtXwod749CrVguFZMF8vVGWk9bovsaXuU2zCQuTYL8BaGbBMl3m8HRBDVY6ZeFu+EG0t2WZI
	zzuuIUKsdplkezzyYOO3BikrgltRuRE18wsM+nMaIzX9l44oPoFlGlDNdTllTvGp7JoIBo6ezcz2w
	ytyaz+9DCwG7GIuXJCJaNl/S0fIFSucHkgdpeeuqtqxHZCyMhw5T/ecbauK8XBYr3rhue80Yw+ABD
	wPHx8utj2k6WbwvMsbmLE8i5IlSxkpaoe0Trpq1/6rOZKCHXnZEby2TY06rTSwxjWk+E+HoeYXzxN
	RPEpjlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwT-00000006els-2c8l;
	Fri, 01 May 2026 11:21:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwR-00000006ejZ-1bSm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:21:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so20163265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634513; x=1778239313; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=llK0KM02OjlQ3dfGmbUJ3xamz2nXDZo+cJOrJzYBrAM=;
        b=Lb8S+lb4Nh2seidt9QTzxxj3eUkjEMTwPEYMGIhHrWBcX6XxDAm1RJ+k7IcbrJnnR8
         m9K/Mtv9k9Jd7cHVrCfHu1VoZI/j1SU9OW3EjghgyW8iHJUvZb8X+Wl8AbGuT0wZsSgd
         IFG/86LxIXI6zbfAyKXWhANGPAp9GpwlGjK2hQHLndg3oiDYBAAHMxloFEfYX2wm+D0J
         8ZFvqrhDSo0vKOUAfXuD5ioOuBQ5+HaAnKGoOOs/YU31nbnujW+YNch3gCPQcBK8+/lJ
         il1JHLJVnH6JM7rKXHVLQat2VRbMCY78Il1n3oWvb1Ed7jYTPhIBelRxrFENKyQARzx7
         uoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634513; x=1778239313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llK0KM02OjlQ3dfGmbUJ3xamz2nXDZo+cJOrJzYBrAM=;
        b=eKvt4vDZkGZ/lgAUQMFE77C1cZ/kHdYUUInjhnm4V0Ea8XUQRMRq5zzJIfdjeSWv7L
         esPOsFmrIclT3N+5qca6T2OVM1vB9Y8ZF9+hUh9RElLl55Bz3F16ILvTeW9Girjg5TBx
         ADGb7qRs1r9w/X7v6IrqVNd44Ox8RRqqJ+TGEEH6cgXVlOdxPPVuFZoATexZ+NUnPXEh
         RU37pvEBYePBeFOr2b/jKjwaFWb5kIamBORMeVvlAUTmwVet+jJKcfYyS9d3vXb93Lc5
         sIx42+Fg3Mn2nLNggCQn/7ZaOl6n9owvp9Rw+YciNUWwuQkDg/p3cDmTHCXOdqz/35BY
         DZeA==
X-Forwarded-Encrypted: i=1; AFNElJ84eii0WnviTVEYkOw2htLWPlpA6/UCaR5AUEFZfwaKecw8f5Tff/sET7g2d2e6a6jbZDQRXTCf6N7L95kSXiKp@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3ZCSsZFEmlbOrMsa9zM+Y0Li7p6hw4YwECH2Z9XMwu4eT3iW
	xl1bjzIGpJ8xhtJFtaZcouE8/rh3BZ7ozbj1FmmJOIRaBH3cSRj07PrJIh53i43RASeaGQic+n4
	NWA==
X-Received: from wmee3.prod.google.com ([2002:a05:600c:2183:b0:48a:5547:c79e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19ce:b0:489:1c32:210d
 with SMTP id 5b1f17b1804b1-48a8eb8834fmr41657655e9.15.1777634513137; Fri, 01
 May 2026 04:21:53 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:45 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-3-tabba@google.com>
Subject: [PATCH v2 2/6] KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042155_428579_6967630D 
X-CRM114-Status: GOOD (  11.53  )
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

On VHE, __hyp_call_panic() unconditionally calls __deactivate_traps(vcpu)
on the vcpu pointer read from host_ctxt->__hyp_running_vcpu. That pointer
is cleared after every guest exit (and is never set when no guest is
running), so an unexpected EL2 exception landing in _guest_exit_panic,
e.g. via the el2t*_invalid / el2h_irq_invalid vectors - reaches this
function with vcpu == NULL. __deactivate_traps() then dereferences vcpu
via ___deactivate_traps() -> vserror_state_is_nested() -> vcpu_has_nv()
-> vcpu->arch.features, faulting inside the panic handler and obscuring
the original failure.

The nVHE counterpart (hyp_panic() in arch/arm64/kvm/hyp/nvhe/switch.c)
already guards its vcpu-using cleanup with "if (vcpu)"; mirror that
here. sysreg_restore_host_state_vhe() does not depend on vcpu and
continues to run unconditionally, preserving panic forensics. The
trailing panic("...VCPU:%p", vcpu) prints "(null)" safely via printk's
%p handling.

Fixes: 6a0259ed29bb ("KVM: arm64: Remove hyp_panic arguments")
Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 9db3f11a4754..1e8995add14f 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -663,7 +663,8 @@ static void __noreturn __hyp_call_panic(u64 spsr, u64 elr, u64 par)
 	host_ctxt = host_data_ptr(host_ctxt);
 	vcpu = host_ctxt->__hyp_running_vcpu;
 
-	__deactivate_traps(vcpu);
+	if (vcpu)
+		__deactivate_traps(vcpu);
 	sysreg_restore_host_state_vhe(host_ctxt);
 
 	panic("HYP panic:\nPS:%08llx PC:%016llx ESR:%08llx\nFAR:%016llx HPFAR:%016llx PAR:%016llx\nVCPU:%p\n",
-- 
2.54.0.545.g6539524ca2-goog


