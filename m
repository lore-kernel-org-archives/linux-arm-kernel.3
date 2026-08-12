Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D1C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4yfOcQhzJTa/+/bkZT3FuVUPiZk19JOubhgQ5q0vPk=; b=f/nwUucYIFHmULwMReUdJLMj4R
	1GpD++nR4aglAdvWurUElAtmQxEMdQQNn8KJgFqDGg08K5HbmN+jgmGSsrai7PfZJKtd5yHdMQgYQ
	t5OFZaPJpqI17DIreVlCq0IItfQ5mCXu0Ljy3YVlhxcEYh37M+iTfQa/5OPDP5+pS+TC/4uhJMGt/
	5JfJMnjgh9z2dt5V3SrixaYG7RG2rcXKNvyyUZyYIpEt7LNwRcELh8bNymZhXS39cSnzX5LMWO+kV
	yPxU0SpJJhtLS8JvOoR3TrMEFOGj9f/ZZd8wmAX8UYQ0ne5txdb5nzc2xQCOO9ips1OEZYcs55/DF
	W6CHwq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvT-0000000Gh0N-2hmC;
	Wed, 12 Aug 2026 17:39:39 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvP-0000000GgtN-0h1v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=o4yfOcQhzJTa/+/bkZT3FuVUPiZk19JOubhgQ5q0vPk=; b=DKfOnp8YNI7jcNfyFwXTyGZCXY
	zkSd7u4qe8ZmO97G0O+jmJCntT6t2ffSdcN8xY9NmAQlRkVHsW7OYEhFCZHHpM9GUmbBAmTpq4916
	11slKYWOUTksG+4R41S+ZwnkmWyNRQ8HfI9HCjDoIj4wuprvlSlWAxoniz6CDTq4MPd6qQdCW5Ohu
	ouyFB3i5ofa61z3jMNBNc71Yelz+D/YgrSQNgyjz91Yw6kTuXwG526DWr/4Y03l2Wkjx7jvAYlV8l
	g8yRP2E92+ZhHHbXxVhvqHG03VSx4+avau8X2KhzYnYYeDjDO0/bL50SHzXAXDF1Xgz4j7zYe0O47
	zGhgv8eA==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCvI-000FR2-Eq; Wed, 12 Aug 2026 19:39:28 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 14:38:42 -0300
Subject: [PATCH v5 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v5-11-3d383927c609@igalia.com>
References: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, parclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_103935_217876_7289AE60 
X-CRM114-Status: UNSURE (   9.67  )
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

Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall in
the syscall table, define it as the real syscall entry point,
sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
mempolicy sycalls will ever be compiled for alpha, resulting in the
COND_SYSCALL() fallback being used to result in the sys_ni_syscall.

There's no function change here, but this step helps to unify the syscall
tables and create a common table to rule them all.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index f31b7afffc34..25180953c3c1 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -489,7 +489,7 @@
 # 557 reserved for memfd_secret
 558	common	process_mrelease		sys_process_mrelease
 559	common  futex_waitv                     sys_futex_waitv
-560	common	set_mempolicy_home_node		sys_ni_syscall
+560	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 561	common	cachestat			sys_cachestat
 562	common	fchmodat2			sys_fchmodat2
 563	common	map_shadow_stack		sys_map_shadow_stack

-- 
2.55.0


