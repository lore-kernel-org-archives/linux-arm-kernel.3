Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD2C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 04:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GhpvHly5CfF3XPnV83ib9qN3edGzDbhFkA+3ePHZcq0=; b=J/7ZS7TUChPbOBBAUxq8Lcu2jK
	z5pEMqPB0mHRq2s3AgYMuzQDjPzrggH/cgcb0I/p2kSO+PXPRfqwnBdFqxZkjFPVviFzOclc2xbOW
	aY4ZQ5Ydqu7o1UsESff9e6xTFSIjD2YVoWRYMI51c1tMXjrem2gQZEh2Y+xFahGdbeghN9rkcjBaE
	z974tMR5KFTxPv6zNM+coY/6nQVYlQoGrV7dmh2bGGZOpbjvH/cakm/RPRVOyjVkmTnHnpAV4a6XJ
	d7KzAcaPs8ut/irfeCMI0KYUokB1d7+eDgZbU/QEpixlWCKKqiiO6Ar5cXUDkbGUjDcInArJ3QNNQ
	pPE0jPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpSP-00000004tso-1hyt;
	Thu, 06 Aug 2026 04:11:49 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpSL-00000004tr7-0t9C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 04:11:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GhpvHly5CfF3XPnV83ib9qN3edGzDbhFkA+3ePHZcq0=;
	b=Ahp1FeN2OicjSMax6uEBEa4o+Z+LD7RaMoFj9qMcP+N8Pw8rB0v4EPidPYUye1UFEEYODu63e
	2JT+7uy95lo1GxRs1PsLMBoI/fttUdEbIkEw7VASS9mtAMxWTTc3+Oc1BxbqvoxzwtbcGYInyfB
	wKsnacJEEWJzQzbSq+MwjWI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hFtrj0krFzmV8f;
	Thu,  6 Aug 2026 12:01:57 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 200A840565;
	Thu,  6 Aug 2026 12:11:29 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 6 Aug 2026 12:11:28 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <linusw@kernel.org>, <jpoimboe@kernel.org>,
	<rostedt@goodmis.org>, <mcgrof@kernel.org>, <petr.pavlu@suse.com>,
	<da.gomez@kernel.org>, <samitolvanen@google.com>, <atomlin@atomlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>, Xiao Junzhe
	<xiaojunzhe1@h-partners.com>
Subject: [PATCH] ARM: unwind: modules: Fix the mismatch between .ARM.exidx* and .text
Date: Thu, 6 Aug 2026 12:10:01 +0800
Message-ID: <20260806041001.143888-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_211145_942714_64926280 
X-CRM114-Status: GOOD (  11.77  )
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

For the new version of the compilers, C code that does not explicitly
declare the section attribute may be split into sections other than
".text", such as ".text.unlikely" and ".text.hot". If unwind is enabled,
this will also split the ".ARM.exidx.text.*" sections.

As scripts/module.lds.S, ".text.[0-9a-zA-Z_]*" sections will be merged
into ".text" section. However, ".ARM.exidx.text.*" sections will not be
merged.

For the following module code, using the gcc-16 compiler and the
latest linux-next code, will result in dump_stack() failure.
```c
void noinline stack_func_issue(void)
{
	dump_stack();
	pr_emerg("dump stack finish!\n");
}
EXPORT_SYMBOL(stack_func_issue);

static int __init mmodule_init(void)
{
	stack_func_issue();
	return 0;
}

module_init(mmodule_init);
```
```log
root@(none):/# busybox/usr/bin/busybox insmod test2.ko
[   10.846774] test: loading out-of-tree module taints kernel.
[   10.851840] CPU: 0 UID: 0 PID: 93 Comm: busybox Tainted: G        W  O        7.2.0-rc6-next-20260805-00002-g3d7269e6e98c #3 VOLUNTARY
[   10.852350] Tainted: [W]=WARN, [O]=OOT_MODULE
[   10.852405] Hardware name: Generic DT based system
[   10.852516] Call trace:
[   10.852939]  unwind_backtrace from show_stack+0x10/0x14
[   10.853487]  show_stack from dump_stack_lvl+0x54/0x68
[   10.853512]  dump_stack_lvl from stack_func_issue+0x8/0xc0 [test]
[   10.854134] unwind: Index not found bf000008
[   10.858157] dump stack finish!
```

Merge ".ARM.extab.text.[0-9a-z-A-Z_]*" sections into ".ARM.extab" section
and merge ".ARM.exidx.text.[0-9a-z-A-Z_]*" sections into ".ARM.exidx"
section to fix the issue.

Signed-off-by: Xiao Junzhe <xiaojunzhe1@h-partners.com>
Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 scripts/module.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index d0f200428957..0ccf0c205d00 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -39,6 +39,10 @@ SECTIONS {
 	.text			0 : {
 		*(.text .text.[0-9a-zA-Z_]*)
 	}
+#if defined(CONFIG_ARM) && defined(CONFIG_ARM_UNWIND)
+	.ARM.extab : {*(.ARM.extab .ARM.extab.text.[0-9a-z-A-Z_]*) }
+	.ARM.exidx : {*(.ARM.exidx .ARM.exidx.text.[0-9a-z-A-Z_]*) }
+#endif
 #endif
 
 	.bss			0 : {
-- 
2.55.0


