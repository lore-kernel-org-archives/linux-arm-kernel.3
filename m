Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF0FC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtE4Ffj2sOQDLMNirE1V0XAHKtAHOYS1QiMsPe57FSo=; b=1eqBpQ5rmnTl/QZMW//niHxXMW
	d2+zywvezjfzIar+IieJgn09Ud/3AH5cSBttdN+MixGbEoJzED/cDE4nXppnPs3M5p7/rUU1Td1+g
	/2WzHKtKVYu3JfxoHa6MTC6hmSkpvQPIkIHBUFGnHdw5etBVwFAJPJEKfN4E3ZN085I+mp53AmG2x
	q8cdOzseS5IGSnluXcoQNMjJnpEDMRFJj2D4iIx8ZW5pTzL8vZ6TyP4L8qqVkoXGOhRgOmD6QqlP9
	20UW6kPHq2nrQGUFs873v9ra4gwuPYIVm0Hy42L46AdBQIeY5QaL+W7dbo3299swt5fQtszsivgQG
	b55ItGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPgp-00000008dHO-3Smu;
	Fri, 07 Aug 2026 18:53:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPgo-00000008dGx-1Ay4;
	Fri, 07 Aug 2026 18:53:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5434260A69;
	Fri,  7 Aug 2026 18:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451691F000E9;
	Fri,  7 Aug 2026 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786128785;
	bh=RtE4Ffj2sOQDLMNirE1V0XAHKtAHOYS1QiMsPe57FSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbALYNT+65gDDX5gHgWsLacTJ3iLwSX1KuPae5lUA/6j25rlkXHVMtIeUcwIvPoUa
	 Or2R+UQQFx2Zf5gWebXY88/gXpM7sfp4RX9dVbKRhqzQoHoDAPAfdKMjuw1t5UUKB5
	 X7BSqhWJYbMome6B53o0mTBljlMNShzz4Rqw0qTStnA9qPiO6iS5KBfrNBZ2eY1Yp6
	 8vTjmqsvR/+cERCADuo4u09npFPVb94Y67sgnFd77ZGEP6A2HW/nEhBY3OMgvUSlW4
	 0VzIh2ilfAe7pWcjHyt4GpvWFIY8n31X1yeC41nOimDcrY08NOKSbI+c2t2zuvP9vh
	 y4mAi+asSxxOw==
Date: Fri, 7 Aug 2026 11:52:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
	stable@vger.kernel.org, Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <20260807185259.GA941196@ax162>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
 <amHYO1c-5vzqSekt@buffalo-ssd>
 <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
 <amWfjDyn0jrnIf63@buffalo-ssd>
 <c4e9a566-baf7-4df6-b874-30c68a5c67f6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4e9a566-baf7-4df6-b874-30c68a5c67f6@app.fastmail.com>
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

On Sun, Jul 26, 2026 at 10:00:35PM +0200, Arnd Bergmann wrote:
> Working around it in the kernel is fine, but I'd prefer to wait for
> the fix to first get merged into llvm so we can reference the
> bugfix in the kernel commit.

This is now fixed in LLVM main:

  https://github.com/llvm/llvm-project/commit/261c025a03732ac6d3a26ad80e962481237de052

> A trivial workaround would be to have a dependency in
> CONFIG_THUMB2_KERNEL for !AS_IS_LLVM||CLANG_VERSION>=24
> (or whatever version), though fixing the .S code in all known
> instances is probably better if we want to ever have a chance
> to require IAS on all architectures.

I guess it is a question of how much maintenance will keeping up the .S
code take over time. Presumably this issue is not too common if we are
just now discovering it but maybe that is because CONFIG_THUMB2_KERNEL
is not too common? Is there a way to flag this at compile time? I don't
really have a strong opinion.

-- 
Cheers,
Nathan

