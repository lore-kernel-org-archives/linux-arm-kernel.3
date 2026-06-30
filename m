Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F49CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaUmh35sxDvqnamEeZFXqUgtr3RL3GsntqnPFMBABso=; b=KBfLU8iF5o8zH4PVsUn3xRFQfX
	2dnFRNXOSWZzj/tbXx02oWWEXaOblAhMHcANq3wAiy4kRqtcTvIipwOMR0xvODAjg7NADFh/3dpl4
	wF8T6vW4Np8VGy0FLUGsxGyMUfmJzBcz3RQjWzEo9qEyqNTxLYrZcJ3zPrGojjnzoHfUWO+zIGCBx
	jLFYVjJSPfAwy5/RRJxOfEzbsDsNTdjmACse6EDKgYWo5z/i5ZMInN33tky0yznFryv3mdrba3oUt
	3u29fB2QgQD+40i0VgY2zTZLA6QCCC/WnaOI4M2bsL8I+y9TQGJIj1TevG3JskrgQSFMGFFX+Zfc0
	+f0XNdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiKh-00000000O1x-0GsW;
	Tue, 30 Jun 2026 23:57:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiKe-00000000O1e-3LxI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FA73414A0;
	Tue, 30 Jun 2026 23:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6335F1F000E9;
	Tue, 30 Jun 2026 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782863856;
	bh=TaUmh35sxDvqnamEeZFXqUgtr3RL3GsntqnPFMBABso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=djzz9z6MaeeZ2zZWqEaUCyi3XnoC9wIGRb23nUT0LAMSA3FQm+D6f97gsGsR2QAkD
	 LN27vCbG7SEVGF8A6vjBihlYrSU1tQAaIoVIpwhtAyPcvXu8riZiHsq6buApzZLLpg
	 y8qzqalREwXjSRq/H73PBssqV06FXQ79ftZXRGPZVjVm7ehTOfTfKhZaVLYD1rs61N
	 MJIK5vLD6hqtdsEnyex9msev7FufS6vShwmViONIuVyVfgtqrhMDhc4ek/LvL/N7SO
	 x2lzclSQOCpYkNgnfu0I7Ys5D3JfeZJF0rzmOUxnKdz7hVNg9hrBCICrX0CPooe2CP
	 TidhJfIXAgpMg==
Date: Tue, 30 Jun 2026 16:57:34 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
Message-ID: <akRX7gwfDh01AD4-@google.com>
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
 <akMPoLNBbAEyNU64@google.com>
 <20260630082310.GE1812158@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630082310.GE1812158@e132581.arm.com>
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

On Tue, Jun 30, 2026 at 09:23:10AM +0100, Leo Yan wrote:
> Hi Namhyung,
> 
> On Mon, Jun 29, 2026 at 05:36:48PM -0700, Namhyung Kim wrote:
> 
> [...]
> 
> > Will you send a new version or want to merge this?  It seems there are
> > some remaining comments from Sashiko.
> 
> I prefer to merge this series.

Hmm.. it's not applying anymore..  Please rebase.

Thanks,
Namhyung


