Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A5C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW3LEfjTPLKPIEhN48PB0+fej5z0A3OPZy5r028XBjo=; b=uBPwYNaWmHsM8WHZHsQpmD8Vd6
	D/Krb5eOxSKNel3qlPlDotBSK++JM/vEsuJcZA7bFES0fI4plGhQyRSLiir589c7tu39aKtp3scfO
	iJEhXlK+nyuXjHhVMAnfiV/BfD05p/HdH14UFZRK6jPzioQGb1HF4QwZjSjgc1lEcWVRHc896GbQc
	QZpNQOLOm5oQFBmRELd8M5v/tvyIPw0yvri9G79abZdmQ6VkqOI7Vnxa6Ga5TOEk9WAvhBGFi1Djh
	HhjXOs6FtL6FIq/UmGoUgtvc0TbXhaRGND4neMyV1ptM5+2D0X6qww8YGBnEDreyjrNdp0rRdkVMp
	NuZ2nM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Lm-00000007W1y-2rEw;
	Wed, 29 Jul 2026 10:17:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Lk-00000007W1E-0q0Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:17:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69f7130b47dso1121383a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785320238; x=1785925038; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW3LEfjTPLKPIEhN48PB0+fej5z0A3OPZy5r028XBjo=;
        b=bIgP519Yusi5tYy5iwiw1whJTfeQrGfH91Nvydv92heAwxQhOuZ62lM30GVrn0EBiN
         UhbB5lu1lGS8jxiUQ4tlVe12dvydAMiESAiEcT3jhM5Fr+iLK9PWd1TpyOS2Nii1W3V0
         NFkLi564dlbVY5ioPtDk/zTBIAC5EoHcAOXNn6lM3BydyJdLSC2D5xqbbeIDaKlFC7tF
         SWRjcfea84duOccu2SLGdiSE+9UuYH7HSHQu1Bdnj4cKj90F3dSoUmY/9rMKD7+aXoGk
         XTzMbPMtEfwWABlkoQrUYUZ+YDQ1PaGK8xBSEv1uxZfXMzjeLLj5ah+NHb2Tmd6X/7xY
         863g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320238; x=1785925038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW3LEfjTPLKPIEhN48PB0+fej5z0A3OPZy5r028XBjo=;
        b=W4HEPi0KkW7GTK+d81CjELU73fYW5PYG72sPGHRLq3SaOOsEjWTouDZwdJQub3hgqm
         1g8VH39xAPzls/Evnyh+G/SnQoe3ke3NYDg9qrlkyPPHE+7q4fHLht4VdlqqOpVc00PH
         T9ttINeS3K3nroORDKgXFwh33yS4ufyj1EAhd49S7gP9B9jEn9UMH4WJjHoZNoeGqGtG
         PrssjkXAIoTLCeiRXlBWdpLaqfWUctZyh9Gw/UBPwbNLqXP6ePEZ7hjbgvAomAcu85s0
         Tqrm32On4sFzvMmHi/o78g0II92jV7RTTeKmfoqLr7hwkKGZ2gQCctf5FcHlqRfAmHZx
         J+7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaYiCkpxRWTnrjHAMGs3s23yiCwQTuetIjbOe7gXPJ+dTlNXgt+OEKMxaxALdg+YsU8MNDlGXmQSbi02o+BvBh@lists.infradead.org
X-Gm-Message-State: AOJu0YxHXrRtOMxN2AOA1Fx4PWF7PwQz0eu+irCfLwcoxBv12UTm+cnx
	Se5yHFfnW1W4UPziJ5k3POSXXZmG01EacSNR+sLS0s/roQoTCa7R0uGwh4Zu7SPIPMc=
X-Gm-Gg: AR+sD121G/M/q52Zldeok8SbU1i6OKq32mKE3d7jBEd1vDjGUPOiLoHsdk8VNtq31N4
	Rpc8+AObscOGcznP3j7nOaoyD6XDYmeATsLFpjI3Vlxxg7/AMfpntd/RHbWdltchW2BO+AzB8IS
	62VlzC49thQU6/TSGZRMTxm/E71UdaApEyTEghGq4ducDdQxu/O8on03vSb7NWxzmVFA6sp+D4n
	oT7And0QQPeq6XSE6/vKq/O+hqx+jXeB/QiO2JRwGaYL430sKE6T23l4DaoaDEDV8RAZe45rSWb
	iblS2hJsreYidDsYpON+14t4ET/MVonySYiGBXa2ZCZpfMzVQsr0AkYIvPRvdbv5PXvLxT4/pRq
	QveHSsvXWDsnzf+gK+qvCF+9ddvBEMcK0RHaVtJD51EvZ4nFW6C0/NcJKNKYc2nNHIZs/j31zmj
	3QhY/ggEESZqrT27j1pLS06U+nq9F5y+Kfm9QUZee3boTOX6a10oI04SdFfPKcwK4q+CWVrp+O+
	bBH
