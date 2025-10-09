Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B569BCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2f/p58u5XFxpYSTCQRjfs244nlXyY9vgCtx1ygfs+Y=; b=TxlJWIDngae5bW+q4Qftl14Aii
	4IFLWuGjpQjLuwj1pgKzmSopQljfrc8JPmhPxZ4Z9huF6K8Cjfg1GzxILLx3XWNX1ewlqwIAt81oi
	LvldjOMWAM9FNmp9maNyjowQ15Akwt8zLtmoW6pUZCTNEWb2DSWolV4QJd8Fb9GMEA2QT0QsKN5vP
	9RoQdJoLRliFkUtxTTmUymH9BLjelRGCrzpyRyAaLYZ0djKl2UrcHyKQDtfLZEu7SlGkn8+57K2Iw
	Y2wp9wFLFluWKo7q4ZQZepJOmaxSAp2Wlprp+0+TT/knRyZvxLE3je901F192zPIxw9qEbZnrHwS0
	NTnQnodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nTt-00000005jAN-2x7Q;
	Thu, 09 Oct 2025 10:02:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nTr-00000005j9t-1OAH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:02:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so4619635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760004157; x=1760608957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2f/p58u5XFxpYSTCQRjfs244nlXyY9vgCtx1ygfs+Y=;
        b=pQyEC2UJv1s5mrzDBVLxXzgBHiI7cCV7XM+UPbpOJ/3N7xXU+W2H1vaxGuuNRUXAeK
         PMxdvBz4KxRYeX/fN/+IgyVqiu/jCzsNisT8WTSgHpbk/jnTQYwer1oHtXEsEayAHY+4
         sbktDyBCwHqHhdlocEDAQPiazMRkUN2zJbinRVluTQkQ5zvegj7ejapRSzndoey1YSub
         EMJ9o6X9+1T9400NYtsUyZ0rTOMm78cfOHyPThuCAsdxUtcv1MBxxuJIUeAcRXiL5d89
         IiPNz18Z10WwRfz3ynApw3vXRtrMUXGPqrBaQDn/FJTO2aqakHLqDz8Bul4txvwrPMYH
         +HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004157; x=1760608957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2f/p58u5XFxpYSTCQRjfs244nlXyY9vgCtx1ygfs+Y=;
        b=Osmr2egpvx06odOwvXE5pJJ+463VLFJ0ZyEcMBM/sz6m5S9t6cSE62xbet6+nc5w2E
         DS+qvfR1J2N3akFGXhAlK3cFt8Me2/90NBQ7q7/7IVGNrBl+Y1f6IgiGXt4tzoIyfLc7
         pt5cH5EmxeBpDrOhOKRD5s/enpuhr1o9NvH5ODot4zTj17ZkZZy1tY0K04cx23I0CTri
         PBYFhYSt4wp0AFCZd15CvNIq30jhpP8nreM1dOkNqY3udPAAbfGCjw1B+IIv9BqkX3zf
         i16REBFbkzWGsK6bBeLaiBITcs1t6Mbru9c3TDs/Y0pFekYVxZEYSyZ+7f0eCtGeMaCp
         qUZA==
X-Forwarded-Encrypted: i=1; AJvYcCXK/F9wLSKCVUzqpJY3W7dk7adPoMlCVtcbEADmp3HPqfY88xypFKD6+mgJNpo7ZR1YBdnWSaY70/YM8xVlmk4k@lists.infradead.org
X-Gm-Message-State: AOJu0YybDnX3HmHBCC4Iz6Qs6vijLdxYNQ01rYvgf7gkDsGCJYVncSxF
	B30ieagfqrN4u9yhp5f60IAk0tVVbXIY7D/WLHLtsNNqFHPuYyOgGUapvcYrjMlIEaI=
X-Gm-Gg: ASbGncuJ13wiSISciTnWCgSZiyEpn0BkgtyMfHzE9CNOTDCkhJ6NxNOfG5jSmxXKAmj
	2Z/gnsalypLiZjArNF7VLAA0+g8KPexFSh8qHemR5rHn/dnhbB3AuEwh238q7Wfp7/my1ih2nLE
	xmALvi/shgAuvFzJzK/1wnRDIGTvGRb4LfuPLm662G3NWjbn+kUVZYYZ/oY+WpWMdYVZIg/OVB8
	nOGroGn/AI+CMbniN4lSeHKlBnEc2YvPgd/ufC/hVQw7X/rt6363k9D4RoF0C4lzUL9U4hRlCDL
	yiKWwNePAwnOzBCCHjvGxUhTyooLBgamTwdT6TcZwui12smxwVhY+UelQscCYWlEwe4NSpFV+cO
	UfRmnxZciAw0mylTveMfe8mHJ+3YL89auSlZjYYRflOHj7UHAjGnl/frV
X-Google-Smtp-Source: AGHT+IGNBWZE6yne9v48Z53CH7yGDHH0Iq06THCD8hpUzG/jH90CPJxfETiLH2576v4ksUx86k7hqw==
X-Received: by 2002:a05:600c:4ed4:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46fa9b08be6mr49207985e9.26.1760004157473;
        Thu, 09 Oct 2025 03:02:37 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm33519201f8f.15.2025.10.09.03.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:02:36 -0700 (PDT)
Message-ID: <10332b1f-f73c-4bfb-a4d4-74e1953b75ff@linaro.org>
Date: Thu, 9 Oct 2025 11:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/25] perf mem: Print extended fields
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-20-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-20-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_030239_385590_AFAC1A38 
X-CRM114-Status: UNSURE (   9.23  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Print the extended operation types and affiliate info.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/include/uapi/linux/perf_event.h | 28 +++++++++++++++--
>   tools/perf/util/mem-events.c          | 58 +++++++++++++++++++++++++++++++++--

Minor nit: I would separate the commit to update the header and the 
tools change. That way you can describe that it's a straight header 
copy, rather than something else.


