Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F695CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZARXR1tZxSjoM3UDDyEiZcqHvF7z4O9+CkFZLwRuRM=; b=Zn9ZXGBzK12yKcjfzVvXZtjD3V
	voQjKXyz5QDK/3sz41t0eVC5fYRgLKiKV/l9S1ixvKyRnQMzWg8t/quIQoucKfllf3pqUEPlGSXwi
	68BqSX3vLHeZVqpKt71DtruOTbgmlVkwcKlHJaxUFwwHC0V85GAFHNlZ1Aw1He7Cul/veIp4HerQX
	RCiv1eZSRlvyadW955r6S82eT64s18MnlyKuwQfcqOa0s3KwmyIT0Oa9FhOmWzplnLLAbcGwcbrN2
	xIkg/WZLlVIFTFDymdqccy6+7ZLamPHjRCRdJVK58JAbGa7qesnS1u9P+UB36qc+BD+VhE5kqzkbG
	GOUqeIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7W-0000000FdWx-3rSj;
	Thu, 21 Aug 2025 03:37:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uossd-0000000FHFl-1X81
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:10:12 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 25A6011D5;
	Thu, 21 Aug 2025 02:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734951;
	bh=0qkR20lf56u8fmx7aMiqFClT7ntROxnOMZyBFXa+dW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vyHaERdws74EABFhq52+jVBNk9nt0uz6y7LmFjZrhqe5dPKQzao5MTFQ6cD0TkBCy
	 /cxNUNR+6bOS1+MoFMJJY/WOKn5t2h2rsMIRXGwfFmuso9PA6DHv7H3ehcgkhiLGYj
	 NiRP6HZ5NJXKyi4A6nOIzDg9/UCIaKWX2M0eplv4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/12] media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 03:09:33 +0300
Message-ID: <20250821000944.27849-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_171011_556597_3E8045DE 
X-CRM114-Status: GOOD (  10.58  )
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


