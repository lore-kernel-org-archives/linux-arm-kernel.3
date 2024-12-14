Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71764E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDl/86yemlzCX5AmWhge7CoGQnGj7feSxXoMoerczhc=; b=qprQJ9XzCrhVFQy9rBvBjvk+T2
	yCgyfvC0n+sRYM7WyRc+Y0u1uwjAW1J19RNrV/j6Vt3tpPHA+sSgksXQIkVtNbiya0mSBTNuv2WDW
	r+b3MEkxPSxWo70svOfqaxxpTpUUnuT8JvOVLtcnvnJH7Osl/OZAvRvSflctMFipdRomYP6fKYZyP
	Wisojn8mvAMeUJGzJrS36ujbL2r1LwrSVjjX0XM8Svzy1gXIl2TaleVCi0A6+d+ahLVxD5ZykNCdT
	CblKYAiFB85+RsyMR6qMlC51ExrNWgRv9slTKZUoND9gNSWBfJ98T092GZjkWJbRT7cN9hmLuPR9/
	+BgTmEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGUN-00000005RkB-2vpi;
	Sat, 14 Dec 2024 00:58:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPD-00000005Qn0-3uet
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1582849a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137595; x=1734742395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDl/86yemlzCX5AmWhge7CoGQnGj7feSxXoMoerczhc=;
        b=hxxHDjli3r18FMbIAMEMTNz+tH5tNeOjn/37wvEIuxUZRCs3pPOVV18Qu48gDfkdSQ
         4GmzOOyoEZgFcbQEvnTPROlRkv4TzLqI6A7ERJTEss30G9JqkcYhkTL0ospJCuNKUMKF
         SotOw9AClCS3drgWjpYa2OmAgj6HRd29HlBy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137595; x=1734742395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDl/86yemlzCX5AmWhge7CoGQnGj7feSxXoMoerczhc=;
        b=BTlhDiH/RorZWfTN50eeSMCDD3nDrBrMzJecIDvTWXCcjmo35iY8mszTLlGlMi/dAe
         OFXx622flcOQgdMQ11Apj+DSmmKNuBdbOdr1OnNQH58XFVNVbXUyFR3ilngqLEJHAGSy
         e/thS9lZL2oZDL0Qnqg99NcSVMbqy66FcDSR86QSGgLEfilQn+e+YEmhVv3Ztkx+FtkY
         FBwFKAoRIfNVga/kIv2Yfpp/V0LeEn6izK/0c8WlUidPeFUwKFVbzFLJGgMgRou4rnMa
         CulRZYdf9EL8v0oJRal9Ub3Vgarm9B/K2bDjeSRmpMKNIafOalXRDTk4I54Jl0K0mG5f
         yfGA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Zmy4KK4LFfdVEoP2GgnQDtxTC3CFKa1o2QmWyFxqP/Zr1GteLAglbEMNSlRgmdOcm/ek4Uzf1vpzwDihpYXk@lists.infradead.org
X-Gm-Message-State: AOJu0YxtWb0ayTx/OisHDCzvNJQJhHHFV49SwAJh7cpo5Qf3RfOTBIw5
	KvvfaInxMrJuaD9xl+RsOMoU/8ox78U0uishPIzFfhryASGFpaX4SX3QubTidQ==
X-Gm-Gg: ASbGncv5dejOh3RTnGw1VJNpzii1vNXATZWnc/3XKsk/umKZ9VwzNAYlvgiG2tOF5JD
	vKMBEKUnCVEJa8Cc84Q7KHxfntd8WzKBtaIP9zrzJPBAX8IowLpOn+YworqsymSkbqSXyLm9IKb
	V4YEFALAdnVEQqttLWoQVoqtsS6IR5idftAfrkupxR74TktUMMhjzoWMxE8VFnWXFRh2A2UkyjY
	mdMfBHJCH3Fm4V57bL/MFrfaE6IoHVZfe+T+i1q18GQQj0Y3OQ8lVDTROEEuC+KV4BsNpfmuv8z
X-Google-Smtp-Source: AGHT+IEWnlkjBeBQBC3iIoArI1oOo5CsVi/i/Wbk8mN1sXE73heVuvKgGafObymqxw6xhGs3c8XA1A==
X-Received: by 2002:a17:90b:4b51:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f2900a6737mr6197559a91.28.1734137595490;
        Fri, 13 Dec 2024 16:53:15 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:14 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Fri, 13 Dec 2024 16:52:05 -0800
Message-ID: <20241213165201.v2.4.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165315_968004_292BBB1A 
X-CRM114-Status: GOOD (  14.70  )
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

Qualcomm Kryo 200-series Gold cores appear to have a derivative of an
ARM Cortex A73 in them. Since A73 needs Spectre mitigation via
firmware then the Kyro 200-series Gold cores also should need Spectre
mitigation via firmware.

Unless devices with a Kryo 2XX gold core have a firmware that provides
ARM_SMCCC_ARCH_WORKAROUND_3 (which seems unlikely at the time this
patch is posted), this will make devices with these cores report that
they are vulnerable to Spectre BHB with no mitigation in place. This
patch will also cause them not to do a WARN splat at boot about an
unknown CPU ID and to stop trying to do a "loop" mitigation for these
cores which is (presumably) not reliable for them.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't really have any good way to test this patch but it seems
likely it's needed. If nothing else the claim is that that Qualcomm
Kyro 280 CPU is vulnerable [1] but I don't see any mitigations in the
kernel for it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update (one adding
ARM_SMCCC_ARCH_WORKAROUND_3) to go with it.

[1] https://spectreattack.com/spectre.pdf

Changes in v2:
- Rebased / reworded QCOM_KRYO_2XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 04c3f0567999..3b179a1bf815 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -844,6 +844,7 @@ static unsigned long system_bhb_mitigations;
 static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
 	{},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


