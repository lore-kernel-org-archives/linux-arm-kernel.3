Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24F7D232E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY9NaayU89CoKZv/Al0hXplZdNKRptCSq4jtA5Ipmq8=; b=ozinAP0Qj2hAYoPJYUkLMjy50f
	SRVLBGUFQmqxkKijNvV87IWZ54T8NzOVwEtPJPqmad8RhPKZClNklwboOVn5drq5tNmWL3rq6nxWa
	xlSKEqSgSWi579U7mNFbzqQiOWqFyGJIMEjSI2VvNA3yT7Lx09G+v4f7H8x2X7Ux1KNvQqdvyMthx
	nY6USirhK9XLTMystqOL+Lt0V3F/rV3cukg3bKvcgvDVXGVNkQzWfjdtcGUoZx6PtYi+gg+uXYgIs
	xxh8CN9ubTfaZKdgu4tiOHonqjr96AQkcYEfbVMdQX3ODBwQ6XBj6WjeEWUqNpb/5ykvb9qvN2J2n
	5NXzdkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7RA-00000001oPy-3CLb;
	Fri, 09 Jan 2026 08:01:36 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7R7-00000001oMg-2n0r;
	Fri, 09 Jan 2026 08:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=TY
	9NaayU89CoKZv/Al0hXplZdNKRptCSq4jtA5Ipmq8=; b=cp6MUwpTTQje8UEuVi
	wo8BYefyGRDytrHbfBBctcyRQJcYuMO9HD/Rc0Afhcvowgwrl2CtUg8HOk7M19c9
	YTjgMiorEgFTJ9rEVPFdkTuEdnuBSN91esvdYmP3p2TIuYt2H4wgftsPoORtVhPJ
	x/LPZwJtpP22Sm3qsezDx7Eew=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnzlW4tWBpx1iBFA--.64397S5;
	Fri, 09 Jan 2026 16:01:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	dmitry.baryshkov@oss.qualcomm.com
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	hjc@rock-chips.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 3/5] drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
Date: Fri,  9 Jan 2026 16:00:46 +0800
Message-ID: <20260109080054.228671-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109080054.228671-1-andyshrk@163.com>
References: <20260109080054.228671-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzlW4tWBpx1iBFA--.64397S5
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFyxAry7Ar47tr4Duw45KFg_yoW8Jr4xpF
	srGF1rtry8Jw4I9FyfAF18AF98ta4kGFWxu3yjgw40kw1xKF109FnIy3y3tr1UZa4xWw1f
	JwsxZ3yakas29F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jddbbUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QAQbmlgtcD1-QAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_000134_232056_6771E7CF 
X-CRM114-Status: GOOD (  10.16  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The i2s/spdif clk are mandatory for rk3588, but not used
for the upcoming rk3576, so make it optional here.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index eccf6299bdb7..93e3efe18957 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2014,13 +2014,13 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		return ERR_CAST(dp->aux_clk);
 	}
 
-	dp->i2s_clk = devm_clk_get(dev, "i2s");
+	dp->i2s_clk = devm_clk_get_optional(dev, "i2s");
 	if (IS_ERR(dp->i2s_clk)) {
 		dev_err_probe(dev, PTR_ERR(dp->i2s_clk), "failed to get i2s clock\n");
 		return ERR_CAST(dp->i2s_clk);
 	}
 
-	dp->spdif_clk = devm_clk_get(dev, "spdif");
+	dp->spdif_clk = devm_clk_get_optional(dev, "spdif");
 	if (IS_ERR(dp->spdif_clk)) {
 		dev_err_probe(dev, PTR_ERR(dp->spdif_clk), "failed to get spdif clock\n");
 		return ERR_CAST(dp->spdif_clk);
-- 
2.43.0


