Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43097D30CC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZx7N+YvGY9qNRmZoiOWyKdXlqTlBXef0uI2sCfZ+I8=; b=dT8C5FlJzgmDrf8JBUZVWt5XTD
	+g3SHwMdIiKMPRU1Ib/95oh7YPmsv2sm9LOxtkwTvjo5bJmYCs154i26Z05PEQQ6Hxm4wNDks4/rS
	e1wdYWWQ6g28ceYPF0lIQThhuKmmlTvb9ZCeSoDDmA7wHdlkD/ffRTUtCczUirpQqmJSx5ve1kMYx
	+Ds5fXDTOGYO88R1ZThhDycaLBoYio5rM3ozNITZ2aTdRdM7GyIa7nd7FPd0EGX1oLUovpupn8JZ2
	U9ZzuFSDRV/BzYvx/+FEaNiZ0hU7x6bmhV3Ym5VWPYfxnv4+gng6PuWfxim5o3EPxDrekXgaJ8BGe
	wPiUVcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflTG-00000007iYR-1sz9;
	Tue, 13 Jan 2026 20:58:34 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflTB-00000007iXm-47Sv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:58:33 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12331482a4dso363c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 12:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768337909; cv=none;
        d=google.com; s=arc-20240605;
        b=jtyFb6xrPb2Mu2O27BNqFbG09xuWCLWfRynyMtarIigxE6edsXzYqOz43+fAtktxeT
         EbkuZeVAJRFyjDI3KDKPFW30SbGXb5D8wLeSSbfNf/Qi40DgF2D8uU8DJWVMb223wK9L
         Q5Lh/DH30EcrwQga8TIvViw244bjmZefsy7CcLgtE+5hJg6lIjbAHvn9JzuzW2xamV9i
         n+Yvq6r1F7RaYqA9LyrbnPuZSG1EM3jj9IsE2C9wEcawh1Ye9RL4B3j8PEukukfygtKM
         orVVyefrTOusPJ7aPTId+Ll+bWTr0XQerjwS0XZG2jdGQ3mPlLN6qQgsa2i3grpArlkH
         Fisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZx7N+YvGY9qNRmZoiOWyKdXlqTlBXef0uI2sCfZ+I8=;
        fh=BThi9xNe55gdwjMUfVJlsGQncqkc6FAtFOLUJEvApFk=;
        b=P74H7siXDK6JV34KFvD1jkw64snd7a/LWAN/tPPuX6wF8NuR83wLin4bTP5yQ+8EYm
         UKvNREEqlOuWnQaQt8kfP5m/jN+8Ku0WsT/QidNAGCyTOS6YrECpGs/pEg9FPfZ0lkf1
         iKNbsZPO0BOMAzTEbzEnJN4IgKeE5YZu+pz/J5YSbiHRQKNF/qUIzmTy7zrE6aIgyXoj
         /F/9mgC2a5nH0efwim9IhI4kNDckGykAhadeshJdZhTbpdJ9dlYR8o7dGHGmOXNbCvOo
         xEiAiI0k7XqSh1UR5ONYi0lqoCHPTTVjcaObQLH0gi+dro56Judrilq4Wud4ZvSP8Pc+
         4oYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768337909; x=1768942709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZx7N+YvGY9qNRmZoiOWyKdXlqTlBXef0uI2sCfZ+I8=;
        b=PhznJUUHqWsngn/mTmAH03HKD2ANe1PfQkAz6QM7YsErWjjwmmQvFAlJoxdd0zjAAq
         gx9XiXj0V5K4usm8svX40T1HAc/gAAa9IxTfqHjcti+OJVLZ7b0/gJUFAnj4BbJ4x0g3
         XOoQ6Y4zdqPeW6O9H5kdZLcLsjvohQpxV5Ib1w3XD+GrwI+y19jluBEPbMweHFCMBO3D
         rVFhKEpf23Yll3qrFr4NJbUM6ozuEA0IZwDnk6knmCwI8itv88X+8G1x8RqiYX24BYr/
         CA6qlEef4ltdLTbptGPG1vmmMtJWcTIoQrgR/pAcbbaFNCpUpZSwzRsDHZUo0FCpid3t
         rGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768337909; x=1768942709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZx7N+YvGY9qNRmZoiOWyKdXlqTlBXef0uI2sCfZ+I8=;
        b=CgJ4d7xFl5neqahpncPNzfJL9cazZwoWQ3kfWtVHjXubFWub0pPxbgdXYkN1dpGYwR
         sZFSIusCwTdm0/JsqMHC2wzO7DzKcdJRZQfkmVnJQV8gkh/N1PSTkiigohxgpdkQLgIY
         3jJxqLqLrZUXG9v/nKoTW6U4d5x8rdXy/r+NgfX2l/0PWAZ+x7Nv0e3xD802NRGzOa9s
         mg6zE/j8MxyzUEXhJii/e0Hz1LiinYcmFApepkGvuUktFvxmoXa/Nh+ruRCkiflPFvhC
         WSdCofAxJOWS6pLyk8zGQ3AS1egYuocKvg8BEgVWKKkaJ0RFnW8UaLc7Zy0adnHceRMa
         D91g==
X-Forwarded-Encrypted: i=1; AJvYcCWaidLzlDSc226CVSmedRzi+wTQG20ci+tHbDVRWWYSx4q4W6TFkyAZv8yLAQ/JSDp155/b8cvh6ssKfpS9DKrz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy22ynRhlSRs/E0nSE1AuLU7otgQbGqD3vCrqLluG3tpoTOf564
	yrvmI0Ozu+vffkO+IzyWFles7rF7fdcKUjpfAcqN/0tvTySc0crCNlWXtqrrzdgWwu1VASucdbs
	5qBTic1skiNvw0kBDN7znG16xVCZqLPjvoG0NlY5t
