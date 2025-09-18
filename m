Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0763CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpn6ughdtbs5CdZckC05BiM21afrc6K6ej4dvdtTCzc=; b=XccV4pcQ8bjj35
	un885DmkYglE+Wv4+fwD7dOrIdqkR9vq4WLhqFtd8LmSqv8Ioxdhr15nRphnE8OpSKxdqaJvvkaRh
	D6zoKnFAwALktZ8YlATRsZbg2SpvmjIQTCW05ARPuWollOqmHUO7cKKFnpE/vKaOxOTdOydM30/bT
	S/Da/tGaOoPcjU64+jpQQoSvjNqTy3OynacEsgUnYXMsMQh1B4ApdpDGUYu9mBGzd2tWSgTldqpWo
	Pg6xNz7f+ihZuo7M90i/DJpiKHW6CBImHhNR29VHW0C5v1EVcYO2NEndudg2+lgXr4lj9vzSSXSpC
	N/DJ8dXEBh5PjQDzctGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYQ-00000001189-3uUP;
	Thu, 18 Sep 2025 19:44:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYO-0000000117k-2f44
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC1F43B0D;
	Thu, 18 Sep 2025 19:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD07C4CEE7;
	Thu, 18 Sep 2025 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224668;
	bh=/fyRtjX7Acq7Ib/RG2oDrAdMcjvCIkWa8I5Em83Gg64=;
	h=From:Subject:Date:To:Cc:From;
	b=PW3c6aFVxiQWITh6uQ/YoOHRKxxI3L9bEFBR6TwvzK3VAt9z2AzpTVgc/j+W6yO6W
	 nkn16qJAv7CO+ycRjZIgiq+cT46fXqA5py/CN5FasGMgCtDWP9Ps4sN+6SGurZtyJN
	 xNF3Y85SGQUlejYbaLp40z1mSwsmA+knuaFXPUdyrEWgfkJ5LhhC88g3FDGPObVPvr
	 8E3GsSL1dOri2YE0qVPyK4iP+0LE/h7Au+Jx09CpfN2jouhrIOqyt+YanXECchgfrZ
	 +p1NDzYH5oNYrJV48B1umx3nLZudUkiSvgwiP/atuE79dnBYbRmpjgH1tPaEwk1p44
	 6uK4LkE1X7s7Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/2] arm64: Support FEAT_LSFE (Large System Float
 Extension)
Date: Thu, 18 Sep 2025 20:42:05 +0100
Message-Id: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5gzGgC/2XM3wqCMByG4VuRHbfYP+fWUfcRHej2m45MY4tRi
 PfeFMKkw++D551QhOAholMxoQDJRz8OeYhDgUxXDy1gb/NGjLCSSFbiOtylwH10gImixDitams
 YyuARwPnXGrtc8+58fI7hvbYTXd5vpvrNJIoJloqX1IjGVYKebxAG6I9jaNHSSWyzFeE7y7IFA
 1YRrbVpxJ/lm1VU7SzPtnbSCSslNFzv7DzPH9T48Y0dAQAA
X-Change-ID: 20250625-arm64-lsfe-0810cf98adc2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/fyRtjX7Acq7Ib/RG2oDrAdMcjvCIkWa8I5Em83Gg64=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBozGEW5FyWseaqc8/F+wIiqySykyyfiEMwETJHD
 3x47bVLit6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMxhFgAKCRAk1otyXVSH
 0MnLB/sEOZMOHVacNMWbkkwuSaxy58fOnDcDG3q5SSd4PYa/uO6lM9ZG4SYsH1bv7w0L350Oml5
 /05e0opT3uGxlCmhQL2AcdMQF8bEw45kMI6pe7XDKC0oNu5sL0D1PSUP9psLPM82dsK5FszB87U
 gkisjR3K77ju9UxZbtP2bQJbRBg0FW1PeIv6K1gD9dwfEkEoVyqnKblRP6eQ4jyDHFwdqmHSbJF
 vMQ5uXgp+3m0gAibiPJuhNUt4umwF2ktg6gC/4y0SXM/0jEMC/rSycbv4smm0hAXYqvWGc6l2TR
 8/IsnwQrH8X7xO1FsCqOpRQlONJtdgwaTwvbqLTp63iIfltT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_124428_725164_2C4C5DFC 
X-CRM114-Status: UNSURE (   9.81  )
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
Changes in v4:
- Rebase onto arm64/for-next/cpufeature, note that both patches have
  build dependencies on this.
- Drop unneeded cc clobber in hwcap.
- Use STRFADD as the instruction probed in hwcap.
- Link to v3: https://lore.kernel.org/r/20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org

Changes in v3:
- Rebase onto v6.17-rc1.
- Link to v2: https://lore.kernel.org/r/20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org

Changes in v2:
- Fix result of vi dropping in hwcap test.
- Link to v1: https://lore.kernel.org/r/20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org

---
Mark Brown (2):
      KVM: arm64: Expose FEAT_LSFE to guests
      kselftest/arm64: Add lsfe to the hwcaps test

 arch/arm64/kvm/sys_regs.c                 |  4 +++-
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: 220928e52cb03d223b3acad3888baf0687486d21
change-id: 20250625-arm64-lsfe-0810cf98adc2

Best regards,
--  
Mark Brown <broonie@kernel.org>


