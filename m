Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCAD5E374
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPgDgTzJlPC+y/csl8zb48BISjPd8hzRdgiNPsiDEYc=; b=vrNY+lJqk1QP0qHy08xiJgoEBm
	qx37pHd3E8/sZ0Uz2R+9hhmMsqDvNqN4i9cVemWlspoEEsqHD6sTuanhd4tf5/bepxlmj5FOWXMHG
	XUdU/e7y94+F5+gM8MNBCgfzNnvqLlV4xpEUjzvuZO9unEkBM/9wOLypjapoBPfG7Qq4sZgFPdE02
	1ykYuw7ER2dqsulsGGGpUzuPtPZCBXRTBXAfXg6W6aqbJNtpA8fU8eWVtebpUxKRkWKGfwXAlITf5
	pL6FzUQlNzhKBSabaXe0CmF/otvMhINuzJqkZJD6V5wpN/E3T1NF5ebACw2TD+gpb7Z74g6vJ1a5c
	jB8J8BdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcA4-00000005ok6-2TWX;
	Tue, 16 Dec 2025 21:00:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcA1-00000005ojj-3hjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:00:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f02651fccso44195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765918845; cv=none;
        d=google.com; s=arc-20240605;
        b=hPL48eqT9z4c5FXMI5um5VPdMpM6SIQnzCvQF146VbNG4ddcNAbhIkKE4qumqTNXPz
         6WkYW4y3GmfodaeDoKAZdKu4ZIxC8Yg8dfRPMt8qsHFozapXSnuzzCqv8wNFcE6N8wSA
         Q8Pc2Xa+gYAn+t2ZnyLfoleXij7pBwzbwjWuS1Xpd/hkFdbbDd8VRGSlli4QGmZ8+cah
         felfQTurhuIP8+L17sGdTWbYAiFjCaupnqmlueP4boD57FlN+I1ZLC4HbvH3TI4ZS9WS
         JtzHxN/ubjyK7mmSKfdqNvXBw8aUyS9mg2FV8kUQ4G7l7vXG/RiBoJ/zZMEheFEm9Kil
         f1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPgDgTzJlPC+y/csl8zb48BISjPd8hzRdgiNPsiDEYc=;
        fh=u8o3ke5us6NYUIoqh0t1cfRVCsizXDeP2egM+MWudlY=;
        b=KwCSjEoAIzP7KPQMw8j99fQ5HgCSw7RQak55wahz9Kq2zVMMqz2qveQBbl0CfQxgEK
         SqRhoiZ+J0lRxeifZyMZ0rhx66rVz9iCT8hwAOE7ClVizufhhWB+TmfMZe1h6xQalI94
         Jeqe/dP1jPv7YfAcAuwgy6s8NoQ4M9ywqeNvLGQ9e/4CNZZcj4yM9ZMkKfNGCb4SaMhk
         3/DBkk0D6ECJUTaC28+e5N8Cr1fY8mu9D4GyKFi7y/YPbB64qlm+bjakqj29EXCiq/DH
         ANlvnkqOdY914TftGvn0qnXLHrfNxRS9w2FH+heztYBRpwV71HmUAcFbaCajd7po5j1s
         4j3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765918845; x=1766523645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPgDgTzJlPC+y/csl8zb48BISjPd8hzRdgiNPsiDEYc=;
        b=OzI4Gv9i+8nCSW0JA+FigXHiB7lpxnh4BgS3S9e6b0apGzKRzRyRiTML0cTjCATNBu
         REJkxHrqDGif+lbLAtQV+HHCtRxCHrkm0qvKG9s/RqUxGi07EskKsHeBLOFZkIxceEiF
         ytxJodAXh971AV1PzaAxiJ52+QGD18zRbzrAM9ay03NCfLaGyFv7IujRys23wQFqE0sJ
         0p9H5McYcblx9Y9aEwyEyEfEwhGfx/A7jRBCRMoKr16wrwVlRnpMJbSuC5EvAm+p6S4U
         dZEvE1FF4jID4ED5FC58Vm3jh/xlDZe01V/1FIBn5nF+No0tzifRZhb7wgxgsTxYzcBH
         89fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918845; x=1766523645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPgDgTzJlPC+y/csl8zb48BISjPd8hzRdgiNPsiDEYc=;
        b=mURg8H4h9uctCt9L7gNX9nJ6NZX6OvTXNV9HGeW/lkdI+qUgmHBEEYmb32hVjsgGYr
         02a+iRtFIjV8PlJVSCO5UW4S6J86O10AJcyAiylD8Ou8JfY8m0gGETeskfqNwGR+Mpo+
         g+sUmbU9o9B+1FmGxMJYhRBjLPfN7QInfAZ+9M/IDKtV3gjT8DoDIB0ZD/b+5sa7ft2w
         sIPzG1/Xvq12FX0Rl9wVAIG6hNmtqhEYNs3w+1cMfaFl+lKjXqU9BYjvzzEDYTXuaLI/
         PK6o0rAjPrS3261sfTellwpQ4I44hb/vIcd1tK0zroJeqZZPtMlOs/OhhiMzsiJwVbQL
         bZHA==
