Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CAED74961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HK17fGQ2oo+4WccuuyYvH3DB2Pgjd3sTERJ+pLTzVa4=; b=RkNKE9nOYsr0g2p+WChIsFxRB7
	cAMyUMXqaMPzM9ilCilQrfLf9ISl7UWN1zHQtuQCxs/xIBcKHWV64D9oOzzUOcQBHg+mMd/oOlP4N
	Ie7Dv03rbImgoAU7jcxn/H4TFWfAOUJCfsIF3rrJ/18PBfi5iCu21BptX2Pen2oXwYupL1iQzvSGQ
	rsiyjALoMl8dIzJVHVnC9d5gYVaiXcNIktSOKdYtBfzRo5+YL343NaKVwbUwUFjhLNRRaQiMTpXtf
	p3YPNUUo74DoElk7Cyl8g5qEvo4mVWKx8OB+AevjESS385VrCHPpS2czJP9XvAfjQ3zumTvBK4z42
	w5FV/rNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60Og-0000000Gg1j-1PGE;
	Wed, 30 Oct 2024 04:33:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60N3-0000000GfuP-0edS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C8B2A43328;
	Wed, 30 Oct 2024 04:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7BCC4CEE4;
	Wed, 30 Oct 2024 04:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730262707;
	bh=36OA5GmB8F/k+0bQ7m27Dl7eZE0oZCVspueUWP6QG2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNdsR/K4U7mt9oDNuH/6biL7Gpa0DlpEw2h0eNlWDChA5NDvGXSP4OzEflxy3m4h2
	 uTPhelDc+HtsTMZBP/B/vK8GN6xuyCpOeDm5Ti6z5189dE1bF3xmpt6mKMiQMLFm+7
	 fnk9e7hrxAQyOPal7AbR4zsJnGZAGyDdBc5wcaw3tECEZPGeD/5X7oEiO+DsO3/H8u
	 0yEvRol7IgUxeGkkJfNkbVDgAg/5AiZmrYZxiY/8VA9BuLVDbTd+aZy1C3uq8bkx9P
	 rPCmyVcybfM+CBDTyxKXv3HCMGezi4xUKh5E42MKV9zppBZhbdhrT3zVu2uTHVnrK8
	 21dep+cQcZNYw==
Date: Tue, 29 Oct 2024 21:31:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 5/6] crypto: arm/crct10dif - Macroify PMULL asm code
Message-ID: <20241030043146.GE1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-13-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-13-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_213149_278381_9759AD1B 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, Oct 28, 2024 at 08:02:13PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> To allow an alternative version to be created of the PMULL based
> CRC-T10DIF algorithm, turn the bulk of it into a macro, except for the
> final reduction, which will only be used by the existing version.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/crypto/crct10dif-ce-core.S | 154 ++++++++++----------
>  arch/arm/crypto/crct10dif-ce-glue.c |  10 +-
>  2 files changed, 83 insertions(+), 81 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

