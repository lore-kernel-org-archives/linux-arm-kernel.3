Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3203C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 02:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UU8XfsKdZOTCL+H3Jlqs5OHysAuY7DtAW63ifuR2gGM=; b=enzfzu5N+cHTSQ0bK1qUa6Ln6M
	hOj1OsxV0WG3BOOKnLAdjDOei08F8PFcefjBIRIR7BhTPecY6xiqWeIn/xyYjcceNdSLYn5aZxY0E
	E5O6fpVAlu9FfwZpp/GYy/f3qhl6XNqlI1XvXjKbytYCAsExuGxAXPvoIPYXowpuIpDGyG7X0/yXf
	TivmBAtoNNY7GZ97+KWxotw/5DM6/5i2gKrRDDKtejcE7zhfAWQ+qWUn7/qaVBNUXl25fMFwGA+35
	+3rp22gs5ePFKOIT/zyFvOjvE+aZaRAFPtT/0BOh7IxJ8dkNjLcmmiCKcSwZ5iDEbuRA43NhlF8vf
	4RJGdSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjUJY-0000000146b-0l7R;
	Sun, 16 Feb 2025 02:23:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjUI5-000000013yO-1f0c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 02:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24151A40AE3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC20C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739672511;
	bh=89f6kjxXBtZAaNt6NCCVp/SV2zvdrtocy+P983Rdy88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3fylSSvAsnYH15ydUFS+r59N8y3bLbLFqbqACryAQfsbPwavz5g7jM0RcLMdcDtF
	 karFTM3aFOEIOi+smeCgIPWJx5TuDvcDft0+zLgshVCZeMvGd3cBnVar18mNGYIewZ
	 5giB+H993hrvDHnsuZyZw8GnSLVg6ZsFTAKEMiBZJTpCVLu8gyj0Q2qSfpiDRnJBpu
	 tfG+phyvg1zKmmtdze0tdfo5PK+eUswmvvgpuJLrtdv1LLUuDZRpr1VlK6GCKLnXia
	 BoQ4PpzouLkGmYqMKQUzrsUg0ZtZ6FAu1ZpKSBhE7o7lDhQ9oBu+pHMTqthW0lOYLu
	 vz4QuUvrxcFXA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso622988a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 18:21:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaxfyZF42a6Fb153cOky96phU34k1dyYuld0rvSoreLspSHE7FhsOdD/Gj+3Oe77UNYlrgV8Oz+4fNzAi7hk71@lists.infradead.org
X-Gm-Message-State: AOJu0YxGhMOS0yTjZgLZpSL3g36MoVhJ7OlbJ6cK7HwoXo2PvHy90TOe
	HXNlrwRiw+F3tVDXLZG/E4OFCg5+kyiPpTdgEPZiKuil30QlmxSe038PBD+DX5KnqWV0b1DXEdO
	PETdH8VmXJlPXCzmvvfIHkApc4TY=
X-Google-Smtp-Source: AGHT+IHv+Clf+CXzjqX5DyVc7sIti2vAtNeryj4NmNK9lHofxSOPkE/OLkVPxMWDbiNC8PccJdCN2jloNFjeFePjtcU=
X-Received: by 2002:a05:6402:27d3:b0:5de:c9d0:673b with SMTP id
 4fb4d7f45d1cf-5e03600514bmr5012067a12.1.1739672510048; Sat, 15 Feb 2025
 18:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20250215164412.2040338-1-eleanor15x@gmail.com>
In-Reply-To: <20250215164412.2040338-1-eleanor15x@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 16 Feb 2025 10:21:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6G47+vitTq1ua1Mse3kyABAoX0FWQRNYkpt2HzGb4E-g@mail.gmail.com>
X-Gm-Features: AWEUYZlrH4zag26LnBQs_GejJWjGU1nYIl_mCem3RB06CTfTw7Cw4lFJKwa6J0E
Message-ID: <CAAhV-H6G47+vitTq1ua1Mse3kyABAoX0FWQRNYkpt2HzGb4E-g@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: Use str_enabled_disabled() helper
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, visitorckw@gmail.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_182153_566642_64E4D12E 
X-CRM114-Status: GOOD (  16.06  )
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

On Sun, Feb 16, 2025 at 12:44=E2=80=AFAM Yu-Chun Lin <eleanor15x@gmail.com>=
 wrote:
>
> As kernel test robot reported, the following warning occurs:
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportun=
ity for str_enabled_disabled(on)
>
> Replace ternary (condition ? "enabled" : "disabled") with
> str_enabled_disabled() from string_choices.h to improve readability,
> maintain uniform string usage, and reduce binary size through linker
> deduplication.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@i=
ntel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> index 96bcda0856ec..3efee70f46b3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/string_choices.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "stmmac_ptp.h"
> @@ -633,7 +634,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
>                 }
>
>                 netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
> -                          on ? "enabled" : "disabled");
> +                          str_enabled_disabled(on));
>                 writel(tcr_val, ptpaddr + PTP_TCR);
>
>                 /* wait for auxts fifo clear to finish */
> --
> 2.43.0
>
>

