Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54033CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra84b5TQcvneIFEng3d2XbPMhEj095xAOBIRrzuXxN0=; b=AjGjwNqHKkKIH6NT+KVNq0gLFf
	LjY3WqkcsjeqIndZo+t2UA7eO8Cwx2tKTbR5KVJ8lO1YpIQMF4g6foKkMMK1M9D567SifQ+lZC/H4
	AFCg94DeulI5p8h24y4jHUE43Ku4dvI7SB70DNX0sWQ+2yM+2UnMQJ/o2pZC0ze1lwxgf27OsDZk2
	Txq9yPSWveIkZ5gjvWECrOWt4ih0RYkjdwAW7qasr0iiGGpUOOVH162o7rxV+GjD2tQY+zXjd/UDQ
	pitYtjeIK4SjGxMPyhG4rhLanb7xXGRA3ueiDli6U2WL4NSZxuktTqOdMNwFCCqJoMr11CnEA8zde
	qEDAaGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Slj-00000001tEA-2AI5;
	Wed, 24 Sep 2025 16:55:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sli-00000001tDz-3QQY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD52601A7;
	Wed, 24 Sep 2025 16:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA2BC4CEE7;
	Wed, 24 Sep 2025 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758732901;
	bh=ZSuvPKo4zP1BolcgaK42uPifYCuhAjff2p5QUMlhvj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXNRVo90ZhjkmSGghzeTg1AwA9xcxiXQgqZpgm5694xcVDh65DWhbtAbUuhvC4kW2
	 S9G9l6hbYLvXkhR22gbdk2HIL56L42VvBvOoDLKFBJsSSHik/yXb5ga0Hdc85cVbfp
	 9jyZRYcEt70BjMBoUv8akRa2oY1lI8k56rOqHlCCb21jS2T2sxXBfflXO/31EzPRbf
	 /3DgBIfF8p8LJG0whLwQzeyC/17xUvzlLw8l5G/UO3K5Et7wSie3pYZBhCm0pXCBxd
	 Nr3u4c2rFgOBlW1liOJDY8TUbC5O2PDnYRB8S64t97UTzCvygkoORljvPSPHAS9Trp
	 hqFj+McS5Oc6g==
Date: Wed, 24 Sep 2025 09:54:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
	Han Shen <shenhan@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20250924165455.GA1445061@ax162>
References: <20250922224835.1918759-1-sjg@chromium.org>
 <20250922224835.1918759-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922224835.1918759-5-sjg@chromium.org>
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

On Mon, Sep 22, 2025 at 04:48:32PM -0600, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Acked-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/Makefile.lib | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..2e880d9b4706 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to 1 to include an initrd with all the kernel modules
> +FIT_MODULES ?= 0
> +ifeq ($(FIT_MODULES),1)
> +EXTRA := -B $(objtree) -m

Not that I can imagine it being a big issue, it would be nice to
potentially namespace this variable, like MAKE_FIT_EXTRA or
MAKE_FIT_FLAGS?

> +endif
> +
>  quiet_cmd_fit = FIT     $@
>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +		--name '$(UIMAGE_NAME)' $(EXTRA) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> -- 
> 2.43.0
> 
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> branch: fita3

