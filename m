Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07DCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=; b=xQeU/Q5FZzu3LEvgl01vN1CJv/
	YMXwdab+ds3juJvi5Iu+MwroWwZCnM3DEjpHeTO4i6LGPjFUaRE9QP09R76oPVzSZ3I39pJG80Udf
	AU5XUuUgbVYmAyNSqp5XEWCL1D6r6AXioncixbKvwlIrKwmCE/y6UFpCgwf+Yn9r9PQLRClHhvvNs
	LOPmq+fywW28qKT/3ifIlAZkTRTSaKYk6ofP9ffFpb9rXXNsGQ5HTL0FWLfLz67A2L/+LANLJP/lJ
	91EF6eaXBzudwrDE1jRcwN4Trjx/NR1KN1q1JwDKTBECC4jdsZqhcXlrwBrgdT69S2YjL7wgvuTXg
	5+aUKR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSk8-0000000E4Z1-0Lxj;
	Mon, 11 May 2026 15:40:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSk5-0000000E4YG-1j1c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:40:27 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2597604e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514023; cv=none;
        d=google.com; s=arc-20240605;
        b=OQsAhseCWc8KsCi3QWn7v+/WJ5AFEhUnkiUBgbgN9aljg6GY5sY7b/QRWAAl8RXMe9
         qcDRgX61jhcm2ncJEguTwq55wHads68QGX9SJvamVFBm8xOdE0lSzpgo23kGkUmRW8W+
         JDZxU7tqKlYOBpx+Ddo5UWKAS9DLlApwwtM/gTWKYUB5LEhJpB9pAz3/SgOjbZqMWMD0
         /VvyFlZ7vNyNrYS+eXvkFtkiRkvdHbTSbdd1Go3PLCLKP1BjYhLVedeip4lFqgomYT/B
         V3Q+8b10oePHWNGiGFU2NrHbIcHIt20RCuyZBT2ZqGp2tBjbrOffqtAF3mdzaBpFquls
         dEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        fh=rVtHMbDE0aHEkz65hwT80NCSGvc+2QVV62q4k3PaOZ0=;
        b=Q336tf5NRuzFpo3qygWiR1s3zs6KyeNLwtj4A5BnpCgt1Cek63lDMs/bKspmA121lU
         BfJrT08b8vIes7cE1XibYtEqPDpf2pnjTp19oS4Mm6PGH1M+xopmLC0Cs4PW8P+FxS5q
         0bxuxM2g1GtBaE52Jkc4Ns4e9Dj4Y2oCkJAxD+u7sawfWA+ai4eWAuBugq5KqckkOLoB
         Z8TrsMCcSWXr0TX5108RaipLVWW7XyoR0vO0o1NrQn7IGEITeIxqgu6C5Y0oUgN83043
         dq+poj5cD4Zr7Lkjjkce7nMcL46Tjynu6pXWQsp9Hr7FQsvivCslj21uDxUT33z8h58s
         C44A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514023; x=1779118823; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=hZZvYvCgCl3TR7ePKebk/kDvqpvTy/DFCNNNYxFiWDVF70hvj2qhviLhoguACz8KWV
         jAYePGwJ2MEx/qiEwNJOCRQYrSD2VHzSad5AeqqVgA4bDca53f4/zrDzm57PeM54QZ7G
         MEexBkRQ2g94A9qi/pSJXR2+CwkD0902xTkVUnwed90OPyXU2po6yg1gsU4UMhZrSmeX
         WZERpIS918hjBwgR5nhojNptJ5UYXwnMH/krt67P6QslE35lzGkFMag7+gwwzrP11MA+
         YE7H0raJs5s0I5OkXkjQCO7zVnCv7RKxMYbROvx2PH5RmmElXd0Yot49tY0JvUAN8CDH
         hU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514023; x=1779118823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=kFKPY73F0SaPpG6E2NiO9Tk8hEv9j2UGQrU+d+IKpF7X79BElEvVTPVoWh0IY5SpG2
         ukzmWGTK4hOptr0yqYJDShJRYn1KGMJJCxch+xR+epNsmdb7Z2UEfxVhrumvS1ECiLU+
         3klhFAfpNJV6wqq66+BafqDOnTbh+zmIUSkpHfuQp/k7Z1zIC8qO5MYchtz5GCLCx96b
         dO3KIQXcDk6ti255VIbM0P+PRdA6GGxBXmN49ManO9DhbNJaQShyynX3+yBcyPFm/WU/
         m5r035zwGH1TqTA8ySVIg+l0RnrG/9BMlH9tYpCXpPiqwzOepxCxr6SXFXHEYhPKy79M
         cPiA==
