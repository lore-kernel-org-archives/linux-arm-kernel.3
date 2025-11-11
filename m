Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ApNFjpZHiOUYvgtaOudntt1C1VCpeRhzgKLy7o9FKa0=; b=qVirWiUqTL+sbf
	q4GnUYcFtnBG03xS8yXt5i0S9CpQ7n77XI9aKRchF9lpDvcg/vbj+C8OVTyKzBHe94fOb+2g89jIJ
	Mm1WXCSNdSkpMXNg9zZne0Hhkqn0HWHO+imLucJm47i8KWwBHT0XZN56Mden3K8oPztoXeE3C9b3t
	SPCdAuknzFF2R61hVGnr5rQGBq7rG/El1IDd3U+DyiUC5+csdaSWO76D4YSly3tpT5XAAdr0cT3G+
	U8W+3ltL23aoaIYISd5ux66NU+TarA8TXj4II5THhJ5ooxfnV+nvLqZnlZyqOh9rGJ/JfphsrJMI7
	eLg9UfHXq90eVH2a/0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhl-000000075DC-2sgT;
	Tue, 11 Nov 2025 11:38:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhi-000000075BG-3VJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:38:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4777707a7c2so5277085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861109; x=1763465909; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApNFjpZHiOUYvgtaOudntt1C1VCpeRhzgKLy7o9FKa0=;
        b=YIOYmIh6kOSbK2EpE/O8Pvvy37ffR7Er5Zca4X+sNovSHTjwVib17chENTTiPYNzJc
         KYFtcuxbnxEgVfrX0gUatF1TPUogeqQADWDENa8fuqxI+y5+yia8BecLsCkeMytmMgz5
         hdIR8qKa2xGcbbuBGxe4C3hyoLQq7RzK6ZCbQD52KoHRIqZj2zPbaUvderT4feFF+RHc
         yRlVw+bHfNyPFfI2+Q8CEe14H10rWYvbi0Ggo/Ys2+lwEIP2y1Nhmm/zNVpzrJQQGjm7
         qoQpXlcSOrO4I+Ir4FjFutNgmtQwwG/hE/9ziqKDevUaHEu2sQTeAraJRWNb2jtq9XWc
         cgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861109; x=1763465909;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApNFjpZHiOUYvgtaOudntt1C1VCpeRhzgKLy7o9FKa0=;
        b=P7tnynTH1GKHJHzGyaTYCBTPXS7IGW09ODbUzDACtP3u/Xc1vhfOFNRsak9jshEM8I
         V0PVZ3UfvBZcNtVnFq0xE064K04uh8AdYJwxqSOj9o7hSzpl8r/QwfrZQ5v5Vb5TSU47
         FEmF0aqNQqcnAOCgNS7+0eMcpHm9BkZHNkTHoyMR5v1fayAIthXbRKX0JFmIH3cSvkJi
         8v309dP/gBGUwUuqAoMqii6NdxGmG6cV1NXEy6+Kp5Iu+In88YnA72CdnoH0Gkq41gx+
         hPi8078sKQx2rxX8nv0CLOMUVl5PlH/nftL6bTGIVCf5FcijydO/KMCKUYMetBqAUo+h
         DbKA==
X-Gm-Message-State: AOJu0YwBHw3RQASngpdoB0brv4wT3ZMgBY9qgGoAVjWcAEzjie94kKT6
	oFPY5BmBlBwriRGDruSo8Pn0QsW8hSUtyG5xMYEAijHoMYWZKgM5a3jcAaDG0Booe3I=
