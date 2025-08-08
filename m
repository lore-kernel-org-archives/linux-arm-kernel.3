Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A89AC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCkPGBMU9cuxNuxHQvLapYjmFGObKhPk55g8w7OjRxY=; b=WqgtFV8GL3wn/pKUFunvl6ta5m
	A8pokA4qVyCrHvMhW6Y9c0Y3olAeQc4Qp8bECCRHWtGezvRt/F3RUCUj551EeduS33BEhYNmwjMT0
	uVjXIxcEU01r/aO4tkOw9Opr+vJJuxAa+Z+W6kob+BQh6Wlb0N+eBG9fb+XvCQKt4+Q4YsfhLf/n3
	9Dv8oekbvh/vhsfjS29ZWQZSlofiKF5aHme8vVIQM2l/Ihx3XWSh1H7gu5S58EVexgTCz/9SOgkyb
	o7XFKgvmMelTtyGd3NrFkLjvS5XKKpWrCVmroXSEve8H5KrggxqE581E4d7jhixsgjaSdBa2f/L3x
	dCP//Tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLW0-00000002hyk-1iJW;
	Fri, 08 Aug 2025 11:44:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCV-00000002eqz-2hau
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b780bdda21so1512905f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652234; x=1755257034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCkPGBMU9cuxNuxHQvLapYjmFGObKhPk55g8w7OjRxY=;
        b=YHplUXNZo6/Zn4OhO76z1HqgGIDWxJkKChe3rSjAokytonrf/7w4O58uFD0dlDofFO
         pLfIp2gydcHQQWjLetwM9z3dsqX769Hu2S+WIkMBHR2eq6gTEJqNz7ScLqaU9qco/mnU
         JT0w4S4lcl/HvUi/df/Pi5au5tfzU8U7X5q1a8ZytdzDtbUc+1nqhDdkcS9REz3wmj7P
         +fLqKZXZC1rsIiiPof0vdQv4MX83vfeEWpxdKTk8qACsRMa6or4pypBO+WW7qWg81Nu4
         X3fcXTy6CncOlzVbUkuS0lHjYuJ6BRUEFwiojDQBpqhwh7vU/5h3niaCGCmeF6VscEdx
         5aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652234; x=1755257034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCkPGBMU9cuxNuxHQvLapYjmFGObKhPk55g8w7OjRxY=;
        b=lFF84CNf6YfHvsUIl+sDdaZ+KrsAoXchFJbJShRgk76aV3l/FkjuOIgKVY50vBc1bW
         1JNZhfpxy27ioLq936JGyub7yc8SJzwWmrrj75fSZjYh2+J+PtQglFaafwEu255Vi/KI
         h1tyPvUBPw2kAPzKwDbsk8QU6MpyUoT/avzVgJ4cuy/b2gJvGK8VtSmfWujdRnU6+VGB
         zD+hS1ekyeqtw0IGJBbeMBC6/RUGZbJ7kLtDV5U3IqHcg0IZdgPGWD1Ru/tnklYgbdYi
         3KTe4VZyKqAnekpc+/ViS2e1a4rOGEcvv906Ck4d2n0ekf6sAlHxJOdqvxD7VkZlmTk1
         ZYFw==
X-Gm-Message-State: AOJu0YwVqtOtobXX3xKhzSu1/e87LFmhSNoHxyuOBUIJ2SgO/YlJ7gD6
	fgEBUp3lGNV/MFfvDA+nb+9UKDk4YlaHaFsWSFg2AKgstrVx9uk7erWxn0R31RCWU3g=
X-Gm-Gg: ASbGnct2q5kJESWLE4Ru9C0FdpAXEnr8W4Q+uyZEs3UXJmOGog+S9fIqTVt1IIF5tYc
	fY0JUWyw59DsVgdj4DpkKC9HXP0ejBzHA2kXZGhnUCEj9P89CFxnRgRrdjEfChedVc6I73CVFUj
	kQkbDlv5jF5SpEmXe5QbV5P7mPFuQTF5cY/PTNrY0B6vyvuBI0PbdhNC1KSQhgW5VJcjF2+tSWe
	/+3u2i1uJZYvhyp/LXf8YbV61YG3u3JncsMgfO5h9Gqif6Ox8UbS/DjS6vsQXIdKeHxx6ZtHH8N
	33KTxAkVkljjtHwXUIDDor/BP2dZJ3TyS5B0eRMqj5jj7jj2GdDyy/5B9yvao9KNZUY0Ylio7LU
	c7MhchBTWg8g32RxdUOWLt2Kg2SJFsvI=
X-Google-Smtp-Source: AGHT+IHbD1rxZ+hael7UI+V4nWIH1JBGIhGROdLFUhD8+vK/+XpzNrjCzw2lcwqBQ5oIfEeaFLVqCQ==
X-Received: by 2002:a05:6000:288b:b0:3b5:f0aa:b1e5 with SMTP id ffacd0b85a97d-3b900b4dac6mr1921081f8f.19.1754652233967;
        Fri, 08 Aug 2025 04:23:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:04 +0100
Subject: [PATCH v6 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-7-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042355_677283_81D7599B 
X-CRM114-Status: GOOD (  13.38  )
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

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
its VNCR offset so add it along with PMSDSFR_EL1.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/vncr_mapping.h | 2 ++
 arch/arm64/kvm/emulate-nested.c       | 1 +
 arch/arm64/kvm/sys_regs.c             | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index f6ec500ad3fa..c2485a862e69 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -94,6 +94,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 90cb4b7ae0ff..aeaba7813275 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1185,6 +1185,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..d1a55cf589b7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3083,6 +3083,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


