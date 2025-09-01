Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F19CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roHZTPEwCGJoEFzevhfwMCKmJqGfJWiT+6yPYuF1kKY=; b=HYTqiioMHAhoZzkCG9e5cPa2LS
	kY5PbEqXpnqYPzXs2h5ljxJevFNUxiST5+7BtOWYotgEGZIqi2uV8cgC39rI8j9ubBfCxGukq0plw
	ZUVuR3pUu/LtJMLlRIF1yOH87C3PjQQHaXHD73mf0blL31INhf+VPrP0d+uiW5TLTHxpaBOeclC5E
	WRF1irXCVuinQO6xamvQZttdOaROX0oja/fSlLiTWIAQZ1aqkA8Aqlgzeq7puE76aYaDtYqaLcA8e
	sDWjBa8DpuESmhX1ohFR4bUGD3I5P9nMsk9wpVWZ0hyLafXGg1F0I0ESEPZLryNfwWV/DfOu62HXd
	r2ouST1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VR-0000000DGyo-18Ac;
	Mon, 01 Sep 2025 16:35:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rD-0000000CYzo-3h0I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:42:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b873a2092so15261475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730518; x=1757335318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roHZTPEwCGJoEFzevhfwMCKmJqGfJWiT+6yPYuF1kKY=;
        b=zpFHAcqFZyfOBgDW8uTH5mZCo5JMEFK88RQomWn5iQVNx5BGT/vXnIuAC2KFBI0bRS
         ckKNTvPRQsjjTQ4J2h3a+LGV01omsf6b752I59QAmDqDqoqUJUD+HfJX2W8koA6ngIJb
         d+SpBD53FU0PTz+b6DJyF6wn7AMAI57IBkjnitv1w2BhXX15x3zY+UnnZpOkf8tt8GgF
         vclpb6V++TH8puwDj9vbDZyptPP9Mj8AQp+iw4/tfMuPLQvakmTiIZnaw5J7cpyEwokl
         U/BHchrj/4Qzn0YkXONvA3eaEDivvFUTOdwhbUnXEqQwvrSlOZ2b4404pobeMjitJ3nx
         4N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730518; x=1757335318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roHZTPEwCGJoEFzevhfwMCKmJqGfJWiT+6yPYuF1kKY=;
        b=rXxooz/KaWKCNRXl+E9p6w0Ge3pyUVzPVfGeY7kVXLvCgr840cMaSObwAXpKUQ5ZrR
         +Sn9LEdbmDfafu5YBKQoY2PyipWWoLQhGKxvpIkXfzQtoM1kcoTy0iWXQDfIHtmM0gcx
         QYRj4EGee/3v4bmzN5Yd27OjQ895F3COpeUNry+OivxX1NSF6mphhslDGy3u3r4WJSMC
         NAAS8hsWwwgClJhMq1U9dxgISQxnRqXB/IiudYh+hMkcD/T56YD9lTPhPicunbvbCX1j
         0O7Wmsx2CAPiDjEFR6Py7fgoUXu4pzdk1QtRRq7GltuL87JBNoOuJZnzc0kEAc5KLW8h
         6NUQ==
X-Gm-Message-State: AOJu0YxQ8chzwyNwLfI/etQtvw74yntQZpyYefiVaJC6bigz+8okMrcP
	vcHUswgDiVyUb1ki7jlmrvIGU1/UyM8n+V3/kU0TR74kmqKxwRuitXzUSbJTM15zxhs=
X-Gm-Gg: ASbGncvdlvSRDYgaoFrgklHSxsF3yWQ0yuWO5knvZn/GqwrQFq7oSm9eY9QRVlRpxCg
	zBqKsJgkaw69+LjJgRVLO3gNsJwJ8LMXeIG+U8Ulj/kOBsFA4kDVWhd3+z1BciGj3nVWfgrqaEe
	Y0zRnHxyvTLGAYbcPwzRGhuU9MAoXDEznZI8tCni6lqS2y3mGy9AjUGt7T6jUeQ5di7g+KeqdIe
	1DDEoHlDmqC6ZoXFC7aStvrxeG5k8N/E5MhSFw4XSi86GTmGEzrZy7txTWn+wiqyX+CUmFxlFBM
	EifopQyPROx/D2mV/K+hxuAJdJ4YDYz8kfaDCby8ATGAfOE/VVm7OEeivLs0Aa65WtGRiX/NQCb
	V8d391vf9KSCo+O3nj85Bp9oD74nm/06UbgzaPM6a1A==
X-Google-Smtp-Source: AGHT+IEYsYRoLgxLqyTVy0NzxTp86n2JBRtVW7sZ408sdKUcLSuGVXIbslWs4Mhg9uhS8qt4f2Cbrg==
X-Received: by 2002:a05:600c:19ca:b0:45b:8aad:d604 with SMTP id 5b1f17b1804b1-45b8aadd867mr37637205e9.33.1756730518458;
        Mon, 01 Sep 2025 05:41:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:36 +0100
Subject: [PATCH v8 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-7-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054159_928967_D13A0826 
X-CRM114-Status: GOOD (  14.05  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
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
index af69c897c2c3..834f13fb1fb7 100644
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
index b29f72478a50..4732ee1ad7fd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3238,6 +3238,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


