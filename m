Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCB9D32D8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zh4HYkalOSHwinLmbTCum+Y2cG7Cw3BerXzWel06cnI=; b=mIeBQDLsdXPTgd
	fXYV/Dd8Gv+sf5ZHl3RuJTyZVzBWgNLkEzZq76vFj0MLoKmyKEj41473ZJd/pPx94VDH223OHTCDy
	jfebkm10P59knBiqZQvm4VP9RhZ+k89YolsB/rI4JyMoKCAMgWEQJB68OPPyWNjsDjcxSHNIMlC8p
	o+SZ56VLeHKI+BLKXHiwhNoEHZfmlByr8OoNpL4NvU5fQHIcMd7MEHPVBLpxb/H+e7B6g7h8YeGHQ
	MZJ4ClT7H0BumAfW3pKmdst6ErDPhWJatyEYWT8vEBbbFWizICcMiuF3EoETX0n/sNUVlI5DgBbfV
	7CWAKhwyZdEyxlq7Ufuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqk9-00000003Waa-2iuD;
	Tue, 12 Nov 2024 13:15:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqdB-00000003V7A-2gZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E9B35C56AD;
	Tue, 12 Nov 2024 13:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79157C4CECD;
	Tue, 12 Nov 2024 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416908;
	bh=FvQalYDVEb1tpw/lP6gu1uruFFvqj+3wo8n72MSeeY0=;
	h=From:Subject:Date:To:Cc:From;
	b=Ry3Ienk6Y2mM8ZSs97j1OsJGSFL04SToDAIVsb60k4QUyrtWzKjldHGfWBeza0Ntc
	 F2ehoYnC6jSbr40fNYBouxQB/YGIde7p6M3n60M5efUUmUSp8QHNevD2aflvEP4hyk
	 o1qTJUnVJapdAb0glmsRVYAeTaD1+SvxDIziFqd6zws9Q1l02FIyeyk1cT+Ix7tAvE
	 /CyBDg/fY3kZ90N6xxJiqfqxQMpllDXChWv1WbiaSCRzi4MuUYJs9hOeTXRhjdIsE+
	 wlvJdrIQPbCKy3rvBN5NMtVlJGKzHiFa1RkMEa4h/8ZWxy21wz34hJclG2jwhFBCU9
	 bbaJMqqWv4JiQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] kselftest/arm64: fp-ptrace enhancements
Date: Tue, 12 Nov 2024 13:08:13 +0000
Message-Id: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1TM2cC/22NzQqDMBCEX0X23C2JPyntyfcoHmKy0dCqYSOhR
 Xz3pkJvvc03MN9sEIk9RbgVGzAlH/0yZyhPBZhRzwOht5mhFGUtpWhQ86RqdAHDytpQThOjc0J
 Jp42trIY8DUzOvw7tvcs8+rgu/D5ekvy2P+HlvzBJFFhRQ6JXVPV0bR/EMz3PCw/Q7fv+AWcUs
 ta5AAAA
X-Change-ID: 20241105-arm64-fp-ptrace-fpmr-ff061facd3da
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FvQalYDVEb1tpw/lP6gu1uruFFvqj+3wo8n72MSeeY0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnM1NGksqjE4L2HpHxUPyd1pEiPV03AHGWcCTUq
 SwkfqD7Ua2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZzNTRgAKCRAk1otyXVSH
 0JXxB/4rctBZh0YSAiAGYaYnt07rwf45I71iUF+DWpfOD7a6NJi5adRDG3sSPz2MBraM3zC3jT3
 TK04aJay+ydDIdC726w/cUsfW45o9a3RIRrNovWdSZkCOPJBP7J/XrhjaX+JHN2VfEoF/imjeDm
 rZRddzt9qNMyEaPDLcKgdfBOqzmy+/v76iFeKpcwCGFYzdt1y90M53+FJcoLuwhgOYingHpFC3j
 hQsT7hQRtyCbsi9rCtvIhiz7TOTG7mqaV9sH80xlx9FQ2E4kteWjrnCXNbOy6o/hhj1bhcJt6gk
 mzgWv5eMqxWZzxzL30McMcw7rD7r7uOjspA4ppr8eJrW2Qi5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050829_774611_4D4E56E2 
X-CRM114-Status: GOOD (  10.42  )
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
Changes in v2:
- Drop attempt to reference sysreg-defs.h due to build issues, just
  import the defines directly into fp-ptrace.  We can revisit later.
- Link to v1: https://lore.kernel.org/r/20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org

---
Mark Brown (3):
      kselftets/arm64: Use flag bits for features in fp-ptrace assembler code
      kselftest/arm64: Expand the set of ZA writes fp-ptrace does
      kselftest/arm64: Add FPMR coverage to fp-ptrace

 tools/testing/selftests/arm64/fp/fp-ptrace-asm.S |  41 ++++--
 tools/testing/selftests/arm64/fp/fp-ptrace.c     | 161 +++++++++++++++++++++--
 tools/testing/selftests/arm64/fp/fp-ptrace.h     |  12 ++
 tools/testing/selftests/arm64/fp/sme-inst.h      |   2 +
 4 files changed, 188 insertions(+), 28 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241105-arm64-fp-ptrace-fpmr-ff061facd3da

Best regards,
-- 
Mark Brown <broonie@kernel.org>


