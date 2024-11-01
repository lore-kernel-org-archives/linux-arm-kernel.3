Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30AEE6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCEcCz/fL/CUgptOXduYV7zHf2BaC9u5M+9ZvPS/5mY=; b=v2NtY5qd3KYnF/3eDcMoBaLAvU
	gJLAHz5eqsrOkXcGyNsz9zXkp/IP/83LXpOC5zAbQcPf4aLQvOUV9BKMYN3Rwuge2APTJPT9cjOVs
	+xKzv8M6VLO2V/4QF40kVjQObF6TochXt3JhC4txriaC1kcBQuKJBbtgVccF5wBpK24J2LTrbAhB5
	BUP/91MKG5n9hjynzWpYVYvElU8C24PFmAOYivn5WNipkxCCNk2o/u0JcqMdO5RWW7HMJVupgZlZ/
	4kNqaM3C4XmKHG+Z3dg86efVQpyUTtVCOQlO7/sAL3ImhfyB+IGgUgyJ+WVBEL3CP2uBE+U9zJY0R
	86rcwKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uOQ-00000007eDy-35A4;
	Fri, 01 Nov 2024 16:20:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uIc-00000007d8R-01PB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FD9C5C4EAA;
	Fri,  1 Nov 2024 16:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F30C4CED1;
	Fri,  1 Nov 2024 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730477697;
	bh=/KS/SG1ZMGsVtQYssxXqdBZU7mlChx4+IvLbta2AuOc=;
	h=From:To:Cc:Subject:Date:From;
	b=rRGQsaNjDJ9TQc5BqrmRi7jYw5Ye17yE6gqW7dgkuH6/enG83R5PtQgUVfaFR62b6
	 Ecv+BaZ95R8KJqB/8wALea0NBvH4Ebj9x8S94Rkhr/cfeHsZiU81SBZaBWUaii0zqr
	 jWl3ACdhxBKe06nHsvJ4DN9jCaX1fMXMsmG5qdVRYTdla4SDMuyPF1QM5hqa1+Jq2h
	 xaGFXjD5HBJu5MAP6jdDCSf+3PjIjeuRaaq3Xt/QoQphugYIGeD2mP7UfrvsfrCZ4r
	 LhlyFWcfIEiOyr5vAQVkW3KAYkPYTriEJmTZdw8UF0bv7muG0VKEyhDPjFyez5I7my
	 n6bL9jiP//XlA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Charles Han <hanchunchao@inspur.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Simon Horman <horms@kernel.org>
Subject: [GIT PULL] Qualcomm driver fixes for v6.12
Date: Fri,  1 Nov 2024 11:14:54 -0500
Message-ID: <20241101161455.746290-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_091458_148742_B968F279 
X-CRM114-Status: UNSURE (   9.64  )
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


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.12

for you to fetch changes up to f8c879192465d9f328cb0df07208ef077c560bb1:

  soc: qcom: pmic_glink: Handle GLINK intent allocation rejections (2024-10-24 13:03:37 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.12

The Qualcomm EDAC driver's configuration of interrupts is made optional,
to avoid violating security constriants on X Elite platform .

The SCM drivers' detection mechanism for the presence of SHM bridge in QTEE,
is corrected to handle the case where firmware successfully returns that
the interface isn't supported.

The GLINK driver and the PMIC GLINK interface is updated to handle
buffer allocation issues during initialization of the communication
channel.

Allocation error handling in the socinfo dirver is corrected, and then
the fix is corrected.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      firmware: qcom: scm: fix a NULL-pointer dereference

Bjorn Andersson (2):
      rpmsg: glink: Handle rejected intent request better
      soc: qcom: pmic_glink: Handle GLINK intent allocation rejections

Charles Han (1):
      soc: qcom: Add check devm_kasprintf() returned value

Johan Hovold (1):
      firmware: qcom: scm: suppress download mode error

Manikanta Mylavarapu (1):
      soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()

Qingqing Zhou (1):
      firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling

Rajendra Nayak (1):
      EDAC/qcom: Make irq configuration optional

Simon Horman (1):
      MAINTAINERS: Qualcomm SoC: Match reserved-memory bindings

 MAINTAINERS                        |  2 +-
 drivers/edac/qcom_edac.c           |  8 +++++---
 drivers/firmware/qcom/qcom_scm.c   | 17 ++++++++++++++---
 drivers/rpmsg/qcom_glink_native.c  | 10 +++++++---
 drivers/soc/qcom/llcc-qcom.c       |  3 +++
 drivers/soc/qcom/pmic_glink.c      | 25 ++++++++++++++++++++++---
 drivers/soc/qcom/socinfo.c         |  8 +++++++-
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 8 files changed, 61 insertions(+), 14 deletions(-)

