Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C4606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vq8qQjHe;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB5yPkm4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h7jKhgW2MQavDeYA5DvZZ06yeDl1v6ZtS0ur/qsa/To=; b=Vq8qQjHecC7bd/kZVXTDEEWMlX
	M3m6R3vswB2CBfH+TXepPTFEvWM2ykcXs+8AmvEubAmUiumPHEgsu9XrkZkgLiZ1lxtQ3Pli1oVCj
	80EuTEf/l/Mg3mC6uxr7s/hVWJ3sHa2sPy5fVFr0fSqkhglUSqSWhUyq2Sm6qYiTfUjZUJFSFqvWB
	B048PoUIJNU0eJmWdDPZu6b4e8NsonGKxcJzXPr6g0S8jwxy0oQoBbdU1yN+tG6MZbgCwl0YIoHY4
	ijQo2iIyeyB0D48ab2jqPjrGBOa1O5ORgJISLjGTLznwiemmYg4b9aESBZW3HmJH2Dxrp2bWqR5YB
	Ja8+uK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7ij-00000009VSY-3atf;
	Tue, 20 Oct 2026 11:09:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7ii-00000009VSJ-2bVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:09:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62F69436A0;
	Tue, 20 Oct 2026 11:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A39B1F000C5;
	Tue, 20 Oct 2026 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792494568;
	bh=h7jKhgW2MQavDeYA5DvZZ06yeDl1v6ZtS0ur/qsa/To=;
	h=From:To:Cc:Subject:Date;
	b=JB5yPkm4XXvobRkuIEQqQ8ioy5y4+uEbdT7VbrS4d6ejba9cZ4jOTh/XEZYKyMPdH
	 j3t4nJFVyPeys5XaDBddY8adyHIgS9qjpi9B8dKwdK6NqbvGo16pEMAGOv9In4um2N
	 c5RDxYpB7RgBllNJWAWceAVTe2dg8bNVw9uDf2RKeR5Sr/GV2JFO0x1i71R+4FZ+B6
	 PNiOknRO7INNn2kMZRhD1LF1+lhfd+dgxGLz66shluUZ8z2hnLspDvzhtGMFRCO3yJ
	 jI/i6VjkuIzyl+ZUpERaTckvpwsyzhCs7XsZlNw0pM3gw8EqIlSkaUhASeWuTuQ5+C
	 p1S+ruzkpDAHQ==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] arm64: patching: Annotate text_addrs, new_insns with __counted_by_ptr()
Date: Tue, 20 Oct 2026 13:08:39 +0200
Message-ID: <20261020110838.191061-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=blum@kernel.org; h=from:subject; bh=BbljLzGPofMIqi5g5mgMPpwGq6qmez95yloL4CR6jK8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnXvbcFVf540l7dMN109kXH/tWb5j8TsCw9d0fmtGGE9 F7pG2k8HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRVhGG/z6p+1hTToYtswlr KCw8xKnS8fTtQ6FlOlxS/aw3jp3Jvc7wV2hTr/yStNsVRXPaItcmZTtH7vD9wLJa17XOrqGlpTu TAwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add __counted_by_ptr() to aarch64_insn_patch::text_addrs and
aarch64_insn_patch::new_insns to enable access bounds checking via
CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/patching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..5fc7805a93f0 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -194,8 +194,8 @@ int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
 }
 
 struct aarch64_insn_patch {
-	void		**text_addrs;
-	u32		*new_insns;
+	void		**text_addrs __counted_by_ptr(insn_cnt);
+	u32		*new_insns __counted_by_ptr(insn_cnt);
 	int		insn_cnt;
 	atomic_t	cpu_count;
 };

