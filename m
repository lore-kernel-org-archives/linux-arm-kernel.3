Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orfqhePTt864TwXd0y7mMCx7h+37QCaNSXYmcrPpwPE=; b=JUrJnQL2vEJ8fiijGU6pdMQlKW
	cDN8eaTPjgulrYL6dUmRdTV+ZR31n6gU5cocNYa7vbSVQN643k+bT4OxYij4GmTxYD/JEKLb+Ph+b
	DhuhQYiFdOog/8bQRQd/TtyZ93v70dqJlxWy80lGPLIreW4DRN+OTY0HDpGlXtNTmZHUS+lOruR2D
	ipTZKMk9NU5l8xyaaW204fyYYyO5TdTvnMZAAcK+54KOQIQKbF8q9aiXKD0ZzUzRAZwdOD91L5Ma/
	jvrDr2QEytiUFPNUwYlm51pODzOlOG1zqyf900DSbN/VPRYt257IKW6nY8EIoE2Psz/EkMvBAZHyY
	Dv6HRjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCOk-0000000FLLS-3cJM;
	Fri, 27 Jun 2025 16:57:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBI7-0000000F9lP-1y1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6424A52FAA;
	Fri, 27 Jun 2025 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB37C4CEE3;
	Fri, 27 Jun 2025 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039222;
	bh=I1Kjg+gL3ingyZn5ujZcZhklntHmZ3I9mCGn5wHYCEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTkwzaUaAGWP6lK2CJi0YrZA66T0bNN72G3qbVW6mYfuMQq+JnHOPVIgt12IzrAkK
	 kDKb/6DSLr8mR4i/nOUmmcyakusygjAl91GAsdOXIfP9KF4+2TGZ6fJzuNbjvt9/Id
	 d2j58y/jqY9Nm4B04JxfO0clkLpSu4WwfvhuX2D0UQcUV4AP0rcMaa2nBaBLVT5bRY
	 0PZU4oqLDTqWmcKLJJxOudwcjgcet+eLuHSGfqbGD6bbkxNKId/peYml6SrpK5jrSx
	 /Ee+770UAbLTZND2nGkE4gifZCfyDtkdVmiOKnh8OR2W+pq+ThA68A2b9QaTJJVW9u
	 iX34lPuNeycaA==
Date: Fri, 27 Jun 2025 16:46:58 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 10/13] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <aF688hkOJkflz2dg@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-11-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-11-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084703_573435_BB19EB48 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Jun 20, 2025 at 10:12:04PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> Hardware watchpoints are the only debug exceptions that will write
> FAR_EL1, so we need to preserve it and pass it down.
> However, they cannot be used to maliciously train branch predictors, so
> we can omit calling `arm64_bp_hardening()`, nor do they need to handle
> the Cortex-A76 erratum #1463225, as it only applies to single stepping
> exceptions.
> 
> As the hardware watchpoint handler only returns 0 and never triggers
> the call to `arm64_notify_die()`, we can call it directly from
> `entry-common.c`.
> Split the hardware watchpoint exception entry and adjust the behaviour
> to match the lack of needed mitigations.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/exception.h |  2 ++
>  arch/arm64/kernel/entry-common.c   | 31 +++++++++++++++++++++++++++++-
>  arch/arm64/kernel/hw_breakpoint.c  | 17 +++++-----------
>  3 files changed, 37 insertions(+), 13 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