X-Gm-Gg: AY/fxX4GsZjsTKD0PJVn2541uNxAEyCrHFDKXTrBlcpi1OZs0D3mOUvg3dXklQqZ8sl
	uzpGX9B7x+b1TlDhTXxAjTpP4sRhiqeOkPxAcyrDE5RhphOc8B/t8o5jJ29jlYq22li1izjuEDc
	CfmEMfG0C7J/tO5RSffmzU5rJODUYFjaTQ2ST8UqQMCcCNHWpkurwGoe5Ql0bzrqJhtZdKSzYoC
	yhG1aDlLrHEL3rDJT8VXS6FKy2EcWM9TWgoqthe0sHUcvpVDJzoBFSLc95ZxiIQXDGi6WNEA6J5
	slA6eOmyUns4y2HpnzEkQ5gSKw==
X-Received: by 2002:a05:7023:d09:b0:119:e55a:808a with SMTP id
 a92af1059eb24-1233734a5admr36c88.7.1768337908333; Tue, 13 Jan 2026 12:58:28
 -0800 (PST)
MIME-Version: 1.0
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Jan 2026 12:58:16 -0800
X-Gm-Features: AZwV_QhwVy_DwsVlor3QOvBuG8edCAjDtJwMPf5T1IYYLOeF_2FNriw7fADm0LU
Message-ID: <CAP-5=fXbz-jgh6=WXn3V3UoM827t4UBPe9oK_mRh8K7Q6RRC3w@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] perf cs-etm/arm-spe: Remove hard coded config fields
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_125831_930645_B11F9C9B 
X-CRM114-Status: GOOD (  29.83  )
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

On Mon, Dec 22, 2025 at 7:14=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> The specific config field that an event format attribute is in is
> consistently hard coded, even though the API is supposed to be that the
> driver publishes the config field name. To stop this pattern from being
> copy pasted and causing problems in the future, replace them all with
> calls to a new helper that returns the value that a user set.
>
> This reveals some issues in evsel__set_config_if_unset(). It doesn't
> work with sparse bitfields, which are an unused but documented feature.
> And it also only writes to the attr.config field. To fix it we need to
> start tracking user changes for all config fields and then use existing
> helper functions that support sparse bitfields. Some other refactoring
> was also required and a test was added.
>
> ---
> Changes in v4:
> - Constify some function args (Ian)
> - Move some evsel__* functions to evsel.c and make some pmu.c functions
>   public to support this (Ian)
> - Drop pmu arg where it can be fetched from evsel->pmu (Ian)
> - Link to v3: https://lore.kernel.org/r/20251212-james-perf-config-bits-v=
3-0-aa36a4846776@linaro.org
>
> Changes in v3:
> - Fix uninitialized variable warning on GCC
> - Fix leak of evlist in test
> - Confirm no type punning issues with ubsan (Ian)
> - Link to v2: https://lore.kernel.org/r/20251208-james-perf-config-bits-v=
2-0-4ac0281993b0@linaro.org
>
> Changes in v2:
> - Remove macros in get_config_chgs() and some other refactoring.
> - Support sparse bitfields in evsel__set_config_if_unset().
> - Always track user changes instead of only when
>   'pmu->perf_event_attr_init_default' is set.
> - Add a test.
> - Don't bail out in cs-etm.c if any format fields are missing (Leo).
> - Rename 'guess' to 'synth' (Mike).
> - Link to v1: https://lore.kernel.org/r/20251201-james-perf-config-bits-v=
1-0-22ecbbf8007c@linaro.org
>
> ---
> James Clark (14):
>       perf parse-events: Refactor get_config_terms() to remove macros
>       perf evsel: Refactor evsel__set_config_if_unset() arguments
>       perf evsel: Move evsel__* functions to evsel.c
>       perf evsel: Support sparse fields in evsel__set_config_if_unset()
>       perf parse-events: Track all user changed config bits
>       perf evsel: apply evsel__set_config_if_unset() to all config fields
>       perf evsel: Add a helper to get the value of a config field
>       perf parse-events: Always track user config changes
>       perf tests: Test evsel__set_config_if_unset() and config change tra=
cking
>       perf cs-etm: Make a helper to find the Coresight evsel
>       perf cs-etm: Don't use hard coded config bits when setting up ETMCR
>       perf cs-etm: Don't use hard coded config bits when setting up TRCCO=
NFIGR
>       perf cs-etm: Don't hard code config attribute when configuring the =
event
>       perf arm-spe: Don't hard code config attribute

Reviewed-by: Ian Rogers <irogers@google.com>

Most patches already have my tag, sending this for the remainder.

Thanks,
Ian

>  tools/perf/arch/arm/util/cs-etm.c    | 201 +++++++++++++++-------------
>  tools/perf/arch/arm64/util/arm-spe.c |  17 +--
>  tools/perf/arch/x86/util/intel-pt.c  |   3 +-
>  tools/perf/tests/pmu.c               |  91 +++++++++++++
>  tools/perf/util/evsel.c              | 112 +++++++++++++++-
>  tools/perf/util/evsel.h              |   6 +-
>  tools/perf/util/evsel_config.h       |   7 +-
>  tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------=
------
>  tools/perf/util/pmu.c                |  95 ++++----------
>  tools/perf/util/pmu.h                |  34 ++++-
>  10 files changed, 529 insertions(+), 285 deletions(-)
> ---
> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> change-id: 20251112-james-perf-config-bits-bee7106f0f00
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>

