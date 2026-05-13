Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE48CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ichDHP4yN7OCsIfu5IkQl3LlEfznizw3CzXclQf96dQ=; b=EeaT2fLaSjF1uVlXnHFvj+aMQf
	MoiXxv/BCnZhvVpC62hdYC1l4t8Vq+ke6mTEBxha45TqVZ3caX1WAu2GcvWayG0OgRDE8txFNLUHK
	I35Sj+Yzu/K0iwYYVRHymOKYWiZxbeum8/d2fa5+95JTvdI74iyty6g8m049wDDoUwNRriRRuuiw5
	ZqCYpm0QhgVBpTlEl4hn1rbt3jpkSOsXOfq2rAmqwOZXynJBHlDgO1oH1f4U9lH76AVIhh9bpdkUP
	Vc8vkvqYAOUtvdmFTnSb3Eqi7c6zhuHXeVEOBiFV7VDI/lAOlcrruehdsMYI2EgyKCBkFcW17FOw2
	/9iVItDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0NY-000000014kR-3lsR;
	Wed, 13 May 2026 03:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mr-000000013ks-19RS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F6E44498;
	Wed, 13 May 2026 03:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCB0C2BCC9;
	Wed, 13 May 2026 03:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643280;
	bh=y8OlQ2u+RBKl5+g5VAi278HKoC71kQ9CG5Kwq0UXfOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N69tE3GMovJzMPOd8iBy8ZvldlfJ/pvSh5RBikos9xuV+s1/rJmWPtbsZV7vYKLGW
	 S/3TtZL+vGbmLWA29QlR+qE+6AUfz7zPJ5r1K0lnwZOlFSQtkjqnJQ/pqW0IoPpJZ1
	 guRw87L52HGk2leR7vcx0gJhwUtstnbmsfhJkeKnvdAkCHxZmihZ7yQ7IKgpyljnAA
	 bH0R/jby/qxP3AQUmphNILHNzLe5ySMMRwjPnFelNfp/rvmpIkpsnOCpiNY8eQqtTq
	 5jIE3oVuW+VN3IpLUvcTqjEy25JwF00zb/w/fg0I6e41t3yC6mnMxpW4guIe6LknJZ
	 8rvjlxh5EO7JQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 17/21] objtool/klp: Don't correlate arm64 mapping symbols
Date: Tue, 12 May 2026 20:33:51 -0700
Message-ID: <48efc64058f667159d3dedf367c1d4cdedf84f1c.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203441_367560_DD42DB6B 
X-CRM114-Status: UNSURE (   9.27  )
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

ARM64 ELF files contain mapping symbols ($d, $x, $a, etc.) which mark
transitions between code and data.  There are thousands of them per
object file, all sharing the same few names.

They aren't "real" symbols so there's no need to correlate them.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/klp-diff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index eb21f3bf3120b..e1d4d94c9d77c 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -501,6 +501,7 @@ static bool dont_correlate(struct symbol *sym)
 	       is_prefix_func(sym) ||
 	       is_uncorrelated_static_local(sym) ||
 	       is_local_label(sym) ||
+	       is_mapping_sym(sym) ||
 	       is_string_sec(sym->sec) ||
 	       is_anonymous_rodata(sym) ||
 	       is_initcall_sym(sym) ||
-- 
2.53.0


