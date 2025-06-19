Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54852C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=; b=IBnM8SoRw5SdGEAayGyGIKX8st
	oMqwjUlFtRxtl1JluIFOAJWnE7DphblYCrGFMDj//njezXmHKUBTUXX0lE+kpNAwpsxQ6l7VA96nf
	spuV9uXzWTf4IrpQahl8hNnqZxQ3+HEP/Yt0S8jTK8Zm04TwOCEhBEcHiUF6Z7NaDROhXIIhM8Xjk
	M40hvJhhsHsopYCEuLqVvpdvsIg/XKNJU37s/WBtWn7gLLrXFGVysY1o7un3tFwNDFlk5CSMvZi5K
	emBKk4ghaPY/fUugFIOdpIQzznUUsHW6Ck0E29wSUk4Kh3ZjYCijBV6ohFbSwMY2Pk7Lhe/eFxKru
	jNYIXunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLH7-0000000E8Zn-0JON;
	Thu, 19 Jun 2025 19:50:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHaL-0000000DaPR-3sLU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 15:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=; b=e+g2qxLR27BTw+kpzLtnvTmWDn
	O5Nz9F0rlap7AYd4nvyrLrLiLcM1a3RrSx/4O4lhliW46m2aZPvm1lOOB38RKzPQyEzN/kUIiIczY
	x3ISLY9109euXzqtQ+m/4mIuUdYIJCORDsp0ntxSinC37j4czu2waYDJ37QBhKgHBGpLa156GXfdh
	gbQ51L0lxSen6R2aPs+eP1c9EubcH4FfGK+HbF+OAsjbkS8xHtECswc2au2HLmTcoiwyqMoIkeuXI
	7TUlI4JYDfHTHeFAAgxP9LyIWcu9gq8INbhXm+nA2Pe38XYyPibiUeP2xPRBD9Y5ptf86xGe8iK8i
	WeFWHuxQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHaJ-00000004T7h-0mD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 15:53:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so520587f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750348429; x=1750953229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=;
        b=txap5p8XxWDyuYksPOaA7KqCjumpyZBtW0epmWekY1tMyIIdIwCrYA8JK5vMiLvcw1
         ffGIxTrF3bDF+ELmUo5xw8+Qz5dle3oAyS6MC4tFp/EvzAj6hbg1MuykhG45tpUE88Sa
         7aCtNvdbH1M4iKjaYiNEK0ensovcJWQe1Rlbu/p8/ajveNDx3IaHIrXNe3HAIbXA4XKe
         G8bX6OxgJpSdHy9CesvwUYm9P++zw5obYaWHAN/GI8yLPhk1C2h3QemfxuHse/CocLqA
         rUuDKMoLTzPqcaqzFfOkdCmQ+kQEmqoMzcUeF2j9IbvmzB+Gl9lWVWXcrRJX1z2C5sYh
         BRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348429; x=1750953229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=;
        b=IsJBXcU7NBJAZL36LD4tBmeI6rXjWO0mD88w8wvlcELYWLEMTlEma4zUImnjBmm99b
         EoPeIBEUW1YQROXUJcoB0jPE7D8Kg/leFxazq0TAhENFB0a+O+Nd8CgVjyQQFwVKlm++
         EtQlqXS8Kp3Ol+1CIxjhbOIurW+VxjlGy8TfljnnZspOMxQY0+1Wy4At7FgsdsWDI4uB
         Uk6EQjGQf+ZajGrENB4YDU4FG233LUFWxKeb2hz4RgghlQwihfVUdZogXYF0jxzdgHkY
         nXWbd2e8CMiDQiIrBvC1XG1VAaXJ2XrAJbxJXwAYuDHYc8dKPeHFV3AeWk82ulwu8nMo
         OIpw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Vuq1VbkCQiL2VZyNXhrA2OT1Ho+RT2O6kYChrTaSd2ZwFayOdOg6qWl9s3XkV4t6yINet4ECAAzO27ue80rB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2gangwjFs4Weyx0T2LBpsdsrY6nkgU5210FY7ULMfHXg6c9mv
	sVblrTDN0Cj72297oX/j8sjaOlVlbMHEsudk4KmiRBXbDz2jwPF0i5neL9buLJgh8fQ=
X-Gm-Gg: ASbGncvI/d7kBDEqjEBmvyTydtqlFqsONmNvhrK6+Oo8fAkC/NKZzzU6flAweMgWjxf
	E88EdSVXZbilNrl8TIwOnJAGvScAnpnvQNbSnCj6hmcVZ1vcgTqgWKOQTHWTUH35oQ+jF++bSY3
	3a6XVLwqL7mmKKtC3GAwK0u9N4ugFy6A4GEKNytrN/U8slYgXuuBdv/O1/LNidCO2FTFwv/813k
	pGYRqTwIiPSHpyM0mx4R9TwqAuIsObIaO4vnzmJOyeptFbTJljSndBNMtOl+yxxz0/wCe8rcAo5
	rrvACIHZ+XwCT/4B98Uo+HyrVzYTVJ/gZ6Qve2yPMqdEPwLWBxobj7LNV3BX4xsOEGk=
X-Google-Smtp-Source: AGHT+IFhgF5Hhrh/DcTEDSYXb3z6slUVm4fs2xKiMsWX1+2BhI88RWRGf74eQ6JDO4EbBchzGYmsrw==
X-Received: by 2002:a05:6000:2313:b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3a572e82465mr17345796f8f.32.1750348428838;
        Thu, 19 Jun 2025 08:53:48 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28876sm19786654f8f.73.2025.06.19.08.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:53:48 -0700 (PDT)
Message-ID: <7f9f123c-d7f9-478b-b207-f448a95d992a@linaro.org>
Date: Thu, 19 Jun 2025 16:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Replace scnprintf() with sysfs_emit() in sysfs
 show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250619150730.413287-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250619150730.413287-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_165351_392148_DB163370 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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



On 19/06/2025 4:07 pm, Chelsy Ratnawat wrote:
> Replace calls to scnprintf() with sysfs_emit() in sysfs show functions.
> These helpers are preferred in sysfs callbacks because they automatically
> handle buffer sizing (PAGE_SIZE) and improve safety and readability.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>   .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
>   .../coresight/coresight-etm3x-sysfs.c         |   2 +-
>   .../coresight/coresight-etm4x-sysfs.c         | 108 +++++++++---------
>   drivers/hwtracing/coresight/coresight-stm.c   |   8 +-

There's two missing from coresight-sysfs.c. Might as well change those 
too while were here.

With those changed:

Reviewed-by: James Clark <james.clark@linaro.org>


