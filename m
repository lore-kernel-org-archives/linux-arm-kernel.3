Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B28D73093
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 04:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KONKvb8Qc2AZcLQesfaIsH592DXIi1oTtN21eZ63hpo=; b=Dovdn6LutLkV+Kdqxfe9jfPvji
	rHtIFHrc6IQEwV8X/U5L9GIrbXW3eiQ1gaN24ab7IUjK5i4RilpWhIIsqVyBoBc2qXGNKXycrUqrH
	r/N4Ywd9lZcCuXOtANJ68NIo2u7YbCD5uIKjM9QrXijfnIjH/hL+o4gbzCudBg2YTi7piWmqA6dkm
	OjDi/SvGjPE3Ihp6lEzs1STRp56k8xCOLKJv6aPgXdwjYOtapvpb4ksSKNgCfvfYnRn4mhzggG0Mq
	BOWyPj8DGD64Z4RABAX0axJ+yn2+O7+6hBRhFPbptUieTN1xZPN14Vkk31ot/+JLfQIT4TTwym4Fl
	zNt/1pZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoT-00000001AuP-0HVj;
	Fri, 03 Apr 2026 04:07:17 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoO-00000001AtU-3XhB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 04:07:15 +0000
Received: from 0002-arm-compressed.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sw_tPM9pFk1XDA--.12296S2;
	Fri, 03 Apr 2026 12:07:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 11:55:40 +0800
Message-ID: <20260403143002.2-arm-compressed-memtype-pengpeng@iscas.ac.cn>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: compressed: validate memory node device_type strings
X-CM-TRANSID: zQCowAC3Sw_tPM9pFk1XDA--.12296S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rZr43CFWrXF4UKw4xXrb_yoW8Gryrpr
	WUGr9Iqa18Wr1Iv3y7Wrn8W348twsYkrW5Jr90kF1UK3Wag34FqFWftFy3Jw1DC3yrC3sx
	AF1rXFyDW3WfKaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUya14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbnmRUUUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_210713_284135_28817A90 
X-CRM114-Status: UNSURE (   8.50  )
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

fdt_check_mem_start() walks memory nodes in the compressed-kernel early
FDT and fetches device_type directly with fdt_getprop() before
immediately comparing it with strcmp(). Raw FDT properties are external
boot input, and this path does not prove that device_type is
NUL-terminated within its declared bounds.

Use fdt_stringlist_get() so malformed unterminated device_type
properties are rejected before they are used as C strings.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/boot/compressed/fdt_check_mem_start.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
index aa856567fd33..7c433ef33bcb 100644
--- a/arch/arm/boot/compressed/fdt_check_mem_start.c
+++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
@@ -106,7 +106,7 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 	/* Walk all memory nodes and regions */
 	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
 	     offset = fdt_next_node(fdt, offset, NULL)) {
-		type = fdt_getprop(fdt, offset, "device_type", NULL);
+		type = fdt_stringlist_get(fdt, offset, "device_type", 0, NULL);
 		if (!type || strcmp(type, "memory"))
 			continue;
 
-- 
2.50.1 (Apple Git-155)


