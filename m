Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D38CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV8zHbUF8Bx30qYXNLhItko7QCpIu1D0o+XEP1ldZJg=; b=aL8DLxirVP1/Y0hmQYdJaSfgjw
	d1C8aDL97B0U9LGzBW7Mjg5nB8nCUr8H7LlyBueES5MMGfFjy37cBDcLdjOb/FCguwu65L50GDPlI
	uaj3JfvcTWZjFgjTXogwwOK/IRgK+Thnw/3NgiZepL2MVdKB9T1VBWSePglH6Qwl5Ya4q2OkG9fJg
	+1+pYQL62uwlr+IgWOpTAz4o1E9MxdxDb9CqZE1fkGvgdZyzStCrOmxq2sqyR3yCtL1RHxCkdSWC4
	J657mvGLTZTOzDzM6owtSjJQi+nGNtR8PxLdOmX7vQC7SRQbB9BXtL8mrHaeGS1V0FLTNdG+QDvDu
	xmM9cEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLY-000000010RY-0rRW;
	Mon, 08 Sep 2025 17:08:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaiO-0000000GvNw-3EH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73C954327B;
	Mon,  8 Sep 2025 12:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187A4C4CEF1;
	Mon,  8 Sep 2025 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757333480;
	bh=3JeRbTeLSST3KXnw3bSHqeKYTRfpq2hpWQfFDYDztc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLhCW6KP9on2cOLpJwU0kgl3Iq52UXHk39R8ATmUrJPoBhHOHXHvPSjOgo+7K734R
	 S/k5MrK8scJLaMqtglJf3R4DBEPoqCHBULmuYTpj+VKQw/ufllOJXKcjNTbQUe7nlh
	 VsTTg1ZEsUzF5EpREt/Vd/Nc2YLEMd4k2wiSt2J+l3ybfqSzPLX1tPNTZaJUwSOqjK
	 wVPh/Yqwo3lxV+8DCAiK7moMDMIvEMBosB/6jOHbrGnHxe3rZ3pI0Ls6eyK5JfjoM8
	 iANdBT6lot/t2J8n4tm+uFnlsRk+5nqdHz4NRmE9ZIqvlj7PEur0+XD5RF/qNXE3nj
	 KS6h3H1KcmUtA==
Date: Mon, 8 Sep 2025 13:11:15 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 2/2] KVM: arm64: Map hyp text as RO and dump instr on
 panic
Message-ID: <aL7H4-KdLba3VVlX@willie-the-truck>
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717234744.2254371-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051120_824343_EDBF8B75 
X-CRM114-Status: GOOD (  13.16  )
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

On Thu, Jul 17, 2025 at 11:47:44PM +0000, Mostafa Saleh wrote:
> Map the hyp text section as RO, there are no secrets there
> and that allows the kernel extract info for debugging.
> 
> As in case of panic we can now dump the faulting instructions
> similar to the kernel.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/handle_exit.c    |  4 +---
>  arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

