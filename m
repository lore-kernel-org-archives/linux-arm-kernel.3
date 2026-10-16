Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2254ECCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P33/sA4gGKMdrtPonMZZt7DDO16tTuj+Ea0EHreBIs=; b=yLfRs6q8yMIaYTQ1n+MFIso1vc
	fmK6Ztca+qt8nvEmHLMDb2egMsd0G0NbUwhXMO4BjS5XgrMiLJhjHehpCS2TW/HkpHkHceBBBGSrI
	J9rKnTzoW+YVejItYz8LKvNt/h7CY+4/i1FifP8sLZjhjknWg0JlrBHXPaQ1/3FUIZNetKK7rWLnj
	b7of+67Ypkn0cwoL2ez9/1dVe7s7nwOfsO4i7aJMuoY5VgqYvXx+Y9ADchFFwpfHkcm94s7uC6cQ+
	ge57u175gRHA/K/TLeAFPqXNC9CNRyD2mM1IjCCA0ohvDrT127hZ+8EXdtHhAOxgGqLvceh0Q/pys
	Q70QKr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHf1W-00000002b3O-123z;
	Fri, 16 Oct 2026 10:18:50 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHf1U-00000002b20-0N4R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:18:49 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so599032f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792145926; x=1792750726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P33/sA4gGKMdrtPonMZZt7DDO16tTuj+Ea0EHreBIs=;
        b=dDFqpzWapYjum+i36qHrtjX/8qBoE1LpISXz+pS0ZE9L2qr8nTPNS8t/KI/w8bkQPo
         LuSzO1P6lzZIeAPNnxqYIvPs3tli5eK1xlDPxLazlAjEltS2ytB22D2weyrcJmS1T480
         1zQtbwBaRs1puV+OqwKi42voghTpU7hT8g4U2qaqGtu+ifmnbjIWABBo20ae3oGlY55/
         lfST25cQ/pEo6hfhI71ek5LYoxTEAOFBVq3BZ0cIuCI3fmambzDEG/9h37LWZpESEk/Q
         9a3vEfPfZM1e38RBciWA2DxYkVHnfJDqCkDtD+xin/Dlv8zktiR06Wj/gM1Gu1mZXVkI
         IBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145926; x=1792750726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+P33/sA4gGKMdrtPonMZZt7DDO16tTuj+Ea0EHreBIs=;
        b=i4p0c4NAaDQESDZC3DSTCfbQtmJqD114KkcP7I0mg8HbJ2M7iezUxPrDUlYXbTYLqt
         Czne8vsC6rDRDyhTOaJmOJDFgpbPGpNHQ50xFaYnnDk6D2hOjPkUBv7KDQHODOgVYpOz
         PYXoZZlSu5aO0Vt750E6G1+9kNhI6tWXu2BiRvou7Z+uV8CsnVYY/CtxMSP916LFKQIr
         le74u6qhX6703wKadtUE51PS098YJAlkljbNspUTMf6QqsPaXJyZ0yJQqrWIFZaATL79
         CnpVI71Quh/c9sr/MxKbsaf9kJHC0LU5ub4mDnFo9ytxsfxjMbMe0d6dryk47Ii+tF8r
         pBGQ==
X-Gm-Message-State: AFq9FYLdHY9HO4cS00RWlAhxf/WtQkzFYn5an6JKSyZ6yuEZXymm5xH7
	jU9CHFMtLCTOI9qILVpWJnO6OgwMZc0HNWhDNYONcv+tAl/u1ARNwV0W2lQlv6bvToM=
X-Gm-Gg: AYBFou3wjEXD6fpI6/7e8/92vC4BKO1qGl1mXFS7r5mOJWU/Q+lM6RSYuDkf7MabmeC
	D8Kus2F9mdCxqQCG+EvwXWGpXIsXD2ls7Z2uNsDga6kQllJqURhyR+AQwO2bpupGvL001pj0+fs
	6bg1z779r2tARKe1JjLUl1yi8/iWTGyIQCin0PotJQ9TxehQXXdCxwDcEiiLktCgfqOc+NvEPdy
	Rd5/fMno7e2YDyf3hJ2fIDsp4IQCR69He8wz6MdKCuyUsQlXZjjQY125cPKeVT4/0qFSRKv+o2q
	arhIOGp1DKONOXd/7QMDnTfhhnCWhIWhXds5wLkzAY541zKdmw8Erces3rc3+CMk62wGWuNreLR
	RYiiU+lkiingBRBL/6XwLZjJU7dt0Lbawkdsq55iejo+PsNmkVfhc567flojOlOduCcv3CWG4jO
	SBP3foB+0z+9/N1vzio1t23gzrqnk5M+pi+rC4/OQkynFozHZB+R4StrR1BLxNuRPOr0LmSvwj6
	rY=
X-Received: by 2002:adf:e195:0:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48dbaaed96dmr43622879f8f.29.1792145925501;
        Fri, 16 Oct 2026 03:18:45 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm3840867f8f.19.2026.10.16.03.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:18:45 -0700 (PDT)
Message-ID: <53999f08-bbfb-462e-8521-383aba65f2a9@linaro.org>
Date: Fri, 16 Oct 2026 11:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf: Order SPE and TRBE padding before publishing
 AUX head
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_031848_149721_88F0484A 
X-CRM114-Status: GOOD (  13.33  )
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



On 15/10/2026 16:51, Leo Yan wrote:
> SPE and TRBE write padding into their AUX buffers before advancing
> aux_head. Add the missing write barriers so that a userspace reader on
> another CPU cannot observe the new head before the padding stores
> become visible.
> 
> AUX producers must make their data visible before publishing aux_head.
> The required synchronization depends on the trace hardware and CPU
> memory model, so the barriers belong in the drivers rather than in
> perf_aux_output_skip() or perf_aux_output_end(). The TRBE change also
> covers padding inserted by the overwrite erratum workaround before
> perf_aux_output_end().
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Leo Yan (2):
>        perf: arm_spe: Order padding before publishing AUX head
>        coresight: trbe: Order padding before publishing AUX head
> 
>   drivers/hwtracing/coresight/coresight-trbe.c | 2 ++
>   drivers/perf/arm_spe_pmu.c                   | 5 ++++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> ---
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> change-id: 20261015-add_barriers_for_perf_aux_output_skip-70356815b2bd
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


