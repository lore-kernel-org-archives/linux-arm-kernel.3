Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6DCEFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3f0jw+piK5f3oQNq+Q1fXmw7tcRywSph3XCdtJZiEs=; b=j3KfmmLou6aB0pZExFzuClPjen
	ne2YaMeI+6cGBjPw4vU5VRfNCKU2kcX2mZ+ArBv+QkQZYqMPToFkDekftI58fX4rnrUdndMepMjVS
	m1Tx2rZQKtzwmzYB/+1F2mKULGcWsuDk1YoqTEGBUSf8yTiLWN2j6AeCkcI5jTSQxs2YHBKPK7/Xe
	Wb3cMhZ4CirCmYmJSc5cANofCggchyWHz4h0QGQan1DQHfg2ZLoULnrnAVCZzaxTbKysX14ixifdy
	ZGzhgdZACvJ52bUnh+yDvT37SOcZNkw6mr1vKNhmTRzehmW8JjisaUco0teSBj8UbMkLTC31qU/+j
	ZcFBgGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRD-00000000pkv-0XgZ;
	Thu, 05 Mar 2026 03:31:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRC-00000000pkK-1G0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6350861339;
	Thu,  5 Mar 2026 03:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6078BC19422;
	Thu,  5 Mar 2026 03:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681505;
	bh=F51eVpZxhFC3Gpzdnw33QNuA5g1SCpkt9olp+lxSzPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V9fJWr+8/EYPgIy+nETT92JCLwy6misPFQtAuPPQjaN/shMLhthGzvGUlIz26UhZB
	 vyvuAlAa3HyYSIzfTwQWX1WXdVVHZbCz9p+BviQ9rZprx84nf9qV/3FLv+igNKDtmT
	 jda1IQQ0zXeVxffPxZNNypJHra8zALLENpoVhNwgQuC1GWp5umsoNHHDQUzLaSIO99
	 eFgCOk2H39DWNa/WqdVdkvemh0mS1pSyOobj4mg4KFLV0njFJ6Lg9vEsJ0zpxey1uJ
	 5THwDsZo1sG6R2kBcy72RnHiuv/HwUCTCxctG71bsm8gbp7NWog37iHB9z9fWU5HHV
	 NsM5El/vPn9sw==
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
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 01/14] objtool: Fix data alignment in elf_add_data()
Date: Wed,  4 Mar 2026 19:31:20 -0800
Message-ID: <d962fc0ca24fa0825cca8dad71932dccdd9312a9.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
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

Any data added to a section needs to be aligned in accordance with the
section's sh_addralign value.  Particularly strings added to a .str1.8
section.  Otherwise you may get some funky strings.

Fixes: dd590d4d57eb ("objtool/klp: Introduce klp diff subcommand for diffing object files")
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 2c02c7b49265..3da90686350d 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1375,7 +1375,7 @@ void *elf_add_data(struct elf *elf, struct section *sec, const void *data, size_
 		memcpy(sec->data->d_buf, data, size);
 
 	sec->data->d_size = size;
-	sec->data->d_align = 1;
+	sec->data->d_align = sec->sh.sh_addralign;
 
 	offset = ALIGN(sec->sh.sh_size, sec->sh.sh_addralign);
 	sec->sh.sh_size = offset + size;
-- 
2.53.0


