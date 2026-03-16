Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBC2F4645E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6df6NmlHbYEwsjePCZxMwR+//HiqFND2iuF0yusrO7A=; b=zICHOawiof7GlnxW7lAsWjI/Cq
	W4YUfrKgqpD6ttW7KaIj1/SwMG5QoVB59yKMeheYqIKRGvE/xnsNlDObZpwanZjoVlT+KGLO7UBCz
	JsBuL2oQAIiqkqPKsrJc1f8R4M2L1FDGrf5UU9J/Of/mUhH+1MeJJJO5M5QqC6w9zfjVm3ijOeha5
	kEGcDSUKYEy4CYOt0xsiCAnp85o7aCOo/WWxH0x1bdCWHarBwe03OEdy/5qL7HmNje+wTdQ1e4fWT
	IAmp5g79B4u/aFKwjh04gmmblkNKzyv4OtHx4KYMwCAaUv+2yV9Hv2LPhJn2yZow7ASG6Ar1OJmZe
	R29A6qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26oh-00000003uSq-3RS6;
	Mon, 16 Mar 2026 12:13:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26oe-00000003uS5-1UAh;
	Mon, 16 Mar 2026 12:13:01 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id C980B20B7129;
	Mon, 16 Mar 2026 05:12:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C980B20B7129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663179;
	bh=6df6NmlHbYEwsjePCZxMwR+//HiqFND2iuF0yusrO7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnrfaQ1qzJtMxSWlOSqo+uWUtX+v3P2ZCsXLOhdyHnOiD5Mf/g2gbHMdnHNx1+B0e
	 HG2BK6FeWTAuENeXTbTg7QebepK3AW7xpc2WLe6mfQa3LB3dskvBj/x9U7s0qec5Nj
	 uex5YeK0kEHqZinvkTyE9P6h/eVsH96Ez3dITCIY=
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
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 01/11] arch: arm64: Export arch_smp_send_reschedule for mshv_vtl module
Date: Mon, 16 Mar 2026 12:12:31 +0000
Message-ID: <20260316121241.910764-2-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051300_817843_4BDE8616 
X-CRM114-Status: GOOD (  11.18  )
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


