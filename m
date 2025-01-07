Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A1CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOig6nQgHUOwCHV8M5lj5OpDDF8DYeXtrtEWeUIkhE8=; b=0DKvkRVBRlgId9vOVcis28NwAM
	1X5Ek1eIjPZzP7yy9mDYaxvKIWmgNlCJhp1nb53AspNy/NRIHELkWHd0QbjYON+vzpsQxSoB4w/tu
	50SJTuPF4qKluivjlX+ZsRxkyMq2Q9xzI7DqbURmcEp3bAw8gdQlwHlyWO6GLObfNsgWsXcS2oD3l
	AXT6d/xw8YEOdXQd25ZPI0EKoQedat6BAoILZBbfn0+9onn11uRCUidHZo5GH5Kg82wJKBBKM9yCs
	mocVRzkslSlrANqTSmhaii5pyhFPyo2/l6CvgQXYXphiz1sDsLFYj8u+ydSo0+0XjXnA1uRPz8WN4
	eZEdgz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8fT-00000004lU5-0Psv;
	Tue, 07 Jan 2025 12:26:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8dc-00000004l3J-3dtm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 475A15C576B;
	Tue,  7 Jan 2025 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF30C4CED6;
	Tue,  7 Jan 2025 12:24:46 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:24:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
Message-ID: <Z30dAM6LpbKKMwxw@arm.com>
References: <20250107015529.798319-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107015529.798319-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_042448_945872_C0D059C9 
X-CRM114-Status: UNSURE (   8.46  )
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

On Tue, Jan 07, 2025 at 07:25:29AM +0530, Anshuman Khandual wrote:
> [pgd|p4d]_bad() helpers have open encodings for their respective table bits
> which can be replaced with corresponding macros. This makes things clearer,
> thus improving their readability as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

