Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3505EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr/eVzoQ45Dz9ymRgXeR+QCkRn1x7wE6DVCL1MblI/0=; b=Co1K/4hem1IFbgh1pJKMff7gzM
	2jNLu84ucoDlcDQCn/Va+enuuxXhl91zl0qxIJZy+2Gsq4nOtJq6Nu3n4D7OmTJtt4GNKggt+Dttr
	t0MVq3b9fuZM/peIfg7OE7aVA/ED6/mJXAOP/u0WxLWhjf7YcM+RiHMfEBWieMjgSLWNv0DgRzCwt
	LB6rZL8l8MeSVugA6/h5SrOUw9UdGWutoVWRc0qYaLEMWQQhPXL9/AjHSk3wzXasfib5dF1sYMTWU
	FUaCH6AyYMe3eVCpLRmxxQHqPtF3I9BS2abnXiIau5rFvTXjwmCUWH2mEmNz6sRscqAkz7URuIKhh
	KvqIpxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJMB-0000000CKpA-2Bud;
	Tue, 06 May 2025 14:33:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGh2-0000000BmML-3HcZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4115477f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531755; x=1747136555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr/eVzoQ45Dz9ymRgXeR+QCkRn1x7wE6DVCL1MblI/0=;
        b=ZUj+Pv9lULfBtcgCagaumhrEFQsvQCMAhaEllf56NesmuPu/lQUSVUT/zFrFB56wiH
         M2U3Ks6McNVxMEXHLdWYlKrQjISxB5HFdlwF+bbe72V9FTBdNFCMO3+42c2FbhNWCk1v
         eKFAk+7u3nkIfdO9dWxGYEmgoA9RMd+spRAtLWaob546eLDP300IQsOfYzn3BLbpCAiQ
         kfqk+KJhw2JYKYegrvQ8T4G0ww4ukvzLdJ9BPLGSWOXMRcBcMhPxxeqRA0fZ6SZFk5Gu
         M9gXjh+gtW/mHx5p2XBVI2izcPWeVzQPv6xdcHdWCJgdB3t6ZiWUrXP/vGcEbpqs6XFR
         aLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531755; x=1747136555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr/eVzoQ45Dz9ymRgXeR+QCkRn1x7wE6DVCL1MblI/0=;
        b=WKzvQvEURUQ86VwE8OSSzWix6BTLFVgyFp4+Q+Nn6oykWwl7DXwa4hO/THeGqht3Ao
         e5ZwfyiY64xbQf1XoDFG16NklcxqginOAXTg7w717tnO95cBHXjvm4y62ZPhjNeY/Gj6
         0c3waKRKYRZ0gBfbPuGn/+coP89e2IC0r31/Z1F/KsoNOVidgm/JmkRqR0hHJKrjaLRw
         uT/bAgAkSkYy4ZWEQn0coQXLf6Wr5wRDs+GJ+VEBkRn+O8PVGlzbyjoI/Qg1FrQgCIrZ
         tZefVkDYMLBbB6Lt5bSBljs2qzFDWOiIlsM+FNenBlLY6IO/LOKxInrqN0UaaGTsaSse
         8VtQ==
X-Gm-Message-State: AOJu0Yy7/rmglKT2wqugMe2cl8X94XOBn40A3UWu524GQGVBvk+CDp7o
	FgLro84Jc0O7LmAtVdZJxm38knIL2KelUSS8+vby1I2FZSyzN4EqCxSRe4gD22s=
X-Gm-Gg: ASbGnctDmLj+Ka2H6cXnQmi55cwFyVLSyTRW/mz/8KvWrpE2xmngawuKHdIuFgQM1vg
	oG7t+CoR/6JU3ap07UcQ+w0Rt4jH9LUVgx6zWR/uN959aE0fia7pqM/5fVxKy/QNGpNcUOcBn7h
	rf9LCj/15gKtVoVfcpOSqLm4TtRDkN/ghyTvS4CTgr5P/9xrVZJz7Q6/skUz/4cEDCD1oGlhw4K
	n60q6E+twDnRcnvpmu3zaNSnEz9xagGNuMeznl4AbW2McHbGWAT1aw98auMBZFxQLP2vs/32BOx
	fvaXdEtBJ3qC6E+utavAJlrw+sfGpUMzohY+AmBSo5BVoYk=
X-Google-Smtp-Source: AGHT+IEH2+KTPzukEfAEMWWhxbAHT6NzJ/G9YGCnXDbFPk9R2A+Wr+4SDydWQzAME6RiQhm5jVhrhw==
X-Received: by 2002:a05:6000:1787:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-3a0ac0cb3afmr1864277f8f.12.1746531755089;
        Tue, 06 May 2025 04:42:35 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:34 +0100
Subject: [PATCH 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-2-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044236_813801_F07D9B9E 
X-CRM114-Status: GOOD (  15.12  )
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

FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
remove them from the previous version's RES0 bits using
PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
E.g:

  E[30], bit [30]
  When FEAT_SPEv1p4 is _not_ implemented ...

FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
switch.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 drivers/perf/arm_spe_pmu.c      | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2639d3633073..e24042e914a4 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -354,6 +354,13 @@
 	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
 #define PMSEVFR_EL1_RES0_V1P2	\
 	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
+#define PMSEVFR_EL1_RES0_V1P4_EXCL \
+	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
+#define PMSEVFR_EL1_RES0_V1P4_INCL \
+	(GENMASK_ULL(31, 26))
+#define PMSEVFR_EL1_RES0_V1P4	\
+	(PMSEVFR_EL1_RES0_V1P4_INCL | \
+	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
 
 /* Buffer error reporting */
 #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..d9f6d229dce8 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
 	case ID_AA64DFR0_EL1_PMSVer_V1P1:
 		return PMSEVFR_EL1_RES0_V1P1;
 	case ID_AA64DFR0_EL1_PMSVer_V1P2:
+	case ID_AA64DFR0_EL1_PMSVer_V1P3:
+		return PMSEVFR_EL1_RES0_V1P2;
+	case ID_AA64DFR0_EL1_PMSVer_V1P4:
 	/* Return the highest version we support in default */
 	default:
-		return PMSEVFR_EL1_RES0_V1P2;
+		return PMSEVFR_EL1_RES0_V1P4;
 	}
 }
 

-- 
2.34.1


