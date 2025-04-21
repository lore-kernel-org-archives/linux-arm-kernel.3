Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hvgOCveyWcT55hGDFl+zrCOGaTfBGCvJmO/UgmwljUs=; b=uHx8Jx0vLZsWuNfq/uzQdsHZrn
	twbcj2GDDEFuF6tcAbiVMhMvrTMEqrQRP1gKJIxBb0Ki5ljFIGnAKkM2i+udyuozIX3z4GV7tRLZv
	QASuWw1CsULqxBy6I30v3v3LCZMrCmIrTYrxnKzApI+Wtcc0MLsMFTE473p2anw4eJXuwa94b6L9y
	s3s7z2B6dzrC7eLM8KihzhjeHroF+VGbZv8NAD4ghLinPSeSCm35IhfxiL5E/bb8yOt8/4JuewGKA
	K5+jefGpsrYKtB+GBUKWEXHruJ5ATlyn+n9zFox+nHVr0uMCx/1UKwBIAXy/U+OZxiWkIreFDaAnu
	zqvfEIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sfg-00000004WfL-2SqV;
	Mon, 21 Apr 2025 15:02:56 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sdm-00000004WQl-2gbL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:01:01 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdduVHlN; Mon, 21 Apr 2025 17:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247650;
	bh=hvgOCveyWcT55hGDFl+zrCOGaTfBGCvJmO/UgmwljUs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=q5p6dxjk2V6jat3S3UlHHttbHBSbf5NzhkhIZN57kY6EzNUXND4oIwlpFB6+NJvGT
	 u60Xyncyaf2A1rpKbZ1thHxRiw7eISNDs1kclTQ0X31UpPbyjUkPewpMj72y9jsTlZ
	 0dxSsn4WU851rfsn6MU/Gc0mOe/BW4tuTg0bO7RRCBYGUYhhG4EdORoU3z75GDYhQG
	 E3452sANXI5aju5lIM+W5lTBGS/j7ofBkQhPEPE92W8UgHB5bVESMhR6/sqooF2Ght
	 qLljc7U6i9MY0GlW7hRqWGu0WqfDObCvsphraL3jzl9+0wZkD264S4e8WrId+8QKaQ
	 JCtAX25CnAA+w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:00:50 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	m.szyprowski@samsung.com,
	ideal.song@samsung.com,
	beomho.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/3] mfd: exynos-lpass: Fix some error handling paths
Date: Mon, 21 Apr 2025 17:00:32 +0200
Message-ID: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_080059_081973_B79BBD34 
X-CRM114-Status: UNSURE (   8.17  )
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

This serie fixes several issues related to error handling paths in
drivers/mfd/exynos-lpass.c.

I've split it in 3 patches to ease review, but it could be merge in only
1 patch if preferred.

Patch 1: Fix a leak in the error handling path of the probe. It should
be straighforward. This patch is already R-b.

Patch 2: Slighly unsure of the order of the code. In the probe, we
enable pm, then lpass, so should we disable lpass, then pm?
This patch is already R-b.

Patch 3: Fix a leak in the error handling path of the probe. It should
be straighforward. This replaces patch 3 and 4 of the v1.


All these patches are compile tested only.

Christophe JAILLET (3):
  mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
  mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in
    exynos_lpass_remove()
  mfd: exynos-lpass: Fix another error handling path in
    exynos_lpass_probe()

 drivers/mfd/exynos-lpass.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

-- 
2.49.0


