Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB19C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlTZo2YHN4mUSlk4pxkhvoD5faV7hXNmgVvajUQvWZ4=; b=V/YQf2VL9L9hwZBpmtoNFaI5aw
	mTh51tNrmaPqEP4lQMFIsTckNwVT5Ncp5QtvszFiGOuDDhtGEbQPnY83CGS7o9/EGTWM1EG+TvsDJ
	zkCPEgJL5VeuMVeKvCZsGw8RJdg7G1fuYs89vvz+Ji8y42vQgQ+mwJHt/jVc4CrT/M3jJirQtE6pM
	KPmSilb5jjZlSLH3O2lRiTDAnAQYmbOoNrf+87atWAHhfBcmmwlfEAAjsl9UGWX35lWNDATsCHwDb
	je34hJSwvmmLy670SUqjg/naH/+VL32wztGbwB3uIjMI6N2cihE7IXNCp/v7N4nBwBSuc7BUm7nxT
	GR+zCgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKaC-00000002xsz-46IG;
	Fri, 23 May 2025 05:04:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKCL-00000002uBd-3SB0;
	Fri, 23 May 2025 04:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OlTZo2YHN4mUSlk4pxkhvoD5faV7hXNmgVvajUQvWZ4=; b=O1nL5WS+mh3Eqczva6cxU1ucxC
	w3l8VMT+Q222VRHP9+VrwqFo8eoua4GMIHxkhFkRZp0ZKiqWqQpQDlaDdQBYvI1yuC5HbL/I3TsUc
	MA0cjY4/h+Vlttl0KqSiMbZ4CmtbrcOvn/79b2C0FtghlQVkEdxpwhbqgGkytRKboMeQs/VrI9eI4
	IkmA7X6gyCBv/MrZCYGNwhIkrZSUF8c6lNr/uj2MFHkpOF5lhw+hyTWFSdwUzkddXmsBzeDFaMHz1
	bcJ8XYm8d/2kFshdOGIwQwaGg5vStMw1hiR/h4grx78AUWLQkSjxbNeUyuPige9BqO1jXqyDUI867
	9PYltV9w==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIKCC-000000017tl-3BMc;
	Fri, 23 May 2025 04:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 802AAA4ED23;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3784AC4CEF2;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=snrRkduazq+CuYpLqIIgLSyyFGO/4xQDvfJjkALfmd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=op8RRRGe2/JON5AhouRE1uGu/0MQ6MJngswUtwTUCqRtXYGhN+/KMwsfK+InxrS/j
	 qVBI5FPdfZQsdd15OTbv5MfokKIPn3Jom9SYvVFRlUvJM+6byXz8hpvJnEUDE/eoC2
	 Fykfqq9R8Bgz7OPXG2c8og+uXdyuym0+B8zll4KTL4MLpoPnoSmk1fzWge/iYDnFwT
	 RpNM3JYC/cn/dKAymuALJKhBi5GY0ejseIQ9zPqp4Y4TLqiI49u5fGaBLSNpGn9dI9
	 1EiGxhtXGhxc6+9u34GU/yztyCegScP3oRdaK54o2i08c44La6Bv2YXhmPUOSt6Ojj
	 ExTH5vB4iW4Yg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Oza Pawandeep <quic_poza@quicinc.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 06/14] arm64: Handle KCOV __init vs inline mismatches
Date: Thu, 22 May 2025 21:39:16 -0700
Message-Id: <20250523043935.2009972-6-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=kees@kernel.org; h=from:subject; bh=snrRkduazq+CuYpLqIIgLSyyFGO/4xQDvfJjkALfmd4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3/OeF2xrGn/ecfjBwO7efZdOCt4+rf88t0n3N4wb Z+3/dJegY5SFgYxLgZZMUWWIDv3OBePt+3h7nMVYeawMoEMYeDiFICJ3LzFyHBy2+63G546VX1g 0Vi7P+DmOWnH15LfT2QGVG0KzD0V33ie4Z+ZkuwqZaEtna8zJ9x43F2j86WpmZGvafXnHuZ8IQF la24A
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_053950_664544_353D91B3 
X-CRM114-Status: GOOD (  11.25  )
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

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we
have to handle differences in how GCC's inline optimizations get
resolved. For arm64 this requires forcing one function to be inline
with __always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: James Morse <james.morse@arm.com>
Cc: Oza Pawandeep <quic_poza@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 arch/arm64/include/asm/acpi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index a407f9cd549e..c07a58b96329 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -150,7 +150,7 @@ acpi_set_mailbox_entry(int cpu, struct acpi_madt_generic_interrupt *processor)
 {}
 #endif
 
-static inline const char *acpi_get_enable_method(int cpu)
+static __always_inline const char *acpi_get_enable_method(int cpu)
 {
 	if (acpi_psci_present())
 		return "psci";
-- 
2.34.1


