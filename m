Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B63FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SC/fYdrClIHEGZ+CcREmZZ95tjiTijf08EGksHg2t54=; b=toTxPcN6EOv3194fz+I7opy+eH
	wnf9SRCQhQtj0xImMm3rzgy0EmFytpNtqkooKjLSOciAqGb8S0UrpcsHh8opYrhb9mVLWstIVPsdP
	cuP2R0UOPVBALEWmbld4y+YmqIC83Xu3vsgU+1z+GUxsiNk+F2XKmh4FZ1AISqhVl8YF58r+G1jvF
	45TUVI6DAPRBA+terwOVUdeHZp7Xxdevk6ZONV+m57dQUG4Z/wLKyQYtHtq/vIOkpYNTpLoiuk8ga
	mOzUBM6c0eEVwkM8T0wlwIOrgtQKvTnqiyQkQu+FAPfrvgwafUCy/75PH0QAgrPqmPZqEnILacGjz
	GUAedy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckON-0000000CbFv-0hxw;
	Fri, 18 Jul 2025 12:40:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjRe-0000000CUSA-0NFf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3179D601D9;
	Fri, 18 Jul 2025 11:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED134C4CEF0;
	Fri, 18 Jul 2025 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752838804;
	bh=mt4VDxY3tbDadjNu9CTiubY7kgDlEox9bXAyrOo3E5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYeuJ2WXLAtnQCT4EHlcChjo7Hv0urmKqM3Dbes1riiodONgzsOw9Y1UwDZsTJXv+
	 ewDz8T4x7xLuPuMcZxBTaecP1El5AAJmAs83RWFXNTQ8pJw0HnI7s8xr2KfwrnZ7iD
	 UDwWDUYyh43wJnTJuzTfeLsI4XeMRCQWaycl+gY4bP7SqSgjdKsaqRqzNAMQ8BPtpl
	 KqAE8BHY26GM2+IUVAoVNrRcBuEFaqwr+st/9z6rkMm0dxDdijCj2mBh6AQgI1IGDv
	 mymY9aNbxx4b8wzX5u14TecZBoatyp+sgh6Nuy10ituczzH3U45oewhmzBVFTAF6Ku
	 uOKQ7WYiEuLug==
Date: Fri, 18 Jul 2025 12:39:59 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH bpf-next v10 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <aHoyjx1xJJVP6Khz@willie-the-truck>
References: <20250715225733.3921432-5-samitolvanen@google.com>
 <20250715225733.3921432-7-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715225733.3921432-7-samitolvanen@google.com>
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

On Tue, Jul 15, 2025 at 10:57:36PM +0000, Sami Tolvanen wrote:
> Instead of duplicating the same code for each architecture, move
> the CFI type hash variables for BPF function types and related
> helper functions to generic CFI code, and allow architectures to
> override the function definitions if needed.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/riscv/include/asm/cfi.h  | 16 ---------------
>  arch/riscv/kernel/cfi.c       | 24 -----------------------
>  arch/x86/include/asm/cfi.h    |  9 ---------
>  arch/x86/kernel/alternative.c | 12 ------------
>  include/linux/cfi.h           | 37 +++++++++++++++++++++++++++--------
>  kernel/cfi.c                  | 25 +++++++++++++++++++++++
>  6 files changed, 54 insertions(+), 69 deletions(-)

[...]

> @@ -27,6 +29,29 @@ enum bug_trap_type report_cfi_failure(struct pt_regs *regs, unsigned long addr,
>  	return BUG_TRAP_TYPE_BUG;
>  }
>  
> +u32 __weak cfi_get_func_hash(void *func)
> +{
> +	u32 hash;
> +
> +	if (get_kernel_nofault(hash, func - cfi_get_offset()))
> +		return 0;
> +
> +	return hash;
> +}

Do you really need the '__weak' function definition here, or could you
use an '#ifndef cfi_get_func_hash' guard, a bit like you're doing for
cfi_get_offset()?

Will

