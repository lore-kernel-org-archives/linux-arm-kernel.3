Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FF6C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vijqM8KLfxoJ7zWFWIhaauEg3BKDHA3EobwX8Ha/oEk=; b=L3eiNbuODwDZCDRHGR57nVWxJm
	+SSzVWHSdAzEbw12CZapu5GxObhxDpmMWr63Z+RlT3OWNqyOiWsMdAYGoIW95pPGyD25qRLgcrKiG
	eZc6S5vVKvTRBQ1uy/k6zF4p3U4/Dzn3ugYSC71fQMUokOd2YR/vSfiKIlRrHFC/86ycanvDsgIb1
	QUO5MqnTZ3KiDNaW2j7xV0wRPfBblHGIk6RMj/Iu31GjBb5jHY0vAQz6mQlnYXvdGvch0EQ74lmOc
	1F2ysjZdcyfUoRufWEVyPHfn6CaWQUCbLyn+iC73GfWh2uqhACvm87or7uK7IVZp8p6gkwPd1EkN+
	Eyiume4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfX2-00000001vNn-1VaO;
	Fri, 17 Jul 2026 10:11:00 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfWw-00000001vMf-33Jj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:10:58 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4566a5bc186so927113fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784283053; x=1784887853; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vijqM8KLfxoJ7zWFWIhaauEg3BKDHA3EobwX8Ha/oEk=;
        b=U+El5XcvJhobJQEG620XP42H6HXPpulnkyW+cnYNkkrdAfKlu7x3aw30D3/Iu6Dn3D
         f/UXONGGxi9gHi1ND+umVdQ2FZXy5i3M9QqmKzRPKsKewyhZGLLc7TmSGLVfv/aqDdOw
         6nnvIxZtMD3ngNVatrINUtNfhx46Zc5NgKyR0F9uVBgBI5MmNkWG9DV6yJ13Hfk25A/M
         C38kSoZX/b7qvxRad0yxsJSUPUU170DiCIbk3rpZXi5g4SqA5wiRN7luWOCDpThhdBQy
         eaK0QbufRx9iz1GRHUjvN1yuHQ5H6oJGqKNDL5X0mDm1yELgi73Qv5IGUC0tV+xIBMEM
         mgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283053; x=1784887853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vijqM8KLfxoJ7zWFWIhaauEg3BKDHA3EobwX8Ha/oEk=;
        b=eXu0OwT4/+9ef4JHe/IVGsJQLAIZTRY0S7z+6jPFSlDlb05fZfc4uWenz76vIUB4jU
         7QUKNIIYyEcL1nDEXM4LuXxVkfJ/2l5wMPxgx9tY85k9bSG/naUGT+c5PytdfT6Jlt8h
         7X1B4IF/NeC6wKHnZvpLY20F7pUT3twcNl1jZc6uHxlV79zxPPCGpTbs7zGit6nRbaIl
         3coVO/GAGOkpBn+f4TyKscoLRn8jqg26P3MwGOl5s+wLdpY/QupkYef1VJNPuSd1Fz8z
         NRcal01XCqiDB3xU2fTT5FohaJ/f9l4j56UrqYr0MvicNUjI7fZaNAlobdYumzC9Pq3t
         MBkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG1K1x5b8BL2IZazQM0EAdTt/Gdxro/b2sI4Z+VZjTlvOJpWaugXa70aPrC93lgfACKKNdTKNEE64q4do7brfm@lists.infradead.org
X-Gm-Message-State: AOJu0YyW5bThFc/DmoD2FWhgZFy1OyD5Xa20j0TyPIGrKBsKq2K92x8w
	Ermv1Uw2kbQPiQXj2/AHcCDAVbuwF+JgoYS3sor7My6NgNvQuDsBtHj3ML3zEeQQ6gE=
