Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC4CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUCXQ0EvV9ktxmOlNW52FjkhtUMF4mrPMo81WKGkY7k=; b=m24ATYkjerRgLnr0wRrkfQbdXB
	KpXg3PvaCKADiQawvJyFVNNNt7hmuD0IVt90Q6NQv4kpd0Pvivg0oWySAh03i/YVZ+4nzLfYrM0jf
	93TE7akC05oVHfamhMZbqABeZdQZdRb/PyeHt0xYIHz+9Wh3d2u2ZMKdqxflu9CmnJPyuZoYUb+0S
	yeARjxGQF0LoA3OBmieM/RopgVPbYVE/iCVc20Z5yA40RTRExYH2d154oFVNqks5x6ul5ItDTdcRR
	MvU8nSgeCNb3+Z+Z3/wwQNIVMKiotq38OHMuotLNjbNnrA1SmPP11Ye6RX2nIuvaX4QBW16X+kbYs
	l07LjfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kY5-00000007vuy-3VPE;
	Fri, 17 Oct 2025 13:31:13 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kY3-00000007vtV-15R5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:31:12 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-781da6c1a37so22828547b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760707870; x=1761312670; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUCXQ0EvV9ktxmOlNW52FjkhtUMF4mrPMo81WKGkY7k=;
        b=lxPawxyikNTFkjZ6iW3YZcz/YVY4HEDEOjh4GluUAgF4R7EpQelqnBMZJXCcaLHFIm
         1h926zlrQGgpbrxQhnAdXpEdQAu/QsdyIhHrrfJH2GZKKyZQ8f8dXjYh6R+AsCNICkRp
         Zmm2NGvCc9p8ReatnHfvb6pd9cjxckCXTBaTLQv93N/jZVD6mJQMX7JmNyjO7AmUCO4u
         PwtmyseZuX5XgPZ1hQoYcfeRuEZlIgBZZSgtVuXbzELbV66J8dB68O3ByWpOHJd3wU4g
         yNegk/azuo6+1Ut+8qofYvMWG3XhhKaHvxGrgLjyeIKshy4gZc8gzx/d/f8sooFR5dkJ
         JYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707870; x=1761312670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUCXQ0EvV9ktxmOlNW52FjkhtUMF4mrPMo81WKGkY7k=;
        b=ezyMEiXKdTwqlrW2U/wGS33gZJM0sYM+4EP1znaP8d/m3lk/FTTeGQQ+Lz9J2Qmo+n
         +5EfDbUObcmu68XQBIYYITpXgNZKkyFf34yi/XlcZxy78CObiO7NPRkDUOL0hlKGDR2o
         g1BiO6GeFbCoMWb1EOfGSwNn5aZci6PNkmjKNwud78tRZEbzUFZdwbb2ceTL4V6KZegz
         1Vy4fhcb6YFKuAmtipzhPl+6stHKxJmZUJKDei9qJXwI8mEpFQRyNnTV6wWycCn2GXzA
         pjr5NqLixxjWKcUKCLGd9Dy58FGyntxrYt5870SgQpUWlOcHxW6Dhc+8F1NaF2nxWNQn
         bGHw==
X-Forwarded-Encrypted: i=1; AJvYcCXKOwjTjcdPMS4CNrJt5uE9letPusBfKSsCv9GPKHxfIItlsLQB7H5GQfGj4chTKW3tKa3vV0jqdY5yiFWsgFPi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxh6aAXEeju7kGhr679D4xyuTyg16NKzcby/jfmyyr7FWjk6bU
	DE92zpMbePLXCwxgPHfDnDKKKKd/d/rk8K6rw9VpjW+M2oZVJrqA93jq3tESdkueQdX+VplrbmI
	If4OIS1VMIAWcvEsrwiE6nO2ZCXdDsdVnWEzPR+JFow==
X-Gm-Gg: ASbGncuYlmtqR9gNjSbrbrJvYap2oLSU6ag1UMCDscAc3nXqQ9yXWkEf+BQnmXgmnl+
	R4ye4iQCYkHZY5EIe2TGU9uiz7GC1BDCQz12t6n2Ic+0CjT1D0G9IBIOzJQd5BBDB2GXdo4Rgnf
	TL5DOGPiZkPII7OSCPykJ93c25NmH71OE8thiZSd2bIwPAuJx7zxgqcq5+c4pg2wzIj9btFZtPk
	WcCCacpnMAqu3WG+mSW1HBPwJ7ekTycfqMfyEP812CEnX5vmyLrsrYVraU5qPdpyKeCJXi/
X-Google-Smtp-Source: AGHT+IE99aLeU1qJuGUKKD3EwC+82B0WlUi+IrZYAAKOJ3BjaAC6xXwG/vSFF6c7L0L5r1xHD6BMxG1tEIJhEP9Q9Zs=
X-Received: by 2002:a05:690e:4009:b0:63e:17d8:d985 with SMTP id
 956f58d0204a3-63e17d8db6emr2723484d50.53.1760707869805; Fri, 17 Oct 2025
 06:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Oct 2025 15:30:34 +0200
X-Gm-Features: AS18NWCxOo1IPoxvNmAyvX3kK0QzpALZz5b5Ua2IC_5KvIDu-uhmuTnAMYhlcsU
Message-ID: <CAPDyKFrsjnSYBTpPJ1qWXVHTZSw8EuQh6b_CcNAKuKHHMwy2MQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] sdhci-brcmstb SD host controller SoC specific enhancements
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, florian.fainelli@broadcom.com, adrian.hunter@intel.com, 
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_063111_297669_0E0EAB8E 
X-CRM114-Status: GOOD (  11.55  )
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

On Tue, 7 Oct 2025 at 16:04, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>
> sdhci-brcmstb HS200 configuration for BCM72116 and PM register save restore
> changes applicable to various SoCs.
>
> v2 changes:
>  - Separate commit for SDIO_CFG register defines that moved
>  - Implemented cosmetic changes proposed for initial change for :
>      "mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200"
>  - Moved BCM74371 support in a separate commit
>  - Implemented review comments and reorganized code for :
>      "mmc: sdhci-brcmstb: save and restore registers during PM"
>  - Added Reviewed-by and Acked-by tags wherever applicable
>
> Kamal Dasu (5):
>   dt-bindings: mmc: Add support for BCM72116 and BCM74371 SD host
>     controller
>   mmc: sdhci-brcmstb: move SDIO_CFG_CQ_CAPABILITY define
>   mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
>   mmc: sdhci-brcmstb: Add BCM74371 support
>   mmc: sdhci-brcmstb: save and restore registers during PM
>
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +
>  drivers/mmc/host/sdhci-brcmstb.c              | 154 +++++++++++++++++-
>  2 files changed, 147 insertions(+), 9 deletions(-)
>

The series applied for next, thanks!

Kind regards
Uffe

