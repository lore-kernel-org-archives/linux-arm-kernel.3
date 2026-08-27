Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A06C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdozPcujSfvjvY4Ww7bWdauVPJfF5Yd56B6xUkSCZMw=; b=wgN3XtwJyYsjJz9NpPsINPHA5l
	kOt17z0Nr0uEcfRs5Waa77QyP59lf6RCaUsk4rw7Eor09RoO5Cg/c/DSvZ1gtbtZtbXAFnpZWUYHq
	KeAzcb5F6jLMGFGIW4iu6+17J0rP3gPwgTFNBfHMHCjONLzI4s7ymomXYRE1aZPMtPOJB6gU3go3g
	D+fs9GAb3iOXqLMnkPzWxuVcmBQkBPHyoEGrLkH4erstyEvQHzBVPL+5hLdXX6IjFrw0QnbhZ58jt
	YjoyG2C8RX4pwudSFnxcPhN1YwmthB+qt1nUeQK8w62/Uu2dbnirokyYyfkQaSIMmsIGZy65rMmue
	LMkDc65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdbj-00000004Qb5-0j6G;
	Thu, 27 Aug 2026 17:09:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdbf-00000004QaK-2ufF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:09:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91CB71688;
	Thu, 27 Aug 2026 10:09:34 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0218B3F7D8;
	Thu, 27 Aug 2026 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787850578; bh=4kAGRHdSHxPiOWMZBYv/OUtAGNumoXB3lShsZOeAwc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DC3H611yKNX0DjpwTHyf6vov6Eaz9SY/BvqGSCrwuCCoiadU6Yp0sdnhOagkBEtAK
	 F3dmVu4Pg6tl9q6ZXOddebq6i4osd41kTf5gsNCkQ5m7Q2wjZT2Fy63vN2tQDYttv0
	 MAQJhGJBtk95Oa0x/fN7g/rKIGZ+xXDLUnbNEyy8=
Date: Thu, 27 Aug 2026 18:09:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 09/14] perf cs-etm: Queue partial AUX records
Message-ID: <20260827170936.GO8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_100939_862352_4427AC7B 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 21, 2026 at 10:49:07AM +0100, James Clark wrote:
> In snapshot mode AUX records may straddle the boundary of multiple trace
> buffers. Currently we only queue AUX records whose range is contained
> wholly within a single buffer.
> 
> Fix it by queuing any partial AUX range that overlaps any buffer.

This issue has already existed before this series, so need a fix tag?

> Signed-off-by: James Clark <james.clark@linaro.org>

Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

