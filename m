Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42CF103E2EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9Os4cgNh5i6cWimFgT9mmwNd3gOQ8i7NcYfdN809vU=; b=aQi+hu8IVe+RN/QtX6Y3N2UjLI
	7ezmBbuNNUBabTePlmwMcP4idF/YJJ1bI/8saotG0ithrG5DPKxfiBjCDdyusLeWzEhYOpku82+Ou
	gwbGVz52VkcwsFrofuQsQTgYzAmlfhzR2COvJnLzTxdpKUBWqpx/nmu9RS9KpwQbPWCobpw/qA8gX
	RTbqaHkVIZKZOVr5gpUmhpR6+f2IDUMkqm838jahR8/+xwB6ml4IjR2ND9ItTa/RLnGQePVYMAnMG
	++VHt3Isg8aAGsBBCQOWDR9lJ70WPhzlOUniD4UOVPAiThJsUfYr7kLaAB9zgIn5B47qxr/XRYInZ
	Kj27bjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gCJ-0000000E8bt-496x;
	Thu, 12 Mar 2026 13:35:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gCH-0000000E8bX-1AZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:35:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439b9b1900bso697292f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773322527; x=1773927327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9Os4cgNh5i6cWimFgT9mmwNd3gOQ8i7NcYfdN809vU=;
        b=pz7egw46S2IrFdrTY4g5dApbVe5bBPMpoaivczLLF/Gl8O80AUXKGcK/oOIQtmhf8z
         j398IvzVd0U7E3nj0PF+W9Om5/pIeA5Llt8bV9Q+S0NMHoBEi6JtYLyXHKZhu7hyDNBz
         z9/6IwPNEyRsqeUxRkxRyktMPst/k1HFLwfeiX/oLhtlfgipKPNHP63X8ZCPUhrjUZoy
         7BQz7zRxW/vJzVvYK8+beLotgdQMPgzyM+0JD1wH6ntyt5K9K7Qdtqgkoy5cuuBk/LBo
         4Ai/uBgZmgjUvGLD2eC6l1+7sW/VvCb+pUamAzX8hrxyuVtCPsQDPUmEhV/7tfYozLmE
         8c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322527; x=1773927327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9Os4cgNh5i6cWimFgT9mmwNd3gOQ8i7NcYfdN809vU=;
        b=pWsGW2d3aHZnrWC6fNkQtlovMfIr/Jt4nPcoM0wQ3en1DmaFTKsfa7FOCviGG4dcpY
         2FmN1l/M84Ia5VH6VdPfGRYiliGMeOlXuVEdxvYV+nmxBRg6wVq0OjKgcLZjTxRzGWev
         81bpfNldTx87GM3AnslEuqBAcRLXzXidQKUeVtbmQweb81j1fn01NvZctnnTgzDYBpws
         vtYoZ++39QeJsG88OLIFEnl6MBU1JDKJN+FlNz4dNmg1B9wyY0pmnRb8MUV8JDKpEZZC
         fhzPJJiBH0syCeWOU8VPIRhkPlUwBpaoMMo8YQgRQMV0pnTQkt2G1aV1CxmkC2I90aBT
         Ewfw==
X-Forwarded-Encrypted: i=1; AJvYcCWV4frdyJOUf4xmOxdYYCwjdvv4q/g7DKgI8N/qn5mcrM96bX+1dPkgZFAX/HOTf3tEdgiWFmAeEfEPQMBXs0hf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2a8pLygbwcwJ/tGbL9yH0DLZE45G1AMuQVVgB2hR8Tp9nSErh
	kR9UYlAhvWQf0WcZ8tD+n7CQsU1OlXrvVLhLMfSk5rXGu0eR4mOfln5LCAllnLf72A==
X-Gm-Gg: ATEYQzzgAuuk162zAlLxOBzkwsVp2jLDIcVufcJF24+PBUctEw6QqpRb79lioWoBWql
	sien8zi16GG9PkPYTH+oPWNIBKwkSz1VY3+YnLOe5aEuM7vtMXAX4RFDW8vrWP8F/m2JMtTbn4A
	DSShQHj4h84uryV9IfE5F5ftmiL57te4NVfSceWOSGjmtW5wUIV4Jv6IWW579/As50MpOKC3cDV
	4R/X9IpN9RHWWPuBq1fGGGI4/QFwRbb/eYgAABdXUSmHCFbgFy2F0P1eZGPi5e1Sx8/9/kfEbQC
	Vi1dEQXo/TzQErABR3RoqPrASyn2iWxrpDSUIwRakLwdDioO8wzLH+E6upPXMBazbD099yYXg3K
	jLOpzM0Z8xm6Qg5QszFZ3qCxsF/3gH3TpLx4RZlkdPb6Eiy3Ip9dm4pPOLS+f0ToX+iDEOVF3/z
	lDeydHfA06vrE3KqVwFO+6gP4jwd9qeaRjjrxgAwFEQ+osRwrBrzRLswbFOUtVN+mz1r0=
X-Received: by 2002:a05:6000:2c04:b0:439:bfaa:ed99 with SMTP id ffacd0b85a97d-439f822309emr12897737f8f.44.1773322526701;
        Thu, 12 Mar 2026 06:35:26 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acc6sm8523527f8f.8.2026.03.12.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:35:26 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:35:22 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: arm64: fix include path for ring buffer
 implementation
Message-ID: <abLBGqgPkwYVYMa7@google.com>
References: <20260312123601.625063-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312123601.625063-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_063529_369766_1DAFC975 
X-CRM114-Status: GOOD (  21.26  )
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

On Thu, Mar 12, 2026 at 01:35:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The simple_ring_buffer.c file is in the source tree rather than
> generated at build time, so the include path is wrong when using
> separate object trees:
> 
> arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
>    16 | #include "simple_ring_buffer.c"
> 
> Include it from the source tree instead.
> 
> Fixes: 680a04c333fa ("KVM: arm64: Add tracing capability for the nVHE/pKVM hyp")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I believe Marc has taken a fix already for that one

https://lore.kernel.org/all/20260311164956.1424119-1-vdonnefort@google.com/

> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index 143d55ec7298..3d33fbefdfc1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -33,7 +33,7 @@ hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
>  hyp-obj-y += $(lib-objs)
>  
>  # Path to simple_ring_buffer.c
> -CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
> +CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
>  
>  ##
>  ## Build rules for compiling nVHE hyp code
> -- 
> 2.39.5
> 

