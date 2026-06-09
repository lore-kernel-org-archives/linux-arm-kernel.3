Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CFDCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgIXDhL1E/gQo+ziyEHNim/0IDxU/tyO2IBIKTb7Qrs=; b=DcR15d8K4yrtglCLyBeYpKH+0c
	FrstDckxZCpZFIcgtAY40lCNYMvTVIi9FMuVe/y+uhNX+5X3EIyAYEtslClmOOwDnhFVlpe1ZIymX
	fmz+JWjH5Ew69OXTzwr0C2kNHyfTrWnVXhxg4E/MofmKbw6dXoMrfMCXj0NqqrwqMoeCM9fAvs4n9
	wptHo2sR2UTlRVHp+pGqLMTdVXF+a6/G/13KkO+ABOh3JKCje09Tfl2atXqecnrQzBXwz5jHHw9Ro
	oS4m5WSe39c3yWKo2wCPHQfIVsnxAeTQNEhTDDqTKht8ALKX/L0UrwUjx8tP/fnRWw2I6Euwu388M
	S6tOQmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LW-00000006PgQ-3odN;
	Tue, 09 Jun 2026 21:50:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LT-00000006PeN-1y9I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:50:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c0c36f4b76so67379535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041849; x=1781646649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fgIXDhL1E/gQo+ziyEHNim/0IDxU/tyO2IBIKTb7Qrs=;
        b=AHYsgCYRdVr8TFUUVrcrNNlYPTmSyXWfbfFL39+FCzf4VZqcSTBzMc1RPQta4ExEhZ
         NLa1fcJ6etwNmeRuJTsuLGpwLyQhT776tSGEm8LnL4g0tFfFFDqoaQ12jML4eDzKPSJX
         QX1Unsd8DH72MFBXVN3guw+0C5VIpsmxnYhlVHVP5RHKS7i6ZA3ktzX2Vm8xoy8MNLuH
         2QKq0KCgbIPn+iBnMrpCgJjG6pU0NFD3G9Db8x8kTnTpvcDZoP458HyX9g8JDgBtw41f
         pFZO24Jpdt4QLZIlR5hn99GmsCGDC3ezqjPmYOEYA4IhrjxcyWkdl7Ctguvtk0m7913M
         FWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041849; x=1781646649;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgIXDhL1E/gQo+ziyEHNim/0IDxU/tyO2IBIKTb7Qrs=;
        b=fpjEpVoRN+6PmShRU1m3GXKSWs7Grxouf8YxKVR+uefIEX2UFkH5Eu/R330SAt/bRV
         IRfODviSaDT/XifF7jHZtun0eZuwyPZbEJRwxfMnFJlluCMkeenyq2s74GDUV+YndGDa
         hyr+Jqs4H0O3I0+atDDPZV0KGsun+qEzWwncocfgrFgrk94UQUB/vxKkyRSqRgatFwTD
         TD1Coy2k61KWeOfYwKXGJaRcawd+V5aQU/xfIK4+cdShlBB8XC0m8ANBvMDhYhHmDMu9
         7JDQEjMW/8Y0FvVd4WkDANP0Qyj7g+FQQ6wLExc8p5kt4NNGDlkXGwuAABaY4THSfrwV
         6JYw==
X-Forwarded-Encrypted: i=1; AFNElJ+Rh7MQDxrJNoZgZ1ToxpLfAvW+L8lQmXY0Lh9GaopIzU/KzaJGaEzD5a9VWNk0G3HuI/M7gMM1ISJsIkdVmra7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywut1N2d/ANpRJ6CkQdJk+Fr4CySKY9aCs3cIf6z+cYgYlSPlWP
	siTQM07OOwGtkxcXfb7HFOD1ntQWWWAcqUIImovJhaO04yz//1IzgUMxIp+TUG1pGV8L8siP6/n
	LWgz1Qw==
X-Received: from pghr13.prod.google.com ([2002:a63:e50d:0:b0:c86:93b:4970])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3cc2:b0:38d:fad1:cf2a
 with SMTP id adf61e73a8af0-3b4ccd65aebmr24305665637.13.1781041848594; Tue, 09
 Jun 2026 14:50:48 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:39 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-1-ctshao@google.com>
Subject: [PATCH v1 0/6] perf vendor events intel: update
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_145051_516853_A51E752A 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Sync with the latest perfmon events from:
https://github.com/intel/perfmon
by running the script:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
and copying the resulting json and mapfile.csv changes into the perf
tree.

Chun-Tse Shao (6):
  perf vendor events intel: Update arrowlake events from 1.17 to 1.19
  perf vendor events intel: Update emeraldrapids events from 1.23 to
    1.24
  perf vendor events intel: Update graniterapids events from 1.18 to
    1.19
  perf vendor events intel: Update lunarlake events from 1.22 to 1.25
  perf vendor events intel: Update pantherlake events from 1.05 to 1.06
  perf vendor events intel: Update tigerlake events from 1.18 to 1.19

 .../pmu-events/arch/x86/arrowlake/cache.json  |  30 ++-
 .../arch/x86/arrowlake/floating-point.json    |  45 ++++
 .../pmu-events/arch/x86/arrowlake/memory.json |  18 ++
 .../arch/x86/arrowlake/pipeline.json          | 129 +++++++++-
 .../arch/x86/emeraldrapids/cache.json         |   9 +
 .../graniterapids/uncore-interconnect.json    |  10 +
 .../arch/x86/graniterapids/uncore-memory.json |   2 +-
 .../pmu-events/arch/x86/lunarlake/cache.json  |   2 +-
 .../arch/x86/lunarlake/pipeline.json          |  27 ++-
 .../arch/x86/lunarlake/uncore-memory.json     | 208 ++++++++++++++++-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  12 +-
 .../arch/x86/pantherlake/counter.json         |   5 +
 .../arch/x86/pantherlake/pipeline.json        |  29 ++-
 .../x86/pantherlake/uncore-interconnect.json  |  10 +
 .../arch/x86/pantherlake/uncore-memory.json   | 221 +++++++++++++++++-
 15 files changed, 728 insertions(+), 29 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json

-- 
2.54.0.1099.g489fc7bff1-goog


