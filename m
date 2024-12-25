Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC685E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRslhLEPtAMorBU7nJn0YFY7DN9gOft5QH4shR1qNYE=; b=FynB2cqC3I+pi17DLuZom+TtSf
	N6/HUgc0Md7v6uBU70zCYLY4Xhgyex4QR2gN4ZsbF2xFHPS7JGuKcEKAXPxLk6ezoK+ock8dN/C+8
	Y7NtBEckXQ4CsWEC6QyqsWRWvfDdlQbsKjybCqwPO+a0tGi2OvMckSfbwsbyRrL/MWaiS9Mthz76Y
	2jRWb83/LHXqXbt0iPKGBlex9QWXkFs8b49X07Q55aNJug7C8lq6+tNS98JArdWOLiPF4q3pO4aH9
	/Mqhj31PNOYXkLiYxBZzJralVTU8a2tev9afqn8RB7oOvUi57OTZsap2RhV2enIFd4NdyynYkAoA/
	ELp4ZXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQUFF-0000000E4CR-0ymw;
	Wed, 25 Dec 2024 16:28:25 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQUE2-0000000E45x-1YBb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 16:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CRslhLEPtAMorBU7nJn0YFY7DN9gOft5QH4shR1qNYE=; t=1735144030; x=1735748830; 
	b=Z+rg1zBwRioVJKv2Aefz3HAMSZTA8/LtplOZ1D2cs9DprIJ5+ueTe2S7j1qFC6DZaqmG9X9l5Xn
	Z/QzdEkRRsmZECQLIY2s8gSmQmf8J9R+YKyCybchkoq77m2y04Bz/6I66Toet7eUWx/AdH/aKUg3v
	k5zD8VCrxS00y7keKprc6MvcC8Ir2utQ0n6PiazF5HXOSfXH/YYJiX4jRTJ/LagUGSN50aJ1ie08A
	OFza/pJcvpDbVCZ2bWquAN2Na9nP/tCK/w0Ln/Fg1kK8gRjDaS4ICM/vQA+uwY6m7gENJiG1xHHCs
	6lmv80CkRFbBzfa1tsFmSLatjnBX97r2C7dQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tQUDv-00000000XYQ-1yRn; Wed, 25 Dec 2024 17:27:03 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tQUDv-00000001K9O-0vzn; Wed, 25 Dec 2024 17:27:03 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1tQUDu-0006ym-2S;
	Wed, 25 Dec 2024 17:27:02 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: masahiroy@kernel.org
Cc: gregkh@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	rusty@rustcorp.com.au,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
Date: Wed, 25 Dec 2024 17:26:56 +0100
Message-Id: <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.146.116
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_082710_563525_A624ECFF 
X-CRM114-Status: GOOD (  11.95  )
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

Hi Masahiro,

> The latest binutils stopped aligning section data in relocatable ELF.
> It saves small number of bytes that were previously inserted between
> sections. However, modpost crashes due to unaligned access:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=32435
>   https://sourceware.org/bugzilla/show_bug.cgi?id=32493
>
> Similar to kernel space, unaligned data access in userspace can be
> problematic on some architectures.
>
> Simple example on ARM:
>
>  $ CC=arm-linux-gnueabihf-gcc
>  $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - -c -o foo.o
>  $ echo 'int foo(int *p); int main(void) { char str[16] = "helloworld"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
>  $ ${CC} -static -o unalign-test main.o foo.o
>  $ qemu-armhf unalign-test
>  qemu: uncaught target signal 7 (Bus error) - core dumped
>  Bus error (core dumped)
>
> In this case, the 'ldrd' instruction causes a bus error due to an
> unaligned access. If the -O2 flag is omitted, this issue does not occur.
>
> To avoid potential unaligned access, use the get_unaligned() approach
> as seen in the kernel space.

I have just applied this series against Linus' tree and I can confirm that it fixes the
unalignment access anymore on sparc64. There is no more "Bus error" and the build succeeds.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Thanks,
Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

