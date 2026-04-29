Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6789EFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyPG9usF5OOh3QtrkNnbtOYEKLTSn9TajQEa7wBEJgI=; b=aj2GdUTUcMBnS+2gKvYOce95vs
	IGWKZJBV8YzliD3TD5zZhQOGDlBjG+Kl0lxkmgOqBWPA9+yEVT+6M9S6AEyC8yGjmcJ+gvEferXvD
	nDWwmLMq/yBJqUTCBvTmUY84tnqbsKiKH8QUYC4e/e9rCRbko0FS6BFz4DOCAhfTVgXt3wyYUVJJ+
	oPIZZe7PNBkKm+YRVbgPYRgamwlL8nSUsk6z+fQsla9Rn8i2XcL5B7565F3WDtD9GQS0YbsdtoXM+
	zRRbHXrln0p8bbhEyGKwUJfwnqwlkmobifUnjb1ypyneRGt/Pr93ez85v/5rXzEMYuiHBYPCv7DKN
	l3LvOHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzQd-00000003A9e-2mlE;
	Wed, 29 Apr 2026 07:33:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzQc-00000003A9W-0VYv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3382360018;
	Wed, 29 Apr 2026 07:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9E7C2BCB3;
	Wed, 29 Apr 2026 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448028;
	bh=DGVd3j5pXvdaIQe1A122ZTTMfX3GPs6Kf7pPmGcP48c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faXG1VwiRlzi7Mi6QrSAI3CSuRORiFuqwygRa6+QDUvzP1fER+A9CmSFSkUSzgzME
	 SQk7QH/m660mf++0hIxgRqoaf1DJIIPUZHbnfZ9LRGVal+5EZSCvHlWCYK3thfT+DD
	 8TCgcyJpZ9yN9yzW1hOcIw3P14UH7R4mCFM09IN2nPX6OLGeFJgbS4kcU9vWoAvwz7
	 znFYXiG9XGqfkzlXqxZ7LzjaD0JqzSKCc0GpOgVUkiRjivYnlsoNrgdfEZO3kSR8mx
	 hZ7t7flTiOj8PpXIntukhN8XJn8fIAZgDqT9PyjOg5x9WMa1J+33tKyUlLrSsw1VcB
	 QZebvFyZpktdw==
Date: Wed, 29 Apr 2026 00:33:46 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v8 10/58] perf evsel: Add reference count
Message-ID: <afG0WoBnoxC8VJNx@z2>
References: <20260425224951.174663-1-irogers@google.com>
 <20260428071903.1886173-1-irogers@google.com>
 <20260428071903.1886173-11-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428071903.1886173-11-irogers@google.com>
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

On Tue, Apr 28, 2026 at 12:18:15AM -0700, Ian Rogers wrote:
> As with evlist this a no-op for most of the perf tool. The reference
> count is set to 1 at allocation, the put will see the 1, decrement it
> and perform the delete. The purpose for adding the reference count is
> for the python code. Prior to this change the python code would clone
> evsels, but this has issues if events are opened, etc. leading to
> assertion failures. With a reference count the same evsel can be used
> and the reference count incremented for the python usage.  To not
> change the python evsel API getset functions are added for the evsel
> members, no set function is provided for size as it doesn't make sense
> to alter this.

Can we make the reference counting model simpler by just using evlist's
refcount?  Assuming python code generates no evsel from the shared
evlist, can we just think evsels belong to an evlist and manage their
lifetime together?

Maybe I talked it to you already.. but I forgot the details. :-p

Thanks,
Namhyung

