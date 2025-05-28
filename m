Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95109C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfbvcUyjsrPaltQIZdnZTuOiypSudH36zL4/KM7+5qI=; b=sA+bekW1AumQ7vKtMtbVhJ8M/3
	GgWWBfRpiUZlONJz+t/IU7DKTeYD7+1F9OBhgrReu2A4Jk9giOTUqwxXJsJV/9HM6nWyjYh6vtRIk
	CRUdJns+ZeHzyDcqnnv0jGMBnyt/9aoinXigZeFPNKmUGYsmvtmo34/iolZBhcIoKvlJNQwLdxZmT
	QGlPUfyARKtmDrEFRYyuo42PTi7NotqdefIGfSUxI96RGHs+MDdtDF5Bc+Cx+3T7r4mA7jNup/jaV
	lJe/dv8fBt4KTN9+n/3/6XdTbsusgi2cu6avZdlzk/mIw2fkpJMltXLLVtro3DXxFmdDFUXdi3YL0
	IA8ny4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKsa-0000000DrMj-444w;
	Wed, 28 May 2025 17:47:52 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKqR-0000000Dr2b-2n6i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:45:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55320ddb9edso4044804e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454337; x=1749059137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfbvcUyjsrPaltQIZdnZTuOiypSudH36zL4/KM7+5qI=;
        b=duLndEfj2bDb/F0z+GFEhmyoT4c3KN0bZOTkrhQ7WERgrsaLmTHQ4XeIvWk2zlOfJN
         hA1joGzK8vaGsh3OLuQw6PGvC1lUO1mpnTqCl4daHSAgSJIyjeUF4+iykKbI8AV/BTGw
         NnZbAt0unKxzVfl3JrFuIGH0GhlO9ELQlnJiggtyNdS0Q7l6sFPOds91q778XEjLRYu/
         dWywo9O1nqV+iNRpmSBySONekJzLfVRT1t28+amipcG2H0D5NaJLY+lkZr+SnTZBoXIc
         LzuUnnyrCv4c8L+TSB94Ge2HBXDWGX/bcWicIknQSYZh184BNLkziLOHb2sovN26oR0v
         eQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454337; x=1749059137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfbvcUyjsrPaltQIZdnZTuOiypSudH36zL4/KM7+5qI=;
        b=mB/75/MypjQJokmnGAt3e2NZ/uZruovhw0pt468aVH3Eb1DfMiTVaCAweGBlKkOkTy
         LQ9/Pxs4nKv2ilo5zP5U47A4BFUbntNW2uJEZWz73D+ZkigJmfCN1gfUDgqPHQo27Ecp
         TBnFmasZuOwc/E5+hlY3fLLFKE1iwjqGRx+SlIvxJQy/fWZRlAln1pa2Xxzy5Tp1unxj
         kwK2g+sZZ/HdFbFpX651umut7Pzr2v9w36MVpkOSsrZ3EgpWhWphz5IC7g2c1sfT3KsM
         xFG72CspiWE6OzG8OUQ0dGGkyArK8yGVQzwpjMsIYjWrv3j7v2lEi+Qu8d5x1IEwi995
         0AdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMelB6CFfycSaZRwkbaS+EK8FRO97rS2/LG+dbaLw4x9AWSznpxb/imokkU9so/vxVQfdQ9e9qSvuGGr0/I93r@lists.infradead.org
X-Gm-Message-State: AOJu0YzZLLMkT1xOCcTaca3dQEc5usIqOyJvV3IbjgbxzZmZnvzcQLdm
	kRf8y57fk1adLZK54QGbCOBMch56e+/mm35q9sxJ9gFbbCr0QWOqujSMPgFdbrOeX/pNCEuv1QN
	Ncih0wBdmagVMus3Q+iHhkdF8nFI4XeE=
X-Gm-Gg: ASbGncvTliGdMwpMMzXIAAkup3XMFyVssQ9F71qqfZri6P8HLWtS+1zw+sn34rU4dVT
	gUKhVVBAmjITZ/8vBxsS6Gwm/ILLsoMT7iqag+oun8cM+PecAPMM8zHWd63DAw8EKuIqKddCwO1
	Umv3x/ZeziAE1jMUbNH/1m3fpCvIchmWl6Czn2nC8nGS0=
X-Google-Smtp-Source: AGHT+IE50d5cC46kRAB7AG1Wvgv40PQ5flcgNy54WFeoBt+wY7VUUu4UH+CR4hMgrhhgp1YCMK5/SyewZvJ5ZJUiAgI=
X-Received: by 2002:a05:6512:3e04:b0:54f:c101:4c04 with SMTP id
 2adb3069b0e04-5521c7c47a2mr5617350e87.46.1748454337119; Wed, 28 May 2025
 10:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:45:23 -0500
X-Gm-Features: AX0GCFtw6EOz4hp5YkRpjgPCO_GRJV-z3wAN2pksjWiT0dZd5iq6XbMFR1v4t8M
Message-ID: <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_104539_701986_1F8AB617 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, May 22, 2025 at 11:11=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0f1=
c2ad69d6e5c14f2 100644
> --- a/arch/arm/mach-tegra/reset.c
> +++ b/arch/arm/mach-tegra/reset.c
> @@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
>         BUG_ON(is_enabled);
>         BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SI=
ZE);
>
> -       memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
> +       memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
>                         tegra_cpu_reset_handler_size);
>
>         err =3D call_firmware_op(set_cpu_boot_addr, 0, reset_address);
>
> ---
> base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
> change-id: 20250522-mach-tegra-kasan-fabd0253f268
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this patch.

Sincerely,
Aaron

