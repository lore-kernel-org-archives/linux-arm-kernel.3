Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B95F589B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSbbqWv3vuhtoGamHoPNheyejHz2e9u0oDYSbNnHoaw=; b=hmSDYFqqcM2Fp6AjjDWUbwlc5A
	RDvdOBGEctnxrGrppikr2XzJYEpMqcIAcgXDDNNXoHzMNpYm40oKzmykQaHjmY4OZ2DOgSa4JbBC1
	DMpmoSxtqYnTQOzcWmxu9NHj/cIZh+H1RT0fyJzTymJUlqTxVK5lKmtvBUXgGGH4gTmZGijroT1xb
	UCTpbxPHnY+/hFUfk5P5sdl+Hh21NWA6zxZHAYX/HeVngNM1rovjQZFzr0q4hGNm/Aq91r8hFdiRz
	CS1udCrcJpjleV8ijuyxXo3ToHiGFNW4HC/vMaAXRqxDt+MPKueZL2jBQYK+eTwZbbqrrkN2J1dgF
	CICPJUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPR-0000000Begc-2zBX;
	Thu, 23 Apr 2026 12:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPQ-0000000Beet-2Izy;
	Thu, 23 Apr 2026 12:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HSbbqWv3vuhtoGamHoPNheyejHz2e9u0oDYSbNnHoaw=; b=caJxq2RZoYz15BzGhVA4nGZoFe
	tsfFV8ZwOoph3C14MS5oPMck7tJ8f/4wwdc3fos2h0UpzQiv5CLQ/TB6gk76cPCMOSDa0YFOvSV3x
	9BFXPasUD3oJjPaCGn3pr+dzKn5WNVHUo1SCTr5+G8pqUzdfuVQjJQZB3FxC6M9wMlJ0/t3kGyaeK
	E4KWBShMyiTWgMSjPlOswmum9r0Psbi0LJrjQI3E4vvoe09nZKhQKlj1Uj7C2vBNRxykaBLw52CqH
	PNPLDbb4RABQvezagdDEbDI+0UsRUm6Ac9BOBiZ0yiI/eufNNfEsd9rmzKNOYMBysbe2SCEhgXYkc
	P9UTT6Ag==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPE-0000000D3FM-40f2;
	Thu, 23 Apr 2026 12:43:55 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 37DC520B7167;
	Thu, 23 Apr 2026 05:43:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 37DC520B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948224;
	bh=HSbbqWv3vuhtoGamHoPNheyejHz2e9u0oDYSbNnHoaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnDmNSc0a/QiF41tnxPVpEemp0ovscQVoHm7CEknskN0kFoNazOQmBlBxrsnROhBF
	 HheeJD79c5Vtd0Nsn/hk4DaJ85YaULJVPW12qOrDSXkk2T4+rkdp4TmKCHfJ7PXX7H
	 s4ZTD4CYNMR+wg+YC3mqrxLdgn9/4lpM4PspwDDo=
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
Subject: [PATCH v2 10/15] arm64: hyperv: Add hv_vtl_configure_reg_page() stub
Date: Thu, 23 Apr 2026 12:42:00 +0000
Message-ID: <20260423124206.2410879-11-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134345_237299_58794BB0 
X-CRM114-Status: UNSURE (   6.87  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

ARM64 does not support the register page overlay, so provide a stub
that returns false. This pairs with the preceding commit that moved
hv_vtl_configure_reg_page() out of common code into architecture-
specific files.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_vtl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/hyperv/hv_vtl.c b/arch/arm64/hyperv/hv_vtl.c
index 59cbeb74e7b9..e07f6a865350 100644
--- a/arch/arm64/hyperv/hv_vtl.c
+++ b/arch/arm64/hyperv/hv_vtl.c
@@ -156,3 +156,10 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
 	kernel_neon_end(&fpsimd_state);
 }
 EXPORT_SYMBOL(mshv_vtl_return_call);
+
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu)
+{
+	pr_debug("Register page not supported on ARM64\n");
+	return false;
+}
+EXPORT_SYMBOL_GPL(hv_vtl_configure_reg_page);
-- 
2.43.0


