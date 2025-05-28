Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B29C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0Y5hc+X9nPQaSJgEJNqJOcELOizeNXg2yM/DLrKa60=; b=tKfmT8dpPqFqX7zfTKHVDnBE16
	PU50ImrJNsui174xZhrYNfyUHwVNtDjcnSyx5hi7e8oQ4z0IsEUlM1pDMAvhKpUVg5nXXKOUmrJsr
	lEzDShaIK5U3ZG9WtV2a7H1zVGDbc0nxOpmxjg9gHUS6pf8Mo0UXuYg+LZX/crPA+PomhbP7OZZm0
	Y1QRsVmvZDopb3Bgkb+r03MPCe0Y9lCakytFgtQyNdfFZMK5h2lmCnHsxUFMM03tkR4eZ0yUiOo73
	aKcCFYdf3B2NoWgp8sdx6IBmtr1qgsHVn3L28fd2ZXcPWcZUtZBRCJfRbRhe6TKUcNDxRpE8oYCac
	0B3WbmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGhK-0000000DE82-27Tx;
	Wed, 28 May 2025 13:19:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGf9-0000000DDin-2NPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:17:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6qmV1qghz6M4Mc;
	Wed, 28 May 2025 21:17:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DCE7114034D;
	Wed, 28 May 2025 21:17:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 15:17:31 +0200
Date: Wed, 28 May 2025 14:17:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland
	<mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 19/26] arm64: Add support for GICv5 GSB barriers
Message-ID: <20250528141730.0000232e@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_061743_894983_4C03EA50 
X-CRM114-Status: GOOD (  15.46  )
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

On Tue, 13 May 2025 19:48:12 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> The GICv5 architecture introduces two barriers instructions
> (GSB SYS, GSB ACK) that are used to manage interrupt effects.
> 
> Rework macro used to emit the SB barrier instruction and implement
> the GSB barriers on top of it.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/barrier.h |  3 +++
>  arch/arm64/include/asm/sysreg.h  | 10 +++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 1ca947d5c93963d33fe8fb02d6037fc71bd9fd7a..f5801b0ba9e9e7e0433f16ffedf0ec7dfb3e358e 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -44,6 +44,9 @@
>  						 SB_BARRIER_INSN"nop\n",	\
>  						 ARM64_HAS_SB))
>  
> +#define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
> +#define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
> +
>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>  #define pmr_sync()						\
>  	do {							\
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 2639d3633073de10f5040a7efff059021f847530..e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -112,10 +112,14 @@
>  /* Register-based PAN access, for save/restore purposes */
>  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
>  
> -#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
> -	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
> +#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)		\
> +	__emit_inst(0xd5000000				|	\
> +	sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
> +	((Rt) & 0x1f))

Perhaps indent as something like the following for readbility?
#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
	__emit_inst(0xd5000000 |					\
		    sys_insn((op0), (op1), (CRn), (CRm), (op2)) |	\
		    ((Rt) & 0x1f))


>  
> -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
> +#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> +#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> +#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
>  
>  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
>  #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
> 


