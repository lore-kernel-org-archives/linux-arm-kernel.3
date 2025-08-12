Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3FFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApHNj7yZvO4jJFb6PrP/BJ1XkJPLeNWnc1hR3D0Tv4c=; b=suwrqWjpZXrLHM8TyaFmKVyLu+
	zEQ4CwgIfyyHLSIc9YEBl6Q8C08N0sOlaCmjUVu04ycHpUQWJI/EMkhhUwFGbgzSbpT5a8oLmAt4X
	667DZ2nBT1St1FnaWb1x8NoPVJ65brL8Z6jrAaWWH111ht1avW39fV4b1jDir3rv8TUWgRt8sGocp
	Os2aNyIPgTWqH5u0bX3l3o5UVzBhMDcPgY8ED/L4gKbo830ASXm1Rje6I3CWfQ4ysGgOTGioWXCge
	ldzip89g9XQeK5QY2eurlY92zQKnFfJdup0Co0ynJZsCuXrOaJ8NVPUcv4BE//Wcf1FGGEhR+/T79
	qS+RfGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqMo-0000000B70x-3eq0;
	Tue, 12 Aug 2025 14:52:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullLD-0000000AO8j-1D9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:30:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7961cf660so4210421f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754991045; x=1755595845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApHNj7yZvO4jJFb6PrP/BJ1XkJPLeNWnc1hR3D0Tv4c=;
        b=vXJhooywch9e3mNWYBE4/AXYVLueuVp0PUMN3dGSxWz34VVKdpiIdNUK95h6WqczZn
         06EDCR9qU7fNCFhd+7jiEAP82bTg7QaeTdgoj2HMfJERX8ZA35+hfJds3nXeiNpMxmZI
         u3HGhZhnvDgN4wvYiJxnjRei82a5sGyqY0Yhs7WSIMj+nTo5C0Edsivf8wZTvhChA04o
         QInUzhbRentaSbIlbvpHNWZpDIcaJKTPgecmBElz192Xwb73qoEpMUFCfCj/JwOQUqsr
         dIB6Hs/7UrJCeUp2XtL3+pgOdZQ2QKXmIHU2qmGjkewmKwaP+6gK2v4A96jGrc9CDJ7o
         pZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991045; x=1755595845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApHNj7yZvO4jJFb6PrP/BJ1XkJPLeNWnc1hR3D0Tv4c=;
        b=Txc8NHvaIqAiKGNCdEPaSvkdgm3dYb31JglPN1Irr+c+mqJcTDph1PNyny4Cl/YfDI
         frmUEiLXJyyjIEHbEMwlrsxrgqIOFufRmYsczPsSDt65MEkv6GU4vjaaaEGSk1lBz1px
         B/vr07s/z0dymKHayWbIx2/RuRqyB+7CPgBcEGuSEoVsWG4ycv6BB1cALWCZZ/atrgkE
         0cpQyF3aKsyP53dqk0wp+z3ut+XkXwcX4NWzT9aYziOKZ1qwI6QduLInAJpe9njb0Lle
         FOTyoalAGz+UXJskaOFaQBSk8iPIhbsWGnrcTFx475DyBaVKb5Jm4M8Q9WfKVcSljgGw
         sHEg==
X-Forwarded-Encrypted: i=1; AJvYcCW9aoUMZ3i6NwbK6ZwL1PKLgofWfSbtt3hoB7CB7bSAiEf8o0ZJbHdt2MsMaMWEuemBvjcZj2IJlg2RuHd28Tzl@lists.infradead.org
X-Gm-Message-State: AOJu0YyF3rBRa/BpUHsyKvg53tPTpwRGWTwZ6wdQKp2sLE1yMZHLkD8e
	MTIHzF9Y/JxDXFGvGjgyZL2RlFF2wqrf30PdFyecAczr5gB28gfFV9maPk2cFKRSf4w=
X-Gm-Gg: ASbGncvJxeTgbBtmO80c/5hLzBgwl2mJ9Rs4zrTLZGgUu1NKv/Cd2RzF2o2Mojl49Xb
	4h95HaQVtfBbdKcOMQ6XmQslSKg3rwr092i1LCAITPNhoN0TmM6ea6q3/2+Vhm/hMrYUwWq4XVv
	yy2tlK+UwDgRd4HoEPLIN85qQOjMUb1OHCrdIqBAGdm6sfXoqBxnD1jCVzUfF/PafdpJTOgKx9X
	o9CduyZnmj0TZgzYew19t/Dgm0ILlhw2QZCWJLOLfyySSadEJ/LNR5CbIOoKP65A8aYnZL+QLME
	x1DKgRC/+nFvaNcMlTiLYsMRqaVSRmJugNceZ/Ov/uXwhz6C+GVxWEUP6AGV0UHmnpX5+q+8Fg9
	RWtr3w9n8xYxGINdR3rP80l/z2x4=
X-Google-Smtp-Source: AGHT+IG43aUKBGp6GEVejGh0g6YqJDKDpg04fc0cvecZpxEcGicPXu5t5quNi7mcLCsCrydFcL/cxA==
X-Received: by 2002:a05:6000:3104:b0:3b7:9dc1:74a5 with SMTP id ffacd0b85a97d-3b900b80561mr10991013f8f.52.1754991045510;
        Tue, 12 Aug 2025 02:30:45 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47c516sm43931526f8f.62.2025.08.12.02.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:30:45 -0700 (PDT)
Message-ID: <c527e86c-916e-45bc-b469-8d5c94e980d2@linaro.org>
Date: Tue, 12 Aug 2025 10:30:44 +0100
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
X-CRM114-CacheID: sfid-20250812_023047_336681_6597F2D4 
X-CRM114-Status: GOOD (  19.99  )
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

Reviewed-by: James Clark <james.clark@linaro.org>



