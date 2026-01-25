Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D167FE63CAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA1RtwdryLPv2XMfRBGIxn1/in0pfcTMT0BMUZGgHD0=; b=WAz+YobYGX4kT+miS1nOPHFt7p
	8iZ6DG9JGiu+AkeHQ0nVY2EwLXvv/44F2ulnd9vDuvMkvvas4mvgvz1cP5mOmXcdgqFu2D3I8Lt8P
	Uvif0wio3okmYMTcHdKiVy8DQc+PZdUPzZXw649AOwklvk+b9hW+24Np40ZqoI90wJGyYXNaycavG
	4fdebbQhzJYkVqsm/+pHGXBJlIDu6glzOwRsPumdkJUF5/BDwY8lwplU/cd8DiLTsBd8ZVWeP2/0V
	zDGDMuMSrkHkOEE1uZCemngH6RSeFEt2N0sy2DXeKIwn16Ac9z+Y7pdmrKaYN4FujDcpgTiBnMXs7
	jQKJVM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3B9-0000000BKDe-3zJC;
	Sun, 25 Jan 2026 16:41:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3B7-0000000BKCc-3gYH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29f2676bb21so38783825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359293; x=1769964093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA1RtwdryLPv2XMfRBGIxn1/in0pfcTMT0BMUZGgHD0=;
        b=OYMRQvYwgycl4KV6Lyc4E3f4tdvaCChI+jNHL0Z2aNGWT3Os23ggmKdRoVNFSwLhXM
         OB6cxxyKN8obGBUbtBB3z4FL6fRnhjv7HvWuBML3oDBEQo3+C/ksKJQdHPRtXpsCY76E
         nHbHLPOvDPzF7+ox65MtQUcvvxZ9cqzBy6IVDfKk/drN52rWN09Gkg4C16de5PyrPkRU
         0wG9aqiei99gJZjvqn+yitDNhdcQpI5vYWf/jO/byJqjiAiaf3yQ4eW/d8dpaXuU7JQs
         yIw0fXPGiYQngWqf6MAwy4PCZOiFxSdgDk+WzjpRE4kd1Fyy8NGBJCP3atUwpxc4ODdU
         MPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359293; x=1769964093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oA1RtwdryLPv2XMfRBGIxn1/in0pfcTMT0BMUZGgHD0=;
        b=DxhdlFtXwPifiUOVxiD1VI9bYJJijh+5MQzaskgdmNVI5hHQGiw4JISB7GC3YSXYfP
         BOHamjHtGTQw75vxWglONQFzXKRYqx2J/bIO2Ux5oJ78gdSCCh8C/SRu0ahKmsE+J/Im
         EhnDSP4AQcYX7/BHeSDPVR6YwSkLEQrgAXqAXFZqEBn3XT4HCHOANObQuZeEtEptr3jK
         MbP7JmWrCXFl1pGwXpj420yRPzzqJ1YHvZ5ITnJG7Fel54g5uXkrLXQMUaUgRtzKWd5K
         h5IBHc8BOVBwyqNC412eoFWDAOPSYmEKFZ/wQW3T0hjdFrv82ttiERVryP+98AifjNM5
         gpgA==
X-Gm-Message-State: AOJu0Yw07/eOmP/3OhqfYPFKe/ZnfEICsTgurMA1lISKYohZfUk+KLCl
	iPcQ8+pu8kHW/lXxoPzf4xzKndnqjVt7uaAo2fKajrwQ8KXar18XC8R0
X-Gm-Gg: AZuq6aIm25HsjwS1CQ2/6WoMH0riy5PfqAzl9Og+Pujf1r5dRhU+NRlVDnCJ8paa+7z
	W2X2W+0SPPhInAYOaVbK9O3RICl2pwillwrv12HjTpKfcE7N1gBBJ/k1RwnhVc7Eft+0Za7yRB6
	NoXMVJNRs4gKfVEqlc5qqzBFGGDAlbIoT4tAYWmupW1nDJDsRwgiVfvwaCiWeMd3KHj1Uw45hV5
	A7j8NG2hATC5d1Jp5OTSUvFJwx+GygrF/ims11OxL/TxXSIkSG60hCmmfrv9psnKAEEAaf1YqBu
	ghR7b1mkXhOu6J8eGlVeDz2Ekh0zxQor9KgVrbVB9CuB203U5neYexPFmGnBfPWgPDYcBip62jm
	a8m/hv5PaeteuBMrgHE8AzPi6TKCto4UqnczoYKvdMwfAxZ/4a5151imnm/kx8qxsgCzgeVeCg2
	CxzktkFyEq57R4lsEbzMGzclfLXEBrRd4=
X-Received: by 2002:a17:902:d54e:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a84533b64amr17514385ad.50.1769359292945;
        Sun, 25 Jan 2026 08:41:32 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:32 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 5/9] ARM: entry: fix missing statistics of rseq exit
Date: Mon, 26 Jan 2026 00:40:12 +0800
Message-ID: <20260125164016.331257-6-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084133_914008_4DB5B103 
X-CRM114-Status: GOOD (  10.66  )
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

rseq_syscall_exit_to_user_mode() or rseq_irqentry_exit_to_user_mode() is
missing on arm when returning to user mode, this leads to missing
statistics of rseq exit.

Add rseq_irqentry_exit_to_user_mode() to
arm_exit_to_user_mode_no_work_pending().

Fixes: 5412910487d0 ("rseq: Expose lightweight statistics in debugfs")

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index d32f7be9a107..60e5c250da88 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/linkage.h>
+#include <linux/rseq_entry.h>
 #include <linux/irq-entry-common.h>
 #include <linux/kstack_erase.h>
 
@@ -13,6 +14,7 @@
 asmlinkage __section(".entry.text")
 void arm_exit_to_user_mode_no_work_pending(void)
 {
+	rseq_irqentry_exit_to_user_mode();
 	exit_to_user_mode();
 #ifdef CONFIG_KSTACK_ERASE
 	stackleak_erase_on_task_stack();
-- 
2.51.0


