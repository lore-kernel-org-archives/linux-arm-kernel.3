Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31690CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aY/Nfwg53Oq8ymsLpOJ6a1fY6HTW8kUvDIjfnbLWXVg=; b=KRJ1ZPpQ8Ot5Qp3pu9qRnj4iJM
	0Nxcvr3WHcfR6r0aK6cwMCUxJPPQc6h1IntVB4YD89zI1ufUqZaYeoUwqjr2rCFKVXZlOXEbjuRfV
	Fz4VoHKonnM3avXeLvefIergJEzwJfsYziD0rmShoiCvgh82Pr6NWyd7U6vvEjiY4aIxbOzz/HW0k
	D0LwbIHp3/8jkybcGVZajA+J1HnwI7WQMbD9En8+/mL4JOW05duxEGEWwVkYebVjQAgQLrOmpF4Fs
	e/lZdyTR6SThdKyz3b0WxRDliqyu2h+pCCSJ/aDeZ7Y/XOMKtgKAsxIII9h0DR5GC7p0Kl03BkKua
	5zEvO3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5yC-00000006sQv-3wpd;
	Thu, 20 Nov 2025 14:49:12 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5yA-00000006sQX-1LhM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:49:11 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b2d56eaaceso89171285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763650149; x=1764254949; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aY/Nfwg53Oq8ymsLpOJ6a1fY6HTW8kUvDIjfnbLWXVg=;
        b=KMPjWSAqYIXWoUgTlToexsmkIh0sTxekr5aajriDYPvxY9XhZW0mWYUihLKTeBEvn+
         8Um6wGrIPT70PlV5rVmovUN43+/5SIdRJjnjTc7L25URZDIMl0dJILSRStJk8BPIDm8c
         gbgDLjsvrkvu2wd4jNyl/AqnNB8dp+NeWY+IuJxsIvNyXSGDzdfyMrLJcssJtcKj7s2o
         zch4wNrIxWKKho5WHu2+TtDMMC2OBQj6w6YxCNCFa8DyXU14H+nh93s/oHgowME07sGV
         eNy4GKc0UXIVm2zzCPZ6uUVLnIcLgSnkz3lwTMgGZ2hZoSjKT28Qk3rNltDhcfdYyugH
         m2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650149; x=1764254949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY/Nfwg53Oq8ymsLpOJ6a1fY6HTW8kUvDIjfnbLWXVg=;
        b=Y1Vt4UyDu90VOz4a2oesNbzVdvyyyQZinWBzUyqWcoVJO7purox0/VBOwhjZAIPQ3+
         KIhfl6HQBnA4CLVfK9O0bULE4TeWg0iDdcUzNP71SAdGMsP7Vkhhe50cBY9kgBP/ZDRR
         ISDfrxi5waCB+mk1Ytb486uOQJk5jU8Rq1NqwRNWan0bbd/pSt4noIjBGJyDh1pmU7we
         z7dC0GO2lMjzrizcbK1BsC7Ap/SDIR8VCgHtejO5Bo/vD76J8kScf1Xt49VIMWS4qFSH
         DZVC8Yhb9j70hjpnGyqqWfu6DsBab51/R0iTs6skUrKaxECYkYOB4tE/zWCnISiapz77
         aUTw==
X-Forwarded-Encrypted: i=1; AJvYcCXcpHf4cS6L2Jp6QZ4qGrS5eLBWZfE22OLCWmvecZJw7B0P0DXxWqE8katXjCnUiUfxsSLxfOvS4xlYRpfG9c8R@lists.infradead.org
X-Gm-Message-State: AOJu0YzRB3W8Y8b/vR14Km6pvnb5aqwWNEBYFgzJ2gnIFCfJFLbFOZ61
	L51zS3BXl3yPrREMb9aCDPUTV7U+Bk4+dEKwIsKkIBee3lJXec6AGDQD0DBrsrMhKd07h2smxh4
	6X2OlUczP1/YtBvvWWd0rUTdXGhPTH6pD62/gAyaf+A==
X-Gm-Gg: ASbGncvDteLfABZwJAzugsx9GJ3HIddOSUmvpFyNCIcv6eZMhfcHrzCMVvVZD+hORUt
	hrpG8BNWVTSn78N4fXRuYaDWSohBSpa+B3dakgzhfVREsB68e0CqjVzPeeBEvHfsZBQvrrD7XmN
	87mUQ7U3XwDcBufihFkS4JA4VPXxBQWSoBMBC5YKEkG0Dib13rmbdY80UrE+xMnN9P3JHrz2j6s
	HuG5FgGPznIDyCaEzZ3don+lCGaVZqqyqv3Fmzq/3X7R9puGsQiU3LADkkos9UPDJZdr57pRUAF
	TxalQasDdTX7GZBTP83zLKbbZLED
X-Google-Smtp-Source: AGHT+IFST+o3UHCJgrh01U8g/Epnj72ciDSACETTwqxanvV4FIOHqlhYm62HhwbYYcFoHS9z7vl+Fkuls0kROCBoL2c=
X-Received: by 2002:a05:620a:191f:b0:892:7dd2:9f14 with SMTP id
 af79cd13be357-8b32f315b9dmr220687085a.25.1763650149109; Thu, 20 Nov 2025
 06:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 14:48:58 +0000
X-Gm-Features: AWmQ_bmFP76OyAR6GFA2lLA0bgjVAk5MbAONEPZAKM7SNce0dpJzZvuvLdO-5Qw
Message-ID: <CAJ9a7VjafO3NmEXH283wNzGpws3dweiUSW_vPjTA3TVb4ezL1g@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_064910_395361_C9B209DB 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> config isn't the only field, there are also config1, config2, etc.
> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
> done for all fields. It was only necessary when we were directly
> programming attr->config into ETMCR and didn't hide the unsupported
> fields, but now it's not needed so remove it.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 4511fc2f8d72..584d653eda81 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>         if (config->mode)
>                 etm_config_trace_mode(config);
>
> -       /*
> -        * At this time only cycle accurate, return stack  and timestamp
> -        * options are available.
> -        */
> -       if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
> -               return -EINVAL;
> -
>         config->ctrl = 0;
>
>         if (ATTR_CFG_GET_FLD(attr, cycacc))
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

