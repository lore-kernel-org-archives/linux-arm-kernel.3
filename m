Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B7CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L5/xgq5B4PffNpG0CbmoeXuQony5EUxgiKJwLilCUc=; b=JH7TYTYRWUK6lGz2qF3GDjVKot
	N7uRyVgCsI8r+GiGcQPjUF1UX8MyFHI1W2Zaz2dnCbI0P4nWRdERP6obpUi2YXweCkwpSuC+yzcfh
	SSU8RdlVxRp1VTRS9le1Dsq9hIUQgucblbiXO6O4Bd9b8z8OXMecrFOHCZi6FwroBuSRCseWzOAnD
	ToPuvcCSGc8b0LN2oDx6avaoTng1rVqA82KSqDygvcyLQ+Vkv9L8gXxee+xXD9ZhAHzWiYKkEFDiZ
	inRMIdrpummj1zfHQj84R9ZBZz71C194m33gbmFfjAcFfok6+eYKg0rxtw4N1TmquPvtW9c/VInT0
	8HR1QpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQS-0000000G0kC-3Hmg;
	Wed, 27 Aug 2025 15:51:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEot-0000000FMgs-18A2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:00:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so14558495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756296002; x=1756900802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5L5/xgq5B4PffNpG0CbmoeXuQony5EUxgiKJwLilCUc=;
        b=aq1ER3STzpwI+80GRrdmlgNdiZ5QN95UptARqW0wcMGROTzuCHzdxClZZiebc4+328
         BmxLZrJu8JuGfYiRWtEouxn5mbyuyKr4p46TmIWf4sUx3PbSi4iGkAlyO4GLccJqHgiu
         2hHJ30HN22yOooGu5k4tZTR36Hys47q3Zkxu4384Vlo0Xn/vm26ZBFupjUWruawxorua
         jtkfaxWq7ZpuBAa9qWSzhWGrN0a3r1sf3CyMlDSD2AParzdTE1CK9QFY6GAkKZovwNFm
         v9o6fwngfqbhHaPHbnA4XZrFsPwKt6ZDpOQr98B6Uj7wYE9tbmiqazlGryA+D0LOvWHh
         leKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296002; x=1756900802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5L5/xgq5B4PffNpG0CbmoeXuQony5EUxgiKJwLilCUc=;
        b=NvIUGQL4B5OzoU72gwP0fcbCZohti+gg15mYZG76l78V3n5eHx46sEoSxunGNDi6nl
         L5w8wyW1DN5JG+eU3zJLOPeSNGgg0elPDypP5vqRiGtVX4XvEqo9vRD1N/6SSICZQBQH
         m5AxTQU8WppPxtXJnn1uOY74sdTNVADBIyO0x+WkBmYbxdSuET0jxtbGcyzwVj1RvwfQ
         rAgNWNbcVb1T6ZUdxuaRRugTA9aopIntSkjLSEu2hzl+8d+GXLAhxSX1GTkg4AZ/FS5B
         mh8uFT2DtkdgepHgayOr2dQz7BkTz6htI2flYtII50trnFK9T9KY45pCQJclmyFTob19
         /6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWn1ww4t8y9/jj/3WU+RP9Vj9QiDfBmMU7WZXWUhdhpmj9lHhbKE9S3377kSFaVIpD6E4VIViIzqwjTMOW4x+x1@lists.infradead.org
X-Gm-Message-State: AOJu0YxpLr2a81ALcQdAkFCWyvrwgZ0Z5vVUdvx6gb0uUTt3XFFkGPXG
	uRuqmKGpqBx7OtjXo12/ywI9TPbGZPNbNIKSkRl6NC5GYfwuGCOa3+0V4CeWfVNFd2XFw8rS3EG
	nxiXG
X-Gm-Gg: ASbGncuVFTe9TgBjkLfvZksz6sn4alggSVTcFqCm0kwE+L1fToZpW+CU2ITNFmLvqLC
	dr/Zebn2rLLB30HN0SCMSKfPH/vDUgt+TW985yQB6vwWn495GV2N/koSgBhSuLfNH1LOgtP7QJM
	agqXHsRhGIMf8gLBnJuVT6SQUumJetsBIV/jHTvSKeXx3dsrw/DIcd09PGvhdBaoHa0bIAjQNDt
	zjROAy8a1bT8DeaJ7F6r5LaXEIq82d22j0ppT2exWWUmSCaBvePvgowE7KOEso7DpaGv0kPIeob
	ojfi8mF0LaFzDf1PU0XZV1KomScSk+GQo4GRiwg6a/hX3Ob4+us2A0l30Tjw6aJSY7iOV1QOPE4
	XAj/5oRrnkkqWQhy8VMyZ/ROtN+lmJpUTTkNIoYIUaUJKHzsI
X-Google-Smtp-Source: AGHT+IEkh4jsVY8FwY3eWA0V4VXsqlJwb5m65Kq4NVKaZSscJWUEE+v9BFNSpCicdnp78oKhJqCv0Q==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr175430125e9.11.1756296001599;
        Wed, 27 Aug 2025 05:00:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm27847355e9.13.2025.08.27.05.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 05:00:00 -0700 (PDT)
Message-ID: <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Date: Wed, 27 Aug 2025 12:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_050003_321592_EE22AB62 
X-CRM114-Status: GOOD (  14.43  )
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



On 27/08/2025 11:55 am, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Tao Zhang (3):
>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>    coresight: tpda: add logic to configure TPDA_SYNCR register
>    coresight: tpda: add sysfs node to flush specific port
> 
>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 

Reviewed-by: James Clark <james.clark@linaro.org>


