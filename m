Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=; b=FlowbM7oenjEMv/D5C4+1TNhVO
	E6YGt0gm0LIw3YD4oH9o8kZ/QYgf5WjJGnnxmQNFeJG2bKcMOo+9DNvRklWimyBVhcxCJzYvoocoi
	iI0fJsfGvygScqm5Z38nz+gIQ40VMV+Yq5oCUqO71mpBuf7mw0IFfktbtEfgxXwB7XXZvEcQlGT6X
	x9S7lAqqEck+WUpXuw+qbSqAqqZjqoziBVCx/8xeVVowHSUoVd6ucS3j6F3mmppaAlqq62rhYar4F
	fP0L1+e2ErstJVCnR7o0cY2HsVDQ6mGrzHMHibibzM8DDZ1MxYCF5mx6QbwrQ0p4MKbIZiZ5D+RBA
	7732j81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpdG-0000000Each-1J2b;
	Wed, 19 Feb 2025 19:21:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpU1-0000000EYRo-2roX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:11:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abb81285d33so38778866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992304; x=1740597104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=dztjkjsw4cbJ+S2TqIXUVRSkXb513CT5ZWbybYDcwe9ksyoore0Lg+jjpX9qLpfl1C
         azUob4b9oIcCiGI945CipTrhYBGaN2EIGgdxYpmNCx4tbP1eY47hCYSe8TrJV2Yg6Ytp
         +6YOuxOSPROkq2esuCgU8cm+tZ9FkREmZJZbc9jf5wGs6u2QR+rllS5fX9mHz9wddLnx
         nbs5NywkwwlC6O1Ovx7hvyYbexxNtMAcMQmEY8LtbZf7M10VCP4hvF4CUxhsGUR1jjw0
         1+aLYDgApRSdnmEJGiPP4AAHytbZ5wqzpPt7ZM3986UZX6oZIancwY/yFo3vUOMvBM/Y
         Ruvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992304; x=1740597104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=WohSxFADy2QZYYsfjsWCj8GjGWYn/LfH1x2U4jUhDiErX9WEq7tGTzk/vvw9U6N+Mk
         JYtz3fhtGi2QBybirAvMLyxmdX/yeavtVzBgPx8Af/HhW4KGd/lw4e7mQyeaD2bPu0Ss
         cVPQWLcQ9W83Y2AXCKvSJjqdTc5ZRpl/9Lz4mJ1qA+Ny5OTF2rb5MTKsE7hZnjOfc24s
         4iFfXDXChETQssWHMJAV3LKPtc6Nf0aato2qUj+8SBWeZgd0SvYadFtpo9DPgF0dPAFA
         QBTAfdrbyfhOCsFYucbQw8JeWy5sZ1ZuttVWcjAAfG2lbBNS/d7Ms2KOJkLycPxAAyCy
         bEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKOQPeumzGe3GG7YSiGg3zaRde+fEq8FDbISuA62V3IzCTV/iZ7vZSsblwo41V9L77HQWO3l0oipxzFIK2FK9v@lists.infradead.org
X-Gm-Message-State: AOJu0YynBgaW/bTuTPM24mKA/j7K2X3ghUqq5CBghoMJ66nwjDibLTfJ
	Qvszh7DDKjDxGU0FDw1EHcs4VJe9+brScdm1bDyw8bkHVCcUlvam
X-Gm-Gg: ASbGncvZa/v6TOsKDRDTZLToc49Hab7QTh+vpCak084Dt3LnkivUtd8sE9BDxqZvf4C
	jaLIsZWyqDqmo39twKkKfV7gRy+jBdyl4V3tOUc0nRrXP1wh5iTC+M8/YL7BS2Bowd5QD6kxzHq
	YGh0YZkZQXRb5xuIMhaN0g7rbwhhOIAYgxf8EydnbrLpEEV9bSVVRA+uZ5RXSpiZTJnFA8F4eIB
	IHLjNUY/mKSU83uuyrbBF+MVfcqFDtSwDJofLdgB7QdsQf01VuButf+5tCfXuKmOy22shDA7hJZ
	689RvctHdXVbm3g6tJgXX8mQw96o
X-Google-Smtp-Source: AGHT+IExsfcOTzNXWdNX/MrDn+3r+Z1RDoKYU2juHnsdyNky2ySy69RRBxOFeMW+7W21mr37N0NBsw==
X-Received: by 2002:a17:907:26ce:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abb70de288cmr2281215066b.38.1739992303417;
        Wed, 19 Feb 2025 11:11:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:42 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:29 +0200
Message-ID: <20250219191136.215151-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111145_723225_D13F269C 
X-CRM114-Status: GOOD (  10.35  )
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

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Convert all usages of v4l2_subdev_state_xlate_streams() to
v4l2_subdev_routing_xlate_streams().

Remove v4l2_subdev_state_xlate_streams().

Cosmin Tanislav (3):
  media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
  media: use v4l2_subdev_routing_xlate_streams()
  media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()

 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
 include/media/v4l2-subdev.h                   |  8 +++----
 8 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.48.1


