Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F30EFEDA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t3EmGhH8Oz2qs+COJ219izDKTUp7a1ev2tQI8gP1U1I=; b=WACsEjv8GFduhY
	5SJEdWpcq9sz9jk8tX+JSVeMQfBOhxyB6FhcavyinXXihutqgYuRn14H1Qu3qEUjyVNa+n1lOKxG7
	OjGkRNpOe/PX2fG4LxqZQ5j6kUqpM4A56RaXM6uT9nXw1q5tAVcP3XdpSPhtaz9RANs5qZ7kYZulR
	kj4p1PWByisI35Fp5DQqxOK/0vZxqOS0bWQg8IwWObk9jkQ75dbF3fiHcVoROX6hZzOlkVj00SawK
	Lt/0qSM2xjcJ0GZKx03Knb6UTEVZWomtazLmNxHzDF2e+qrWuc+7+V+zITMzR+tStVT1IYziha7rO
	tN9ah0BY0NYlHdGaB46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akc-00000007AYK-0e3G;
	Tue, 17 Mar 2026 20:10:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akb-00000007AYD-0LZr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 20:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07A7860133;
	Tue, 17 Mar 2026 20:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4581BC4CEF7;
	Tue, 17 Mar 2026 20:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778247;
	bh=+6Zxzezsh4eCjXwLVVqESoM+xpbSNtskzunvjvtmVS4=;
	h=From:Subject:Date:To:Cc:From;
	b=Fm/OFvb3kneo1FQvzjrbM4a29y8Lg6tV6bE4YdXaD63RF6j7QB+x0VPQ4/xEWpMh7
	 JJ3+JQkyuZTMErWYP8zrav6hdAXr8N2pCNW5RlxQsk3ungAe3t3KafvcdJFnnOfKcY
	 UQ6Q9pb6UVLb+epNlNHNiezabsbl+cYxCnHy+7eETshs0vvAhetFeWh/qEm6bqM7yj
	 /tqYm5ck0gzJgeDyPaaNiylQmV0eGjzAuC1XvWviz7t3YBVC772cVm6JLYcDCPSZ7U
	 4X9U62OSJ5NxoEu8SPanJpuTYo1UugiqmDn2L4GncY4B+fXKdjyhMurhwhEDLhqJAK
	 2dQDZzOZ7MKbg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 0/5] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Tue, 17 Mar 2026 20:10:33 +0000
Message-Id: <20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADm1uWkC/4XNQW7DIBCF4atErEvFDGOwu+o9qiyADDZKY1cQo
 VSR714StYqqLLz830jfXEXhnLiIt91VZK6ppGVu0b3sRJjcPLJMh9YCFXagsJfHepIunwzJwud
 2lJnHIp3LYWobe2/tYAZSEEQzvjLHdLn7H/vWUyrnJX/f31W4rb+yVhtyBankYCKrA3qwPb8fO
 c/8+brkUdzoig8OgLY4bJyxGBEoEvj4xOkHhzBscbpxPjqyxEEj9E8c/XFGgTJbHDUuWI7UdeC
 i1/+4dV1/AB+u2XC4AQAA
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+6Zxzezsh4eCjXwLVVqESoM+xpbSNtskzunvjvtmVS4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpubVAnYutCrQRjOp77R0NgCeHPxRanQHwdmOwR
 DrpStOs5AuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabm1QAAKCRAk1otyXVSH
 0PX9B/sGWR9wpk5wsfDy2EW7SUKuf4HTffxuwpV9fXjDTWM4uQToawjfHjXJwKnxT94X8XhkSX7
 pGM6H32UKO79M0fHBlG9jpLZOJiIcfYoaf5uEhniMfMEDD/z8W1y0+OuXtJ23Pd09RV7Fsu22wU
 mBfwfeUfOSWflXWTER4r1cOz/HwrCGhLepDoBs3n2948rEwuS1qhnVEHsXWEBaFAVpUvnflt3vH
 xFYzdvhAZYAN5ve8fRtBBj/wsykdzWZZ3Atpg4sAABcsyznXc21GLPs1OOheOTt//HIKEGWMYWt
 ONNzPxUYc/rS3FDwcdNYHivyRcr6Nsk5hbO1Sj7SaBO2Q4bf
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
Changes in v5:
- Rebase onto v7.0-rc1.
- Link to v4: https://patch.msgid.link/20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org

Changes in v4:
- Correct check for 32 bit ID registers.
- Link to v3: https://patch.msgid.link/20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org

Changes in v3:
- Rebase onto v6.19-rc1.
- Link to v2: https://patch.msgid.link/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org

Changes in v2:
- Add a fix for spurious failures with 64 bit only guests.
- Link to v1: https://patch.msgid.link/20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org

---
Mark Brown (5):
      KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
      KVM: selftests: arm64: Report register reset tests individually
      KVM: selftests: arm64: Make set_id_regs bitfield validatity checks non-fatal
      KVM: selftests: arm64: Skip all 32 bit IDs when set_id_regs is aarch64 only
      KVM: selftests: arm64: Use is_aarch32_id_reg() in test_vm_ftr_id_regs()

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 159 ++++++++++++++++++------
 1 file changed, 119 insertions(+), 40 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


