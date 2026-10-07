Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7FECA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N3FqlCamf1RaK/86xYXMFstxumfKZ4nSTmAXz/VobVA=; b=S9e4RQJAnuGUL88OBhEaQH35Te
	35d4KtM2NbQnKldc8Ml7sAgfwSEA2tvt1y1kcEw1ct0EQdIKoSrWGp/90Dv17usiRx7+wyVc9esY1
	fGJoWQkJuMbavXZFLe0ShvGOe5rcMLRqyzflzMFh/4zfMOKHUviZQSm65FXtm9rStIW6B0zV2VzgI
	LMaNgmCiMGqH7EQsAesW0C+jQMkmhgWUtnulBO+bG4tCpmUmYOOggIEz+6onAr8TGUSGcHt+p5h/i
	yuoNKxue0bLuy02ghA+QhdnB87MddQsa70aGU4pqBDamyzOSzyeIQNyu6ErJVTZ/0YBMFbrWFzZh9
	1E//v8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMYJ-00000001uMF-2JeU;
	Wed, 07 Oct 2026 07:59:03 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMYH-00000001uJm-1yoy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=N3FqlCamf1RaK/86xYXMFstxumfKZ4nSTmAXz/VobVA=; b=QbTefDB5PP5xDzY567uyGYVPi0
	cnCRhSvoXpMLxb+uc5dv5BOFgz/2hUtYHFO2SBY8ZKNkgsgJE1vOP4SwCQlWSN/zdkBWHcqpCtxF+
	5CLmZVI17UPQ4CXSsfwQqgJESw5izaDnoQMkA8PH8p1zeawDRJe8fVwlTnWdIRFTJtWmZLjD1UdSO
	Drpdmat9ieTwi3t/bwABYFjv/6JSLs/JbPjTO1ZO0UJzY8JTNCbYWba7mPYrSibIG8OALZaKRRVbi
	jdkBgSdcj+uFS+9RNMFwXdf9cQafaQkIiZcVTCJnFdvGK7zC6ysPrPHuER6944l5gtyIglyHW5awn
	P/oo2Mrw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xEMY0-004bIt-2x;
	Wed, 07 Oct 2026 07:58:45 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 07 Oct 2026 00:58:16 -0700
Subject: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
X-B4-Tracking: v=1; b=H4sIAJj7xWoC/x3MWwqAIBAF0K0M9zvB/DByKxEx6FRD9EAjgmjvQ
 WcB50GRrFIQ6EGWS4vuGwLVFSHOvE1iNCEQnHW+trYxnNehnBwXM3Ljo0s2+ZZREY4so97/1fX
 v+wEeFQ1CWwAAAA==
X-Change-ID: 20261007-arm_stack-fa76c2d0d69a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kas@kernel.org, kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=leitao@debian.org;
 h=from:subject:message-id; bh=C7VdhqccnK39vg9uC8oo4T5dAfFhXtlKLiRZGHRwa9I=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqxfuwcBQoiEucUdx6S9JgEXkW997iGcXeZLKFZ
 ZehZvL716CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasX7sAAKCRA1o5Of/Hh3
 baxWD/48U2/+prIHfau8OQK9x/W3/mbkEMAIchsw5zICgIYPHLrqVvCQR1jlqrbj6bxflyKTp3J
 F4HlFm1Hs50ElWYd8cJR8kAg7eAIlJBeA10jvNGHdYNTPzsjHbTcrwL9AjQ24haeC7ySLkONboo
 G15H2qAE0gAVlkqjN4qrO1t8cI56EcEISpceNfksSsZZTob05sqLP0lywvvWN6yylG5HrhmvAjf
 x/nr+5ekZFDlZpaVYGCaJpSBlHi80sEZ0FTNV4tZ/IVu5Soo4cYKjWcs7as5j6Nq9pPdiQ/vV7W
 YOulAcCLq4yfatcEbVbMGzImEPtTXymtXUh6xS8ALse5fDea842mrhKnb2AZpjIzAJRg+TH530X
 HZFHRmqfvHlWLTtEOW95f/Lsfp+estabL6z7cBb9Xf7GZAhsyAPhq4I/mkPlTzfj9N4HUPKlQU3
 y8lEh+7CZ/cU1wzEpokgpkeacBdkwOgFpLs2dkfDMqjgu6mqEM3C5eIGpU8HcFQEZ2fS8bcCJr4
 L8GF5Ts2x9vYdAwQWK56t/8ou8lJdYd/vCTvC0tYiDj2rO4l4wdz4rbJLC3cMIF59VkY4yTBP6M
 IAInTvU9Kpn0GRs/ESCubm+cfw5gz0FQzBszWltscZKQruuNj4o2UBwyu/WkIR+7tnkuiTEXYif
 yFvB5DPRezZnyGg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_005901_531934_90CBE6A3 
X-CRM114-Status: GOOD (  10.54  )
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

arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
64K as well, we have enough room to keep cpumask on the stack, avoiding
extra alocation and possible performance penalties.

Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
page kernels are unchanged.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Based on Will presentation at LPC, I've decided to have a look at Meta's
stack usage, and I found that this might be an small optimization!?
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5f2db2cecf9772..b73371327d2a47 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -111,7 +111,7 @@ config ARM64
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if (SUSPEND || CPU_IDLE)
-	select CPUMASK_OFFSTACK if NR_CPUS > 256
+	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
 	select DCACHE_WORD_ACCESS
 	select HAVE_EXTRA_IPI_TRACEPOINTS
 	select DYNAMIC_FTRACE if FUNCTION_TRACER

---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261007-arm_stack-fa76c2d0d69a

Best regards,
--  
Breno Leitao <leitao@debian.org>


