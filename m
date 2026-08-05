Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E0EC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dm0UYyFHV+UnDdfSgwXNF6VO4sFMr/Yoe8Q66agRcWs=; b=pakhNbQ8m7KgjsIWXJHZ7Ypch1
	8GJD3InyAEg2m5eP5dVbb0rCipXTKZIlnjt+2HfpnzwWoZx7V9YfuWyZSdI+UjTVJAU9Nf6Ss2cms
	sIZ3+k+aGuhut4grTPXiT1gXySvLLrf+Ic5kLIWJSFeeLHx0cKFFh47qHsBISTmu2CjBTG03RWTSA
	mkfXDDyejGCulvrkFM/nZES0HN1g6r5xbEy9Grz82e6tZoSsG0Ss0Wp+soafvw63vQLCg1pY6Ltws
	T6up6j5Gz5gAdglx5T+Tm6tg9S25swSm8EQxZ5HRnYJkZZjw+Z1mWmUpCnrMDcZwYrp7r8S+n5jVq
	HiuRpE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjFN-00000004aHt-0I7U;
	Wed, 05 Aug 2026 21:33:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjFM-00000004aHb-0Kq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 21:33:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A74374361D;
	Wed,  5 Aug 2026 21:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F691F000E9;
	Wed,  5 Aug 2026 21:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965635;
	bh=Dm0UYyFHV+UnDdfSgwXNF6VO4sFMr/Yoe8Q66agRcWs=;
	h=From:Date:Subject:To:Cc;
	b=fYOuaaSGvpCnQB18dQ2kxtF1VPi8CkZsTYVIkNOz1I7HK1RwkmdjiJYTYdYoPDqds
	 ihwQFW5B0KHTVowEKR2ZLa2oh0AaveRYAvmkLZOWWY9lhO7f1M0r+OAfh3JfaLVxLv
	 Qk2VW4dD/DPTwUxE06XHX3wULZv20W47Sos13vsoBGQebuIT3h1J6LYLfbcuyANe2d
	 M7bFgnxW+1nhoGiZUGgJEtp0/nZRUzLrLW+SULMBpdKZdKWqAQQBPxIxvSmp1X/SZf
	 QdQWpvU0rGiXXV6Tv0WZqUkOv5mXDr/FFtdk3I+YVKGJagNtIu8486zM6u6hnZJZl4
	 gvMoQxIHsjUJA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 05 Aug 2026 22:32:23 +0100
Subject: [PATCH] tools: Ensure tools copy of linux/filter.h exports the
 UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOarc2oC/yWNQQrCMBBFr1Jm7cAYbCJeRVwkzdSOxCozqQild
 zfq4i8efN5bwViFDU7dCsovMXnMDfa7DoYpzldGyY3BkfN0pB6j3v0BjctY2SqO8m4rlRUnTIu
 UjNHnGByFnlKA5nkqt9evcb782ZZ046F+xbBtH/MzoNSFAAAA
X-Change-ID: 20260805-arm64-selftest-fix-filter-h-build-a6da720750b7
To: He Kuang <hekuang@huawei.com>, Wang Nan <wangnan0@huawei.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Will Deacon <will@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Alexei Starovoitov <ast@kernel.org>
Cc: Aishwarya TCV <Aishwarya.TCV@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TDMvv8K0Op1te0I9Iv7+BTV9qR9g/7cEZdwQd8o2muE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqc6xA9K8rPu/1e8CNqM2WCFWyGrMhb0SxZzcbS
 V8JdRbgmIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanOsQAAKCRAk1otyXVSH
 0Br8B/43OcvEDXSjZ9e7+D8qlKFmMDggLGoNBqNhQSuCL/iLsyQrrDMdgLMdWtUshSDUZSl6qOy
 jtIqN9mnhCuaAdQOGa4x+M9JZ+ZZyp3KZEOq7youl2lqz+7+da1EtwO4+mX0ZGNf5/sCoua3nBL
 dX97HEJReq0k0KEoA4SF10DNYOt/hYvxHBCTz/HbOJypBrCAwnJbKRPW/z+9D8+jvKhx9vFiY+b
 KwP9pRJM3hJrwqRvUNu7ratE/ydR+asxT8P7TuSTSaFt3RZJ53LrKzaoncyNI76dr4RMlfRO6Jn
 c/mcADz6hBQDp47WTa/o/VvZHavODlhACalJZpHXdEch7PZj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Normally when there is an include/foo.h and an include/uapi/foo.h the
non-UAPI copy includes the UAPI copy.  This is the case for the in
kernel copy of linux/filter.h but not for the copy in tools/ which
results in build breaks for the newly added arm64
seccomp_ptrace_x0_bypass selftest.  Add an explicit include of the uapi
to fix the test and avoid future surprises.

Fixes: 2fcbc4adf997 ("kselftest/arm64: Add seccomp ptrace x0 bypass test")
Fixes: f143c11bb7b9 ("tools: bpf: Use local copy of headers including uapi/linux/filter.h")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/include/linux/filter.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
index bcc6df79301a..4ead4e72097c 100644
--- a/tools/include/linux/filter.h
+++ b/tools/include/linux/filter.h
@@ -6,6 +6,7 @@
 #define __TOOLS_LINUX_FILTER_H
 
 #include <linux/bpf.h>
+#include <uapi/linux/filter.h>
 
 /* ArgX, context and stack frame pointer register positions. Note,
  * Arg1, Arg2, Arg3, etc are used as argument mappings of function

---
base-commit: 2fcbc4adf99790564b83381b2f239294185603d5
change-id: 20260805-arm64-selftest-fix-filter-h-build-a6da720750b7

Best regards,
--  
Mark Brown <broonie@kernel.org>


