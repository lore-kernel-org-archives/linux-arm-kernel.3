Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F0D5CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heM+XH6baATko105nYV8E2040lmy0LhxFZdot+CyuRw=; b=wfZK95Hvtx7rM3sD4OF4Md5W6a
	b9HDkvrubeSfwvJGy0CdCWj4AT7D80yNCeJnTcgxfwiMDuYSuNdt4j/ALzAEx5IQUJeyPLF34KNxs
	4DMKeKBaJUfjXHgihTRo3hT6xskwvimSLBWRkV+uTwF3QtfX2Y2B1UqhGY3FAtXIGHkhOY4Ja+jMN
	3h2Lp/5V/ipN7iW8aYGzy0cG/3JXcymFLIQZZnZwZYoII4bTER3fjda8jvnJtZcged1edwLkLgRcU
	D86q9kgApIpECOfmyAj+8ZvON73hc8LEIb+3eCQ4hlifcaboa7IDfijHCkqaTIUb9Z6ugo0HAzQ0t
	BcvCOrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67Qu-00000000G0B-2I5T;
	Wed, 30 Oct 2024 12:04:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67NC-00000000FUO-1sba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:00:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so60698295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730289624; x=1730894424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heM+XH6baATko105nYV8E2040lmy0LhxFZdot+CyuRw=;
        b=XIKT+pY4yikhNKmLXwuoaYy102y5nInN3IoRBusSsKqowJ8PQUsaCmhT0aIwAWRWVo
         dU9dW8akI0Sc0TJoWx2+tfnZvKFVLpSiEv8oqKcuf1Gym8e1pOwLGHzJ+km8NPFdag9/
         YnAEcrZj8arHVVz0gLeTZ86alooyJ7DO2xEO+lIJFtcU1f3sRCliRblYas38YVm6g6a9
         apZCL9ihfnwxIyz4WxVQ8ooO2a9HGjjBSA9ZmDssgZBScVjc2ojMzbl0k9is+9oLqvZD
         PxnvvWl09smHFb6CbHjGUof7lqOv5R2YCVrPh9jIrK9FnFjamm0rd5kiuY+luPqccj4D
         Lo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289624; x=1730894424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heM+XH6baATko105nYV8E2040lmy0LhxFZdot+CyuRw=;
        b=vdvbSwW7yE7Ssv/dDY7HxfVDYQRaEEWmgZd1zHVOUP9OctXcrtBq4e5bqUPFAaKJ4C
         Eii7mqJbCkxvLEUQQ38m1HDKa1FpKgZCH4NbOjGjuzQ21Ba2U5SYBhiKu77hK0ZqjmO6
         jCdkpMH5JE9e2MquwvVTQr5T4YNnGau/zu0VTdUacqwZuG1pmPumd5olmU9LueX0KGwK
         fqIoI5cx99YipRVLKWQzksN34ffveARUVf/uNLydr++L5f/eclyWqZrbLLzCp5Wx3y7h
         5PyAN3rceamdBavpH27lnucnK4klqcFsm4IXHDXjluBMqHGQtmBcfZDLoJUPdDB+yq4F
         +B3A==
X-Forwarded-Encrypted: i=1; AJvYcCUU3AtzsPKaLi+9TSGCRVNhhCiRV0QQJ0tZIApJwc8vl3FaunvHk1W7mHzmXJyEYZTNR6mQGfduWiiqfbA2z3RU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2Qu5Cst2HXI2e45munGqQtTzslaAkYl1uBpuw+6zpoyXde0M
	nf+Q2KI995Zx+LjxpYg2CZOyr/mrBFwnMHsfqsTXtgt68yxneF/CJDATab0FKi4=
X-Google-Smtp-Source: AGHT+IHdqyep7BVt0uyn5JbTz0KBCY80ohOEAxNDfe2YT8nR9HTsXFBe91fCaeMmIZfL9ezJQQxpbg==
X-Received: by 2002:adf:ec8f:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-381b70ed1c3mr2049217f8f.40.1730289624347;
        Wed, 30 Oct 2024 05:00:24 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9480e5sm19330995e9.16.2024.10.30.05.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:00:23 -0700 (PDT)
Message-ID: <b5dcd5df-7215-4679-a6be-c45d525e8051@linaro.org>
Date: Wed, 30 Oct 2024 12:00:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] scsi: ufs: exynos: fix hibern8 notify callbacks
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-11-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-11-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_050026_864631_1C56A431 
X-CRM114-Status: GOOD (  11.36  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> v1 of the patch which introduced the ufshcd_vops_hibern8_notify() callback
> used a bool instead of an enum. In v2 this was updated to an enum based on
> the review feedback in [1].
> 
> ufs-exynos hibernate calls have always been broken upstream as it follows
> the v1 bool implementation.
> 
> [1] https://patchwork.kernel.org/project/linux-scsi/patch/001f01d23994$719997c0$54ccc740$@samsung.com/

you can use the Link tag, Link: blabla [1]

A Fixes tag and maybe Cc to stable? Or maybe you chose to not backport
it intentionally, in which case you have to add:
Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

In order to avoid scripts queuing your patch. It contains "fix" in the
subject, there's a high probability to be queued to stable.

With these addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

