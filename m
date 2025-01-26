Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuW7Yn0XhiiplhFgWf9bIMg43dROm/0aPtGAEi3q+vY=; b=38iQaZ/mZACyuQqW8BCTTI/ZEt
	+gHkmAKjytr2ityNcOIMBJeEaP17k7izgOyXex644DnHSq84zrcFlnr5At+38C2NYHdLgmViWqA0V
	ctkbVJg9MhE7oVpXbdqquOACvQ4pa+UFazhN98UiJ6IXEoc1k8e/TDwNhCxiV0ObqO6DM2henas5l
	bnPgdLq/EwelCvBNYUwKWxKst+Rkp9CUDxPWlfvM46v+i/LJvG4mccQ8LM0kGUKtE/pj6teHeTJlK
	2ctffyCGrJz7F7nQsNx7fa6NFW669p1p2g7sZyhEPoPoV2bRkbpTGBZqS/ndDA2VFhWWSwibeMV0W
	otdK5IPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc44I-0000000HWFy-3gFg;
	Sun, 26 Jan 2025 14:56:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc430-0000000HViw-29YB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 14:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD6D65C4371;
	Sun, 26 Jan 2025 14:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC02C4CED3;
	Sun, 26 Jan 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903337;
	bh=fyiEmA/jTVf27Oj64YW7GKYpRdBIwjXLXoZQuJA4XOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d65Xl5BClaoN0OfHrCvp0yR+SaHMxXr5BzwgKLnilD2eXZNWOgaj5/xsfEnSquWIj
	 uVFiLXochCNC/NgUKreUJPm4wIHXJgg71iX2aBRjATKaP6dJgtjsOJzAf57udt0xs5
	 Pfe8OB5xqpw8wWR2+ResKVZCGs1qpkawLhuxUGOkHOxiC3b104al2zVu443sRkWMy4
	 x8LEqgBXKEL3EvcE2+ezEG0Kyi+8li3ogyPaqcPVBZLehiFx9EaxxKJhrAOrutT/rd
	 YTxcLSSadsEVLS/WAnS+IOcyg7miArrt5JCblNM93XmB66a1hR+Xf6NrxMbIAx/rPQ
	 7oQijtw8TiKdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	krzk@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 16/31] drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
Date: Sun, 26 Jan 2025 09:54:32 -0500
Message-Id: <20250126145448.930220-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_065538_602889_331B2729 
X-CRM114-Status: GOOD (  10.02  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 5e8436d334ed7f6785416447c50b42077c6503e0 ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-5-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1e26cd4f83479..52059cfff4f0b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1643,7 +1643,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }
-- 
2.39.5


