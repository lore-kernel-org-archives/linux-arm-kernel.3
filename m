Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44DBC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 05:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+En/bNUfvq5UDKWEKTIJOS62zs7KhEQjTs+bfpIaMw=; b=yzvbbjvJr1TyPu64nRopKEnmdN
	wVKj0qbu92oz4zOn80XTw7gSmf73wb4DwFBdKQzt/+1MT2aaLNkqCp0EEJz1fO+J/ATZghuL5yYna
	KtWPYrugPGaHiE0vbY/luaNxZoPcoUTmGcQewILWLK+/jLPA/aB4GyiYGInRMeYFKy7JQGJbOSDpr
	1CrIGpbbTk+KDmMahuVaZ8xOHvdTwQInHhaIICffmfuVVR5ojP712HKLUWmHSw/w1aR3f9wssqxqf
	06Tt1TYn3xm1hsCeCtygNszujeOmwYYJGM7u5D8M4WPiFsWc8TIb1SS9P4ZLZtBrAzpskcbho0DoA
	Py3b14pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8kh-0000000FXCm-0DBD;
	Fri, 24 Jul 2026 05:47:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8kf-0000000FXCc-0eVu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 05:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7837A4008B;
	Fri, 24 Jul 2026 05:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEB81F000E9;
	Fri, 24 Jul 2026 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872036;
	bh=F+En/bNUfvq5UDKWEKTIJOS62zs7KhEQjTs+bfpIaMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LGeLqg6MBufxU8gjR/M2nLX1JSxS3eEQ1DKi6rnIr6bXLf1sGK5+FdFMZXh0y53xG
	 9wd0/kiwYdMAIc6hsLxbqmBZti0fMDm3Q2pVlncowuYG5lH25wrcSvhQsMuioiqCFi
	 e8bRrxqdnQPmmzSV2XPvXRr7l32LyYsWKSqgX7NnCeCiu3TwNMBlMKIUlCp+pRuG+b
	 vT7oqtJr5kN9kqdgA22Dq6lakHV/qEL/ToVw4v83vIhLwvV//QpeXN76FvTx186IwO
	 QVTZOPpxopuchY7OxgZ2lHqFTnnSt7ZapS1RdN5ZE5rR/7uSai5Js/9JvqNYg0e6VR
	 3uf/i5D+4d3LA==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Suyash Mahar <smahar@meta.com>
In-Reply-To: <20260720-perf_cs_etm_fix_big_size-v1-1-97ded24636b1@arm.com>
References: <20260720-perf_cs_etm_fix_big_size-v1-1-97ded24636b1@arm.com>
Subject: Re: [PATCH] perf cs-etm: Avoid truncating AUX buffer sizes to int
Message-Id: <178487203590.824432.12306420213217895178.b4-ty@kernel.org>
Date: Thu, 23 Jul 2026 22:47:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Mon, 20 Jul 2026 11:01:21 +0100, Leo Yan wrote:
> cs_etm__get_trace() returns an int, but it used to return etmq->buf_len
> on success. That value comes from auxtrace_buffer::size, which is a
> size_t. For a large AUX trace block, returning the byte count through an
> int can overflow and make a valid buffer look like a negative error.
> 
> The callers do not need the actual byte count from cs_etm__get_trace().
> The buffer length is already stored in the etmq->buf_len. The callers
> only need to distinguish three states:
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



