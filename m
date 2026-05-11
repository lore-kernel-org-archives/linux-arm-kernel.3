Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EDCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWVMeqj0xlUh1jkgFkzLBpyzkrq/g1Uwz9H+NMuWTPs=; b=SWEXHcYQzvyUDWHMDqDzrpdb/O
	5JwJjpA/eo/Q7i3v/NJ+aGEeGyFOeVfZSe4Vi4jL0etqBcVojpI1oDy3DeNxnBnntulsI8dY9/aPe
	fl0iyBmUHUfvkyh6mMYBQvwjQSoYnXa+WISxqbTHr4GZSZqgMrcMemHvvYZnvvVbMHtHdoVHvRYGH
	bv217mN1JXFcpRaGkwGdq/jQ1O4bROi8jPoQoTtGGhinQq/1zsbLAWYBQ2z9oiUj8A8TDoLelEemM
	zyZhAhkRYR6OTlGXPh2K5QAmCjt+Ign8Wpz5cdFkAb9ZWSSJQExnmQ9XfwAjkSxK6dUt02hZ8MHu1
	olxZydjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkY-0000000E4gb-1tul;
	Mon, 11 May 2026 15:40:54 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkS-0000000E4cs-10T6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:40:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso4440567e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514046; cv=none;
        d=google.com; s=arc-20240605;
        b=iiDmCkT/TPiHieIODqEQVXkVt/sNIRRmox+/Tv7Btz+u3CyY85GMyL72crLNgypThj
         9IZ+r/v1daS7JuhYJwHra6zusVdO5S73n8O4/J33BIQx7SidCRKQUSZANkmYccm3JUiz
         V58YzuIWpHgS2eyVuN1dtjJnOsIBgu0eHHTxdnzlPNL1Qqs3/pZU3NrNGmOV+nV7o2Ms
         +uk6Z9RFfhgAHEG9EeUN8FTfpaYzTDdJlbxDlsWRgQmQ7Yv4/67CfTbBQTeQQdxt1dd+
         Rn5wK4AvSdeoAoV8ofUQwguIIRuMOEZXWBrnynZlvBxybP3Zdsxv1jGQwYsLIkRK8Hsg
         34WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWVMeqj0xlUh1jkgFkzLBpyzkrq/g1Uwz9H+NMuWTPs=;
        fh=ssE2xwkXKWXhWJR3d2hTlb6Saj1j+Jevdjm0RlQbwZ8=;
        b=DTLo3uiFH/YwlaJdu9I8t0hdnfBvuXdC2hxcb1q/A1uyVeeZ7xgOKW3RFTtXBQWTzo
         OEleLRtAp4iRBKnnL42yZqHwu2IvwLNvAdkt7z98JW9LP+08YJxXBqgsXi2nvEwd9bmi
         osDBUMBGO2GsCSvXEvdYxjaW0+9OGq4GlG2pRQOa+lCbuDSMDuAJx/VGdoSG7mGCmfuU
         gTMTMaBkcJ61iTlMLXhDrqfbLh0aM8RdQ1PNMBs1BWiMXap7mxhyR3DGjl90gZuK5Zh+
         ntXTKaBRnWEkg5Mnc1EbvC5LrX+G3rOu+Q8Kk/sU/jdzHHHXtqhjpDu8hRnWF2G4QqnC
         +gyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514046; x=1779118846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWVMeqj0xlUh1jkgFkzLBpyzkrq/g1Uwz9H+NMuWTPs=;
        b=Q9Wv6U93kwOjSyQ/i9ClORuFit4OI8n35aV5kIOMBv3Zy4HSCq/9aXVuwPWIsUxFqx
         yvQ3EXKyyoIiZxgdqTjDGgxYnKUVO6bMyO4v0rxugjdIN7jivum1/Vxt/nNWYIfxbk5s
         0pUwYQpPUWHxHeimH+9GVXvF/2oZltMb1C2ao/E02Lr7INmeaFC6e1K6UwebpXo82eAy
         AqlZujDGoLtygOKu2w2GBnjo+nv3YuYUKhOE9PsUp4Dlsca987v8+IIs5c3J0oWmPUJ7
         nvRCs9LEPFkN9Mj0heiZicmJb1Ij3M6hoRCPijqrzMH6ol29+7M3D+ANR89njl3ssDCT
         Ua6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514046; x=1779118846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWVMeqj0xlUh1jkgFkzLBpyzkrq/g1Uwz9H+NMuWTPs=;
        b=Vhnpo60gH/wGYwwqDDv0C5Nkon7UoTYfmaGCwY+hrtzfGclx2CCyYOTke2ePrfgdMw
         xEqqo1lFkdCMiHo5JPKuHPsDj8vJ62XRBKZYTOmft22VVD3EbVJha6mzb5Ldn8OsKQMi
         3Dqqib+Ew3LTuw8BzJw75mWC8MP1iK6uOBVSZHasD+SOFzVBQhqTuxxOKta9PqtpQkUy
         ZPyc+vnR15QX8qgC15+37VaolxcOetR4Axd+JQATLi14SQHY+c0bSWc2zskmiGUOgyXt
         8DxIFfhTyLLzpODmBskb6f9Ofkov5DIR2CuI1DZ+zma0YUGqhK++nPf0xe6mbrU3DDn3
         WaYA==
