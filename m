Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F9CF3D331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=956LHPVlfL1rOP3wzpXMeMW0aPaZLWqWprb6Mq5DKY0=; b=t4ymvUTxenBd396lLampyb0/U9
	9bKoEBcsaZftGzcN1hBkMAmDvo6TxaJrQObjFjLevZFkUCiqsQzGvpz0X9CBFc2NXqJHIKwJhwQSi
	yii9I2KYUCKrU2PZ5k4Shmsf66xqBGdUbq7/WF+NwkCzl2o4D3PfvDKyOU/rZ1FeC5T1hDE3HTDOe
	Os7FQUZ7a8FovYkmnYGX31WD5qpjBWoLTaI4N3cBEBnRNz/BtFuZ70voL/IAe7w7Vt8SjWsXO0pGB
	V3kYnFHocGIxeIV3d7MJvLTN4grpptX7xHoMKq3I5vhDO4EnLWNybKWSCXWJwTiyLsx3Qu+I3yBm0
	+8nOMCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZH-00000002CxL-3e04;
	Thu, 05 Mar 2026 16:28:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZC-00000002CuY-04gT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:28:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439c56e822eso2525712f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772728128; x=1773332928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=956LHPVlfL1rOP3wzpXMeMW0aPaZLWqWprb6Mq5DKY0=;
        b=C42K1/I4VX2mKgPUkYMe8IG6zs9g4fCA/ViCk6f/eemw4VpaUAvu68VTa8Xloh4+gJ
         ZtRUg+tLA34b154PEIpT9QKdc1POpr+soxoEOyZaMjDAbzojftwsbHDRq3jsg5CLZiMh
         QbApOCCAZffuznSIl2j/7u/K7P37QJmqpvZyfBx6PuK6i7qwdqZnckB+6Olq+7a+IPB2
         GDEN70RqqXCPFAHVo4Qg+vazZtaNUNHgs6so6uCXndJL0PKwhfykPzQaRPDEhm17ZlBt
         09evFFhfhIOgndK6rwDgByU2iyl/ooU7vR2gSC3eqAZRnsZQvncrs7fAnkPp4Ko5/Wtb
         Jngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728128; x=1773332928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=956LHPVlfL1rOP3wzpXMeMW0aPaZLWqWprb6Mq5DKY0=;
        b=w0u21O4Q4Rx0Qbg7CUWWek0C3glzbLXIIsA1THC157TQJsvg6vCU1S7tiybgAmaH3k
         Nbpg/T1eQ80JhrKyh/G3wTA0aRaO4iTydKO5PwBpJhWEX4caZiHd7uJmkU/bHSzvc44C
         09KciHjc/H3lIRa3DILZLFFg0FM0ouKD+aAZynqa0n6+zv44v0npBhOPAj+o9towmgxJ
         9JPps++Q2Pqn4GO5vNzk7HWBugEUUIh3PQTLfPE6xVI1nr/3lKrd/T8h/SX6dYnDdt71
         DopeuiZ3PNCVDfjSem5lAiilddQQJbZWNZU0Eqtur1JjoOmDa8QRsothOYixAqyuVCFs
         KbBA==
X-Gm-Message-State: AOJu0Yz/cDc+ew3zoO4pzGBCrimJGpfU4owRvoTMMl+1U4ruS1DQ3D2X
	gQxdaFY+tX/K+CBDpSFwJWx3ZssqMkmWgKAS3mtr/Mw6/Gyh7rCn8sx2yB8fntJKJPI=
X-Gm-Gg: ATEYQzyCqM+/R8CkRGG5Uii//zTr6Rk+LLVH81n8HMX6O6MQto7NPw9mblMokuwcWkZ
	Xv4UlWfyIq94X1U56bLBSS900ymtKjAp+tL++pw17fYEIH8IZqC+YHJU3ldc30jsn/egLqEVeFO
	8mDD36rAC+uQG3HZEt1vWdZV8qjegefkSDz5jF1jqzSMDNHryGMo9XYatvP63hB7Hz1pGOTAWqG
	gUI4KhjRDAfNi8GBaz/smV+bI9ZNX/gdcputkzfijaxzdvrV0riI8Q97WmLY6g0ZY1rP0lPDokR
	AnDDxrh8+uGbIJujhuHAv4H6UMaeuhz4E5rw0rpjlpOkOm9itxA7v/+LTlwtl8ExUzCEpGTGzuz
	TI774v6XWw14uoQruM1VRbr5gSUUbJYs3eGe3EGGbmFU44Bokdd52y1Yjeac+MSwzoSJw6rAal9
	SqZg84JFy2awxf9/onAWgAi5UwWAudTdN5
X-Received: by 2002:a05:6000:2881:b0:439:b9bd:51f with SMTP id ffacd0b85a97d-439d721cfc2mr748137f8f.25.1772728128375;
        Thu, 05 Mar 2026 08:28:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f8c0e7sm19596034f8f.29.2026.03.05.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Mar 2026 16:28:18 +0000
Subject: [PATCH v2 2/3] arm64: cpufeature: Make PMUVer and PerfMon unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-james-kvm-pmuver-sign-v2-2-ee80a125af9b@linaro.org>
References: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
In-Reply-To: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_082850_072897_2E9D6C08 
X-CRM114-Status: GOOD (  14.04  )
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

On the host, this change doesn't make a difference because the fields
are defined as FTR_EXACT. However, KVM allows userspace to set these
fields for a guest and overrides the type to be FTR_LOWER_SAFE. And
while KVM used to do an unsigned comparison to validate that the new
value is lower than what the hardware provides, since the linked commit
it uses the generic sanitization framework which does a signed
comparison.

Fix it by defining these fields as unsigned. In theory, without this
fix, userspace could set a higher PMU version than the hardware supports
by providing any value with the top bit set.

Fixes: c118cead07a7 ("KVM: arm64: Use generic sanitisation for ID_(AA64)DFR0_EL1")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a..07abdfd40756 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -565,7 +565,7 @@ static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
 	 * We can instantiate multiple PMU instances with different levels
 	 * of support.
 	 */
-	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_EL1_PMUVer_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_EL1_PMUVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_EL1_DebugVer_SHIFT, 4, 0x6),
 	ARM64_FTR_END,
 };
@@ -709,7 +709,7 @@ static const struct arm64_ftr_bits ftr_id_pfr2[] = {
 
 static const struct arm64_ftr_bits ftr_id_dfr0[] = {
 	/* [31:28] TraceFilt */
-	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_DFR0_EL1_PerfMon_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_DFR0_EL1_PerfMon_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_EL1_MProfDbg_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_EL1_MMapTrc_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_EL1_CopTrc_SHIFT, 4, 0),

-- 
2.34.1


