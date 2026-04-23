Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D59CF589B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCqVD6YRGkVlS61nC58ZQHPJoEDu23OMTFcYIc3KK7w=; b=pbu5tXC1K4FsXyjrhjDbtT/roK
	vxWqcZ4JDYFfP6ACxLkU+vsKokvUTfjc4Z/YpisQ5qMR6gRjzu4VJMXcXhETo3akNHph9wARD2xES
	8/kkktCuwZAyyCp6id7X7qqS7Dsz12F8Hj9o01fqbog8a/CzkZ8legftk9/ATG/0blBTbLI7BTxgZ
	Put2Yc0LR1u+31W+TJgp7Qcm4uDxv1v06AOaw6AhqDYYHncS2HyitZCJXunAFQYOVXvT0bHBgHOdJ
	5oDqNpkVw4GvOLL8Ll4V/TlwjMhb8C6XH2j6bg2f+oYtqyDTb5gp+qyrtYnsFddMFCP+AIr+UEeKC
	uQl7MMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQC-0000000BfRB-1Fsw;
	Thu, 23 Apr 2026 12:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQB-0000000BfPi-0Vo6;
	Thu, 23 Apr 2026 12:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WCqVD6YRGkVlS61nC58ZQHPJoEDu23OMTFcYIc3KK7w=; b=JZdQ+yauBkKtvxxB0kIJ35P+0F
	nCySeSsOU+swtJ+2SC7/LRlrkZ8V24SNJN20DtxocWi9VrXDZQODQ51vVKlExGknuarOG7T9Xe/2Y
	jH4jbAL13NNmQ+JeFTy0qgRtUDsvTSyAAkxOoLLFoUJWQDwVqF5e0OCRmj7ONg8xWKjndOZDdjI9E
	NvR8Cf1SYxzYNZ8OJeNO1pFsDmHcZcueLLnp/urGQM0Oj8GlRo8BWp9G97VED+PjZ9FEQL1PMFk51
	nSswOzDbolzMrv2wjnSz/4lyb+9hmgaETfprS/cg8DJ9p3/Rzgu2CiVfUONwW50ahK7hDrSGLnY7r
	Uh4aHV6Q==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPx-0000000D3Rt-3LEp;
	Thu, 23 Apr 2026 12:44:41 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8D79720B716E;
	Thu, 23 Apr 2026 05:44:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8D79720B716E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948255;
	bh=WCqVD6YRGkVlS61nC58ZQHPJoEDu23OMTFcYIc3KK7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9WkEKDY1+IjGA7KFzub4vgAD8r4TOVboRhyxRljZfT4Cn2GsJoqg7WNN9vIhuVXt
	 H2Yf3Nkj2Wsq271fqrX1wrAYYyvoFn2o8S7p9TnmsSNSUq3XOrQ1dDRVtCcJFMQy3B
	 QohTj61p/B/cM3PvJR+/k9oHkGlU7NBEhQoZ8ymM=
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
Subject: [PATCH v2 14/15] Drivers: hv: Add 4K page dependency in MSHV_VTL
Date: Thu, 23 Apr 2026 12:42:04 +0000
Message-ID: <20260423124206.2410879-15-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134430_094449_59C5DF0A 
X-CRM114-Status: UNSURE (   8.66  )
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

Add a dependency on 4K page size in Kconfig of MSHV_VTL
to support any assumptions that may be present in the code.
x86 anyways supports 4K page size only, and for arm64, higher
page size support is not validated. Remove this dependency as
and when this feature is supported.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 7937ac0cbd0f..115821cc535c 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -96,6 +96,11 @@ config MSHV_VTL
 	# MTRRs are controlled by VTL0, and are not specific to individual VTLs.
 	# Therefore, do not attempt to access or modify MTRRs here.
 	depends on !MTRR
+	# The hypervisor interface operates on 4k pages. Enforcing it here
+	# simplifies many assumptions in the mshv_vtl code.
+	# VTL0 VMs can still support higher page size in ARM64 and is not limited
+	# by this setting.
+	depends on PAGE_SIZE_4KB
 	select CPUMASK_OFFSTACK
 	select VIRT_XFER_TO_GUEST_WORK
 	default n
-- 
2.43.0


