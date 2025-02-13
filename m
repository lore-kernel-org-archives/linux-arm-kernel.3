Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D319EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epyKhCFrWYAIxnE5wrz7MqFvgj8O0i7w2yMRVgLOee8=; b=RZ7Hn4kmqKZ8wppo1AZhrkhmoD
	C5nwzPx0mxD1awZVq5iXArck1Wr/x3SDYuw0ggff5Og5afpwwXBkkrNPOciPTVRMIhCDmINWwiHmR
	yOB7p5svzjLL3y3mwoVFFRdKZIeDEZAyhuqKQkpmdHTQaFPGKj54X/DkJ3gKoAXPyT8vVC0fnFKgT
	oJ0NzqpldH+HClrXEgWyWUHr1r9blMHGnfsylxWRT/RfwD+VHca5ZUc031QjnSU4JdYYQUiSdXOXf
	8an/CHr0bpV9t1vzVnhqjLIuo6x4cRCXUECf8Z4s7QIH1iLqe1D378w8VA44+jJjNQ+herutLvZM0
	95ZxtJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZlw-0000000BErn-1QhN;
	Thu, 13 Feb 2025 14:00:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZkE-0000000BENN-3J1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7B76A42549;
	Thu, 13 Feb 2025 13:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DDBC4CED1;
	Thu, 13 Feb 2025 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739455149;
	bh=86lSLlfSnH3gLlHMarEFFkwpZl7BtgL5BOo2fiEcAXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKDpKnpQZZLPLJkxSAp4NQrHabwTbI+1k6690/Wd6bz1VqhXT3WrSaJBXDJXe7n3V
	 FAUMe0lEskBGSiui5Jd3oo3DNpCoZ3SzpqtjT8sNEYeLFc/XoMGz9vcOWDatH00MUF
	 HQBIdOl2MyiU1/KXWpnCRdKFYXI0nqUfDnC9o9FR0mgOXL5loe+bISDAPfYsm2aeu0
	 bdITb5rssub6wlOgZEM1Gcw6dhOb8KGXmUh8i9dEXTkpamTvbwbH7qky0fGGzRg/vj
	 Gw9P/KhohA6y5uvdJUXmmdzWSbCmgzvTNVPOm3TZNCHsaOg+5vvBaeVajR3YPePneS
	 r6IHchmUPbuZw==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ionela.voinescu@arm.com,
	sudeep.holla@arm.com,
	catalin.marinas@arm.com,
	Beata Michalska <beata.michalska@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	sumitg@nvidia.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH] arm64: amu: Delay allocating cpumask for AMU FIE support
Date: Thu, 13 Feb 2025 13:59:01 +0000
Message-Id: <173944478263.2605897.5555784632946781698.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250131155842.3839098-1-beata.michalska@arm.com>
References: <20250131155842.3839098-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055910_891180_360F5D0A 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

On Fri, 31 Jan 2025 15:58:42 +0000, Beata Michalska wrote:
> For the time being, the amu_fie_cpus cpumask is being exclusively used
> by the AMU-related internals of FIE support and is guaranteed to be
> valid on every access currently made. Still the mask is not being
> invalidated on one of the error handling code paths, which leaves
> a soft spot with theoretical risk of UAF for CPUMASK_OFFSTACK cases.
> To make things sound, delay allocating said cpumask
> (for CPUMASK_OFFSTACK) avoiding otherwise nasty sanitising case failing
> to register the cpufreq policy notifications.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: amu: Delay allocating cpumask for AMU FIE support
      https://git.kernel.org/arm64/c/d923782b0412

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

