Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2FFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvFxDkgIfF4tDBD9QKpFN4dgXBjYLgU2XHjl6k+8r/M=; b=usvnuxezpbbmJu/FyEPNJKxwuF
	h6Dlv/5/x4DfWq44zNHy4HZheKS4EuXHWesrhkZqt/wB+jF044UvL7V+eqzQdhyY9vPiih/1+/es8
	mzmciPFKwxTzBHmPmakY0PV4z3nedbpml44vL0Vog5nMsH/4HwufzpO5J4IKFcXl+UFIXQG1q/KaD
	9TFPg7rEmP7cbwABGP8qHrVg/OPaHBcDwgxqimPBI5DFsmpg+GLKxmBQEU0EcD4xTN+jGgPEAdUv9
	rnBpKuQoFsPdrhNY2nhu6t6i3m+yw/xYOuY57HCSu/jUGe/VlZtgIu7vvtXqZmbg4KAn9rUY5uc8E
	3WbxBhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHb-00000003K7s-1jMF;
	Wed, 05 Aug 2026 06:39:19 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHY-00000003K5Z-3OCG;
	Wed, 05 Aug 2026 06:39:18 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 0336913802B4;
	Wed,  5 Aug 2026 02:39:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 02:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785911955; x=
	1785915555; bh=VvFxDkgIfF4tDBD9QKpFN4dgXBjYLgU2XHjl6k+8r/M=; b=1
	6cugPLFW7W4eS89OunA3ETSoSSEyuaQxMnLLmZe9zeIoR2YCIda7gafonWDaxrcR
	7We+iBX2pOUOYwHMeuNUkQrm+x1yqxZ8RMeL5WRBW+UG53j7bAV3SCdm+99I/p9C
	OF+nF2GZwXLWO8qPYEd/t7ZUQf398Q6T8o8KH3P7yI+iVsYSSa8tf0NjLZQShn+A
	gpDxUQmAbgjgdKF0JP5VT/as/KNRhIXa86dHREIapmXVWi9Z3QVve2+sXhh3rMSB
	kihuB/jSTSQyZkzpu77pwWLVVYt1Emx7GPiAT4FjCxKuGTDOQ2qym8Rp65/jaty/
	+oQmbiLSgK2Qvj7u5O1mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785911955; x=1785915555; bh=V
	vFxDkgIfF4tDBD9QKpFN4dgXBjYLgU2XHjl6k+8r/M=; b=fLcTLMQ8mdbDwiwh4
	QH6wCEqCkVouhbHQrlk8YfxTxgXAgn6Do3oINYqmPVAHtRwwTexLpN0FYckzeZJh
	tlub/gfRcayO1sSJEriHi0Hl+m8df9ALwNjoEo9hy7R6E/VEPMezMjI0kbu+RTxy
	q/haUFv00v/+lgz/6ZPpDHr0XH0bwqgDrA4nie5kpgOFa9eGXAC2OqS6sisozJm7
	rMxUWMumoW/4QjgFy2lthfck4OVH7MstJuks4LTgnx4YdGvrpRDVWnb1qXNByLdT
	NiBXbjLBa3tYzLU84ji61OhtyGFMzeFXqGCUX8INOT/xkUyyf0H4nvIXO6Gt4kx/
	JDfFA==
X-ME-Sender: <xms:k9pyajfsKS1lc7hWRC9zBIe21S-05lVoAKI_UJjgCXRWIF_tqei-Ew>
    <xme:k9pyatJE8Sc1O5ndvUuuYkEfKNJy09sTOgOIvRSuL9ddE698wEvr3WizvzN1nkdl7
    bucqIGsIiFkQPRqb00YWl9OGZUxOmY38dQt6qdM6YfqzSJjMcmUPK8>
