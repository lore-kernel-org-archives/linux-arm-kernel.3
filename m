Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A010BA421
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x34Ij2kuXzsnJRKdh7n98HuULH2/zRsLD1v43nFDFY=; b=EZ1D1xvxHcMlyvSgRvEbZMsvyJ
	Nwzdp1URUyVA8EOz84/wkUQzp3iTlzt/zlEx5SsO2l+TICgyQvjaMr05BQ2kIBQhVHHO5mnRAHpMf
	O1Hvk6dMHcxsvdaaJ6y3I7dKuOiUDHQBecdJkUUn86zBrEFvdKJTfxEKPNGUyzVET+ZQHOfgYvJJk
	EjXFjfIL2sweFoEOhM/3r+yAbC7vfRzbS2bmimvvvN9rqu553htm4hkTP5twUrpxO5IlS80yFTsSK
	5P0LjqaAlYbe4wxwI1m6tr7JMbHZZSH1ZXQSuTWYquwk40R6hD1Hu3KcAnHadJxtsMuPpMq+1G5gl
	pp0NTb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xMo-00000006aJN-13hy;
	Fri, 27 Mar 2026 02:56:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xMl-00000006aJE-18Kd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 02:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B0DC60054;
	Fri, 27 Mar 2026 02:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62989C116C6;
	Fri, 27 Mar 2026 02:55:59 +0000 (UTC)
Message-ID: <b89ac970-7990-4a12-9769-82efc945c950@linux-m68k.org>
Date: Fri, 27 Mar 2026 12:55:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of
 align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-kernel@vger.kernel.org
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
 <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 25/3/26 02:56, Ilpo Järvinen wrote:
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
> 
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
> 
> Thus, remove the duplicated aligning from pcibios_align_resource().
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

LGTM.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> ---
>   arch/m68k/kernel/pcibios.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>   	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>   		start = (start + 0x3ff) & ~0x3ff;
>   
> -	start = (start + align - 1) & ~(align - 1);
> -
>   	return start;
>   }
>   


