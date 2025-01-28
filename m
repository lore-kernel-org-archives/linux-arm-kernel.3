Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98836C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=; b=aKVDrFnf4dBqhNajMB7i8RD9nY
	0pctGs/fx8PU0gVAqTtxWDepmSaVIQw9Z7V4Lmy8ZkGkTxhp1HNaWMYDTK9chjLPviNJwpU0fqYz9
	brRsdszp+zrivO0Td2OXSFyUUNrmnV2V4R4jf6UBcWBgWtriWcWR64N9QCxeKCBGo3gTnJViH4PHz
	Q8xcs16WlzeJfQq5uKLAO0XEBVVjvUnLop+xAIRrhWe+0TwfmBPgxR8AEieQmAc0K8k1FaOTUvjwP
	OTYUKyUn7zkv98rfOyzK24RNF1816FIZzMsttpvGShf07RoWbqaM2ZqaFj1isbmQqRAJMLKYw/djI
	4I29UgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckDq-00000004p9t-2uYN;
	Tue, 28 Jan 2025 11:57:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tckCA-00000004p2L-3KTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:55:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so56641435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065353; x=1738670153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
        b=GGNTbEZEr6r7Olfd04/JPtcejFQC9+adQn27rCQGuJy5LPqsT20vN/vKxEtE0sSBdh
         itA6ChjB9HzmZ5mCEJWJ86wBYfg9GG+6gc3nw8vFauwv1KDmz4qSt47eOcF1kBEhwtGu
         sG//Lk6t2Epov6ntJAnd3edWpINjRnB5b7RXtMYXFM9esggUFJ3GrBPruy6NB70nBwpV
         CIg5VgHyG0jLGdzXljcOhfSnr4CdCj4pM/bQyujUwbmJ4bWUTBKKY0RUcBChwNPBd1ye
         aUEumZyDbDG2x9zJJGi3A7+C7E0ESnhToX4dPCqaP8nz37qfQj+EXsKr9umVqfW0rnIq
         xmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065353; x=1738670153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
        b=fA9Xmw59Ztrj468LZr5PDs08VtdULOkhBi+Vq0CSGsBqcLMFU/CHJmL8YOzH7ASjJX
         007Mk52de/yeRtEzBji6bihDvCUe6UE1838sO7hcr/kokoTsHn82dJoF8IofFgQ2hxCx
         JiqpGEX59v64HwluYIo4hp+vkPPliSlHNdj/wzPgt1YM5G4EzAkfxeaaoqBPKhQxGUJH
         QpmKvwoQkGHdaq6F8tq89vlc1HfWG0jAKtbkXaXexjZ4JGlXnTYArQxRO6jJSJmZXdnX
         WaLkIHH968TTTrJOc/RJX2fZTajSNTIIxiPuLy7B8cnV194OMz7I8lU71jtYDRgXEgCb
         4I6A==
X-Forwarded-Encrypted: i=1; AJvYcCWXftfOWQZrI++lPxlUUofCg51/5arVCydsQL8CgNE5yc+Gmb5pbrzGD3/hS21i+pxHKqHr3t6Lacg+ybrSAg2d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ZuSlMpw0gQo5tl/Ml5dohcGinZ77PGpOnhQU1hM/DzrW54zq
	VyyeUYOi4HAE4D76uQdP80vjryCG+iUsacJiPRVTysLXs5X2fYFjXrLSGLlGXik=
X-Gm-Gg: ASbGncvTu/7zj34u9bm9NkwoLGZ2vrHWNZfRq0WpZTHfIinG1Ip3f5f2ZxAV4L9J+8N
	7ohnf7UHjgNrO51yczs8v+FaBGak6UZga5jbPWq/lPhV0vej3NS2Lrar7N6JZNeisGI8fT8Qosu
	Iaqjx01RbZnAS6VuJWWbEEPnkFbx7eDXWRIaqIVJbeYqIm96uxHtkjKIbh6NbL0beftlK5sUf7s
	HNS8uX+pwlyWtEXTDvlIaoD864a7iH/Xp1oRl+aD9Ejd2b0Eu9hIIe2aghVNMjOGnmUZpueK/8W
	BH1Ql+kSL7PNQr0ZZNfck3FEWA==
X-Google-Smtp-Source: AGHT+IFARZscANUjyT1VVjHj9FJwPk0o4/Th44Oh6jzNuT8s/RE6rZZ0WJ9ZR9mNGMKADe5Y64JxbA==
X-Received: by 2002:a05:600c:3d05:b0:436:469f:2210 with SMTP id 5b1f17b1804b1-438af40851bmr234818545e9.1.1738065353123;
        Tue, 28 Jan 2025 03:55:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa599sm174728255e9.7.2025.01.28.03.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:55:52 -0800 (PST)
Message-ID: <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Date: Tue, 28 Jan 2025 11:55:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-6-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_035554_845974_79CDA957 
X-CRM114-Status: GOOD (  22.41  )
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



On 24/01/2025 7:25 am, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  12 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 321 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
 >

[...]

> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *cs_path,
> +				bool enable)
> +{
> +	struct coresight_device *sink = coresight_get_sink(cs_path->path);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	u8 trace_id = cs_path->trace_id;
> +	int port_num;
> +
> +	if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || IS_ERR_OR_NULL(drvdata)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Skip the disable session if more than one TPDM device that
> +	 * connected to the same TPDA device has been enabled.
> +	 */
> +	if (enable)
> +		atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
> +	else {
> +		if (atomic_dec_return(&drvdata->traceid_refcnt[port_num][trace_id]) > 0) {
> +			dev_dbg(&csdev->dev, "Skip the disable session\n");
> +			return 0;
> +		}
> +	}
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
> +
> +	return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);

Hi Jie,

Using atomic_dec_return() here doesn't prevent __ctcu_set_etr_traceid() 
from running concurrent enable and disables. Once you pass the 
atomic_dec_return() a second call to enable it will mess it up.

I think you need a spinlock around the whole thing and then the 
refcounts don't need to be atomics.