X-ME-Received: <xmr:k9pyalA55JtlVO0V7VFQiObWnWc-EzO6EVi-Ll4uu-NBvKdGTn5P_IfrYHzUdb56ZQ0gmNfRCA>
X-ME-Proxy-Cause: dmFkZTGweWZ3oVrdbXXe5zNbY/1qm1pdBIKLQOv4wqtwxzIaCfusFJaUYDgRMW01OwQqmB
    PNcsOh6d5VtSN0ib3zlEWexayeHywWIm1PgtBDTmi1jqIXlJ4epZiRyRlOvRuTP/H94+Wk
    lk56ToFXuoLAF80uX/ZVFpHBbYL9/inXConVeGj5fP4oIjygHxURzt/8P2LkmOCZkpV/Kj
    p0I4ZXMhB3Hn7OHdNdqEICLLcaUpxq7aYzGqf1zEXgoEoToiw/A8MuK/o9jyR6a8MALeRg
    Lewa3lXhOyvgeH3GuUZQ4nFdlSaJtvfszCwH+l3e0Qw7QgR2O5+vsW0n/AqGh0ClOQOjOv
    Oqr2G+3Qi5RZnsaOhtbTbI+LkLF4uoOvVUyvEcU1+by3F2VQbaGfsLvV28SMkrNE6rBc6y
    gJPFZlBrgzQ5w+m03NdolNjV0pDNmXIKCjWw643lubTPb+u9aM0h4XiFPe2+nWGugnnvW2
    fa4BKs4nrhou5PRVZ0hrD1aW1tOubEDJy1SIlnrL9rztVK+oaQyMvJExFqotmk93U5nZs+
    h0HU6D2F5ylHOlJNyeMxPjT/jnvXldhH8nBTup0K018qg3iuBjYdm31tlL/ocik1j6TGrz
    sk8p4hPGz3K9NzYNTeicQSXl61Q5FtuXdqDZcKjzMUi6gqVxSrp1Q09Cd7XQ
X-ME-Proxy: <xmx:k9pyauhXRhPm_KjtwlFEYkfNuL2HK9ZSclC7APd-kmUSZHj-MM3aFg>
    <xmx:k9pyanMwlnCW57As1HltYf-bmldE27SMJ2slqxwNxjHtYuaGkwwVrw>
    <xmx:k9pyatYEx0JzonX5QsuuJFa2nrkIJIq6bOlRycd1ieQhGyEle5X2uA>
    <xmx:k9pyak95TpYnax-iWhutZzjszfX-rV8w-2Lot0DI5OGKqIOv8KMgTA>
    <xmx:k9pyajF3hJLGtAwaqVbkvGk_un5LFBubDhAqKghy5yqLn2gMfkXUtmwT>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:39:08 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v5 v5 4/8] pmdomain/rockchip: add optional per-domain power-on settle delay
Date: Wed,  5 Aug 2026 18:38:22 +1200
Message-ID: <20260805063826.95682-5-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063826.95682-1-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_233916_914647_B94BC18D 
X-CRM114-Status: GOOD (  14.67  )
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

The RK3576 NPU domains need a short settle time after the idle request
is released before the QoS registers behind the domain answer. Without
it rockchip_pmu_restore_qos() reads back zeroes, and the NPU throws an
async SError on the first cold power-on.

