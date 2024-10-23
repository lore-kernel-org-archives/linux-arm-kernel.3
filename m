Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2EDCFA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFQqIJMCoI3l4J3byjW/w5j2MNbERlwbMd704JJ1ji4=; b=0/5CzMM/HtPbEMxXYkzfXjodNS
	ZI63xI/C65lGZ+JBIvuH+gBhYgTohz+A4w2iCZ0aZ0mVv/007FOwcCD2RwvEA6dMZERI69BRa3Bfq
	U5UOhsw711xOjarVfHVXd7bz4R4hRw0C1sLQzY3NlR6sXEUDezXllBpXtjzIFVz6ZpMYXd3NWlztp
	IsIh5J8cZE9jQjTZ5u7BVfOp1xoFCI0atyFmXz3T8fzkVXCdT0jUdBv49jWLfPmsoTKoYstRTSlXS
	pE+VJ2jgI/ozAaUkMuYVMydn5V0LUc9hgVbQSraM7xVlvzLIq5Am34Iq/9RREBRS7ItQjjNiYci9U
	Xt0qAxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iGY-0000000Ft1u-1xTJ;
	Wed, 23 Oct 2024 20:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i90-0000000FrXd-2Jzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77F87A414B4;
	Wed, 23 Oct 2024 20:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67550C4CEC6;
	Wed, 23 Oct 2024 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715989;
	bh=WEpX97GMGue5h7bD/Qq1020rZU1gV6I6QjnRHlLOdmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dahnr0R796Tfqila1uyH46kYi0NyolVV4NVVXPx6GyX+TrSMZvzYKC2IORDw91YcN
	 tKn1v2LWgFdFPtpoEwjbgjk6TcOIttCRanO+Wn1Kx9ktepzB0DLWfPn2k9kRbxHEpv
	 QVJKi4Vw2rDOt4PFgydLmUw68t6yFax8L3/qoTLFOZ8PTnT7PfbFP2Bi5t25UtJb/L
	 6DSwhJRBYZF4xpoY6+nQKd+4pjUNnGnL5IqlXi/vM6Trl54bV9JIarDJsED5Y7BdQA
	 L+46L5knrXhElA4DrTtP4mAA62AOtl3HX8KthlH7C5vPXUsyLB8HoAnyPG094zqjm1
	 RfDstiEW0BL5w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:32 +0100
Subject: [PATCH 4/6] kselftest/arm64: Implement irritators for ZA and ZT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-4-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WEpX97GMGue5h7bD/Qq1020rZU1gV6I6QjnRHlLOdmM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8IqFapOgWCDGYthrlNY7lK+roKfgEiszak93NR
 OziALsmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfCAAKCRAk1otyXVSH0C8aB/
 9UFKrDED/C0Pc/AaNhAZcgAygaJXFU3+FqMiLgUTnRqeckBQB23OIdfU76q00F6+cT6wcXrddgjfVq
 MN5mRc7jPQF2rWgQEsUviDNoaRJuSk89KZDFW0vOjP0KOqSS3U6rVinrrSGwF/1S3Y2VU9mdRY7ZGY
 gtvGmm+spMMl+ImoOlbp2kwd589P2O798KVzGLyKtjt0vWyzTPzEeNBWN92SbdgYKuH2tBvd35PhEy
 hW1oGvxgsIaWSIuuik8tF7zyvh76LntL4xi+PKyt8f/uv6RFAjkr3TFONT9HaYPi8vg3r9V4EhcHsY
 pwKFhl48BWyYjvD6WHIwzrUzHfEUBP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133950_754711_B4E38F6C 
X-CRM114-Status: GOOD (  11.16  )
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

Currently we don't use the irritator signal in our floating point stress
tests so when we added ZA and ZT stress tests we didn't actually bother
implementing any actual action in the handlers, we just counted the signal
deliveries. In preparation for using the irritators let's implement them,
just trivially SMSTOP and SMSTART to reset all bits in the register to 0.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/za-test.S | 12 ++++--------
 tools/testing/selftests/arm64/fp/zt-test.S | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 1ee0ec36766d2bef92aff50a002813e76e22963c..f902e6ef9077bfa34fa7f85ce572ce3df4346789 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -148,20 +148,16 @@ function check_za
 	b	memcmp
 endfunction
 
-// Any SME register modified here can cause corruption in the main
-// thread -- but *only* the locations modified here.
+// Modify the live SME register state, signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
-	// Corrupt some random ZA data
-#if 0
-	movi	v0.8b, #1
-	movi	v9.16b, #2
-	movi	v31.8b, #3
-#endif
+	// This will reset ZA to all bits 0
+	smstop
+	smstart
 
 	ret
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index ade9c98abcdafc2755ef4796670566d99e919e5c..c96cb7c2ad4b406c54099fe3f73917259bd947e4 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -117,20 +117,16 @@ function check_zt
 	b	memcmp
 endfunction
 
-// Any SME register modified here can cause corruption in the main
-// thread -- but *only* the locations modified here.
+// Modify the live SME register state, signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
-	// Corrupt some random ZT data
-#if 0
-	movi	v0.8b, #1
-	movi	v9.16b, #2
-	movi	v31.8b, #3
-#endif
+	// This will reset ZT to all bits 0
+	smstop
+	smstart
 
 	ret
 endfunction

-- 
2.39.2


