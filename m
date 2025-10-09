Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E61CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA3AdNxGNm8cec5oacOdMlLfVrRLSxZBdrE0GE7/5s8=; b=f4hAFax4bbloB2jHz8p/F4Xxiy
	gsXR7ZWuFdlq48w2I6yD/p2GfHE48pvsCErohTdzihKmuTTOkllKsztx6d5SsleH/4v04jU23xSZp
	Te7DJkVzL25idd6ONSxwU00pBRxyCjB85nIokXoEjPJ+OHYJHN23sMDlKcRNGLrzLUqMnYT39NxDR
	DUoaLU67SUZhg1CvhEp20wUyB97MCowyvoKK3WbhFU36cgeRM/eIBfU1klQWWWy4MCPVBvmc06Opg
	Kbat6clBalWcBXbPeDCXxRYs1/RlEmQbAzjlngPdhjq6Fj14+D0oo37wj88NZIS3cqmuegPUg70Pm
	r9JfHvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6piu-000000065Wm-0oit;
	Thu, 09 Oct 2025 12:26:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pis-000000065Vm-2JKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 12:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C84B3441FB;
	Thu,  9 Oct 2025 12:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E55C4CEE7;
	Thu,  9 Oct 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760012777;
	bh=XW6LbGQYe1GOixXoZSrRStaHjVTYa1BdDfSA7prWz+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEo8nk/W4KDqP4vHVOCC+I52oHnSuVQbAWr81grWaqoXy3Y1RMCgb9i2F6hNgWuXa
	 E8B0pdm31Lb9vu+Jhh0Bc/zkOd46IIVn9D3gdgunqiQkdbM1DZF1iuVf1G2pXJnqN9
	 s5wja0quF7KXxhIyJKzUE0G8zoYUdjtVbs1g3+TVAZ9DCq6D+PUATpAUsrn6XUGv1i
	 ey6xlo+t9FA8nES0q1j6VSV4Z2nCYnYQ8AtQK/bDS2eJA1SaVqL2fTD05T/NIcGkZy
	 YW8980gwEsu53qwDm0pBAVJ4b4YCAz3A1FqQpc8onI2HsydxSPnaXw3xBTl2UPeOG7
	 M+CshnFxtmsHA==
Date: Thu, 9 Oct 2025 13:26:13 +0100
From: Lee Jones <lee@kernel.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mfd/macsmc: make SMC write buffers const
Message-ID: <20251009122613.GA2796410@google.com>
References: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_052618_606005_C12D8506 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, 07 Oct 2025, Atharva Tiwari wrote:

> Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
> and apple_smc_write_atomic() as const. These functions do not modify
> the data provided by the caller, so the parameters should be const
> qualified.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/mfd/macsmc.c       | 6 +++---
>  include/linux/mfd/macsmc.h | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

