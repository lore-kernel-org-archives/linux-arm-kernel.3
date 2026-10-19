Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D9ACCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfeZqw7NZJjLRl3ovl98t0n86LAuwzeACkZn154DHgk=; b=zeewiCjD97XC2M0r+Mjg4u7XnB
	XpXtCSEWJy3qcbcGtLa1Jh7FFT5hSVwrcs5XBX569Bu0uIf6MPEAWFsjD0nFM4o4xHncfPhmxb+6w
	B4FMrTkpKJJFoQulyIHybj+5TKxLATz1eacSe1r2nFv+zyN5Erps7y5D3kppngRSiQwo6wZCh/16K
	g0Inr3hT2lvnypAhCO3HIqfWXnWyPK3GXK2ief/uGSnm9XMq+DwOboWohOT/lv7n52bSNz4WY2Jq4
	XgA7APU/q+bCwdWE5Bb0B9+sHCF0gzp+cFD0KC9lv++pndIwGyJONEiDyw3F6SOEXUGB6+fUciKK/
	ofqYB8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjbr-00000006zHg-3ONM;
	Mon, 19 Oct 2026 09:24:47 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjbZ-00000006zBS-3CV0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:24:42 +0000
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 3FB8E61102
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:24:28 +0200 (CEST)
Received: (qmail 17448 invoked by uid 990); 19 Oct 2026 09:24:28 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 19 Oct 2026 11:24:27 +0200
From: Leonard Lausen <leonard@lausen.nl>
To: ulfh@kernel.org,
	heiko@sntech.de
Cc: leonard@lausen.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	detlev.casanova@collabora.com,
	finley.xiao@rock-chips.com,
	zhangqing@rock-chips.com,
	inindev@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	gahing@gahingwoo.com
Subject: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
Date: Mon, 19 Oct 2026 09:24:15 +0000
Message-ID: <20261019092417.391522-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019092417.391522-1-leonard@lausen.nl>
References: <20261019092417.391522-1-leonard@lausen.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: ----
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1) BAYES_HAM(-2.999999) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -4.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=m9KAehMUB+1DMur2GTxJzIouA4jvxC5wCEbnEBzuj3A=;
	b=IUqrjGSbisjnlkEcgi9exvSIFkA1HdkgWmiIxOcv+Q+6gFQRxt664pxX3hJ+S4BbCoUVAepTtr
	1TWxrDxrw4RElf9LzcxWMe5j5ZSsWg36TeT/bJM7cctDSIvao0BZ1wW3tf1F2Wb+v6ty1MyVQp2T
	jaZf1rCf0Ta9g0Nwa1BnkPpN2PrRHhXMtOIttY1500mgocXyyF+LL/fLU7kphkFq9f9nGQgbaZi/
	sy+IK6WqXY40NjItTS6THQ5HQ164xO+Bw/Hik7nlXzQjvgh1l8QxfHJf8+4TGYo71eIfEEyoUcX5
	66NawJuH33BqBNDrQg2eNsKOUpU1sHQ4F16LyclZfOkbDD1CvAjNJFsoJ4QXVJRAxqdYNvNASfag
	8HWowYNQzIk1Y6gbuyMPabD/Jz0jPqnKDa0e7mNuznZ+c+ayzLZKkbKORLZnhXQ9Z+0FKPDCZZAY
	3JY2UUGWpEF4emClbA2faCQLM8HAPrrY+VhXf7r143LTJpjhM1VQur3BtUCj8bLm+uldV7ZLgBT7
	UDWzKJ/FO/Huq6c4eZN4IAVHjBHUxeJn6Js1QKBw24/vbCOrxnmDnL+UsvHLDUPdY1Vc+6VHrwTd
	wn0mAvcHuLf1J9GdRn+KvWdi74SiCTIxRIXYLDrdcDz4zAPB5MZMJrGPdudg8NG88NpQ765MwCeS
	U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022438_785651_216B1C80 
X-CRM114-Status: GOOD (  12.67  )
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

On the NanoPi M5, boot hangs during Panfrost initialization. Before this
fix, booting required blacklisting Panfrost on the kernel command line.
Loading Panfrost after boot reports a GPU power-domain acknowledgment
timeout:

  failed to get ack on domain 'gpu', val=0x113ff

Add regulator support to the RK3576 domain descriptors and mark the GPU
domain as regulator-dependent. This lets the existing Rockchip
power-domain regulator handling manage the GPU domain supply.

A corresponding domain-supply property is needed in the board DT.

The regulator-capable descriptors are based on the regulator support in
Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
delay changes.

Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwoo.com/
Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
Signed-off-by: Leonard Lausen <leonard@lausen.nl>

