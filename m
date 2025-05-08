Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385BBC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8EFYGPZMeRrs1KD6TiRm0R48HMnJ+Hld8vbK6IUrWs=; b=rhBVeaXqSOJxCQkmx17CQGgKIC
	NwZkIUwC3wwfHNbM77Tb7Xt9u9hwyn2KVlVgGaVjAf/bau4wq0M1InvvZ3D1upTgVPCIa9EXEhcQ1
	QZY5qKtBAh1TUktebBR6gf8V4idXasQ0GOnPoGKe4byU8SEUPrHQ3qPf0Wq1tEJhHI+4E5SOwkdgq
	8LHhvoWg6rzKeUDeVe+Isx+MddslAALX7H8ST2ewjajYUJcM+itXb64gRGq4wja8MPwM7AghGd0fI
	Vw5kKLS2F+Q566N88IBoct6FrQ3seAROf4bct6Xzcwgx/rkMJ9gmlAIdDglumJdBfoAUXjzAiZn07
	HP3VzKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD21u-00000000sdD-3QKr;
	Thu, 08 May 2025 14:15:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1IR-00000000kaf-3Myj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 13:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f8EFYGPZMeRrs1KD6TiRm0R48HMnJ+Hld8vbK6IUrWs=; b=jN6N7nMJoi4A+H8L3+d62R7yGu
	/9swBjFyzkvf8XelYizftNvgTGkkKBKR3KWtgREoaRMbWwfQrAAb88dADNLIAB9oAWb+cOWkxtdj2
	orEDgzmorS64beR0qOYi5X+LELDItN1TUOrTZbt4OaMnj4tWWAisgUjafh+kwSm5sngRLI/kPcA7R
	roEO07CHFefg+1jwe13WX76KBOSle+KbFPSYArs0KuYQeSqJPCwrR51/LxIEnAp3zZVD8fie2dWsE
	k4EVFw5+LeWuJF+7+YGgddaRYFLVKseo2s3linxxfebdR4tzabdI1IdT3Ho5tnbrYG+QihR02ol+t
	HQ4aWMag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD1IO-0000000G3vP-44P4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5BCA106F;
	Thu,  8 May 2025 06:28:05 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C444C3F58B;
	Thu,  8 May 2025 06:28:13 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 22/24] kselftest/arm64: tpidr2: Adjust to new clone() behaviour
Date: Thu,  8 May 2025 14:26:42 +0100
Message-Id: <20250508132644.1395904-23-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_142817_242294_79921295 
X-CRM114-Status: GOOD (  12.91  )
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

In order to fix an ABI problem, we recently changed the way that a
clone() syscall manipulates TPIDR2 and PSTATE.ZA. Historically the child
would inherit the parent's TPIDR2 value unless CLONE_SETTLS was set, and
now the child will inherit the parent's TPIDR2 value unless CLONE_VM is
set.

Update the tpidr2 test for the new behaviour.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Daniel Kiss <daniel.kiss@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Richard Sandiford <richard.sandiford@arm.com>
Cc: Sander De Smalen <sander.desmalen@arm.com>
Cc: Tamas Petz <tamas.petz@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>
---
 tools/testing/selftests/arm64/abi/tpidr2.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index 285c47dd42f63..eb19dcc37a755 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -169,8 +169,10 @@ static int sys_clone(unsigned long clone_flags, unsigned long newsp,
 			   child_tidptr);
 }
 
+#define __STACK_SIZE (8 * 1024 * 1024)
+
 /*
- * If we clone with CLONE_SETTLS then the value in the parent should
+ * If we clone with CLONE_VM then the value in the parent should
  * be unchanged and the child should start with zero and be able to
  * set its own value.
  */
@@ -179,11 +181,19 @@ static int write_clone_read(void)
 	int parent_tid, child_tid;
 	pid_t parent, waiting;
 	int ret, status;
+	void *stack;
 
 	parent = getpid();
 	set_tpidr2(parent);
 
-	ret = sys_clone(CLONE_SETTLS, 0, &parent_tid, 0, &child_tid);
+	stack = malloc(__STACK_SIZE);
+	if (!stack) {
+		putstr("# malloc() failed\n");
+		return 0;
+	}
+
+	ret = sys_clone(CLONE_VM, (unsigned long)stack + __STACK_SIZE,
+			&parent_tid, 0, &child_tid);
 	if (ret == -1) {
 		putstr("# clone() failed\n");
 		putnum(errno);
-- 
2.30.2