X-Forwarded-Encrypted: i=1; AJvYcCX4b9iR3q5gTxJbm/4vtAlgleXOP2B40xM9QsN6CeOvBq0ZPg4vy0XLjTn2CRdyE0kTQtdzhGOOMiTwLLzxLCqo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpj2zf2X/rhl0CI4aWwuKkpFviyPDo43t8RxLUba45NbWzJ6L5
	3DYH/3DoKg+a4ECftcUJqDq9Fg7cR/2qwCKju6YVCnQCucinA4a5rOteaDk7hDBaVclh4ga6N9n
	jTj6rdKeJODuT/GakK1OKK5RJyum/aawDFjMGMyj+
X-Gm-Gg: AY/fxX6f1jptDJVOPAieKmqA9OJ9LztXwVMnJxSqoaLBZKPwC96pkFtiQH3kAR0CU42
	BqKOCck8HU1X8owjUtYVuD50wDfLm0LxDBwroRdgQGOgJckvPcdxEY92x1YdKnYrsG2hs3HSmjZ
	LtIDNywAD7bGD9J6ZKff3nsa++jZAp/hu6SOxd11RJ4fyMPXGvZRsKLBFjSY8nx9UnYLLu0HA0t
	XtKwDNjia2OGssgZ/5XYDNjl8/OEzUbYPkjztoSfNTf8UuHleP8QKucXlV0OhmSjkf9g8yXq3xa
	fVm1Poxl2YjFMt5pLhJzw+iSXQ==
X-Google-Smtp-Source: AGHT+IFeEj1OTrXPDDAW4OHR+SODf9ucb+7BEaQ5zy/HBN2Rk5K6JqhJvXKHum/u4HTb+/5gQFpjNCBexVtov2LLHZk=
X-Received: by 2002:a17:902:cf0f:b0:295:3f35:a315 with SMTP id
 d9443c01a7336-2a2060d67a4mr1545ad.5.1765918844260; Tue, 16 Dec 2025 13:00:44
 -0800 (PST)
MIME-Version: 1.0
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Dec 2025 13:00:32 -0800
X-Gm-Features: AQt7F2qUL9uG3NkQvcPif7vaaI5zxe2jzk3wSZhfi4NFBM5CaA7NejrbSWS7En8
Message-ID: <CAP-5=fXrLck7XACML16hzQO-pHGXA+qAM69kDDC6Za4O5S=SmA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] perf cs-etm/arm-spe: Remove hard coded config fields
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
X-CRM114-CacheID: sfid-20251216_130045_929385_CD02E32D 
X-CRM114-Status: GOOD (  28.32  )
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

On Fri, Dec 12, 2025 at 7:32=E2=80=AFAM James Clark <james.clark@linaro.org=
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
> Signed-off-by: James Clark <james.clark@linaro.org>

Outside of some nits, for the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
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
> James Clark (12):
>       perf parse-events: Refactor get_config_terms() to remove macros
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
>
>  tools/perf/arch/arm/util/cs-etm.c    | 193 +++++++++++++++------------
>  tools/perf/arch/arm64/util/arm-spe.c |  15 ++-
>  tools/perf/tests/pmu.c               |  91 +++++++++++++
>  tools/perf/util/evsel.c              |   6 +-
>  tools/perf/util/evsel.h              |   2 +
>  tools/perf/util/evsel_config.h       |   7 +-
>  tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------=
------
>  tools/perf/util/pmu.c                | 112 ++++++++++++++--
>  8 files changed, 460 insertions(+), 214 deletions(-)
> ---
> base-commit: 2eeb09fe1c5173b659929f92fee4461796ca8c14
> change-id: 20251112-james-perf-config-bits-bee7106f0f00
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>

