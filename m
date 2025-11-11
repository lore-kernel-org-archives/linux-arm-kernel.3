Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6DBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e7yn7s1XQtiRBa03S5N6GS6xIer9ZSlKTyvpE7kXHI=; b=pY1P6PPCjuiFKnK4cJUQr3ri4Y
	pw9UJWKNCeFBxuDAsUQ/jnO1ocynJQuTme9NbofPecSJwLFOZZSfkaX6FA+5X5Xiif9vUQ45FqEeK
	4VLK0hh9WOwtiHBNm8WFVz2vMHz+xQaPEA1cFKpXKJvBEVcutvZjBNcKykf5pDaRCqkMNB1fmJXf5
	utW5bq9gJoFTDpotFvAC6mN2k6vowM6Zk5PQAumMjSH9efO578dl8ucFzDgkbJ6VucXlAB8LKiHni
	hWh8ZE056ChprRGF/u1XfQz4NspULynK+vbP3r89n2DNDFqDuvPWOBRdld8aMaNQzXruWxCWnx4JG
	aoA6Dggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm2O-000000071mu-2vPs;
	Tue, 11 Nov 2025 10:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm2N-000000071mS-1jFO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 10:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6e7yn7s1XQtiRBa03S5N6GS6xIer9ZSlKTyvpE7kXHI=; b=haezqG7DjCoy/XwUDm/4CRUj0D
	GU73y9BGJ+J06CCZYEAV18NSFvK2+1iGFIiL/EywksGvZSXsOWRT56UfygWcyZdAGVUQaRDygq3fi
	5UdtXdRTaTjDec1HPK1hOQDqYq3iN92Mo37Yt4cl72XaGjQzR6U8FtV9PSZCJDpjKW5nfVoJqDZdv
	/+rbcj2vFPXqZkMQG7l21MB3ps0aAmGRP32UT7wbZbkaYrpnrTaVxJUxOxJrs8ok/5JhocgP+EuF1
	4FujX3EDXvOfOmpK5JxM0pYpWwOoQpsVeYLBhYaLzA0Ej269G6KQWwR/jyiK9sQxVnHL6JfSE/gD/
	rJWAyfeg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlAg-0000000CyKB-0fBo;
	Tue, 11 Nov 2025 10:00:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4AEE6300328; Tue, 11 Nov 2025 11:55:45 +0100 (CET)
Date: Tue, 11 Nov 2025 11:55:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v9 1/5] perf: Add perf_event_attr::config4
Message-ID: <20251111105545.GJ278048@noisy.programming.kicks-ass.net>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-1-d22536b9cf94@linaro.org>
 <aQi9MstZTsloKmeo@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQi9MstZTsloKmeo@willie-the-truck>
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

On Mon, Nov 03, 2025 at 02:33:22PM +0000, Will Deacon wrote:
> On Wed, Oct 29, 2025 at 03:46:01PM +0000, James Clark wrote:
> > Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> > packet using another 64-bits of event filtering control. As the existing
> > perf_event_attr::configN fields are all used up for SPE PMU, an
> > additional field is needed. Add a new 'config4' field.
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Ian Rogers <irogers@google.com>
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >  include/uapi/linux/perf_event.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> > index 78a362b80027..0d0ed85ad8cb 100644
> > --- a/include/uapi/linux/perf_event.h
> > +++ b/include/uapi/linux/perf_event.h
> > @@ -382,6 +382,7 @@ enum perf_event_read_format {
> >  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
> >  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
> >  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> > +#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
> >  
> >  /*
> >   * 'struct perf_event_attr' contains various attributes that define
> > @@ -543,6 +544,7 @@ struct perf_event_attr {
> >  	__u64	sig_data;
> >  
> >  	__u64	config3; /* extension of config2 */
> > +	__u64	config4; /* extension of config3 */
> 
> Please can one of the core perf maintainers ack/nak this extension?

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

