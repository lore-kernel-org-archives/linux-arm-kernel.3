Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C684C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOTJJaxuE59TJ7zJEtm/CQ10vPf1/EmC5GMQk7qBpf4=; b=BK+fPEWeSQ7JTxED8xJCejneUb
	tqobsrRQ5fNdwhm9B9NfkBPERMvvIGOzp2Tv/WQ0kmnYNsL6Up2SX51y8aAuBWQ6Lq406U40Tg0Lr
	c68USLhOLQBO1uDFjfY3AdkBdcVsUon6QAp29UcopHfclO2VFV4rUQRxK05kjncfFZv3L6LTxSJeH
	DumY5YQ/WETInCLUr36T+bTvi9pqTBtyrw5s5/A/t6zgAUUYzXdFJ4RWnrljf+LwXUxgk0ertlM7u
	EAra/5vX9DOQOdVYMzD97YaTJ1Zdons/5eMnbitCSxH2VGiQAJim2ca4sluwDm0GMx98FP4MzY7Ud
	Y1Qwa/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdKn-00000002oi4-3IBp;
	Mon, 10 Mar 2025 13:38:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcIt-00000002dZO-1e3o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:32:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0DA152B;
	Mon, 10 Mar 2025 05:32:30 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ADEA3F5A1;
	Mon, 10 Mar 2025 05:32:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:32:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] coresight: Introduce pause and resume APIs for
 source
Message-ID: <20250310123213.GF9682@e132581.arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
 <20250310104919.58816-3-leo.yan@arm.com>
 <65979e92-0047-427c-848d-53f908671905@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65979e92-0047-427c-848d-53f908671905@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053219_521723_0755C2D3 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, Mar 10, 2025 at 12:01:25PM +0000, Suzuki Kuruppassery Poulose wrote:
> On 10/03/2025 10:49, Leo Yan wrote:
> > Introduce APIs for pausing and resuming trace source and export as GPL
> > symbols.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-core.c | 20 ++++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
> >   include/linux/coresight.h                    |  4 ++++
> >   3 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index 0a9380350fb5..eb7b83a7bfa2 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -365,6 +365,26 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
> >   }
> >   EXPORT_SYMBOL_GPL(coresight_disable_source);
> > +void coresight_pause_source(struct coresight_device *csdev)
> > +{
> > +	if (!csdev || !coresight_is_percpu_source(csdev))
> 
> You may remove the !csdev check, coresight_is_percpu_source() already checks
> that.

Will do.

> > +		return;
> > +
> > +	if (source_ops(csdev)->pause)
> > +		source_ops(csdev)->pause(csdev);
> > +}
> > +EXPORT_SYMBOL_GPL(coresight_pause_source);
> > +
> > +void coresight_resume_source(struct coresight_device *csdev)
> > +{
> > +	if (!csdev || !coresight_is_percpu_source(csdev))
> > +		return;
> > +
> 
> Same as above.

Will do.

> > +	if (source_ops(csdev)->resume)
> > +		source_ops(csdev)->resume(csdev);
> > +}
> > +EXPORT_SYMBOL_GPL(coresight_resume_source);
> > +
> >   /*
> >    * coresight_disable_path_from : Disable components in the given path beyond
> >    * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> > diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> > index 76403530f33e..a9f14c075e91 100644
> > --- a/drivers/hwtracing/coresight/coresight-priv.h
> > +++ b/drivers/hwtracing/coresight/coresight-priv.h
> > @@ -247,5 +247,7 @@ void coresight_add_helper(struct coresight_device *csdev,
> >   void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
> >   struct coresight_device *coresight_get_percpu_sink(int cpu);
> >   void coresight_disable_source(struct coresight_device *csdev, void *data);
> > +void coresight_pause_source(struct coresight_device *csdev);
> > +void coresight_resume_source(struct coresight_device *csdev);
> >   #endif
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 17276965ff1d..703e1b8dbe22 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -385,6 +385,8 @@ struct coresight_ops_link {
> >    *		is associated to.
> >    * @enable:	enables tracing for a source.
> >    * @disable:	disables tracing for a source.
> > + * @resume:	resumes tracing for a source.
> > + * @pause:	pauses tracing for a source.
> >    */
> >   struct coresight_ops_source {
> >   	int (*cpu_id)(struct coresight_device *csdev);
> > @@ -392,6 +394,8 @@ struct coresight_ops_source {
> >   		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
> >   	void (*disable)(struct coresight_device *csdev,
> >   			struct perf_event *event);
> > +	int (*resume)(struct coresight_device *csdev);
> > +	void (*pause)(struct coresight_device *csdev);
> 
> Given these callbacks are for perf mode, does it make sense to pass the
> parameters similar to enable() ?

It is not necessary to pass perf event handle to resume() and pause()
callbacks.

The main reason is perf related operations have been processed in the
coresight-etm-perf.c layer, the low level's callbacks (pause/resume)
should simply take actions on hardware logic.

> Also, should we rename these as :
> 
> resume_perf
> pause_perf
> 
> To explicitly mark them perf mode specific ?

This makes sense to me.  The naming "resume" might be confused with
CPUIdle's terminology (CPU resume).  pause_perf/resume_perf can
perfectly avoid any confusion.

Thanks,
Leo

