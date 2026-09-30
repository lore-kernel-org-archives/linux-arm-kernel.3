Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D8CCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=; b=t40M2t0Jq7+WsqDocl6WNZ7xPQ
	dWAPpJQcqxUX4RFyB/B0gU3DeeJS4nmi04xHEV2WBFV1aq053vwrvEoRE1I+S4kX9MTL6Tn/v2bqu
	BWMSR306VC1bxbMpaSrBdoRZxzWMkepWuLViHxh90T4Sbwsr52JdwsaklwKQiggVaA3HwFFS8YaD+
	Y+fe89vzAF58bDxKl0gdliIQILSGiDJ4pOoJb7N0ZDeyGCRXoSRyi7GA+itEDiB95m+rdlT4JCH+Q
	FyugL24uTUAs2pe1l0ZwkYi0r94HiyMFqB6rcphXpVU/9UTxQdaZIGqQuDRFUCi6JtrHOy95F8mn+
	2m2hKLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvhu-00000006OUc-3k8Y;
	Wed, 30 Sep 2026 14:54:54 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvhr-00000006OTo-2077
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:54:52 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so30921735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780089; x=1791384889; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=ONrf0kJMgRKZd2eWzkAE+vd5nPqGlDCcQE9Owa9J5RI6zssUtioayPUZl1x9jTRuC9
         +s2hBhu0pVR0nWgU89eiQVE59oWUIbw1WUpgijKhHpRydW4/WcmEfv6jLyN9odDpTvmV
         AeUPIYm/Pp5xDeEtmqD3SUwgAw2NaWQkZKnaogV49cs6r6MplhGVwbuO5JK0iyWU2IVA
         TJXtuLaPJ5BSlHlTkdN8BmvvZ4h0VSITDL2w1OesdXdarzAgLGrPjGppidPU+tRrsQ8o
         mWXURzG/BLzbmNQj8gZXU4oQ/6DuRfBImmWshYC5ydavOwCb/c+86W3mWmkyXfTJ9505
         CiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780089; x=1791384889;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=r5/+pZpK2jLF11ptqj0KJcO6ZpRR8xLrGcK9TU1zzAKSMctGt8PRBlG6ubmzX0TVM4
         F/HUESZNllwrK2IpKWXkr6Cp0oOM7mESqndj0t1IRzkBrpMMD5j0O3hNeKqLTN4AvBTx
         AGmxrBR4AGP0nk1+dPngQ4Z5obPncDvKBvAw22bwg8eEe+6U92GS4AJcKA07WOERjVHC
         Ekded1UXuw8nsHlvWrjRZ6yOxcGSNYSwLPXauNPI4uvAFEikpvELQCYLGaEJPuhh6v+x
         4EQ/jKq6nRLOWhmZCqU2KeIZBM9G3jq3fzkyMcReZo28tN9DBZ7/VwPLohFA6X5AfGIH
         woxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVr85j/bnCZgrMijCZ3XOzfAMyJGU61vXc7XE9Q4W4qLbm3uW39/CstVMCinGDtNDHOMagtpxXEXjre7BHzA+c@lists.infradead.org
X-Gm-Message-State: AFuF++kZjxLtpzIVW9pTJzNUdTka40AbGzs2BeW6OMBhqLVdeaODz9h4
	36yOC/s3HkMumIstayB6sro3pj9v5Nns9zvzDQZNnNG2xwZ/7Mmc27dT
X-Gm-Gg: AYBFou1ysRzcIR4QogS6ve+avkqyaVkJBHWAkhZNtS5Qfq7ujrmPIiG9rZarsEWDjyW
	XTAh++mpZYIIdt7f0B3r2JSXHwIeH/t+hk3HZxyrv9M2zrn/7go9/a4whNySz8bdqCNJp3/SWH/
	kjre3iLdwEzU6k7LrDu+vZKww4krlkMGuonroCmKFqApV2+gAxgBc9MLs9lvjDG0q5hL7AYlaew
	THucGwv6JEu3sKRtp9Gt9Qcp9tI11avR1emng/BwvGRjR5o2DOp14S3kcOZep1OYhahfenE/skc
	yOLemFC9IKTywYIGRdH5Mn2w+FOaPuMd8B6KV2XKBt28o0oiPSSJ9QNyFPDtf6evMBcPEZrbwq6
	PFr+thLLKoriP3nT4cmn9SXyF9Zl/CNd/XzltKiuaVPVAFXPkWk5N+ljfh6aQibm8yQDinl7SF1
	EMc1zWhhOQnmnAHqFYFF9rHToP7mLFZWu3oXEVwCfVDKdqarw7i6QoHKQ/yppGV1q1qMKpjxNRE
	PcuS3BqCzkC4BlT4tUz+kzz0mXakQ/4yptHMCZJ9/RGNuHezXDMfDMeFIPkMB8AK4DPH21zaCQf
	uYZayPf9hS5Yg2Iu4AQEjkyTCzrwW5ekK7RNl+tVV+RC1HTmeSIceYdTO3qaISsL/UIrp7Tw4dk
	WCJ9wbVn/sN1SWPDe5STbzu0LljMQFYB1oWosBFGunI7XIxMQ7eE1wR1Coz1f5VxqTego+CmqSZ
	1GsRc1
X-Received: by 2002:a05:600c:a00b:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a01c69f64dmr14101255e9.29.1790780088847;
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6622e1sm4236005e9.3.2026.09.30.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:54:47 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 04/15] iio: adc: stm32-adc: manage characterization
 voltage diversity
Message-ID: <20260930165447.000046e4@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_075451_847846_AC83DBAE 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, 30 Sep 2026 16:18:25 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> The characterization voltage used to calibrate vrefint depends
> on SoC family. Add vref_charac_mv field in stm32_adc_cfg structure
> to store the characterization voltage for each SoC, and use it
> in Vref computation formula.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2:
> - Andy's review comments: rename variable to vref_charac_mv (unit suffix).
>   Drop the const attribute.
> ---
>  drivers/iio/adc/stm32-adc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b..fa46803d54be 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -43,7 +43,6 @@
>  #define STM32_ADC_TIMEOUT_US		100000
>  #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
>  #define STM32_ADC_HW_STOP_DELAY_MS	100
> -#define STM32_ADC_VREFINT_VOLTAGE	3300
>  
>  #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
>  
> @@ -211,6 +210,7 @@ struct stm32_adc;
>   * @set_ovs:		routine to set oversampling configuration
>   * @smp_cycles:		programmable sampling time (ADC clock cycles)
>   * @ts_int_ch:		pointer to array of internal channels minimum sampling time in ns
> + * @vref_charac_mv:	Vref characterization voltage used to measure vrefint calibration value
>   */
>  struct stm32_adc_cfg {
>  	const struct stm32_adc_regspec	*regs;
> @@ -230,6 +230,7 @@ struct stm32_adc_cfg {
>  	void (*set_ovs)(struct iio_dev *indio_dev, u32 ovs_idx);
>  	const unsigned int *smp_cycles;
>  	const unsigned int *ts_int_ch;
> +	int vref_charac_mv;

Case-sensitive units if it's SI is preferred in IIO, therefore *_mV.
(checkpatch warns against this, but just ignore it).

-- 
Kind regards,
Joshua Crofts

