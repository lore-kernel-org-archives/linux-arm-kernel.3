Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A1C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=; b=ioYKyOeQ2sbLim+JEZykqooqGz
	+uqs6vI1UWfiD5luFWfHAgUtktoFhvS58tmAniU9wa1d4tyr8S3EoB3kygnU5muDH/0otE9uMbwMa
	lQffAZEnS7B/RancGGfEYwUJwp5/G/wznnB+ckJ7hq4Sis3b3bbSsptPBFK9DhgTcnXNmkvbXAzdD
	d7XnBBMwc6dOwBuHIFO+mAfZ2fiDkDtBtfv8jiupWQf1LPvFvwdgEyrLcDskwf8FY3pLgep2sZxyI
	kQVVqfjrpSMcRQEj2kI22MIQRCmKy1/vFUF6Cv+IfqCBKXOL3/O9wJlodE5DBhZ8a44DP5FbB1SNu
	0DTC4M1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaSe-0000000EokW-342h;
	Wed, 07 May 2025 08:49:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZcn-0000000Ecad-1yM9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:55:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ee623fe64so6775261f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746604528; x=1747209328; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
        b=KsdE1DCneUShhdViNuDnetrrgRS009UfNvrpnv5KTs9rGMhY7GMEdo6KJBX3FrdOOw
         PU2Xhn1aiSDn/ucW+ADgqyPCyTs4JCKcqN8KGj9e63UAFnnVeYBF+iuFaoBr+nXxxVa8
         eQfBLe4jRahT/YWQlju2txEZg25fNzPh65CphC56Q0PpPiP8b7i136D9XxeFeBNKTpBK
         Sof2TEDWhJJzOXLcZmY9WF23vg1n2Tb3nCKlXKAl9lIHfgKZ9N8g2qB72udWttgqHAm2
         SsSZy6/gQEoYbZiD70t09hEVnC/Usuxq9aFpqcWdewBt0nqygsuN31YmxQS7YAVqWc4T
         G5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604528; x=1747209328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
        b=bVdBpTAWimSFwu6wHFETpMEbAlf2BdgcgH9tEa99+qV51JZ06m9xqlgesRZSIhtzFC
         X34KdUlpq+D+G0TuqrDClyBd1nfuuzH95hFZgUhOHvRPATjAEkvjs+utifKKzxgs2Zex
         gz/IBbiEiyw4/3Rr9hyLKMnjNBBblq83H+ZeKn8vtYvpfGLzR3gYKIhsNZZEm57GPfy9
         O+NcxJUcZilLw/WO8oV+jBkSgmPXctVgqFbBirrUKwXS3224mmrSeEOxWT4U3YFgiyHv
         nep19pa8mhDhItYd8yHTwaG73N+sj0/Wn4nt8SE1BeSSoyCWhPDJz4JpDIJfDNtMq3QZ
         8SMw==
X-Forwarded-Encrypted: i=1; AJvYcCViDXzGNa4duEhKOCDEkYVbRcZHsQpPJJJ4mqHkB7EKTn1/ZGjmJAdlNYueFZ+iKtaTGI1zAZG445YpSDRwEucG@lists.infradead.org
X-Gm-Message-State: AOJu0YywubU7ATlZMmnXE4Ha7qdMU0pRr2Bhk+p73jOXZNOD+j1M1JMe
	XopNt92RXvzATLlKcWI9imtEM0wFNAzMxIwoHCGhP1vy9NRjqDq/FMTkNUg1+rk=
X-Gm-Gg: ASbGnctUKFc19JVT9dCQWTK+j0z83G0c0eMz67VvIwbZUAp7R2kW9Qk7g5PzD8TMHF7
	JlaJvSoyCXEA0i6gQFUro1sZbmDjuboAPp18jb+M1K1zdXAy04u83PQnnANKR53zC6D10bzECIr
	a7cm5QpmkLIS08aCnfQAdyXRCniCDGMFuxoDJvmO7Y/TeWb5JLRdros/QyYRulJ5deqIEN5Z2cA
	P/0QyJKm+WPy5V6JNBZ9fC3+jp4NxnWw73N7XpSKQ6rpmHuY4jgoP/BEz88H+qnydMq2HfrsIH/
	ktChzeqXKVpo1/tO77NYLEU2DP6Zd5rQr8u8Towqx3rNZQEoX8N3PYQQu4AYvy4nAOUjQJc8tXl
	4K+c=
X-Google-Smtp-Source: AGHT+IHSub+w3i180SBYtmH4xnfpAxz/7R8NINsxJdekQwKRKRmtdqdbqRAvzeMDt6WyEG1Omh+Khw==
X-Received: by 2002:a5d:47c7:0:b0:3a0:a3f3:5034 with SMTP id ffacd0b85a97d-3a0b49d26bemr2060932f8f.34.1746604527781;
        Wed, 07 May 2025 00:55:27 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad54f105sm4491875f8f.85.2025.05.07.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:55:27 -0700 (PDT)
Date: Wed, 7 May 2025 09:55:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, alexandre.torgue@foss.st.com, tglx@linutronix.de,
	ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v6 3/7] clocksource: stm32-lptimer: add support for
 stm32mp25
Message-ID: <aBsR7W15mPQiTjCc@mai.linaro.org>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005529_509492_C6F9C960 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Apr 29, 2025 at 02:51:29PM +0200, Fabrice Gasnier wrote:
> On stm32mp25, DIER (former IER) must only be modified when the lptimer
> is enabled. On earlier SoCs, it must be only be modified when it is
> disabled. There's also a new DIEROK flag, to ensure register access
> has completed.
> Add a new "set_evt" routine to be used on stm32mp25, called depending
> on the version register, read by the MFD core (LPTIM_VERR).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V6:
> - Fixed warning reported by kernel test robot in
>   https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/
>   use FIELD_GET() macro
> Changes in V5:
> - Added a delay after timer enable, it needs two clock cycles.
> Changes in V4:
> - Daniel suggests to encapsulate IER write into a separate function
>   that manages the enabling/disabling of the LP timer. In addition,
>   DIEROK and ARROK flags checks have been added. So adopt a new routine
>   to set the event into ARR register and enable the interrupt.
> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>   driver. Use version data from MFD core.
> - Added interrupt enable register access update in (missed in V1)
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

