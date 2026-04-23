Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB238F589B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2iUOz06N9pWMf1bIo71EnFA9O21Frf4P70pvQqdric=; b=TmFzm2+4nJY8Z8q/gNF17KsEzv
	c5uR2diJsIOoQozOmZvUJh4sP3i3YXuOpcGuL7zPVX+v5L9Nm5mfFiHsJIHLtv1atNGM4g5PLWkzH
	qXREtFFdMw+XOlVTTBnhs8CBsab9mfn9rpf70va6XhlwF42s//8TLv7cyPbHI79BVTusZ7SeF8AIj
	VSxYhL0AYYrg2SyjBuOWie5rAZSt0cqxwTKhrGQ6p06Kw6/Esh+TyzR9UXrymAEzo/xtr2t6glSDB
	5L0LuMpN9ZZIIbBMt791XxBXJ6B7e481Sr+ZqG6cA79jp6nfpknKghSF45DWr/mgaHXIC7xBZY5Pp
	qCNIuBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtO3-0000000BdTj-3I8Q;
	Thu, 23 Apr 2026 12:42:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNy-0000000BdRx-3uGg;
	Thu, 23 Apr 2026 12:42:29 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2833120B7168;
	Thu, 23 Apr 2026 05:42:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2833120B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948146;
	bh=I2iUOz06N9pWMf1bIo71EnFA9O21Frf4P70pvQqdric=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sdJr3BxSKfa5DEwVFAHUFBYZT3CYc4MAfq8UWukagegS/A86yvkIHkLGL8iNV/AmX
	 sZQvA8TInk618z9cr/L8VcWhIK1vnpLV8JbFypwHHhnWweLdVlRRK6x4v0dVdtqL1i
	 5HUfRb7io3Hlx8KeTctmRzzkcsl9Mi34N8U1zmHM=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 01/15] arm64: smp: Export arch_smp_send_reschedule for mshv_vtl module
Date: Thu, 23 Apr 2026 12:41:51 +0000
Message-ID: <20260423124206.2410879-2-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054227_016053_AAEFDE68 
X-CRM114-Status: GOOD (  10.82  )
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

mshv_vtl_main.c calls smp_send_reschedule() which expands to
arch_smp_send_reschedule(). When CONFIG_MSHV_VTL=m, the module cannot
access this symbol since it is not exported on arm64.

smp_send_reschedule() is used in mshv_vtl_cancel() to interrupt a vCPU
thread running on another CPU. When a vCPU is looping in
mshv_vtl_ioctl_return_to_lower_vtl(), it checks a per-CPU cancel flag
before each VTL0 entry. Setting cancel=1 alone is not enough if the
target CPU thread is sleeping - the IPI from smp_send_reschedule() kicks
the remote CPU out of idle/sleep so it re-checks the cancel flag and
exits the loop promptly.

Other architectures (riscv, loongarch, powerpc) already export this
symbol. Add the same EXPORT_SYMBOL_GPL for arm64. This is required
for adding arm64 support in MSHV_VTL.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..26b1a4456ceb 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1152,6 +1152,7 @@ void arch_smp_send_reschedule(int cpu)
 {
 	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
 }
+EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
 void arch_send_wakeup_ipi(unsigned int cpu)
-- 
2.43.0