X-Received: by 2002:a05:6402:42c4:b0:698:aa88:56d1 with SMTP id 4fb4d7f45d1cf-6a034a88210mr3501753a12.25.1785320238373;
        Wed, 29 Jul 2026 03:17:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c5cf0bsm632696a12.23.2026.07.29.03.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:17:16 -0700 (PDT)
Message-ID: <29c574cf-eeda-4d29-a840-000d62ace604@linaro.org>
Date: Wed, 29 Jul 2026 11:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf hisi-ptt: Fix spelling and abbreviation errors
To: Sizhe Liu <liusizhe5@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linuxarm@huawei.com, prime.zeng@hisilicon.com,
 wuyifan50@huawei.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, corbet@lwn.net, skhan@linuxfoundation.org,
 bhelgaas@google.com, yangyccccc@gmail.com, jic23@kernel.org,
 john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com
References: <20260729060220.624250-1-liusizhe5@huawei.com>
 <20260729060220.624250-2-liusizhe5@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260729060220.624250-2-liusizhe5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_031720_268496_95E24330 
X-CRM114-Status: GOOD (  18.05  )
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



On 29/07/2026 7:02 am, Sizhe Liu wrote:
> Fix spelling and abbreviation errors in the PTT packet decoder:
> - HISI_PTT_FIELD_LENTH -> HISI_PTT_FIELD_LENGTH
> - hisi_ptt_8dw_kpt_desc -> hisi_ptt_8dw_pkt_desc
> - hisi_ptt_4dw_kpt_desc -> hisi_ptt_4dw_pkt_desc
> 
> Cc: stable@vger.kernel.org
> Fixes: 5e91e57e6809 ("perf auxtrace arm64: Add support for parsing HiSilicon PCIe Trace packet")

Probably doesn't need a fixes tag, but:

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
> ---
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 20 +++++++++----------
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  2 +-
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> index a17c423a526d..c48b2ce7c4a3 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> @@ -94,26 +94,26 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
>   
>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
>   		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
>   	color_fprintf(stdout, color, "  %s\n", desc);
>   }
>   
> -static int hisi_ptt_8dw_kpt_desc(const unsigned char *buf, int pos)
> +static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
>   {
>   	int i;
>   
>   	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
>   		/* Do not show 8DW check field and reserved fields */
>   		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
> -			pos += HISI_PTT_FIELD_LENTH;
> +			pos += HISI_PTT_FIELD_LENGTH;
>   			continue;
>   		}
>   
>   		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
> -		pos += HISI_PTT_FIELD_LENTH;
> +		pos += HISI_PTT_FIELD_LENGTH;
>   	}
>   
>   	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
> @@ -128,7 +128,7 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
>   	dw0.value = *(uint32_t *)(buf + pos);
>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
>   		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
> @@ -140,16 +140,16 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
>   		      dw0.len, "Time", dw0.time);
>   }
>   
> -static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
> +static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
>   {
>   	int i;
>   
>   	hisi_ptt_4dw_print_dw0(buf, pos);
> -	pos += HISI_PTT_FIELD_LENTH;
> +	pos += HISI_PTT_FIELD_LENGTH;
>   
>   	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
>   		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
> -		pos += HISI_PTT_FIELD_LENTH;
> +		pos += HISI_PTT_FIELD_LENGTH;
>   	}
>   
>   	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
> @@ -158,7 +158,7 @@ static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
>   int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
>   {
>   	if (type == HISI_PTT_8DW_PKT)
> -		return hisi_ptt_8dw_kpt_desc(buf, pos);
> +		return hisi_ptt_8dw_pkt_desc(buf, pos);
>   
> -	return hisi_ptt_4dw_kpt_desc(buf, pos);
> +	return hisi_ptt_4dw_pkt_desc(buf, pos);
>   }
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> index e78f1b5bc836..6772b16b817b 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> @@ -13,7 +13,7 @@
>   #define HISI_PTT_8DW_CHECK_MASK		GENMASK(31, 11)
>   #define HISI_PTT_IS_8DW_PKT		GENMASK(31, 11)
>   #define HISI_PTT_MAX_SPACE_LEN		10
> -#define HISI_PTT_FIELD_LENTH		4
> +#define HISI_PTT_FIELD_LENGTH		4
>   
>   enum hisi_ptt_pkt_type {
>   	HISI_PTT_4DW_PKT,


