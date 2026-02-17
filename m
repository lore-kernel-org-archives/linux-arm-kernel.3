Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D67E909B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUOXZnoPwW4afRUrdlgUn+EodM+CPxsvenUvczXmW78=; b=kHSyIFIJ0PgsQCrOSVciAsL19i
	pVSZCah1t91OJkMqDFCjAg1ef/EaG5G6dTEz/CRSzKP9bVPUPsFnN4timM0GxVlTp5kGg26//s/CB
	w6ac3+3kQoYG4nTYBkwpeOmcUTxzm+EZm/Gsv+ckCJvG6uan/75kmR9gsUxyBZtdm7xOHJ6m90DqT
	Z4Y7qGD6gcUE/KytIdkmSp1nlLDvBcqKRKbjV9dtGbvFa3wEyZ58c/gR6wv6X99ARpxnA2rQIstLW
	Ea3o6MtgFoRPonPdUqWN6K00BLYQ8v9nuzzdrVB32GeruoSgrjMm4pTQMwPJNCqmo3q67chlJS0nZ
	9+iYSUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMUR-00000008TOs-08O6;
	Tue, 17 Feb 2026 14:55:51 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMUO-00000008TOT-3Hzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:55:49 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-64ad9238d8fso4132136d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:55:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771340146; cv=none;
        d=google.com; s=arc-20240605;
        b=VQNrxe3YX8p7RQ/+a5PmKCmJ4A3+6ApFAoChgqmsOmpngmOD05QYgaG8fm94mSUhry
         tXnF9fYFiU+Yu6A0b7Ct2lqW9as1+1Tqp65AUo41T2sHo9tsXO7X1rsYLBSDwmCGHA+t
         dW8N2yuyt+jJXU4Ij39Gypbd8ncbQlkeXlIxknUsucl3wS+vSJNG/OSS4r/pdGIUPa8Q
         SgjgM+A187s1PZ4eekp68FrMms9iWDNtwbeAb4pkuu+zzdWHPUPOo0soU99rXn0xf+pa
         9D9BLja66lyeXYfFkQNPMvA0iRDyj4ZD6mOgxDx5/W4T233lkHKG7aOBge+hCTea5gdL
         /pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EUOXZnoPwW4afRUrdlgUn+EodM+CPxsvenUvczXmW78=;
        fh=JhZjs7CV2gMGdEs7vqWyf8We41Y+ZR+YyZ0eoGy4bvw=;
        b=Dg6YAcuEqKBxG0BIzGX9sdOzQlQ4dXo7Smv8Z0Pe0Qy+Fo5IsjWMAIOAMhKkazWg/N
         PupH7e6kRR5o4wb7MZ84XKQGpoA6FXVM4NmSfwVz4qbPI1ObN6Q8hC5LFcMMz7Mkx1jw
         KeJ56y/5onGaigf72a6rlmR8yHXnUgsK39xQ/MFf31M5oYsqvLbotdKCdeiI3vIBqA0D
         SSWrSUEv8vvOLEpfFJfqUUgz5a03V9i4KYc7ng6WC+BJxEmb8pFP5VVgTW8lFuCtiWxf
         v9B/sE6U38TyzLldFF24pTadmqXNdFM1IpZwiv0q4a2nymP16BF40AofMNWFE7wiLLYd
         +zgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771340146; x=1771944946; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EUOXZnoPwW4afRUrdlgUn+EodM+CPxsvenUvczXmW78=;
        b=n9r61Tc+RrV7Z04qpvD2KjS680ONjeoCgwY+g9sudNjfm4GLHeJEUce65S5tzQTNPJ
         XVPevhly5ngCHPwNZCmeMGfgqZZXnAw4xziXQQ6NbulZrxxmPg13rJUAZ2t+HD6CHnCK
         jXBuiKf6n44r/QDkeh2DmBOZHC3mxLsm7Uau8s86JkPUMldow9y2muO8DLcXIg9lWAWZ
         v+5J/EzR6ro0zMzuHVS+Dl4UykkNvUIVQhXDAinHZYj0VxudAFB8cCQcx/EnckVn8nJ7
         gHx9SIzJUtxolcxl74CRq4lLrlhnWBMeO11faGf/ZZAXtftJ2MT/qzgDUt2/fTJ1sO9A
         0uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340146; x=1771944946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUOXZnoPwW4afRUrdlgUn+EodM+CPxsvenUvczXmW78=;
        b=ILJH9tR1uFnHhT1VjHGHb37GTmN7Pf6ZxAtu5xNPMhf4sJJPhwGJLThzyO1+Y43D/S
         BfL0T3pA49gmD7Bx/wMGC2C82J7jgYIsTP4wDPn6VDSzmR/7I1+RfCCAuy12VHEDYXm3
         STj6PkS+4ZLNMNDByZksvjGVGVTjQYO4op0TeYXmqx5oal8qtzOr99L7HpF9O9h7Wd/8
         UiJhfEOTDJVsx3Kl+HtZxvpzxBUrj0r5XofUV9a3hEniDrmTlPDVDH9xGvIuiVc/5aAX
         51pEf7QGGn8FnhYY5/mqSONlyCk8cQDkPm6Z3HnZC0uh8Q1F2uh1CDhXSECKiBgzSsZj
         M+xA==
