Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0876EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvnMc/BqFyXtWd3kydBRw6WznkhMsheiUWEV9yI10UU=; b=K5rpmic1SyQDBlGuKepuVzRd9m
	+R4SeRVLzP2eZcfpTew3mvTJY3yZYyZGSUwBLXfvdyITByOQKfYrM3f9/aPH1uPAM1QFBfZTSFxfQ
	EW3//aH3ZFx8/iT4Yl+xoS6Y7Gp0PgBorVgJErTvHA9xDjZUrutZpgLgxI9GWwrcYyhRtDLHROIyp
	Nu06qFN/KYZ7CggE+PIhe5oNVq7ZLCUi1ZFOZ7LxnX+hS/byT011vrDy/Ea+AC1Vi+KVKFOyIPOcd
	kOct3UMSZQFUuhyfeimis0Dr0oyMF5X8snSfRVnqetNp1jyXa2eN9XztNvZH5sitExUnXY+HMTXto
	GWGsc+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETGa-00000009ZGd-3fcV;
	Mon, 12 May 2025 13:32:24 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESZA-00000009QiL-0Tvy;
	Mon, 12 May 2025 12:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jv
	nMc/BqFyXtWd3kydBRw6WznkhMsheiUWEV9yI10UU=; b=S9h0zUC7pYvZzdrV/b
	ZLDqwd7iXMmoe+IioQ+LrDFvB6q1Ez42dFbON5cLhQYqMfQsxlyS++Q6h3uXAVOx
	cWeJwLXQHCSaSVY+9tmPRCu2/Ek6lzzCCTVc0sEKpdzCgEOat5//GPEIvQzrjJGk
	BF9AmsrNAZv5T6OG7wjbKnd6A=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S6;
	Mon, 12 May 2025 20:46:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 04/10] drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to inno_hdmi_init_hw
Date: Mon, 12 May 2025 20:46:05 +0800
Message-ID: <20250512124615.2848731-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1xGF17Ww1fAry7CF45KFg_yoW8JF43pa
	yUCryUCF4fGa1jqF1UAF4kCr4ayas7KayxurWxWw1Skwn09r9YyFnYyw4Sva43AryxZ3Z2
	yFs7Ga45ZFy2yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8zV8UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAFLXmgh6hVMrAAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054732_484856_7195FBA5 
X-CRM114-Status: GOOD (  10.46  )
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

This function not only configure hardware reset register, but also
do some other configurations. Therefore, it is more appropriate to
name it inno_hdmi_init_hw, which will also facilitate the addition
of other functions to this function in the following patch.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 7b4c952f26922..2d41cf59752f2 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -604,7 +604,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	inno_hdmi_sys_power(hdmi, true);
 };
 
-static void inno_hdmi_reset(struct inno_hdmi *hdmi)
+static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 {
 	u32 val;
 	u32 msk;
@@ -1290,7 +1290,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk;
 	}
 
-	inno_hdmi_reset(hdmi);
+	inno_hdmi_init_hw(hdmi);
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->ddc)) {
-- 
2.43.0


