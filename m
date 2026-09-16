Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDCCC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaJGjAli1e4LWES59GLzQcwkdR0Wt68rNzVT0gxGbU4=; b=IUX4MrdMvpzPFg6nv/gnw+ab1T
	bL2xvOh6MehJ+7MIkswoDbjOlm9IlnIYYHeAZVZ/1H2bvQLEeYsEeFsAXiNghkTEPKSnmDiaUPJAB
	04eRYrJCKEUbgPVmIjvS0cnx5BRmWLP47/cnz9ZhMXp2TYXY6J6de6ZdpjVCqunXnOg7ytl5cpw6J
	rE9QavrjEofc2qGprAEs7ARPUNWD5vhgscwfO1LvWznp6cb7XUfH/5fOH4eNFHeV8evhii3OFFGSW
	NgWv8pKY7QbHj2L48QASkUoujm0VShDff2ZKxlGbRGcD7hpJ/2cTnB06+5AfucliZVLVcIjDjOuIE
	CPQkffVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6u6J-00000009vs4-1l8r;
	Wed, 16 Sep 2026 18:11:19 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6u6G-00000009vrE-1yvi;
	Wed, 16 Sep 2026 18:11:18 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnFUC926pq_UBvCA--.24651S2;
	Thu, 17 Sep 2026 02:11:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/rockchip: dsi: Fix second reference leak in dw_mipi_dsi_rockchip_bind()
Date: Wed, 16 Sep 2026 18:10:42 +0000
Message-Id: <20260916181042.2090801-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnFUC926pq_UBvCA--.24651S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFykXF1kXF1kuF48Xr1DKFg_yoW8XF4xpw
	s8Ja4YgrW8uFnFqrnrArZ8GF4FywnIyay8GFs7J3s2kan5AF1Ut345Wa4kX347JFn7AF1x
	Ar47Ga4rWF4xZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr
	0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1go2UUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAMA2qqpO93ZQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_111116_892675_A5DA92B3 
X-CRM114-Status: UNSURE (   8.50  )
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

dw_mipi_dsi_rockchip_find_second() hands back the dual-DSI partner
device with a reference from of_find_device_by_node().  The bind path
only drops it after a successful master setup; the four early returns
(both/no clock-master, the slave shortcut and a missing slave drvdata)
leave the reference behind.  Drop it on all of them.

Fixes: cf6d100dd238 ("drm/rockchip: dsi: add dual mipi support")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..4ab29410b2c0 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -933,23 +933,27 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 
 		if (master1 && master2) {
 			DRM_DEV_ERROR(dsi->dev, "only one clock-master allowed\n");
+			put_device(second);
 			return -EINVAL;
 		}
 
 		if (!master1 && !master2) {
 			DRM_DEV_ERROR(dsi->dev, "no clock-master defined\n");
+			put_device(second);
 			return -EINVAL;
 		}
 
 		/* we are the slave in dual-DSI */
 		if (!master1) {
 			dsi->is_slave = true;
+			put_device(second);
 			return 0;
 		}
 
 		dsi->slave = dev_get_drvdata(second);
 		if (!dsi->slave) {
 			DRM_DEV_ERROR(dev, "could not get slaves data\n");
+			put_device(second);
 			return -ENODEV;
 		}
 
-- 
2.34.1


