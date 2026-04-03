Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F196E88D8D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cZKXQ5apHL7rLTSZ2gxJnwkZIWOsZ/SyIScH+kS7Pf8=; b=kitCwr2OEHjmDFKrrqwbdv+jV6
	Jn1fK5HXhty2ZxMzsXNQKZKXByndi4mdd5g36dV4Y8eBwJ+zX0lKP89fPYVwawz5firUAF+6Yh0sx
	8rExRGCriOipTNSelFbtwQSjVbb8XPRRZUllpp+ZBXYMajjgpsvdYiaPtCVPyBlkB2dxW2bbZWuBE
	l3wnq6uTS/8G5Aqle9tjl13a8uC76GXCpv10uKHHyBNMQe5mD0+bbu9aXQjWDMYRzuG35VVTp5TbP
	l/Tx1yMAIxKjKXkONg2eOdfdnC8kIab7WnEVSK7jgLV00FuuN9lV8m0EYxpUH3gzcanXWrMdL97ur
	CKeD7h/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8wj5-00000003IwN-0EX4;
	Sat, 04 Apr 2026 08:51:31 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8wj0-00000003Ivz-4ALS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 08:51:29 +0000
Received: from 0004-arm-atags.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowADnfBAG0dBpILVzDA--.7642S2;
	Sat, 04 Apr 2026 16:51:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 16:56:31 +0800
Message-ID: <20260404101004.4-arm-atags-pengpeng@iscas.ac.cn>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: atags_compat: bound the deprecated command line copy
X-CM-TRANSID: zQCowADnfBAG0dBpILVzDA--.7642S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4xur13Jw43Jw43Ww43trb_yoW8CF1Dp3
	Wj9wn8Kw4rJF4UA347XFWkua4S9wn2v3srt34DJ345XF1DtF1xXFWFg342934vq3yfAF12
	vF4DtFWYk343AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkKsUUUUUU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_015127_425756_3E14FAF4 
X-CRM114-Status: GOOD (  11.09  )
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

`build_tag_list()` still converts the deprecated `param_struct`
command line with `strlen()` and `strcpy()` from a fixed
`commandline[COMMAND_LINE_SIZE]` array.

That source buffer is not locally proven NUL-terminated before the
conversion runs, so malformed old boot parameters can make the helper
read past the end of the source array while sizing or copying the ATAG
command line.

Use `strnlen()` against the source buffer size and copy the bounded
length with an explicit terminator.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/kernel/atags_compat.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index 10da11c212cc..aa149710f0c0 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -92,6 +92,7 @@ static struct tag * __init memtag(struct tag *tag, unsigned long start, unsigned
 static void __init build_tag_list(struct param_struct *params, void *taglist)
 {
 	struct tag *tag = taglist;
+	size_t cmdline_len;
 
 	if (params->u1.s.page_size != PAGE_SIZE) {
 		pr_warn("Warning: bad configuration page, trying to continue\n");
@@ -195,9 +196,11 @@ static void __init build_tag_list(struct param_struct *params, void *taglist)
 
 	tag = tag_next(tag);
 	tag->hdr.tag = ATAG_CMDLINE;
-	tag->hdr.size = (strlen(params->commandline) + 3 +
+	cmdline_len = strnlen(params->commandline, sizeof(params->commandline));
+	tag->hdr.size = (cmdline_len + 1 + 3 +
 			 sizeof(struct tag_header)) >> 2;
-	strcpy(tag->u.cmdline.cmdline, params->commandline);
+	memcpy(tag->u.cmdline.cmdline, params->commandline, cmdline_len);
+	tag->u.cmdline.cmdline[cmdline_len] = '\0';
 
 	tag = tag_next(tag);
 	tag->hdr.tag = ATAG_NONE;
-- 
2.50.1 (Apple Git-155)


