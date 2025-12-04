Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE31D1D892
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+Lx46iAeOgPpubr+gkS3rp+7tkakNKdnP1SW8F/O7E=; b=0pzZ7DaqF87w3+uMefvYyl/By/
	NSNIQqqGx2w7HX2i0VTaAO1DCJC5s8VCFXOzJCEDXrAF1SsrpErv7K1mjrZnqdjIXHJw2gNC/BFWZ
	irmM4VM2WG07vGAcyP93U85v//KPoMlUcQGIHnvw5e2AOLUakewb7ZzgB3w2+RZst5oVAyg7qvoQv
	W+AsweZfDKwklwYxNst/4i33KfR0eG4mhHifGZDYc/gwlnddd/0ht0DbCgxmrLIhkrrZvL3sAVlbg
	un4DhmSdqHVlOAz6A63OPom/3EzsfhEQBHM2qUEy/0UcPRjBOaW7mi2IL0Gm51MYw8ahn3KqxeHbA
	kKEcUg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4bL-00000007ge6-2aQm;
	Thu, 04 Dec 2025 08:22:11 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4bG-00000007gT7-27iD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:22:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g+Lx46iAeOgPpubr+gkS3rp+7tkakNKdnP1SW8F/O7E=;
	b=S7xkFUo5md6dhTG0nsu8qRM2GgJ9v6v89JBKj8/wzVd31elaHwd1fP2zVW/A3+qqgBnQ+4A7z
	wQSKuQnOtm3YmNhaO5bKVUSjbLwTiKvCKE8XvNbByBo36USluVhNnhXIY0Y4Mhox+LsCBXRGBki
	kDx0a9NwJN4XiI12mMBbuSU=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dMS992zY9znTZw;
	Thu,  4 Dec 2025 16:19:41 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FD0C1400D4;
	Thu,  4 Dec 2025 16:22:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Dec
 2025 16:22:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <kevin.brodsky@arm.com>,
	<ldv@strace.io>, <mark.rutland@arm.com>, <song@kernel.org>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 16/16] selftests: sud_test: Support aarch64
Date: Thu, 4 Dec 2025 16:21:23 +0800
Message-ID: <20251204082123.2792067-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204082123.2792067-1-ruanjinjie@huawei.com>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_002206_706082_B8C0DB5C 
X-CRM114-Status: UNSURE (   8.12  )
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

From: kemal <kmal@cock.li>

Support aarch64 to test "Syscall User Dispatch" with sud_test
selftest testcase.

Signed-off-by: kemal <kmal@cock.li>
---
 tools/testing/selftests/syscall_user_dispatch/sud_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index 2eb2c06303f2..f53ebc89befc 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -192,6 +192,10 @@ static void handle_sigsys(int sig, siginfo_t *info, void *ucontext)
 	((ucontext_t *)ucontext)->uc_mcontext.__gregs[REG_A0] =
 			((ucontext_t *)ucontext)->uc_mcontext.__gregs[REG_A7];
 #endif
+#ifdef __aarch64__
+	((ucontext_t *)ucontext)->uc_mcontext.regs[0] = (unsigned int)
+			((ucontext_t *)ucontext)->uc_mcontext.regs[8];
+#endif
 }
 
 int setup_sigsys_handler(void)
-- 
2.34.1


