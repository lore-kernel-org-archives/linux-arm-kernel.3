Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D4ECD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXCG+iTaGtNO1Wh3XfB8PQaSHVLk6Zzav/5jKHJlnfE=; b=jWNKV5/AEQnhN2Jm1QqAEfjjvF
	ICX0MVZAXIounnBnmeResWpDF87tFEwPpOwERlkruEIXFNW56XqQIXuMjmX/0cAuOL+u/mLOSNQ0Q
	e9qRxYFC0WNqfEFeCXMbjogsfOMNrRIR/ZqbYf+rJEzpEwp7N48pCtt9ZLtQf5FYyfIqBh6ZOXsVE
	6gBaTha+EY22zoWng0Z+1Fa9DP/JEVKw0ZP1SwjwkU/QbOH2mKw+zV6/Q4gFFvFXaH9wJsPFrBvQV
	tk6hUvhTBieFEcdxP3/uUPfDvYXW+WmS29NvFXtLu1hl/WYOKXx0qX8C4u/hbVpAnjEDp2QTw5J9L
	SEgSO64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRtX-0000000DwZj-0XlQ;
	Mon, 11 May 2026 14:46:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRtU-0000000DwZ8-2dC5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:46:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 213F616F2;
	Mon, 11 May 2026 07:45:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D854D3F836;
	Mon, 11 May 2026 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778510759; bh=OolOQTtng61WD+njTLqidYnK7V2SUybJURGMgsTgKP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfqCrJSPNvtleDfqihHobLOSu4wOSVuPuDEl6yScPPxZ1hdyUNIrPtbZRMEMku5YV
	 zLxCFGBDkhu0YGuV2z1fy4/f72Y2ptR9HJV7XP1EKkedXMOsyIU7Gc6gtlcOOMAVek
	 MNM+SFFVtcatUGduaq2RpbhwjeW7wkVZo3Jw0ihU=
Date: Mon, 11 May 2026 15:45:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Richard Cheng <icheng@nvidia.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
Message-ID: <20260511144556.GA34802@e132581.arm.com>
References: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
 <agGd1AB19yz0U2s1@MWDK4CY14F>
 <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074604_724107_E394A2A2 
X-CRM114-Status: GOOD (  17.13  )
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

On Mon, May 11, 2026 at 05:27:10PM +0800, Jie Gan wrote:

[...]

> > > @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
> > >   		 * Non 0 is either success or fail.
> > >   		 */
> > >   		if (trace_id != 0) {
> > > -			path->trace_id = trace_id;
> > > -			return;
> > > +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
> > > +				path->trace_id = trace_id;
> > > +				return 0;
> > > +			}
> > > +
> > > +			return -EINVAL;

I'd advocate a bit early exit style, like:

  /* 0 means the device has no ID assignment, so keep searching */
  if (trace_id == 0)
      continue;

  if (!IS_VALID_CS_TRACE_ID(trace_id))
      return -EINVAL;

  path->trace_id = trace_id;
  return 0;

Early exit can reduce indentation depth, and it handles simple cases
first and then the complex logic. In some cases (maye not this case),
we may benefit a bit from compiler optimization [1].

[1] https://xania.org/202512/18-partial-inlining

[...]

> The return value has been ignored in perf mode. It will introduce noisy by
> adding __must_check. So I think its better without __must_check?

Wouldn't it need to update perf mode as well?

Regarding __must_check, I searched Documentation but didn't find
guidance on when it should be used. I don't want to use this annotation
randomly (some functions use it and some not), this will be hard for
everyone to follow up.

IMO, it's fine not to use __must_check here. I would leave this to
Suzuki and other maintainers if have different opinions.

Thanks,
Leo

