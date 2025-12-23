Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13009E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HauHtOKv7uT1RkzhN9+pSQLipVMBqhVGl8uGKr0aH58=; b=LhUdPmAeRrcKwZrfMN+nXSxeKP
	orV88ZBDv3Svy78rUNDwtkeHsJwBb1YVWmiKUq7JZ4zMSDoyoLM5YrFM2osHM9uzZ/2/mn+8kmIM6
	Q766ixGRWEVmzSvvUL/Xj+xg0SAeV9ODsCpOQyUlEGl/+TW1Qm24f2yVbkOyVrI92Bx+s+zfzzFsn
	BjlcghHotjlyJM6TRaVTzpqm6rf8NFMj3IX8fLO1hWwcwIXcljpmaOBdRzGcUlv3LakSqhUfG1cZv
	FW/YM1sHiVj14xfj+MeV04JGJGRPLzX5cPsoriRpDRe+iZrQ4ibDWjofUcydUNNyAkfOQ5Xj4WeJu
	3dWCXOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr5p-0000000ELDr-38Kx;
	Tue, 23 Dec 2025 01:21:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr5o-0000000ELDC-1BzD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5788F4346B;
	Tue, 23 Dec 2025 01:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E5CC4CEF1;
	Tue, 23 Dec 2025 01:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452899;
	bh=tQ8nCbdUJTwo8MNk2MKXqTeJ5K+/vBwe4kIZ5maLhR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o+wMq0lM9/+TnKbl+gbnSg9x8/g3lu3ihq0SGAdQYaF+0bUoyrsOkzpJBpTTg2YB7
	 6tPMhxBwbyRvG5JB+g7fOiRNAIrtiYZUbAsainxIGTCa00nZ/XySqArv4JQ/wF2nkR
	 tcfB/h8cRLNQ4teEl37H49eVcOD8wMJHG3EQRz9U9Y2EO43AtQ1HYdPAalb8mTx7ow
	 aqihYKHy0ceFpTD0YvztYTipXXW3F0lUR7L5ovqEqfLVKmqXxoCDdh3KTEUicDUE0f
	 DT9K2M3Wv68vVMR2t896QcnovfV+/nW5bGcSXGLLI9A/w3M0aReThDigP5BpMeCnPj
	 NyC05wevFK1kQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:20:55 +0000
Subject: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tQ8nCbdUJTwo8MNk2MKXqTeJ5K+/vBwe4kIZ5maLhR4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6DNOnywKTsW/riZW5QxkSLSd9jk8d/Qf6pY
 wo50Sp4oeSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnugwAKCRAk1otyXVSH
 0GA8B/9/H1nErknV81fzXgbWjeIGEgxDVkGySJGQzFxbf2QyQQAxiZK4/ij0KRuOJ8umNWiahUE
 iCFHNIebt6kPq9vpkt9LXE81goKCCbaUz+ZbUuYFVIukNpu6XQb9MHZ2KfhNdS1yDYAfm7HaM1S
 vA3DdQxXbL6034/x5lXG3nNe1+iilzoh9EsL7uXziStnrXVKUeBERhloAbF+t4XozWyy8KwIXgr
 c2X1v6nWIIxNqqnOT7K8/K0NXLpFM1B9OkEvuoxlltV3uh1gBA2bQ/8Ci6LI1dCEPfy2VIW3oTv
 vtLtah/EkNAeQ1vYB6oGQ2t8YRkukVeuLxzRJHC0z4+N9cpu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172140_365272_EE3AFC52 
X-CRM114-Status: UNSURE (   8.74  )
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

Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
information in DD0601 2025-06. This includes somewhat more generic ways of
describing the sharing of SMCUs, more information on supported priorities
and provides additional resolution for describing affinity groups.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8921b51866d6..6bf143bfe57c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3660,11 +3660,15 @@ Field	3:0	BS
 EndSysreg
 
 Sysreg	SMIDR_EL1	3	1	0	0	6
-Res0	63:32
+Res0	63:60
+Field	59:56	NSMC
+Field	55:52	HIP
+Field	51:32	AFFINITY2
 Field	31:24	IMPLEMENTER
 Field	23:16	REVISION
 Field	15	SMPS
-Res0	14:12
+Field	14:13	SH
+Res0	12
 Field	11:0	AFFINITY
 EndSysreg
 

-- 
2.47.3


