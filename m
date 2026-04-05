Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6723EE64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:References:
	In-Reply-To:Cc:To:Message-ID:Date:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8zjEP2K0/jxMVUEzJZx2e2hDvlOjQWppHI6QblE5nk=; b=XCdKYJyfFF4WnOHJNb+zH3otY3
	rHV1Asd7TZ1Jen8+gsLB3I6+WtEBBH1yd2Ug2ok+9d1KyzYfYzpsctqor4yr0faa7Z6C3M5zvd9/H
	E+Onu01QJa7Ab0ANHSc2WOjXzdgMyITiBF0nLTSvo0M8BjFV4DjNfPJbw5Yv9aGAGIT6I8IgBTggB
	Wb3xiPA7WLubsxFTOBvhmaUXNcYnzPY56eWo6i52Cko2uF+uzH/VAd72fi0VWjs/2gn/EvV8zhbgR
	eCE6pOt43mNnR00w2CPQWaWnUia3sk6+1IbD7RTD4gmLEZobtI3P00JibKrTf4nyl0gRKVkJgME6y
	SuoZOH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0z-00000003tnA-0ivu;
	Sun, 05 Apr 2026 02:15:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0u-00000003tlp-2JAc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 02:15:03 +0000
Received: from 0004-arm-mvebu-v2.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADHa2ehxdFpTAU5DA--.28126S2;
	Sun, 05 Apr 2026 10:14:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sun, 5 Apr 2026 08:41:00 +0800
Message-ID: <20260405094004.4-arm-mvebu-v2-pengpeng@iscas.ac.cn>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403111504.4-dt-arm-mvebu-pengpeng@iscas.ac.cn>
References: <20260403111504.4-dt-arm-mvebu-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] ARM: mvebu: validate memory node device_type before
 strcmp()
X-CM-TRANSID: qwCowADHa2ehxdFpTAU5DA--.28126S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1kGrW3XFWkuF15Kw43Awb_yoW8Wr4rpF
	W3C3ZrKr4j9ryxWa4qyF4DZay0kan7JrZakFnxCw129a13X345ZFWfKw1Yq3Z5CrW0ka4F
	9r4YqF4UZ3ZrAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5oGQDUUUU
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_191500_974449_9FFD2282 
X-CRM114-Status: UNSURE (   9.16  )
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

mvebu_scan_mem() fetches the flat-DT device_type property and immediately
compares it with strcmp(). Flat DT properties are external boot input,
and this path does not prove that the property is NUL-terminated within
the returned property length.

Keep the existing flat-DT lookup path, but reject malformed
unterminated device_type values before comparing them as C strings.
This preserves the current distinction between an absent property and a
bad property value.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- keep `of_get_flat_dt_prop()` instead of switching to `fdt_stringlist_get()`
- preserve the existing “not found” vs malformed-value behavior

 arch/arm/mach-mvebu/board-v7.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
index a0740ab0..db6543ff 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -66,11 +66,13 @@ void __iomem *mvebu_get_scu_base(void)
 static int __init mvebu_scan_mem(unsigned long node, const char *uname,
 				 int depth, void *data)
 {
-	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+	const char *type;
 	const __be32 *reg, *endp;
-	int l;
+	int len, l;
 
-	if (type == NULL || strcmp(type, "memory"))
+	type = of_get_flat_dt_prop(node, "device_type", &len);
+
+	if (!type || strnlen(type, len) >= len || strcmp(type, "memory"))
 		return 0;
 
 	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
-- 
2.50.1


