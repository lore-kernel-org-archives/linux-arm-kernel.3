Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4215BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ichDHP4yN7OCsIfu5IkQl3LlEfznizw3CzXclQf96dQ=; b=xg2hRmN2z+fSzktodiVVTbqEva
	TpSfgqdz1CiYLHLiq2Ot9uocLLxAE8vaBpsdG4CfJtUxrni6/FCFUKvmnQYlQojL4MBuNAswZJbVW
	3JWiiZlmPuFUKP+1higcRjagXWLRnZLdN4h+QllVsiWl6AkMCCAaAtoEAOcKnwZWeYQdPrNbwZcML
	Vb44MIpLcKAN7qT7xeh689mPJakfs+UwdUjOgMl/FujckuSKL+al8V3x6Lr4I94CgZyaUTiPJEMMY
	mexpm6HTZ8jZ0Y612RUNgA5ZyjG3xDAhycS4t10Wg1g7gjX3yr0chzLDsp1B8vcCsWyeC00MCi0Gx
	XmlUyw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nr-000000015HS-48mA;
	Wed, 13 May 2026 03:35:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N7-000000014Dj-0gQ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99EA36132E;
	Wed, 13 May 2026 03:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE57CC2BCFB;
	Wed, 13 May 2026 03:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643296;
	bh=y8OlQ2u+RBKl5+g5VAi278HKoC71kQ9CG5Kwq0UXfOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwaaG1FwksSjtDGCqBBb30zlrP/Lef2E9lzbretHPg3Z7pj2aog6WKYOLLmBsLzKD
	 1RPlSv93beMtMc4YALNhn/nDaxftFgw27pnB7QpPBonygYQr5XqMoshADSOXoNdVSX
	 8cWdSSDV/0OIJeQVInQMPLrgdQxys0/h5U2vCW0uGz+QYfzYPEmjV4b2vUKImyJVEs
	 vIbVk61qcKWrogRX+NOMgmE+Xvj+ypo+kb6IrcK5igDjuNvKobRFDkn9XmUwoHdh+o
	 nvooKYJaq4fYolQAx1bHfX1JA05hAGrwO/X0g9ywfafSI3cXL6SRa+FMhtqE5j2JlB
	 vIPcIzkI5dbtw==
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
Date: Tue, 12 May 2026 20:34:13 -0700
Message-ID: <48efc64058f667159d3dedf367c1d4cdedf84f1c.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Message-ID: <20260513033413.KyXNxIhmJ4VJ8JzaAY2aUrP1wuKqnirnEkhqZptvUCE@z>

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


