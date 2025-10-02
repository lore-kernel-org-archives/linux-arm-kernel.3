Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC708CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Uj9FM5clOLtUzSXyp80dd6UmDG652YPftBE2MTbIdM=; b=wuu5hK7+gxMGg338IagvElCNS5
	3s4elYOz2MyapiuoazReyff101jFEx2kiOPg7/PU0UUT7IcJIdhn9yWHrgVdVTFJ9r9Y2glkOE9K7
	fLU+o41cuKDnug35uj5zWOf2u3o0ylITejWEw51Tf7m3Lof2amm7xT9yJXqUmxOpPK0W97MF6TT/R
	YuZjr1kM9syGRHj1SFJp1Br1sMKd79LkLDmHR+rOuv27xNPlMRqm0X1Y9tX/qn4fn3+M9AWG2QPEx
	a9dlg+9FvKdNWvA3H9jPuFqz2ccCOmdCpiTZlXFSwLZCwE+MR5gxJP6JKltwJvLvP+bZfFltvjRph
	hkH+OVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M0Y-0000000AnaW-3k2d;
	Thu, 02 Oct 2025 16:18:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M0V-0000000AnYo-1zMV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D50143240;
	Thu,  2 Oct 2025 16:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDC0C4CEF4;
	Thu,  2 Oct 2025 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759421895;
	bh=haU7UA3i4VxOH2x3gB+UMfWD8mNozTHeaUCvV8ZhUxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBmlw+YWycUFfd6+awCdzyisCKm2spoUtagB+p9j/yRzbVr/hhvDwBU/QAPohipeV
	 msMFYutoNwZkH2eh/72ISHoSdFbauACTHfh0ZI+kSuPCseSVrpTWw3EPBLOSdswDon
	 E9oo9Uc2zygnGmelyniEKiDwLM/UccJGeuLmpwBW+Uzgcr16ToY7ptR0r8JxGGb1ih
	 +iUUdzgAWCUmBY/F892FlqueGw+hCN6CnIEUrYpzKId3//HeLkbWfwvyKYHYdXo9as
	 +PT6HHOjsGtuTmyQRmG8rCnye6L5V1XBCSN6dvssFqFbC4P3sLle3yRgAdjVVkTqLz
	 fx5KB23rMjLog==
Date: Thu, 2 Oct 2025 09:18:14 -0700
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 03/20] ARM/simd: Add scoped guard API for kernel mode
 SIMD
Message-ID: <202510020918.AEFA1A195@keescook>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-25-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-25-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091815_546137_B46F0EAE 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Oct 01, 2025 at 11:02:05PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Implement the ksimd scoped guard API so that it can be used by code that
> supports both ARM and arm64.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

