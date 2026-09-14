Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1061C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHZgWYPkUlOvid1BCuIg3AE1kCaSX0lr+bdS/q4Z0Vs=; b=1JFNg0i5v7/9sZNgu+NW8JW+Lh
	024OVyZ4+b+CTxPN3b5JknOfa6jSA5bNf57qOwnQhrKjjuxHxRxm3UEjvZEOGOiuvLBohnGE911+l
	hwKhTdvOBKmqpBoKgQE+cKYIjZmyOut5pm2DVlNZkfsjPcrClvxEl94ZOLR7A83s8ziUV/2M3HHtf
	cokMw5dIImadAuhLPZCkKEEne5ri9b/MWNdlRtTzw5sVHOy76NumeJejUAdTdv093DQvPRkNUVSDs
	fQPstRL4aX+O5TuKGjYFOvFhL5ljHnORakKVQv9D0gJJNqwEW/HbTPvAZkHju7w/r+gmViGyF8ze4
	HMNWLzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pY-000000036IF-0WED;
	Mon, 14 Sep 2026 10:22:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pA-000000035qZ-3UYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D3A1570;
	Mon, 14 Sep 2026 03:22:04 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86DB3F7B4;
	Mon, 14 Sep 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381328; bh=+anTZQTcTxJJMqHzg/vnOnnLfKJsJ8zCBI8ExbjXq7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrD/Ce9HIWRLZrvmLORYsXH+UKdLJqoXILoCQfloDfGEGif/gtQ2ZZQw7ziaNRoE8
	 jx7RQt9U0r/x/PNbvfL0ZWo1ipHT66zKU5Z/OVzKjg59TYzWSKaTQDKUKobAjNPhhx
	 rljEw/ZHFjybeQ77xfTdatdDPIfisWoR2Vdqn5NM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 28/38] arm64/efi: Add ALLINT to IRQ flags checks
Date: Mon, 14 Sep 2026 11:20:52 +0100
Message-Id: <20260914102102.68597-29-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032208_934213_A8EA505F 
X-CRM114-Status: UNSURE (   8.65  )
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

EFI is not expected to modify PSTATE.ALLINT, so check that it remains
unchanged across EFI runtime calls.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/efi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index 0fc5a8cd5850..c7fb21c00690 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -78,6 +78,10 @@ do {															\
 		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
 				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
 				   caller ?: __builtin_return_address(0));						\
+	} else if (system_uses_nmi()) {											\
+		pr_err_ratelimited(FW_BUG "DAIF+ALLINT corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
+				   __expected.daif, __expected.allint, __actual.daif, __actual.allint,			\
+				   caller ?: __builtin_return_address(0));						\
 	} else {													\
 		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
 				   __expected.daif, __actual.daif,							\
-- 
2.34.1