X-Gm-Gg: ASbGnctaFUJgYo+6kTzn36gmDqdD4Fp2reWuwJLa1HzzTuslxh4Ru2qLWH+734hLsQl
	tlGckwcFm1HdrlymXCai1EUv2rSBouJJtWt1h/XEX1GdUwtNc8p3oZU8hjx+Bu5PyfcEZhFeS5n
	4K++EEIKWliTz48EzwHzlR2xDj+GhyLSSpSxAOuWrBg0XpCI84idbC1EboAaueRqAvasjVEilW/
	OSu4ococjyTcueAdPHj29rHVgZx86ev6BAbD0edIfieLg9YfM3VWvu9YEnvBM4XXKEUYByUeQga
	3HClCYxohpO/kSz3nlcpvNI1DGjeZDHWPBV/zlQMIDqI/CLvJJmTxBmIZKJblOTKkz+4RGQqCjT
	42VAEMLR3Zf6rl1izbjoQtu1URL8/7/zvgX0TP0Cfue6bbNetJJH/Ze37RQU3cOpLTvFhoBdFvi
	i7DyMiuHVpe+9j6LZ8LK8u
X-Google-Smtp-Source: AGHT+IHEHlUutl0pFeJ6Y+KwuVxOVrcZ87z0GEdb/YT/7CGKNgzL11KQ5qkLQpD/1daWqDjU8+9Wsg==
X-Received: by 2002:a05:600c:820e:b0:45d:e775:d8b8 with SMTP id 5b1f17b1804b1-47781418886mr28948915e9.1.1762861109025;
        Tue, 11 Nov 2025 03:38:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v10 0/5] perf: arm_spe: Armv8.8 SPE features
Date: Tue, 11 Nov 2025 11:37:54 +0000
Message-Id: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIgE2kC/43S20rDQBAA0F8peXZldvbuk/8hUiZ7aVe0KUkJS
 um/uxvQtMQUH2dgz9z23Ayxz3Fonjbnpo9jHnJ3KAGHh03j93TYRZZDSTQIqEBwZG/0EQd2jH1
 iKdJpOxzjNqYT09qHJINN0bmmvD72MeXPiX55LfE+D6eu/5oqjbxmf0yxao6cAUPyCEGC8d4+v
 +cD9d1j1+9qjQlQoO8DIUgL0UZpFb8Galcjzp0odOsQFoiAk2uJAmhaQGKGNKh1SBTI8Ba8S86
 CEwtIzpBBvg7JAgEpNJJDsiksIPVPSNXRTOuVEGVFtNyRniELdh3SBdKBknRWGXt7rQkyVxCX6
 5CpEBkpkkmEyi0gO0MO7oxm6/+JaIRNKNUfkPuFONw7v6v/CFEJ3TqfnLyBLpfLNz3FEttJAwA
 A
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_033830_923315_11C8D64D 
X-CRM114-Status: GOOD (  15.52  )
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

Support SPE_FEAT_FDS data source filtering.

---
Changes in v10:
- Pick up Peter's ack
- Slightly clarify commit message regarding the difference between the
  data source filter and the data source
- Link to v9: https://lore.kernel.org/r/20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org

Changes in v9:
- Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
- Drop already applied patches for other features. Only the data source
  filtering patches remain.
- Rebase on latest perf-tools-next
- Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org

Changes in v8:
- Define __spe_vers_imp before it's used
- "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
- Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org

Changes in v7:
- Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
- Pickup trailers
- Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org

Changes in v6:
- Rebase to resolve conflict with BRBE changes in el2_setup.h
- Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org

Changes in v5:
- Forgot to pickup tags from v4
- Forgot to drop test and review tags on v4 patches that were
  significantly modified
- Update commit message for data source filtering to mention inversion
- Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org

Changes in v4:
- Rewrite "const u64 feat_spe_eft_bits" inline
- Invert data source filter so that it's possible to exclude all data
  sources without adding an additional 'enable filter' flag
- Add a macro in el2_setup.h to check for an SPE version
- Probe valid filter bits instead of hardcoding them
- Take in Leo's commit to expose the filter bits as it depends on the
  new filter probing
- Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org

Changes in v3:
- Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
- Add VNCR offsets
- Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org

Changes in v2:
- Fix detection of FEAT_SPE_FDS in el2_setup.h
- Pickup Marc Z's sysreg change instead which matches the json
- Restructure and expand docs changes
- Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org

---
James Clark (5):
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

 drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  13 +++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 10 files changed, 170 insertions(+), 10 deletions(-)
---
base-commit: 081006b7c8e19406dc6674c6b6d086764d415b5c
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


