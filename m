Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA02A107637F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Udgig4ZoLsgYEXfdhxnO9tijZ1Z50sbtiQsa0q8gYbA=; b=FSJoI5p3koTQ6o
	TBT9rUgt54gEgdPY+XXER9Mb0hbZYjkdzeyV8jjB82EzxgrujvChm4mDno1NtMpkvmJLdaVPoW4Ty
	VUIqsqmdsizfbaNVeVdCTMcvgpzroYjUf2PPW8udXQqIJvRkWRR1M3L5cSOrpqcZODGy1Gd4GM9op
	Sw04K6XD+cXn5clWhEtJFVbg1Sh8/6LLoFPPzGVmctg3JWGJLgPOF1tkz/jK0YG4x8iEAE+yOLdFV
	Apy9ABYyK6yPVfpN2Qf20EBTwRdWeWlL3rq4eUr3H/+4N8qeHQtlIwLsVLv35pJUM+sGoYpEmdRmV
	/YSKYrIGMtvWQZFHlwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWO-0000000FU5h-3dA7;
	Wed, 01 Apr 2026 14:26:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWM-0000000FU5G-3oDd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Udgig4ZoLsgYEXfdhxnO9tijZ1Z50sbtiQsa0q8gYbA=; b=CTyUbSnW65UIo3nPycAePY8lsJ
	UBTmPdwxVfSYZH99earAU3OGUvIZPYgqAWHFe+OPzYF4vGHOw5t+4fXt8G9zktXeJshRSllDPAcLt
	F597K7D09bwXeqIb/oV5yc7oug8oES6gorxC7G14SwYgnqlhTBIMVLYVZ9RTL92fZnAOZ8hd7cGhj
	Cx6sOdoK/ZC5Xd3zezAb7RNGFfV1+GSecn/QQIPHbE0ZO4Nh9x/oHvY3M7eU6OxpaaV7aGjJ57c5p
	kJk+nqLI+esixwlZMBp9DI6zcBWd/9ZYDBZx0P79KR0cKWzq6qgOfCJ8oUyAASsh14MIMJXJThb5M
	WfRR6dlA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWI-00000000beo-22Bh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:26:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso26055885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775053569; x=1775658369; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Udgig4ZoLsgYEXfdhxnO9tijZ1Z50sbtiQsa0q8gYbA=;
        b=cvg2OPWSD4cDkmYym4oZmaj6WzDiN8vvWa7kwNaHs8N1VUxYDETsLiuU/Oj01hxL0W
         QDJQYiJUsA00gYauMN1WXA+WCIzAnKgpEVED1l1bh4l7y5kNBZo99RkqMEY4NIqvexsi
         bpWnUe0QY6SGTwLuU5W3uP6R1fo3W8cohDHiDAhRxLqLfSAVlXWZ8upensDyglbdTHP1
         SXPfLHzyVdJGU1WlGDIViy+1z+EgBD7i5lF051CAzwhFe7jEO737c/ci2karEyKtSbzh
         lF4a4jKGNwOVWskAFrwFqNDAxrrTIFl6irW4FL2PD6IsvVFs3xzVblrN4PJDtcIMCoSe
         kT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053569; x=1775658369;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udgig4ZoLsgYEXfdhxnO9tijZ1Z50sbtiQsa0q8gYbA=;
        b=qia6Vq12stU+5OD+5yX1kKg2k2uqWZ+aJ6hKvbCiJPLN5mzu3z1NQS8Sq2srk6hdWB
         lUu0JW/svaIuX+FmU3itkr/02LlreAt93FP+fvoWTsOV4Tf88oZwwzsV6l0DrOkTMVXW
         6RVrrEeSEo+xXLTvUl/BX/ZfI++zmGKUd+xTshLf0EoLR0lUZzN1O3U/RB+lqLkGpDb2
         6gS1zoYOME8wc4g3bWyNN1RKEnVmmhnfSCGm6TA5SWWZhetIKpUA0Lw7EEKpz0S1Poya
         jr5T4ogX0OSbDCPRXqgtBXs5WAztOeOz0gI2FhWmXY/MGDQDFgHQWbwv+Snhz9TrYdvN
         p6Nw==
X-Gm-Message-State: AOJu0YxkstrZ3AezTyKMaw+4hKNzWSCR7CrpAh21Uxaai6YacPmjgnaI
	Ty1zsXyE2EuWy5nXSye4VlT/LCEAqBwEbO/j2xRqEKj9FhGSvDBiWmueYcrvCnTPzqQ=
X-Gm-Gg: ATEYQzztdsmIVT6rYvVi9KPD9kDFz5vZTGnhhXvTlvdug6In4REjcqn5FFnZicDvfiM
	3XaBbpRKiQLqpL/WprA7UqZDsREW+RbQZQCgQX6QidTst2brf9tR4ZuR3cE/hk0IJOOrQSIu5+W
	0aHqYoP6lPJqaNXYATZQNlN8l2TBPrEqv4YUuXog0HQJoCg1XuyI3AYv6eq1IPhxD29vOKiZ+lJ
	5ZgaXRvUMOGy+7Xi1XyulEMAaTM1WxpU6IQp0wYdLh8+MAz63SFf0+HU8t4wr3vWo3GR6THH6PC
	zBUOvM4wcJufMXwpcsK5UD7UYEc8X8t4cVDu2C5p993bhRIhn2ekf4HP3t538RyINd9rQdPq0RZ
	Ap0GraWQLJmIVZGXzkTv2ep6YkKg7QsDZQT/Za54sRiY+5WJfv9DSpVLgYjGVavIYmjHKFd663d
	2mjcubkhR2w0l+/Y/bNx35R3ZTZdRUKGc+
X-Received: by 2002:a05:600c:6986:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-48883595078mr63909095e9.20.1775053568664;
        Wed, 01 Apr 2026 07:26:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm2305595e9.5.2026.04.01.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] perf arm_spe: Dump IMPDEF events
Date: Wed, 01 Apr 2026 15:25:48 +0100
Message-Id: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwqzWkC/x2MzQqDQAwGX0VybsCfxdK+Sulh2XzRFNRlA0UQ3
 93F4zDMHOQoBqd3c1DB39y2tUL3aCjNcZ3AJpWpb/uxHYaOf3GBs+cqlixQFqRNwPIKQYNKUn1
 SrXOB2n6fP9/zvADz6bhjaQAAAA==
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_152610_618650_2D5F097A 
X-CRM114-Status: GOOD (  10.32  )
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

In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
ability to add names for some known events or print the raw event number
for unknown events.

For example:

  $ perf report -D

  ... ARM SPE data: size 0xd000 bytes
  00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
  00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
  0000000e: 00 00 00 00 00              PAD
  00000013: 49 00                       LD GP-REG
  00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS

On N1 the event line becomes:

  00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH

Or on other cores it becomes:

  00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (4):
      perf arm_spe: Make a function to get the MIDR
      perf arm_spe: Turn event name mappings into an array
      perf arm_spe: Decode Arm N1 IMPDEF events
      perf arm_spe: Print remaining IMPDEF event numbers

 tools/perf/util/arm-spe-decoder/Build              |   2 +
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 147 ++++++++++++++-------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   5 +-
 tools/perf/util/arm-spe.c                          |  49 ++++---
 4 files changed, 135 insertions(+), 68 deletions(-)
---
base-commit: 74e2dbe7be5037a5e5eed6bc1ad562747ac88566
change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7

Best regards,
-- 
James Clark <james.clark@linaro.org>


