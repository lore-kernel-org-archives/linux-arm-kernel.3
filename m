Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C96CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vna6onQ17GRMJdgDqCCzwoNwGnMVdyQrXYBFE4uxe+E=; b=tZJ6D09ZG+GxkF1sgXXZVp8xvi
	3qxYXUM9dWut0fxb2k+2KTqaW163HjO6x9qLhYuWzwidnGFMel5/CbecUWz2UOuk6P01VQjQtOfwh
	uSbHd9QF+1dUsh37AJd1vvcJesibxmQu8GDCvfmQxdxmRQWeeczLdKogcBLb1Ux9n7XgoEE3RRWm0
	s1Skx7WnO/uKhZifjlOsWuYMH1JepGYsPDVQ0P0QI6gvXaqfjyFI7icLvL+FBwqjIUQX4j6qOv0Dt
	lEb8tF02q4rDby146GUpzhkDg7LyBKiA2EXzDuwkQCaU1COHUQBQt7koJXrF1MQkq6TU/Z768+tg0
	3U2U50Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pdb-0000000BhXY-27LV;
	Mon, 22 Sep 2025 23:08:03 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pdY-0000000BhXD-2OGh;
	Mon, 22 Sep 2025 23:08:00 +0000
Message-ID: <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
Date: Mon, 22 Sep 2025 16:07:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
 Han Shen <shenhan@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250922224835.1918759-1-sjg@chromium.org>
 <20250922224835.1918759-5-sjg@chromium.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250922224835.1918759-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 9/22/25 3:48 PM, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Regarding $subject, a comment in scripts/make_fit.py says:

  Note that this tool does not yet support adding a ramdisk / initrd.

Is the comment incorrect or are you changing that feature here?

Thanks.

> 
> (no changes since v1)
> 
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
> +endif
> +
>  quiet_cmd_fit = FIT     $@
>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +		--name '$(UIMAGE_NAME)' $(EXTRA) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)

-- 
~Randy


