Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF1C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GADAYPYH6XtwZCwZvDUpQ7sXCaWC25QDTPuEwyrGf8=; b=VSsb4k40VrLOdZYhOp7vLjyArr
	nW1LafKr3yY3F7l81oIqqjMmC3Q/eoRxnxSHMKswFCRJ2Bu54meIOCtYyFm9gQsscwk8th+59Uf8e
	cOLfJMzzQRY1FmJuYna6KpaUSHcQgUhg3goPtfDWMBhFvo34ucHOnlKhPzuhGH9aQWcefV3NN7LUy
	qXde4p3AknkR8moIOxmIyZ9ED6/uWJptzf9S6EHRbq9zP/Nje4CdRNKh4WXdcaUtYcThpP0GWh3Ao
	IXbW7NGMKmWI6NjvTyaQBrQRkr5ImuGP5i/dmmfi0xd9k5CK7GoRPMrUrq7IUPmDKB6z74+85ydw6
	8LkoelpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7FJ-0000000EU05-1QIe;
	Fri, 27 Jun 2025 11:27:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7B6-0000000ET1q-05a6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:23:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453066fad06so12566805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751023410; x=1751628210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GADAYPYH6XtwZCwZvDUpQ7sXCaWC25QDTPuEwyrGf8=;
        b=AYRYRxQ9nO72vw/fHiNLXwnPWw/qnfWCMDCsnP4ES8FjkKFAm7XHQxfwoQXaNTRevK
         ZcgrtIT6fCwcJeTrZESO2GL3Fzy2FXZ2nbgWOxpw7Ok0pjEnpLyvSyb+xhoEwc40a4ih
         C7EVmWxWQ4LaPLciPvEkIDtyg9X3ldXUTWWzn4PsZWLvz8zm6FH7m7BOX6SG0gHGkpm1
         +ZLAh9fiL6+UUnwsGBHz7mFhCai/kCbk7XO/v4A4SBqoxrsbATTsAe8jUyKFxCYWOBhp
         VZQf/Z6zJ+SxbEnr0fd7Co8FhptewoC5BDYU9Q0l53hLHLl+zQs2/EhRyjwxoeJtZ/zL
         hzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751023410; x=1751628210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GADAYPYH6XtwZCwZvDUpQ7sXCaWC25QDTPuEwyrGf8=;
        b=XDf4DgW+2Gsmkm8iT89TaOAx7RwtLPGV6J7uagUoO47yKYpIx3jzPWxGvvUhApJm6E
         L36nZmgfBcqVGLriumbAwfdt+pJukqnOWsOu7Xh0Eh4SQWyypdAApwULyTHwzX5HhdRI
         /kN05I2kLYsBngN+pyq+6uA+NFNM+vULbpZFzsmLdWu6U0xx51H4yCEjjyl+Xc7dStPZ
         +K+qX1+HstDCHTYMmkhEtAxUWkFnUBrs5LbgC4zUSx1RE3Ixj8DYbmqZguyqV6Pahqx1
         C6YSYJJVX15ZF9KFqkqWr4PGaYgW4seBZ9JevRX78r97MEzcUMPF9ask2aU7xiUlOYWG
         5AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcsXPHjp7mV386iY5auMgNKOTY4Zh8rBKhaCZwjGJGqgoVxvXxAii6O3yEAt5zFH7gkV6g4lkwTjewmRr0ayPc@lists.infradead.org
X-Gm-Message-State: AOJu0YwDzMHHbhvF7X6NGWLQYy2MGzcjkicilgtfj8s8hlhjAv8VptF8
	pQrrzr0NCPgt8CIOKd11lhWmqTcI8xgBb8mkxbhN5OSU+LG3KOoin3ij9GYOAJD2iJA=
