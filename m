Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7BDCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SPlbyjso/mwT4FGB3u+5KyJ2qpQpBf099rWRXcddn8=; b=NyjjiMya/XySueRsnUBHT2DdX9
	gIzv/MlnWr+Dw+s4T2/Li/9dc/YKY2T6dCnwUMD2QBrqwV+1quMS2RJELbdl+A4zXlPHi4OBqBZei
	dtaa5sH2km60Ppx3uGt73j0/FnuqqwLzvkN9nqAuTf6qp9zfZ8FC/uWx3VBPU9UK6QJn6KoO4ToIS
	Fnkst6d0CxctUcFPsjMqWVJqHPH4NGEEFYsH+IpdKkJo1m1cutFPcZtJ8o5swtfm87cNmdaFH6JGX
	5mU7s2p5JOBalSMbz9l+MX1xMLdMkE4piNuUvtUP4ZJ4AoftrcVCz7/g+9NKNT07M002M/G4mSBK5
	FnoCh/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI4T-0000000Bywv-1aZi;
	Tue, 04 Nov 2025 14:31:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI4R-0000000BywU-1fmk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:31:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAF0940249;
	Tue,  4 Nov 2025 14:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C8DC4CEF7;
	Tue,  4 Nov 2025 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762266698;
	bh=0SPlbyjso/mwT4FGB3u+5KyJ2qpQpBf099rWRXcddn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8Xh3gnVJPcqdE64pMFhkUD14Yva2zvXN6u37/PaTVEubw2ni57Y4j/nT2Jjqj3Cd
	 xudVFbbUMaH6G8Hd5gaGRNhVeOLqbvDc5hUOFJg5Y7+lUFf78PY9+Ul3gYQbW5DOnd
	 K5HA4v5YnscM3xEYmcZITR6pWLXf7HJ5nJTd6/zdm9VxfH8bV/KK3ikm9J/pcNBtyX
	 NrThHcbZrdl7lkRDtf3d5izGQGQlVB+8nWWqVrZ+MWBZDt/tD1XI0IsAzFu6owXe57
	 Ffzw4zS0+dBomhcEusJt802pS5ljd6ekZBy5O8TEraht9Z2O5HI19sEFIps7IAK+an
	 jtSHf2vRQ/3cw==
Date: Tue, 4 Nov 2025 14:31:34 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
Message-ID: <aQoORmgliayA0s_a@willie-the-truck>
References: <20251014110633.304961-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014110633.304961-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_063139_456988_FC7F1E04 
X-CRM114-Status: UNSURE (   8.77  )
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

On Tue, Oct 14, 2025 at 12:06:33PM +0100, Anshuman Khandual wrote:
> Add a fallback stub for pgd_page_paddr() when (PGTBALE_LEVELS <= 4) which

typo

> helps in intercepting any unintended usage and which is also in line with
> existing stubs for similar [pud|p4d]_page_paddr() helpers.

Are you saying the kernel compiles in this case without your patch? Which
definition of pgd_page_paddr() does it end up using?

Will

