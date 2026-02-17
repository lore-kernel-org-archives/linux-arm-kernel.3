Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD8FE909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b67H6Br6AJpdiB9/1JXaxdAZWFTKfbCqKai2ICAEzVM=; b=ajm9sx8ZwoWyN0Biy0OxIhVHVu
	Bc5kQk8upj+W3nfhpd6RYmdnZUvoI/1vQJK9v43LJlA5aWYb8L2+CwGpr8kzxT+Q/fVHkKerGd4zQ
	7O3hfkDlI1bsnfdJrrXtjBinuadvCWVxOccFzgjnwGjN/OcZVxUBwoyTl/0ittzQNTOW4JCF+sExW
	OqBwmhF5C2YPBjfAnWGttfBVq+G8GPo6gN/DtUONZnJVrdhoQe8fgYZjzXrvw6F/kPXcWsrIxEqkz
	KtV8uEoLW8a4ia9xLakBR/HQ99IUUSV4BorEFzM9ZXImiTBDRtFYw1uKKMHr+bndgB1c6/32gRdDL
	9gEymr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMQ4-00000008Svb-3piS;
	Tue, 17 Feb 2026 14:51:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMQ0-00000008Sv0-3nqT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:51:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4359108fd24so2998258f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771339875; x=1771944675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b67H6Br6AJpdiB9/1JXaxdAZWFTKfbCqKai2ICAEzVM=;
        b=WNKjw3xrbYlGFKuKJLtV1RWZu62glke7vX16nmw6/dJw5nV1x6XDO5M0eXfgEwE30e
         w5Xc4VFZdEA9OpY/+dAiEDJTazz6MH2sJkFjVjWcxMBsz9ODTa5CmCMTRvjcSKhI5XO9
         fe+tKWc6zv3dOwwiJT2fi5ujRjREPmwmhc5VIqNTzyTStiCHNA9IMuzeh1xl1iEIxY85
         ieMy7XSiFqUaqI5JKowB9+NXvu5slJmw0eMTtNifuhigM7q5MDksCwfsMsCbdA/pdp7x
         nwVtiPJoGvi/vE2qW4W6ruORMAd+IBchRWXehCvA+tiFISeFs8UWNmy0eEMo0JEhNrsy
         FFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339875; x=1771944675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b67H6Br6AJpdiB9/1JXaxdAZWFTKfbCqKai2ICAEzVM=;
        b=bFpRtclZgW9MkkMhfESe32Bfue2+m3jX1YFLewApDweniKRlkZa0kmg2ivbgc13FM8
         aoSaruoVTVgw9hHy9ZWY8V0btsRpr0sgG+dyvuqMYZ1GJUYqd52z4Uza5wVu1sgbTMLf
         E8+DWvISgillppQ966ToJd4eB32UngkM/jjiG0wv7mxnkzL8bVnW99/jJWiBx36z/aQZ
         zZflDJv5FPMvfphD1qIC4gof9NE94XFTNOvwWPQYv4JyARkh8gQK7JkcUSArH5wkPQ8k
         LKpPU+mC37nTJyYth7uy/sJjGde1V5AFFvGmaKBijd2fQknRJzGMkKscy4KWtgFC1ich
         Cpag==
X-Forwarded-Encrypted: i=1; AJvYcCXD1UAHDWDJHbuL0YE2utxioqW7JO5gMyZHFlBN/aIPNfbOq5MVY7GeYb0y/s+OuwaGQgxRKK1ezm88cC2l5Fs5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1bdN2Tr7UxNbl7TbF/fvSUAglOxL2OHW842xM80sT09TxB8ue
	5GRTcDxxNdWtv8cfN9VvIrH9wvJzZNHzsIwQEpqZtVHQCK2DGtdf5a0dg+GK1w8Kd5w=
X-Gm-Gg: AZuq6aKTGO5iw54h/GvX5VqXwpOEm7dfkuKJ/IsAlWkHCTZ6ZkDSyD214uGN9/Fddsr
	VR+bHgd5gGVMTeik4e5zfpRX7HheuFpCs+jTXOysz4/CU7csIIE6uMixxbW8+GDiVQJHiEwJBOR
	rrR9qHXnWrNSMVkscXP02J6TteJPdfU/+aJQxtCq73BucJi1zVnkTz98UYFzuFBZ3J1hwRbUoxc
	+czKtDdijVof0RoEE+yU1sEPp6pd6xW8MS/ZGcUwX4breqtAyDn4HRDghxxbQptRtDCabGMTjIS
	ZgAqMYi0O/6yq8bYcu/z9SG1qeGUhieOEzphnDqOmX8FKyHg8Ao/90QYgljPAXIQHN7t7CbWNCX
	0aJTZyXK96fN7OquBxV+heFH6wf1DDB/os+ytk7UcAlpXJHP9DHT8NNwDH6CRUNi1HHpNoBzwEa
	g02dQuWFb+3C0O3UCQQwnYBVM/WjgB
X-Received: by 2002:a05:6000:1aca:b0:436:2fdf:b599 with SMTP id ffacd0b85a97d-437978ce4c6mr24612737f8f.21.1771339874899;
        Tue, 17 Feb 2026 06:51:14 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm768498f8f.36.2026.02.17.06.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 06:51:14 -0800 (PST)
Message-ID: <bc1fbb7c-94c3-4a82-8295-4fecb4f2d460@linaro.org>
Date: Tue, 17 Feb 2026 14:51:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] coresight: Unify bus unregistration via
 coresight_unregister()
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
 <20260209-arm_coresight_refactor_dev_register-v4-8-62d6042f76f7@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-8-62d6042f76f7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_065116_979710_F106D736 
X-CRM114-Status: GOOD (  19.62  )
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



On 09/02/2026 12:44 pm, Leo Yan wrote:
> Once a device is successfully registered, set the "registered" flag to
> true.  After that point, all failures jump to the out_unlock label to
> unwind the flow via coresight_unregister().
> 
> Since failure handling is unified, the comment about resource release
> for the etm_perf_add_symlink_sink() failure is no need, remove it.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 955af43010446803030973c72f07315492b2fcf3..56320ce49cb23bf7168f69b7f1ad820ca83b8365 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1383,20 +1383,13 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   		goto out_unlock;
>   	}
>   
> -	ret = etm_perf_add_symlink_sink(csdev);
> -
> -	/*
> -	 * As with the above, all resources are free'd explicitly via
> -	 * coresight_device_release() triggered from put_device(), which is in
> -	 * turn called from function device_unregister().
> -	 */
> -	if (ret && ret != -EOPNOTSUPP) {
> -		device_unregister(&csdev->dev);
> -		goto out_unlock;
> -	}
>   	/* Device is now registered */
>   	registered = true;
>   
> +	ret = etm_perf_add_symlink_sink(csdev);
> +	if (ret && ret != -EOPNOTSUPP)
> +		goto out_unlock;
> +
>   	ret = coresight_create_conns_sysfs_group(csdev);
>   	if (ret)
>   		goto out_unlock;
> 

Reviewed-by: James Clark <james.clark@linaro.org>


