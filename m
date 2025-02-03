Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ABDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4RW7wPwnDi9zh7D6GcYhtVCuTnZH4hKx3lfJ5wLonB8=; b=2cJzA4REYMrLwc
	JEPPUz9GaCvLVHcOmj2YsK0vdQJhUwfZEasGSc4xF/djcdXIlHHuSw1OJ5mDk0Ox5JnckvL5HJCBz
	py96+oSOcLsr7313w+RR72YtY1fp0Yl+zWd3vMBN8asn956yZzCR2CtwMS47t2k9ibdblvV4PjXOv
	zvowLCXc/RNKtJXWo1y0nD6UXJlIKx4NY2yCojQLwuF7s614ivvbBIhv7vpR6ndfKQ2bNZlflzxDi
	i0X3N7P+RyszA/QjzUvSqtHCZyIq0v4id9Tk0lISxwBnvTWclYT/c+UDr+1V+kbyiRfGKEEMBW2H9
	udOE5jXLRYPWje+IK59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Ge-0000000GZEU-2N5i;
	Mon, 03 Feb 2025 20:42:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf39X-0000000GXe2-2Anf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:34:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E7CC925B82;
	Mon,  3 Feb 2025 21:34:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQNzOzCoF0iC; Mon,  3 Feb 2025 21:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614873; bh=EAeSZsEDX1ib5/p7yERGJrswm+LH1jqXTbhe1wcXYGA=;
	h=From:Subject:Date:To:Cc;
	b=mUHZTKxEiWUANeZOoCR0aFcxv3cj3LwtJpd+uY0biVNj/UOnJCh3E3zyHkWCVlFS2
	 /ytK3ZgYiD2Q9pWq8/BctGn/Xt4g+CtvpPXladyjbG3BQ9RVN/jyjNKjZQvAKFReXQ
	 4cwQmGdTOJYmbFp/ycrfwxb6IcsY3wOuvK0kj6umrY59RcsS6623ZPtSX4J5zxizyi
	 GSr8aLiHTcOQhK59zk+o5+e5ZtL3OL5VC8HO4tLUDo97QbetBc8RNi1Xjseo4Ie38t
	 gJIRcPtB1ktzGxRHxj5W+bUTNjT2pDOLsaJpuS7veSOLDzi7vzsFNCh87J7h2DzvPn
	 pOl+n+q2FNAhA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Introduce DW MMC support for Exynos7870
Date: Tue, 04 Feb 2025 02:04:15 +0530
Message-Id: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcooWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPd3NxkXXPTpMRkUwvjZAszEyWgpoKi1LTMCrC
 B0bG1tQA3JSOmYAAAAA==
X-Change-ID: 20250203-exynos7870-mmc-75bac583c864
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614863; l=1084;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=EAeSZsEDX1ib5/p7yERGJrswm+LH1jqXTbhe1wcXYGA=;
 b=qiCPbp+pIGYnk5pDS2RAVULHu3jjnGqOrQmXwc6zupEtRps4CoZ7nndf2E0DtDP8mWnWtIIlf
 iy01GG24f1MC1WZM0dPSEjWVNI3cxhTcMZNcd01jIK/I9cyyryX0Jzj
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123443_694271_BF9A38A2 
X-CRM114-Status: UNSURE (   9.49  )
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

This series adds support for SMU and non-SMU variants of Exynos7870 DW
MMC controllers.

Some DW MMC controllers require two 32-bit r/w from a 64-bit FIFO,
the series implements that feature as well.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (1):
      dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support

Sergey Lisov (2):
      mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
      mmc: dw_mmc: add exynos7870 DW MMC support

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |  2 +
 drivers/mmc/host/dw_mmc-exynos.c                   | 41 +++++++++-
 drivers/mmc/host/dw_mmc.c                          | 94 +++++++++++++++++++++-
 drivers/mmc/host/dw_mmc.h                          | 27 +++++++
 4 files changed, 161 insertions(+), 3 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-mmc-75bac583c864

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


