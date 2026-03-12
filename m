Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0258105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlTkkdBRxtJaKAxYoTfiRED2nKOGQ+J6g5fVtN4/y6M=; b=dvg/lk8OJGtgVOMp5Qiam4PqSO
	qh8JCg6LYUWvHctJSY+UHl2QqW41bbrXKL9ZzwYFztDW6csjxHKStYcPbw8WzOZEo7wTzQYEzERuT
	siHFOQu8JigsmORXYFoCdYd0StkxfzseF2DpmTFbrJl0aIZU83hhm7dSqckWpgxqlMwcM/4jTi6ry
	Wju+aoOnoRcORqMmfMeTBEt667KqK+Ejs7eCZkPFbmHmhNexamCOM2bLHWqIAqI/SPOhzcYgRJrp9
	LICMYF8uM6yM4hhNl2n4WLG/HdMIliBQjzSY99jvOXBh91nFQ/5qf54tLF04es4+AdAuPzCXRTXIz
	b+bzUTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fHS-0000000E3fS-3oCW;
	Thu, 12 Mar 2026 12:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fHR-0000000E3en-2G1a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 12:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xlTkkdBRxtJaKAxYoTfiRED2nKOGQ+J6g5fVtN4/y6M=; b=NPG5MdcqA1TAYHNJCOuf6KTmSq
	IxuIxxpvsDEZkm+Lm4wn/bOE4ZzrJ8+ZzBAmdJ2HWSBAulsRe6oQKzTlZ1oFXFcpQtnv/7lc7uwBG
	qA297WD8t7aayzCeGECjk81TFr/Y8bYYqpggpJDAnJ8oj3ysNpg5lgjAwLpmFWLpYVu54s2USBC/z
	5e8OH84EK5YpaTntw/+5/gDuHH3Hn6stpiD5E+ifSoFieRLyxqw3sZFEZPxT0lPTewRcfoGBpZOcN
	JWOdOa6BqSrKL4uzbhLLjXiyF+cEfNUX8qGhnQIc8oE+ptejMX/ItxCfSoU7LZCGYRxxnTeAiQg48
	arlE6rSw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fHN-0000000199d-1srY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:36:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95341418B9;
	Thu, 12 Mar 2026 12:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37831C4CEF7;
	Thu, 12 Mar 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773318997;
	bh=+K0U+39fI6wepOOuuwvoFFE12C+9HDXiqtjIeKJef6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mm7RTqcw1KSrwUNMR0dCj+/GC69aa573HNd2XeT90H5+nPXEcDbtZc7IH2Cdkavbd
	 1OPjRffOohUaPZoL3b9pWsXAJL1dpkSHzBa5WeUNh8dZWdhd/XSl/BcEYsk6oFv3iF
	 Y88BQDoAdlJWczl60f5IRplcLYkJDwXNg/rOR8XAExLvFt8Ir0q3A2KbKk1+xZNhh8
	 KYhGQnDYZJZOD+m3FzR0yNi36m7aVvpHItRLGMxGaemBvBe2/Ad7zHNYgiOxq3f06j
	 175YOv8ovz54havhpEi1aMV7NoCDwsMvnHRdehy48S9K4qwRzRjNvM1VFKe8P+UCqp
	 DxaT9+ZkOcrFg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>,
	Marc Zyngier <maz@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: tracing: add ftrace dependency
Date: Thu, 12 Mar 2026 13:35:44 +0100
Message-Id: <20260312123601.625063-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260312123601.625063-1-arnd@kernel.org>
References: <20260312123601.625063-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_123641_686651_0FBCD876 
X-CRM114-Status: GOOD (  12.05  )
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

From: Arnd Bergmann <arnd@arndb.de>

Selecting CONFIG_TRACE_REMOTE causes a build time warning when FTRACE
is disabled:

WARNING: unmet direct dependencies detected for TRACE_REMOTE
  Depends on [n]: FTRACE [=n]
  Selected by [y]:
  - NVHE_EL2_TRACING [=y] && VIRTUALIZATION [=y] && KVM [=y] && NVHE_EL2_DEBUG [=y] && TRACING [=y]

Add this as another dependency to ensure a clean build.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 32c7a4f85e75..bcc87f9dad33 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -78,7 +78,7 @@ if NVHE_EL2_DEBUG
 
 config NVHE_EL2_TRACING
 	bool
-	depends on TRACING
+	depends on TRACING && FTRACE
 	select TRACE_REMOTE
 	default y
 
-- 
2.39.5


