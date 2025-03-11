Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C7AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rk9CbkQzhVwt/rVn7ycFUT3kXBCDF2LvHu8fPP/Dvbo=; b=xv4LyFEG5J4BjGjv9sZE3t4MSg
	6ASMYShHj7IAfC1F0tuU9NqBZoDUXnwJOWCg4rZbjJM9eeeeQ1pGRj3A5qR2WZ4oaTdqIKgrxyqfi
	0i4MaZmuDXu8Ib2TN2/htHtSxdV2Q5kBm/amNrEGcvoehmns/ROiFG6lIQd5m3YT5/QYAJEjApYR3
	Dt1c42rKIp2LhK5VGoJGzf7zsqc9RvP3zqcR27mcf2CxTvUtQ4hKDzOlHPFanIktgZeOSfaJTpvBz
	hDLL5h2XGkPakErEabLSF8up1EYclUvtzBDAVs8eSJD5UFuuS23KaMBBIV0WuFUYDEsTIHXdEZ7eB
	ns/KTZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpKX-00000004Q7Q-280t;
	Tue, 11 Mar 2025 02:26:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trpIu-00000004Q2U-1gdG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5C865C0F4D;
	Tue, 11 Mar 2025 02:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEE0C4CEE5;
	Tue, 11 Mar 2025 02:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741659911;
	bh=FPCsEDlVAiktsTcXMIq1mYcVDLwa2IUEjTMcsNbQMG8=;
	h=From:To:Cc:Subject:Date:From;
	b=KNeWMBQ2U3y/U0qjJixEPYha9AlBauhhku0+qOqr3Gb+4g/rxxteqZcLPCdnZ7wkW
	 SCnqKr1nFpOulihgeaa7rgGroSreftX9dwsiNLTzWtNWQw7FqQnGZn660PXKqnD9/7
	 NwtcksgbRF2W+g8TsHTzwvVWWhdFE8ATfD8nTeLMjaimth6hI7OLTm3jeE1i9t/NDO
	 ZVkD0sc+k6lT9H8Uelg7rBVvTgCRCcKUx2mZoO3uE4ftwizj67aNHFlamwOEeW66CN
	 9vA6HLe7O8GVtUKGMLCbeoC+MYjgOib1OjEoGYkxJnH7TcKpLne2MLAeITpLwOnVGL
	 A5/tMJE4EFEUg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Saranya R <quic_sarar@quicinc.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.14
Date: Mon, 10 Mar 2025 21:25:08 -0500
Message-ID: <20250311022509.1232678-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_192512_497869_E44CEADB 
X-CRM114-Status: UNSURE (   8.06  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.14

for you to fetch changes up to 2eeb03ad9f42dfece63051be2400af487ddb96d2:

  soc: qcom: pdr: Fix the potential deadlock (2025-02-14 09:16:27 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v6.14

Fixes a locking issue in the PDR implementation, which manifest itself
as transaction timeouts during the startup procedure for some
remoteprocs.

A registration race is fixed in the custom efivars implementation,
resolving reported NULL pointer dereferences.

Error handling related to tzmem allocation is corrected, to ensure that
the allocation error is propagated.

Lastly a trivial merge mistake in pmic_glink is addressed.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: qcom: scm: Fix error code in probe()

Johan Hovold (1):
      firmware: qcom: uefisecapp: fix efivars registration race

Krzysztof Kozlowski (1):
      soc: qcom: pmic_glink: Drop redundant pg assignment before taking lock

Saranya R (1):
      soc: qcom: pdr: Fix the potential deadlock

 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++---------
 drivers/firmware/qcom/qcom_scm.c                |  4 ++--
 drivers/soc/qcom/pdr_interface.c                |  8 +-------
 drivers/soc/qcom/pmic_glink.c                   |  2 +-
 4 files changed, 13 insertions(+), 19 deletions(-)

