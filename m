Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BD0D7308A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 04:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LyXaTfPuQ76Jqoj9OKQrOgaYMod10HiPTxLbntnsz9A=; b=z4yUQNT/6h6/ERPFEblK2pmtaP
	/G7Y+eLN+vscyrBOECFLP307YF6zfvOYhL84XCzrc4vIRFm5eQ89fllNBN5hP6r0BE6uawy5iPHWa
	JVxGzG9cwdeVfVfQNV2i3VnnLMBDiD2elUOnJNEF25aRZoCoEW9PKelhuwlgvdDMjtpuqxX3p7hB3
	I1HQbfSE9nqW0WSwRb6WBdZzdlLCQVnTStRkUVwyvo801Zv5z/aYrAWRuzCxDkS9pAOUh2MGuLdm7
	sKBAy2CSROjPhcHpw2VwLy+a/7oBZYqkhJOO4uyfuS0GcubFNifnEeUIFaH5twafDo+gfMqJKmR9w
	POITRiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoT-00000001AuT-1ShC;
	Fri, 03 Apr 2026 04:07:17 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoO-00000001AtT-3YE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 04:07:15 +0000
Received: from 0004-arm64-pi.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQztPM9pHU1XDA--.29765S2;
	Fri, 03 Apr 2026 12:07:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 11:56:05 +0800
Message-ID: <20260403143004.4-arm64-pi-bootargs-pengpeng@iscas.ac.cn>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] arm64: pi: validate bootargs before parsing them
X-CM-TRANSID: zQCowAA3yQztPM9pHU1XDA--.29765S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1DZrW7tr1DuF48Kr4xCrg_yoW8JFyUpF
	4UW3srtFs5uFWUAayYyrnxWw15Aan3ArZIkFykuw4Fk3ZxZry5Zrn5Kr1avr4avrW0vayj
	kFs09as0yFyUGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjIJmUUUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_210713_284375_98BE0383 
X-CRM114-Status: UNSURE (   8.96  )
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

get_bootargs_cmdline() fetches the raw bootargs property from the FDT
and immediately calls strlen() on it before later passing the same
pointer into the early command-line parser. Flat DT properties are
external boot input, and this path does not prove that bootargs is
NUL-terminated within its declared bounds.

Use fdt_stringlist_get() so malformed unterminated bootargs are
rejected before the local parser treats them as C strings.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm64/kernel/pi/idreg-override.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..310ed279ef26 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -373,11 +373,11 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
 	if (node < 0)
 		return NULL;
 
-	prop = fdt_getprop(fdt, node, bootargs, NULL);
+	prop = fdt_stringlist_get(fdt, node, bootargs, 0, NULL);
 	if (!prop)
 		return NULL;
 
-	return strlen(prop) ? prop : NULL;
+	return *prop ? prop : NULL;
 }
 
 static __init void parse_cmdline(const void *fdt, int chosen)
-- 
2.50.1 (Apple Git-155)


