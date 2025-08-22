Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25869CA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tuj1Qtg1OQFPVXc2tGmwnbfPvR8XvzzZmZYOgnMptsE=; b=U+6C3ub7N9XyL45s3nxVQIjslK
	eLVG406lGcmfNXiWavTk5llsrFtWrIRiGdqy5ZmHI+ijW+r5x1iHinkDwaUuBO5ni9eq42mRyc5uT
	KI62ffzXlYnqsQXMHKf7ohxCBLJTIvcUl8650g6UXZFE94f05jrPtJ3Xmm+p/ZKHleH9Vp7oIWYfa
	Aia0LOHVfUhcj2Mhxnc6J9j12x+uusxaYD98uc2xZKFDAMHLmMQkaiVT6/ZKGkLVSFiuQhLPgDx9d
	13rkKPeLfT8hk91RCzjlSGWNjtWUuC7C/fFad8jkJ9OoiDYlTu7j9NYU0yWsPdWSF00Zxm348JNkS
	SC0RUklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqi-00000002I0e-0Iem;
	Fri, 22 Aug 2025 11:22:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdT-000000012M0-3Ju4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0DF1A78E;
	Fri, 22 Aug 2025 02:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822420;
	bh=vOq1k/ojAZ5Xa5qxpo+564y/TrWi/0/ZGtLy4wHIKxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZdvBMIBh+l6kqJM97tFFn0F/UDtzyv9/EgM6XPIOz55FqyelJ4u5uoCt5OfHUu94
	 oeKnhjbr3L+iwtHtjmdHkphJf55naYEe9yCLbnyNNJGGlZEV9EeMdSnIFGEWJhN0C+
	 vjpx1iCWcD69tNJTd3A5zHzpi9Vj8wujdpj3E8BU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/13] media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq()
Date: Fri, 22 Aug 2025 03:27:21 +0300
Message-ID: <20250822002734.23516-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172804_026210_0DD09963 
X-CRM114-Status: GOOD (  10.06  )
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

The v4l2_get_link_freq() macro doesn't modify the pad argument. Make it
possible to call it with a const media_pad pointer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 include/media/v4l2-common.h           | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5334aa35992..4d686338e345 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -551,7 +551,7 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
 			     unsigned int div)
 {
 	struct v4l2_mbus_config mbus_config = {};
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 39dd0c78d70f..ede24e60dbec 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -580,10 +580,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 #ifdef CONFIG_MEDIA_CONTROLLER
 #define v4l2_get_link_freq(pad, mul, div)				\
 	_Generic(pad,							\
+		 const struct media_pad *: __v4l2_get_link_freq_pad,	\
 		 struct media_pad *: __v4l2_get_link_freq_pad,		\
 		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
 	(pad, mul, div)
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
-- 
Regards,

Laurent Pinchart


