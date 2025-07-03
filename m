Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82355C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OaBrLqMgKU4HKXh0lzWWTvtQjBlhzlybZJ2IGjQSb0o=; b=Ut0GbOWmxQop7r
	yacxghgBGvEtJ3tYon6g2QPTBUQ4tlmGMK8uqI2i0pZpktwMOInzgqBMoIOvk4Q2WRTbU+TLkaeH+
	UzZCSrqvApegbbwaeNWlz9+pyl6u9cq6UNZtF7ft2XiNmT0S/DCR76fncSy434/WiMG6tTl7YZzAL
	ROICKH1M7kwrCIwNAwGwiVIOU1U4wYcyYy67NHp4q71gfja34lWVG5h2wyFKyxHeWMdOx2reoqZtT
	Mtx2z4bup5bfmBTA6Vs3AKmGMRo9lfF06syt1kMfwY2TzhJRufgBU2ozo1K1y5b6e+YkK4C/VZx3s
	tO/J30FUN0dwMDBsD24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1e-0000000CWTm-1hpG;
	Thu, 03 Jul 2025 20:59:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMRq-0000000Bw6y-1ZII
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 187C64432D;
	Thu,  3 Jul 2025 16:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C7EC4CEE3;
	Thu,  3 Jul 2025 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558766;
	bh=jscWpusFJ8+GtruSvYfX4sZd6NM08wNAfoGwbX7hARg=;
	h=From:Subject:Date:To:Cc:From;
	b=A/Af3uuJ9Rb75VKRKFSZpo60tgELsxvze3GiO+tvgALR45Oc5FnwaW/s3gWVHnHno
	 wtAnMK7Pkra9/9GYykEEyE8V+UhVKgcP7+V4M2CWr1dFcEB5CVRThgoG2K1lZKOGIP
	 JuHT2Sgx4tuhuRZ4rp9yGtzYDfd0NprhQJE3DZBz0Hma+AkkBMWtdAcMlWybx1EXwf
	 i1rB2XIUb8705skRmHvXftKvYcB8wmtO2LUGtO0FtWBCvRdHV8VsYVSZJmz1D/j6gG
	 5CjIkOlGam5P3PrDGrs5MlMX2pPniYTBI8x7oiJFTUZ3GAYPUNqWKyozoY6wp8tjLU
	 KWxeyDdIUnV2g==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/4] kselftest/arm64: Add coverage for the interaction
 of vfork() and GCS
Date: Thu, 03 Jul 2025 17:00:14 +0100
Message-Id: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+pZmgC/3XNTQ6CMBCG4auYrq0pQ8uPK+9hXFQ6hQalZkoaD
 OHuFtxoosv3S+aZmQUkh4EddzMjjC44P6TI9zvWdHpokTuTmoEAJRRUXNO9kLxtAo/WU89xciO
 XujTaloUCRJZOH4TWTRt7vqTuXBg9PbcvMVvXN1iI+jcYMy74VWsjrKhUKctTjzTg7eCpZasY4
 UPJxB8FklJDLWVubGMr+FKWZXkB/NBjL/8AAAA=
X-Change-ID: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Brauner <brauner@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jscWpusFJ8+GtruSvYfX4sZd6NM08wNAfoGwbX7hARg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZqpmO/tREkuh6QDv6tS66hUZmiy2srI0RMbDv
 H6NfA3zhpuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGaqZgAKCRAk1otyXVSH
 0M82B/9IWr8jKeogcUOCsJ29Xy4yksQCrWaixdsv+ivWdPhePEkOF9in+1wur5EfZ+l2qgCdWnn
 8lactjzxDDZuFpkZe0h1SMXCtoObhDKFuM31t8VM6KNYLWabWIlXEMPU5htK8AbqSvo1d++HisJ
 7kLjvw+KTyve9tcNgFDQfngnC1Alzo+W09LmmJgwB7ec08acaKrt4OXMAjVuuhLOxtlsgyMp+7M
 W+u2R9eWldITBx70d4VkUHHNhhItxoeLqKCEowCoV9KBQyaFArUms2R3RkrOzKuN9T/8sGPWKUV
 sjwz9ZOtVwG0eB+L21KEsnsEhxjdV8s50e0yNhmiuEyGEDfM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090606_454762_73CCCE11 
X-CRM114-Status: UNSURE (   9.71  )
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

I had cause to look at the vfork() support for GCS and realised that we
don't have any direct test coverage, this series does so by adding
vfork() to nolibc and then using that in basic-gcs to provide some
simple vfork() coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Stylistic nits in the GCS vfork() test.
- SPARC has a non-standard vfork() ABI which needs handling.
- Link to v2: https://lore.kernel.org/r/20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org

Changes in v2:
- Add replacement of ifdef with if defined() in nolibc since the code
  doesn't reflect the coding style.
- Remove check for arch specific vfork().
- Link to v1: https://lore.kernel.org/r/20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org

---
Mark Brown (4):
      tools/nolibc: Replace ifdef with if defined() in sys.h
      tools/nolibc: Provide vfork()
      kselftest/arm64: Add a test for vfork() with GCS
      selftests/nolibc: Add coverage of vfork()

 tools/include/nolibc/arch-sparc.h             | 16 +++++++
 tools/include/nolibc/sys.h                    | 59 ++++++++++++++++++-------
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c  | 23 ++++++++--
 4 files changed, 142 insertions(+), 19 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee

Best regards,
--  
Mark Brown <broonie@kernel.org>


