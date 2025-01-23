Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScXAOgZXW83Gqjl3thNs/+nZmT78yMbe9xCFOetszKo=; b=rOY1ACCyqVijNfP3OLftQZ+hfi
	kNCZzrXn4jBmSJVD2CCM4eI5S4VhvFukxJuQt4ji9aj59/Y5J5TIeSBgsmZJ+Jjdsr8ngcpKGCo2v
	XUmZNLCqh8xF+pqoN4CTkLbiThBQ+/B11UwQ6Xo/VAW8ivg5V7CecC15/ON+2crVRo46J0Ehrnc6C
	x2PsXowlsdr8/ahEvGd02ZRIJUP04kt1xbsPd6bwG/JxtY6A47dtFq3LGVUTWGBBxh06AIeC4zU+L
	DjF+oCxV6b6LhVz24+GnscNuOpzCTyfFtc6ntuWGERona6RYjtpAhI4SXfvUptRFTfQnvfyFwT1kY
	pEmB9UFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tav9Z-0000000CIGN-2rIB;
	Thu, 23 Jan 2025 11:13:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tav8G-0000000CI7k-1agv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:12:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385eed29d17so380746f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737630739; x=1738235539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScXAOgZXW83Gqjl3thNs/+nZmT78yMbe9xCFOetszKo=;
        b=lDJep1OBjI+jt5jURdJYQT3NtdfIWMUpERnS/lbXg5Oq262CCVQLQkF/r/gxmAVgqQ
         ZhI45sNEB+hLwDMD6ce1O82PcsUJ763jt6EPagVaL2PFNk67CWVadG5zLZZl4E7M+gaQ
         BGsXk4OKPZ5d7PFVsX2VNB5QfTUCaAXl12/5wpT2vK0+gpwjahpHx7OGds+T+ZN1yk+S
         AMsWbn39SZc0E0FL225KnIwTYMIPBvtUplf38WCnaz6xawS1HH1Mc7PCO2Y2kFmUWc7r
         ib6yrb+Py7wZVOJs4Z7thXAV9V7m7vbz5tMcqOpjSxtdQW1C4xIrtc2o14Z35sFMZqlU
         ZTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630739; x=1738235539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScXAOgZXW83Gqjl3thNs/+nZmT78yMbe9xCFOetszKo=;
        b=mCxA5LSUGs3DJpxMhUhwfOIdZBqVqnHv015Jpa8IHagiIvqda/5pkawbHD5WhpxBVN
         ypbkOPhEtkdPtLC1kT26TJV73B9rUxe/dezjlfayswVjxT4ulhGnHcbOR4/z3tLp1mhZ
         Ta/FvpEZJgZ85+nr1bU5A9e4CR57NFEjcb8XWuWSyKsr4vCUfSFWY6DR+zYkWCHIVz0K
         S5uDTM388fPbv+pn8DkiQ22mFiSso2vnXZNfWUAPkIT1qdyZAGkkFs1ojbmAnuho294w
         t1t3DgqMo9RUzQBDSWcJwyx2sJnpM/8eLt2flpQrMgwObPGSN5Y3pfC/GwbusUVATbf+
         hzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9vWuY8DiC2cYwz2S6ixbSrTKSlAV4C0z6wuWVXacZV5mpfaC9E0Qx6ErBC1aFGYkBEentuDffNRzg1b8jnlL@lists.infradead.org
X-Gm-Message-State: AOJu0YyPd1Y7/t/SHKmMF96i1U4oV7TQJ1Br6oSGoMxPD2vkF3VxfXa7
	vHnXCbm+pJvo6OnHdhuh+bohuVfYSf0up1T5cgcDoeG0vjs1Ng1rKLM+47FMVXg=
X-Gm-Gg: ASbGncuNl6yxZ+SdQLi7RlDOvH3lNEapCtRC6kzCjgJQtw3N6m37jdGRgDxYkEbT15U
	YkX4Sejp3v895+JchKuPQA1rBWM+T7m82jRNSPC3p5HUxs1FAY+NKonYzI954zt7Rele91rAdce
	D+in3g/tC27Jv+Px0hXzOrS/mwmgP159T8jawTHTA7od/B3e/zuiqqmJBw1d2UQQbokOTuRfm/3
	gw8sB1J1ijtypqxYh5o0I+FSArIu9Jr1UBP4Qb2kNML3bGQB0l3r2nRzCzHKYJ/BMv9eit+GYjx
	+BIx0cgszA==
X-Google-Smtp-Source: AGHT+IGTjg5cb3hrIHI+2Cx43xQLT48/6W5YSS8YYVdSRsOlyfnn/x4sEOrUIHztwV+B3Orib4yu3w==
X-Received: by 2002:a5d:5f4d:0:b0:38a:614b:8632 with SMTP id ffacd0b85a97d-38bf57a6969mr27614248f8f.39.1737630738817;
        Thu, 23 Jan 2025 03:12:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275595sm19117151f8f.67.2025.01.23.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:12:18 -0800 (PST)
Date: Thu, 23 Jan 2025 14:12:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>
Cc: sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Message-ID: <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123075321.4442-1-zuoqian113@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_031220_431480_794E607E 
X-CRM114-Status: GOOD (  23.52  )
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

On Thu, Jan 23, 2025 at 07:53:20AM +0000, zuoqian wrote:
> The CPU rate from clk_get_rate() may not be divisible by 1000
> (e.g., 133333333). But the rate calculated from frequency is always
> divisible by 1000 (e.g., 133333000).
> Comparing the rate causes a warning during CPU scaling:
> "cpufreq: __target_index: Failed to change cpu frequency: -5".
> When we choose to compare frequency here, the issue does not occur.
> 
> Signed-off-by: zuoqian <zuoqian113@gmail.com>
> ---
>  drivers/cpufreq/scpi-cpufreq.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> index cd89c1b9832c..3bff4bb5ab4a 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  static int
>  scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
>  {
> -	u64 rate = policy->freq_table[index].frequency * 1000;

policy->freq_table[index].frequency is a u32 so in this original
calculation, even though "rate" is declared as a u64, it can't actually
be more than UINT_MAX.

> +	unsigned long freq = policy->freq_table[index].frequency;
>  	struct scpi_data *priv = policy->driver_data;
> +	u64 rate = freq * 1000;

So you've fixed this by casting policy->freq_table[index].frequency
to unsigned long, which fixes the problem on 64bit systems but it still
remains on 32bit systems.  It would be better to declare freq as a u64.

We keep fixing and then breaking this as undocumented parts of larger
patches.  :P  It should really be done by itself and the Fixes tag would
point to:
Fixes: 1a0419b0db46 ("cpufreq: move invariance setter calls in cpufreq core")

>  	int ret;
>  
>  	ret = clk_set_rate(priv->clk, rate);
> @@ -48,7 +49,7 @@ scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
>  	if (ret)
>  		return ret;
>  
> -	if (clk_get_rate(priv->clk) != rate)
> +	if (clk_get_rate(priv->clk) / 1000 != freq)


Sure, I don't know this code well but your commit message seems reasonable.
Add a Fixes tag for this line.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")

regards,
dan carpenter



