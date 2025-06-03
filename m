Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE14C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFPz08SkgnP4dmKq5f4ybCkoE3RZpwYgwoN8w/w5dSw=; b=Q2su9sYzWV61OUQjOVE8BD6F71
	MZoFF7+RfXkxeCVYO5x1Sn6mx5fveDfITfbKvO5aEqHw9iJr8CU7xZAKfnrI//4CQ9nsxTX4EVJkN
	853OUoqCs31HFDSHoesWfHGdPo+rQhkbw9YqFzx7y/Nyt7UE9+OUJTbbs8nhA0/IYxOg98A+rU5BJ
	vZYCAVXQuoJVbHaBlmBX0XC8Z8zwtatM82PnJlDWgzGINDTlyUab0U1++iRi8UdowA8UAvgUhRoiI
	iW5XNopYhH3oOlZ537HvetoMCkhUVEJG9ggnJI0T7PQ3YPRfMjFXE6rJt9Cc7tVrQIfdWzQzO6TR7
	4WH0ofRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRMu-0000000AziD-3YRR;
	Tue, 03 Jun 2025 13:07:52 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRKj-0000000AzTp-1RGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:05:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bBWCv6TDZzKHMZ3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 21:05:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 4B1871A17BE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 21:05:30 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgCn+MIQ8z5osdqmOA--.37720S2;
	Tue, 03 Jun 2025 21:05:30 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	lujialin4@huawei.com,
	chenridong@huawei.com
Subject: [PATCH stable 6.6.y] arm64: kaslr: fix nokaslr cmdline parsing
Date: Tue,  3 Jun 2025 12:52:33 +0000
Message-Id: <20250603125233.2707474-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgCn+MIQ8z5osdqmOA--.37720S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWUXr43Ar15tF13AFykGrg_yoW8WrW3pw
	s8Ww1ayrs5uF1UAa4DX3W5uFW5u393t3sIya4UK34fJay5AryUKFWFqasI9F4UtFyUu3W2
	yrZI9ryktayUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUFBT5DUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_060537_532024_7BD1CB7B 
X-CRM114-Status: GOOD (  11.61  )
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

From: Chen Ridong <chenridong@huawei.com>

Currently, when the command line contains "nokaslrxxx", it was incorrectly
treated as a request to disable KASLR virtual memory. However, the behavior
is different from physical address handling.

This issue exists before the commit af73b9a2dd39 ("arm64: kaslr: Use
feature override instead of parsing the cmdline again"). This patch fixes
the parsing logic for the 'nokaslr' command line argument. Only the exact
strings, 'nokaslr', will disable KASLR. Other inputs such as 'xxnokaslr',
'xxnokaslrxx', or 'xxnokaslr=xx' will not disable KASLR.

Fixes: f80fb3a3d508 ("arm64: add support for kernel ASLR")
Cc: stable@vger.kernel.org # <= v6.6
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 arch/arm64/kernel/pi/kaslr_early.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/pi/kaslr_early.c b/arch/arm64/kernel/pi/kaslr_early.c
index 17bff6e399e4..731d0a3f1a89 100644
--- a/arch/arm64/kernel/pi/kaslr_early.c
+++ b/arch/arm64/kernel/pi/kaslr_early.c
@@ -35,9 +35,14 @@ static char *__strstr(const char *s1, const char *s2)
 static bool cmdline_contains_nokaslr(const u8 *cmdline)
 {
 	const u8 *str;
+	size_t len = strlen("nokaslr");
+	const char *after = cmdline + len;
 
 	str = __strstr(cmdline, "nokaslr");
-	return str == cmdline || (str > cmdline && *(str - 1) == ' ');
+	if ((str == cmdline || (str > cmdline && *(str - 1) == ' ')) &&
+	    (*after == ' ' || *after == '\0'))
+		return true;
+	return false;
 }
 
 static bool is_kaslr_disabled_cmdline(void *fdt)
-- 
2.34.1


