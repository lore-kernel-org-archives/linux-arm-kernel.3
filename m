Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F4CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHf1CHOdwYLNhwEQbGC5NUmbYFvTsOZG8EKn4nQht/g=; b=pNMsNsH/4gClhDdAaotZXicJdd
	iTurRtp2/f5wLWBON64b2w0vvS2S0NS3OCt1dJ0A36mVDpA3Q7ci0CDJhSMJK1L9FHDHysCk9zmTm
	EtTGNXukN92JpWSySC1OmOW5APrjPlQhD9l8cXWa/7jAKcG+5I0vy953CZAL2W3kyzrDMr3rqF6ex
	6sJ3ChVUFGA3Zux1B66MCI5j51ClghDQbjp3/bHdwLcnqDlkoBKz4k0W5AfQwKFF8pLcC0bf1eoW9
	I7HTlHQp/SrmrB4j3+K7vo0jcO5Qbf3rCP5Xpl0YNpvMzQpXhDJycnLwQqlNpf9d0Nn2j+IefDiFo
	+IIP/a+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjNA-00000003wd1-2rwy;
	Thu, 11 Sep 2025 15:38:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjN9-00000003wcP-3Dmf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 183A660234;
	Thu, 11 Sep 2025 15:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077EBC4CEF0;
	Thu, 11 Sep 2025 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757605086;
	bh=6P7TRYNOF7lDU5UaN1FbR0F71Q85GTIwRzbYM8hTeno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGsOXkd+1Y4hHnazxMQbb6HbneQJPdyJzgI/ZuSK3L1vKkYOIydxBe6mZo1udgV6b
	 Xg2fAMNVaoqQdsW0Ox9CO92bmONWVPL9lPnFJxmklBs2inzz5uFMKybYHa/uovgY2G
	 KY6+L3Q6gthV+FHggk8D/dS0DDFX8DhEbwAmvUQ9+4Dr6wBdpZYepnTVkltz7xRSFX
	 drV8N5P5XVCQ8ZJFjVqXc//k2GxIwCuwvfy1mYHNAjRXHm3liCU9G1cBwOKUITojts
	 eDhSki1ZfzoKELpiWTAVGJlN2c584OVz5Vv7aUywy4wyGe8/Ui//CJWE1isC4UjisC
	 Sd8qCapieGd3Q==
Date: Thu, 11 Sep 2025 16:38:00 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMLs2LcnflSw2uNr@willie-the-truck>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-5-yeoreum.yun@arm.com>
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

On Sat, Aug 16, 2025 at 04:19:27PM +0100, Yeoreum Yun wrote:
> Refactor futex atomic operations using ll/sc method with
> clearing PSTATE.PAN to prepare to apply FEAT_LSUI on them.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex.h | 132 +++++++++++++++++++++------------
>  1 file changed, 84 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index bc06691d2062..ab7003cb4724 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -7,17 +7,21 @@
> 
>  #include <linux/futex.h>
>  #include <linux/uaccess.h>
> +#include <linux/stringify.h>
> 
>  #include <asm/errno.h>
> 
> -#define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> +#define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */
> 
> -#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
> -do {									\
> -	unsigned int loops = FUTEX_MAX_LOOPS;				\
> +#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
> +static __always_inline int						\
> +__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	unsigned int loops = LLSC_MAX_LOOPS;				\
> +	int ret, oldval, tmp;						\
>  									\
>  	uaccess_enable_privileged();					\
> -	asm volatile(							\
> +	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
>  "	prfm	pstl1strm, %2\n"					\
>  "1:	ldxr	%w1, %2\n"						\
>  	insn "\n"							\
> @@ -35,45 +39,103 @@ do {									\
>  	: "r" (oparg), "Ir" (-EAGAIN)					\
>  	: "memory");							\
>  	uaccess_disable_privileged();					\
> -} while (0)
> +									\
> +	if (!ret)							\
> +		*oval = oldval;						\

Why push the store to '*oval' down into here?

Will

