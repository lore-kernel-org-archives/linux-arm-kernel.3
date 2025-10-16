Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC75CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBUWbi5q3rWXhcmofH0+VB+Bt1vAtcSnjMgTtqT7LS4=; b=BEx2ED13ZH7C3PlLb8rP29I9T/
	R3e0P9JznVDf/QZ8MOUYVE7Fe/L0VD+Qona3IR214fGwHuQ40lDMT8QcPyfqLqtc8G9OdIHPNl6MX
	6AvXbOkHtTCIb/Lh1FhuiAKsIjWWej8a6bVnqmgtwCcS4GaLhoSLE+u40cL0xt+3At72tHmEVu7gx
	pXRSpmmuFzCfRf8WJl3cg5O4ZR1DTPlw9FwgzjfCzHkK2xgbwmBkuBjy3JVHCJ82EeT9MPZ6Zuwd0
	yyKoT+Z6CgdohcAYxPlfBW+ZjbbnHJrIZ0tZ83Q4+V5DXZjdOwlyI00secv3wMzjWMWXmSYfnUV3Z
	lBhJe3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Jzo-000000047th-4BgL;
	Thu, 16 Oct 2025 09:10:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Jzl-000000047qh-2tJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:10:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C41C81688;
	Thu, 16 Oct 2025 02:09:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D5F03F6A8;
	Thu, 16 Oct 2025 02:10:00 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:09:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: tanze <tanze@kylinos.cn>
Cc: james.clark@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	graham.woodward@arm.com
Subject: Re: [PATCH v1] perf arm_spe: Add a macro definition to handle offset
 value
Message-ID: <20251016090958.GE109737@e132581.arm.com>
References: <20251016083019.27935-1-tanze@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016083019.27935-1-tanze@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_021002_183120_403C650D 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Oct 16, 2025 at 04:30:19PM +0800, tanze wrote:
> Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
> and improve readability.
> 
> Signed-off-by: tanze <tanze@kylinos.cn>
> ---
>  tools/perf/util/arm-spe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 71be979f5077..645048ac7708 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -36,6 +36,7 @@
>  
>  #include "../../arch/arm64/include/asm/cputype.h"
>  #define MAX_TIMESTAMP (~0ULL)
> +#define SPE_SYNTH_ID_OFFSET (1000000000ULL)
>  
>  #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
>  
> @@ -1732,7 +1733,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
>  	attr.sample_period = spe->synth_opts.period;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + SPE_SYNTH_ID_OFFSET;

If really want to improve a bit for this, I'd define a macro in
util/synthetic-events.h:

  #define PERF_SYNTH_EVENT_ID_OFFSET    (1000000000ULL)

Then, apply the new macro in files:

$ git grep "core.id.*1000000000"
util/arm-spe.c: id = evsel->core.id[0] + 1000000000;
util/cs-etm.c:  id = evsel->core.id[0] + 1000000000;
util/intel-bts.c:       id = evsel->core.id[0] + 1000000000;
util/intel-pt.c:        id = evsel->core.id[0] + 1000000000;
util/powerpc-vpadtl.c:  id = evsel->core.id[0] + 1000000000;

Thanks,
Leo

