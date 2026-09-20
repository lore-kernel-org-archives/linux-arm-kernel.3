Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E570BC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFz3v1vOU8NaomwzxAGdCYY6k0C17r131s1eFNUPGok=; b=zH+HpBWqp+Khs7rujzUlp25NaU
	0Z41p2WLnCJKlDdJ6h+zGPMCQ59wXSn3qagHbV3lJt4G3Iu2zNpNNIGUIe3TJvlzREdqnKANzck60
	zM62debEeNOC0TkcC5NDV7IcMR+PyQxtZuVXNAciSlcqKqCvcWFCjPJGzBzRupAIF36qQou0fBjOv
	cs3/Lk0lbFnLcWzQap8TDEiEEhj0NHjZTmXpYEOyq41MDo3KoJPQ5alKBfrsotmW+2VmYB1hn+ATH
	ohguk8nK9S792Yt+USHid0CLZCFozDVFoQZodRwWqoN15tjxnZwZOgk6km8NdNNvoTxgFuDp5mWmQ
	3vtcIVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IlM-0000000HapG-2iFE;
	Sun, 20 Sep 2026 14:43:28 +0000
Received: from out-131.mta0.migadu.com ([2001:41d0:1004:224b::83] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IlJ-0000000Hanp-4B00
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 14:43:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gM4dLcKAjlvwqbcZzf0lMd4pbz2znaxfLkXxxOxgqjE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789915403; v=1; x=1790520203;
 b=KVvtzwhOiSQjNxu/OzOCoo7y+I8LoZN0c3ZP8m7YzArzU5ySm63WM0jF1vf86GBNmL0/ieio
 2Ozo0yNFqp29LNGvtRbWVYcRG+GrrzJHTYfgD6KVvokCiL8gL00/NJdhq3A8UoRcxO32aVv14PJ
 eU74tJijbO+nJM1L0JJKV2Zo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7db0e1f2bc964294;
	Sun, 20 Sep 2026 14:43:23 +0000
X-Mizu-Trace-ID: 7db0e1f2bc964294
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5606e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 07:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByo+eS5yG2TXTrPxUez97KDk4Wba/V+QOD+6lb577oww3HSBXSKfriZqwiNvwyJnvEeUTwjVBMN3dxIVP/uc8yH@lists.infradead.org
X-Gm-Message-State: AFuF++mzAu9euDlhXSesgyqf9xH2DRcHhxUVYIlc20etbzB0hSU5vVTV
	fFPgvQwWJwUuqPRRU3SYbpDwaIoNdOMoafBNPEXCs1lQ/5bVLI0lragvk/DCjdNwLfLqbQYEgnN
	B//byI6fCsS/TkmZdKbDU8pEhhSmJkDA22rXqAHwO
X-Received: by 2002:a05:6512:b87:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8c7eaffdemr82528e87.15.1789915402616; Sun, 20 Sep 2026
 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260919123150.3283606-1-maz@kernel.org> <20260919123150.3283606-3-maz@kernel.org>
In-Reply-To: <20260919123150.3283606-3-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 20 Sep 2026 15:42:46 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzm=kN6cUXtF6FEo4XSZkNj=cSUffCJ5YWHe5GjCxe=zQ@mail.gmail.com>
X-Gm-Features: AcwNN1UMc1fUZyuBAnLvsDe3WEmHsJtOO9PCxP2Icvg_OpPj2A6l7rmpgXfBR5A
Message-ID: <CA+EHjTzm=kN6cUXtF6FEo4XSZkNj=cSUffCJ5YWHe5GjCxe=zQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: arm64: vgic-v5: Correctly reset h_lpi_ist to NULL
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sascha Bischoff <sascha.bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_074326_198933_7B58475E 
X-CRM114-Status: GOOD (  16.31  )
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

On Sat, 19 Sept 2026 at 13:32, Marc Zyngier <maz@kernel.org> wrote:
>
> Resetting a pointer to 0 is not completely wrong, but sparse
> legitimately shouts about it integer/pointer mix.
>
> Use NULL as expected.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609190952.glUgOBvp-lkp@intel.com/
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/vgic/vgic-v5-tables.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> index ba8a8d5fcc2a3..d7196ed5d1bfd 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> @@ -1066,7 +1066,7 @@ static int vgic_v5_alloc_two_level_lpi_ist(struct kvm *kvm, unsigned int id_bits
>                 /* Free the L1 IST again */
>                 vmi = xa_load(&vm_info, vm_id);
>                 kfree(vmi->h_lpi_ist);
> -               vmi->h_lpi_ist = 0;
> +               vmi->h_lpi_ist = NULL;
>
>                 return ret;
>         }
> --
> 2.47.3
>
>

