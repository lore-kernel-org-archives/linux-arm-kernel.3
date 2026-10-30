Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=49RZDRV7;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6I9tjMJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GRCGW6zun9XgkQRQsjo432+p58mI3EkOvS36OEwLx2k=; b=49RZDRV70EufA3wYVKXVawVr6W
	I6+Jr5oSQD4EEijD77udkU7mn8OvWWbZrDH9Q6+2REVPeJEsBZxOYomGfcjJgUCAYF7591LbrOrLT
	z0TLxidRDFi+cXjuW94LFY3C/H8Gp3uy7ywI+w7oAt0ZwxgmkMuB/K1fLOVSx7hJ47IwAvnhrkbpy
	/psaj8vNZv6Xt20dtmgd5lMkPVYRVLOVI9l51ELjYcnRQW+/MKZNoRSi1kRnxUmZt7mNbbiwi64Wi
	KFW9s9bAvJSotLgrH8hKKgmvnVstBFSVLTclUlh0DvskoFtrqT2mTPZMDunSYGNvHd+K+Lhaj1ElA
	y5OS0Bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgEh-0000000Atn3-1hA4;
	Fri, 30 Oct 2026 06:37:11 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgEd-0000000Atlr-2cD6;
	Fri, 30 Oct 2026 06:37:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GRCGW6zun9XgkQRQsjo432+p58mI3EkOvS36OEwLx2k=;
	b=6I9tjMJvVzKH+TuaWeFghRnbaH4yCZCly7Ie0vlLjxGK41kc6ogruEU10hnFNtrjq6NO+biXZ
	FOD2U7ZtiCNQGmv347mfUsfVKqvf6M9izgctTEVOpT1CwvjWR3sriSwWAg3G9Eavs0apptl7/UL
	JmNq2PwZbRR0AMTheEHq0ow=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jGBGK4NMcz1K99C;
	Fri, 30 Oct 2026 14:36:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5535140565;
	Fri, 30 Oct 2026 14:36:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:36:58 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linux@armlinux.org.uk>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <shuah@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <stevenrwalter@gmail.com>, <will@kernel.org>,
	<wade_farnsworth@mentor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <bpf@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2] ARM: ptrace: Fix seccomp seeing stale syscall arguments
Date: Fri, 30 Oct 2026 14:36:28 +0800
Message-ID: <20261030063630.1218302-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_233708_122707_8C5DCB7A 
X-CRM114-Status: GOOD (  11.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On arm32 the syscall entry code copies r0 into ARM_ORIG_r0, and seccomp,
the sys_enter tracepoint and the syscall restart path read the first
argument from that copy, while audit and the syscall itself runs
with r0.

If a tracer rewrites r0 before the syscall is dispatched, at a
syscall-entry stop or at a SECCOMP_RET_TRACE stop, leaves ARM_ORIG_r0
stale: seccomp and the tracepoint see the old argument while audit and
the syscall runs with the new one.

arm64 has the same problem with orig_x0 and it is already fixed there in
commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on
syscall entry").

The fisrt patch fix this issue, and the second add testcases.

Changes since v1:
- Fix the sashiko issues.
- As Linus suggested, expand the explanation content from
  the previous version into the commit message.
- Add the selftests.
- Link to v1: https://lore.kernel.org/all/20260725091452.1875627-1-ruanjinjie@huawei.com/

- Link: https://sashiko.dev/#/patchset/20260725091452.1875627-1-ruanjinjie%40huawei.com

Jinjie Ruan (2):
  ARM: ptrace: Fix seccomp seeing stale syscall arguments
  selftests/seccomp: Add tests for syscall argument rewrite

 arch/arm/kernel/ptrace.c                      |  41 +-
 tools/testing/selftests/seccomp/.gitignore    |   1 +
 tools/testing/selftests/seccomp/Makefile      |   2 +-
 .../selftests/seccomp/seccomp_ptrace_args.c   | 463 ++++++++++++++++++
 4 files changed, 505 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/seccomp/seccomp_ptrace_args.c

-- 
2.34.1


