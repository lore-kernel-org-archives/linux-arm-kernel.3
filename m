Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/6gQJkVc8chfusT4r5IjgpjYkjlawNBR+J0R/Ujpvs8=; b=gRU1JtSuuXvATb/OzgWScgzjkK
	s2uRzOw6Q6kX0SSr1rRHnql26nAqRqexYo+31Bhw6whnWR4djjzrcvQZuMAnIf5VRVizgKwfDYnZQ
	21Fh/grUuKCfHf2/G1tHTletJYCKxipLyCGw9JJDjFXWmwGeKPj+5f8YCZegZMm8k5WRgoMddW+Tx
	Y70RHcS28KR+zRD5Rr+PIl2VoqJ4G7G/FE8RAZ93rfo8EBHraWzAaiYgiQwOFqkbWG+YXnUKF1s/y
	2tk78NQ6Nbqal0lqyeYtY3znsBC+d8vxbwWcGhbwjl/c5pqN2HVwvf49wuyk8STwMbNsDPX4gsyit
	seQExXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfX4-0000000C0N6-2XVN;
	Mon, 06 Jul 2026 09:22:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfX1-0000000C0MV-1hKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:22:29 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAD3mNHRc0tqRjvxBA--.35066S2;
	Mon, 06 Jul 2026 17:22:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Markus Mayer <mmayer@broadcom.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memory: brcmstb_dpfe: validate firmware section sizes
Date: Mon,  6 Jul 2026 17:22:23 +0800
Message-ID: <20260706092223.78541-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3mNHRc0tqRjvxBA--.35066S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1xCrWxuFyUur1UXr4Dtwb_yoW8XrW5pF
	13CFyaqr4UJas3KrsFywn2vay3C3WfKay2gFyxuasYq343Kr18CFyDtry5uFWktrWrA3W3
	XF1DJF4UCas3JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjd-PU
	UUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_022227_807693_656310B3 
X-CRM114-Status: GOOD (  10.36  )
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

__verify_firmware() reads a firmware header and sums declared
data and instruction section sizes with a trailing checksum.

Require the image to contain the header and checksum, and check each
declared section against the remaining firmware size before computing the
final total.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/memory/brcmstb_dpfe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 08d9e05b1b33..6846e3dac3d3 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -522,6 +522,9 @@ static int __verify_firmware(struct init_data *init,
 	bool is_big_endian = false;
 	const u32 *chksum_ptr;
 
+	if (fw->size < sizeof(*header) + sizeof(*chksum_ptr))
+		return ERR_INVALID_SIZE;
+
 	if (header->magic == DPFE_BE_MAGIC)
 		is_big_endian = true;
 	else if (header->magic != DPFE_LE_MAGIC)
@@ -539,6 +542,13 @@ static int __verify_firmware(struct init_data *init,
 	if ((dmem_size % sizeof(u32)) != 0 || (imem_size % sizeof(u32)) != 0)
 		return ERR_INVALID_SIZE;
 
+	if (dmem_size > fw->size - sizeof(*header) - sizeof(*chksum_ptr))
+		return ERR_INVALID_SIZE;
+
+	if (imem_size > fw->size - sizeof(*header) - sizeof(*chksum_ptr) -
+	    dmem_size)
+		return ERR_INVALID_SIZE;
+
 	/*
 	 * The header + the data section + the instruction section + the
 	 * checksum must be equal to the total firmware size.
-- 
2.43.0


