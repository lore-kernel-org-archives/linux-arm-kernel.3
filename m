Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B247CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91Re1ki5i06ImfQ2WQcYkJL+cFX6XDihWfIGyXVk9j8=; b=u7uA60N9NUq6HBmQ9J7ltlS12Y
	TpRZsDV28/WLvDS7u55wozBZLA93fuNHro61YPFa5YqdeoFSaY6rlZLF0j5gyN/QmNTLPl4pfmrqB
	8WrXLHgx5XHWkad1zpZUXx4C2pRf0+UlxJTYGTDzP3DYq/yzSctpiNLgqWC8BXOKjHdTLsOoLUOn4
	nmDGn4UZFl/lM2WY9Uvmebw1vzOw3x5v+XTxKJqnGx0diXZPdHVbbNS3BUEeDThXmLjMqpcE/LlgW
	XWTmd2ip7i0VVnqbMSH8YNu+X8jKItHDspKBGGVywF3Q2u/bZN+JjR7JndYBTKW+YqgvZc8Yb2Zjg
	yd6+/FrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD73s-0000000E3sV-3ywe;
	Sat, 03 Oct 2026 21:14:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD73r-0000000E3sH-41hM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 21:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 631D843A47;
	Sat,  3 Oct 2026 21:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333431F0089B;
	Sat,  3 Oct 2026 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791062067;
	bh=91Re1ki5i06ImfQ2WQcYkJL+cFX6XDihWfIGyXVk9j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltMCYBJhrHGywMCwYCJ9iRp6v+aDzPtsuVq2HKqfaurd57oEobFkLFNFD5tiGhRK6
	 6mCP1gWhsYHLavzgdTNI+TJrrxsMt7jVNJW6grUR4JBpRhVI/Y4XWsLTvXw/RPrIIK
	 pP08cv3FpCr8lM7nLmTw+UmWiJ/fMloU23eW+C1z0o3CItNgmi4vq6zp8BLjHJMnS0
	 1ZIEZyeAIC4iQzaP130AYyCzvbqZ7D/PJ/pFk1rTLCx7lkMYVszdtHqwknkrTw57Ji
	 xRUwAVeLYWfSHSdCudnhgyuaxAU9dP7HTIqOxxFwxYoeqyD+Lq0ccQ9ImMsvqjOEtF
	 cCLMjIb+uciFg==
Date: Sat, 3 Oct 2026 23:14:21 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	"kernelci.org bot" <bot@kernelci.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] arm_mpam: make the mon_sel guard conditional only
Message-ID: <20261003211421.GA1389115@ax162>
References: <20261003121251.3942666-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003121251.3942666-1-sashal@kernel.org>
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

On Sat, Oct 03, 2026 at 08:12:48AM -0400, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>   of function declared with 'warn_unused_result' attribute
>   [-Werror,-Wunused-result]
>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> 
> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
> through the MPAM-Fb firmware interface it returns false when called
> from a context that cannot sleep. The mon_sel guard was defined with
> DEFINE_GUARD(), which calls it unconditionally and discards the
> result, so a guard(mon_sel) user would carry on without the lock and
> release it on scope exit.

I wondered why we do not see the same warning with GCC since it seems
like it should also warn on the same construct...

> The unconditional guard only exists as the base for the conditional
> mon_sel_lock variant, which is the one actually used.

but this is why: GCC may not emit warnings for dead code due to some
warnings being emitted from the middle end after optimizations happen
but clang will always warn because its semantic analysis runs in the
front end before optimizations occur.

> Define mon_sel_lock directly as a conditional guard class instead, as
> posix-timers does for lock_timer: the constructor returns NULL when
> the lock cannot be taken, and the destructor only releases a lock
> that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
> ACQUIRE_ERR() returning -EBUSY on failure, and there is no
> unconditional variant left to misuse.

These macros make my head hurt but this seems correct to me (though not
enough to give a formal review tag).

> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
> Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
> Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, this fixes the build for me as well.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

> ---
>  drivers/resctrl/mpam_internal.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index ee7c3953a9b6c..be1795b29aca2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>  	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>  }
>  
> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
> +	     _T ? mpam_mon_sel_unlock(_T) : (void)0,
> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
>  
>  /* Bits for mpam features bitmaps */
>  enum mpam_device_features {
> -- 
> 2.53.0
> 

-- 
Cheers,
Nathan

