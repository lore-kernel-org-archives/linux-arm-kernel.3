Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W0sv9jGI;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hZ/Ow0ro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=22OilN3OWHAsf4ZnKYCUCqyoE4jo68G/Rnat5EPiPAs=; b=W0sv9jGIu4inYY+TpMg1TGNGD2
	kUTsXszIV79QpJApiqLzfyKOatj9Sv01uK/eTa0Hm4qnlYvooxKE2FYZUSuem61dPmdmZBNl5lnXq
	uIzw7leokmR/T2Anw0vCKDUsZNOpeUQDYH0kzISyvAirIMnh5xdKG7LmDGLVE284iMRMn9h/53gB2
	gDeon18WvOU+ptzqFtSoJNmj2K+teDPe40olpLQ9I8BQGqWIwLt0D2PgSt8xB0L2Nb0H5d+EdRqtg
	d43EUWsPZKRpCyzJetZdck09Lgg/G6A4vLIJK3s2ba5Lw2ohoyPjDHo/mw26QvN0TRUPBOeC1E9Ub
	ZE4govpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfqd-00000004Xvt-3rKn;
	Tue, 27 Oct 2026 12:00:11 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfqa-00000004Xv8-1h84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=22OilN3OWHAsf4ZnKYCUCqyoE4jo68G/Rnat5EPiPAs=; b=hZ/Ow0roMzSE6yS/Enuvr71b/R
	dPnK8+fdUYq9MNWyNw3mFA9CBhIs0m1St9Yk2Ddl1mOzI0ghUTkS5l0LOyAgA489QRwVzkXufKIF/
	tRzXxd419Nq5fXvU35Yr6bMft+1/iuV3bYQ0gH7kOQZTa17H/fO2V7fckLIlE8ZfqQgYLxI/6Gw1Z
	wv8/3NpmC2nyEaPvJRvmLMCXtMFPkjBH2xJrZgLNn1K68bkfU0CidLRudY0jFLqozzH19UywHckQp
	4YqXz43UaUzygXk5AXuyPMku/yNa8IvggNT+rHYiZH10lYxKZqb+smsAoShzC9bYA4lngzg/WN35f
	BG04PZrw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLfqP-001RTE-0X;
	Tue, 27 Oct 2026 11:59:57 +0000
Date: Tue, 27 Oct 2026 04:59:52 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auCSG2OmNMQKp3dq@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_050008_454101_1151E62B 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> 64K as well, we have enough room to keep cpumask on the stack, avoiding
> extra alocation and possible performance penalties.
> 
> Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> page kernels are unchanged.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Based on Will presentation at LPC, I've decided to have a look at Meta's
> stack usage, and I found that this might be an small optimization!?
> ---
>  arch/arm64/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5f2db2cecf9772..b73371327d2a47 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -111,7 +111,7 @@ config ARM64
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
>  	select CPU_PM if (SUSPEND || CPU_IDLE)
> -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES

Does this one sound sane?

