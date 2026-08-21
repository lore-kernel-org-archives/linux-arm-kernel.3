Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFDCC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27jPqemDZWiFrcLFyMte224uGDPPz8OSE0ekfP8Ctgg=; b=yfHghZ9MQqEeNd
	ySqr/1wftwIhEGdKAfLrXj6oA1dBCEUahE3SwH+uXWQHsdQKbx8L2qjPOqC0cPaygkzzoEQKbtf+Q
	RPcy0zZYXVbl6h68k5+2pEEhVV8WDYi7MNogHx/u7yNoFfxg1Fxc9kRuNMz1evD6DMst/l/MOQ5Vd
	XcmBt94U93jzOAaHvxzM1+uob4Ep/ct2umhuutcpCJ23P1mfSc84zeFMCYaTaInoz14q3ALPwf8UM
	nWrqbjsV5lktD0HEi2Y9cfa5Qp1xH5sq+kmehKH2+yfWBUKcmshsFKhAVwuOp5X0V2t96MyA+Ay7O
	Fb+aHztrRx5zLcwZwylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLu1-0000000CyE1-2gC2;
	Fri, 21 Aug 2026 09:51:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLta-0000000CxwV-1BQk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:50:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso330826f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305840; x=1787910640; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=27jPqemDZWiFrcLFyMte224uGDPPz8OSE0ekfP8Ctgg=;
        b=n9UBz+Fruw3lax42mJBmS+GbXhru/xKLRvM1FththOkycX44+wQlrjCgV7J8z8NIkN
         aFvGLIpQkMn5usCV1T6l3Jd7x5qmR3qE+BPlpG3eg8hdkjLwQNC5hHI/gfq9i/1ST5yl
         BIr/fTuqARdTS6yslBESQwZ382Jl0qzmVxdy3ht0KDjDIPglbzaLCcJtCgg0N0SbpkUw
         lBzzJ0T5y7ezb/8pC412t4pApY41Ff+jv3loQja7/KMowvYr3jSoCI45AckLH49yXEFG
         j0lKb/ASmJ5xJ/IpI95QIJUQeJzILQejX88C17pZ5sxf4pUNigaXKOo1dSXZkMcWyY5d
         Y8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305840; x=1787910640;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=27jPqemDZWiFrcLFyMte224uGDPPz8OSE0ekfP8Ctgg=;
        b=Xi3VbpIA0hwtojuE6ePfphdGjUekq76VvjvYl70YlIZd4zjejKHzchmOLfaMqPhruW
         tBJt/st8rGTlu2+EjOFLuMwIvbIWV4g9lTHTpklvNXz5YzkE9xHt2HYJOUtHgMd9tX4y
         ameKZiwTi/2J/WYECWVwzkxpd4B4MlHaS5WALpf1Hykp5XZ/yJr7j2TsL/Usc8cN0+Y6
         2QWd+QZj7GZy2s3Qczla8ImgUtymQ1azxx281JjH3PWtmThalMkLjrCZkU+RljnY5bXa
         70NKgnfl6/yvaeTo2QLJ/IDJQeZdNfGSuTELtxfxe3uVOS4Y9MA1iH6D5gdlJeQf2WqO
         3vyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeHqaU0YrRThze2nhrsJv2IQqUJ4xc+k9czuA+wsQJTUTVyALDfpnhxn9IQOueHC0Z6Y1oMGkA5UsRkUNdibDF@lists.infradead.org
X-Gm-Message-State: AFuF++l7CL66Ui/3BIhhizfZZcGRYdUgrZtoHkHvrjqa09hRQ+RT86yT
	brjjEOEQPQiuuzv2jPMszZ1frfpretmIM5+ym8IipVSmXSyDQuGr2q0+MTBnCCp4pzY=
X-Gm-Gg: AR+sD12Ym6gUnmVlv3JyxRyOqvWZNbQK6lVl/9exMY9Pj7JY4Iv5L5BNRJgBGkuPlrt
	gQQfqoPixSiCCoZnbKLCzJVURHXmLdUs1f7tzg+NUmp0yI3sGnTzGUfKhmvfAhSofCkxGqDdFud
	iR5CCvKx301EP9rA+B7Mg+zSAzaAxcSoaGlhv3TP/jXvDLP/Vtgoom8hGm5vIPrZTS+RcWWmRXC
	1OWBlvEKAfLu6ngCRQHqKAjf5ZrO0btTLHTHLrhwPLN11XZGeHGRIdJZ4+5ZaJzboroRQWEgvoM
	+jP2Y3NDLx5GZZuuDrlmGHfzFtXKD69QCjH6GlU/cNP/4on85kttIrkXW1T/+D2dvG6cR76fUz/
	G+VueXMFq3j3g9N0uUTiPJzYXZb22CBXrM52pxZk3KTbPS4G3ETPvQbIyVPxJhkXH+KDOaDH0c6
	6vwulp9AZgTlnAbibDkQH7ITC1XiUetmAGBZwfFJImf37km0iKg+JT43kHEbSH7rFDEsMBhRvZe
	vE=
