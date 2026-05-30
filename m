Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A579CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 00:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5GNFJ4Xqacwf/59lf9njOjdAKWktAcI2QuStYFAieU=; b=tArtEfcxLWsyoPvgnXkkfWlcq/
	8cP3dkeR+dYtzew3RJNTVtgyLDbylSId6tEAX2trWIS8JCFcPppBKdWn6UGlUpP6mbSfNwtmyC4/z
	WOw/gThRcBU204crY6bF3j8MMNzYx9a/lyl+8Tn6tyUAOkDkZ7o2DKGDwW4EXFN2abqzjdZ51GwOf
	fdtmM4yIayknI3CagROb9D/+JwXjce2Z47KRDQeQ4P54is7IYhzu5oktAUMyaJ+5FTtJ4LARAnzCg
	AQUZvsTIvbaRJtd4SSx8bF621bI6oiDlkkAaB0pLMI+WbdjOHMswV9ml9NILxJ9BsgcWotApHJ33d
	1trvIqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7SQ-00000008KIV-3dDp;
	Sat, 30 May 2026 00:21:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7SO-00000008KI3-46Ql
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 00:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4167341B3F;
	Sat, 30 May 2026 00:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B751F00893;
	Sat, 30 May 2026 00:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780100500;
	bh=V5GNFJ4Xqacwf/59lf9njOjdAKWktAcI2QuStYFAieU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOxKEwtItJt0405ODMLJj0gHp2T/A+9TdbRq2I9v7UcBiMdDiB6DcjXrBC85JHd93
	 T8KvGwboAr9pMfZEkesCTDSsV0Hp4Meb/N92DoELiib1ZIrMdCj5UG+D/DNEvEa/nk
	 SEPzG2wua4by6SgXl6lyVIobHsrZ8ZUMCWMrAQE24gZQkL3775egqUK3yxj8gzMEo7
	 S39z/+V4fQsE5iG5UYkOJyQjfvuH0kc53PZJojTcNHh0XwqwdTglQ5VC+j5nYoiRGw
	 PIxbM62tXnC6SYJsyCrvvvE/OojdZ4YL3Bg4xNShJHFH1ormV103e7hVcWFRhrBIPb
	 jfyzCX98/KpzQ==
Date: Fri, 29 May 2026 21:21:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH] perf arm-spe: Don't warn about the discard bit if it
 doesn't exist
Message-ID: <ahotkEL09FARMsRB@x1>
References: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org>
 <20260513102024.GE34802@e132581.arm.com>
 <CAP-5=fUoebOVhWvTbgkyY6erZJjbLRbRVk6oauVKjtHGGgMyaQ@mail.gmail.com>
 <bf58d60f-1483-4832-9424-5e85e0e5f943@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf58d60f-1483-4832-9424-5e85e0e5f943@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_172141_037311_75EB1535 
X-CRM114-Status: GOOD (  20.53  )
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

On Fri, May 29, 2026 at 10:42:34AM +0100, James Clark wrote:
> On 13/05/2026 1:55 pm, Ian Rogers wrote:
> > On Wed, May 13, 2026 at 3:20 AM Leo Yan <leo.yan@arm.com> wrote:
> > > On Fri, Apr 10, 2026 at 12:05:12PM +0100, James Clark wrote:
> > > > Opening an SPE event shows a warning that doesn't concern the user:

> > > >    $ perf record -e arm_spe
> > > >    Unknown/empty format name: discard

> > > > Perf only wants to know if the discard bit is set for configuring the
> > > > event, not in response to anything the user has done. Fix it by adding
> > > > another helper that returns if a config bit exists without warning.

> > > > We should probably keep the warning in evsel__get_config_val() to avoid
> > > > having every caller having to do it, and most format bits should never
> > > > be missing.

> > > > Add a test for the new helper. Rename the parent test function to be
> > > > more generic rather than adding a new one as it requires a lot of
> > > > boilerplate.

> > > > Signed-off-by: James Clark <james.clark@linaro.org>

> > > Reviewed-by: Leo Yan <leo.yan@arm.com>

> > Reviewed-by: Ian Rogers <irogers@google.com>

> Ping, thanks

Thanks, applied to perf-tools-next, for v7.2.

- Arnaldo

