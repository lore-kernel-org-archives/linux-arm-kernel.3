Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD68AC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oZVEBPf2w5/CRhv4DYutALrieLYqNjbWCnkthm/PQlE=; b=Y338YFsV98Y6ge
	UaLKupPdhmvSygsPaO95qH7m/G8RFqCTXD+hZJuoLHeoLJxPjOPQ69/Ohgijb6tfdQiUI7UtbUvg0
	r6gGTRtEcvIBanyg/8xJjd0giEYiVxtnWGXSJxjVR4wat4qraXaQ0nTJtzk4k1KoksUlhIAym2ti8
	spM6rQgkVUXrDgJ8cpIkEV2MCPIoeOBR3u+YDYQ2NU8j/Wvl1njimf0ugeKcEzqI9tMDmEgh/bIXD
	PaOI2x3xsbKLqY0STa/Sjm+f+tSAtzI0qca1iujFLsoieFPVV/Lpf6oQ7qpkF4arUTSSDJ1oJIV8y
	d7wJWs6RO38DEAcxzWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctSg-0000000DXVO-2mDM;
	Fri, 18 Jul 2025 22:21:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctNy-0000000DX4q-0v9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1C795C6740;
	Fri, 18 Jul 2025 22:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43A8C4CEF1;
	Fri, 18 Jul 2025 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752877017;
	bh=r0RFJLu3chixovmZTNacoWht9HF6iXxmx1ISjsYOiz0=;
	h=From:Subject:Date:To:Cc:From;
	b=dLu/ihKpKjUgyEXIOpeR0kCdH/cDC5wJMJ001PuWCEroEitYpMe1vBlha9QO3Clrv
	 xofa7OkpgiBjZEzm1EfX17MzviULfQhLdBJPYdKeXI+ExOpqW8jVpWdW10kA+orTgO
	 KCisHHtkQP68zy7t+8g2PUou7YW6mbi+TaGlHyZJA/qwhyeyzrEb1I2k5/SvEjzyQz
	 5lRN/T4WF6sI4afOP7EQw6u/fi5Wv8ah2afOeJd5D04gynbvPjJiobqmXmG6BGwdjw
	 s5ZjEUACfHsDZpIxqIiLsU+fymc8tYxPcTPan4t6c+2tyZz4zQV2wgAZ/4llbrGE3D
	 fX/VOOQjZs2tA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] kselftest/arm64: Fixes for fp-ptrace on SME only
 systems
Date: Fri, 18 Jul 2025 23:14:49 +0100
Message-Id: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnHemgC/x3MQQqEMAxA0atI1gZqHa14FXFRbaoBrSWVYUS8+
 xSXb/H/DYmEKUFf3CD05cRHyKjKAubVhoWQXTZopRtlqg6t7O0HfcR4ip0J0054hO1CO9XaOOO
 VqzXkPAp5/r3rYXyePxiB4KhqAAAA
X-Change-ID: 20250718-arm64-fp-ptrace-sme-only-ab327d7f0d32
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=r0RFJLu3chixovmZTNacoWht9HF6iXxmx1ISjsYOiz0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoesfUa9Bm1z2D3Gq+jJPU0PD2Vbmqp7+5TV6lQ
 wcKyMeQICCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHrH1AAKCRAk1otyXVSH
 0OvpB/4namfzyPgsrTcckROrMuyeAGcdlOIUq8Wm2ddk3GBx7yfxv3W18p8aeM4Je6ht/3LEKbP
 mrVsoA4b5Xqs3NpgK4GBrUg9LcEi8Itl4ORlap9Y6Oyna+kyuUrjZFTiDH8HuLeh6uJyzjMnlAT
 Va0LQevVR9lgdv+y5oqnYHLFE3uHUsiNauyoCOywzDXRmPRlrcz9x7cquaAkKB9WPm5I8LtHdf4
 uzkiGbMgjdTgPz7CAXYFuGwIzfUMk+d2CSKayhPH0x2zees02qrSZGcYQyWgIoPAVwlOXbyJwrY
 YE75j7eDRXa68rPLnYhZZuiZgGafvbB7VauXjqOAqYnJqIIw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_151658_304267_084B6D4A 
X-CRM114-Status: UNSURE (   9.13  )
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

When testing SME only systems I noticed that fp-ptrace does not cope at
all well with them, this series fixes the major issues so that the test
program completes successfully.  The reason I was looking at this is
that following the recent round of fixes to ptrace we do not currently
offer any mechanism for disabling streaming mode via ptrace, this series
brings the program to a point where it tests the currently implemented
ABI.  A further series allowing the disabling of streaming mode via
ptrace will follow.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      kselftest/arm64: Test SME on SME only systems in fp-ptrace
      kselftest/arm64: Fix SVE write data generation for SME only systems
      kselftest/arm64: Handle attempts to disable SM on SME only systems

 tools/testing/selftests/arm64/fp/fp-ptrace.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250718-arm64-fp-ptrace-sme-only-ab327d7f0d32

Best regards,
--  
Mark Brown <broonie@kernel.org>


