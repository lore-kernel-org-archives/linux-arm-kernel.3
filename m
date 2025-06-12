Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA7FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyJisgqY9Oe0qDt+asv5RJ0Aj8j/IzVg79m8e4Mdq0k=; b=dCYxY5XDD/pv6G4nHiu/Ghrr6R
	QsKDwoLISTR6iNhCUB+/1Jff868vRtYSbbU+WHI8tyMjY0zYSvbxnRYNXw68ghefouQ36hfYKZk7f
	fKXy4QLvtKNiZpKcw0BUmFV7dIyOLv9BQ2DYvIzIveJGojCy10kEi9Oi/OkkTkb8uLXMEbbfWHtjE
	p+j2xpvLJ8DRtSJh3ii7M8DMdkHyTxKl8mqnf6bF7obK5xtM3868/InUxt0hNyKKpvuIBbtNZn6PK
	ThvzroJ8rt/Py0i3lGjnRZKUz5RZwCHoMq7mQlS39JVznxHPeXq6ZtOMFJZtDAqpvfwqNSkSECCsP
	hwnL5sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnst-0000000EMzm-3EUS;
	Thu, 12 Jun 2025 19:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkrx-0000000Dxpl-3DsD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FA7762A05;
	Thu, 12 Jun 2025 16:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF76C4CEEA;
	Thu, 12 Jun 2025 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749746016;
	bh=diFjJs1nQRb1BPTEubUXqeZGGrUpYO3F3j0LaFXBmSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUwqfIsC1hk8kjmFa8eAR2CdlnFZnvYqlJHfk+WeVwESl7vRXX7IjDwMvsH5VUBwn
	 S4h9ue2XxR3nh2YDD8CESkSC9CR1dv2JpOo57eSMqjDrus/7Z17+wIDqWlwWwiyp3E
	 V9BsNW4VSzDgYRom0Lq4sTIcT3kf7sAAEiX5QOHihy+j4nmt3Ak4NNNXyOVqWYQJwd
	 CjMYsr1z+aiGbViOyXoOzU8hIGpgkCCPLp+dwm0pF6OKeYmFRuKCq4sr+qQICduh9k
	 7mBt+c1neFaXXwmCNmZvPetf+0ozGFNjxeVaXGPFys+4bUA8hBEFMqIuNp14ZzSq+a
	 LDgfyvVoWV2CA==
Date: Thu, 12 Jun 2025 17:33:32 +0100
From: Will Deacon <will@kernel.org>
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David A . Long" <dave.long@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
Message-ID: <20250612163331.GA13384@willie-the-truck>
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604005533.1278992-1-wutengda@huaweicloud.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Jun 04, 2025 at 12:55:33AM +0000, Tengda Wu wrote:
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f79b0d5f71ac..fe3f7e554d14 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>  
>  	addr += n;
>  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
> -		return *addr;
> +		return READ_ONCE_NOCHECK(addr);

I think this should be '*addr', but that makes me wonder wtf s390 is
doing...

Will

