Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6790CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nP4fIhA2RKu4fTkXiqGyFZU2ycuLn8kRCo9WKKJ18zI=; b=2A8KQWEKj+/9hPW+R2kZjyWGLm
	aTDQwa674bBHm0v7Th5m+1fYhrQ6g9y6v6QTpmi+Y9f3swNv1JHXwmFWg9auT1AITAvutQLyraAe0
	1GOytUd8Orbg7xhx0hhxE5nFbR/vUpWfSZMctnFkxs/BkR6yXMtbGInhTibxMaATlKbckKy1EZE+4
	BmI3vewHDKInDYdS9XYOO6fLX7pdXdiC5jzo0ALrBIUoEByz4VuiBQsIljw8tF2lk2+yvO9ZOgkec
	bdFOhEVbvUwaEv4lpm2tbU4erCVLhJkp3n6uE07heQ3jlZ0DjA57U7a3wrWlYDlHe5i/zaF9g7kIZ
	bXcH74Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXXj-00000002OqA-1ZwC;
	Fri, 19 Sep 2025 09:36:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXXg-00000002OnS-2iXi;
	Fri, 19 Sep 2025 09:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nP4fIhA2RKu4fTkXiqGyFZU2ycuLn8kRCo9WKKJ18zI=; b=KOw3ZPm240tko6PARM+0qPtabi
	fUc5cgskLloCJv0B5iM6rZ/Dis20nC0LHeRGYa2l1pzAs1tjcUs1YcuafKj5G7t2EXZdANs+dDvdV
	NHpG6xGJm/iEpwAJQynWSLDYtwurU5hqI3dAGBeWynNrm9xHk9TXFJwCb6Nhenkh0s59AES56+MF1
	W0Gwzegc1/fnsw6bjHhiRBbcy9gFSEWjN3LG52vKkred0E1YmlwfHK/fhMwzoSDUVyTTv3yQCcfAy
	78WwSRnwzdOD1+YNHbTsnNPODxvb52U3zQgqk2LgVdOCzDiXEJnXIKWUswLCEkJwX+sFrT0vTEMlf
	VtH7Mwdg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXXc-00000007oIu-10aE;
	Fri, 19 Sep 2025 09:36:35 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxVNAYJM1opC0MAA--.25982S3;
	Fri, 19 Sep 2025 17:36:24 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMEPJM1oMmufAA--.61162S4;
	Fri, 19 Sep 2025 17:36:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] arm64: Only link libstub to final vmlinux
Date: Fri, 19 Sep 2025 17:36:14 +0800
Message-ID: <20250919093615.30235-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250919093615.30235-1-yangtiezhu@loongson.cn>
References: <20250919093615.30235-1-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJDxbMEPJM1oMmufAA--.61162S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZrW8GryUWw17Ar45tF4fWFX_yoW8Jw4rpw
	s0kF4qkr4qgrW8Xa4rKa17Xw1Ykws8XrsIgFykZry5tw45Z3s7Wr15GFWSkF4kXr18Jayf
	Gw1ayFy8CF4DG3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_103633_019703_7D55DD22 
X-CRM114-Status: UNSURE (   7.74  )
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

Since the efistub functions are useless for stack unwinder, they can be
ignored by objtool. No need to link libstub to the vmlinux.o, only link
libstub to the final vmlinux. Otherwise, there may be objtool warnings
when arm64 supports objtool, this is to make consistent with the other
archs that use libstub.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/arm64/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..038f37ef2143 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -156,7 +156,10 @@ KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 
 libs-y		:= arch/arm64/lib/ $(libs-y)
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 # Default target when executing plain make
 boot		:= arch/arm64/boot
-- 
2.42.0


