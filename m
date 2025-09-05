Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77135CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5RJXFea8ndfHs9aq0d2i0sVtCnfADu29aungLwCDso=; b=BKPC8YhmiLrgsR47zeT7+3MB9T
	IXtyBWX5WZ0dBQnSkWGVErcWNbdm4MR6IQYNw8k79V2QeNG4Xkx2nqnssjl6kk0l/JVIFSuD15Xu7
	8nIHDJOvPlkb2gxoIrBlqHOPY7KOXNqeEata0KObnMsrVOdXnNfr+tDOZhMubWXO+/RKH3NwOnC2R
	em9B/uMjJiGRyEqt+xoZG3DoM34aephlsgZE1fvJCe4FDFIwcLuoB1euUNGFIIs+x+bvr7DRVOoB8
	2vBcboSAtXu2X4qoxCmASdd0Ri1adwFgo0lAGCbevEHoI2y2uSQWr7GlltGX8SeUi4wMtUG5EgADL
	BtqRw+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6l-0000000G66b-46DM;
	Fri, 05 Sep 2025 02:23:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuKVA-0000000FaDM-1u3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 00:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 260434476B;
	Fri,  5 Sep 2025 00:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE906C4CEF0;
	Fri,  5 Sep 2025 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757032828;
	bh=+3l6yKvd05iXLIoZppQn0j3GKV53Ox+OtDsfhcT6nGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZWTvAgErao4FY1wz0MbUvxDtg+9XB/QGFLfYldri5vx/62b42/96v25vaisgnxZm
	 nqUNmT3vaOelJ/72zzlaIV2Lt83k2hMV+5Aft6kpYvdD5Z75hA0kqEvqRWylPMwYZq
	 SFMVdTSHt98dG4sK44fE8HvMSZ2+itk3+Z7hy55mfL3vUNhWgCxEpDhz0SIpCKjA+C
	 DSiUFPRSxsVZHeYPBNpGPXzlIZp+EGLKQG4wWGmd+I4L5gDqUU6EKiV2a8+1AYjDgd
	 07mlrSfsqMHrfMBzAxO0ohHS741YkFhdE++oW4hkLjP/GpE5D5JSz5ktXnStrE2BSC
	 u3KoM5aksrdJg==
Date: Thu, 4 Sep 2025 17:40:27 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/9] x86/cfi: Standardize on common "CFI:" prefix for
 CFI reports
Message-ID: <202509041740.1A8F3A8@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-4-kees@kernel.org>
 <20250904184004.GC2110053@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904184004.GC2110053@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_174028_513499_4D0B92DF 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, Sep 04, 2025 at 11:40:04AM -0700, Nathan Chancellor wrote:
> On Wed, Sep 03, 2025 at 08:46:43PM -0700, Kees Cook wrote:
> > Use a regular "CFI:" prefix for CFI reports during alternatives setup,
> > including reporting when nothing has happened (i.e. CONFIG_FINEIBT=n).
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Obviously minor but I had pointed out on v1 that there appears to be
> some inconsistency within the diff around capitalization, "ignoring" vs.
> "Ignoring".

Oops! Sorry, I've fixed that locally now.

-- 
Kees Cook

