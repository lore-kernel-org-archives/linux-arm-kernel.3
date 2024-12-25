Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C33E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRQGyjbHFKQGdGjHYzKoZ0lTgrJz1x1ILBtRyZrvoG4=; b=1S2Pl+vVPPSX0hL0G3nINMWp//
	ff7Ms56AmAs3Y3fz3TC7VfYwD0zQKuKACWiGGFKaMsw+YExjXalGYeFxBkjqPgo1Nkh9DzrInVs+d
	YqXlACj9T4eZ1FOU/Kvvg1iJSNXRGd8lCpmpSb/sscrH7hWBCfAjxnbYzmXyL2K6YJxPk3KXI+bLK
	zBTO81elyobMPcOdMQeTpQBCVbHX5hn0uRCiQGKMQIn0TFjrInHop2qasPZvkWvq10CU2zXybhu13
	FQl942rEUaX2qXY4JxUGRe+cBF5tFwao5MOwT2sg2+T1sF2h+I7qRzXAePzKUqZM0JV8gcDbpCHwr
	SY+dK7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTQi-0000000E0Rm-2rx0;
	Wed, 25 Dec 2024 15:36:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTOd-0000000E078-1SGY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 15:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81CD55C5E0B;
	Wed, 25 Dec 2024 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA09C4CECD;
	Wed, 25 Dec 2024 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140841;
	bh=Ao36kfaICvtlGMKfD3v9McRrnvkZ7RA45IErO0CVbXg=;
	h=From:To:Cc:Subject:Date:From;
	b=p7IZboEwypNCawtsbtf6nA2Ygh7JbZtFcbH3krBIUqOF4PaDLWBQvBnPs0RnQ9NQB
	 V06Bn6+yz8G5AXaTKve2HlErDQzeUaenn5o73pkhN0PwNYNqcDvMGHVm4tp7trO9Cf
	 xU79mrWwS0pkiV5TKCjzrR8H+tnSmWjE3mpwy+ac9c2BDrI786n7plgzN7ZDwiRtXx
	 us5Agwn5WwGCn95M2Nkt6C5jOF0fxnt9xczJZlyO5CMhAa8GjDpxlZarJxDZcM96na
	 PywwD4TaaTaCpTPuydmX4pM5a2UN6dQykDokAVyN02PtIhM4TGSzj7f6zauXorKELD
	 aQ6uJlzxXdL8A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 0/3] modpost: work around unaligned data access
Date: Thu, 26 Dec 2024 00:33:34 +0900
Message-ID: <20241225153343.134590-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_073403_430082_707EF921 
X-CRM114-Status: UNSURE (   9.02  )
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

The latest binutils stopped aligning section data in relocatable ELF.
It saves small number of bytes that were previously inserted between
sections. However, modpost crashes due to unaligned access:
  https://sourceware.org/bugzilla/show_bug.cgi?id=32435
  https://sourceware.org/bugzilla/show_bug.cgi?id=32493

Similar to kernel space, unaligned data access in userspace can be
problematic on some architectures.

Simple example on ARM:

 $ CC=arm-linux-gnueabihf-gcc
 $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - -c -o foo.o
 $ echo 'int foo(int *p); int main(void) { char str[16] = "helloworld"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
 $ ${CC} -static -o unalign-test main.o foo.o
 $ qemu-armhf unalign-test
 qemu: uncaught target signal 7 (Bus error) - core dumped
 Bus error (core dumped)

In this case, the 'ldrd' instruction causes a bus error due to an
unaligned access. If the -O2 flag is omitted, this issue does not occur.

To avoid potential unaligned access, use the get_unaligned() approach
as seen in the kernel space.



Masahiro Yamada (3):
  modpost: fix the missed iteration for the max bit in do_input()
  modpost: refactor do_vmbus_entry()
  modpost: work around unaligned data access error

 scripts/mod/file2alias.c | 36 +++++++++++++++++-------------------
 scripts/mod/modpost.c    | 24 ++++++++++++------------
 scripts/mod/modpost.h    | 14 ++++++++++++++
 3 files changed, 43 insertions(+), 31 deletions(-)

-- 
2.43.0


