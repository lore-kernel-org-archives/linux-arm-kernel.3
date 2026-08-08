Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB234C5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hySmyd731HI49avcL3mGbdogr26/7EmNX03BPEob+mA=; b=iB44TGhYywxWW34FTFQCVieUr3
	E9YcPrA9lA68dUh8ErrPk8zAwJ/i1Ml1dToTY0Ix1jqjiOYisU4MVdKutqWGVWqv10wTx5SoAUAzi
	342//4KdlCA3281rFrf+P2Db2tffT4iCj2eoG6SAg8eW34ytBb7/H+jJ0JFMq60R+aV+wQcsriMhM
	tZ06O7LCNsZjmDvQHWLTjWCgGpd6PDuX2/26lVmeGIzahyQ7GRf7+oLgle/e0sg+SVBmKpHtuIQc7
	aiupzJkjwi1pOgD0ANwA5hKgJerTHnR7W++YH/0lpE0UHxNRsuGN7/ajSxKDLUPM/uPGSavk2rrOx
	Jhmwhsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJa-00000009mVm-0P9q;
	Sat, 08 Aug 2026 23:18:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJN-00000009mHj-04qN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7686460A9E;
	Sat,  8 Aug 2026 23:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D731F00A3F;
	Sat,  8 Aug 2026 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231120;
	bh=hySmyd731HI49avcL3mGbdogr26/7EmNX03BPEob+mA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RT1iFVvGtNC2gfYcDpnLWRYJLfm5w7eX6mO4qrzXUAdm86P6zRE8FFRXT19V3JtGR
	 +VfH3Nk5Q+Q1URgGUrDDZfbE6zKOqIQGpnQHY1f5is8ymGHtdZ97PBso9YxLHoEJwC
	 yXv8N/H//e1dwgQp4GV741X/jt2uWPjbPsxAGewR2i6BrQBCyoss2LjIfRql4dEfE5
	 PgAJZOxOHwvDzZyPfFQA4qMe58nUTDW67rsfZEhkXCNYCKda3VgQ6Sztu2Xm4hUNGD
	 eePgLajX4W1sqMfi/ZG3OkaaKeEMtG17p7caU4j8GyTh+UMRhM1jmeCY0Zgi2AfEwm
	 myIaTm+M+i2EA==
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
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 18/22] objtool/klp: Don't correlate arm64 mapping symbols
Date: Sat,  8 Aug 2026 16:17:22 -0700
Message-ID: <6f447024ac8b79a1a6f1b8eb1c5eb1b51017af79.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

ARM64 ELF files contain mapping symbols ($d, $x, $a, etc.) which mark
transitions between code and data.  There are thousands of them per
object file, all sharing the same few names.

They aren't "real" symbols so there's no need to correlate them.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/klp-diff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 922de4c8e9e89..d76d2f5b5acbf 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -547,6 +547,7 @@ static bool dont_correlate(struct symbol *sym)
 	       is_prefix_func(sym) ||
 	       is_uncorrelated_static_local(sym) ||
 	       is_local_label(sym) ||
+	       is_mapping_sym(sym) ||
 	       is_string_sec(sym->sec) ||
 	       is_anonymous_rodata(sym) ||
 	       is_initcall_sym(sym) ||
-- 
2.54.0


