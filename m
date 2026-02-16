Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AE0E7BDA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL5XEMjMNsFkXFlY9NTu9usJ19PbBsQNnJQz5f1u1SU=; b=KCd17cWic6GeLTr6j+VhRQUOu/
	yD3cReNnbpKuSDFuwwXfGrHuL5+UK/IhiKje+bCN2tp7VTQfvS8E+msEGMKSYDit3a+HzjTvfXunL
	b9M3MhBPwm6LgnjU3/831vIdjPRkJfOPrBniN2Yts5Y1PVdY5xL0rn32MBjTl/GB/zJ24NfiifJQj
	hUsTbceXWwykjVkBhnubWvAxMeouQPUxzr6W2H9a6er548Dl0SPJrmsGAMU+DrGJxYgxZxmzpAlWh
	rz4R2hJPR9FbjoEx+QsEriKfMYRtT1WjHLN09dW9oCBK+Yy0BcSD7qIpy5rpfkN2BjiA6HDfNHB+i
	HLJlrnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2xX-000000077kf-2ggP;
	Mon, 16 Feb 2026 18:04:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2xW-000000077kT-1vrF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88D0D60133;
	Mon, 16 Feb 2026 18:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FDEC116C6;
	Mon, 16 Feb 2026 18:04:29 +0000 (UTC)
Date: Mon, 16 Feb 2026 18:04:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 6/7] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aZNbXlvCHxDmsmOA@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-7-yeoreum.yun@arm.com>
 <aYtgmZZhAKAvtfaK@arm.com>
 <aYtoOktjE18YNtB+@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYtoOktjE18YNtB+@e129823.arm.com>
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

On Tue, Feb 10, 2026 at 05:17:46PM +0000, Yeoreum Yun wrote:
> > On Wed, Jan 21, 2026 at 07:06:21PM +0000, Yeoreum Yun wrote:
> > > +
> > > +	if (futex_on_lo) {
> > > +		oval64.lo_futex.val = oldval;
> > > +		ret = get_user(oval64.lo_futex.other, uaddr + 1);
> > > +	} else {
> > > +		oval64.hi_futex.val = oldval;
> > > +		ret = get_user(oval64.hi_futex.other, uaddr - 1);
> > > +	}
> >
> > and here use
> >
> > 	get_user(oval64.raw, uaddr64);
> > 	futex[futex_pos] = oldval;
> 
> But there is another feedback about this
> (though I did first similarly with your suggestion -- use oval64.raw):
>   https://lore.kernel.org/all/aXDZGhFQDvoSwdc_@willie-the-truck/

Do you mean the 64-bit read? You can do a 32-bit uaccess, something
like:

	int other_pos = futex_pos ^ 1;
	get_user(futex[other_pos], (u32 __user *)uaddr64 + other_pos);

-- 
Catalin

