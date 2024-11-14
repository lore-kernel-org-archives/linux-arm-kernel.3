Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1ECD65C79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0JQi9CKJScCOUVcFbSjEe26w2EcFkxUR/NrMxP1XYE=; b=aE0TWyIWJxIwsUCafB9iV0hELb
	Y0oU3/hYRy50ygsL53vGGBRYufXnuJhAHbsPk5BjN9fDkjATGFBSaf8P0mE7XikUOBDwkmOOMZJGj
	I3Rsfn2YMTGZBqD2KcrrJe2MdQjpPCc+PFS8O6FlnAo5V6LPyYv0Zgw+9OsULdsPbZt7iL8VeposE
	nIbNeMY9EW/ExndLQs2foK4+XZjOUpnXvMZKyCHQk1McBat/vKM9eEfwVQlFJwEmX097JeONgfuDT
	W7hIgK7bkUiOK9UKVs9Pb4CxsSKe3v/HoyQK1FtHlqupJDSyyD43UFO00Vi3rwA7usGGaq3zPGbdI
	AYBxUc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY20-00000009jDw-2r4V;
	Thu, 14 Nov 2024 11:29:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX9V-00000009YE0-2cCY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:32:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9ef275b980so78502566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 02:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731580359; x=1732185159; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0JQi9CKJScCOUVcFbSjEe26w2EcFkxUR/NrMxP1XYE=;
        b=CsGswAHINjwXUcIa4xQuwhnraILmSX2X54AnDv1dvffMzBB0O+Vupuvp4LAwn3qFFN
         eRbkKZPeCtmicS0iicRBs2AMRLwMdChHEYd1z5zXi1BRYFAwA9h2gCHaHeJ23yOqRR04
         NJGqnDDn8del/IoCNT/xQd7MSVjUHVhLjHPP1ocr/SLLmgyY7zPiD7qKCqmEKyTZUSDr
         a/0x65PtC76dJTfwAcay2rgVF4vAy+IPT4cZTwWrNzwf73FaQ+5DMywtUpJG+3yFcOnl
         zDyGbvcCuiGTphTAaZdR/sD+7iYltMlSqhzP/Qa+FZzId6tNUe8z+I6SrG5O3tBAsI8f
         sW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731580359; x=1732185159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0JQi9CKJScCOUVcFbSjEe26w2EcFkxUR/NrMxP1XYE=;
        b=cKK4fgN+OJfLRRv2kDVicddRg1WL65R1biWjgJto4TEbYpXajFc1MyFUIeOZZ1b0M5
         w+Dgiu+JPVm18khWWPn4GEBFr3t9K/JT3VB9jhJ6apNi8479d2BO3K2zvRYKlZGSdms7
         vLrvjZzC5JFSSxGFP3CmRbVOBJXn3C0q9PCn0L6Fk/so1fYbdb/PXv9Tn+lXcVBZvd43
         qG5Fy4W/4zhpcwsI3jedyJHebIvBCzYEaPf9TEAL5gsvIPm5q1xS+o7AhqWe6uvc5Ze6
         EJOKGE1VERO3MkhJ0N/GATQTuwsChrhgDCuee6SRwlbLVS4tgbj7F8+qMw2zzzY4Nft4
         5MLg==
X-Forwarded-Encrypted: i=1; AJvYcCVir7Yv1KJqCT6bgBv13+uaKTsYYStqbr5sthiTGqh7/6hiL3nJSUWCP9iXKFhAkuZua7kW3h4qBmgBfWJkEpCF@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnxtC7IKCshYtR4ItZlODkKqyO06rAl3MKGby7Idz61xk3tKQ
	riUWn+X9xuKKqMWeoY2Fs97f00dzRMf7qGxzrEdnwUjGRabkwcrrndYfrv+oLR0=
X-Google-Smtp-Source: AGHT+IF8UeMzPxbbyLOtKVn3df9FV4khi7egLM/xtoB7wT8UCFc/wBV/IUxxmestse5X2V/t1A2viQ==
X-Received: by 2002:a17:906:855:b0:aa4:777d:739a with SMTP id a640c23a62f3a-aa4777d7bcemr54332666b.8.1731580359237;
        Thu, 14 Nov 2024 02:32:39 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e0861d8sm47123166b.191.2024.11.14.02.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 02:32:38 -0800 (PST)
Message-ID: <9e3174ba-2384-4260-b1a0-059aab2f393b@linaro.org>
Date: Thu, 14 Nov 2024 10:32:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
To: Yicong Yang <yangyicong@huawei.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org, coresight@lists.linaro.org
Cc: jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241114081653.24328-1-yangyicong@huawei.com>
 <20241114081653.24328-2-yangyicong@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241114081653.24328-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023241_978965_4D57634F 
X-CRM114-Status: GOOD (  14.84  )
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



On 14/11/2024 8:16 am, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> tmc_drvdata::reading is used to indicate whether a reading process
> is performed through /dev/xyz.tmc. Document it.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 2671926be62a..fdf7955e7350 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -174,6 +174,7 @@ struct etr_buf {
>    * @pid:	Process ID of the process that owns the session that is using
>    *		this component. For example this would be the pid of the Perf
>    *		process.
> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
>    * @buf:	Snapshot of the trace data for ETF/ETB.
>    * @etr_buf:	details of buffer used in TMC-ETR
>    * @len:	size of the available trace for ETF/ETB.

Reviewed-by: James Clark <james.clark@linaro.org>


