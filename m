Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C1FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V4DeFz5zQx5vHTeG+ccViUA0qR3iKjsW9CqkQ1XIv0=; b=LYWGy7eQJiD8mR+M8opsRxWNAg
	t+tGBiF1NgQ6Ehmux27ClWVFnrwcyXNZs1twmaM6izn4Wpbb6sm4H0LHH7eDHQLmJ1T3ehQm2TmiT
	tEPBvsqmqEVc3vPwqOckwjPZSguJ3rR5Gm91l3MDEWh3TE3lSzuRgWny8GaNdLOmVt03vIEFut0Z9
	3NHpBTro4sSuGYNT+FueJBtLmBa9rPGltisy2ewTajzi+Q+BFHPmBXeIzgztNqx2E3xEwa8XtqlOy
	61TMA19QUAZHETC1kC2vAV/mmA+AaZhIjFLC37JfwXmlFM/Y3hIjDRMgsFaYmWb2LVUtHuw46fiZ4
	PVJhbODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhr-00000001AkT-2W8U;
	Tue, 28 Apr 2026 10:30:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhn-00000001Afn-1GiW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488c768a9a9so72784865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372213; x=1777977013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V4DeFz5zQx5vHTeG+ccViUA0qR3iKjsW9CqkQ1XIv0=;
        b=iX7TCRlQ+XkVG0866P5CTzcRwxdprNC7gdaxOdwlT7ePMe9rEPeZQZ4fIP5IfNffOi
         Y5Stl4gUW9a80TzmCO8tLS58pN8ZXakvK6YuaXLD3UcPMbm2fBp5G/H3H5f87ABThIH6
         IqnGqJGAAuycT6fVXcvVKbJ+uxj8Y5TPaygTPr7B9WsjUg8CORAGFPQYHDT9YPzQSwm9
         SQ9uIV/sgrtpyPElFAUe/kmz8yVgjnNV5xZwzsWyOU3tVFNe8JALcgRPv6dHA2NSjlWJ
         jkrbDoBv/4wFZQ750VZoLs+R+pi5C3uBdQzppEpt15PSsZck/VmoCUDfaiKfpKiH1nUv
         GAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372213; x=1777977013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2V4DeFz5zQx5vHTeG+ccViUA0qR3iKjsW9CqkQ1XIv0=;
        b=qPNSxH4tJV5Slm8AyryOlJj9cIF0no3INzYojVVoduyN641PxLYep7C9G5LNzsb0uM
         XAeabaVtvaZRkrKhWUocQ1hGV2tnMWi8RyTl0DIbkGtuCZniwRe6YYp2rAYKA5zmtZRQ
         uPcfJm0kxmUhOVEwUGI35ZYRB3kznJiW493G2/Yl3LkavuUXhcI0LbeAUys8bGg98Tly
         AbOuGLEFJ1OvKwK/iRfsgdJ9E97bIOT0I4RLO+SfOh+kLvhRcDFQePYpLw5F7tZtm5BH
         ztY7IRfD0BDAHR7YuQnMuEJ+FH8XH55FeQCwDw9LFUlXw1s9gvBDWrIEE/ohzv1SqXJd
         qNoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eFCkRHVKAhPZRwtprdPSjQsLr8E0Q8BsJOz8pPFsoo3LSQJgqGhdXRQ1DbEfik5oJIejNzpAHCEKJtRnXjvwC@lists.infradead.org
X-Gm-Message-State: AOJu0YxUneww3mpg7LUiIIE/e+0VjcqwDSlcEW/9OHv5OCULLiHQk/Di
	0lsiTWvEFtryOg9JFNYp/XW/dWk9yvjssm4zNQ+dohjK5bcMee2ErLLTq7fZiTE4MKJtXtOOQFj
	h5w==
X-Received: from wmpc9.prod.google.com ([2002:a05:600c:4a09:b0:48a:54ff:28b2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c177:b0:48a:5301:bb5c
 with SMTP id 5b1f17b1804b1-48a77b12a49mr34221165e9.16.1777372212793; Tue, 28
 Apr 2026 03:30:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:03 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-4-tabba@google.com>
Subject: [PATCH 3/8] KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033015_344884_654367F6 
X-CRM114-Status: GOOD (  11.65  )
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
here. sysreg_restore_host_state_vhe() and __hyp_do_panic() do not depend
on vcpu and continue to run unconditionally, preserving panic forensics.
The trailing panic("...VCPU:%p", vcpu) prints "(null)" safely via
printk's %p handling.

Fixes: 6a0259ed29bb ("KVM: arm64: Remove hyp_panic arguments")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 140d3bcb5651..8912863cc238 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -674,7 +674,8 @@ static void __noreturn __hyp_call_panic(u64 spsr, u64 elr, u64 par)
 	host_ctxt = host_data_ptr(host_ctxt);
 	vcpu = host_ctxt->__hyp_running_vcpu;
 
-	__deactivate_traps(vcpu);
+	if (vcpu)
+		__deactivate_traps(vcpu);
 	sysreg_restore_host_state_vhe(host_ctxt);
 
 	panic("HYP panic:\nPS:%08llx PC:%016llx ESR:%08llx\nFAR:%016llx HPFAR:%016llx PAR:%016llx\nVCPU:%p\n",
-- 
2.54.0.545.g6539524ca2-goog


