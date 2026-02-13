Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCADEDF16E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZI3PiRBCJaOtbE31TrtopwnjhpEV4zI9W7Z3S9kmPS8=; b=BWOhtK58/VSLHLw7LqjX3WyrSi
	sPcAL2lSby0A4y1IGLXeE9ZVJMSrLZ8f4Fa21boC8tFHU6soFpEvpSN1JcuYUVKi6wRdI4yereg6h
	W1pojfG7orQDXVWQv+i5sNEqgDLVzGE64lPwxGYMWslVjpybgQeHF7PVNXUMzCFE02A3hJ6K32bHW
	SRdGk26Ssuo0yxFYsJ/rsYn/EcqijUWInmDhIuDFC1rmqzPGLHtRZHZSKVRwGcq3kF1ukRhdenhwR
	D5rZ7xHNlRmO2zfBUXPp+qLWTd5S1r/qFamRoSQ12L3DLeSvgVYOzdOLCmes+2MjypSgOtjwO4U/p
	GTLGI1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJM-00000003XvC-3FJB;
	Fri, 13 Feb 2026 14:38:24 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJH-00000003XsW-30BB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:38:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4836c819456so13083125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993497; x=1771598297; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI3PiRBCJaOtbE31TrtopwnjhpEV4zI9W7Z3S9kmPS8=;
        b=D0nXGcp0Qd3ehEfFpoEJKAwlPXpdwnIm/0+TaUn05woBy70TaQd4Vmhr1FIn1BwZ9W
         F4Sxl53BOLw95VEQsQel0shZK8b4vlQzAzDgprHVYkmQE27BrZp3klvOSEqc4JKE8Xm1
         7ShZ8q+JBLvlXW1mgsgWi4AVJAsBCf/wr0DEeSEdcK4vDBsynw89ADAAkysuvnuxRUpG
         hfSsfhx8s+psdwb67VnqSt1qnxazX18QkSg0s4KAIdwDdWx/xMC6N6qksvo0W7i1F40I
         WpZgJnhd7YRXqrGZADg0kuhwu99WVxcCodnx8hwClc3ZB6wxrIkNY3ZSmTblWE6Vs5Xm
         bj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993497; x=1771598297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI3PiRBCJaOtbE31TrtopwnjhpEV4zI9W7Z3S9kmPS8=;
        b=WhXc54x/F2dSw0Z5j94LmuMbNhkBdyQakqVyYQqHlOXt0XG5DSCcSweTEwvXwVLseB
         3NToE1PqRQsrlfqac8SSzrEwXO0YsiII++rKhPsy+88guP57de2/nSOCG3qnpTp7iAxV
         Dfz9G2zFAbR6XrmGuWlVXhe9II3oddaDgMtvkkprKypKYrOt+XvpQXzWZaO6mSomYKMj
         XQ92kcWJPm4C+tqVpCOGSxMCsV4ocFrsWl21jckevW6UipBEooCyc6vwiojdnrF1IE2b
         AuGF5ix0vNKelr3umRe1x5cHD3mlLJH6mke1Ck9AV9v+sUhgUvjrEhZT4NVOdFyLNGSx
         HfAA==
X-Forwarded-Encrypted: i=1; AJvYcCVm7w22c0ORR4TThWoezhnCs2ztMJqKsDu866266Fftfx8mZ7GGQwqwDI3ww5k3k+Z3utyt7cagWklj1mUjXxSp@lists.infradead.org
X-Gm-Message-State: AOJu0YySfiHupgVbSJXJYCdcSchn/Ex/b1vhE12k/yGDeN8NrUidasvv
	l7SCI25zzrcltNXPYbh/R/c8ktqlhY0GgFGt9Ucwwq7kVUVh/TLPdjTb1KAOti7rh8VYPs2aN29
	q4A==
X-Received: from wmbz20.prod.google.com ([2002:a05:600c:c094:b0:47b:d5ad:dd7f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:474e:b0:480:4be7:4f53
 with SMTP id 5b1f17b1804b1-48371095fa6mr56214175e9.31.1770993497276; Fri, 13
 Feb 2026 06:38:17 -0800 (PST)
Date: Fri, 13 Feb 2026 14:38:12 +0000
In-Reply-To: <20260213143815.1732675-1-tabba@google.com>
Mime-Version: 1.0
References: <20260213143815.1732675-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213143815.1732675-2-tabba@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Hide S1POE from guests when not supported
 by the host
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063819_766118_885F627A 
X-CRM114-Status: GOOD (  12.50  )
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

When CONFIG_ARM64_POE is disabled, KVM does not save/restore POR_EL1.
However, ID_AA64MMFR3_EL1 sanitisation currently exposes the feature to
guests whenever the hardware supports it, ignoring the host kernel
configuration.

If a guest detects this feature and attempts to use it, the host will
fail to context-switch POR_EL1, potentially leading to state corruption.

Fix this by masking ID_AA64MMFR3_EL1.S1POE in the sanitised system
registers, preventing KVM from advertising the feature when the host
does not support it (i.e. system_supports_poe() is false).

Fixes: 70ed7238297f ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 88a57ca36d96..237e8bd1cf29 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1816,6 +1816,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		       ID_AA64MMFR3_EL1_SCTLRX |
 		       ID_AA64MMFR3_EL1_S1POE |
 		       ID_AA64MMFR3_EL1_S1PIE;
+
+		if (!system_supports_poe())
+			val &= ~ID_AA64MMFR3_EL1_S1POE;
 		break;
 	case SYS_ID_MMFR4_EL1:
 		val &= ~ID_MMFR4_EL1_CCIDX;
-- 
2.53.0.273.g2a3d683680-goog


