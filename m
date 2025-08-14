Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B13CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOQAy3COCQ4GmFM3WN3dte3+9U0UZAfDopK7YmF5fNQ=; b=biSNqyCwN0TFxozMn4xE866EWu
	XvNEK/IqpLRaMPccTc3QdRi/AFlNhmDepf8jkHcUsroFW1/pEpUiHtyRtbXc5A95aQKNzltmMTZ5V
	mbFqh8ka0+OZxrnjVEI2HV9T6UIewcv0zdC27l1k5IlNm4ppUdaVoa3CZW/5vV8A0Wz45kGEk8GmS
	6mpCy0PAC/mVX7Kwav41WqZF1UhG7mHdaYuTEH7eb5QT/TWsEcp4ErbB65rtBnsvLHanNVyyfSV1M
	ejli+WjMzPEJh9/uMgoG8AzsGfxE3YGrAJoXwZMso1fOSOU5XAU4QXu5XImTpzjC5sjb3ONZlr6v1
	SzwLyAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnB-0000000GxqE-0T1N;
	Thu, 14 Aug 2025 13:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUc6-0000000GUPX-1v2Q
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 09:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yOQAy3COCQ4GmFM3WN3dte3+9U0UZAfDopK7YmF5fNQ=; b=gg6h1MqCXLdH7P2HDWIhuk4liV
	mHMmQwmH6biotlp8BaBn385GsiX+Z9rbdV3qsIpEVvY1nlq0TVRZZkq0QAscsKOZZIHj0qLQ7gUx5
	FEG0lwOnIJdzsOshbGkGQphKG8aTbQjEaKA/K4T68wtQhzX4G3xqKLqf2Rpgd28XkktLRt0VUKtLn
	EoMftirzJWXZJwY1yCITdVmDUO3COReM7SEJkJI03OKJJbtRs1rZT4Lm3jvCeqp1So/Y3K3GikWaK
	gXaRMKizSEclu3XS3ZG1r40505V5nP7SI8VqXU0cWa3XK19dVpwC7Bh3xDNWVNaffDxD0PJvpRSIf
	MCx+45kQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUc2-0000000GLE2-2YSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:51:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso3878125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755165067; x=1755769867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOQAy3COCQ4GmFM3WN3dte3+9U0UZAfDopK7YmF5fNQ=;
        b=st8uXjl/mGvvfwOnU7vd0LchhrBkYequN4y6tIKa4ebx96fjsRgtqSt5Yfo8UF6YjH
         4aWfmD7hgb7QmLhM1nnWt7rmkFLsag2q9PKNHzqBRw4LWHDrIKN8z7J/MCgldzb4Lzaf
         zd2Ksyu5y5sgC8U7eP3KwYZB+6aqVMhWqXBx2soh4Eal1/8xmIT8ZBFHZLRfnAqb7V5F
         WcOXRfrYznB/6/vNdckMcrAvQ343G1ZRGqp441neGby8g8UidIR1bm7MfBoj2u6so0nH
         Qn6p+AqlPQDYd72g+G0B+ba8gD68GzdlKlI+WJ7sw6JrVlF2KW0hUrSYC/Zb/uM6x4N8
         vQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755165067; x=1755769867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOQAy3COCQ4GmFM3WN3dte3+9U0UZAfDopK7YmF5fNQ=;
        b=t+fCiax6Gp7sCy4KZDsTeRNtDejq8945B22tTuBmevDD5YnlFIJRD8AmKO/+9wFRQ5
         YEzvP1YIUPHsq78LYuZn5z80DO9dt9Kcqpl2SqQZKEFgTXq9lFAAfGCrcElMq478TBY/
         Xb4KWkNHLW66/2d+CeIMjN+RMcTPQLpE8F1d/j+q6X5ISC5BfuCEpqb/y00mVM8FOc9P
         oo590kTE4Lirm8a70FnmgDiZdTRgRYqROl32ojSCCVKUPH8Lp3k2CSecRJG6MLE5yGku
         YMun2cLGh9qjGvWjulgypnuHTSb6alCOXUbwo1UKyE1NS06hyBFjIzl0/Hb/E8dlySLt
         Xcrw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5Fu2cb4ixtBF2vOZMZ97iUUMn6vRb5Tq8Zr8VsqzPQml2NuDse2qU+xqTgYfde1tyNh9ygHSKBLzDWXlB3iJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwfuxPAOVyrRmVW/81dltps/6B3MGDK88qXO1MKyK+/S6EFhoCj
	Hw8DmOpg5MPAzqtbkv6H22ylSYBecIdQecG3ruNzfoz5qkoZq/LK2IH++RhK9oIPa9Q=