Give rockchip_domain_info an optional delay_us and wait for it between
releasing idle and restoring QoS. Rename DOMAIN_M_O_R_G to
DOMAIN_M_O_R_G_W, since the suffixes name the fields the macro sets and
this one now also carries a wakeup delay; RK3576 is its only user, so
the old spelling is not kept around.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 52 +++++++++++++++-----------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index ba66ae719..e1857f878 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -59,6 +60,7 @@ struct rockchip_domain_info {
 	u32 pwr_offset;
 	u32 mem_offset;
 	u32 req_offset;
+	u32 delay_us;
 };
 
 struct rockchip_pmu_info {
@@ -185,7 +187,7 @@ struct rockchip_pmu {
 	.need_regulator = regulator,			\
 }
 
-#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, g_mask, wakeup)	\
+#define DOMAIN_M_O_R_G_W(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, g_mask, delay, wakeup)	\
 {							\
 	.name = _name,					\
 	.pwr_offset = p_offset,				\
@@ -200,6 +202,7 @@ struct rockchip_pmu {
 	.req_mask = (req),				\
 	.idle_mask = (idle),				\
 	.clk_ungate_mask = (g_mask),			\
+	.delay_us = (delay),				\
 	.ack_mask = (ack),				\
 	.active_wakeup = wakeup,			\
 }
@@ -258,8 +261,8 @@ struct rockchip_pmu {
 #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
 	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
 
-#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, req, idle, g_mask, wakeup)	\
-	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, wakeup)
+#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, req, idle, g_mask, delay, wakeup)	\
+	DOMAIN_M_O_R_G_W(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, delay, wakeup)
 
 /*
  * Dynamic Memory Controller may need to coordinate with us -- see
@@ -681,6 +684,10 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (ret < 0)
 			goto out;
 
+		/* Some domains need to settle before the QoS registers answer. */
+		if (pd->info->delay_us)
+			udelay(pd->info->delay_us);
+
 		rockchip_pmu_restore_qos(pd);
 	}
 
@@ -1300,25 +1307,26 @@ static const struct rockchip_domain_info rk3568_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3576_pm_domains[] = {
-	[RK3576_PD_NPU]		= DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       false),
-	[RK3576_PD_NVM]		= DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
-	[RK3576_PD_SDGMAC]	= DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     false),
-	[RK3576_PD_AUDIO]	= DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  false),
-	[RK3576_PD_PHP]		= DOMAIN_RK3576("php",    0x0, BIT(9),  0,      BIT(9),  0x0, BIT(15), BIT(15), BIT(15), false),
-	[RK3576_PD_SUBPHP]	= DOMAIN_RK3576("subphp", 0x0, BIT(10), 0,      BIT(10), 0x0, 0,       0,       0,       false),
-	[RK3576_PD_VOP]		= DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
-	[RK3576_PD_VO1]		= DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
-	[RK3576_PD_VO0]		= DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
-	[RK3576_PD_USB]		= DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
-	[RK3576_PD_VI]		= DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
-	[RK3576_PD_VEPU0]	= DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
-	[RK3576_PD_VEPU1]	= DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
-	[RK3576_PD_VDEC]	= DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
-	[RK3576_PD_VPU]		= DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
-	[RK3576_PD_NPUTOP]	= DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
-	[RK3576_PD_NPU0]	= DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
-	[RK3576_PD_NPU1]	= DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
-	[RK3576_PD_GPU]		= DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
+	/*                                            name    p_offset pwr      status  r_status r_offset req      idle     g_mask   delay wakeup */
+	[RK3576_PD_NPU]		= DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       0,    false),
+	[RK3576_PD_NVM]		= DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  0,    false),
+	[RK3576_PD_SDGMAC]	= DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     0,    false),
+	[RK3576_PD_AUDIO]	= DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  0,    false),
+	[RK3576_PD_PHP]		= DOMAIN_RK3576("php",    0x0, BIT(9),  0,      BIT(9),  0x0, BIT(15), BIT(15), BIT(15), 0,    false),
+	[RK3576_PD_SUBPHP]	= DOMAIN_RK3576("subphp", 0x0, BIT(10), 0,      BIT(10), 0x0, 0,       0,       0,       0,    false),
+	[RK3576_PD_VOP]		= DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  0,    false),
+	[RK3576_PD_VO1]		= DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  0,    false),
+	[RK3576_PD_VO0]		= DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  0,    false),
+	[RK3576_PD_USB]		= DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  0,    true),
+	[RK3576_PD_VI]		= DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  0,    false),
+	[RK3576_PD_VEPU0]	= DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   0,    false),
+	[RK3576_PD_VEPU1]	= DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  0,    false),
+	[RK3576_PD_VDEC]	= DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  0,    false),
+	[RK3576_PD_VPU]		= DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  0,    false),
+	[RK3576_PD_NPUTOP]	= DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    15,   false),
+	[RK3576_PD_NPU0]	= DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    15,   false),
+	[RK3576_PD_NPU1]	= DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    15,   false),
+	[RK3576_PD_GPU]		= DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  0,    false),
 };
 
 static const struct rockchip_domain_info rk3588_pm_domains[] = {
-- 
2.43.0


