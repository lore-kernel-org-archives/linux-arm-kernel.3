Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC001CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP68eVLU1Zck8R5WUfUB+tPuu3+R0zTKlSRhm8mlIvM=; b=FpgXsZ8L71cU8sSOTn++vKqh8s
	F2wvKgYAHjDrtfw79zVfDkwN4f3Wn5A/kJYjsRaJHM04rk8ppyDRlwTKoHdHUIYd6vXESALHo5oxu
	C+fw0el9rcN89z59K6l1AC8GH4fF37LzWDMfIFBS4A/CetZEgYVOJ2c4V1xs25QpE85x+A4arE8HX
	BrXqj5R9G1smBlSYNWgUBFVx5hKlRvFc0/uKl5qXLdFkil3Bq7eF4tmuOeEh4h/QE11QzueIxogjh
	FY+r0U3X4lO1qjmN2hpYeW1XXCZIQy7LJE/AYEvVpXOn2LipgGAV+zX7LKDcg4rRGojbt+Wm6HpLS
	Iz3HLpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZU7-00000002j9I-0ZPM;
	Fri, 19 Sep 2025 11:41:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZU6-00000002j99-30Gq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0969D60139;
	Fri, 19 Sep 2025 11:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF3EC4CEF0;
	Fri, 19 Sep 2025 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758282061;
	bh=792DYNCBkP3tBnabEABgwGFKr8gigP8l0yyHqaUtcz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tP4QNoadn6CKvqSo+LZcTfeyko5AvnM+HUlQ717kWW5fmRqOuDxDfUGjZZhbAq7EF
	 4wA7JNCQH3LLZpN9wWcm4RuFmZIhZyolHeBh0pBFTXhvwMaGu14zH/BlvRmqw48343
	 EEAJuynhEW4VArF/EA3Di9Za6XL/d1jwOhyxHKOuuoIzeXzR446XDbPVNPdwd4ePBR
	 IvORPciwbAPTN/AejQRQ1L7KdM8NfAApvvP25o9uQkd9eIvLGmWPJ/sCnzxNM0NQ7J
	 e46FF1RiATQ8fK5m2NY5F1/iIMDpXlOU6wLT3RVdlXW/L4AgIAYkyIlfada25QLzOW
	 LsaXWlPLLo7Zw==
Date: Fri, 19 Sep 2025 12:40:57 +0100
From: Will Deacon <will@kernel.org>
To: Can Peng <pengcan@kylinos.cn>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm/syscalls: mark syscall invocation as likely in
 invoke_syscall
Message-ID: <aM1BSZV43DB_l5OU@willie-the-truck>
References: <20250919100042.497861-1-pengcan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919100042.497861-1-pengcan@kylinos.cn>
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

On Fri, Sep 19, 2025 at 06:00:42PM +0800, Can Peng wrote:
> The invoke_syscall() function is overwhelmingly called for
> valid system call entries. Annotate the main path with likely()
> to help the compiler generate better branch prediction hints,
> reducing CPU pipeline stalls due to mispredictions.
> 
> This is a micro-optimization targeting syscall-heavy workloads.

Does it actually make a measurable difference?

Will

