Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E14F589AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8uasiKJJqB0UypVXrQ/4MfR+9wKG2jPGAjkmO/egns=; b=mSu6vRJjTf1SO4hkuOJ6JwUGHf
	lFUbs3zfuAEQBrwY+uXiMLFShionK/KXArumPhhV4Jcu4zkmuQZngZGYzI+QeyyD3Rx52sNaTsi5p
	7vKLkZSz9QqRQbaYMQelC0ulAh7bSJR64m4sCFdv8S2T9RY8R/dCSFOfQ0/CtFQntnWY2aQ+ZTx+X
	/gCqI6GwQE/bCXCaq1pbrb9ilDY0Nuc10ODs5Usjh1we97FkFd2A9k80J/8GbopX49wU32IOH2B7K
	qUX916xEnu6W58fd2C5Fs5qQ5OcdRXfyr5Wir/ffI+kectu4tR6lmtDVHL/KB7BUxjXh4U2OWzm+h
	bTuuhqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQP-0000000BfcA-3wxu;
	Thu, 23 Apr 2026 12:44:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQO-0000000BfaY-2faa;
	Thu, 23 Apr 2026 12:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R8uasiKJJqB0UypVXrQ/4MfR+9wKG2jPGAjkmO/egns=; b=WK6BO71GsfJDGfUqTRkS1cN8Qt
	ImWgW0P/O8n4GkD4kSEWV+jtcMejcsG6KhnuHL1GmpM+SyfKdzHoFg7uF+MklxwxKx15HV9D2u4oD
	GWifQMM1l8D3SXWYIQ9KUbbJhyTb0O5mGcshrcpHnChpdfFslEubZbkKAbn0hXdQn+M51xkdAv64i
	yfkRPQtTYOrSHvdxjCSRI6K67NAGfdRB35K8o7VXSF3uuM3H+ZRXVJGbQYTvaPBlpmF7gAaD++6LF
	HHxDVmRRIdry8+8Zr766lvDuR8ai43NQlSQGhH8MB+cHLbwysGY9A80zOHreDcRL2+hzczzxMjDn1
	4AlG85yQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQF-0000000D3Vj-4A1y;
	Thu, 23 Apr 2026 12:44:55 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 070C020B7185;
	Thu, 23 Apr 2026 05:44:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 070C020B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948277;
	bh=R8uasiKJJqB0UypVXrQ/4MfR+9wKG2jPGAjkmO/egns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZwi8EF3KFtKojnKql1YiP0AxnEytUmxPRo3tGXKd7KO+PMWGFiqKd6B2H0MhaQYM
	 YGXvBpEzByzP3E7BIOFqlkvqdMymumuRVtYgejafE2X8vrjrWmk57c9IhZ4qd5vNc+
	 GpA+cyWtUSQ/hPB3EXOg0C2B5OBUflbRhUenyRL4=
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
Subject: [PATCH v2 15/15] Drivers: hv: Add ARM64 support for MSHV_VTL in Kconfig
Date: Thu, 23 Apr 2026 12:42:05 +0000
Message-ID: <20260423124206.2410879-16-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134448_319991_108A3BD5 
X-CRM114-Status: UNSURE (   9.95  )
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

Enable ARM64 support in MSHV_VTL Kconfig now that all the necessary
support is present.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 115821cc535c..0bec3bc81a1a 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -87,7 +87,7 @@ config MSHV_ROOT
 
 config MSHV_VTL
 	tristate "Microsoft Hyper-V VTL driver"
-	depends on X86_64 && HYPERV_VTL_MODE
+	depends on (X86_64 || ARM64) && HYPERV_VTL_MODE
 	depends on HYPERV_VMBUS
 	# Mapping VTL0 memory to a userspace process in VTL2 is supported in OpenHCL.
 	# VTL2 for OpenHCL makes use of Huge Pages to improve performance on VMs,
-- 
2.43.0


