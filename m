Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94971CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0VcLtdQkeu0Bc646XmiV1JND1FqHc0S5p0o52lwdfLg=; b=fh0Xdu4LY7TFu8
	FobNLXwzTiNOcOp09AG0suEoH4CxDgyBFepVDwzqScxnlKFq0rBhfAcHrmOV9bB33xQ/ET4ROWh0I
	xc8UJmz7Vy8+DODPXwNc5+SdQbGllNrtA+oN5ioUUEBFLRYkq8HWz1pqEizuSyIZqAHnU2qaN2HaB
	X/bhF0Ca8Etw7GEHoaK6TT4K4+ExqtVuZJ81d7Rz1STGov05ZvRmE1hzQ8E6AOyaHykZtVIxxXaRr
	frUHwOQP2G/TWtt5bn8ueszQQuXQxsT1UD0fWJDQ0n5KYHde/PxG5vWw1s8jO7WCrWuJZ1VXVRyp7
	BjooWauxRvRTkPrUH36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvt6-0000000CaVp-2Fkd;
	Fri, 14 Nov 2025 15:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvt2-0000000CaUT-3MbK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0VcLtdQkeu0Bc646XmiV1JND1FqHc0S5p0o52lwdfLg=; b=fvVCRpzIKci1rkei03KLZDKqX9
	fU0YvrZWqMGdjmfaTdzd/Snt2FqUJkE7701uphqFDElkZPeJCAYAIc6lSnLzoH5Jl5IRMDbhA/MLu
	vxBFUT900tdQRLUyH6Ka/0780euOnNjKTUY/mMUzolsV9VoLQLhUKGs04kitFzDqP0ReJV7wEe40I
	xuaYabaQ97mPydpcQ/9sN+HbjltRCf6r2fTRIXFMLB55+2iMk6/HWvAa/mCE9VvKH/BzX24YKXC4E
	T/014sOfpMsyjJjUj6AHiNfUCzXpIHDYI2GQBWy+uXCDFwp/ODjJpL5lW2kHESxFnjWuSkqYoJRXB
	tnqv7B4A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJv1K-00000002qqM-2vsu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6303144324;
	Fri, 14 Nov 2025 15:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D78C113D0;
	Fri, 14 Nov 2025 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763134729;
	bh=J45c/s19KG5BRrKbkkO8elgq2nUpoF6T9W4M2wJwxIg=;
	h=From:Subject:Date:To:Cc:From;
	b=sYzPddv/oyC4fyRjzIbV4LUbG7tuVcGoEtaqEdOSgNCYfiIB7NXyfAh3oUOmGuJSK
	 Wbth6vCLlEyQRBghE7FCZ6JyIfmPLguDbCVlrrIjOY3vu3h0FB5joa/9NSQi0pa+V0
	 vd9WLyxem65B+bq14jTosrdWkjFD9YepT/PjMmUEj8fGl8Iai4ZgMzd0me+p85cpdW
	 Kc5Mx5u2d+2CxWAj6jQDn8+1iSmFrnFkUr6q19+p9xubqlLiWYTIt1gGFU6y+jdFZZ
	 GN9roLcEP9rVCYqa08oPnTSrLHJL8sJsF7gtq2EgrS52C5VtTOjkP8KWn5xgUNAxHV
	 D5WYf4EVTm10w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Fri, 14 Nov 2025 15:35:33 +0000
Message-Id: <20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVMF2kC/4WNyw6CMBBFf4XM2jFtxfJY+R+GRSkDNAg1U9JoC
 P9uJe5dnnOTczcIxI4C1NkGTNEF55cE6pSBHc0yELouMSihrlKoEqc4o+FZ5xhoTSMyDQGNYTs
 mR21bFJWuciEtpMaTqXevo39vEo8urJ7fx12UX/srX8SfcpQosNI9iU61sijpNhEv9Dh7HqDZ9
 /0Dwl+2WMsAAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J45c/s19KG5BRrKbkkO8elgq2nUpoF6T9W4M2wJwxIg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpF00CvVNN1ixu1R00fyRsa8mf54xwdC9j31NOL
 DOsaLUnhwSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaRdNAgAKCRAk1otyXVSH
 0A0KB/sGtgmfnFGBZsCQ8KRHczYKmHn8xbMTbhdwyps3Tux2tF9yJ4rubWo0HO1JMd3yY0qqqvp
 JJMahVCsnI45Sp2Iw9ix9Ya5INP0R8lQ4qMSbLb1YN29PX2cieTkr3ZZkvRY5+wNk8/tjueNWri
 H/Vsx3ma6ZXdaJ6ZaXt3sRwrIZ1SdVapRo4Ngj97XuLyF/MaOPMB9qyky34K244ynsCVog4qBWP
 0CcwUKa8YGdbCQWq4GOPPlJ0n7TM2P7aXZ+OPrVHspSalZcEGZRNNFlz/b7Uyh6XjLaeHovK63B
 NNPoC69lV0c6S1Hrq83EDSxwDncgDu083/9aeXaZLXcMlAfW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_144327_120046_52DDDB51 
X-CRM114-Status: UNSURE (   8.32  )
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
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


