Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41232E87846
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9uso56hUT5t/wNRAf0vCD6owXov4F7UMG6tU1Kk5yM=; b=iSM42U8zDdeySav5f+o52Ap8SF
	eex5aCXJLMtAgQYMbTwJ/zdBes9GUhAbw3iqPNpql1dfLSRsOkMseIijKvPccTUt+aLo4cHUrQYa7
	UfWNPlGe7TAPu2y2edwNHfJ7uB76JnaNK542y2q5hAjOXV7jer0UUB+P/zAGnVwUP7BueaYifbhtY
	fghl2FnAVJh/yx2ZmyohfQ0XXPv93u6KvnRMoh79lN7rG+Bp5hpEO62YfVOyg8D2IOseHOAMFzw0k
	zIMFsPkqvnB0DczADc5wwsHc5NZps7cjTUmpqek6U/oBY+egSZnYOtsXI7JRWaBErS0tvJs+Wk60S
	Oew6XDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJCM-00000006wWj-3eYr;
	Tue, 03 Feb 2026 16:24:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJCK-00000006wWN-2Xke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77CBE429EF;
	Tue,  3 Feb 2026 16:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38322C116D0;
	Tue,  3 Feb 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135854;
	bh=3aWB9czdX77ko627FLVQ27Wjd4hw35wKPWJ59FT1Nc8=;
	h=From:To:Cc:Subject:Date:From;
	b=VEoKDQcSOZMiRh7FM1iEhhRu5QbWSUeI7ZduuVBt7+h6MKTUV1peDI5N7SUYtjOve
	 5sKwd/aFYFzW9gHn5KtTmYOHBWo2FabQdNkrvF9HIo3FbARyx+7G0mWZ9kvjrdhNLj
	 vm0icwyb1WptXgOTyZtI8grYrK0iaffW6tPoF/X0CPCzmmm6cR3ax8ge+hcQy7CzRg
	 4KyDqET42t87Ufjq01zYu6QDyLP7xu6u9tEfyckoh0c5uTf7nwe3zni4O8sVIC1k85
	 GqnGpWs9wTmgX8egAXDRdZbWmRzuuVc9Gbbn4m152LHuq7dur6RXPO070iOliwNX0e
	 sRdYOZHhplnew==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] [RFC] debugobjects: avoid gcc-16.0.1 section mismatch
Date: Tue,  3 Feb 2026 17:23:59 +0100
Message-Id: <20260203162406.2215716-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082416_762088_7F1AD7A2 
X-CRM114-Status: GOOD (  15.20  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 has gained some more advanced inlining techniques that enable
it to inline the is_static_object() function pointer into a specialized
version of lookup_object_or_alloc:

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc.part.0+0x1ac (section: .text) -> is_static_object (section: .init.text)

From what I can tell, the transformation is correct, as this
is only called when lookup_object_or_alloc() is called from
debug_objects_selftest(), which is also __init.

I have not come up with a good workaround, so this simply marks
is_static_object() as not __init. Since there are currently only two
files where this happens, that may be an easy way out.

If anyone has a better idea for how to deal with that, let me know!

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/debugobjects.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 89a1d6745dc2..056957c4e52f 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1195,7 +1195,7 @@ struct self_test {
 
 static __initconst const struct debug_obj_descr descr_type_test;
 
-static bool __init is_static_object(void *addr)
+static bool is_static_object(void *addr)
 {
 	struct self_test *obj = addr;
 
-- 
2.39.5


