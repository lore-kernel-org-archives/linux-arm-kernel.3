Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B17CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c84a9eMo0Dm/JWepc2tnRlDWvnvh5DqhzAwWVPo2EM0=; b=ReqzNeIkZJy2kbtMk+yJKrEHux
	8j5Zpe2sW8QaqXaNrKC2l3FPGTqoJNGAH2o9C8n3RldvswywbP5qUSE0MH3IyBUsQrix7fyuUoOde
	5wuXT4SXGl9BkKbm1I++tnkajBm3uNSkoAmJcba634fj8mJ2TX1/GeV634KkeAaBhRm5IRWRtJM34
	rwALR+vaXaeIdtCeTskfVVRlmSQhxMUo5b/u+XJVi2VlIRBp8N0+3bq2rWTWO3kylpFM3/3I8F/YE
	/0Ehx/du4NwXlpzGKcGLNHceozxBFj84N9GWrEyKpqUgl1ZYCnmLylnbfx4tt4YmxluTGVZCxxejP
	kQVu12ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWPV-00000003SNy-3kKn;
	Tue, 29 Sep 2026 11:54:13 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWPT-00000003SNE-0uuM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:54:12 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acac47206aso1059569a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790682849; x=1791287649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c84a9eMo0Dm/JWepc2tnRlDWvnvh5DqhzAwWVPo2EM0=;
        b=JBTCR4Hp1IEVyGuv2jChXu+sBwq95Ni/jui/0PH+hnmnVtvbBb1tFijZYNhtl9ZV1m
         rZ0dfg2JyvWnpeBGMx6A33Hi/1Scw7XgnMX4n9C+QlcOub4oUTVfWNlTKv49qtaY1q8v
         mCOTRnd3pd7llhw/2cstwzbH/tozaJZK+fg8yOTfmVaVdqGr+McUpfBLovSCmqrfb+T4
         QjTwAQr6HDr4zwpHVM+rOPVy09wL4LoUu8z8UUMmQuEX/a/HHfpn3RB1PLGdjikPlKdT
         tRs6KphnDHcCoW7ZLVbKb24WDIc9XILJhKjgrBD+j40HGF0zZAukCeq4QPXQBxE8gCuG
         DCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682849; x=1791287649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c84a9eMo0Dm/JWepc2tnRlDWvnvh5DqhzAwWVPo2EM0=;
        b=XLOTECkb0wNFRiXhE4RkT12xjk36lWC7eWB8YSiAVGQn/5k8+TjrmmW0dHSsUlxve2
         MtL7zLQ5LD7OTKMM9zygHWhqpAfh7XZP9w1GdkfYRLfZtMEx2bSe/daCNLpYaZpau0v6
         KhjtBo5HuOZDdecprp52CNuFW4Ky0d2bnFPULgQBlAF3TWLQqZHNJQe33SgCJzd/QlXU
         uuChwdU1hOWG3ZpYkEmY6/UvaiWdddUgMdB9zCeGkWQEWgrbL0KB4bipRyLzbb9uQS5g
         e67M2b949mAXSVEIfu9ODrD7fMiVrXiVK/qB2NvZQJMVY7LhwnP2MCWk3oW7uPX4P8Lo
         trIw==
X-Gm-Message-State: AFq9FYKYpmTHJY7p6Towq2DYRxVlbS7dU1Sys8KzPfEqCpiO6qw6pDwz
	bIg3ZUAY0fjqhmwJ33gbVgH3TK7GKxTWpTVpsaZi72287Q02k7nPz/XkEEjeOaNBXhg=
X-Gm-Gg: AYBFou2zaNTKi2PTwBePLbxdfTy9ZYwUmJXW58aHjGZPVLaUMppyCU/b7VbTpsuIa9u
	WKrqnz+dTuOBtShQ++ju3htHJmaaiFs3c89ONB88BSpb/cQN/ukrgLBUAE6bbcP5lOMktoP2P3T
	90wWHVCTgs/8eAhtbYAaKe3bjbNdct3hLpJ73/c1WijpC/1xk5e9BnRa+teP45pKy/0YMHd+m8A
	aebfe1EplZKs6ybaMH9NFfdq2QM88xwLOeQ5YZ/En59KuPG0pMVGJhHukLsfKtkX507+qHS16Hg
	gwuRXDWpeE2642JZAYGtFXx7YZbk9u4dXUMkiPDzFC7dgKc7YPu259jR/rw43zKb8+jHQU7T69u
	fwzgE+DBcq2Vl6FXI+vBaThr2Ld0Jlu3+3ueA6IebC+r1VzevfG0+YZl6JRydOr2CDohq04pxe0
	l8VTBOpQxV7Cg/uOMIXD4UShEH2K9QiJu8aJrHXLI38foNt1sQWDd5Vgujw0iH8QyCGVbL7/yCs
	9c=
X-Received: by 2002:a05:6402:27cd:b0:6aa:f129:b193 with SMTP id 4fb4d7f45d1cf-6aaf129c2ebmr9300291a12.22.1790682848790;
        Tue, 29 Sep 2026 04:54:08 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9048ebfsm707949a12.30.2026.09.29.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:54:07 -0700 (PDT)
Message-ID: <50a0338e-e395-407c-bccd-cfb90f113e58@linaro.org>
Date: Tue, 29 Sep 2026 12:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Add Neoverse V3AE data source decoding
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kieran Hejmadi <kieran.hejmadi@arm.com>
References: <20260928-perf_arm_spe_add_neoverse_v3ae-v1-1-738c9ed12d31@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928-perf_arm_spe_add_neoverse_v3ae-v1-1-738c9ed12d31@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_045411_278163_CDD677DF 
X-CRM114-Status: GOOD (  15.24  )
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



On 28/09/2026 17:12, Leo Yan wrote:
> Add all Neoverse V3AE revisions to the list so the common decoder can
> populate the memory source and snoop information.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 7805a1a98a89a2853ad02ee7751472eddb1054ed..8d95df23be6f654caee77e9d155af7ebf5129c91 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -626,6 +626,7 @@ static const struct midr_range common_ds_encoding_cpus[] = {
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
> +	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
>   	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>   	{},
>   };
> 
> ---
> base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
> change-id: 20260928-perf_arm_spe_add_neoverse_v3ae-917f280b2c7c
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


