Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=; b=2AA7tUaKZdz78DJrEd+L76vXMh
	0A00WlE0G5BpFTfuRMiIWxWPFKAb8AHoaJe+m867z8Z6K5emRDMUdB/JT2ds/uVcsA+qcrTlNuyAl
	OkaU9O7E6wLofLl0bY8J9yl8mNqGsqQ1GvLGd5Rq4K5vbpVKLLPSS+mqcgqZkb0gq4zNiPBdpZFDR
	v1KLIvB01V7u1E0UoXUAy+HfLQKZ2Y5n+xnnZuJfYjs0BMCpgAMueX0fI9MdgYLkI5pUp1znJxoIR
	b2RQT0XmNmEHdMXthg7BbTNPyksll/5nrOIHnVNIyPoIButlnvbRXKMiJ7/FG74ghObYOQKn8AmEp
	vUdqFPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0P-00000000gFU-2rSh;
	Thu, 09 Jul 2026 00:52:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0N-00000000gEd-2hKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 709316001A;
	Thu,  9 Jul 2026 00:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F731F00A3F;
	Thu,  9 Jul 2026 00:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558362;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q0myndZscPje3KfSI9FW3gTMmeeeua8ZEmkFyxQH5dHXOfMHQ78zS4c3gNcLLziyD
	 wp/x5c07v1cb272ufNM6fBjS548LhtWWkE13qk6FLhSFi4MobyhBiXFOG1wvQb4OOY
	 X45QlQKNFVmTOSipZTvhw+F9U68CN1fLccDnhA6ATAJAoytPSvu/+i9YcRlguOeqU9
	 1bkCem437dAIZh/2wT5A1goOnUy/QZX6XISakkOpCiau7NRYOmSCkbqMVHNYIdHEzq
	 66b6jFeq1WUbqOqeD/qK2o8MeBQbZyyLEgXuq0TMApITA9QP+w4va6ll1kV6D9WY3M
	 7SW+4tL/t/rTQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:38 +0100
Subject: [PATCH v11 01/29] arm64/sysreg: Define full value
 read/modify/write helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-1-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvC6xbwefiZAWBDcPgTG4B4odeWW/j2VD/ZjU
 K38FlUWyGKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wugAKCRAk1otyXVSH
 0DhCB/wNdcq8QmBDkyhUPTERrDg6IB9son2hyTNpRiukmPoofldD+LcSxOXi/xX60Nt8x1nSE8q
 queFKnqaxsZXPzBdz31F/LYsxRKh3VsZskWQksc7TNzIdcbOzw7e7zU462Mq8dGXSGNh7XcjJsm
 aGEaBhwNbKqwTsGFyjHnkJJE1blkTImnfOI9cLE0VfYGB/bOG0AmtA8yj6D4ISA6EpKnxoIsAi3
 1sjNYGifqZ5VyCQ478G4ElHYOggf4njrTPH+pigEXyvNBU5R6f+aCSaY5Vx7I4UZAH7/GY7YsAD
 wsmdIFFLLakwG8m93RtErEZdAhgXq6T65EFXyarS4SPQFXFU
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


