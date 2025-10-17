Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07977CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQFlh5eyPqHdXJcM3VzuN3WyQDRPTDEFi02MHeJQxoY=; b=4XoystrwCENUDB7tbwfZz81A/w
	DNGwrOxiQhYOQpQiVeClr5GB0eeRo9v4R8rnim+Lq3ROQUTe9irdCHvzAAl76uWnMTeR5QR5ZfY0R
	iWe6LO4cuFmGIXlU1JVDrxuzjvmkA2bSH4JijOkbsFOMVUmIHH6iOp6V6PVsZoqGEBItPibkZ5IAW
	ZuEOS85JfiKXBzGBoWJZ34E1tklAP5eFu8q++uGSHxWogaUvQSe1JpJsTBhIeMTPIGYMsY0mzKwwu
	ox3/D2lBBG9GMUuU65fZK43YLOx6vfsc/vXenrfkl4LFu4Q3UzUCi/7kF7yb//rbE0Ha74Xe4s/qL
	DgwUU7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hJa-00000007PCp-2jMn;
	Fri, 17 Oct 2025 10:04:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hJX-00000007PCK-2Rn0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:04:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9CE1595;
	Fri, 17 Oct 2025 03:03:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA5FB3F59E;
	Fri, 17 Oct 2025 03:03:55 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:03:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 05/25] perf arm_spe: Decode ASE and FP fields in other
 operation
Message-ID: <20251017100354.GA281971@e132581.arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-5-1150b3c83857@arm.com>
 <897c28a8-599f-44b3-8939-8279d2639f2c@linaro.org>
 <a252e477-2f5c-41ef-8cf9-bcee5e0e7574@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a252e477-2f5c-41ef-8cf9-bcee5e0e7574@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030359_664197_9A5E4A62 
X-CRM114-Status: GOOD (  15.75  )
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

On Thu, Oct 09, 2025 at 10:06:34AM +0100, James Clark wrote:

[...]

> > > --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> > > +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> > > @@ -351,8 +351,12 @@ static int arm_spe_pkt_desc_op_type(const
> > > struct arm_spe_pkt *packet,
> > >                   arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
> > >               if (payload & SPE_OP_PKT_SVE_PRED)
> > >                   arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
> > > -        } else {
> > > +        } else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
> > >               arm_spe_pkt_out_string(&err, &buf, &buf_len, "OTHER");
> > > +            if (payload & SPE_OP_PKT_OTHER_ASE)
> > > +                arm_spe_pkt_out_string(&err, &buf, &buf_len, " ASE");
> > > +            if (payload & SPE_OP_PKT_OTHER_FP)
> > > +                arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
> > >               arm_spe_pkt_out_string(&err, &buf, &buf_len, " %s",
> > >                              payload & SPE_OP_PKT_COND ?
> > >                              "COND-SELECT" : "INSN-OTHER");
> > 
> > A warning for unknown packet type would be useful here now that there is
> > no final else catch-all.
> > 
> 
> Although I see it's consistent with other cases now. Maybe it could be a
> later fix to add unknown packet type warnings for all cases.

Yeah, a new version of the patch set will address the comments in this
series, except that I'd prefer to defer adding a warning for unknown
types.

Thanks a lot for review!

Leo

