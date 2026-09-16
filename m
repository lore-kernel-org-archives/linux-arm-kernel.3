Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4583DC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOrO+lzOsedSdgTaJ6SomY+EHWnWkwszxQMkizdHQMw=; b=iF0wQaThpwDYfy0RHSpEVGl3Ou
	SqAnc01tHMe0Ajn7Eb0Ki4G/FCUUtnZ9dG5VC/2EekJNbQTkBr6NUQUBl86q2K6bf2pmspDkP9eSP
	HzRTdo0YjUDxrAix3suHTpy5D6SqcjdFTEqLLhMyNSeSKk4iXjkBzM2vGACiOgqPCCDhGHGXqNU1R
	LxWMZJyRTjqt4CFDbIdBmopZ7fjICkD3Qk1E+PrlnPajGRALQ84Jqx09PUi/TlYFVoKYgY0YLiOGI
	iw50sknGtT8g45Hy4y2zH5i5tSVNXb7ZePxcban0zs6tXb1Np0BaWxDTtxHLB6RHBB3mf6cv9VOJU
	DMkgwL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLw-00000009XqP-1nEe;
	Wed, 16 Sep 2026 15:15:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLq-00000009Xgk-2d7G;
	Wed, 16 Sep 2026 15:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jOrO+lzOsedSdgTaJ6SomY+EHWnWkwszxQMkizdHQMw=; b=Fx16KIUVX2HJnopCml98K/eVec
	7DBa8tb11RWm29p5bSWH4wtBcNdJ+39b2XM1PCPAWFYVvu3nmadsplMkkYVqL2qBUlThB6w4Tiqof
	L7ipSgN4YmpsB0afGhuR0/LIIfKCrWF0TYKMKNqJ16D2YB0dpVGXfE0qlyWQWMRJLsQ0/IgLZBTdI
	zy8PJK3gWROYqiMgSCfrt9ap3cD/ZN4GuB7fk4Yun0NVz+XhTs7vnc+hJQEFI78dK1TpgPISTDAw6
	9Et0WsDHxOb2RoVXM/E/iVZJaEA+aSf2KnORnd88VvcSxlcH3nScudiH4luFuOvM0iygyC1nJUDXM
	9yWJfBVA==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rLg-000000081lx-1cL3;
	Wed, 16 Sep 2026 15:15:07 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A5AD3205A03;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGn-001Fsx-2l;
	Wed, 16 Sep 2026 17:09:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:57 +0200
Subject: [PATCH v2 16/17] media: rockchip: rga: put all cores into first
 core iommu domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_161505_254867_E9562647 
X-CRM114-Status: GOOD (  14.82  )
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

Put all cores into the iommu domain of the first core to allow them to
be used by any core. All buffers accessed by the hardware are allocated
on the first core, as the scheduling to a specific core is done after
the allocation. Therefore put all cores into the same domain to have the
same iommu mapping on all cores.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- Fixed domain not being an err ptr
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=14)
- Detach domain on unbind callback
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=14)
---
 drivers/media/platform/rockchip/rga/rga.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 5348fcc03c525..b2eeae0a61771 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -761,6 +762,19 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 		  rga->version.major, rga->version.minor);
 
 	if (rga->num_cores) {
+		/* Attach to the first cores iommu */
+		struct iommu_domain *domain = iommu_get_domain_for_dev(rga->cores[0]->dev);
+
+		if (!domain) {
+			dev_err(core->dev, "Couldn't get domain of the first core\n");
+			return -ENODEV;
+		}
+		ret = iommu_attach_device(domain, core->dev);
+		if (ret) {
+			dev_err(core->dev, "Couldn't attach to the domain of the first core\n");
+			return ret;
+		}
+
 		/* we are not the first core, expect that we have the same version */
 		if (rga->version.major != version.major || rga->version.minor != version.minor) {
 			v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
@@ -788,6 +802,14 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 		if (rga->cores[i] != core)
 			continue;
 
+		if (i) {
+			/* Detach from the first core iommu */
+			struct iommu_domain *domain = iommu_get_domain_for_dev(rga->cores[0]->dev);
+
+			if (domain)
+				iommu_detach_device(domain, core->dev);
+		}
+
 		rga->cores[i] = rga->cores[rga->num_cores - 1];
 		rga->num_cores--;
 		break;

-- 
2.55.0