---
 drivers/pmdomain/rockchip/pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index e193f978d5f35..b41f9fcb62bfe 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -176,41 +176,42 @@ struct rockchip_pmu {
 	.mem_offset = m_offset,				\
 	.mem_status_mask = (m_status),			\
 	.repair_status_mask = (r_status),		\
 	.req_offset = r_offset,				\
 	.req_w_mask = (req) << 16,			\
 	.req_mask = (req),				\
 	.idle_mask = (idle),				\
 	.ack_mask = (ack),				\
 	.active_wakeup = wakeup,			\
 	.need_regulator = regulator,			\
 }
 
-#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, g_mask, wakeup)	\
+#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, g_mask, wakeup, regulator)	\
 {							\
 	.name = _name,					\
 	.pwr_offset = p_offset,				\
 	.pwr_w_mask = (pwr) << 16,			\
 	.pwr_mask = (pwr),				\
 	.status_mask = (status),			\
 	.mem_offset = m_offset,				\
 	.mem_status_mask = (m_status),			\
 	.repair_status_mask = (r_status),		\
 	.req_offset = r_offset,				\
 	.req_w_mask = (req) << 16,			\
 	.req_mask = (req),				\
 	.idle_mask = (idle),				\
 	.clk_ungate_mask = (g_mask),			\
 	.ack_mask = (ack),				\
 	.active_wakeup = wakeup,			\
+	.need_regulator = regulator,			\
 }
 
 #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator)	\
 {							\
 	.name = _name,				\
 	.pwr_w_mask = (pwr) << 16,			\
 	.pwr_mask = (pwr),				\
 	.status_mask = (status),			\
 	.req_w_mask = (req) << 16,			\
 	.req_mask = (req),				\
 	.idle_mask = (idle),				\
 	.ack_mask = (ack),				\
@@ -250,25 +251,28 @@ struct rockchip_pmu {
 	DOMAIN(name, pwr, status, req, req, req, wakeup)
 
 #define DOMAIN_RK3528(name, pwr, req)		\
 	DOMAIN_M(name, pwr, pwr, req, req, req, false)
 
 #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
 	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
 
 #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
 	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
 
 #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, req, idle, g_mask, wakeup)	\
-	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, wakeup)
+	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, wakeup, false)
+
+#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset, req, idle, g_mask, wakeup)	\
+	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, wakeup, true)
 
 /*
  * Dynamic Memory Controller may need to coordinate with us -- see
  * rockchip_pmu_block().
  *
  * dmc_pmu_mutex protects registration-time races, so DMC driver doesn't try to
  * block() while we're initializing the PMU.
  */
 static DEFINE_MUTEX(dmc_pmu_mutex);
 static struct rockchip_pmu *dmc_pmu;
 
 /*
@@ -1323,25 +1327,25 @@ static const struct rockchip_domain_info rk3576_pm_domains[] = {
 	[RK3576_PD_VOP]		= DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
 	[RK3576_PD_VO1]		= DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
 	[RK3576_PD_VO0]		= DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
 	[RK3576_PD_USB]		= DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
 	[RK3576_PD_VI]		= DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
 	[RK3576_PD_VEPU0]	= DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
 	[RK3576_PD_VEPU1]	= DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
 	[RK3576_PD_VDEC]	= DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
 	[RK3576_PD_VPU]		= DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
 	[RK3576_PD_NPUTOP]	= DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
 	[RK3576_PD_NPU0]	= DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
 	[RK3576_PD_NPU1]	= DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
-	[RK3576_PD_GPU]		= DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
+	[RK3576_PD_GPU]		= DOMAIN_RK3576_R("gpu",  0x4, BIT(9),  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
 };
 
 static const struct rockchip_domain_info rk3588_pm_domains[] = {
 	[RK3588_PD_GPU]		= DOMAIN_RK3588("gpu",     0x0, BIT(0),  0,       0x0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false, true),
 	[RK3588_PD_NPU]		= DOMAIN_RK3588("npu",     0x0, BIT(1),  BIT(1),  0x0, 0,       0,       0x0, 0,       0,       false, true),
 	[RK3588_PD_VCODEC]	= DOMAIN_RK3588("vcodec",  0x0, BIT(2),  BIT(2),  0x0, 0,       0,       0x0, 0,       0,       false, true),
 	[RK3588_PD_NPUTOP]	= DOMAIN_RK3588("nputop",  0x0, BIT(3),  0,       0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false, false),
 	[RK3588_PD_NPU1]	= DOMAIN_RK3588("npu1",    0x0, BIT(4),  0,       0x0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false, false),
 	[RK3588_PD_NPU2]	= DOMAIN_RK3588("npu2",    0x0, BIT(5),  0,       0x0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false, false),
 	[RK3588_PD_VENC0]	= DOMAIN_RK3588("venc0",   0x0, BIT(6),  0,       0x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false, false),
 	[RK3588_PD_VENC1]	= DOMAIN_RK3588("venc1",   0x0, BIT(7),  0,       0x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false, false),
 	[RK3588_PD_RKVDEC0]	= DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),  0,       0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false, false),
-- 
2.47.3