X-Gm-Gg: AfdE7ck0ZK5rFPmx8cJSDVv0lsY24C7vO0aabXFmrMQ7cu8qVRhRyUVUvIMl1M0hka6
	734VxbvpdOykxzHRgL72mlL13fEmGzZ3mE0xy4ct5On2EdZyVUW0oP0c+TCff9/mCulObvjgR+x
	BxtyUIQrbDo5DcNI511Thy/Nu9JZejtjRkqCwD5CYV2ZRJK2Md8HIKe5fzxy3YarRg9gK8hmrT1
	7T0eGC+oBJnttvK654pXsiJzu3Uo3LUQYVX6rTrClBMe26KgF3nhUQS9KFuSdZkVN0lKwHDb3oP
	qb/XjP25FScFx3ou2NFAVBRofOXL/uage/JFGTPNXZPA41GRk/K5VKUUKh2IjeehMKiOIgC3vQV
	hhf3ZeHSm5+H8fT4+ehMjvyr+J4IYwxBr3GI6G9W0APS1rGzurPZfIaJrqcYMvrn1xkI3QQ==
X-Received: by 2002:a05:6870:b3ed:b0:455:c1d1:9cc0 with SMTP id 586e51a60fabf-456901aa97bmr914974fac.19.1784283053390;
        Fri, 17 Jul 2026 03:10:53 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e61cee3sm970024fac.9.2026.07.17.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:10:51 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:10:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
	s32@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, harshit.m.mogalapalli@oracle.com
Subject: Re: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Message-ID: <aln_pFNqL8495Y_a@stanley.mountain>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_031054_770515_F846D6BC 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, Jul 15, 2026 at 03:18:18PM +0800, ziniu.wang_1@oss.nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> Check pm_runtime_force_resume() return value in resume. If it fails
> (clock enable failure), return immediately since accessing hardware
> registers on an unclocked device would cause a kernel panic.
> 

The commit message says "would" which implies maybe...  Is this something
that happens in real life?


> The early return intentionally skips enable_irq() and
> sdhci_disable_irq_wakeups() because the IRQ handler reads
> SDHCI_INT_STATUS, which would also fault without clocks. The PM runtime
> usage counter leak only affects this already-broken device instance and
> is an acceptable tradeoff to preserve system stability.
> 
> Remove the return value check for mmc_gpio_set_cd_wake(host->mmc, false)
> since disable_irq_wake() called internally always returns 0.

I kind of agree with Sashiko here that keeping the check is better future
proofing.

> 
> Also return 0 explicitly on the success path instead of propagating
> stale return values.

Unrelated cleans...  :/

> 
> Fixes: 676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM logic")
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 290a3172931b..18f4905c15b9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2123,12 +2123,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
>  
> -	pm_runtime_force_resume(dev);
> -
> -	ret = mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret = pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;
>  
> +	mmc_gpio_set_cd_wake(host->mmc, false);
> +

copy-paste-checker says that similar code exists in:

drivers/mmc/host/sdhci-tegra.c
  1879  static int sdhci_tegra_resume(struct device *dev)
  1880  {
  1881          struct sdhci_host *host = dev_get_drvdata(dev);
  1882          int ret;
  1883  
  1884          ret = mmc_gpio_set_cd_wake(host->mmc, false);
  1885          if (ret)
  1886                  return ret;
  1887  
  1888          ret = pm_runtime_force_resume(dev);
  1889          if (ret)
  1890                  return ret;

In this case we are calling mmc_gpio_set_cd_wake() before calling
resume so it's surprising that that doesn't cause a panic..

  1891  
  1892          sdhci_tegra_program_stream_id(host);
  1893  
  1894          ret = sdhci_resume_host(host);
  1895          if (ret)
  1896                  goto disable_clk;
  1897  
  1898          if (host->mmc->caps2 & MMC_CAP2_CQE) {
  1899                  ret = cqhci_resume(host->mmc);
  1900                  if (ret)
  1901                          goto suspend_host;
  1902          }
  1903  
  1904          return 0;
  1905  
  1906  suspend_host:
  1907          sdhci_suspend_host(host);
  1908  disable_clk:
  1909          pm_runtime_force_suspend(dev);
  1910          return ret;
  1911  }

regards,
dan carpenter
 