X-Forwarded-Encrypted: i=1; AJvYcCWMo/jjgXBZv0bbjsyLA8f9YSNDM5BEJ5gTa1M2N78Mb+H9b2VKnE+NwYHRcQqgjKWVRuQ5PrdsW+KReMQcvJPz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xCiNFaZABGqpoS0lsTmCLXFjIIchNR+2ZX9ZWxuIl0Tl9S0i
	2rrNrxpoJBRS+O+dXw0pLa3CZ7YNjKzO6V8arLZmyV0Rx3cdIsvnehvmXS9S6UiuncbcjvN6dIx
	rviHgslgLa6GRLU4O7REeozPebQoUMkutHYp5+4dfpg==
X-Gm-Gg: AZuq6aIiJvBzJ5/Nk798HTOtgMtJr+YxTPuskbQHPrdGBOBnyeJpDVCSmOOlQLJCZwp
	2LjhdY7ee2KQx4Y2PntYnSyRek18N2Z/QMosjqWH77MuQfAwrUfWCktATLy4jrFp/6k1b+S7gPB
	+Am2Vs61OoYmoHoBuvZVqbKDdm9mOjChCe0iHz5BgnOcmEgppmp04OxIses0/IviXtqI5axBdGF
	j3Xrk4DkH64pBcIE63tkAcvpdhS/yi3fExDAEPXixDP/eeaHIWp3kA0XnIOnhdITOwT5nYhKYdm
	TarAdZSO
X-Received: by 2002:a05:690e:169b:b0:64c:2581:eecb with SMTP id
 956f58d0204a3-64c2581fad3mr7183736d50.61.1771340146334; Tue, 17 Feb 2026
 06:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20260216191543.2514647-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260216191543.2514647-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Feb 2026 15:55:07 +0100
X-Gm-Features: AaiRm51PTpCZCJlLwWn7BPkKSIk9PRnuEG_OBJnTn7CydyKYx_zNUvJrCSEJu-0
Message-ID: <CAPDyKFp+1O6qAy3tRibPJ3oBOFkMLF_fFAtV5qWE3U2g7VMa5A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: use correct register offset for V1
 pin_sel restore
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: adrian.hunter@intel.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_065548_830606_5495B36C 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, 16 Feb 2026 at 20:15, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>
> The restore path for SDIO_CFG_CORE_V1 was incorrectly using
> SDIO_CFG_SD_PIN_SEL (offset 0x44) instead of SDIO_CFG_V1_SD_PIN_SEL
> (offset 0x54), causing the wrong register to be written on resume.
> The save path already uses the correct V1-specific offset. This
> affects BCM7445 and BCM72116 platforms which use the V1 config core.
>
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index c9442499876c..57e45951644e 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -116,7 +116,7 @@ static void sdhci_brcmstb_restore_regs(struct mmc_host *mmc, enum cfg_core_ver v
>                 writel(sr->boot_main_ctl, priv->boot_regs + SDIO_BOOT_MAIN_CTL);
>
>         if (ver == SDIO_CFG_CORE_V1) {
> -               writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
> +               writel(sr->sd_pin_sel, cr + SDIO_CFG_V1_SD_PIN_SEL);
>                 return;
>         }
>
> --
> 2.34.1
>

