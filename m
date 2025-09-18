Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11ECCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOThQ1jAOLUYY2vDsnxKWr5sRzeq50o0dQty6fZ14rQ=; b=MGQ9stuxYxPcgNHSGqaXxMVjgp
	O7BkJELvAedTRfy13YVBX7BMYcMzPlIBV9bjAae30LX8Y1JB8b8VVNVeLRgDc9PotGaW1OSQZ/uqh
	EtmX9JxEXY8MCUNyDPaeGfxzppZJDLgpFyMmb86TtZdj/q9+/WMZdN5LbZROOndQyAjBMsJ7cWeeh
	in5YsF0lCUVMUpsPPQ0w7P8pe82FhrgqjlzvlWsETYolQjrrH4jKtfFn44ppYFd+mrLsgtaSJ3miL
	OQVenXREQESJRwsjcJ4kxbQmU+xnL4wnW0dggmOpr4Sefb37B7gPrJ5e6c90wDc2LaaHZD+CmhuhN
	zx3edVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD80-0000000HGNn-1cTv;
	Thu, 18 Sep 2025 11:48:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD7y-0000000HGMn-31tz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D81A36020F;
	Thu, 18 Sep 2025 11:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8F7C4CEE7;
	Thu, 18 Sep 2025 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196121;
	bh=/GS2pi0BPhylD1m4PDk3EtPIv0KWtd8YNZ8MMg1pVkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afUQKMJe3SZLc6Bp48RNJW9wskTebguMeMhbdotT0nsxBGAcS1HoUw2x2+voUrCUL
	 2hmNJ3tq26QDYQ84qBCcX6kBuH1IWQVDajTU+S1GAcHxBIy6wfV+ZCCqJSWdUta9RR
	 Ge0px/b+idBZT2BMlCVCTw9myHppianrLaXtnHTbgEhSlFag2bxRGqmaCmWB8f8uLX
	 Mh0srkBkFOp+1sbDwS80Ugnpk3zV6kQqaj6gcCkTNGk272pV/NsoBrJKsPsGHGqZCR
	 P/GSwyvyLSip48Wh6Elz+LqNSRlTBZrGtsiwI7o8JMUlXiwZNoddrbJfa4CuSXJz9w
	 iPf1DTrWIe2qA==
Date: Thu, 18 Sep 2025 12:48:35 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Luis Machado <luis.machado.foss@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
Message-ID: <aMvxkzg_LT4C4Quh@willie-the-truck>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
 <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
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

On Wed, Aug 20, 2025 at 07:29:05PM +0100, Mark Brown wrote:
> Currently it is not possible to disable streaming mode via ptrace on SME
> only systems, the interface for doing this is to write via NT_ARM_SVE but
> such writes will be rejected on a system without SVE support. Enable this
> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
> writes currently error since we require that a vector length is specified
> which should minimise the risk that existing software is relying on current
> behaviour.
> 
> Reads are not supported since I am not aware of any use case for this and
> there is some risk that an existing userspace application may be confused if
> it reads NT_ARM_SVE on a system without SVE. Existing kernels will return
> FPSIMD formatted register state from NT_ARM_SVE if full SVE state is not
> stored, for example if the task has not used SVE. Returning a vector length
> of 0 would create a risk that software would try to do things like allocate
> space for register state with zero sizes, while returning a vector length of
> 128 bits would look like SVE is supported. It seems safer to just not make
> the changes to add read support.
> 
> It remains possible for userspace to detect a SME only system via the ptrace
> interface only since reads of NT_ARM_SSVE and NT_ARM_ZA will succeed while
> reads of NT_ARM_SVE will fail. Read/write access to the FPSIMD registers in
> non-streaming mode is available via REGSET_FPR.
> 
> sve_set_common() already avoids allocating SVE storage when doing a FPSIMD
> formatted write and allocating SME storage when doing a NT_ARM_SVE write so
> we change the function to validate the new case and skip setting a vector
> length for it.
> 
> The aim is to make a minimally invasive change, no operation that would
> previously have succeeded will be affected, and we use a previously
> defined interface in new circumstances rather than define completely new
> ABI.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/arch/arm64/sve.rst |  5 +++++
>  arch/arm64/kernel/ptrace.c       | 40 +++++++++++++++++++++++++++++++++-------
>  2 files changed, 38 insertions(+), 7 deletions(-)

It would be good to have an Ack from the userspace side (GDB?) so that
we know that the minimal ABI change you're proposing is sufficient.

In the meantime, I'll pick up the first two selftests as they are
independent of this part.

Will

