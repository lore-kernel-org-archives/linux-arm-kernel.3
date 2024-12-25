Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjLQgNxnPp2fDAJw4ZzH3eILvD+hC1aKsgT8PJJRNaM=; b=e7GBUZhiUVbpfMh2qrs+ziNjSB
	IIfC+cZVASwhETQ89vujlfHQt4kCU/Tc7djLyTagu4/TKaKqEpyD7PTE6GdGIT6nTW4c2NPi+acVt
	Mo668BL/3dQTKpU5WdWegZRwr5Trgtt2rpJZIm5vPo1nAoBvzF+RYKhy5vmsdm6xFsPW1sMVCz4+t
	ZjQf5qdIIDP1ebZ1xlWxKqPPeZPB3TbLplbPCv8yLSuDvwc77oVo5UELOikNcvtw4adLorZnLntba
	AT5lGIRHPuuxs3qPo6L4NIDiseJDIn3eYiAlcLGOK0bV6uN7WeUwaT2ioCDpRZITTUMl6ukcVk84u
	2qmghCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTT2-0000000E0gN-0O1p;
	Wed, 25 Dec 2024 15:38:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTOg-0000000E08a-2kle
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 15:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 705F65C5E3E;
	Wed, 25 Dec 2024 15:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9B2C4CECD;
	Wed, 25 Dec 2024 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140846;
	bh=YXN+ZbzF3iUhuFL6Fu/VQPkuKYExYWWPVHWqrBfCSAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaaKfLaPG9bxpLdCXnQhtDShFIHONpJBSlfOJ9g9Mvbr1BuhohZX5UgK45ld6BJBY
	 q8ZWByh/y/LcZmF5MqcwDd1HnGCAOpJRV6kiOPKoQVLicAbe28TOcs1vuGKhdX003s
	 bh+4tycF1tDXHH5tt9Db0jpxya5Y1jn4Sx7hHeEwDujhPtyaZm72j16meH7XHKK95J
	 HO7Fn5YMjYwOjkhArP2yM2yH1WA5lIBexi5daesZRPPBRWMp/8x64KcfoEar0OIK1M
	 U5FT4V52q9sq4RJZtf8/u4yWlaxd+fszfD/DnoF7qWajLKM6aEoQbEpQFMz8pX7M58
	 OJ2byBy8TMYGg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/3] modpost: refactor do_vmbus_entry()
Date: Thu, 26 Dec 2024 00:33:36 +0900
Message-ID: <20241225153343.134590-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_073406_739007_8D494560 
X-CRM114-Status: GOOD (  11.69  )
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

Optimize the size of guid_name[], as it only requires 1 additional byte
for '\0' instead of 2.

Simplify the loop by incrementing the iterator by 1 instead of 2.

Remove the unnecessary TO_NATIVE() call, as the guid is represented as
a byte stream.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index ff263c285977..2c7b76d4e8ec 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -812,15 +812,13 @@ static void do_virtio_entry(struct module *mod, void *symval)
  * Each byte of the guid will be represented by two hex characters
  * in the name.
  */
-
 static void do_vmbus_entry(struct module *mod, void *symval)
 {
-	int i;
 	DEF_FIELD_ADDR(symval, hv_vmbus_device_id, guid);
-	char guid_name[(sizeof(*guid) + 1) * 2];
+	char guid_name[sizeof(*guid) * 2 + 1];
 
-	for (i = 0; i < (sizeof(*guid) * 2); i += 2)
-		sprintf(&guid_name[i], "%02x", TO_NATIVE((guid->b)[i/2]));
+	for (int i = 0; i < sizeof(*guid); i++)
+		sprintf(&guid_name[i * 2], "%02x", guid->b[i]);
 
 	module_alias_printf(mod, false, "vmbus:%s", guid_name);
 }
-- 
2.43.0


