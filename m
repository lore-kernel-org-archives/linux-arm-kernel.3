Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6225AF53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=; b=V0HwXT2clizE59iiHTGVIojKfs
	EamLd55X9tVytYGjei/FsTr7GDt5R8kpbcnzrk45tf3LM0oglE4FRHMQtbgV82rgqTbwDWGot6U+K
	L4UpXR5WUa5nNV/4RL3kDpVASqEGz2L8g9pydrE7PAHVgFPRZIp3I+UjxcCwFh+YhvBQjnmASTQdy
	ZUXeeQDHoYhpb7KPLl3SXXcPRA0uwzqoqerHLLWCLtGkBz/iJU9uv5zhacdYZqcH+7aKPL7VRSSik
	TKcWKzjLMWP48dRTW+DSvja1qBGUHQ/2Zel/NWeHOFCy8DMW0VVka5f0AdL5r+5irqhtIL6jRFcFS
	XZjtwQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g9-00000004J74-1zuZ;
	Mon, 16 Mar 2026 15:16:25 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g3-00000004J4Q-2PQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:21 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a133b686f7so4221407e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674177; cv=none;
        d=google.com; s=arc-20240605;
        b=lZjomYRMK3eJfxE7y0Aha6qhMTanqMwT41ik7vuGUwJc9MbpEjU5oqHkPIumTbgzGs
         LVaChrQ2GEIlt6wIvJlK2looz9lWGi41G/Vz/50i0G0UVwIxf7dm8eIpqQlE/HCLfB6L
         +v8hPiaeS7WbgdRF2FksaYXCUAm8fjp9E8GOgvTSO66rwiYZWN2sON3raLPQ59kqwoov
         442MN7RFvRGaoVsD4ReEnhQCJJsdel3d3N3/UIrYXqkVG7GqCJGTvaONhxvdLlduSP1c
         jJJr/SZ+g/V3mx/nm0j9Y6x/DoCu1MWHWliDicQ14b6S8/MvMqQND09y3FPVgbATQYKu
         SBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        fh=U+ppz7sOtG5uiB6pyes/48Wnm1K5S08Ne6TDjcEWSGQ=;
        b=g5iuz8jw8Wurq6zYnV35FqzrD3U9qf1thUcy57Mb3jhj2bUNOjDyTKDMiPfVumG3j5
         e4JZhVlSpZIigvwGqhuxy8pl2Yv6JamE87B4/D9QaTuAMXxCOr0CuDP4TYZ+3ZUpkDnB
         bs0Ld3bTQCsceMSvGUgyMp3mAEZ8cCrnBQqpzfHW/meMAaSeOlHEQ7zKfDH+8/2wgidG
         c8w0de4IY7lbuFk3MUbIYIC7knJpdU8qdlCpJtQSULqGx5z/61sE6LGioXqg0bFOa6ZO
         nL455N0dpLei7RnrgyWnhMKUT8+BYpqhVmP5I2SmGoTBuM0HA8ZZIZt3IfcuBTnVUKMU
         /Mmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674177; x=1774278977; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        b=XrNmiEMsAUaTay94kSh70CTfKR/Ser+MxPhdshp5UAGp0jAlNVWdUZBAisVGeB6k+h
         Nwz6unxTIIzAx4FzgBlOgqEx7aA2RX87bLfdLuCBi01xpCvirHJZYje3amxOIs74VHfy
         Edwej3vxcwKLlYPNFI7Gs3l/L+1brGFeBaVEoP3LiM+WJQammCczZA0nscjzWbuzunZ5
         t6UXv9ngAkERFzdNVovAseo9tCLogELXs2y1wI9qMK4tJ2HpZQsBed6LTel6lIUWN/BV
         IL3RuDVrbOHoa+ifQkdhT7QjgyRxoJrVf1sIz/1qfHkO6/mDGhEn0AZRoeWE5oozgkek
         HfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674177; x=1774278977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        b=BmMZAIIiPETyUACYgHLqSOaxI1vlUurWH3DU6/K/Ji0mIlumVJMzBLtVGAwaEEKBVq
         WkUMWGbf7pMByA4ZkrLwTrR5qiqX5jSwJCLGgBb2omkPQeDfG7Odx9CVXBilcUixzzI8
         INUGVj63wlqKPDYTSY9MhhW+c1wE2is6fWqjyc5Iwx8v6iAWmxaXMNLOPEkj9EqfTuuU
         1Xg/J7gqPvmVwnaNkhsbu2GofyDh3WYIMjBiWm8XdCAoRpZu7llHG8GKBQkQSk0wXdMY
         OGiV9Tt1JBAKWMFhKewjzH5hqZBw1kwOBpxURCFoqHIHcBQOfDFUOaOx+lggRwrr3y2n
         0DrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhiU7GcUuZpsNClZm9ebxkCW5ubcg3a/IV12P/Ly8XAHFFWuFWsa/CAFHmSh5YJgClMduYLPehW40ZNbHoTrcQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/Ys9+xaipTxhIM6nonFqByCCP+ZtiMPzcn+Ll7AxV/VdN0xk
	4kmGvRZyjBVz4ysXUGujLkE+vixnbZ1r3wGGHk7zkvPIFLuByXq89IX15KUFVvetMFUaSr5kRws
	Ane+vWoHYF2H9C1UbRytg5UZOsL/JTLeKp915Loa+5g==
