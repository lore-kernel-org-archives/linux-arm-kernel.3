Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD13CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF010O5Ez77E0X5rUOC89ph1F6h/g+B4bYpAIT7kJFw=; b=WGc2y1mQqBCsJ3vOIWNGTs1bkp
	mr8u4eIiXc8J1n7ARA70HvTMSLkaeUF7TZFTXV0OT/E5aL7Sxcquyh83QSO7yjXs0y1MgtOJs5gBS
	ea5sx3ZcCWYfUA+twRqf6rDSY4lLzl612Gl0FucUUGIco2ufL0RlG2JDh0DPs4QCaJRja3lAAba9l
	o3zttsogIK4c4ZyXEGGf7px7jgMfjISJ24MTjoBTAhnJZeweMhovh+xawfrupiwBe0w14f/KJA4N2
	WExKlm3noIGdsMZ10qJ/Omj2bHRy+LyZFTJfHeCjnk9s1RjJ35Lm1ErOmmBR6r+Ur6Jf2nzkFE0CT
	fPBLTJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Loy-0000000Cxdw-1uoP;
	Thu, 17 Sep 2026 23:47:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Loj-0000000CxVb-0vkC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 23:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cF010O5Ez77E0X5rUOC89ph1F6h/g+B4bYpAIT7kJFw=; b=VmDsP10YpbWAX+JMMqnLbQA2lI
	FMJBq9VlpWmowTa+Hu4ZE3T20yUQEFOpJn9p6ROonpTl5w5gPj/AbDbCpjJbTZotZ+tVMKmQH2/HQ
	vs7/NNBK72Ovq72ePcR9QIuO5tngX+IbUghl/9mxhuP/ENcuIFuQeEU4I+HojigVplpcMdMwYESFK
	AyzgIWsPlNJbIrVCMKB8IBhPq8S7rWrZag5JbaEv68bwL6xjdlRDQsbFVGbRMse4Jvnf+pPhp+78r
	meWz7BQosvEEGVqiwvecUqi5xsZXHuJ4vYk7hAGWpaVhH6sgRdNIbbfhv86JyZ7XvfJexRK738oHh
	jPcWnhng==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Log-00000009OeQ-08ut
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=cF010O5Ez77E0X5rUOC89ph1F6h/g+B4bYpAIT7kJFw=; b=dd9HDxaG3c3fBcDsiFg8uat21W
	5SfuQS+uIVNtWzGZhpZkWvYpVn3zmO7fuCPZJHkZcRUVfdlAHHtZtFtTBYIh4eG3dbsrzihgEHQCA
	JS9Ks7lLL3otp37LplHvd9QXbEWImNP2Xg5rGWzo+ZHf3TdaaojwKuBYU3sCfuXrVDz7ZTJocrWsN
	JJIoNIc2jCSSUlxSNVNmcuaZ7DuLwf4k0WnfAPCz0IjPd1PfXbm7c7IC6ar9/ukWffdIfhaVS3UqM
	+lpSEKjuEohVm7fRg3IPEPhVNUt27SjMzgsWqsO8KMeDdGrA4k+SWBzTITDXcDi2yc8Zmp6TxeupS
	exopnJRw==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7Lob-003hU7-Bj; Fri, 18 Sep 2026 01:46:53 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 17 Sep 2026 20:46:14 -0300
Subject: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_004658_231693_ED2D9E45 
X-CRM114-Status: UNSURE (   9.38  )
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
index 52e3538cc7df..8fc4701a6328 100644
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


