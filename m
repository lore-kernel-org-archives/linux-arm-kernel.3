Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AA3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HroRh2St+Xg8yyLQJlPNqnbxJr7QAobLl1AYOoBPltM=; b=NXpc/X6yPlyAT8Jkt3IBtK13WI
	SbvzKxGbckrb9sjO/l9hFmRgTkkC5lquE3ynhZIxL7/GaPme0lBtpe9XkV9jDeA1ckL4+rZe8mBc1
	IaelvzENMqfzrKEBjG30fkkC5yDL3MLmk3Y6QRF6CNhfBeO55e8WKs95TzOCCCD1uW4y2xFWTQSvo
	txGCJJUTLWbixvm3XYxm/FIxsy0qJ+MtNFJuO/3/k6Ja6m287MwmQEhGzRkpQP788+swUIE38KT07
	15JyDYGV2gdtltGDVo9mU0owmE9RwPvzvccP+BuUu0sMw9ZRMgejPuVzgqL4t1+Vzk7QllLQtzGmW
	5Vsnhzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9di-00000008DTe-1SMP;
	Mon, 02 Jun 2025 18:12:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9bT-00000008Cpp-3mYc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 18:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21842A50398;
	Mon,  2 Jun 2025 18:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852DCC4CEEB;
	Mon,  2 Jun 2025 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887782;
	bh=JHvjlluIgoCgZdww1HLkSx92SKwvfnV6QWHxnPzuEyE=;
	h=From:To:Cc:Subject:Date:From;
	b=uOm78rLbmePEMSVJ7PRfM90AMHm1JWo+yi2n1TLhqeshcDqJfbRsB9Xm7piZvVXZD
	 2ogvNO9A36IHi4gcaWcjlKLvxDZYmig9GZ92n8Q7d1B+GSg0bjheJ/6wDkVJPUdrwu
	 pOTtiknAoMdTpEfAK2H4aC0fOU9m5EKkd5Ad2fIqSzAT6e9RAeCksFrHiNdZfNkute
	 6YdndmE+s3x3NOvuHpmNPM8KbbOCdIcBQHCLoDj5O3fJBO9AgxAmiE0r1rQPn5g0zp
	 lLJXjA5O+F+PYCeDw5BXX56mVsSO7kDxjCkekIm5lgoCA0Cf2+tqE4GTlg4plrYQB0
	 wrPp0bRs/ktIQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  3 Jun 2025 03:09:35 +0900
Message-ID: <20250602180937.528459-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_110944_009661_67F0E95A 
X-CRM114-Status: GOOD (  10.41  )
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

%.pi.o files are built as prerequisites of other objects.
There is no need to use extra-y, which is planned for deprecation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/pi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index 4d11a8c29181..211e1a79b07a 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -41,4 +41,4 @@ obj-y					:= idreg-override.pi.o \
 obj-$(CONFIG_RELOCATABLE)		+= relocate.pi.o
 obj-$(CONFIG_RANDOMIZE_BASE)		+= kaslr_early.pi.o
 obj-$(CONFIG_UNWIND_PATCH_PAC_INTO_SCS)	+= patch-scs.pi.o
-extra-y					:= $(patsubst %.pi.o,%.o,$(obj-y))
+targets					:= $(patsubst %.pi.o,%.o,$(obj-y))
-- 
2.43.0


