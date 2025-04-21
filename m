Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6923FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WIjf7BkD7nF1xQMvzfauJl53Yp33HFYTRxCjMYRCYg=; b=X9JxUIZsrC7zVGHxqzIKoWL8Es
	Ef7qPmmTNP4Zi5S4qZKLz4TAP9/QFo4cZHodupzIVhh6pS9Et9zoQCDMZrIpet5GsIFdXnf3gXFJA
	vLNjnCsiY//OUqDFb0vxqzPKnMmPueUDU2G/FcHyOrEZX58J2yoJAP92iANzZP6WiVTKT2mPDA4YF
	jKl5+RoWJyANTZTQgpxeyCQHzQOrqz9xXtq7qFOd8QdHFIGPriKePVAglVRhK28hIGaCDiydrEB1D
	D3vWE+bzXfrUYGTDRPStPYf4p7kvNMNcYQrz1+/eEaQWRn0kplwCuWcfjte3NCSruYamjFI6kaZBF
	x8EDfS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zJI-00000005I3n-13ei;
	Mon, 21 Apr 2025 22:08:16 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z9l-00000005G9p-25Yf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:58:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30364fc706fso3914044a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745272703; x=1745877503; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7WIjf7BkD7nF1xQMvzfauJl53Yp33HFYTRxCjMYRCYg=;
        b=l5O3Coudq2ehA4cx3OpDshueONDXLvgfOht861QAJJWDZVod9xojl+g7j253j4VzcH
         jtUZaHJW8dKuy865e8kF+FYyGHZWb8ERotaESfpAubR3XpnjxB8Vzs4nnQcnDSSx84HJ
         uidlZudvzAaBuUQcyhhzQWedQxfKysstn7kHv75RdQCeMZ/QQuQlS05gZoSRFGKjVpY9
         2kEuqqJkWcapzGzmOYGh+K7yrqRWfl3O0csMOh9p0ZXzJv6IBnxg7B6iZjMRq9EDSLxg
         Lb4GwtviCYaotXPf0DLLMZIldvZ/PvZ4Lc+xIdbb5ZS8kGDP8Gp4GuBBQPqpC0I8FEed
         lmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272703; x=1745877503;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WIjf7BkD7nF1xQMvzfauJl53Yp33HFYTRxCjMYRCYg=;
        b=a1lXE7IrudnOPy2eLzyuCg51KETPGNptpMWTXKl3cqbXzTGGPYK0s00bWCvIjLYhYH
         rWl0OjE8KmlsqzH0KH3VAxINkvmvYBpjSqVNhIhDgpqc03vVrZGzP+83pqXcMfLhUhSv
         H9J5i/vHGoGCowDC8/WSf6Wu6n7GFmqEQPTvFzOTzN149Bs+3ZrxXgkakMA2MObS4G2c
         I8C5aGxO8JyBBogARa0WRh5qZkbs/TfmkMrzScy3L+6oPLyJKQT8k765rPU8ZjlBJ9Z6
         04F4lxdZM2YnJDlyONqHHGsoEs0qwERH3CB3jc+M7i/gHElt6G/b8kUOGwdaP+0Kfo9l
         hWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDEVwqVqINgYSCbvop/MiDHCXfEj8MpM+uGxGe0gRVDOJyLMfgYjKG2cVhkZD50jZLnj0xmpZTxboDWWroKjPd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1FfWZQ+vcEK2a6B7ra1evoQ21zanZKNv2YF/5BrORshkE110h
	TrNTgX57wQ5YyzJooV0oGLx2w7VeQs+fC9xLX+nvJ6+wLKa6BJnjSJLL4QNCZe2qAKywfkPwuzm
	J
X-Google-Smtp-Source: AGHT+IHuM0mA5XfdIhg4YKjkwITQgbzYeag35JCsv00DyyCQALInFDgRHAl/8y1gCJY+fgx5/v9L6p9bDQg=
X-Received: from pjn12.prod.google.com ([2002:a17:90b:570c:b0:308:6bd2:720])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540e:b0:305:5f55:899
 with SMTP id 98e67ed59e1d1-3087bb48f40mr19194057a91.11.1745272703594; Mon, 21
 Apr 2025 14:58:23 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:58:16 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250421215818.3800081-1-yabinc@google.com>
Subject: [PATCH 0/2] perf,coresight: Reduce fragmentation with non-contiguous
 AUX pages for cs_etm
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_145825_555173_825B9D57 
X-CRM114-Status: GOOD (  11.03  )
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

Hi perf maintainers,
Hi coresight maintainers,

This patch set (2 patches) addresses memory fragmentation caused by
contiguous AUX buffer allocation for the cs_etm PMU on Android.

The cs_etm PMU doesn't need contiguous AUX pages, yet perf always allocates
contiguous AUX pages based on aux_watermark. So repeated use of cs_etm
with large buffers leads to memory fragmentation, negatively impacting
other processes.

This solution introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES to allow
cs_etm to request non-contiguous AUX buffers, avoiding high-order page
allocations and reducing fragmentation.

This aims to reduce memory fragmentation for Android devices when using
cs_etm. Your review is appreciated.

Thanks,
Yabin


Yabin Cui (2):
  perf: Allow non-contiguous AUX buffer pages via PMU capability
  coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to cs_etm PMU

 drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
 include/linux/perf_event.h                       | 1 +
 kernel/events/ring_buffer.c                      | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.49.0.805.g082f7c87e0-goog


