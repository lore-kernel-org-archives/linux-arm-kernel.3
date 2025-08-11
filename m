Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD1C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+20LQ4IAs50782oNhums4Ligk+XhQIG/qWbM6HJON6s=; b=vFM6+tjIMqKfl86LU1hMfovZ4h
	MBsaQ7ordXUA04wOCI60UH1kF4/c3IYmn7V3Zz5FvtkQbqk4SMul84kR+Q4tHVAxvJA44FPLr/BGg
	0UVxlaIYKZJdo/l/C0TCkUAr/jWjkoeiS7P/t00Fy8qZ0UbysQR+y0N6BCml/xCVrWO13iWl0qVsc
	tYT/NNBJ9KzGbVrmzV5LIp6YLqknm48d05aEDJtaBotyWedt0rMyRMR6b01jRbe5KzNRVwTAUBBFR
	IBVuWULRHSoJW4R2Q51UzDBOlNSwscwtF8oWarnjs1xD3oBKxOZV1wZ/ZdMN6Hr2gMJ/jJMmsQqzl
	yKaugQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ3A-00000007O1S-3TJy;
	Mon, 11 Aug 2025 10:46:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPiN-00000007JVg-2Eoe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:25:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-458baf449cbso40777695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754907914; x=1755512714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+20LQ4IAs50782oNhums4Ligk+XhQIG/qWbM6HJON6s=;
        b=tMhOkkUbJ3bHfNL5Z/rHdUJqaR3yA7v2mbW40QlZR9L1oAjNEHM0E+/F1JZOsXU9C+
         mdBP7Pe/R+FLrr2RQ9+ThmRAam86UrX6IkWhj/+yuwV7pv9v/u4O4/I5SpmyTjI2Hclj
         dKk6CHR+SgXe/zxhJZYmlAPg5sh8p/oP28fvUh6szKB1Av9OVBftw5oVmbTs9rorZpR6
         n5JyCJ+tq6KDRw7K3kCbDrFf9BFXV671Qe50Fi7JY55mEknMXx4axZ/mLnixdBfeSQFn
         jGYW4XkUo3glWi/rCvWcIqf2BT7svZZ7BLYTiK2F0rPkW2JpawwgVVBiUV2oktvNRUZi
         ZUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907914; x=1755512714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+20LQ4IAs50782oNhums4Ligk+XhQIG/qWbM6HJON6s=;
        b=NM0r2xBHT3hh8gDVV8oLwa9vJswV6SJOOa0Eidep/JLA8XVgqw0KuyJyIZy72Dk1ZW
         Msr1oIIfSITS66fScJ8Lmf9yho8KDrn6Ii+/SlOjTJ5VT8Sh9oT6rCWebaN36G6/+SXx
         pUt/gnb7R5csvRfz6pscHaq3Xf+sikctfVAui98PC8V21GJsJHih7e2bfoCrVq/WTu37
         kxS/dvmB69XqOFEXWdPx8fIn5ALk73/HvyC4WLCe2/aYl8x2DmCxZ41MJ/pOL1UwFZwz
         H1HlbXEPOsZbDKK80hFhrOaHyh/f4u+7ZWQ0pBw44OJE8d9iNCg86aa+loAQ+bT3Sgtj
         cWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWLBrN5h92jDiUk0A7NPaOgCUhBZbcs/yhrz72MK4YWd6295eoCOUSpJGTmMtEmqpmXdnFms8ivGkzoqi85OxTz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx01nY7y1wWZkK4LiBryAI5sjjv1rFLf+zfjG1eX10NyC3k/rLQ
	dNL0jDemWj+C/joMsX/XHI13EnFw4dsEPxPd1040+R4W8SVPcaH4ihsbvw/EsqvO9XA=
X-Gm-Gg: ASbGncvWb1P11xKJTCXpYUWofD198RV/jfY5NCp+cQt4dXsv6VniWzYgPcz1Ht1Foc9
	46HovfMyXaJ4CpW00o7LRUBpMR+7IJuAjRzSkJp73Mxdjbr7TgCtR+oaNufsEgE8fkSKuAk0Fqk
	ivBCYvszocw7kVRgNuGjrcXkf+QIRz6dndWUSr3A2LRkh42xRHaACRyPhnVX2U7+FqPoAKvKyp+
	+LOSnai0bu1z7LyvpIu5tXQax3VnYqXi6pyGBVdGFagYjg3M2E6gDX2/6SExWMSm/FZ5SISn3E2
	JN03wZCDEIHA52KsxQEQPNqY81AbO1d8LubuK4i9fsWp+W4cBo+HfT6U71VxyhzoYEn87h+XJdP
	h6ouTyMk8m99dLpTwmyrRXhCNw+g=
X-Google-Smtp-Source: AGHT+IFgXH02O/YQvZLqP0OZQeahzbzE8tZ9VkaKNzJgbDPsZVvgFU+YvPp6zt7EljlXrttQ/pHNqg==
X-Received: by 2002:a05:600c:8207:b0:459:dc81:b189 with SMTP id 5b1f17b1804b1-459f4fc40e3mr132304345e9.31.1754907913809;
        Mon, 11 Aug 2025 03:25:13 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e583f9fcsm243685145e9.4.2025.08.11.03.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:25:13 -0700 (PDT)
Message-ID: <de68756d-7ef4-484f-8eb0-26a88ed41cad@linaro.org>
Date: Mon, 11 Aug 2025 11:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_032515_593997_FBF9B54E 
X-CRM114-Status: GOOD (  19.74  )
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



On 11/08/2025 10:57 am, Yuanfang Zhang wrote:
> The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
> To avoid invalid accesses, introduce a check on numextinsel
> (derived from TRCIDR5[11:9]) before reading or writing to this register.
> 

Looks like this should have a fixes: tag.

> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
>   drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 42e5d37403addc6ec81f2e3184522d67d1677c04..8a9c4caceff0165e4fce7ac4250f3e16ccc1d34e 100644
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
> +	if (drvdata->nrseqstate)

Shouldn't this be "if (drvdata->numextinsel)"? Or it needs a comment 
saying why it's different to the others.

Otherwise looks ok.

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


