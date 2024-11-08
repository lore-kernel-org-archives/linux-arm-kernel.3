Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE86D5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSu2mJAWSBBKGwTT3Vck0cDih9zzy8ProYS6boonDfs=; b=rRUP76g5A3bzEcBIhKI0FaVlN1
	O9+E6kT9crWYQe8TSh88Ol2VvDAkWMa4DZTdOnMFcperHg0ts7gH+2Ovx2QQaMtpKHZzIkLmRRlKS
	AzISQLBNZ/ECIlnsqwM6j5xzpNH0OPXqBifwSouqGJzjK8S8bKygLRu+yPYPpVJ1oji8DSymgkcl1
	cJeWvFw/jNkfcvR2S7pJ63Ylvz2CWVO3mWUMRfs9VhY0K5e0eze1hckmCAzqY8WxHszUoZoAfKY5S
	eVhrBDNoGcTlcoYgy9JwFm9SCC2ZVudbct7dZ6RabnrP/RV3MQno3XFinPW+YUG+6AuhAW90w5IgD
	QGmUpQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RBD-0000000B5Hr-2pVv;
	Fri, 08 Nov 2024 15:45:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QWZ-0000000Ax8H-3nHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F98FA440AB;
	Fri,  8 Nov 2024 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CD9C4CECD;
	Fri,  8 Nov 2024 15:03:45 +0000 (UTC)
Date: Fri, 8 Nov 2024 15:03:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] kselftest/arm64: Fix compilation warnings/errors in
 the arm64 tests
Message-ID: <Zy4oT2w63WGXBASQ@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <3f0b7891-7f67-441b-8ba9-ab302ac57792@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f0b7891-7f67-441b-8ba9-ab302ac57792@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_070348_023164_D62A8688 
X-CRM114-Status: GOOD (  14.65  )
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

On Fri, Nov 08, 2024 at 02:58:34PM +0000, Mark Brown wrote:
> On Fri, Nov 08, 2024 at 01:49:16PM +0000, Catalin Marinas wrote:
> > It looks like people started ignoring the compiler warnings (or even
> > errors) when building the arm64-specific kselftests. The first three
> > patches are printf() arguments adjustment. The last one adds
> > ".arch_extension sme", otherwise they fail to build (with my toolchain
> 
> Unfortunately there's a lot of toolchain variance with these warnings so
> a lot of people simply won't see them, you need a fairly fresh toolchain
> to see them, and IIRC GCC and clang warn about different sets of things
> too which doesn't help.  If you look at the set of tests you're updating
> they're all fairly old so will predate the warnings having been added, I
> doubt anyone touched them recently enough to see the warnings.

But we should still fix them ;). I tried both gcc-12 and clang-14 that
come with my Debian stable installation. If we see others, we'll fix
them in time.

Thanks for the reviews.

-- 
Catalin