X-Gm-Gg: ATEYQzy6pRecHMjg0j4cInQd5cSoB6PffDx7BIHFpmfgKMpkqlvqttJ+KAvZC0QdN9j
	pgmHmjpAZ7b0J/oBz3yizKcmW02V6XHcnq5AFLAEV6eCM+0xbfqCz7rXIm13AAddS/sdeaFIGHL
	2ODmkuOcMVGG912wzSSjBP3ag/q37weUBMtfMm0iuom+vMuHk6Yo+hwxAX5MvgILd6xWEc1/JzK
	nrv5FYTpxdTAG5ouB38sCQJ16FFf4Zb1PrzOouhNFfq03S60NehO6pbFVnxuIjNbd/Lp6rqbgfF
	nhLMrZFY
X-Received: by 2002:a05:6512:124b:b0:5a1:1e44:8682 with SMTP id
 2adb3069b0e04-5a162b0d510mr4888825e87.34.1773674177264; Mon, 16 Mar 2026
 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-5-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-5-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:40 +0100
X-Gm-Features: AaiRm51cPffNhAKRkrzoz3tQeIb3HHrML_LJWGZPPVi46bwXGd0VkLN3oL3c85A
Message-ID: <CAPDyKFpFoZZv7b9jGPpWAQxYiCdxVc4e6fYYj5=16UPFi7WzSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-pltfm: remove duplicate DTS property parsing
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081620_620999_79BE607C 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, 11 Mar 2026 at 10:48, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> The "keep-power-in-suspend", "wakeup-source" and "enable-sdio-wakeup"
> properties are already parsed in mmc_of_parse(). All sdhci drivers that
> call sdhci_get_property() also call mmc_of_parse(). The only exception
> is sdhci-of-hlwd, which does not call mmc_of_parse(), but its devicetree
> does not use these properties anyway.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pltfm.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index d4fb60c1ef69..933fafe0a0ef 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -95,13 +95,6 @@ void sdhci_get_property(struct platform_device *pdev)
>         sdhci_get_compatibility(pdev);
>
>         device_property_read_u32(dev, "clock-frequency", &pltfm_host->clock);
> -
> -       if (device_property_present(dev, "keep-power-in-suspend"))
> -               host->mmc->pm_caps |= MMC_PM_KEEP_POWER;
> -
> -       if (device_property_read_bool(dev, "wakeup-source") ||
> -           device_property_read_bool(dev, "enable-sdio-wakeup")) /* legacy */
> -               host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
>  }
>  EXPORT_SYMBOL_GPL(sdhci_get_property);
>
> --
> 2.34.1
>

