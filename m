Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC95C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 23:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1fny0bMdrHzrb/Y/AQziUWSkRiiitvwLoZ2sKa9vaw=; b=PurYtNw3WCncmtDqo2ru9O+tFW
	1ZmGtXNczDqAgDXKZ00VuMMaRfR4qzCrAsO4ryr5ng0tTZNRL4YltVyqT0EtrsmfeAxFSLshebJLS
	bbFLd6Ce6wtb/CLYu0oFM+OpycvgfJj5d8aMXoNEy+hO8OJ30JYEUsecofhFsuTIK4ADMnyZBTVsu
	5pp39iD31aOFPZB9TiAS9Os8mysIrUAxK+BtCpJoi8MJrAObQJeEP0PCzTEweW+eRV2otPCFgV9T2
	LorDkRYmjneXIZEjza5oHGcqmxqLKlSqsZc7GZzlVPK96rVwNB/pLkIoYNx3Uvi+GzxD7+CwqUMVN
	kWliMMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Y9E-0000000DXz1-3Yo6;
	Tue, 01 Sep 2026 23:44:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Y9C-0000000DXxQ-3jjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 23:44:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d7200b2e15so4243285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788306249; x=1788911049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1fny0bMdrHzrb/Y/AQziUWSkRiiitvwLoZ2sKa9vaw=;
        b=c6ZJZ8lCZ7oKFjsKX+Kwp+a4P4iw4HqMzw7ysj5pjQmDBoAA76IvRXyu4jEBSRGPxU
         dXwbXCAiN9iIrxaAQ22Pg1xzU5FSgYg78iPf18huQyy16DF7DaupHT784ejo4D8Rxxlv
         fcd6l+tZy+6lMVEac0HQ7CG7mcYRwnryfIAEbyzBTbgpsnBnQ0CUByXnPMN3VIiN/uhL
         UKydxeaEhpIa6XbmRorfhtGIz5IJBrFvMfPI3yxvp0QxkmRV27Ln8rkOmw5h36HhT/L4
         T6fngfn5Q5yD7k0J2jaXndFOVN7LE24MTb3dzlveb7sb8+5ZQSTCuUi+Q19uWCp82TSQ
         jZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788306249; x=1788911049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1fny0bMdrHzrb/Y/AQziUWSkRiiitvwLoZ2sKa9vaw=;
        b=Io+UsyQiHxI2mFnsp4HRsDnzDr79APQ69HieXOvQtRVUy+u0gZ/B4QAtFk/XS7V/yi
         e1uI2dYc30DNaaak48E+maPCdTwo/2ke2V0PB9W2hEp/SrShpWqb25blGkjRNLX8lSb2
         FPBNoOahtjQP64tKao0V57BYf6UOcO1p1nNT5eLt4de1ucwtgKU9CnYUtcil2JQEbycj
         M8cb8BoDnW3yqwB5eIb36sWBkWw8Qg8cAZbrKhLqJbrtlrTVyNLowa/646BuLdBi8HNl
         lc+PGZSODx0tdPOanlg/0qOtefT52zJVYHOtnAczaJr4uIJm0bJydV2Pk+s4knokQm5m
         vmSw==
X-Forwarded-Encrypted: i=1; AKwUvByebj2KDo37FHTb16xZ/I0nxNW8l3rS+G9A+Xq3jd1dSjDUBdmkQc3u/zjediijK0ZPKxZMdvKg7IE0o9B9KWhS@lists.infradead.org
X-Gm-Message-State: AFuF++nWc+IsqVbX6sx3egbLEs7902eYZy8PVeYYb69J2Oj9BUyRjkwn
	VYItACcvgi1hX0nmklb+D+C727AxOYdVib+ySrRVTN7fzP+Ze2TqEJDQ
X-Gm-Gg: AYBFou25H/ZNGXcmXCf545qmvsOGubiWNYPqUyh8bXf9c/0WpxKSU1DThu15X7b4+Zq
	xAEVw6BHQmSWdjdnM38zVq9+ZyNcbat9IEVWeocIpPJc55cpTAvIWIcwrAH8Ohbso+hLsQfO8/Q
	UiqxCy6BIpim1sFkwg54sFO0SQS0UTy7kiOAI4UFNc8Z1j3FvZ9isfKZN/Sj1ydhRinfRAl3hvG
	iTKl067DXsLl3ykA0d2pBeRkpqqjIcbfUBXk32J5zKUvzX1HsBeN8OaNH5b8clepxqjwr0yFz7A
	rKB9QkBW7iNTojRzE4JQM/6vpebqsCvzHoekKLXQSRF/muO/T69jou6Bv3N9c0TbibvOd2GwUFe
	4BuvtiEbWriLXTn8fxR/u1QDMFzYJNqwN223g/NmnQUIqAWeknBGRzgld0PIDsex5/XVy7gA3d9
	dLUm8pOx36excvD0VrHPy7Iop9OG5Q0NsXxi4AaTd1mQl+8hb4A2TxuLtf319hmDVOMJPzJ74gG
	HgZsK3KXJ+kWYhJB0PUFY9ogQ==
X-Received: by 2002:a17:90b:3d81:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39aedf5d923mr868098a91.4.1788306249089;
        Tue, 01 Sep 2026 16:44:09 -0700 (PDT)
Received: from anarsoul-xps15.lan (d50-92-231-36.bchsia.telus.net. [50.92.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm8299903a91.0.2026.09.01.16.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:44:08 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
Date: Tue,  1 Sep 2026 16:42:30 -0700
Message-ID: <20260901234351.190506-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_164410_921406_97967142 
X-CRM114-Status: GOOD (  11.83  )
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

85.5 MHz is the pixel clock of the standard DMT 1366x768@60 mode,
which is the native mode of many cheap HDMI panels.

Use a 1368 MHz VCO (24 MHz * 57, already used by the existing
1368 MHz entry) with postdiv1 = postdiv2 = 4 to hit 85.5 MHz
exactly in integer mode.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index c2b243d7a5e2..db241d2df625 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_rates[] = {
 	RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
+	RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  74250000, 2, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  65000000, 1, 65, 6, 4, 1, 0),
 	RK3036_PLL_RATE(  54000000, 1, 54, 6, 4, 1, 0),
-- 
2.55.0


