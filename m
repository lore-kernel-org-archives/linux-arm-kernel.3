Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88042CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfIZVJD6t1lO6Uib0a71SltAzOzLDBohr5Vn+dKRzCQ=; b=CsZ6v3Idu/ltuZyKFEl88YIFMl
	FL24giVvgB/Jqcf16isniz0njN2JNtwv8uKnO6v7K33GR23hMf+sdArAemZXwESti4bnwHWZWRppY
	7LaHjU9GMc8PjoLcUuo1rabYcq8HCxqDM4dDJ3kxzDPPgt2hi9M/T+zpWNg0sAoBvdqstbJ0uWDSK
	hnQK95keu3r/t0j7PklLgfY0wTPh2qXJhUThOa2KvoObkuzVQcW8T1O6/czGW83LE5k08KlJ+v8rz
	CLhYS3Oktt0IbkTfwM5IgThtbkCtyAnUVM9H79k5PqzTiHOrFWOYraZtXQ/H4jgPxY5Bz1pf819d6
	aHwmLo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwRa-0000000CiSS-1Ore;
	Fri, 14 Nov 2025 16:14:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwRZ-0000000CiSB-1lyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E27960150;
	Fri, 14 Nov 2025 16:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C428C4CEF1;
	Fri, 14 Nov 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763136876;
	bh=bvJRcxzzKLlecIpg4D1rJZr4qSHf+dC7+R6tCSry39I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsDcbHSCRx3ubUvTF5wvpcX53nWt37krucurCQKf/bmwGDgAjWHSfzaaSS92j8S8W
	 BM9KWD6tNnC6WNO/YPAJR3L7Yyz8ymwvvlR3G9uDQ/l0AZMR1rqW21gZXMnQXNDE/j
	 vSHdrEBQkm11cqS1aYvIn1nv8m7+AWeP/wddttVILXaVW+oDFAIEImCcTIcrBp2aFK
	 mcD7xNOantzjwxdaXsgjYwGXUGmK1RvpF1hWu9HhiOOqVkm5A630mI8mlnWFD/DaVC
	 62gWfg8VKOIHm9pSs3lAy+X9rEYcw5VqtrwIZir01OTfJaR2o93Cd6N3PBkRVh3ocW
	 591X1RgzuGRhw==
Date: Fri, 14 Nov 2025 16:14:30 +0000
From: Will Deacon <will@kernel.org>
To: Bill Tsui <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, catalin.marinas@arm.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
Message-ID: <aRdVZmeOHYbm24NJ@willie-the-truck>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-2-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018133731.42505-2-b10902118@ntu.edu.tw>
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

On Sat, Oct 18, 2025 at 09:37:31PM +0800, Bill Tsui wrote:
> This patch fixes the failure of PTRACE_SETREGSET when setting a hardware
> breakpoint on a non-4-byte aligned address with a valid control to a
> 32-bit tracee. The issue was discovered while testing LLDB.
> 
> Link: https://github.com/llvm/llvm-project/pull/152284
> 
> The failure happens because hw_break_set() checks and sets the breakpoint
> address and control separately. This can result in an check failure when
> it first validates the address to be set with old control.
> 
> For example, the control are initialized with breakpoint length of 4.
> Combining with a non-4-byte aligned address would cross a 4-byte boundary,
> which is invalid. However, the user-provided control may actually specify a
> length of 1, which should be valid.
> 
> The fix is to set the address and control together.

... but you only implement this for the native (64-bit) case, so I don't
understand how it helps with the problem above.

> For reference, the check is in
> 	arch/arm64/kernel/hw_breakpoint.c:hw_breakpoint_arch_parse()
> which is called via:
> 	modify_user_hw_breakpoint()
> 	-> modify_user_hw_breakpoint_check()
> 	-> hw_breakpoint_parse()
> 	-> hw_breakpoint_arch_parse()

You don't need to include these details here.

> @@ -524,9 +506,6 @@ static int hw_break_set(struct task_struct *target,
>  			return -EINVAL;
>  		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
>  					 offset, offset + PTRACE_HBP_ADDR_SZ);
> -		if (ret)
> -			return ret;
> -		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
>  		if (ret)
>  			return ret;
>  		offset += PTRACE_HBP_ADDR_SZ;
> @@ -537,10 +516,11 @@ static int hw_break_set(struct task_struct *target,
>  					 offset, offset + PTRACE_HBP_CTRL_SZ);
>  		if (ret)
>  			return ret;
> -		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
> +		offset += PTRACE_HBP_CTRL_SZ;
> +
> +		ret = ptrace_hbp_set(note_type, target, idx, addr, ctrl);

Doesn't this break the case where userspace tries only to set the address?
The loop will break out when !count without updating anything.

As I mentioned before, I'd prefer to leave this code as-is short of
removing the indirection through perf entirely.

Will

