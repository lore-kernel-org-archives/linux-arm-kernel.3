Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF09D41D68
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUgoxxvXrdhSJUKoJyf/O9v+5uKNcqCPwgTAuJ4BG7s=; b=GQK7ayg5LqtyAe30At58X81hFk
	V22KFbkTZxqSqPn4JZmd0K6E24w4ojiHpq/Z9sczuz+JWkXR+nPAxKVqintbBAc8In6/lXfAWXOub
	Nb60G8Ggguaa161KDEyD+x0I1rdUGGEyBlfLvnYdDU2XCdkU5S85uk9VYphQ7eJMylMIm4HWaMuub
	rXCer93Eg8AMAECY91uDbRfSJBc3p+97nS7a3tI1N8+ob+FACTsu5Zm2sgwZcHrmVZBUUvRAKLKZL
	GA9oR/4E+r/Bx8khbifoiIHXAQue6b1EGyMRnvD5AV6q4NCbaDXmq5WlM9B76zI6T1dkaP37oqrMl
	hqhuzUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAllm-00000002YPH-2Afl;
	Tue, 12 Nov 2024 07:57:02 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAliY-00000002XnU-0hqk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:53:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-720c2db824eso5795314b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 23:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731398020; x=1732002820; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bUgoxxvXrdhSJUKoJyf/O9v+5uKNcqCPwgTAuJ4BG7s=;
        b=Hr9WfS/yxSn8A2/6YAqTbdC/KUUkAnczTaXFXyo+bRrXJdbDMbaGCu+H9OP5YbLZxJ
         Ng5qwQ39gtyU7PgWent99adUbZd6vc50lNRkuS50vzZOPTLQl5qBAylwiR9fiJ6Fyy0H
         7bsu0/KJf6Zc/sZBJuPoxLyDUZY+WaR+WAU8qAPT4lk0u1BsLAw4LrlLGAZc+GlrDlN2
         n3aUCIfczp1C467JCCBd+l1e076Ldbdn/s4dQaKhGhBEDrI2MhnbA0jUFauS8wjLhqvA
         rcXWM68eCk0GvVk4doGN617iaq95tLlC9R8DZsjNikLf25zAQ579Qk72+zaA/uzgVqXz
         /igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398020; x=1732002820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUgoxxvXrdhSJUKoJyf/O9v+5uKNcqCPwgTAuJ4BG7s=;
        b=WTZSP5xIPxL+2H3AJLwKuDzJGhqWpGH2K8XkXDc12wSnSOFlc6f4/TaqMTIBiat4iF
         3G1Z9D1zNouYE60EZVEvKqG1XICE4t1syFKb2pAUz/hUTWN5NpwmbJMDuNnmZn63gNn0
         SzPfJ2rCQc8k6QhMHaziAHpk7shy2OpWHiRVKq3R1dF2xSxqHBkzE7tczeb4vzy7KuWp
         bsxth2R84mkfeRdcyvKLaDokgLGlHQRq0WaJmlXBKLYzBKcXeSGn2t2jRG7EAZBXwmyq
         JElj4QUZAsk+7fHz3utI5i2UlzgvnS0AVIdHXL+og773zSYUcrDwneppA22mIZ2dzNNE
         Q4KA==
X-Forwarded-Encrypted: i=1; AJvYcCXjpTwQJZl9ONnau1UtVUoOc1avS8gvBLhwPgS0qA3dllUjAvaBw8xI2oLLuby389bQfuXHXBvTXWYHLuvTl1qM@lists.infradead.org
X-Gm-Message-State: AOJu0YxC8KWYi4UgCyJW8k+tY+iaSImQ7RZMA88Tmy+gBCNu/4T7usR0
	4eUX1PDa8HetL70k6Eq24FWUaXXH4qa2jSwhQerURxTVpTBkVyqa
X-Google-Smtp-Source: AGHT+IH4s7RgAlk5NeJXz45kGRRPxv9SbFPlQhFQl+z6UduWSSD31KYzEVYWdy1FjRFjXJxIydK7jg==
X-Received: by 2002:a05:6a00:b56:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-7241334a09dmr21966921b3a.17.1731398020189;
        Mon, 11 Nov 2024 23:53:40 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240799bb78sm10424749b3a.95.2024.11.11.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:53:39 -0800 (PST)
Date: Tue, 12 Nov 2024 13:23:32 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com, krzk@kernel.org,
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org, kernel-team@android.com,
	willmcvicker@google.com
Subject: Re: [PATCH 2/2] scsi: ufs: exynos: remove superfluous function
 parameter
Message-ID: <20241112075332.lhssmh44a77uyvit@thinkpad>
References: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
 <20241030102715.3312308-2-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030102715.3312308-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_235342_228445_3E81B98D 
X-CRM114-Status: GOOD (  19.25  )
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

On Wed, Oct 30, 2024 at 10:27:15AM +0000, Tudor Ambarus wrote:
> The pointer to device can be obtained from ufs->hba->dev,
> remove superfluous function parameter.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-exynos.c | 4 ++--
>  drivers/ufs/host/ufs-exynos.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index db89ebe48bcd..7e381ab1011d 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -198,7 +198,7 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
>  	exynos_ufs_ctrl_clkstop(ufs, false);
>  }
>  
> -static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
> +static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
>  {
>  	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
>  
> @@ -1424,7 +1424,7 @@ static int exynos_ufs_init(struct ufs_hba *hba)
>  	exynos_ufs_fmp_init(hba, ufs);
>  
>  	if (ufs->drv_data->drv_init) {
> -		ret = ufs->drv_data->drv_init(dev, ufs);
> +		ret = ufs->drv_data->drv_init(ufs);
>  		if (ret) {
>  			dev_err(dev, "failed to init drv-data\n");
>  			goto out;
> diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
> index 1646c4a9bb08..9670dc138d1e 100644
> --- a/drivers/ufs/host/ufs-exynos.h
> +++ b/drivers/ufs/host/ufs-exynos.h
> @@ -182,7 +182,7 @@ struct exynos_ufs_drv_data {
>  	unsigned int quirks;
>  	unsigned int opts;
>  	/* SoC's specific operations */
> -	int (*drv_init)(struct device *dev, struct exynos_ufs *ufs);
> +	int (*drv_init)(struct exynos_ufs *ufs);
>  	int (*pre_link)(struct exynos_ufs *ufs);
>  	int (*post_link)(struct exynos_ufs *ufs);
>  	int (*pre_pwr_change)(struct exynos_ufs *ufs,
> -- 
> 2.47.0.199.ga7371fff76-goog
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

