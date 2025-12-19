Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E6D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9T1yI92pQNuAIWyV47C0PQWYn3dcKg8RTRg2/Yg+xJs=; b=Bb2OBsYGOD10vc
	KAZl67NC5uV2a1MRxbPX2ULjHXv/rPAsr4q2VSEtmxA2oNRQOUuzGz2GGZJ9HprnsEQkevLbMw9tH
	FEUKVohZ8ObRWox4SYaI972266zpiByw6mNRla3lmBW5U/+mIRSxse/SieCaQS0Ik4n0teGzs5BYp
	5r98iVtg3LFl+9ckWljP+VEG7c/rG6S8JwRp7cESQWEf2PvfBBex2Fc/fKHorkO5u5PlgTCdtDQ7O
	95TL+kNjginP2IIBJUk2rzvWC+dD7iwI9CqdRjB2In5dcV4NTw1dzC2Uql/7qZ4YQ9vBsVt0865qh
	43sclIy68Pr8lrQbTsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9l-0000000AsxW-1oWC;
	Fri, 19 Dec 2025 19:28:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9k-0000000AsxN-0gmH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4083160008;
	Fri, 19 Dec 2025 19:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D1BC4CEF1;
	Fri, 19 Dec 2025 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172530;
	bh=djKhHEwOK60o6/v7COi0fZNMDvLwIhB3VYDbW9TITiE=;
	h=From:Subject:Date:To:Cc:From;
	b=Cu6X3hu1SH740JSIHC08MNNEvXpKxenoEz4kPe9ibti6ydI4XTA9YubGW5NReMD1Q
	 fQXSNoKLT/2LdfUroQDmP1b6OISabbOvge3K8ibxiQiHg257skmM5sNwPa4UqHcDt0
	 IoaAQI4Lr3AhpoyrtMPni50cxyf3Z2/e0Z1i+vgfRXRC0sJqDmtDgdH31KwNkLBRZu
	 jevXFoOrW54S0lbnRtb6Ys6Y2fEe3erOn0N7s5bfByuiC5hviVOJN2Z1gTUtoGrYak
	 zjQ54D2LF2D5j8SphzcYpFUVTCCjSuL798lpa+JfCOlrq1Cdamx+64Nqa3QUwel56T
	 E3nQOAWYcHmNQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/4] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Fri, 19 Dec 2025 19:28:06 +0000
Message-Id: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEanRWkC/4XNQQ6CMBCF4auYrq3plNqCK+9hXBSYQoOAmZJGQ
 7i7hZgYVyz/N8k3MwtIHgO7HGZGGH3w45AiOx5Y1dqhQe7r1EwKeQYhc97FnlvqteIBp3TkhE3
 g1lLVpg3L0phCF0pAxZLxJHT+tfm3e+rWh2mk9/Yuwrp+5UzsyBG44IV2KGpZgsnx2iEN+DiN1
 LCVjvLHAag9TiZOG+kkKKegdH/csiwf0h2fhhoBAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=broonie@kernel.org;
 h=from:subject:message-id; bh=djKhHEwOK60o6/v7COi0fZNMDvLwIhB3VYDbW9TITiE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpRads3BeObYkMUbxOa2L8G5cc9dXvTvMSBHGjT
 UgF8XJQfnyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUWnbAAKCRAk1otyXVSH
 0HZwB/9IkoCpvXO2yiOCeRPdgHwF4hNdXjVN52TdsH6yiRX495D77BhnPlvgk8kuX2nDu7TIn/S
 CY5IvV83CRbbmHVGYf30iDiBC9CC0uecVOV3MIIch4k/F5aP3cgm32Webw+tLbP0EFGX8U2ivph
 Z03pw06qQpU/esK80jabA+j/D5fEdTr0rkgZbd6MG0f1ImdJTiWDAm7IoZN09fp82t9e7m6h1qt
 D4H7ewKWliyTz3qrN5DFhyk+5/QKIr60unp9Y7oGi8lWdDdzldOHUCV0JzwtPKqRFNtTpWXb8ts
 JySIr9MDVzyTaNF1pSXdsa0THuADC7ZRGvVjglr/iqP0g1e2
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

While debugging issues related to aarch64 only systems I ran into
speedbumps due to the lack of detail in the results reported when the
guest register read and reset value preservation tests were run, they
generated an immediately fatal assert without indicating which register
was being tested. Update these tests to report a result per register,
making it much easier to see what the problem being reported is.

A similar, though less severe, issue exists with the validation of the
individual bitfields in registers due to the use of immediately fatal
asserts. Update those asserts to be standard kselftest reports.

Finally we have a fix for spurious errors on some NV systems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Rebase onto v6.19-rc1.
- Link to v2: https://patch.msgid.link/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org

Changes in v2:
- Add a fix for spurious failures with 64 bit only guests.
- Link to v1: https://patch.msgid.link/20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org

---
Mark Brown (4):
      KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
      KVM: selftests: arm64: Report register reset tests individually
      KVM: selftests: arm64: Make set_id_regs bitfield validatity checks non-fatal
      KVM: selftests: arm64: Skip all 32 bit IDs when set_id_regs is aarch64 only

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 150 ++++++++++++++++++------
 1 file changed, 111 insertions(+), 39 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


