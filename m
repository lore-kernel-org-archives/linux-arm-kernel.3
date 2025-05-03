Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D69C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkL1NNeq7oEi3af/roocrViMs79I9BYQiqbco4bEN2M=; b=SlCMAzdtTCpwURsFzfajiOQO5/
	87RjGPf9cz5pYseBIqxZnj7dnprS5DJXf9b24gDZSUfNYoFdHXLHVZzX4517VYsE3/MKP5OdCarrA
	gLRjcZVAw9EjFsAtOzWB4rQpB61AIkLguNFEdbxb1APEa5IcMbqAEjCVWcsPONMysQNdEhbZ6n7rn
	44JoXvdeI7A+pwJlyu/1OUSPbJSovTq/vr0MFtyZRz7Ak85+RNwFnaHbwWSOe/94icCLeUerwanm4
	tgr0RNBla4yLQoZfi1C0TPKBsKH0V/mPuIQ7qdfr41lAlSMOwGEgWo6EOenjBQAXdRFtJwIYzotN0
	9IjhXYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB8g-00000003onq-0xvD;
	Sat, 03 May 2025 11:34:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB37-00000003oSQ-2jT3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D0766113B
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E96C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746271732;
	bh=Td7Q6iRRCzPGbE1V9qO9rxXlsU90ebvGvLA0TcrLZDs=;
	h=References:In-Reply-To:From:Date:Subject:Cc:From;
	b=jBAA/NgVcSCwa4d91CxRJNziUngQEJ3+vLiGm6Uft3ofxBPr6bgWtm8MBVJumzLff
	 D86BThAyfnAZUOswVNfQTnbpHHJK87w5BBiV3lQ9+/FoaMY9JbXgtlYeOOngnubCmP
	 PQ6FPcMLnNZ7ohtZ2XG5CvfivC4K718fwjfwch03U6sf7Z2ELuL3scJTQKGbrzN/gL
	 63DJD56j0ahOT0Z49jadzeF77EscZOHN1ptNmu7ZgqsK0MIg1w9n/t3VY2v2F2VES9
	 0fyAC3LDzdKSMXn0q9CO3mJSH2m3DiG7kQ61T3mUwSYnl5Lk7GFzGkMEXgnAQtrkLN
	 aWWZRiXCbFDyQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so3606682e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:28:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YwW8YKVphuDFFs7YLhmaebrgmTq1p/1gNAcDA5MZDXAxax2icKs
	leXcj5qEhYa9DSAVQGDysUj6waS6QikI1O+lOuoc7sAyji+uNIY9IzdfEEt+eIuCadfJWrAOsxT
	yO2hS2cxCXrG4CPSOjcH0ceSsJBk=
X-Received: by 2002:a05:6512:3f11:b0:545:d70:1d1c with SMTP id
 2adb3069b0e04-54f9efb44d4mt195800e87.11.1746271730523; Sat, 03 May 2025
 04:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com> <20250503112137.1962910-6-ardb+git@google.com>
In-Reply-To: <20250503112137.1962910-6-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 May 2025 13:28:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFF_y9pJ+Nuy7-63LA79+x=pPOg5uHYB_RHP_4gRKhTeQ@mail.gmail.com>
X-Gm-Features: ATxdqUFQ7ucpjYLPLXveCPYSh-dH1vB1VaK13XEOetNi46u31OHmAGV-1WDuuMM
Message-ID: <CAMj1kXFF_y9pJ+Nuy7-63LA79+x=pPOg5uHYB_RHP_4gRKhTeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 3 May 2025 at 13:22, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> init_pgdir[] is only referenced from the startup code, but lives after
> BSS in the linker map. Before tightening the rules about accessing BSS
> from startup code, move init_pgdir[] into the __pi_ namespace, so it
> does not need to be exported explicitly.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h | 2 --
>  arch/arm64/kernel/image-vars.h   | 2 --
>  arch/arm64/kernel/pi/pi.h        | 1 +
>  arch/arm64/kernel/vmlinux.lds.S  | 4 ++--
>  4 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..6a040f0bbfe1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
>                                  PUD_TYPE_TABLE)
>  #endif
>
> -extern pgd_t init_pg_dir[];
> -extern pgd_t init_pg_end[];
>  extern pgd_t swapper_pg_dir[];
>  extern pgd_t idmap_pg_dir[];
>  extern pgd_t tramp_pg_dir[];
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 5e3c4b58f279..a0977f7cd3ec 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -56,8 +56,6 @@ PROVIDE(__pi_memstart_offset_seed     = memstart_offset_seed);
>
>  PROVIDE(__pi_init_idmap_pg_dir         = init_idmap_pg_dir);
>  PROVIDE(__pi_init_idmap_pg_end         = init_idmap_pg_end);
> -PROVIDE(__pi_init_pg_dir               = init_pg_dir);
> -PROVIDE(__pi_init_pg_end               = init_pg_end);
>  PROVIDE(__pi_swapper_pg_dir            = swapper_pg_dir);
>
>  PROVIDE(__pi__text                     = _text);
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index c91e5e965cd3..38a908d048e8 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
>  extern bool dynamic_scs_is_enabled;
>
>  extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
> +extern pgd_t init_pg_dir[];
>

Apologies, I hit send too quickly - init_pg_end[] is missing here.