X-Received: by 2002:a05:6000:1841:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-482c0b634a7mr6645342f8f.8.1787305840664;
        Fri, 21 Aug 2026 02:50:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/6] perf: cs-etm: HW_ID improvements
Date: Fri, 21 Aug 2026 10:50:28 +0100
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUfiGoC/0XNy07DMBCF4VeJvGaksUk8SV4FVWhqj4kRueBLQ
 ar67ph20eV/Fue7qiwpSlZzd1VJLjHHfWuhXzrlFt4+BKJvrQwai4QWPnmVDC7D8vMePey1HLV
 A4PhVk4D2aD32RsJkVfs4koT4e/9/Oz06yXdtTHmMT2Xu7obF4WnULexp5VLEwyEJypKEPbRLG
 FDIvDJTQJkv5h87cxZw+7rGMnc06n5042AmQtOHIMSEE7szOdcHNyEZ0pqsOt1ufyyUl74GAQA
 A
X-Change-ID: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025049_186542_56439C9E 
X-CRM114-Status: GOOD (  10.49  )
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

The driver might not always be able to write HW_IDs, but we don't need
them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
Synthesize missing HW_ID mappings for raw trace").

At the same time, give the driver another chance to send them in commit
("coresight: perf: Retry failed HW_ID writes"). The other commits are
semi-related improvements and fixes.

("perf: cs-etm: Respect --no-itrace option") makes debugging broken
Coresight perf.data files easier.

Applies on top of "[PATCH v2 00/14] perf cs-etm: Per-thread mode fixes
and snapshot wrap support"

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (5):
      perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
      perf cs-etm: Free partially created queues
      perf: cs-etm: Respect --no-itrace option
      perf/core: Return errors from perf_report_aux_output_id()
      coresight: perf: Retry failed HW_ID writes

Leo Yan (1):
      perf cs-etm: Synthesize missing HW_ID mappings for raw trace

 drivers/hwtracing/coresight/coresight-etm-perf.c |  52 +++++----
 include/linux/perf_event.h                       |   2 +-
 kernel/events/core.c                             |   6 +-
 tools/perf/util/auxtrace.c                       |   2 +-
 tools/perf/util/auxtrace.h                       |   1 +
 tools/perf/util/cs-etm.c                         | 143 ++++++++++++++++-------
 6 files changed, 139 insertions(+), 67 deletions(-)
---
base-commit: 78148c85297024ffe7a709acb7cc4fc907271176
change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
prerequisite-change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e:v2
prerequisite-patch-id: 1aa32269a3a7dc76840dd8a24cb5a8715507e898
prerequisite-patch-id: ef471f468351462f67efa58a09a3461306ac5a0a
prerequisite-patch-id: c78946cf4ec1c7722570865403a3562625bdaa33
prerequisite-patch-id: 0b953eee0252db3c7ba3ef1e3397048a94482ca2
prerequisite-patch-id: 27da72c2f01bcc68205bbcc14d5019369c02cb83
prerequisite-patch-id: 365c6d5f71c754e4c690b5ebed3453565bb5b809
prerequisite-patch-id: 64e9419a41082a2db3daf255baf0fb40efbae5dd
prerequisite-patch-id: 1dc2e6ef8e76b369736b4c88560302861b2e4faf
prerequisite-patch-id: b7de38ec4d90f5b45d56390a4e5919a1d6439951
prerequisite-patch-id: 3548d5b161cfb8c11a166ca2b3228ca4821f1ca0
prerequisite-patch-id: 97e66600218a2b32e5b21d0abcb6321590f98de9
prerequisite-patch-id: 292282b20bd8ad7d096ee7ffbc55dcfb75455f53
prerequisite-patch-id: c80259b47850ba65c985c85a29c8cf4948463d59

Best regards,
--  
James Clark <james.clark@linaro.org>


