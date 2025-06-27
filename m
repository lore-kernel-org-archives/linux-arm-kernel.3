Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B24C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSH5esqe1Fg+GN8ZaxLS9VapoW1/r10W8553LUFqQyE=; b=xRl5P/mulDQ7g/
	APTltd+J/oDBpPz/IHm7Zq5HYn7i6N7BWgGnwOmy5rMeWwfp3cUYcymaqEslsj23TkxCX+E/NR27Q
	ittf6fb532TtdqEyAHdBQKR3Zibc9ZpEY3gR6EwuI7FDl4bWpRmDn1H81oI1Y2eWWXlDHzgrqaPUI
	fDqBNtj8RPXiWenfa9/GcTv+XIMb1rZe0PakvenbpBouD19FC73a/wTIHHph8wcrOLnCO4hHxk5DF
	EXdkEPCGpurvApnw9z4izWsuFrXQA0NTOF7X8dMQBVG2XWNsThkDE1xH0UXR6XSLRQ+jf7nG8Vubm
	IvNihrFM3aBY8Dx8qIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENO-0000000FYkG-0k2b;
	Fri, 27 Jun 2025 19:04:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCp2-0000000FPCx-00Ue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 872E1437BC;
	Fri, 27 Jun 2025 17:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB940C4CEE3;
	Fri, 27 Jun 2025 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045107;
	bh=TjGWey8FcBbGmqOInU155Db/0s5SY/hzFhuW5NLF6cI=;
	h=From:Subject:Date:To:Cc:From;
	b=kMTMx71v6QM/OXAP+Y0vfh2Ir0lcOSak7ALprCXKwUgIF0uKebxCPcQU3Vf13aR0z
	 iWz+WSzDHeQLfrNGqlER6Rf4D3Bovf/AJuGCl9acOgWDuA77RUScEDfaZbxwwq14qs
	 lTqZ86zTd+r68HGYzkYHlGSqa5tCYH9qZU2FMMbjKq0O4JryKCEtChOERdVS6BKhOX
	 ramNyYWQ+rKpWs0nL511bBvEVdCI6R8bEyEAt/ptDzqk999Rzbr/2gy9YuVDmUy0Wk
	 Ke78hj90sRZRzfBm8Uiho/4VvA7tQx7kI0kG5lNDMAstg+qLC9PhZpzUJuxhLnr7zz
	 CjJbpZqTNijXg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] arm64: Support FEAT_LSFE (Large System Float
 Extension)
Date: Fri, 27 Jun 2025 18:20:43 +0100
Message-Id: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvSXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3cSiXDMT3ZzitFRdAwtDg+Q0S4vElGQjJaCGgqLUtMwKsGHRsbW
 1AFdTkTtcAAAA
X-Change-ID: 20250625-arm64-lsfe-0810cf98adc2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TjGWey8FcBbGmqOInU155Db/0s5SY/hzFhuW5NLF6cI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoXtPt0FftV/nPMAp/n+4AWdmZOj6LgUFaBlaA+
 4ex33utcbSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaF7T7QAKCRAk1otyXVSH
 0MOSB/9s8wuMp+MQz7BhZa2kE2BZucnu98xD581nSGlh0NygznHU5GiBt16nWyR/96xsxh7X6Pt
 4GqJqm3TQyyYBj0V8GK9ZeBDgyW64FmjYSzvn3WcCt0rdcyzWPTBUPfGXx4YPu5I4o3HL3fz5uH
 2W+Mkl10sFSBiJGJzoWlagqg/Z392OpdPSXq7ZK8BlLER1n5zicMpw50tXZK8g3aVZaa8Ozt7E8
 F4PUCjnn4hk/WchuQi3P+ohPmnHYzEWIrdxC+61y0Gop+0m1esJufi4ZQxUk3QSf5EEZgxbL1dp
 JoIe4+SkFWRhJtRFXoKtJKFQTN6WKUWtZahW7oABwkMAPHfZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_102508_068629_14B3DC99 
X-CRM114-Status: UNSURE (   9.52  )
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

FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
memory operations with floating point values.  We have no immediate use
for it in kernel, provide a hwcap so userspace can discover it and allow
the ID register field to be exposed to KVM guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      arm64/hwcap: Add hwcap for FEAT_LSFE
      KVM: arm64: Expose FEAT_LSFE to guests
      kselftest/arm64: Add lsfe to the hwcaps test

 Documentation/arch/arm64/elf_hwcaps.rst   |  4 ++++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            |  2 ++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kvm/sys_regs.c                 |  4 +++-
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 7 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-arm64-lsfe-0810cf98adc2

Best regards,
--  
Mark Brown <broonie@kernel.org>


