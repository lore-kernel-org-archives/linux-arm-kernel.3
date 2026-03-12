Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE31067022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLilrD/E7jJkVZkbnxD0bj4kWJI8bOcIoWtO15WycCo=; b=lbihmGwzruR6V141B5UjkRJZ8y
	RirZwwdpkrqytA2kqVS+VyAdwfpNBEIMYI4Q9ufRIHwFhh5qWzOFh4MU5nScpQ95SgopFJ2F5vB6o
	QvWn3zz6jf+hNRlNAilLAUWexmn71osei70+TsH82YvWnO+lXA5V72wSGVenbaQTV2JPS456IGN79
	BoMoqjRKiAzzfJ/7Y50b/2gZTlY8/pHDtVfFQPwKWttxhWk1sU35xlUw4HL0vVMOQQtMWV1IKgKhx
	fDlPTx2L4ecuxbYviR43vHWBWSDGcb1rTdFn/ZfuvR2JSjTszHztX4xXNnf6UrAUbP1BLsse8Kg7O
	SEimJzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gZd-0000000EAZh-3NKG;
	Thu, 12 Mar 2026 13:59:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gZb-0000000EAZR-3a8J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BB860054;
	Thu, 12 Mar 2026 13:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA38C4CEF7;
	Thu, 12 Mar 2026 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323974;
	bh=OHh5shn/OUIWuLvzM8MyMBlIcwJCjjYNzorrQEwXEgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZcSkq9Yn3CGRAPVbbyzbTylRxaD8nFjwVnIwE2GIo0UtKu+8Z7pnsgmI6GFaS9zx
	 5nVHZ0vCfrKkm9QaCDSaW/8v0lOf+iqa+rY3clCI+DDpfGfPbsrJ/H0ab60c4BQCdt
	 P3ccrHgT2A90YKpQkd8j9r+6NeKofa1V7wUPe7rWjlq1or5vEEJ62eUmdHJu4+YQ/R
	 2ZlDPhCsCZfW5YBm7ED67P60ji5VyhKZnIGfW3AbHerh91kp+zwiZEXdDK1/cQm+Kq
	 vdJGUbByloXnFpFOIURtr9hi+KMi+3EMZVAMLuaCVB+YWk02C4ApbaZ1kXhSnVrfQW
	 Chd63P1DEM7Tw==
Date: Thu, 12 Mar 2026 13:59:30 +0000
From: Will Deacon <will@kernel.org>
To: Pepper Gray <hello@peppergray.xyz>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>, ardb@kernel.org
Subject: Re: [PATCH] arm64/scs: Fix handling of advance_loc4
Message-ID: <abLGwg1aFyoCosHi@willie-the-truck>
References: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
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

[+Ard]

On Tue, Mar 10, 2026 at 03:15:56PM +0100, Pepper Gray wrote:
> DW_CFA_advance_loc4 is defined but no handler is implemented. Its
> CFA opcode defaults to EDYNSCS_INVALID_CFA_OPCODE triggering an
> error which wrongfully prevents modules from loading.

Can you provide some instructions for reproducing this, please? For
example, which toolchain you are using and which module are you building?

> Signed-off-by: Pepper Gray <hello@peppergray.xyz>
> ---
>  arch/arm64/kernel/pi/patch-scs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
> index bbe7d30ed12b32..dac568e4a54f23 100644
> --- a/arch/arm64/kernel/pi/patch-scs.c
> +++ b/arch/arm64/kernel/pi/patch-scs.c
> @@ -192,6 +192,14 @@ static int scs_handle_fde_frame(const struct
> eh_frame *frame,
>   size -= 2;
>   break;
> 
> + case DW_CFA_advance_loc4:
> + loc += *opcode++ * code_alignment_factor;
> + loc += (*opcode++ << 8) * code_alignment_factor;
> + loc += (*opcode++ << 16) * code_alignment_factor;
> + loc += (*opcode++ << 24) * code_alignment_factor;
> + size -= 4;
> + break;

This looks like it's whitespace-mangled to me.

Will

