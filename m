Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LRG0jHcVlijLslM+LJD/Jnii6JM0NbQiCR69GjeZ8mg=; b=gbtEM8SAI/cmmuLPjRXZ62S9LY
	65rnlLanSA5oUM1uDk11qiaJAsTBUB2lzTkd1X3/P27FC+i2qiPEtIiJQUU8syJ+3cbkX4CVZZ/Ie
	Exy26ID/Rg9AUClJ3sqMFkmQJnSoAPgBOoNld9XjsuPgoGmhwFgSxRrox4jqy5jd5/Cc5dH9mGnjD
	gkScEAAVWVDW+DIT5Su5v+NEFqoFL8aLrR7sZEfX4FmVGTdgnQGfbqcFhSZw/861JVYf4cuDyiijH
	iASO4cmqQlRksEZ1BKwOvcpa28J09m0Xqul2uJY3Cr/fpcqYc4LWouglT7rLWQ6LfzX29vKlceAFO
	mhafhZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQv9-0000000Es83-2C1S;
	Sat, 29 Mar 2025 07:47:59 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQtO-0000000Es0e-0YTN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 07:46:13 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtDteVKf; Sat, 29 Mar 2025 08:46:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234361;
	bh=LRG0jHcVlijLslM+LJD/Jnii6JM0NbQiCR69GjeZ8mg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gy4O+eYwmJf9m3g7OtbpyC6UcHKkCQR4bB/LtTj48AIu+zl4DBhclguesg3S/JgCw
	 hUSmuc2k9UrmFGIV0MuEXVOf1DgbAoY3I5qkcD4TJgBwew6gCAS4dFdI0JHrb1EQ7o
	 FVep+OfD2SKaeN5Kq5Ulk1gnD57ZRrKM1fGiPucQqLxZwGD8JgwAU91JK6RSydbSkP
	 vmnFVB4AuwKVgeB153oeaYhj+Mbfx2VIH9I8ZY+kHczuLfsrGeBhcpbkSuDv/t8Fcw
	 gknMYgJewt1OTViCw7LLmQcik+IEbfA2LIKI3teQe1BOf2irs/3y+QSgIkyrIJTruR
	 2T3dbBYQH0Zlg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:01 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	beomho.seo@samsung.com,
	ideal.song@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] mfd: exynos-lpass: Fix some error handling paths
Date: Sat, 29 Mar 2025 08:45:44 +0100
Message-ID: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_004610_580172_B55EAA8B 
X-CRM114-Status: UNSURE (   7.21  )
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

I've split it in 4 patches to ease review, but could be merge in only
1 patch. Or only (3 and 4) could be merged, as they are related.

Patch 1: Fix a leak in the error handling path of the probe. It Should
be straighforward.

Patch 2: Slighly unsure of the order of the code. In the probe, we
enable pm, then lpass, so should we disable lpass, then pm?

Patch 3: Is just a preparation for patch 4. It makes patch 4 more
readable.

Patch 4: Fix a leak in the error handling path of the probe. It Should
be straighforward.


All these patches are compile tested only.

Christophe JAILLET (4):
  mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
  mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in
    exynos_lpass_remove()
  mfd: exynos-lpass: Move exynos_lpass_remove()
  mfd: exynos-lpass: Fix another error handling path in
    exynos_lpass_probe()

 drivers/mfd/exynos-lpass.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

-- 
2.49.0


