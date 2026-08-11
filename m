Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elSPNXzdKmLiSzaBsIbjtlxTtbtBm9V1qIvc6L3Olnk=; b=iiMFoJxh8QXSleB2coRRVhtsnK
	hNcrDDbowROPaQ/z1mYxNayJ8j298sR+4sgb6XPI57HjHpC8ZZHvWIlNLRXDicryRzL5qB0AVocpJ
	flmveXEoRW1zADA9LI6HiiU3qIasuNA1JDsQMQozvhZuPa7QI1DVHj/34IFJwU6mO9PXVU73aOq8n
	UuQeJbOFgAjJ6UmWsh0mE7XwI91Q6JZlHaRqh2YunCSuEscl4BgchVkWk1abj5q4lVCdZ2odpHUMg
	AeEDTzbyUL7ac4o/awm8f5G303tuYTgvJLQn/ENLu91FSw7SC6rXDljlDFrSbBW6+fkHFOlV4nQRN
	F2XXF7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtodu-0000000EMjt-3Zvn;
	Tue, 11 Aug 2026 15:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtods-0000000EMjK-2HPG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:43:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9EAB1516;
	Tue, 11 Aug 2026 08:43:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 096D23F632;
	Tue, 11 Aug 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786463030; bh=hQLSjCwZk9nOSIrJE2YUoZMmluijQPyTacbicC/GIzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tACVSB9haxx+b5z5esFq1GdMDSp73EAaLWClW5d/yi9uQLUdt9xeDY4nnDhmtPnen
	 uUTqogDxL2FL1EtY3wdTkQ1cAeYnH0b1Yt9vpRphjoNKPL06DiEnxTbG0GYEqGdscc
	 K5F3mV4QK7ftIcrVGstaMk6l+ktUqPBcUQBvvnwM=
Date: Tue, 11 Aug 2026 16:43:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Message-ID: <antDMvjBM1s7jfxe@arm.com>
References: <20260811140132.22778-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084352_618104_2D53A563 
X-CRM114-Status: GOOD (  10.88  )
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

On Tue, Aug 11, 2026 at 03:01:19PM +0100, Will Deacon wrote:
> Hi folks,
> 
> Big-endian support on arm64 (CONFIG_CPU_BIG_ENDIAN) has depended on
> BROKEN since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend
> on BROKEN") and has already seen some clean-up patches removing some of
> the unused support code (e.g. 5276ea17a23c ("lib/crc: arm64: Assume a
> little-endian kernel")).
> 
> Finish the job, and remove the remaining big-endian support code from
> arm64. Note that the SETEND emulation for 32-bit tasks remains and so
> some of the mixed-endian EL0 helpers are retained.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

