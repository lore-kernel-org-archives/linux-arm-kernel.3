Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6605606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o8i+O1PF;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uycRKia2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1gp+SGMuATV3Zue2upFe3DPng4nJWIyqUF3Da0jtN6w=; b=o8i+O1PFooefF2I7itAmeznv21
	Z5jyIp5ZpbV9I04j9dnzGex8uEH5CzUIXvhUWjt+C2odxtjw2/REIf8DrS1/walXLzehpKkIRlDPl
	ZejEvU6uEsetruHgBU8idB4ghSKGS5h++1M3oSZw2pBTi1LYqNigq2L2Y1m17uc9toeNQJS71U8Us
	Ck51xWFuCAtK6AR21VBPePNZCQSozDsfGKpJAjIDScMV9FvmDqdg4LanCvkkKqsWMx0xXzGrKtaTm
	BB6BbINXtq1wiUP57ie+302QgBXvad0G1ILODKgtRq2QhIEOPEgIlRA0qda2pwVEMKen05rQIFXpf
	gLHxVKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOq-00000002LD9-2mkM;
	Tue, 03 Nov 2026 12:14:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOo-00000002LCC-2TFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1891595;
	Tue,  3 Nov 2026 04:13:50 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F30FD3F628;
	Tue,  3 Nov 2026 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708033; bh=043NqYjJWlUkPAIEUjFQCqtc7EXXK/oOixpqdms7bd0=;
	h=From:To:Cc:Subject:Date:From;
	b=uycRKia2ohjLiyMK24R4/+wybeLzHErYvIjlbTeulihkQQpuJz7QdN5vfIDOZUIU9
	 bWCjE15tFGrfb09WEh53ReZvvXiwdhhld1yBtfbl/FsOvBDuOqisGO6e+iJ1jL+PKn
	 iQU2vVamQkLneUPqBVcNfqjtDEIWX9ACTF6h6CxA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 0/3] arm64: fpsimd: Misc cleanups
Date: Tue,  3 Nov 2026 12:13:43 +0000
Message-Id: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041358_697636_A5E525CD 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series (based on v7.4-rc1) is a collection of simple cleanups for
the fpsimd code. I've split these out from some larger rework that I'm
working on.

None of these should have any functional impact, but they make the code
a bit easier to follow.

Mark.

Mark Rutland (3):
  arm64: signal: Remove redundant SVE/SME cleanup logic
  arm64: ptrace: Simplify sve_set_common() SME-only logic
  arm64: fpsimd: Simplify sve_setup() format strings

 arch/arm64/kernel/fpsimd.c | 11 +++++------
 arch/arm64/kernel/ptrace.c | 30 +++++++++---------------------
 arch/arm64/kernel/signal.c |  9 ++-------
 3 files changed, 16 insertions(+), 34 deletions(-)

-- 
2.30.2


