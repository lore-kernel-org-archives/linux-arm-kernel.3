Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh3v1Ouyt2/LL0f3ahZVxJ6mw6N6zXyY0nD5+7NxUoI=; b=OlhQDS+O6UxhCQhOtQfXH5//1y
	qtEH3hCLTIysa/Yky/N/bsWF733kPXM9jrhL0qcjaXnNenzXL1CX4Lpaq9xImEJnKZoxdG3dOelxZ
	wz2mhEoY8YrLmfdb3dIsFMGCUWqQ9Xx0oZKbK6qOotqPYG6RHfScGs0wZVgSs1RsSFzSmfuf9Ild2
	bydgilw4C20Wgq2lWuBR8qzue+8Z8kgwAxZ406KD1s5sqT//s0dOWwUJM99mRPj2qRm1nsQqV8qHu
	3x6FfahTEiWpWqRvyBKpXeSAv8dqxKgb6qHHfNBhH6FLtKvVEdm0atSIkkePzaHSbSLK3GM5WM+rM
	bziTa4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWlY-00000004YQ4-0RHJ;
	Thu, 30 Oct 2025 17:48:52 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWlV-00000004YPg-1Yrj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 17:48:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3b27b50090so227601066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761846526; x=1762451326; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rh3v1Ouyt2/LL0f3ahZVxJ6mw6N6zXyY0nD5+7NxUoI=;
        b=J+h/Q6M6ifDCtM9NlbFcsKjHEe74Dotbqu2F/6yyaFYc8gyZiORasgAmG7COz9DJmX
         Hm8oFTaGk/GA03S6aKO95WqQd43wjquj8YXC5hwtWyPua7eUjwNwHMmuAp68UfeDAGGd
         ufhg60cO7r/8KRDt46w4LcV1trg9ryNfxB/pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846526; x=1762451326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rh3v1Ouyt2/LL0f3ahZVxJ6mw6N6zXyY0nD5+7NxUoI=;
        b=OOqDzmFBjv3E20dRTaogNKmGdK1n1rjZlF7YeneSq7Pb3tggVb68Vqgxfy+Yc/ECH3
         xfTCwhuE7U/SHxv4YDmJobbEPWxAHUgIMBqH+sR1Y9BhfJofvUFn+u3+c1WwvoUUgIu1
         JwNpddOyWr/KlKeb66ZK6WBjJzmWBbEPFNQDial0mLt0Qejvv3Lm/DKZ2qt7YnmJsV+m
         89dLznr7V3an4DnelksResdXjr5tZxS2/Vl/aCFJAc3IXK0QMPcTmG4UbLyWbuP+JlQN
         vXWauGq1QdpgfiTysqgAKEDZUBrciWxqxgZmQ7w1hMkOsG2X6ulyBrj3YuBR/+1Kdlz3
         8d0g==
X-Gm-Message-State: AOJu0YxSKPetA/weIczrUKPO4PARnz3AZXwXdWUpd7w19OZYFpTFIoYj
	HuHJ6Rpvm31PtQ/ZAADUPB12H0Vk3pRTdHFLkit5BLvDQ2QWnZItuk6JY05jC/P+3TyAvl4NZOs
	cyPFWnqJRoLevviTKc3pTpjOfSc6ZrU6A/+IbkzcG0lumDI10oq/rPlC3EmM=
X-Gm-Gg: ASbGncvpwnCX/WouHQabvrF3oaailmL36PRpAVwD3rRGyB3IXl5bdOTdo1M+xAucQFN
	ToGyqRL9zBtJ95RkanUCW6IAs7/jipedCkQOq5YFwm4CaAnoPWPRf54Lyaj6C8vDYjXPyHWWcym
	8lnhG1CxelRGWsOB+L1SYikBo6JVM7xvbjVkxiwtYxlw1UmVSmPfdmL5sAdqBRCDaK/mDVsH6lL
	P7yIWNwUnanEy1+b/pKnRhwWamygNzpEUxJDe/JcXxBjBXgbGDt65YO25gT
X-Google-Smtp-Source: AGHT+IFqQURgiVVoko3shKC6Bba8izDNAkvb/wrfoTaAwLNWBZJOf02mJMQvX3esqCeLaHeNf9hngmACT/ffLDzYAUk=
X-Received: by 2002:a17:907:96a8:b0:b40:8954:a8bf with SMTP id
 a640c23a62f3a-b70700dc258mr41404966b.2.1761846526480; Thu, 30 Oct 2025
 10:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251006230205.521341-1-sjg@chromium.org>
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 30 Oct 2025 18:48:34 +0100
X-Gm-Features: AWmQ_blfeBNw3Xuud5_t8lUhFAGElC9C1cTXKbT5FkRt30uiLVTs4DdYWXfmWS4
Message-ID: <CAFLszTibSrTwhGaRZC5HF=UYnsdi8q0j9pyNbEL7jKSnYd6hBA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] scripts/make_fit: Support ramdisks and faster operations
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Sterba <dsterba@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_104849_457634_F1CFAB34 
X-CRM114-Status: GOOD (  25.00  )
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

On Tue, 7 Oct 2025 at 01:02, Simon Glass <sjg@chromium.org> wrote:
>
> This series updates 'make image.fit' to support adding a ramdisk to the
> FIT, either one provided as a parameter or one created from all the
> kernel modules.
>
> It also includes a few performance improvement, so that building a FIT
> from ~450MB of kernel/module/devicetree files only takes a few seconds
> on a modern machine.
>
> Changes in v4:
> - Provide the list of modules from the Makefile
> - Reduce verbosity (don't print every module filename)
> - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> - Use an empty FIT_MODULES to disable the feature, instead of '0'
> - Make use of the 'modules' dependency to ensure modules are built
> - Pass the list of modules to the script
>
> Changes in v3:
> - Move the ramdisk chunk into the correct patch
> - Add a comment at the top of the file about the -r option
> - Count the ramdisk in the total files
> - Update the commit message
> - Update the commit message
> - Add a way to add built modules into the FIT
>
> Changes in v2:
> - Don't compress the ramdisk as it is already compressed
>
> Simon Glass (7):
>   scripts/make_fit: Speed up operation
>   scripts/make_fit: Support an initial ramdisk
>   scripts/make_fit: Move dtb processing into a function
>   scripts/make_fit: Provide a way to add built modules
>   kbuild: Allow adding modules into the FIT ramdisk
>   scripts/make_fit: Support a few more parallel compressors
>   scripts/make_fit: Compress dtbs in parallel
>
>  arch/arm64/boot/Makefile |   4 +
>  scripts/Makefile.lib     |  10 +-
>  scripts/make_fit.py      | 264 +++++++++++++++++++++++++++++++++------
>  3 files changed, 239 insertions(+), 39 deletions(-)
>

Are there any comments on this series?

> --
> 2.43.0
>
> base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
> branch: fita4

Regards,
Simon

