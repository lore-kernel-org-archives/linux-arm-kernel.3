Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC73CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8tvNdoKgZb+Yh+wKgqesQHx29EoMvUjDvacbOY8GHhw=; b=ZXPumHYUvXckyp
	zenu82GLCtaj56sqrd0OqOahFYJUdFuLtUhsDbp1UJQW14ey47d21/va5lSpPDzp9+6fUQciG1yEn
	VNtpjGwLjWJMZbUxsoLmGsud9ycmSPRM+Znx8Thv7I3HEtAcgfM/2Lh1GO/FYktBKdD+N87H/lGMn
	YzDUkJ3mYCQVu00piqSDsFTOQP71FA/No/5RZkCHSRAebZAwn1VT9noGN+9wloot84JwHOJeFGs1l
	rlu2mbF/wsZD3Fi6VucTnxmTUmX/kP7zFeZ45UPRdoND/huKHx7y16nVnL3RwQvy4TfWMsbGMGk82
	CMNraI2YjxouVjbrTlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpkV-00000001jjo-431c;
	Tue, 26 May 2026 11:15:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpkT-00000001jiH-2SfA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:15:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so6384974f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779794098; x=1780398898; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tvNdoKgZb+Yh+wKgqesQHx29EoMvUjDvacbOY8GHhw=;
        b=pKTMAEV+DIUAttEbbHWYyHkCfTWRYlZyPXnSlAfdzHibJm6GEcGvyAyLIzBA+y9sU0
         NZuxyJegTlAOMLEjxBXsA4S1iex26T/l+IGqBNVzWw4+Geh8iMMARO9r3xJZtID16Wkw
         O5EK+I4v/F4W2zN39OeW/6IHiIqBmbtROvHqoyiBcin0O6R32fFHIeMQ4caePn1bSBKN
         SoWGYGkYK2MdeZLzJhmp8gvqzvag27WQ1XuwSLA7N39J0gjdjXuD+bRtZsxCwbR3vwFr
         dxdHsBlmMfXWEZMkNAp8eN2ooAH5Gb8WhNq3Ceu/eJavsaGq1Z9cwukBG7Y/TJNzxkXW
         aEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794098; x=1780398898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tvNdoKgZb+Yh+wKgqesQHx29EoMvUjDvacbOY8GHhw=;
        b=WhrnHQYOt3fm3d68wYs004l8KxLM12VNG5Z/OE6EyMR7/3ACMDolbJ4KYKx1ZI+8lX
         rowb76x3L6i3sqIv1sqwCI9Wls7yG6r4Ai95vkJlgQFt8U+GfZBnHB4Reoddin+w6EhP
         zdVPGIGA/xEV3BJEh4SImu4kT414VkcLKsR+lydurya519Kvxez0BXx5du6EPZJWsbnE
         kol/mfoG8drqadG2S1rewqnv9YTs4vC5PoSlrVEPj031LYaot8YMO5WUVQhOTZsAN0j8
         QbiMy6n36fRlGNfAhQkzcaj7mXDequ74Yn3tcGo4qBQ2lFBq0emN3gr6NdnMQXD26viX
         znhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CSPS1Zmeog8ZIbifdLtIyhhuYiNhAYnkAAefCpqMI2nY94VdGX0hMT/KU9rv6YkCo2ANTqSZzJGHQZ9OrAcTk@lists.infradead.org
X-Gm-Message-State: AOJu0YwPpS024H1mZOB2mnuZlNM9I4SxRp7EZHxyMqi7MyjzNNKyHQ5n
	YEA5GmCk+L0/KTsMZ+J+suH+dhJu2c+vPtN2du0fnrAs9yLG4pUFVSFekCOpsB1gChg=
X-Gm-Gg: Acq92OH1JmTUl8keoqgZz5OO0Rjmul6gMYHQokwEwgw+NPH74NPxFsQCmeiiZZnBpwu
	48aBGVLR9fdB2VGctf9WswX+2FNJjp7w+8RlIoou0xPyokfhMErDOnRHSvqEjz+JZkHEojEup14
	dwpNSuIthtXkRudwHpUcoJEL9RwdWgkmDHgFm+qZoDvThaz1zKLScKFFQcmCIbiwxFRTmBSF5L1
	aJjmAp8fIXvazmTKjiRqtlXo0pMnJzgPLkGQifb/pnxSZHckh6ESTmibEoY+2i1ZalKqn58svRT
	YtWu7HxFk/Rzrb8pxgadH9zQnW8fhsqrf0qeOcMBXMx45BLXIpsGmVKRQjViv4P9UaYnSmStvGD
	kPCxvtCxn2vvZv19l8P6a/hg6cGzl90lvJVfZnypS/80qKVgnSt2UQ/Y1VuLsP9BINUxHJV0g61
	PRowXkciAMvb0tCEipkFM2eH3p2x+/mfcf
X-Received: by 2002:a5d:6f18:0:b0:449:acdb:3009 with SMTP id ffacd0b85a97d-45eb38a83bbmr31657204f8f.6.1779794098571;
        Tue, 26 May 2026 04:14:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm35375627f8f.6.2026.05.26.04.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:14:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf cs-etm: Queue context packets for frontend
Date: Tue, 26 May 2026 12:14:35 +0100
Message-Id: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJuAFWoC/x2MzQqDMBAGX0X27IJK49+riIc0frVraZQkFCH47
 l2EucwcJlNEEEQai0wBP4mye5W6LMi9rV/BsqhTUzVtZWrDm/0islN2n3AmTsG6j/iVX3JyZx7
 D0D8tOiykjyNA8/2f5uv6A0zxUuVvAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Amir Ayupov <aaupov@meta.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041501_671257_F2E1A5A4 
X-CRM114-Status: GOOD (  14.40  )
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

Fix thread tracking when decoding Coresight trace and add a new test for
it.

Unfortunately the test has to be added as a separate binary like the
other existing Coresight workloads which needs a bit of makefile
boilerplate. Ideally it would be a builtin Perf test workload, but Perf
has a lot of dependencies and generates a lot of trace when starting up
which makes tracing tests very slow because all that has to be decoded.

Hopefully I can find a generic way to enable Perf events at the
beginning of the workload and then I can migrate everything from
tools/perf/tests/shell/coresight to Perf test workloads, but that will
have to be done as a separate change.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (1):
      perf test cs-etm: Test thread attribution

Leo Yan (1):
      perf cs-etm: Queue context packets for frontend

 tools/perf/tests/shell/coresight/Makefile          |   1 +
 .../shell/coresight/context_switch_loop/.gitignore |   1 +
 .../shell/coresight/context_switch_loop/Makefile   |  29 ++++
 .../context_switch_loop/context_switch_loop.c      |  83 ++++++++++
 .../tests/shell/coresight/context_switch_thread.sh |  48 ++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  18 +-
 tools/perf/util/cs-etm.c                           | 181 +++++++++++++--------
 tools/perf/util/cs-etm.h                           |   5 +-
 8 files changed, 295 insertions(+), 71 deletions(-)
---
base-commit: 09d355618f7ccc27ffc7fc668b2e232872962079
change-id: 20260515-james-cs-context-tracking-fix-754998bae7ed

Best regards,
-- 
James Clark <james.clark@linaro.org>