X-Forwarded-Encrypted: i=1; AFNElJ8uuCu0VGMR4I2U/pRLw7pf1iQWqnslkjCbL5q2qP7BmCoCRtvx4apLA09JitVcFgITEcdCJMs7PqLI2cJMs8Oo@lists.infradead.org
X-Gm-Message-State: AOJu0YwHloovkFBj2CInz4BPF97owyhwHLnpgHVOmqleijWVPcNllTbz
	WHSWCc75bTK9R71Ir/e7Re4OHpWSoyEfbZbDhg1zhwSoNvaxQ6th9J6pjhZIM4udxQZM+EYlvGz
	8NUQhocVsI3x1Ism2/iUQil1qPIpT2V0DOc4sS66tdA==
X-Gm-Gg: Acq92OGQmcdU2eay9iCkrHcSgCEqmyDiF2CKJQyp4qybiOo85M7nq9+Yl9M/vEhAleZ
	jzfGpf5YamsSKQbLpwrPRJO3B3AMh31IA08MTqVDyeJpqvknvEIv5sPlL2ps+AoLT8Fd9ptDpCW
	2407YfkCpTUJ08HKVsu5uBV8LYEnpcqgwVCoVOnDfbDKxnpjlJbWuflofzGymvFunUhs0I0uUlj
	2d78Pf1OWjrlTXIx0BhVl9gkohOktuf+FEbtfQ+FeSrdS/rHlknbwf8bZ37yMsZa88VLP1qjhae
	2zijhG+0
X-Received: by 2002:a05:6512:128d:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a887ce5e99mr7616406e87.30.1778514023164; Mon, 11 May 2026
 08:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:43 +0200
X-Gm-Features: AVHnY4LuNFcZPtz7Q0DEjkMyUey5MSZn1HyvgA05S9j4k4K79dMxvsAAv2GCHYk
Message-ID: <CAPDyKFrKd9PouecmpLBy3NEas8dpzyVAk9qD6=pFvwbHNyg2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Configuring DMA threshold value for DW-MMC controllers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084025_501012_CDFDA99F 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, 15 Apr 2026 at 17:03, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> In Samsung Exynos 7870 devices with Broadcom Wi-Fi, it has been observed
> that small sized DMA transfers are unreliable and are not written
> properly, which renders the cache incoherent.
>
> Experimental observations say that DMA transfer sizes of somewhere
> around 64 to 512 are intolerable. We must thus implement a mechanism to
> fall back to PIO transfer in this case. One such approach, which this
> series implements is allowing the DMA transfer threshold, which is
> already defined in the driver, to be configurable.
>
> Note that this patch is likely to be labelled as a workaround. These
> smaller transfers seem to be successful from downstream kernels,
> however efforts to figure out how so went in vain. It is also very
> possible that the downstream Broadcom Wi-Fi SDIO driver uses PIO
> transfers as well.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - Move host->dma_threshold default to dw_mci_alloc_host() (Shawn Lin)
> - Move comment to document struct dw_mci::dma_threshold (Shawn Lin)
> - Link to v2: https://lore.kernel.org/r/20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org

The v3 series applied for next, thanks!

Kind regards
Uffe


>
> Changes in v2:
> - Remove dt-binding to set DMA threshold (Krzysztof Kozlowski)
> - Add comment to describe struct dw_mci::dma_threshold (Shawn Lin)
> - Set DMA threshold in Exynos 7870 DW-MMC driver (Krzysztof Kozlowski)
> - Link to v1: https://lore.kernel.org/r/20260412-dwmmc-dma-thr-v1-0-75a2f658eee3@disroot.org
>
> ---
> Kaustabh Chakraborty (2):
>       mmc: dw_mmc: implement option for configuring DMA threshold
>       mmc: dw_mmc: exynos: increase DMA threshold value for exynos7870
>
>  drivers/mmc/host/dw_mmc-exynos.c | 1 +
>  drivers/mmc/host/dw_mmc.c        | 4 ++--
>  drivers/mmc/host/dw_mmc.h        | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> ---
> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
> change-id: 20260412-dwmmc-dma-thr-1090d8285ea7
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>

