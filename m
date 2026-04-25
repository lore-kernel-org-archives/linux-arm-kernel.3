Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C4FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0RshBZIRutdI+obaiuuk2MoPoQSldBM8MBOZQb6H5Y=; b=fL1Vyhas3NLNYYGF7IS55fhWob
	Eb0DcMTmuQOQulsGP+xiFDRAWJL6nHcDtC/kqZRVMU607b/viKyWaw/VLCmprhf7x4fICNv3irgK6
	WmPPaHgT4ZRo+yluBQ8oj6YFKTie2/3STMTeHExMEsFEss4vn7XK0ptaDvdFpMXQu4gw8aPBhdmqi
	Ejmo3yI/zkXehHm13Y1bkjhRi1ssQbWjKyOqnm+QukTni3i8dXg2IxtIjJoFDsznyPDVTZjE2AuWL
	0qb1YzpIRhMlmv6pPCU5ALQEl2v+uWMk8a3MewsBHrGobpF5BOUVJXn1nCpipwF+KZjobu3wtk41a
	+wAhPNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfh7-0000000EZeh-3LER;
	Sat, 25 Apr 2026 16:17:25 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfh4-0000000EZdi-0zpK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 16:17:24 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40ede943bf0so5883633fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777133840; x=1777738640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0RshBZIRutdI+obaiuuk2MoPoQSldBM8MBOZQb6H5Y=;
        b=sa+XEsZZGG3I1WQaauyfxAJ1d4JmIlE9S0fcEw76h6OOm5zGDHoygnkUHQSdB6Hew+
         NgRPbkdD9i6bjhu5Kyf7XCbUdse8xkOon0v2s6aC8MGqkDY0dHqdqsZ8vxXK+bzEiBiC
         pxWCbGjNPrX7SPSWBK0wog6ZKEfQZfSjTHRR3YCPfTZCfBijJijKE1woYhXm3oeo0dyl
         4t0mzCk8d/7fP1QWCzEBAUkMhzjj3nRlCV6+dusR07hah3Mn4fjFm0DUVVxoSNROQ0MC
         GZ+6A4da7XoTeOp0aB34J6a6Cp/klIhypZ1FysIGnQfALd0F+keZsf13MtALWMpTQ6CT
         CIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777133840; x=1777738640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0RshBZIRutdI+obaiuuk2MoPoQSldBM8MBOZQb6H5Y=;
        b=M3cSxBOX/A6cpuyGA7IWW3frITrYoeidcU7SVpOgCNBEScCW0IOodfThGdZ2/sgy3z
         ClpxJrMwZcdNSrQnj4mbHMZ9R2LlxsBNBM7LLNpA/9NW0WXcCMgZ+PUiCyHM9VB85j2V
         cZpX2S5A+jaOA0P6015cyukDFU+LiHmaU/B/cdhEFd8g0vnen5xSdYb22oSLnMQfK2LN
         G0v8S7bV/nZYiCRXhlLq90Q0fK/wmQ7EpAs8rQcbG+wTB1M/26cYksmL8sRqmjbuKKif
         7N6NRaTFDzPn9AcSjsA96M/fYlNfVM5PyQQFA7dXbp0tuta2is/QYj4r1PPf10UHEkhT
         l2MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/983Uq1eVbA7D++DLg/gWFtxEvpWHgHMdksVKHTKbh2lq2Qjvx7zLsxhSs/HDZkeiMcauACQKsaazjxsic0rIp@lists.infradead.org
X-Gm-Message-State: AOJu0YzJK0BEzjx4S1w1zhtuiMr7CRUKj8FvZTbpBcmHs8+ZD2PTZiC5
	5vAgKE1WCY4yznL+M+J0EtNueEcuP8TZGAGUUBxU8Nm8+30GztvIfng519jGeCRRj+E=
X-Gm-Gg: AeBDiesoomX6wKEAq015dYyrdE2OFmQ3tzvgVtmDSKCgSu+Jitezudka4hLqAKzlUIx
	Bz8wsOf67+P8Vru7ddORldsH6/7UD+9qnH2tBH0fDUG3SEkjR/GiihtsTHHP47/8Bs818Zranol
	QMWcxL3oCNn7MKO5YV+eTcvmIqwWi5ud8VSTZjl4/krsZ4XGSBa2SKiOGdt51FOy0n2Q43unzR2
	PYhB6MyL84z35oHjz5i9MqeakynHvBzwa8bQKWTe0+5qcWjU2ktyidX5KFDbsOHejYaFwXFZm20
	EFGa23xM+4dULz8SJL4uwWaBI9jFPRJJ/kABeK4Z6GSzsU90YFsz4gxjKkp3/IBWuYLhzkvtvxs
	gYxvlqYRZUpC4Nb6NoIiJ1RrlnOlvEl6Siis6l4qqc0IgvvnLnsaH+FFeFNiy+CLNDGUjArvapq
	8n7T/moAGNyO46YzUeGLAiFk7opfXJtBia2q8NCWEV3TG9BqLrQX6Pae6VhpPqeDeYfbHEy1lVm
	2a0osLbMpoi
X-Received: by 2002:a05:6870:9f86:b0:42f:cfae:b54 with SMTP id 586e51a60fabf-42fcfae0ec5mr9611847fac.32.1777133840390;
        Sat, 25 Apr 2026 09:17:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:4237:7c82:cb4f:1d6a? ([2600:8803:e7e4:500:4237:7c82:cb4f:1d6a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930bd9f2sm21717224fac.8.2026.04.25.09.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 09:17:19 -0700 (PDT)
Message-ID: <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
Date: Sat, 25 Apr 2026 11:17:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
To: Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_091722_557494_C45E794A 
X-CRM114-Status: GOOD (  15.00  )
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

On 4/25/26 11:07 AM, Felix Gu wrote:
> meson_sar_adc_temp_sensor_init() allocates a buffer with
> nvmem_cell_read(), but the old code leaked it if
> syscon_regmap_lookup_by_phandle() failed.
> 
> Switch buf to __free(kfree) so all return paths release it.
> 
> Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/iio/adc/meson_saradc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 23991a3612bd..9708ddcc4919 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  {

Nice to see one of these cleanup.h patches that is actually fixing a bug.

Should `#include <linux/cleanup.h>` though rather that relying on it being
included through another header.

With that fixed...

Reviewed-by: David Lechner <dlechner@baylibre.com>


