Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCCD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eh2Jk7y1LUL7tcgTyarCIDEPQpluVmFaeTv2vZoA4M=; b=bVjNdsU/4LeXiLbOwoeR5sU4dX
	7szAVSPBDsQXoE5LUgJQkV8kgJJD1zLbPGVW6tHfxnJteocCwkIIYl/DJBEdvW06GUT/PYSnS//ws
	Sv1Bkw4CZA2bJYvLolAMMPqQAe8vykzjrcjo7PPT4ozHAbzxJnm2V37XDtHLI882TyV7GAI/iHLse
	VPXlxbtFSF1smQqKajt3NRXnF0C1WPHt8htmA5pGAu07j4HZOd1sYDnMh3fB97bL90RKW72OLJatz
	Y+Nm3W385yjQmZpv02HkR3gNzuxHdUNr5jkMDIDaYoSugMTw4+pHrUZ6QCDL1UcjHhodnTwCLAw3J
	4mcs2Pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4T4-00000003KHA-2lok;
	Mon, 15 Dec 2025 09:02:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4T2-00000003KGd-2ZWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:02:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so6421413a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765789326; x=1766394126; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/eh2Jk7y1LUL7tcgTyarCIDEPQpluVmFaeTv2vZoA4M=;
        b=gPSjKG2tBoBBe42XWHtcvE9+LSDtTbTsYtqtkQe9Weq0MZ1jYGtht8v6iaKdO+iVO/
         UKxy3OkSm/Ht2djP858zW9JAQkFAZ4CBVXmKWOkfOFj+2SDfJzTmz1oXx5T3LV8Bq2vS
         xguFDPYKNfIoFRXasSADjY4mN8du2n3HzPjaJVVIKdBgmJbtetAp39Ey2qELi26BFKp2
         FZiYOxcE9DN5p3SN5P77n1UWjgjHMlv5WBcUeuxPlh4huHlOvgRt0m45IZLZ+d3pDQ7r
         zMbnS7lRg+xCaOHFoBqc4e4hcCfKGY13s9wbAhOZgZzF7Snzakji8RbGJzNqmkF+yeuL
         l1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789326; x=1766394126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eh2Jk7y1LUL7tcgTyarCIDEPQpluVmFaeTv2vZoA4M=;
        b=u4XL2RiSMU1VY4boDWETc6q03lcfj1mdN4xq94UNQJPZ1ipzoBDZzbWdNW/t5C5A3y
         etmkZ9xQKMNnSS3Yix8VLt+j/KcXfcVIynCrlOh3Rkucdc0kSxJRb67dhDBU3lBZj9Zu
         sGybtecFUSTBYEsRdyVlDdHhirQ8FTHxrfw6bx6y6FmCYC377i20J5FtM0B/0aAHDzd1
         f/tJsKcpfioxQm60rxkd3yi9BqxDocYlqlEstfWjgXY69WpOO+oimwNpioWPWcGKuZPJ
         2J79j0AH+x2wfTyE2XuUDhi7iy45sWAvPqid1vjxc929j8M3NzPTj+QR4UqVXsgbTOyM
         M5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWp1RLxvQ5Bs2xHwkKnFVpVXJm56OzsBJqgaw1Fh1xj1QdUtLH6gSdv7hJtflmrwre7Tfnx5YuUGreVNRXp68VU@lists.infradead.org
X-Gm-Message-State: AOJu0YxGklHnJdmtEp1y+85Q7mtMJCQx0YhJzB03gLmwD12vlbw7/7xf
	/mj00fI/U/hciNUbQFYyl+PeewitEXk7PN7HFDM1Xua3epdmmF3M24ssKsIYDIdSSSI=
X-Gm-Gg: AY/fxX7WdsceSZJDDwOC0MMHkzXcX3txOt4WdZOQ7HpsriYZCiLEfTiwi+UW3ecXCyb
	FANqBhe0PEMMifTtXUVlPa4o2KK+eeJ0SYbxyRmwuDzekzGVvJNWv+1sGeIqvlh9xKvSwz9YWeu
	1gM6nDmI3jjaGLhMR432ydceLVZw+Hj6WusIniBpUVcy7tafpNJrW11AbgSRyOCIIFCxqKbU9cz
	xeNKTvuF77D/bhB9GAIHUQZGvOdXXJND+MNosa8JvkKSPDTel2S0u7UE5co9fGI0GEo9fSdIhmI
	PBGMzrzAEPdOyJQlXYZzKZEINiPIVuYHa5bbmbtPQhqzkdoVvNYPNKh6GGUTjNf/pe2xjY1t2GJ
	/PRN/kpQRPqVicZOWIRWJ65NdSMsOaKyWrsJpAajJlJeX0UeMCGZ/42nkAmLchEF0bVhppc5x1K
	pldl5Fw7Ktbg5ArZBrQZKS
X-Google-Smtp-Source: AGHT+IG4myQfras1/40xDmXOQgpwgiM3Ljs8/6uploYCUZ16zAD9bEd9YTmSTzDXHafRBREFjId5kg==
X-Received: by 2002:a05:6402:1446:b0:640:ca0a:dc1c with SMTP id 4fb4d7f45d1cf-6499b16e791mr10050760a12.7.1765789326445;
        Mon, 15 Dec 2025 01:02:06 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64981fa5514sm12907579a12.0.2025.12.15.01.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 01:02:06 -0800 (PST)
Message-ID: <c698d581-da15-42bf-9612-62f1bad66615@linaro.org>
Date: Mon, 15 Dec 2025 11:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
To: Ma Ke <make24@iscas.ac.cn>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org, suzuki.poulose@arm.com, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, mathieu.poirier@linaro.org
References: <20251215022709.17220-1-make24@iscas.ac.cn>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251215022709.17220-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_010208_675385_69EEFB61 
X-CRM114-Status: GOOD (  19.34  )
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



On 15/12/2025 04:27, Ma Ke wrote:
> In etm_setup_aux(), when a user sink is obtained via
> coresight_get_sink_by_id(), it increments the reference count of the
> sink device. However, if the sink is used in path building, the path
> holds a reference, but the initial reference from
> coresight_get_sink_by_id() is not released, causing a reference count
> leak. We should release the initial reference after the path is built.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the patch as suggestions.

I think Leo's comment on the previous v2 is still unaddressed. But 
releasing it in coresight_get_sink_by_id() would make it consistent with 
coresight_find_csdev_by_fwnode() and prevent further mistakes.

It also leads me to see that users of coresight_find_device_by_fwnode() 
should also release it, but only one out of two appears to.

James

> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..56d012ab6d3a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -454,6 +454,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		goto err;
>   
>   out:
> +	if (user_sink) {
> +		put_device(&user_sink->dev);
> +		user_sink = NULL;
> +	}
> +
>   	return event_data;
>   
>   err:


