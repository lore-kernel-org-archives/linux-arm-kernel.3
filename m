Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B5FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/1bp2PcKf40TQFroshO2jGmCGJEJGNa02FuKdy+K6Y=; b=rGc8g7vq4rCRvOpxL6Dp+lhZtF
	M8MjQ2rtbQlc9wNRHYZdSPJa3jBTznAwtu2OvyK2whovNX7U1iGySnA7yftLXSuYNbzL2g+rvsLEt
	pdeCVh/XtT3Je421Vsh+EB4v4nfvkzt78PAfWHP8LZyXdRPvLTyx0u4QeOME0rDkMpADJ/aF7yGXm
	XokQMBjPKdIBkl9W038f1U4co/HMcumKgkOG0J+fpxCNzOap6B3GJA1+KxHbbXRfdDg4nWCiWpxMN
	175MabZPDwil24sjqa5GAg4COi++rRCiiPNeldvJKa2W38gmmVucVmp3/BcCOdYwpZz0x34t+wjTj
	6YK54CsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDKp-00000009jp9-2DWU;
	Thu, 02 Jan 2025 05:01:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDJf-00000009jkI-0DB6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 05:00:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21628b3fe7dso144737315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 21:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735794013; x=1736398813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/1bp2PcKf40TQFroshO2jGmCGJEJGNa02FuKdy+K6Y=;
        b=kPHeVBKGor3HTwf8sCbvzAtbDHbyFJWSgknkXJNxOigfsOpOd+4+Fh7nPyYRe4a034
         Biqy6gEJnR8cubb0kaGqtHPe6BBbKoY4tNgOxDBP34gN2gAtSOCP/Gt0Kuz3JTNd4Jxy
         J1X2oW5yB7VubhYiMIvuFw35TQF+06pM5jbfdgZd6jzycEcmIpOnGQ/SVk5JdVmWWLGk
         0EWeW3yovrJBUYv7R5ZHcu5vA5iUWRtZPqR45kRLRpMNN+C6egKcIZD/Ia8/j1jJjAv5
         vno7lp4oTbrUX20OfRWETFQwsItHoSqQdpqEQhpHEOUqBioTuWJD9Ndxw/LU6opWyWUQ
         muhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735794013; x=1736398813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/1bp2PcKf40TQFroshO2jGmCGJEJGNa02FuKdy+K6Y=;
        b=V/xHoBzkmH9b/2dgcnVW78cG9G8u2mpyS2OuUDe5G4TPf1u3L9ElnzYXlWMNL7F5kf
         DmWQnCdCSmDHRhg0bJtMpJK2/PsXh1xrWh98OCzvWtKEpGtjAz6+ECy+boRvBGYE2cH0
         Pg5v4WTeLVOdzhk0kY3LaYi9bBBnll1qO+egltkASB9eYcfcAo8xhdPgpYuvIY2w4woO
         TsOeOx2If5xNhIJMuvk6j6iUSYqjrJk5Omuw8TxooFr65+QwkqdUeqRT8RMMThgls4QN
         gJUr94knhR3bNNrpxiJT18RNvworFmX0ov7rKx1LYiSGEevFmF1nbt6djkmknUqY9hSB
         Zq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9iDw/OvQFqhL4zILhZqpmw9hNk8dv38xoK6kVjnZQfLkKyi4a/ZbCHEAiTLirzoMo3hpkODX4pRFzQ88p8CvM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl7lJfg6JaGtkh1aADGhauNO5zwQnXGtNkrWDrOvaY/04ViP7F
	l90boG37wdqozKbaqq3bZMB8KUmJij582w7Bh7DhRsIIoX52Hgfd5cwHC1nShGA=
X-Gm-Gg: ASbGnctRQ/UxHDbL0WZIuCXU1Qv6llG93IpEE6VmXlm3Rfp4Ab1svZgX1Sbl9ldy1uk
	RJ8zbdcNw1F5Afh+v4qZG4utOVaHHTJO/49yhr6D14ybCrq5tXNGrGRe+pVuFBbij+PukKDsVmz
	31PvusUq+hj2E6UaZ4rRy+Zkiu/KKgfcpWN1+3nNMA63AAoNSVFKYzGcS3W1c/NksKxhNCp7hg0
	j1c7Fh7GqVZgoZTrqbuhRd2ZfMZkM/7Xgq0d1deZq4h9TOcMDLCTW1xRx4=
X-Google-Smtp-Source: AGHT+IGwZt2JFNHPzwT3nkSeMpu8p2mdONKKDTn9PLQBRw9qGtDV66wcfRl5C8C59VP/9aAWObVl+g==
X-Received: by 2002:a05:6a20:7f8a:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1e5e07bc390mr63987273637.27.1735794013408;
        Wed, 01 Jan 2025 21:00:13 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da93sm17980901a12.38.2025.01.01.21.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 21:00:12 -0800 (PST)
Date: Thu, 2 Jan 2025 10:30:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: Prevent null pointer dereference in
 scpi_cpufreq_get_rate()
Message-ID: <20250102050010.gnvf42r3v2ey7mww@vireshk-i7>
References: <20241230093159.258813-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230093159.258813-1-hanchunchao@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_210015_107534_6BF5DEDE 
X-CRM114-Status: GOOD (  18.27  )
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

On 30-12-24, 17:31, Charles Han wrote:
> cpufreq_cpu_get_raw() may return NULL if the cpu is not in
> policy->cpus cpu mask and it will cause null pointer dereference.
> Prevent null pointer dereference in scpi_cpufreq_get_rate().
> 
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/cpufreq/scpi-cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> index cd89c1b9832c..c888ed3a0de9 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -30,6 +30,9 @@ static struct scpi_ops *scpi_ops;
>  static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  {
>  	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> +	if (unlikely(!policy))
> +		return 0;
> +
>  	struct scpi_data *priv = policy->driver_data;
>  	unsigned long rate = clk_get_rate(priv->clk);

The check needs to be made after all the variable definitions.

-- 
viresh

