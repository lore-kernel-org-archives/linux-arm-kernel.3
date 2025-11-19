Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DBFCF257F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7H2k0aKmN2ZzNIrgufGeZlIPYqmXD2WdErN1vAqfHU=; b=o/4ICd6AnLw7Jr06MxAo4PR3DD
	nqSa9K1yIvAdS67YDhhbRmxO4vGbiiqlSt4Fywg/aowvYUCJaLFrfFjVpJQFFJVnXImWJaNv7Whaa
	s0wg18H7JvHi1fvo6XdnypNrbc0HaITRzSDcQcY0JIVeuw2nBjQlW27NFqY5EWjaySiQrbNC7mKVe
	rnS+PSseEh4FF/ZlOjYYmslfrBO/2SNYhThtQlFOvdKNSnBw5wVRKc3UpQjFZXVh1+kMcKRVDbP9b
	LFWRaD9q3qcINXGuiMlhbmEpb/5V2NEQ9rKIs835BiNfPEKjYv4p5iBVSWzkfmpZL5JIWsbygsw+V
	+t8rmrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZnN-00000001kEM-223g;
	Wed, 19 Nov 2025 04:27:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZnL-00000001kBS-2nwb;
	Wed, 19 Nov 2025 04:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=L7H2k0aKmN2ZzNIrgufGeZlIPYqmXD2WdErN1vAqfHU=; b=h9jxeLg56TosYZha7G2LQLpSUg
	03sgY9DVXawHmdTWjXj2cT20MzqXB41qsNC3AcgUv9BLRPdAyRNRQ4eDkZWrPwxbSzrlNM/XZn9e1
	sSYKhFIOS/6JpIccSLq/pUblnYtVQn39p8ZioORRgXgQtx57GSurQscwsVaC1/b8oupQqWLcD64h7
	zyVANBavXknBWZe/xNFa1wvFzv/d043/cZd4uS8Fd3HknwqyDdiPbIrG1UH0NPTq8cair0zFYxQzf
	SPmyloCcDjI8irxWUY2KNJwuchqH5W75ew747ZpRdHa5q+sTEhyvqVEzELf8lQMjL8NaLtNapMA/w
	p0Dw3ovg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZnA-0000000GWE9-42mK;
	Wed, 19 Nov 2025 04:27:44 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3tIwRx1p4lclAA--.14768S3;
	Wed, 19 Nov 2025 12:27:28 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxG8EsRx1pchQ4AQ--.53944S2;
	Wed, 19 Nov 2025 12:27:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Date: Wed, 19 Nov 2025 12:27:08 +0800
Message-ID: <20251119042708.27658-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJCxG8EsRx1pchQ4AQ--.53944S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1fWr1rGry8GFWxGFyrKrX_yoW8Zr1rpa
	90kw42939rX3yvq397CrW0qw45tFZ8ZrWrWFWDJan8CryDXr4I9rZ2kr43AryDuFyDAF45
	WF1xAFyakFyDu3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042741_602582_DF143B28 
X-CRM114-Status: UNSURE (   9.65  )
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

In order to only link libstub to the final vmlinux, it can not use the
current KBUILD_VMLINUX_LIBS, just add KBUILD_VMLINUX_LIBS_PRELINK. This
is preparation for later patch, no functionality change.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
There is a long discussion in the previous patch:
https://lore.kernel.org/lkml/20250928085506.4471-1-yangtiezhu@loongson.cn/

This version is based on 6.18-rc6, split the generic parts out
into a separate patch to avoid merge conflicts, the other parts
will send out after the merge window.

 Makefile                | 1 +
 scripts/link-vmlinux.sh | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d763c2c75cdb..69485f47b794 100644
--- a/Makefile
+++ b/Makefile
@@ -1199,6 +1199,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
 export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_LIBS_PRELINK
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 433849ff7529..e72d3254b93f 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -61,12 +61,11 @@ vmlinux_link()
 	shift
 
 	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
-		# Use vmlinux.o instead of performing the slow LTO link again.
 		objs=vmlinux.o
-		libs=
+		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
 	else
 		objs=vmlinux.a
-		libs="${KBUILD_VMLINUX_LIBS}"
+		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
 	fi
 
 	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
-- 
2.42.0