X-Gm-Gg: ASbGncttr1eX4bc+7Qk1FUF61vWyFbwOlrmmqLweXC5dOgNSpry/ny6G5Uh1PCALoZe
	PpWZ3k8RSV58VgBQvCsa6h8GciDmu6oZxiNSv149WkTKsOVSXCDNN8d1MYrphGXfZ+ANoTukGZ6
	mjMuVqKq/8vSMaqup7g/lTKExbwA4oIVDUAAVn9BcVHr7robipUqChFONW2O1ihfP97W6bIvwIh
	oGYsv/Q+uUJgpjqVjY9sXNmSXQ2iOFS9DMTosncJSCy9HEjWeV8WIFEu8MZPoSoxOV7jms2nAqn
	vXV5RxZKLTyEwJnNlB7qswl1c8pmm6DXbh7UtsYFqn6bxJEmvqbmqa85Kyl2j11NBO8=
X-Google-Smtp-Source: AGHT+IHpjRR+lhjSBz+H5Y+FWjh/7wV/egv/qDnpzKkXfpV6p0HxBrpcsCDQ+17zG3AKUjPpxcqhvw==
X-Received: by 2002:adf:b608:0:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a902d88058mr2114575f8f.51.1751023410387;
        Fri, 27 Jun 2025 04:23:30 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa750sm2416679f8f.25.2025.06.27.04.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:23:29 -0700 (PDT)
Message-ID: <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
Date: Fri, 27 Jun 2025 12:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_042332_071759_CDD44CF2 
X-CRM114-Status: GOOD (  29.58  )
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



On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
> The current implementation uses a fixed timeout via
> coresight_timeout(), which may be insufficient when multiple
> sources are enabled or under heavy load, leading to TMC
> readiness or flush completion timeout.
> 
> This patch introduces a configurable timeout mechanism for
> flush and tmcready.
> 

What kind of values are you using? Is there a reason to not increase the 
global one?

I don't think it's important what value we choose because it's only to 
stop hangs and make it terminate eventually. As far as I can see it 
wouldn't matter if we set it to a huge value like 1 second. That would 
only cause a big delay when something has actually gone wrong. Under 
normal circumstances the timeout won't be hit so it doesn't really need 
to be configurable.

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -8,6 +8,7 @@
>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/types.h>
> +#include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/idr.h>
>   #include <linux/io.h>
> @@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>   DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>   
> +static u32 tmc_timeout;
> +
> +static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
> +{
> +	int i;
> +
> +	for (i = tmc_timeout; i > 0; i--) {
> +		if (i - 1)

I didn't get what the if is for here? Removing it does basically the 
same thing, but if you do want to keep it maybe if (i > 1) is more 
explanatory.

> +			udelay(1);

Can you not do udelay(tmc_timeout)?

> +	}
> +}
> +
> +static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
> +{
> +	return coresight_timeout_action(csa, offset, pos, val,
> +			tmc_extend_timeout);
> +}
> +
>   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>   {
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
>   
>   	/* Ensure formatter, unformatter and hardware fifo are empty */
> -	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
> +	if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>   		dev_err(&csdev->dev,
>   			"timeout while waiting for TMC to be Ready\n");
>   		return -EBUSY;
> @@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>   	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>   	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>   	/* Ensure flush completes */
> -	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
> +	if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>   		dev_err(&csdev->dev,
>   		"timeout while waiting for completion of Manual Flush\n");
>   	}
> @@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
>   
>   static DEVICE_ATTR_RW(stop_on_flush);
>   
> +static ssize_t timeout_cfg_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
> +}
> +
> +static ssize_t timeout_cfg_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +	tmc_timeout = val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(timeout_cfg);
>   

Seeing as the existing timeout is global for all devices, if we do want 
a configurable one shouldn't we make the global one configurable rather 
than per-device? That seems too fine grained to me.

>   static struct attribute *coresight_tmc_attrs[] = {
>   	&dev_attr_trigger_cntr.attr,
>   	&dev_attr_buffer_size.attr,
>   	&dev_attr_stop_on_flush.attr,
> +	&dev_attr_timeout_cfg.attr,
>   	NULL,
>   };
>   
> 
> ---
> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
> change-id: 20250627-flush_timeout-a598b4c0ce7b
> 
> Best regards,


