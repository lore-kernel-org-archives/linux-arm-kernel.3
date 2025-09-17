Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8EECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LO/+QE3ihX8bOdjPKLy/xVii6Go02cyBndt/zKNIzc=; b=2IbSxvjhSZo7+MbjU6Y3T9ZEVT
	ZWXLyBYZqICJO/7YE9cta+8Y6IgbqXcoNDJx6EJgYYNuYmVvj8qbMN1fUZ60Qg/p39xYQrp/h5f1U
	fggyCbcTCefI5uT0C44qa7FrMl3spb3NYm2d0sBVkgjTSCBHLIr2sOPjkno+wkWge2ESkB6ze4gqb
	2gx6sPgoFWoQ0NJogCRdLSh6hs80thAeqwVERcTSiLvPsCMmQ4sD7FC9/jZG8UN/6CnONxRj8rtHy
	CwwI2qmjerhYBGmkQ06TN4lSujhnF7nCBVit06+BP2eqguk5XO7zJnpuFdp2jl3J8QsF6N8Yb9y+D
	OXFYagMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysfL-0000000Bv8Y-3Cfm;
	Wed, 17 Sep 2025 13:57:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysfJ-0000000Bv7q-3lDi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:57:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D0DC2659;
	Wed, 17 Sep 2025 06:57:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 892213F673;
	Wed, 17 Sep 2025 06:57:42 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:57:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aMq-VKIo-tYoGRSz@J2N7QTR9R3>
References: <20250917110838.917281-1-yeoreum.yun@arm.com>
 <20250917110838.917281-6-yeoreum.yun@arm.com>
 <aMqx67lZZEgYW-x5@J2N7QTR9R3>
 <aMq5DbqsXj6vP7Xe@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMq5DbqsXj6vP7Xe@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_065745_975275_42944BC5 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, Sep 17, 2025 at 02:35:09PM +0100, Yeoreum Yun wrote:
> Hi Mark,

Hi Levi,

Please can you keep the relevant reply headers (i.e. the bit that says
"On ${DATE} ${PERSON} wrote:")? You kept yours from your first reply,
but dropped mine from the reply you're replying to, which is a bit
awkward for anyone following the thread.

> > Aside from the retry issue, I *think* you can simplify this to something
> > like:
> >
> > static __always_inline int
> > __lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > {
> > 	uaddr64 = (u64 __user *)PTR_ALIGN_DOWN(uaddr, sizeof(u64));
> > 	u64 oval64, nval64, orig64;
> >
> > 	if (get_user(oval64, uaddr64)
> > 		return -EFAULT;
> >
> > 	if (IS_ALIGNED(addr, sizeof(u64)) == IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))  {

Note: typo here, this should be 'uaddr', not 'addr'. Importantly it is
*NOT* 'uaddr64'

> > 		FIELD_MODIFY(GENMASK_U64(31, 0), &oval64, oldval);
> > 		FIELD_MODIFY(GENMASK_U64(31, 0), &nval64, newval);
> > 	} else {
> > 		FIELD_MODIFY(GENMASK_U64(63, 32), &oval64, oldval);
> > 		FIELD_MODIFY(GENMASK_U64(63, 32), &nval64, newval);
> > 	}
> > 	orig64 = oval64;
> >
> > 	if (__lsui_cmpxchg64(uaddr_al, &oval64, nval64))
> > 		return -EFAULT;
> >
> > 	if (oval64 != orig64)
> > 		return -EAGAIN;
> >
> > 	*oval = oldval;
> > 	return 0;
> > }
> 
> Hmm I think this wouldn'b cover the case below when big-endianess used.
> 
> struct {
>   u32 others 0x55667788;
>   u32 futex = 0x11223344;
> };
> 
> In this case, memory layout would be:
> 
>   55 66 77 88 11 22 33 44
> 
> So, the value of fetched oval64 is 0x5566778811223344;

Ok, so the entire struct is aligned to 8 bytes, and the 'futex' field is
4 bytes after that (and not itself aligned to 8 bytes). In that case:

	IS_ALIGNED(uaddr, sizeof(u64)) is false, becuase 'futex' is not
	aligned to 8 bytes.

	IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) is false, since this is
	big-endian.

... so the condition becomes:

	if (false == false)

... which is true, and hence we execute the first branch:

	FIELD_MODIFY(GENMASK_U64(31, 0), &oval64, oldval);
	FIELD_MODIFY(GENMASK_U64(31, 0), &nval64, newval);

> So, it should modify the GENMASK_U64(31, 0) fields.
> But, it tries to modify GENMASK_U64(63, 32) fields.

As above, I think the code does the right thing in this case, but the
typo didn't help -- sorry about that.

Mark.

