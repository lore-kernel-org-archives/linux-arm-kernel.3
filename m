Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E5CD3B980
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2YBTibfqXTS1yuGLJIXl68TfOJpuaorEKEOv0RAv4k=; b=XANR6WDa3+66JHYp4TjiQ7v1Bs
	rLsAARlYYBfTI8yqtzydh4BLCTxyeUJ38P5Diwj+rqOTAq9qU69dYEsIN+HWMrHV4LSmQrzl6LAY6
	CfPHIArICUhnAjNfPBzzVfW1L5Vc9dYXa/0JCIh61imff2MSevBumYFWYWKQSj00up88dHUTMNrKJ
	mIC34t429xPRlOHcpnKTO9Q6Tjj3OUOxYXWR1RRbqVDprKEHLhVC0r2pp1hYuj46Gw/kj4SPUMBF2
	vMOtQz/O10iYslVms2PnHKk5kvCiW73CuhTG/w1f5j27Pn/INlPYZnGSrMPxpZTb/zBaS6IPdCNAv
	5t1RYkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0EC-0000000EUyH-2oo2;
	Tue, 09 Dec 2025 16:06:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0EA-0000000EUxn-35N8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 16:06:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0B3175D;
	Tue,  9 Dec 2025 08:06:05 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642CC3F73B;
	Tue,  9 Dec 2025 08:06:12 -0800 (PST)
Date: Tue, 9 Dec 2025 16:06:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 06/19] coresight: trbe: Refactor syndrome decoding
Message-ID: <20251209160610.GY724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
 <65c84357-0bda-454f-88c3-623b3ff9d29d@arm.com>
 <1c1092e6-aa5d-4bb1-84e5-81151a02cc6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c1092e6-aa5d-4bb1-84e5-81151a02cc6f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_080614_847057_1A59D734 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Dec 09, 2025 at 01:17:50PM +0000, James Clark wrote:

[...]

> > > +    pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx,
> > > TRBPTR=0x%016llx, TRBLIMITR=0x%016llx]\n",
> > > +               err_str, smp_processor_id(), trbsr,
> > > +               read_sysreg_s(SYS_TRBPTR_EL1),
> > > +               read_sysreg_s(SYS_TRBLIMITR_EL1));
> 
> Don't you need to use %p to not leak pointers?

I will use "%pK" instead for debugging purpose when set
kptr_restrict=0.

> > > +    return TRBE_FAULT_ACT_FATAL;
> > >   }
> > >   static unsigned long trbe_get_trace_size(struct perf_output_handle
> > > *handle,
> > > diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/
> > > hwtracing/coresight/coresight-trbe.h
> > > index 45202c48accec7c86ba56130e2737bc2d1830fae..d7f7cd763c0c7139cf322b7336ee563073e3bea0
> > > 100644
> > > --- a/drivers/hwtracing/coresight/coresight-trbe.h
> > > +++ b/drivers/hwtracing/coresight/coresight-trbe.h
> > > @@ -35,9 +35,11 @@ static inline bool is_trbe_enabled(void)
> > >       return trblimitr & TRBLIMITR_EL1_E;
> > >   }
> > > -#define TRBE_EC_OTHERS        0
> > > -#define TRBE_EC_STAGE1_ABORT    36
> > > -#define TRBE_EC_STAGE2_ABORT    37
> > > +#define TRBE_EC_OTHERS            0x0
> > > +#define TRBE_EC_GP_CHECK_FAULT        0X1e
> > > +#define TRBE_EC_BUF_MGMT_IMPL        0x1f
> > > +#define TRBE_EC_STAGE1_ABORT        0x24
> > > +#define TRBE_EC_STAGE2_ABORT        0x25
> 
> I know some were already defined here, but this should probably be an enum
> in sysreg.

Good point.  Will do.

Thanks,
Leo

