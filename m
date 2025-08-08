Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA81C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5zH1D2kwmr8dCpgiqzWF8oQlWdm8uTmQJ1ar/ni0uw=; b=tBM/96CL1zB6xUoGgt2vEvBZ+D
	xSajOYrMgopLR3V0+QuGGXvRxqq8YJ2YvbaOWpka1wkPLfk4CGyoo1i4l1U2jpmu7YpIKSc22rO+H
	o+1Wc9K8SO/1fN9/GK9GsEgkpm17NBTEFFxJnLYhAI6eH8+2kUND1H4vYhCKJ0Z7MmPv+ljafWNMK
	T3jsZAUgPxkSQ9NVA3jqGPYt7QuRaIohqz+dVlDDhuc4ow6wTqGgVDuKq8V4oog5r+E/InQ5GZz4m
	HUABD3hmEiOX20TQfJDahFKmEMde27dQ863cUgEIt1jvEs3BP/l5eLnzuvhWbRwTlao2FQSp/y8ql
	hx6oeSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRL4-00000003RH3-33mZ;
	Fri, 08 Aug 2025 17:57:10 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRG0-00000003Qtd-38eH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 17:51:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754675511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5zH1D2kwmr8dCpgiqzWF8oQlWdm8uTmQJ1ar/ni0uw=;
	b=mAxBhCKD4LlUW0eBh/lYzJwUYhgNl3NagukLegOF6BYXBQtSdnjbLzFbp6ITTxiq+WbUtC
	pyCXzfyapFoD8+jgxbvb7FCWav6HpBU5WkpYT61y0s6TaM8KixWl7TxUCpftElM5l0QzIZ
	wfFopWdSOyLpS840FuoMTP+dmyKJ6Fo=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kvm: arm64: use BUG() instead of BUG_ON(1)
Date: Fri,  8 Aug 2025 10:51:32 -0700
Message-Id: <175467548061.670500.14517325210508247749.b4-ty@linux.dev>
In-Reply-To: <20250807072132.4170088-1-arnd@kernel.org>
References: <20250807072132.4170088-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_105157_711646_B195094D 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, 07 Aug 2025 09:21:28 +0200, Arnd Bergmann wrote:
> The BUG_ON() macro adds a little bit of complexity over BUG(), and in
> some cases this ends up confusing the compiler's control flow analysis
> in a way that results in a warning. This one now shows up with clang-21:
> 
> arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: error: variable 'len' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1094 |                 BUG_ON(1);
> 
> [...]

Applied to fixes, thanks!

[1/1] kvm: arm64: use BUG() instead of BUG_ON(1)
      https://git.kernel.org/kvmarm/kvmarm/c/700d6868fee2

--
Best,
Oliver