X-Gm-Gg: ASbGnctBKyvWIIUQZgE716GnW3nitUrcR/P4f7QhQx5nb2MX8QUrJt9+rxTnCblx7PN
	VGYl56V7hpxtwPHuLtXaOl03qUhyPPql/NlCUxTaXZgK1StIe/oEkhvaKmzFSmacPWdbJqBx8t2
	mdRff8oeufSXu4t8hok2VqrUJElPAu8JO/u0qngrYzFfzXEO8ICw0DVNnQ762wiKHvXz7U+6Ek+
	WiO1O5LRYOM70/fMDCzh05ez++S9gkB2y7JyvrmTFiU45PyHGOZFetGIELhhj9L+HBV/prMGAD1
	7E0Nd6wie7G8F8Em0NAIbqg5Mhe9gBSO3EpGWOiYF0hF3gOui30h/JaKpjtt9wn4iSdXamtwsEm
	pYszWXYVC8SjETPrIPPqflK6np97nc0/KnEiSfA==
X-Google-Smtp-Source: AGHT+IGdC4ogFMsxEXexf91ljpg6EYRn8qPLswcfjSbsTOXL/+XMzWhv4EVsfwYPweF3sDqMIP0pQg==
X-Received: by 2002:a05:600c:5489:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-45a1b687593mr20783975e9.31.1755165066996;
        Thu, 14 Aug 2025 02:51:06 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f8b1bc81sm28340566f8f.69.2025.08.14.02.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:51:06 -0700 (PDT)
Message-ID: <272077d5-12b1-4922-b924-a96c34b3b1c9@linaro.org>
Date: Thu, 14 Aug 2025 10:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_105110_811593_B7E04FFD 
X-CRM114-Status: GOOD (  20.27  )
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



On 12/08/2025 9:24 am, Yuanfang Zhang wrote:
> The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
> To avoid invalid accesses, introduce a check on numextinsel
> (derived from TRCIDR5[11:9]) before reading or writing to this register.
> 
> Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")

This tag isn't right. Although this is where the register accesses were 
last touched, the root issue was present from the introduction of the 
driver.

> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add fixes tag.
> - Replace "if (drvdata->nrseqstate)" with "if (drvdata->numextinsel)"
> - Link to v1: https://lore.kernel.org/r/20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
>   drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 42e5d37403addc6ec81f2e3184522d67d1677c04..4e411427303981104d11720d3c73af91030f8df3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -528,7 +528,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
>   	}
> -	etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> +	if (drvdata->numextinsel)
> +		etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
>   	for (i = 0; i < drvdata->nr_cntr; i++) {
>   		etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
>   		etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
> @@ -1423,6 +1424,7 @@ static void etm4_init_arch_data(void *info)
>   	etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
>   	/* NUMEXTIN, bits[8:0] number of external inputs implemented */
>   	drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
> +	drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
>   	/* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
>   	drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
>   	/* ATBTRIG, bit[22] implementation can support ATB triggers? */
> @@ -1852,7 +1854,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
>   		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
>   	}
> -	state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> +
> +	if (drvdata->numextinsel)
> +		state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
>   
>   	for (i = 0; i < drvdata->nr_cntr; i++) {
>   		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
> @@ -1984,7 +1988,8 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
>   	}
> -	etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> +	if (drvdata->numextinsel)
> +		etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
>   
>   	for (i = 0; i < drvdata->nr_cntr; i++) {
>   		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index ac649515054d905fa365203bd35f1d839b03292f..823914fefa90a36a328b652b0dc3828b9bddd990 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -162,6 +162,7 @@
>   #define TRCIDR4_NUMVMIDC_MASK			GENMASK(31, 28)
>   
>   #define TRCIDR5_NUMEXTIN_MASK			GENMASK(8, 0)
> +#define TRCIDR5_NUMEXTINSEL_MASK               GENMASK(11, 9)
>   #define TRCIDR5_TRACEIDSIZE_MASK		GENMASK(21, 16)
>   #define TRCIDR5_ATBTRIG				BIT(22)
>   #define TRCIDR5_LPOVERRIDE			BIT(23)
> @@ -999,6 +1000,7 @@ struct etmv4_drvdata {
>   	u8				nr_cntr;
>   	u8				nr_ext_inp;
>   	u8				numcidc;
> +	u8				numextinsel;
>   	u8				numvmidc;
>   	u8				nrseqstate;
>   	u8				nr_event;
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250811-trcextinselr_issue-f267afa0e5ed
> 
> Best regards,


