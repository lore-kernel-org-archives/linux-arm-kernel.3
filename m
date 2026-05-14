Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A19CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 23:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miij9I2PE8Na3TIkQh0hnw52K4XjSNEPKnF1xyHd/7Y=; b=teJUiFHFKTagGiKvfexGw+Q4RZ
	HMRPqvJWpqk/UZM2C8As5oyrxWc0lCJdRoyUbG3EPUmRQx1+Td3jIzaLO9lHr6QkZWTMpr4pIyI9G
	bimGmD4l0BLZMqZfwjZ50Mt6LF4PClEXS+EGdKt6mwb1+rXcuC9z7Aux8YSWCdxsklKGH7wZIJDdQ
	dyadTlP3XQru7TbiMjGoFMOdm95OIjaMCF1DZMkpBWRBz5NusT0SGSR+6Qt/xrWFmESmgW0DU+6Uo
	cfmFnzUU9PkNBUWnPHcA21uFxDOudfK6fdADl1APvld9pzliJys9e8cVi7t04eWe+kFmu2uhNgAft
	4zNHAeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfoU-00000006r1T-1ljX;
	Thu, 14 May 2026 23:49:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfoT-00000006r1K-2nrl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 23:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E47960008;
	Thu, 14 May 2026 23:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654AEC2BCB3;
	Thu, 14 May 2026 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778802596;
	bh=TmAevODjhHZElM4G8U/haaPgw/WZu5pMLQPDCwmCXJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URFfURfgVGgzEYd8Mj9WJP8dbk1n67SD7BBTY1psdrs8lvi172VGJa8CSNFSxVxhT
	 JF+jTmgX2RsUoYZmn+9ruk3zmTTvThlorID4d4yccop0Tk5/5i8nxhrli4eAWBqmQR
	 3Mx2xSZCGnJKRn+yGvKFF/LgrBuyNrZ5hjpXap9SyIKPwy9umFrCfl+dgL8htfgoM0
	 FBUnKMgH+avDF7NUtdicunn/YPY9OrM9BKF8DVuuOrYaQZt5Fdw2fci2y3fALpjaD+
	 eMz2y0HfUHJZcwulblRKfkVuw9/XVEYiZnM2SzIHGh6CR+fGHki4aj9TBWps7d/Q0C
	 Rmv55SGmSOGdg==
Date: Thu, 14 May 2026 20:49:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: james.clark@linaro.org, namhyung@kernel.org, adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com, dapeng1.mi@linux.intel.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
	mike.leach@arm.com, mingo@redhat.com, peterz@infradead.org,
	shimin.guo@skydio.com, will@kernel.org
Subject: Re: [PATCH v2] perf record: Refactor ARM64 leaf caller setup out of
 arch
Message-ID: <agZfoDoXEVjF7fBK@x1>
References: <20260507170622.611933-1-irogers@google.com>
 <20260512054140.3427725-1-irogers@google.com>
 <CAP-5=fU7Y5b2KERuYJuKBK0nqD6GAo_r_QhxesbVw6T3bqrgQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fU7Y5b2KERuYJuKBK0nqD6GAo_r_QhxesbVw6T3bqrgQQ@mail.gmail.com>
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

On Thu, May 14, 2026 at 10:38:07AM -0700, Ian Rogers wrote:
> On Mon, May 11, 2026 at 10:41 PM Ian Rogers <irogers@google.com> wrote:
> >
> > Code in tools/perf/arch causes portability issues/opaqueness and LTO
> > issues due to the use of weak symbols. Move the adding of LR to the
> > sample_user_regs into arm64-frame-pointer-unwind-support.c conditional
> > on EM_HOST == EM_AARCH64 (false on all non-ARM64 builds). This also
> > better encapsulates the use of the sampled registers by
> > get_leaf_frame_caller_aarch64 and the set up by the new
> > add_leaf_frame_caller_opts_aarch64, exposing opportunities for
> > possibly sampling PC and SP to help the unwinder.
> >
> > Reviewed-by: James Clark <james.clark@linaro.org>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> 
> Ping.

Thanks, applied to perf-tools-next, for v7.2.

- Arnaldo

