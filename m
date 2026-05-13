Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4024BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve9yUrXQ/CNWv964BYcjcbjM4iu7aPgWZJq8BqEaM8s=; b=cQyXc4ayNBhRAV3oSc44cmBd0/
	vlysmCxxLg/oely6JhLbGj/4eVJCVF3sh5kdrpHThS0S9/pmR4wYuw4w1KPoAHdMQ3I+aCtDlihFS
	H9e+QoR1tSYR0gMXbeoh6Tj9KynhOtqf7yZuuaOAOerqrhc1hpDyKAGDMDyw91+6uMFdPYaVwCas+
	1mSvOZLHlU/ngmJYb40fzda10ZFUjCeY9dwNL7MZpbKoGvMuBUY8XOc9JVUjyVI3oJyrNz/7XChcj
	AmKTkLmhzP4FVJSMt2wTno4oJKtRPwtxCxw4YPT3vwbylKU4W4bVxoVJdHk71MWqAz1Wdzr7Apraa
	SWW9escQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Na-000000014oJ-3G2G;
	Wed, 13 May 2026 03:35:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mv-000000013tc-1YmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D23244502;
	Wed, 13 May 2026 03:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736F2C4AF15;
	Wed, 13 May 2026 03:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643285;
	bh=E5kQ00UQ2Ef71S/+LIcd2TddRuEa4D5lUI9w03xK5Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEvEM9lpAyNZOj1YJaY8R0CkMDWr0K6JsWqRGdXyGYF7QgGzischLDs79PKxdLeBU
	 BoENZDTVug+uDHJBYgM2J64TiNzyuokjyqpSSrlFeQjEPWcREDOlNv2olNyJbVZsbg
	 hS4vj8Q6y7UMTNU5XgP6bbRjDwOJ6d5Rv81YnssaHKAUzltD3qwCh4MtyZtfxCHeki
	 cu75wQw6cyaPkAOrmAauk1TKa+xgLAB4qwbgmZCndrArp4fAxpKl0JC/SBd826v+p1
	 N/dy0mSPSsCG/W6DvE7GOu6ACmfNQLJL3u9tjL0PAPWKFbm6au6R/YppInMWlRW9SD
	 KnorWSwo8nSSg==
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
Subject: [PATCH v3 01/21] klp-build: Reject patches to init/*.c
Date: Tue, 12 May 2026 20:33:57 -0700
Message-ID: <f32864b560d40894cdb70d613480d7c2ecdb55e0.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203447_609691_49A0C51A 
X-CRM114-Status: GOOD (  11.76  )
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
Message-ID: <20260513033357.ypxHvU6nY3gMiQ_n9snp-o3YDN5uaLc7oMV_UEvDxZE@z>

init/Makefile hard-codes -fno-function-sections and -fno-data-sections,
overriding the klp-build flags needed for patch generation.

Don't allow any changes to those files; being init code they aren't
really patchable anyway.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index c4a7acf8edc3f..911ada05673c2 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -362,7 +362,7 @@ check_unsupported_patches() {
 
 		for file in "${files[@]}"; do
 			case "$file" in
-				lib/*|*/vdso/*|*/realmode/rm/*|*.S)
+				lib/*|*/vdso/*|*/realmode/rm/*|init/*|*.S)
 					die "${patch}: unsupported patch to $file"
 					;;
 			esac
-- 
2.53.0


