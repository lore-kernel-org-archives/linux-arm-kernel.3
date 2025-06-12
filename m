Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E79C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yj1/RO4kxC4qOB4Tp4SB2qEu/HZwebp/3z5TAo2594=; b=MizaVxAL+Th/hNaS+oUwIVyU8r
	P2CUFFekoP0+LfKVZXNBp0ZMbZ68EbNlAmwxYnydfCAhz81QtDV2HgT2W6ugTO3eMkEmFpJvebmds
	iOZAahblYfIZYy8/py5gJfAOYLtYDozhNMqUy9aERxLF7qmFZTsNVTm8u+TK5A18Rr2b1UCZrygsL
	jpAXoD4C2nE2gGDLkYOF9QUgMKs5KCw/sHOXM07+F7tQmYLxuRm+AoJhigdD3o0ifvFrkM1YTPNSu
	iQcQB2Vj2ERQGbUHV7CpdytpnXkH4lpVUTqG+mko1SnCuAco41TZR6heqZNcrfk6MekXOk9dVKvQi
	+hJ3e9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPf9S-0000000Cydq-1yWt;
	Thu, 12 Jun 2025 10:27:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdy7-0000000CmU8-0cEP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:11:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5282D153B;
	Thu, 12 Jun 2025 02:11:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BA93F66E;
	Thu, 12 Jun 2025 02:11:29 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:11:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] coresight: perf: Use %px for printing pointers
Message-ID: <20250612091128.GV8020@e132581.arm.com>
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
 <20250611-arm_cs_fix_smatch_warning_v1-v1-2-02a66c69b604@arm.com>
 <1a3ff93c-7a25-4462-849c-b5031953bd41@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3ff93c-7a25-4462-849c-b5031953bd41@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_021131_225964_D6791969 
X-CRM114-Status: GOOD (  21.18  )
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

On Thu, Jun 12, 2025 at 11:14:00AM +0530, Anshuman Khandual wrote:
> On 11/06/25 8:14 PM, Leo Yan wrote:
> > Use "%px" to print a pointer, which is better than casting the pointer
> > to unsigned long and printing it with the "%lx" specifier.
> > 
> > Note, the printing format will be updated as 64-bit value:
> > 
> >   # cat /sys/devices/cs_etm/sinks/trbe0
> >   0x000000003744496a
> 
> But what was it before this patch is applied ? Just wondering if
> there are sysfs changes that might be visible to the user space.

Good question. Before this patch, the printing does not pad with
leading zeros, so the output result is:

    # cat /sys/devices/cs_etm/sinks/trbe0
    0x3744496a

The perf tool in user space extracts the lower 32-bit value with the
specifier "%x". I verified that this would be fine that the tool can
read out the hash value properly.

    ret = perf_pmu__scan_file(pmu, path, "%x", &hash);

Thanks,
Leo


> > This commit dismisses the following smatch warnings:
> > 
> >   coresight-etm-perf.c:854 etm_perf_sink_name_show() warn: argument 4 to %lx specifier is cast from pointer
> >   coresight-etm-perf.c:946 etm_perf_cscfg_event_show() warn: argument 4 to %lx specifier is cast from pointer
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > index f1551c08ecb20ebd7feab82dbaee3176e6bcc999..f677c08233ba1a28b277674662c6e6db904873dd 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
> >  	struct dev_ext_attribute *ea;
> >  
> >  	ea = container_of(dattr, struct dev_ext_attribute, attr);
> > -	return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
> > +	return scnprintf(buf, PAGE_SIZE, "0x%px\n", ea->var);
> >  }
> >  
> >  static struct dev_ext_attribute *
> > @@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
> >  	struct dev_ext_attribute *ea;
> >  
> >  	ea = container_of(dattr, struct dev_ext_attribute, attr);
> > -	return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
> > +	return scnprintf(buf, PAGE_SIZE, "configid=0x%px\n", ea->var);
> >  }
> >  
> >  int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)
> > 

