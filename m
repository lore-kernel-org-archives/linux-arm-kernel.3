Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E1D1171B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDVVL1FObILaHO8a5uZXA6BUgHRTFpo/Zkl1tM8jktw=; b=2c0eViyyknFRPNeFt6SNPPftnz
	ZAb3rLFJOI7eHr/mxIB5jqfTmUFd9XrODWNVBzjrzhpA+w6pHmYWX876bEQDQlVYHJYbSP25dzXZ6
	JXLYKn+17patrWWL8NnsZa36LyzJM0d4lQI+Q1ORsUClJVsdTTc6/kSqEZAfUIpcwiIoIZLqIWPhR
	abJpHUUiGBLoodM70bQa3hMhi6UpR2AujHPh/NStDmtnNEYoyjYwoymeXbvIIexXO9dxDXgXepbAz
	WDn6phHUdrFTURl/Z8IwjIaJg+7g3HxOrgFF3pUVh9MfH3Raeb3cxUGXsBaoEhhetEKKchKKVzV1C
	vjwA28+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTvc-00000005ewv-0xrB;
	Tue, 02 Dec 2025 17:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTvZ-00000005ewX-1Zt8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 17:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5C01477;
	Tue,  2 Dec 2025 09:12:28 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867673F66E;
	Tue,  2 Dec 2025 09:12:35 -0800 (PST)
Date: Tue, 2 Dec 2025 17:12:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 11/19] coresight: trbe: Apply overwrite erratum for only
 wrap event
Message-ID: <20251202171233.GF724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-11-7da32b076b28@arm.com>
 <cca13ee6-83d9-4478-ace0-1e7bedf79d0e@arm.com>
 <20251202165647.GE724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202165647.GE724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_091237_482376_1FA7103A 
X-CRM114-Status: GOOD (  20.29  )
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

On Tue, Dec 02, 2025 at 04:56:47PM +0000, Coresight ML wrote:
> On Tue, Dec 02, 2025 at 12:05:52PM +0000, Suzuki K Poulose wrote:
> > On 01/12/2025 11:22, Leo Yan wrote:
> > > The overwrite erratum occurs only on wrap events, so apply the extra
> > > wrap condition check in the workaround.
> > > 
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >   drivers/hwtracing/coresight/coresight-trbe.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> > > index e579ea98523c24d23a0cd265dcdd0a46b52b52da..2600af12a8fb94bb8c74efda2a101aacd01b0b34 100644
> > > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > > @@ -714,7 +714,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
> > >   	 * 64bytes. Thus we ignore the potential triggering of the erratum
> > >   	 * on WRAP and limit the data to LIMIT.
> > >   	 */
> > > -	if (wrap)
> > > +	if (wrap && trbe_may_overwrite_in_fill_mode(buf->cpudata))
> > >   		write = get_trbe_limit_pointer();
> > 
> > This must be trbe_may_write_out_of_range() ?
> 
> SDEN (e.g., [1]) is ambiguous about how the write pointer acts for the
> out-of-range erratum.

Thought again, we should not worry about out-of-range case.

As the workaround always ensures sufficient space beyond the limit, the
write pointer remains valid within the allocated buffer even if it is
updated and crosses that limit.

