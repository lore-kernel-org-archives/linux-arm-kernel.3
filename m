Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE07C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wFbseEUGJend1TaLmGrK+0ohCzYitH2qdt2gxuoyHY=; b=IYNt4Mfv5Se0DpNlvhXoiqq8aW
	/pkGsy/GbaMuRGwQ58BsOSZbiw1mOkJVlEUaBd50eEi/vW6MJuRHGdLsY9fLcxRTM4CgUZRZVGS/A
	T5NZghesV19BWhHJtOBzRYIIc1WWzZ579omjTXuBoUBRzpTID9q1ce4Db9sARknOZNdKAqsZVVhiA
	IqSybRpissBfbG0kRZU4mNfq7JAYFUpH/oTzKa215Se6HMN1PXMHQos/WoMB5Ec2gx7duyWpp8dK0
	NAL/iVIBgPPt1Kt2Gujan/4ayJkvSzi5Qm+sz+n8ZNlArmCLz7o4oqKsiH6enGQweihKu0IhimMEX
	ToeGOYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmfD-0000000Gjx6-3AmH;
	Wed, 06 Aug 2025 22:31:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmae-0000000Giz2-2HLs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 22:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6706C5C633B;
	Wed,  6 Aug 2025 22:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4833DC4CEE7;
	Wed,  6 Aug 2025 22:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754519190;
	bh=ZJ7HumVN6I5XaP5hhr6y49q70vELwodDQDogr8c3WSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJg5WOQRcY+6y3jP7TFV5krVcpPQUzVJN3TdYJI9NA/TcZKBAXfaDCE9MN6w2hrwA
	 yNSG06C1N+3jJ64NTcWbcpwePFTVUkZVbWcLHSp9/dAck/pNY9UZ12mujYEgC1evnL
	 rMzijI2qQTTWX8UAXolc1I8BhylEzfqBCIJ5VskCm/F2KwhWt4uKRbXdToWx1m+SmA
	 IkxeBNqvCvCpeaIYitR/WYr2984AcLoFQb0PmBeG74f//vw+zmWutxkRWCv1D4g+oS
	 w8L0Au8SCD/f5qxA843GmFOuCFCZItB9LeMaqA4QlyccFA3ZNyeYtY2R2TafjKCYPO
	 MmKBcZe1C5Lwg==
Date: Wed, 6 Aug 2025 15:26:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 5.15.y] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
Message-ID: <20250806222624.GB1654483@ax162>
References: <20250728-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-e373a895b9c5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-e373a895b9c5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_152632_621495_6FE9CE2B 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, Jul 28, 2025 at 02:04:24PM -0700, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.
> 
> |  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
> |   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
> |        |                              ^~~~~
> 
> Disable this warning for sys_regs.o with an iron fist as it doesn't make
> sense to waste maintainer's time or potentially break builds by
> backporting large changelists from 6.2+.
> 
> This patch isn't needed for anything past 6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration").
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm64/kvm/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 989bb5dad2c8..109cca425d3e 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -25,3 +25,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
>  	 vgic/vgic-its.o vgic/vgic-debug.o
>  
>  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o
> +
> +# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
> +CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
> 
> ---
> base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
> change-id: 20250728-b4-stable-disable-uninit-ptr-warn-5-15-c0c9db3df206
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
> 

