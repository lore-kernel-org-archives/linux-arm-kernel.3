Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo5MLvSZkHW64U5g6JRb+TrPrqv+7F35qBXJoN4jrZ8=; b=TBKoXCOdVnbfKsgKLMN6IBAVFW
	cijEBvYO03rIcAfDHNba1QpQ75FVmKzfpCI2hADe82AqvPK/rPD06rKulZsSeQs9Vqg+7mjAbQfws
	CpVxRCtuswLRJBqUl9Qvqoi1fQtOWAHfEY7Mu/Oy2xLpigT9CXQ9ut3UfMosGi+60J6vCtULCpC+1
	mUlaOaFz+RZfvq2IUv5uoRSkqCh7rkpG4Vu3u4I3JaLrj0naVk/Z7MdkaumgZ9Kd3v/ngKBSGl5x5
	/c/KJ/6GrAcd9AaL+z+y63pu9s+dZbJeCazMlxkQCeA2qt6BmzWIpH7qAzQn8AoDjZS9alKzwWPnB
	dsZHjCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPSL-00000003BkV-0CUR;
	Mon, 14 Jul 2025 20:07:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPPu-00000003BbR-08Ls
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 20:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC89844069;
	Mon, 14 Jul 2025 20:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE85C4CEED;
	Mon, 14 Jul 2025 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752523488;
	bh=xd/xfYOEUPPLbpxh3voDncT+zjKQzDRxMcauig6LqSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4U4Xl96FI2EXcfOd225VoOy4zz2pnnK+h9491TSV+5rOSj1Lubf+m/Jgg/nScmEA
	 tdMt/pVJbU8LpLBm4q8b2qc3Ae3khgKFZTDt+TsRCayPDXmpNw+PftSK/4v9hyBSDD
	 9IiVW1Zi53GhqH0n56csK8bgs5dGOt1bkAr5U+V+qAEUf/v2x/m02COYu9vWnOfoGK
	 tbg54ZQkafgLxLIFaCQXZH6SaLvI+SiPyyzi5Ud2MSZ1JvyNTrvc6nU/jOAoyfMCQU
	 PjoPcjqVWkz+goSPVG2TnvRWR/jTekwUAA7wmaKHOvDCPCq3KBEaMxFRINXs+w63eo
	 h68qY/lwqcf5Q==
From: Miguel Ojeda <ojeda@kernel.org>
To: haiyan.liu@unisoc.com
Cc: Ping.Zhou1@unisoc.com,
	Ziwei.Dai@unisoc.com,
	lina.yang@unisoc.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	shuang.wang@unisoc.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
Date: Mon, 14 Jul 2025 22:04:30 +0200
Message-ID: <20250714200431.1917584-1-ojeda@kernel.org>
In-Reply-To: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_130450_093173_5CBA154C 
X-CRM114-Status: UNSURE (   9.96  )
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

On Mon, 14 Jul 2025 03:12:33 +0000 "刘海燕 (Haiyan Liu)" <haiyan.liu@unisoc.com> wrote:
>
> After I delete the rust build flags, the asan.module_ctor binary is right and kasan feature works fine.Could you help check why KBUILD_RUSTFLAGS impacts kernel complication with kasan feature enabled and how can this issue fixed?

I assume Rust is enabled in that kernel, right? Or do you mean that somehow removing those lines from the `Makefile` makes the issue go away even if Rust is not enabled?

Could you please share your kernel commit and the full configuration? From a quick build arm64 KASAN in v6.12.38, I see the `paciasp`/`autiasp` pair in one of the Rust object files:

    0000000000000000 <asan.module_ctor>:
           0: d503233f     	paciasp
           4: f81f0ffe     	str	x30, [sp, #-0x10]!
           8: 90000000     	adrp	x0, 0x0 <asan.module_ctor>
           c: 91000000     	add	x0, x0, #0x0
          10: 52800601     	mov	w1, #0x30               // =48
          14: 94000000     	bl	0x14 <asan.module_ctor+0x14>
          18: f84107fe     	ldr	x30, [sp], #0x10
          1c: d50323bf     	autiasp
          20: d65f03c0     	ret

But I am definitely not an expert at all in this, so Cc'ing KASAN and Android maintainers: https://lore.kernel.org/rust-for-linux/4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com/

Cheers,
Miguel

