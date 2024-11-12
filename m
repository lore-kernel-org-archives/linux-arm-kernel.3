Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE718D41D66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZdzgcIljMlUObBvcBKwGCR4bvqsV+cW+n+UDROLFU0=; b=AjLebOnpWz5HDVksDAIMeIGw3w
	jc2FLyzrxfXmrWtNYdSY+75Z91+2jpRJz7HIjoplpSHAQcfcg2FryjJ1wKO++GjNa3hdJfwcBf2Hw
	zaV43J2/h9v19GQYfBaAQ4w6SucZQSfWUU/wjt3DITnR8S7Nu5GUHBq2Raej7m85tacNHDT8QRosY
	sAg7HHTnqt0tQ5IF8CiXM53NWUpMWAMjR90ZQffOJ44CFh3AXb4qGtFHkhT35iOSnI3i+oGCuR3XB
	zofHSmqOy5LtN3+HBpAjP7s0kEs8n67WX3lSOWbLy8gccdWKdaM6vmPsO3mwmPpwQ1cnuvUzvAVb9
	lLGctC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlk2-00000002Y2Y-2Wpd;
	Tue, 12 Nov 2024 07:55:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAliE-00000002XjV-2bGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:53:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-724455f40a0so808160b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 23:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731398001; x=1732002801; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZdzgcIljMlUObBvcBKwGCR4bvqsV+cW+n+UDROLFU0=;
        b=cJRCzzPdvAN4j6uM+xzc9rfEgZoyQaw48ZvqSbuAq84WJpqhcJ2pKgzHyS5NqKhmZ1
         +c1KGT1uKGqlLQ2DcuV8usxStBWRrdjMfJBecBQkYJGRNRt1RnSbFlMKGTAh63aAtWEu
         kyFDhBYb73rjeCaq0s34Lo4jnA6diavIabOUJAveJAbipnooaboVejQXWnwccdkOzzNr
         qG/g3zKOA8ngFORvZ8GIhVnpiatUZk5rbnhPdijxI/zySp0+RfHaPgRjjAPqWMuXWAMl
         0RIX7dO9OWigP8jFF0EKoWGYj0E6UH2OhwblxWFjNtJqJGjr7rCA57dpzD2qjL176+W4
         fD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398001; x=1732002801;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZdzgcIljMlUObBvcBKwGCR4bvqsV+cW+n+UDROLFU0=;
        b=WwPB5HrD8WaszH1ImiGILKL8S2Ggw4Kp/skXBi/LZbptVdrWlPEkW4M7YSeS+MYNS+
         o/JGVIH7umP+4+sKX0rriFeHkgYVQd4qPWKUsPAgg3By200YQy7NsPLWvSmWgOZ0SIJb
         30np3vlUj23/9kWhlrnwdeNkSvdfLXW4ZZn5kCZ72FA0TascpE3p8FQRMJ5Pk+cxp98w
         A5lNpJXJnSxA/bJCCbUBqWtfd0POVVvd2Ri59BVssB0+/b1zZZ5sElEhIFHSBpWMGslu
         nfzFZoO/kJbXMyNrXdXK3atSL462tR0ieoOFi1/P/1V7kw9ctRY3b98tmT8Ij69rlu8Q
         K2ag==
X-Forwarded-Encrypted: i=1; AJvYcCWNSXnDRbh+8zDv3PrOzAjqXwXMjhqgy/Cgz7Ku4xLc0OZ0gTDEubeBEIbXxFkziIQsx/agoDBMu1tw9TdxC/hE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg1Yq8XtIuzfDN2VaD1AKhy1LhQz1hct8hrUrPtGYFXocG7Oi5
	bVlYg8Mxd4xNZs9eCSnqJ8LPAIzIaUujOZOyx7jXN5dTu4rkkEqf
X-Google-Smtp-Source: AGHT+IFOyHj/UkfZuck4267vweXr7tX25rTZjP9yXmcate30Q5rUAyasg/Lb0W80EKNNt7nBcNybgw==
X-Received: by 2002:a05:6a00:23d1:b0:71e:573f:5673 with SMTP id d2e1a72fcca58-724132ce0bamr20411427b3a.15.1731398000772;
        Mon, 11 Nov 2024 23:53:20 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a16sm10689026b3a.182.2024.11.11.23.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:53:20 -0800 (PST)
Date: Tue, 12 Nov 2024 13:23:12 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com, krzk@kernel.org,
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org, kernel-team@android.com,
	willmcvicker@google.com
Subject: Re: [PATCH 1/2] scsi: ufs: exynos: remove empty drv_init method
Message-ID: <20241112075312.v3ir4ewg4kglckpf@thinkpad>
References: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_235322_687132_D032ED45 
X-CRM114-Status: GOOD (  17.06  )
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

On Wed, Oct 30, 2024 at 10:27:14AM +0000, Tudor Ambarus wrote:
> Remove empty method. When the method is not set, the call is not made,
> saving a few cycles.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-exynos.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 9ec318ef52bf..db89ebe48bcd 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -198,11 +198,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
>  	exynos_ufs_ctrl_clkstop(ufs, false);
>  }
>  
> -static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
> -{
> -	return 0;
> -}
> -
>  static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
>  {
>  	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
> @@ -2036,7 +2031,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
>  				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX |
>  				  EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB |
>  				  EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER,
> -	.drv_init		= exynos7_ufs_drv_init,
>  	.pre_link		= exynos7_ufs_pre_link,
>  	.post_link		= exynos7_ufs_post_link,
>  	.pre_pwr_change		= exynos7_ufs_pre_pwr_change,
> -- 
> 2.47.0.199.ga7371fff76-goog
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

