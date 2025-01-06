Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL83fy9fUiyWAQO9Y10o5TV/KydC3Qa+Hru6k+93+SU=; b=PqBwDd06E7uMjZ7aaxJaetE0q7
	VBL4ay+CRcgYRQNzHVmda4thvBrQNLdPwwc9/fFLK/x8u/naAWcEGn+UlfjT76yHp4lT647CLkmvy
	MMOCLgSzT773lP80+RI4ZzHQENZxzWJbRZnWkt+KDmNh6jShQJA7rrvThlaHRsOK4g6baHS2yMhGh
	9yM3OS19zI0g+KOCcSGgNw14DdVCGaaKM2wowjizS0xCvUpH+nPchce08FXlFW2h9ahUXf1aJ9zlg
	bu2ggErFDU/NvA2jpKldAkp5RM/21lH8MTYZ0kuURUQeEvK0VW1AfsxV64Ou3m4U/vGoHON3X7/y1
	KxB/BYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpYE-00000001sIF-2rrU;
	Mon, 06 Jan 2025 16:01:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpW8-00000001s1m-3OJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:59:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso105243665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736179187; x=1736783987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cL83fy9fUiyWAQO9Y10o5TV/KydC3Qa+Hru6k+93+SU=;
        b=PWdYJSc2eTivLd9nvYiECsQT4RNDhzvihm2wa99bqb8tT/7zNyB+o7hnwskE9n+fNJ
         hEId/44QvMhBaVxKoP4LuAZ6czvG4nGy1nlO1ZhlfVjSjfien+oqw0jJovtFQaixCXwJ
         Fth2p1IGME4D9xGzgfsEfdis+wNT2DaN4EQJVLgVGR3rPC3X21ulb9GbvVLOousFCoeR
         yLKCckLzM7XicINeKhAk2PXGX8g0G0S30jRw8SJh2hWyPkeVWOApGqjRXqxoETHtCoLz
         CZbTIpFkBdoZ9ZRZXRYAttWXVS1Jq7RlE3NqDMEsRptGYf1+OHOnQWbPjJCKiPNpqhkP
         +RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179187; x=1736783987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cL83fy9fUiyWAQO9Y10o5TV/KydC3Qa+Hru6k+93+SU=;
        b=PR8q/rELWHukQcAcubyYVtL0vIUwj1pbyyn3NX3lPemBKhDMAxgdAGzvkJOykarLMd
         UKpoCH2uOwGP+SL9FxS2U1Sx1BSAYUmwBWcmBlOSl6fntGUZsbbWKpQZdhpfdKpgtvDH
         MwZQQO2gqdy5HFBBPyAa025HEWF7drKO9q3An1u24+U7KLj+h3DQVEVaqIrS5Y3Y+zQw
         Y1aPnW/gFdxbgzwN9AoDffUd1okxf482wmZB12Q3DlcG6cYnJts/JP4g4sTlBkizUOwQ
         n7G2eLTLfmPiZHtYzQEnYBd6WgAn8jCvNF2UpcXwgaDOg7WvC3/gw0mewmpyUPLfILEO
         eWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNoEknqzUM4lJkUZZB/FqkjK/C5Nom+od/wWY+DXQUdsugBrM0okxV5pJNFJAIcva/gQuz2L/zDnqB/orwbZbW@lists.infradead.org
X-Gm-Message-State: AOJu0YyqZaDn4YklchTZ+xYe0efxD6S0PXXAD2EWv95kyXU47v2UOza0
	6c4qPDWbV7dsqjQuSOiIpaGHZ6zvbc8GfGyaP3lVD2Pz2Z/7X2q4zX7Ej8B0sXo=
X-Gm-Gg: ASbGncuLm6krStj6QfmuFT3j89LXIW+3xcczhzxIrK/KO0Je9aqvUwM8Jvb7UkZXodm
	IKqYI0TMfYjzNIlGbgroUloNhLe82hD6zPkh7fW1qGgjr9+Zij+TO0Y7sBvWEwr4t1UE1MwTO8J
	KCFltdUzbayMrBYaLRZSLisNNYxPAZ4FEOpTkOq7m0i/UYnVGbgZ13P/9JAMqWcnysW+V0C6vtg
	dHIXOgQwIJFAe+D2F6sBlhPOQ1iGnmIUYWnUrl0s4dRFDxYlNwBUfomZTd4Uynkjl4=
X-Google-Smtp-Source: AGHT+IFuwfTtqezqCyqXjnvoll9stdZwnDMHbjcpJGGm/Jkum+CB4+ty+n/TPU5uXnz6f5z8AKwJSA==
X-Received: by 2002:a05:600c:1d1d:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-43668b5e172mr471554025e9.22.1736179186712;
        Mon, 06 Jan 2025 07:59:46 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b14f241sm535958045e9.1.2025.01.06.07.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:59:46 -0800 (PST)
Message-ID: <57627eec-10b5-4eb0-bfe2-f404a3492eee@linaro.org>
Date: Mon, 6 Jan 2025 15:59:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next 2/2] perf: Return EACCESS when need perfmon
 capability
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, will@kernel.org, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 stephen.smalley.work@gmail.com, omosnace@redhat.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, selinux@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
 <20241223070650.2810747-3-luogengkun@huaweicloud.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241223070650.2810747-3-luogengkun@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_075948_852098_95172699 
X-CRM114-Status: GOOD (  18.22  )
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



On 23/12/2024 7:06 am, Luo Gengkun wrote:
> For perf_allow_kernel and perf_allow_cpu, both return EACCES when require
> CAP_PERFMON or CAP_SYS_ADMIN permissions, so update perf_allow_tracepoint
> to keep them the same.
> 
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> ---
>   include/linux/perf_event.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 5d2ec4283ebf..c1bc0d7a275b 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1685,7 +1685,7 @@ static inline int perf_allow_cpu(void)
>   static inline int perf_allow_tracepoint(void)
>   {
>   	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
> -		return -EPERM;
> +		return -EACCES;
>   

Is this necessary other than for consistency? If not it might be best to 
leave it inconsistent even if it's wrong. I see quite a few "if EPERM do 
this..." type things in Perf, so changing this would break error 
messages being shown to users.

If anything, EPERM seems more correct because EACCESS is more about file 
access.

Thanks
James


