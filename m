Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9CD0D16E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9FvMPHUqKvtHDYxdf8Thb1/AY4EZhT/PAo+dwG1D20=; b=3eI00ZpJ4Qdqh+ZJrEy+AQPmnx
	6SU5+mqtxSw93xYJDU400lZWFaMULgDbT0SU1i77/evTdvuDA7V1KEh/gNgZPoQTvbcbAXM8ZByfk
	idWdKy/0GEQzDUYPGNx/Y6mm4r12GCBFNOQWz3MSDgD4vczyErrvyn5PlFO3Cvndt62Be0Gp8iXv9
	xQiTyu2SbYC6xI1Vx8Oy9YYGQh7MRSspm0GPZBIxvIvohnxCxd1clL0hOnCQ4eIoREQ027PUt9LmH
	yMejoHcV/acbQR4v5/sV+gvhAhhn31+4siGm/PqT8LgGncXdOA+aZJaR0ALXpB3TZcvmMoWUlegqF
	YycJf+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZL4-0000000FYJ9-2if5;
	Wed, 07 Jan 2026 19:37:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZL1-0000000FYIe-1LAN;
	Wed, 07 Jan 2026 19:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 687C6441ED;
	Wed,  7 Jan 2026 19:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0753C19422;
	Wed,  7 Jan 2026 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767814618;
	bh=wGXfb/h9dHEqo4OYJ7lobK5I8Wv+t9L3leil/n6O8Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgJxdSAeZ/7+lfhqGZ9rBlTXNIozisFIcAkxXqUcopcqhT47BBzZNAXGHXN2S1cuz
	 sE3S/4D8e2LgW/CFYURXyeLn59O+LRgHFLBPpDv+3F5osve2zP01H3o5Q1WQsnXmQw
	 djJgIz4O/wMvzdiDAuqVNLsW2SkI8XFnTtMPhuCo=
Date: Wed, 7 Jan 2026 20:36:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org,
	neil.armstrong@linaro.org, palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
Message-ID: <2026010704-heaviness-quality-f543@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_113700_453704_44F84416 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed, Jan 07, 2026 at 04:28:28PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Move the IPC shared-memory hypercall ID from architecture-specific
> headers into include/linux/bao.h.

That says _what_ you did, but not why you did it :(

I have no idea why this is needed at all, sorry.

> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  arch/arm/include/asm/bao.h           | 5 ++---
>  arch/arm64/include/asm/bao.h         | 5 ++---
>  arch/riscv/include/asm/bao.h         | 7 +++----
>  drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
>  include/linux/bao.h                  | 3 +++
>  5 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
> index 5ece9ecb1455..7d13591fe669 100644
> --- a/arch/arm/include/asm/bao.h
> +++ b/arch/arm/include/asm/bao.h
> @@ -16,14 +16,13 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/bao.h>
>  
> -static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
> -						   unsigned long ipcshmem_id)
> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)

This does not match what you said you were doing in the changelog :(


