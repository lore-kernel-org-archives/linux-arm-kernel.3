Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0570FD29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpKvGVCQTUM0sd8ufzJHoJZPmEfl3FVqhyWfAV31iUI=; b=CWaFhtG23T7SM3
	5OyunhNX5RBjR0y3PkpSOFqkmqcSO9V5ZFmx0OiD+7E/ns6pmCz3g9t6Ili80q/QtT+nHeHCKIvQq
	XujGu95rjgpbrDdwtEjny7UL3o9iK4x/zbfqmVJ1MSflPflr7dRpthBFQAs+9Yuz0h4/4KP/Vgeql
	Px4U8Lko/K26vfQ1wEU2EeRrsvGqbenkxsE/6e06ze6EdsyxP7AHhL4W0NrmpKrM5xYv2M3yiacwY
	fN/LZPaxAMuvSmxYe/p/9m0NYjvIR/8eQudpsK79ML/eifxldCAhIv9JLo6WOct5vAV5FaHZtpYSD
	6Ej+q3WuQBMhcn9mdjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rW0-00000005JcP-2hyS;
	Thu, 07 Nov 2024 01:40:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rUA-00000005J6i-3xRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10DF7A41C76;
	Thu,  7 Nov 2024 01:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B55FC4CEC6;
	Thu,  7 Nov 2024 01:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943537;
	bh=Ifv5eEqDTr2IOlKTWcHRHgBuh8QWxP57/E+ccYr3L0Y=;
	h=From:Subject:Date:To:Cc:From;
	b=exZfFAGQhJuBxMeDca1D2ULoSH6/Cau6DPJjdnNWyJodAoP/de3xGH+SBIsRZKFJ9
	 NRw6el1FxQJXcuJB1syFgQLqp6vyla5URvy2l3hB+gtz6YIFxep6i3e5o5O1wDNipp
	 ZbrxbEh8cmkSPKoKhCIG2kCY6qqMV7vMHdkGB0mK9jZ97bwCIDGSBGhhGQftYZ54zp
	 gJ8T6K3gMGdSo8xNSq1k83TEPf2E43SpvMpbeoPiK9q5LjuBC1t/BqM+UTZVmlHuo3
	 y3DMXwv1E1ORjlJTnEe+HlzSfBy3zyUoB06qNRJjRx5IAW7HqNgLY2hF1XmbtobS8F
	 jTQ1rLzZLWOBg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] kselftest/arm64: fp-ptrace enhancements
Date: Thu, 07 Nov 2024 01:38:03 +0000
Message-Id: <20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwZLGcC/x2MuwqAMAwAf0UyG2h9Df6KOIQ20QxqSUUE8d8tb
 nfD3QOZTTnDWD1gfGnWYy/i6wrCSvvCqLE4NK7pvHc9km1Dh5IwnUaBC22GIm7wQiG2kaCkyVj
 0/rfT/L4fqOoOW2YAAAA=
X-Change-ID: 20241105-arm64-fp-ptrace-fpmr-ff061facd3da
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ifv5eEqDTr2IOlKTWcHRHgBuh8QWxP57/E+ccYr3L0Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBorcyPXQv9O6VGBSffTN5lbz52kyZ7iddgyCHsm
 ZmsNreGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywaKwAKCRAk1otyXVSH0LNmB/
 9r1nEAa2KYrg61SyLhV+PEyYdh9oZixDxbqjxaong7sj7tZorvInnQjIe8IW27S33Goi6twBiNaA2D
 uu+u7l8tUy3fkQRx0xSe7VC4GR10DmHj/hZ6LXjOGaimnKN58rvxPy4gy0lVomc1/cpydriPU89UoF
 DHkRisqnCR0hb0Sn1BG4+shxc3KO1o9zyjo0aCGTHzpqat1gMkG+6fw+GTOEkZUBQIwCxo2kFekqtg
 Zda+FiPOkRQstaJu/bmFxJJSroi/qK7QUKxjlOaxdSZfySO0OP5nJxdspxWdRjKEHBJIqNcH+ijIee
 v8C4FeFdNoFuAPPfuWxAJLe9jVJu3m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_173859_082571_0F3CAB6C 
X-CRM114-Status: UNSURE (   9.93  )
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

This series contains a bit of a grab bag of improvements to the floating
point tests, mainly fp-ptrace.  Globally over all the tests we start
using defines from the generated sysregs (following the example of the
KVM selftests) for SVCR, stop being quite so wasteful with registers
when calling into the assembler code then expand the coverage of both ZA
writes and FPMR (which was not there since fp-ptrace and the 2023 dpISA
extensions were on the list at the same time).

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (4):
      kselftets/arm64: Use flag bits for features in fp-ptrace assembler code
      kselftest/arm64: Use a define for SVCR
      kselftest/arm64: Expand the set of ZA writes fp-ptrace does
      kselftest/arm64: Add FPMR coverage to fp-ptrace

 tools/testing/selftests/arm64/fp/Makefile        |  20 ++-
 tools/testing/selftests/arm64/fp/fp-ptrace-asm.S |  52 +++++---
 tools/testing/selftests/arm64/fp/fp-ptrace.c     | 155 +++++++++++++++++++++--
 tools/testing/selftests/arm64/fp/fp-ptrace.h     |  16 ++-
 tools/testing/selftests/arm64/fp/sve-test.S      |   5 +-
 tools/testing/selftests/arm64/fp/za-fork-asm.S   |   3 +-
 tools/testing/selftests/arm64/fp/za-test.S       |   6 +-
 tools/testing/selftests/arm64/fp/zt-test.S       |   5 +-
 8 files changed, 213 insertions(+), 49 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241105-arm64-fp-ptrace-fpmr-ff061facd3da

Best regards,
-- 
Mark Brown <broonie@kernel.org>


