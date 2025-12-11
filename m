Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7B4D41C26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAKrVBNxWNzf5AFlwNKs8nwrXjTjocawMvN6/+Bemv4=; b=GMHnbkdlT9gbg65bWZz/sz8XI0
	hrVW10N8UXr2aw3n5MNjkaj8LwMDi/E9bqomUqdXMo8dgFuQWzEqyL7LSoMNWs3qSxzV7Gsa06Lmp
	VXjnmX1sHzqA2FSD4EnHQyqdY23HUY9EdXL0+UApM17CzxIcxvUU/dSOXDqpw0/0JM5zHHCbqhAcq
	l+bj5KZBb1D3PsELo9UpBu3CQU5V1xLFohM3vfmFnTr8+eZ1mBngG9TyjOhQs36cmMG3uTzO52JJ+
	y8ZgeeCv7uvKm6D8PLuyn0LHvf3l0o5WpkizC5cT3gLCvnTssm2j69TbxzsW06p0hLHReuY2YrV87
	M3qsMyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0M-0000000GYDF-2FEc;
	Thu, 11 Dec 2025 11:38:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0E-0000000GY98-3zSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:36 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42e2d6d13d1so414229f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453112; x=1766057912; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAKrVBNxWNzf5AFlwNKs8nwrXjTjocawMvN6/+Bemv4=;
        b=Woc8MPTvdyXkVS8WaY/Ov0pe9E9n/QJ6/TKTUoMvCrNbPtyTAb3STDqVC0dzqMLbmF
         eLkjZkvR6spkZC4jc0CPXb8hVVwTT8LoK6ldVm0BJ2BKo4CmkCYbJC/L4B0F7aM/M6kP
         tWfyhNIFsYzATSb+iqvheQgVyuoPO+SlkevgZVWDFkxy5CDhmLh90m+4c5wwqtY1VDGy
         DK4W7WAVHvnIk25oXOQhyU2ozBzmPuWSUpcxsQAE3v3HTzloiI6yhP+FD8tGpBDL7eAJ
         EjVRbnFHfY6J4MwiND7NOZ5AiXt0L/8OXoBkwbYrtkHNfqA96fOvu1fuekxH7KPZjs0W
         TyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453112; x=1766057912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAKrVBNxWNzf5AFlwNKs8nwrXjTjocawMvN6/+Bemv4=;
        b=WRJKmZK5Bc2/sPkPh+6j93avXvczG3yZFNnnZhVezgDekN/FH4wC9YvQdn/ic7AtpB
         n3sSwxlpaiic/O9i00yAju4yKWMe4ls78rHb4Uil0kDFmhYkB0kfZbaz+iGUGJnDgGFB
         iCfTuk3als32kA6aO81oL71ODNM8p5exETnwleMuekPGjo297qyVucHnZiG5Zd1q8vKm
         gMCCrIalumdrU4F3rURlrSPNXJ8knK6xBiCBnmrM7EF/3kbcySiNXQQzTTxycUPTl09O
         8uz+cuRwwtWEkO4DZ7HOtw5IauWV6bD1JIff9Lt7vXE3k/E6QZVD1JGv5LbOJL8CMRWM
         eX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/9GifZHUuno8vBnsjYnm6xaRjm2WPuzHoo/5Xc7PSlzljRtUcXfsLAvQcIjuKryiCjREEIgLosKVwpyvv+Ifv@lists.infradead.org
X-Gm-Message-State: AOJu0YzoD3RON1b/5yIU8XV86+mJVR3mJKzrJKZ6crz3fqBBztfZBx6V
	/zAUs7fYYwBHuP0wu23kHkVeC2yzMrdbUiyHhyS4/sufqHBZKqLap9WHey2PxqFlvu/gSjPv0jE
	tew==
X-Google-Smtp-Source: AGHT+IFc7lvmfn5LPPjevpwMTfbx6/iGjar8gi/uBjkrJessLIYye4pzMI3sHwpXEb9c803ajpwdpY0YiA==
X-Received: from wrqr13.prod.google.com ([2002:a5d:498d:0:b0:42f:9f40:a5d9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40da:b0:426:d5a0:bac8
 with SMTP id ffacd0b85a97d-42fa3b1eb9emr6657835f8f.56.1765453112715; Thu, 11
 Dec 2025 03:38:32 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:27 +0000
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-5-tabba@google.com>
Subject: [PATCH v2 4/5] arm64: Inject UNDEF when accessing MTE sysregs with
 MTE disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033835_024774_883331CA 
X-CRM114-Status: GOOD (  14.20  )
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

When MTE hardware is present but disabled via software (arm64.nomte or
CONFIG_ARM64_MTE=n), HCR_EL2.ATA is cleared to prevent use of MTE
instructions. However, this alone doesn't fully emulate hardware that
lacks MTE support.

With HCR_EL2.ATA cleared, accesses to certain MTE system registers trap
to EL2 with exception class ESR_ELx_EC_SYS64. To faithfully emulate
hardware without MTE (where such accesses would cause an Undefined
Instruction exception), inject UNDEF into the host.

The ability to disable MTE in the host kernel is used by some systems,
such as Android, so that the physical memory otherwise used as tag
storage can be used for other things (i.e. treated just like the rest of
memory).

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 29430c031095..f542e4c17156 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -686,6 +686,46 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	kvm_skip_host_instr();
 }
 
+static void inject_undef64(void)
+{
+	unsigned long sctlr, vbar, old, new;
+	u64 offset, esr;
+
+	vbar = read_sysreg_el1(SYS_VBAR);
+	sctlr = read_sysreg_el1(SYS_SCTLR);
+	old = read_sysreg_el2(SYS_SPSR);
+	new = get_except64_cpsr(old, system_supports_mte(), sctlr, PSR_MODE_EL1h);
+	offset = get_except64_offset(old, PSR_MODE_EL1h, except_type_sync);
+	esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
+
+	write_sysreg_el1(esr, SYS_ESR);
+	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
+	write_sysreg_el1(old, SYS_SPSR);
+	write_sysreg_el2(vbar + offset, SYS_ELR);
+	write_sysreg_el2(new, SYS_SPSR);
+}
+
+static bool handle_host_mte(u64 esr)
+{
+	/* If we're here for any reason other than MTE, then it's a bug. */
+
+	if (read_sysreg(HCR_EL2) & HCR_ATA)
+		return false;
+
+	switch (esr_sys64_to_sysreg(esr)) {
+	case SYS_RGSR_EL1:
+	case SYS_GCR_EL1:
+	case SYS_TFSR_EL1:
+	case SYS_TFSRE0_EL1:
+		break;
+	default:
+		return false;
+	}
+
+	inject_undef64();
+	return true;
+}
+
 void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
@@ -701,6 +741,10 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 	case ESR_ELx_EC_DABT_LOW:
 		handle_host_mem_abort(host_ctxt);
 		break;
+	case ESR_ELx_EC_SYS64:
+		if (handle_host_mte(esr))
+			break;
+		fallthrough;
 	default:
 		BUG();
 	}
-- 
2.52.0.223.gf5cc29aaa4-goog


