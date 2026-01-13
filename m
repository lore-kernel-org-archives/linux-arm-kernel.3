Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F9DD30CC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ChA1RBQJxNMNFUmVce4otJLJuwAIQrFN92Gvzx5c6I=; b=E4R/Nr0v4TvA4dlAceHYV2RcT1
	VLqu399ki2CTz/3I54ZL2TfgBkShsA+NtsiNoRFS2q55uZQNd0XejmTCcbAtz+pY8cOq6wRJvqezC
	cHQjxqBTdDH0GUtskFtS4jTAEzwe7EhXIVDtZvw5iyHYUXg68nQ4vnI8CKuhx2o8F+U1UcZ7jvTqo
	GhJBXQadjbBZZGUKECBrhpF8pNg3+M11egfJVwp4HMKoEDXggREAs9V2A8Dq3a0LY4pk8Q9WJY4bN
	4w4VfNBCWcKYTyMgKos2mXimRP2HH2dnXXRvRKR+0rEcZTCAt15l7XViQwYSaRnvkVVtOKxHNTqQG
	d4OfYIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflXv-00000007inU-417U;
	Tue, 13 Jan 2026 21:03:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflXu-00000007inM-47Pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B5236001A;
	Tue, 13 Jan 2026 21:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB84C116C6;
	Tue, 13 Jan 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338202;
	bh=pbDGQIg6rpwBBzRRBDZ0VgDogl1oWvUPmiXHe/3qEcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyMillHbY1IYuIG/Kn7Jfp9wETAoxJvPEznXZVLSnGCtreBpYMsiQ6l02+Fvl34mS
	 gPerOwa/tIoaFW/aL5jU4JxoX2DwFoENwUKPBECqFJhkZV6Ifd6aTj+2w6o056ou4n
	 gCsGPd6zua09Z9sr+8JXc3yOUBg/RB3moAyGH4m1xrIDlvkdjRMQ3LSHgyKk3RH685
	 q7uHlb+Z5oKSuh2SH2DuLYaiRnXIcLE/suJVRCJr+QgVGQlkwu+0QJtnOF6MqdOmvl
	 E5C11hnz1PKMMBiJAGgehUfLxKIlUCWARYgESUrUJJY84wFX/PnAKM6+42HM0M9JN2
	 kLZxiUAhF9uGA==
Date: Tue, 13 Jan 2026 18:03:18 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v4 00/14] perf cs-etm/arm-spe: Remove hard coded config
 fields
Message-ID: <aWazFmD6QUV2OP0W@x1>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <CAP-5=fXbz-jgh6=WXn3V3UoM827t4UBPe9oK_mRh8K7Q6RRC3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fXbz-jgh6=WXn3V3UoM827t4UBPe9oK_mRh8K7Q6RRC3w@mail.gmail.com>
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

On Tue, Jan 13, 2026 at 12:58:16PM -0800, Ian Rogers wrote:
> >       perf arm-spe: Don't hard code config attribute
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Most patches already have my tag, sending this for the remainder.

Thanks, will add to the ones missing it.

- Arnaldo

