Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D4CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjqaw7UGeghpUlDyhDEvEPqJTodAy5wxI6bXZ6qHe10=; b=fQwO2kPrTy1zHxNEqPwpj1ku0k
	i+FOsXRDAiRUJUMYNw/OmRfUskBl4nCTdnbeV2ozEf9TtlS6MQXPLEsNAo1sgvp/7THkp0jD+JiFs
	vwjqFf8gH2klE3E6NDyukIqy2y6sOwAvi+0U9yFbBFxgKVIEWVqFbvVbSC1ICpU5ROivXWsMKkBtc
	Y7KOBLTS37Q8XfM/kSNaSCvqvF01UXJFO8upcKexUL9P9Jiv5mg/8hUKi2ucFb3MhdGblUkdNWE13
	OWbyzllnjOociHFh3b+02c4yF5BRmrXYuvBRKdJ1c+eqVTFUnB9p0R2AKuJvUx5TcVDHaFlhJga3D
	fcOEEtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPdK-000000080qg-0IgI;
	Wed, 24 Jun 2026 15:35:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPdI-000000080qV-0ory
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:35:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C83AF437B0;
	Wed, 24 Jun 2026 15:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C831F000E9;
	Wed, 24 Jun 2026 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782315319;
	bh=qjqaw7UGeghpUlDyhDEvEPqJTodAy5wxI6bXZ6qHe10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WBmziv+yn1h05+vjfNPyjrfgrkev12cTrf6Ajg5QVO9GcIq65zka0KAB/xfCuVT0J
	 t0gacIIztxB+7QC8K0ew1DsMbX7Ec/zRAC0/+Vxj62+p1jI3+7xradUvZcW1hNMY1B
	 1dyanpkn1zG6c5Basg0wyQxry9euXh5YIUeZzknCJlvmlCiCf1EiHfEamci2TJHOrF
	 qbhgBs1dtdkr1Cd4u3SchMnqLF8ci4/68BqI/yO0qf6d8wyVa8ws89UrAH9K6T6Zi/
	 oLAbzaphG1mHrvnZ9uoQQGe8N2bXoozpVWauOo8EUp8rw5X2rHGD1GPxkmLj+gob3F
	 LDg9f5QuR8YIA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] arm64: mm: Defer read-only remap of data/bss linear alias
Date: Wed, 24 Jun 2026 16:35:11 +0100
Message-ID: <178230913536.3255088.6409462291781570977.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623202817.2225495-2-ardb+git@google.com>
References: <20260623202817.2225495-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 23 Jun 2026 22:28:18 +0200, Ard Biesheuvel wrote:
> Since commit
> 
>   f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
> 
> the linear alias of the .data and .bss regions is remapped read-only
> early during the boot. (Note that a subsequent patch to unmap this
> region entirely was reverted just before the v7.2 merge window, and will
> be brought back in an improved form for the v7.3 cycle)
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mm: Defer read-only remap of data/bss linear alias
      https://git.kernel.org/arm64/c/36fa5ffa6034

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

