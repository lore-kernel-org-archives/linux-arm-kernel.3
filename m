Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A706ED1681C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0/tKhaS+MIKV7m/AnnuJpwD/Q3IpdNtjyCNuaY5rbI=; b=33m/iZWNCLwllymhQNFl9D3cLg
	5CzpDMTlRVq80miSWvZxknoTPdiKuXhequnsTlA2bEbbsfSI/cZIQUwB5YfE4zuhj5jnKjRnyzH09
	P3X6Yyy0EldfFqRdZXs5oUALCGDJhj6b3oW4bEVPCm/giGEZRJLr4MvHLnRgoiKCbYVtFNeoKtMeg
	d3iBYqzHegcLZIt4tqNcLjFkf9J0HuuFi3RznRJeJ4ensjz09XM/l2hhntpmSqdTytAbZSNiVdafD
	rZSdWzstP1qziMcF1u0BMpNX19VOXxt4L10ykhintIsv/r+HgwABGOwGX5MnvL7q4qzILmCPRVgub
	n/ko3Mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB1k-00000002GBF-0HP0;
	Fri, 09 Jan 2026 11:51:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB1i-00000002GAu-07GX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6972843568;
	Fri,  9 Jan 2026 11:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCB2C4CEF1;
	Fri,  9 Jan 2026 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767959493;
	bh=ZF5psk6yFH94rFgsM+J+g/s7m9yVpUAD93tVd64VudI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlXRbdxiCLYLhINDgWB8QtxU3O/iM9ITHxvEE2FTlKwFwsct/PlgZY5cITSJIzofK
	 pftKHfAviE7Psf3WQrFzy4/1vZKMvmZf9P64fFaTKB4ZlI06a3ylsu2/YFDSwwl65U
	 K4nm6pvIkcVlvEvX/46NQ3tfVES9dIx5TKWF350U1qCA2UdNSKRf1fBJfO/EoNC7E/
	 R3NEUxoEEb7tJO9C/Z+Sm2H2SmjGX6efFLjJizYRc7Iv+nxfckp80YPhI3egv/Kzav
	 +igDEg+IjJoI4B5b++HtW251mzHrfLIy7tnPO2WO2/7e3FGIMbZr3XT+5tdmb+xsFk
	 9J/po7aC1RYzQ==
Date: Fri, 9 Jan 2026 11:51:28 +0000
From: Will Deacon <will@kernel.org>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jianpeng Chang <jianpeng.chang.cn@windriver.com>, ardb@kernel.org,
	anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after
 pte_mkwrite_novma() change
Message-ID: <aWDrwIKamzVQxVOQ@willie-the-truck>
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
 <aVgUPNzXHHIBhh5A@arm.com>
 <87344ig974.fsf@DESKTOP-5N7EMDA>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87344ig974.fsf@DESKTOP-5N7EMDA>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_035134_115662_DC7069FD 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, Jan 06, 2026 at 09:30:23PM +0800, Huang, Ying wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> > index 161e8660eddd..113c257d19c4 100644
> > --- a/arch/arm64/include/asm/pgtable-prot.h
> > +++ b/arch/arm64/include/asm/pgtable-prot.h
> > @@ -50,11 +50,11 @@
> >
> >  #define _PAGE_DEFAULT		(_PROT_DEFAULT | PTE_ATTRINDX(MT_NORMAL))
> >
> > -#define _PAGE_KERNEL		(PROT_NORMAL)
> > -#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY)
> > -#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY)
> > -#define _PAGE_KERNEL_EXEC	(PROT_NORMAL & ~PTE_PXN)
> > -#define _PAGE_KERNEL_EXEC_CONT	((PROT_NORMAL & ~PTE_PXN) | PTE_CONT)
> > +#define _PAGE_KERNEL		(PROT_NORMAL | PTE_DIRTY)
> > +#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY | PTE_DIRTY)
> > +#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY | PTE_DIRTY)
> 
> IMHO, it appears not absolutely natural to make read-only kernel mapping
> dirty unconditionally.  However it should work.  I have no strong
> opinions here too.

So I think that's what we *used* to do and it's also what some other
architectures (notably, 32-bit ARM) continue to do. In which case, I
think I'd prefer to follow the tried-and-tested approach of marking all
kernel mappings as dirty unless there's a technical downside of doing
that.

Will

