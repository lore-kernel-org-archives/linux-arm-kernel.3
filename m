Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3EDCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGqDa7na50Tsqkd5b+BW6jy2kx5Qm/puj3/p65teiTc=; b=LySujEI7VeQT4znJ88mzRRlt0U
	0+xrDNE3djke3JX681Ocvno9BvUwOdorsUKcE9V01AkIo0tLTeSYAz5K4PebR4y9zCXLRnoaQ6HZz
	aUe7H9N4g5Q8Svc0sGOjaPgOvRvHqcnGueyXdUJcwmFXm+fe52UuaH4JgAepjxoICRKooqx6dOHkH
	Hz3AQi74x08Rf1jYO3+kBBnuR0OzjIRNb7FtXq7dxAMZUmAZB7j2oRItM83AnnBVBfzTa4yOVyqUY
	00mxo9rjEDTb3+AkHUDbOihtvSVWrpPo03kt7yBGx58SQjrCxPXwhNeiFBtS6ds7peOVAyRBMKLzY
	qnhX5qZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjAs-00000003s0U-3tl9;
	Thu, 11 Sep 2025 15:25:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjAq-00000003rzC-2lT1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:25:25 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b045d56e181so134053666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757604323; x=1758209123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGqDa7na50Tsqkd5b+BW6jy2kx5Qm/puj3/p65teiTc=;
        b=g66D1av+mF3HuhNSmFbIPiuDdMwz2Oa5FjSuhU6sHPdbWFl/yLLjneeOr9fpoPkIi6
         xEAAzCDlQBjbStpSLTIjmvfKIKuGFOj/fBKEHLG/zASKj+4jg0X7YYh3ouLtt4VNNzeg
         x8b3KmtapNVJUyNiBhQRcQndvhbjp7lCNGvpNeltXgP9Ux4FRQqZudUaQ1uoZ1VNlgis
         rEVynBTI90MZVmC8O9xAKLvT0xMK/9ifGc5JOroR0aHJ1+ZqgStw08dqsOvRmVixoUYH
         tyKUem+rdvw5Dez8CSlr3O8AVEQHBu38ojIq5c4tIYf4HEYla0wYG0B8oqngLwGxKn47
         pnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604323; x=1758209123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGqDa7na50Tsqkd5b+BW6jy2kx5Qm/puj3/p65teiTc=;
        b=gB/6RWS8efmhLokshZqJ40e9Azj9mjVq09gCaLFGlHHrEdIoOoCyO9qC58q7Ub3ttf
         0Nu0SsJ+aP7bohpOLf81yKXyfa5hvZ+YqjGvyx7EiIqJaTxhug5zZmUPhTHPgw443sHw
         GneclO6VIgYQHj2VGvt3Xg8HHrxWHO36G+Iai/vN8yxB/IHD6ke18usEMyeBPcxspFcB
         L5AqW2IKAi19Tqd2d51ePnyiI1gLXi/M4OFd4/U6ldI6K/hFB6daAa/kPVyRIMeUBn+B
         Yrck4FkSuUEjw1JdlGk+r5wV6bZFuvxPUZqbk2ajFafTz4nKT9QWxnE+KtQhrpZ6HoEz
         ktcA==
X-Forwarded-Encrypted: i=1; AJvYcCWJBu8iX60QXFp6svOixLHoNpYyBh3jUqd7MPZDY3SuFcE7hdySdbV1eYg/pMHkM5m/GktIWMqngcAaWC+1wJkb@lists.infradead.org
X-Gm-Message-State: AOJu0YzGLlI6IirYipe4wTUd5xnbvE5YVtHDhZLyvhvix3wOoWFvf3XZ
	B21FskIqN6xdfSWjI9lA4T2UNQRmT3tnulujHLRnvwXD6Z+gPKTQNlIWSdGLbSP7WPo=
X-Gm-Gg: ASbGncsgdSDrxqv6/neJ7gIl/EkDW8BI75c7tP62AH0q/2NXs/NJLtV/bN+uqFSt0rX
	Njfez2pHM2ckr5rRMwRQOuc+xl2AWbwaK0nHZDbdwkUS1wzEquTi4OScReiRzmoEd15oBT/4JHy
	61e4qUxv0zPeOxMaNX8D9NI7AsKsWjf7qOrWdqYQccj1moc8ErKP8RrU3WVHhpqVB0vKotowgqp
	/ScnQK4yyAOcba9YC3SXs5wUl2+OpEuX6eryx8E57Rz1QJJ8kaDWmUb5NUvoo7H03bXWnXogbDm
	Z+SwXgT8fqc86/x2bD3vZ2QgwaqNypU6X+a9SKf58CvryFsAZhmheI9QXJPkJ4GCm50+nLQiYCV
	s7yR4QuNoPnzyeC4aTLFWBxrc9k0M4pYLe7JdQg==
X-Google-Smtp-Source: AGHT+IHugeAv/E3LaNGHdPUBYX+6ZpCpqbd4db6KXGZqZL8GkcfgxCKJHoCmuX4C/ujMeGbekya4ig==
X-Received: by 2002:a17:906:7d43:b0:b07:6457:13f0 with SMTP id a640c23a62f3a-b0764571477mr938274266b.9.1757604322845;
        Thu, 11 Sep 2025 08:25:22 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32ddf93sm153255466b.69.2025.09.11.08.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:25:22 -0700 (PDT)
Message-ID: <7ecb5900-b7cb-4d2d-93a7-cf0dbdc03cf8@linaro.org>
Date: Thu, 11 Sep 2025 16:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] perf arm_spe: Correct memory level for remote
 access
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, German Gomez
 <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
 <20250731-arm_spe_support_hitm_overhead_v1_public-v4-4-58e5677a412b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-4-58e5677a412b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_082524_715874_A70CBB00 
X-CRM114-Status: GOOD (  16.07  )
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



On 31/07/2025 2:25 pm, Leo Yan wrote:
> For remote accesses, the data source packet does not contain information
> about the memory level. To avoid misinformation, set the memory level to
> NA (Not Available).
> 
> Fixes: 4e6430cbb1a9 ("perf arm-spe: Use SPE data source for neoverse cores")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8ecf7142dcd8705c13c27e0cbacd69647dc4fd22..3086dad92965af3981b1065f2892a3e67df7b616 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -670,8 +670,8 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
>   	 * socket
>   	 */
>   	case ARM_SPE_COMMON_DS_REMOTE:
> -		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1;
> -		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +		data_src->mem_lvl = PERF_MEM_LVL_NA;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
>   		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>   		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>   		break;
> 

Reviewed-by: James Clark <james.clark@linaro.org>


