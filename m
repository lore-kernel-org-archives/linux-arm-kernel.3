Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121F3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=; b=MbaheC67y+9a/S/WF20ZXigb5T
	DKAnnPsVNAhjGDPiZz+TGavja8Mtx4f9sqU4QzBkjOe6FX/41Lho6KK5H0LqFQy/8Lur8zEUXbNPv
	tctlaH3mMZugWLpHhe+YL2eV9asz0VPYvAti9ULDOpHTg91FhFQnrrboU1PSbJqh7yWO9QbCUjc9f
	USJ61DQbtbMpkweRnFzp8gm3wisGSsl2M5hO5sHFm2UiB2j9lzjw2lg1sSeLNwXvn/q3193xqsoEi
	EAKxO0j4Ke+2qgM0wMfGVuZoemscb3E+cuY88AyxNt1G6D3SkcuZ3gT4eFdgJYjBSsBTlxlcZmqqf
	X6hwG0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfP-00000003EqG-3KrM;
	Thu, 09 Jul 2026 18:40:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfP-00000003Epw-1rHC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D89CB40A29;
	Thu,  9 Jul 2026 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B45A1F00A3A;
	Thu,  9 Jul 2026 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622410;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZbchbECU3TgvDU9TfKk07SWKmdAeq0RpQ4u52YETSBtL4NVKmeqgzzVYiwlmp3gkR
	 w7CWPmLyF1YuVVzrKg94orJD1cwQGwg0KaICevffgR2WZL8oCDUrE4zOLwq5hJKZfQ
	 I3Swon6TGYL9TZVro/L/hbj5iDh/Mg/FFczzqtcg2c2EGYNe56HAPd1nedf8lEZX5g
	 d9aNNf4mPQY5NSin65kAMqPBBY4cZER/WqgoCb2Jr7be67l1XjkMzZQ/ssZDMq4Rd+
	 CBZ0PbHkI2yy5xbaAIpJ39qc1MwO/TdWLMm+xsvjVlRc+q/uQNwV8xNT/YlNbZo2yv
	 ruT96phC1mcvA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:22 +0100
Subject: [PATCH v12 01/29] arm64/sysreg: Define full value
 read/modify/write helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-1-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gzzsP4OMBAKH5syutaWFaVFk6QC8CDQSj953+mInO7w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+rq2VgOet80BJWD6Xh/o3WcW28LRlhze8qrE
 b4cZrVNCe6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q6gAKCRAk1otyXVSH
 0F+yB/4mbTCi3gD2Q4fl6xZyQFLCtztRwO4QXcc69jR3p5oUmCZtxnfmfIMo48auy7toplQM1C2
 nrebDOyEN4RGz+nbVuXPUjCTH7uPFygS7UJg8sEYC8+X/UtmvrwIrrMQE+8NUkrxSWXY+4qEeqo
 qDobBHmgPLc0AAz97bCvy5oDrv3tvHiJCRbFHShnb37WwZT5azCcL9hJFFWf/JYzQ13EW2OnWT0
 kHqh2ke8cZvmG/BTRgwa//QcL508JNaftLrCNfhaTRCLQUdOGkZYfSRiYjj27SnR0Frh5VJeNAF
 32iiyGcb6r+YYrtS2qrEKLEscDXE7FlEPTJNTWZJVGXgs7Dp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

We have read/modify write helpers for updating bitfields in sysregs if they
have changed but we do not have them for updating the whole register.
Define sysreg_cond_update() for that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..4b96449e0ffa 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1235,6 +1235,12 @@
 		write_sysreg_s(__scs_new, sysreg);			\
 } while (0)
 
+#define sysreg_cond_update(sysreg, val) \
+	 sysreg_clear_set(sysreg, ~0UL, val)
+
+#define sysreg_cond_update_s(sysreg, val) \
+	 sysreg_clear_set_s(sysreg, ~0UL, val)
+
 #define write_sysreg_hcr(__val) do {					\
 	if (IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23) &&		\
 	   (!system_capabilities_finalized() ||				\

-- 
2.47.3


