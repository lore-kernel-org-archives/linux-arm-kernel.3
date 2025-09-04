Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAQ8/xlEfJm+udCC/3/iwD7fx0shSTS2qWwilQRSewM=; b=F9PZXy+aB8LcQ3iS8Dzlv/kBrW
	UM+Dp1WDaINeUesUCi9/8xb8dzveLzN4lB97n9OsUCz0mj+WsGYp5xZhwwJf7Nda5QxeQRCcHV1Al
	WFNmaA7BKcTh82yD5j6l+fuc8gzBXyMuJ1CpZKFmCkmzJvY4zgLkNmCPHBCGGHOLdqZzYYD/7RPJN
	ScQ937qHyRf1mWiBANY29D5BD7GSdhzCnj3Azmmi+AOhljEAy3GNliRD6+EwmNwIhoj8zcqL6dLXV
	fi/Dab7VLHQY++/1qlfbktboFuDDlIDPyvmVh+2o4NfuJ1z6OmhCGiDDgrDN8yfy8tbcgdJuZ58oV
	8X4zGtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0s-0000000Fy2e-2GoV;
	Fri, 05 Sep 2025 02:17:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEld-0000000DcLv-1JhA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F4DC60247;
	Thu,  4 Sep 2025 18:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58426C4CEF0;
	Thu,  4 Sep 2025 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010782;
	bh=vso1jcuXl4eMsNTY6YtZqzsNKfEUrShjwPxBJ8ib6Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeOB5sfg1L8tYWhFhqz2+8pjsUnTOpx9cXPDxNx51xZLJCftmeovcMPkXsRvqFICf
	 nDdAqQ76nV20Ej46lnDZ2exe/GQRuCAu/zDKenXuF52NkMVjkwQ60r605Qv2qk0LMT
	 yytrDQgaMSRzgSCACAUVeXN+IG5zpDuFZcB9Vhvs6HgKGjDUd1MNCUkNQdmgoqNuqp
	 43RQIvazYa3NVw8wSTiBAtqLh5duh+MB7aNAF/nnaIpXB0sZDWpWFEKQ4fp7JucklF
	 x9HuiqWcOi6CRtX6yjY5m/F1zA9+7sbwTErgFA7+xxzsaeuofVvBZfNlk839R4mCVY
	 682w7KI4IXfvw==
Date: Thu, 4 Sep 2025 11:32:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/9] x86/cfi: Document the "cfi=" bootparam options
Message-ID: <20250904183254.GB2110053@ax162>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-3-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-3-kees@kernel.org>
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

On Wed, Sep 03, 2025 at 08:46:42PM -0700, Kees Cook wrote:
> The kernel-parameters.txt didn't have a section for the cfi= options.
> Add it.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf494..8bbffbb334ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -608,6 +608,23 @@
>  	ccw_timeout_log	[S390]
>  			See Documentation/arch/s390/common_io.rst for details.
>  
> +	cfi=		[X86-64] Set Control Flow Integrity checking features
> +			when CONFIG_FINEIBT is enabled.
> +			Format: feature[,feature...]
> +			Default: auto
> +
> +			auto:	  Use FineIBT if IBT available, otherwise kCFI.
> +				  Under FineIBT, enable "paranoid" mode when
> +				  FRED is not available.
> +			off:	  Turn off CFI checking.
> +			kcfi:	  Use kCFI (disable FineIBT).
> +			fineibt:  Use FineIBT (even if IBT not available).
> +			norand:   Do not re-randomize CFI hashes.
> +			paranoid: Add caller hash checking under FineIBT.
> +			bhi:	  Enable register poisoning to stop speculation
> +				  across FineIBT. (Disabled by default.)
> +			warn:	  Do not enforce CFI checking: warn only.
> +
>  	cgroup_disable=	[KNL] Disable a particular controller or optional feature
>  			Format: {name of the controller(s) or feature(s) to disable}
>  			The effects of cgroup_disable=foo are:
> -- 
> 2.34.1
> 

