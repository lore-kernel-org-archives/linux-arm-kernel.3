Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8415AC55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=; b=RpZxA5w1PsGzo5Hc09Euh4uA0q
	xQ/jCB0oELewt+ymXp4kpHn/Av8RjKqRo1NSTJ9H14KH5AQun1eG3eTL5tgHB7zF1bmxFyMg+QW63
	7E+AUSAa12IcjC21YkNHBJMMOapVxPBXgDxG3OBDu5dWvEnQTd9kTn6U+hQpeGSVw1UHqjn3/+V6S
	7IfQWCzkLAyPCjlhpETGUW695jAHXu28y8YTAjNa4C1ZoDeTwKH4DgmGv5t9dBPgcNWWDLYmxDEto
	qzgBInWDlKEe09Y8HSvfZOWdwngQ36t2+DrNNnQLnvkuuHhRNs9epxezwBtbdrr8KJZHMwFalpo5p
	xXKbczqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rS-00000000fId-0UVk;
	Mon, 03 Aug 2026 23:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rQ-00000000fG9-2ENa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:14:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 493AD45035;
	Mon,  3 Aug 2026 23:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACE21F00A3A;
	Mon,  3 Aug 2026 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798860;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mFhSsUr8XlwEYsJpwDLjXxdlpfACVEFSE9LM6DchD+9Bf1HfQ8yALbiHbSNXR1Azj
	 Vrds2UbIhR4+2ipPcCKjRxrra0nrz8I2xnDNAfKPUYXsKWwN3vyRQcmvm0oBUM81VE
	 D8DQMlUPYsaqanehp72HkxVGy5Kw5eXrfjEHBS+H3k7bn6ghJot2NdRk3Tr5B0FJtd
	 CnxIXW6UTgnv7ITbazY02q/AKu1bzaWaAIoRqqnKeReZcEESOtjLusNsJEzfYeIZdm
	 jlER8ep0qMU0tN6qCm+9iPzmad/Rm27+7ZYgDtcb4gTZWqY0KJhdUAVmvDqW7AeeYg
	 omZoktc6d4fUA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:56 +0100
Subject: [PATCH v18 11/14] KVM: selftests: arm64: Add GCS to set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-11-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d3SxEv6RjSY+xiyxMK7Zi+tIruIS+RbgPdYjX8k0TSU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCi4NyQnb7b/tt4qcu29pwgrmnYuE5kleL9V
 znPjXt5eEyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgogAKCRAk1otyXVSH
 0BxtB/4/6luayAMUFSCj1h8ayU90trD1gtsnwpc9Jg90GfpoYAJ02Nf7Oi+80Hugc3S5Jc3i42C
 wlPWlsr3pUTBTT7kkWDIEnHcOgnZyZ+Cgxys5aLGFGJNHZCHxUYgRW76VqLyFLFoNgnGohPGNot
 3Vqd8G3ZWFJoRkarpxGARudaHJZMbcQKou6piUDYiywtkei8B3JRdH/RZoL37X1ELGD/xIeEUIK
 Tg857HkXAYHcRqfeuLep7DgVQZEEsA2oAfZHE5sHlHHGhR+/qUz+Ml4MS1umdwpMssghV+LOouN
 MjuBwro40e1IaakiwOPrTec2uQhZeEG+UBSom6/66jjNjFd/
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

Now that GCS is configurable via the ID registers update set_id_regs to
cover ID_AA64PFR1_EL1.GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..34e59fbbbe89 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -154,6 +154,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 
 static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, DF2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, GCS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),

-- 
2.47.3