X-Forwarded-Encrypted: i=1; AFNElJ+RvNmzobrvJGkHVzpawY9ny3Vw7ugD+CK7zTwpsFHRZEetKkd/QAu8ZJgD/wQGNYzi8uIHggRHogCXFFGP1gGj@lists.infradead.org
X-Gm-Message-State: AOJu0YzcDAyK65X6pGNf/l3DsBJGHctyc2LVCxuTvXc1KL1Uokr7sE8v
	T7lyRADdahSE7pRhYz6kvwx/lx7/cxN5fDSLb5aXwX4zZ/nPf0HwDxCcpvNeQ7GXa34lrcQXesO
	ufnbMm83uznddfVmXjLE79aEUkpp+n5EOfhkADXPnbQ==
X-Gm-Gg: Acq92OH9HaRzlRBB5gvBJeZjHtLj40blv8vu6SqhKDvicPSbwS4bjOhYf0XMXfXirVz
	g3Xc3GYWE4aFruyoBvIPiM2/lD8Lr4gh3Yn6u5DRdHrMMIiwLJO/qdAm5TSQU6t5uQjzuEZV9ra
	PmpMfevnu8PXHzY/wvGOjh2q486ZAjRsSnC7Qo6t3Gq6Gu5RWhS9HccipKSCMoil7xfoDHNvbKA
	80JH1qi1XY+N1dhrVPkTK70k9+/26+6rWya3qygN8aPZNdldnzS/94yqSJR0hevH9S6QeTmNKlR
	JAAKft9E
X-Received: by 2002:a05:6512:3e24:b0:5a8:5288:28f with SMTP id
 2adb3069b0e04-5a8b709d3e7mr2541098e87.28.1778514045977; Mon, 11 May 2026
 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260505103323.207010-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505103323.207010-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:56 +0200
X-Gm-Features: AVHnY4JFcrbyZo66snzwgXck_jRaBZR7P8sWj1lGBUqeDdEUbyk9AptCesJjbto
Message-ID: <CAPDyKFq2tiDDvn=3tCz40HeOpaBD37ELBb5XqoMV1xb7yA154A@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Robert Richter <rric@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Alex Dubov <oakad@yahoo.com>, 
	Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084048_314196_BAB1C439 
X-CRM114-Status: GOOD (  23.15  )
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

On Tue, 5 May 2026 at 12:33, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cavium-thunderx.c | 2 +-
>  drivers/mmc/host/tifm_sd.c         | 2 +-
>  drivers/mmc/host/wmt-sdmmc.c       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
> index 1373deb3f531..84ff6d82ae3c 100644
> --- a/drivers/mmc/host/cavium-thunderx.c
> +++ b/drivers/mmc/host/cavium-thunderx.c
> @@ -188,6 +188,7 @@ static const struct pci_device_id thunder_mmc_id_table[] = {
>         { PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xa010) },
>         { 0, }  /* end of table */
>  };
> +MODULE_DEVICE_TABLE(pci, thunder_mmc_id_table);
>
>  static struct pci_driver thunder_mmc_driver = {
>         .name = KBUILD_MODNAME,
> @@ -201,4 +202,3 @@ module_pci_driver(thunder_mmc_driver);
>  MODULE_AUTHOR("Cavium Inc.");
>  MODULE_DESCRIPTION("Cavium ThunderX eMMC Driver");
>  MODULE_LICENSE("GPL");
> -MODULE_DEVICE_TABLE(pci, thunder_mmc_id_table);
> diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
> index c1f7d5b37911..aebffd3ebf60 100644
> --- a/drivers/mmc/host/tifm_sd.c
> +++ b/drivers/mmc/host/tifm_sd.c
> @@ -1044,6 +1044,7 @@ static int tifm_sd_resume(struct tifm_dev *sock)
>  static struct tifm_device_id tifm_sd_id_tbl[] = {
>         { TIFM_TYPE_SD }, { }
>  };
> +MODULE_DEVICE_TABLE(tifm, tifm_sd_id_tbl);
>
>  static struct tifm_driver tifm_sd_driver = {
>         .driver = {
> @@ -1070,7 +1071,6 @@ static void __exit tifm_sd_exit(void)
>  MODULE_AUTHOR("Alex Dubov");
>  MODULE_DESCRIPTION("TI FlashMedia SD driver");
>  MODULE_LICENSE("GPL");
> -MODULE_DEVICE_TABLE(tifm, tifm_sd_id_tbl);
>  MODULE_VERSION(DRIVER_VERSION);
>
>  module_init(tifm_sd_init);
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 1b1d691e19fc..489daee4f4fc 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -744,6 +744,7 @@ static const struct of_device_id wmt_mci_dt_ids[] = {
>         { .compatible = "wm,wm8505-sdhc", .data = &wm8505_caps },
>         { /* Sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, wmt_mci_dt_ids);
>
>  static int wmt_mci_probe(struct platform_device *pdev)
>  {
> @@ -980,4 +981,3 @@ module_platform_driver(wmt_mci_driver);
>  MODULE_DESCRIPTION("Wondermedia MMC/SD Driver");
>  MODULE_AUTHOR("Tony Prisk");
>  MODULE_LICENSE("GPL v2");
> -MODULE_DEVICE_TABLE(of, wmt_mci_dt_ids);
> --
> 2.51.0
>

