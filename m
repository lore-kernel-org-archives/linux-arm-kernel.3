Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC5BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=; b=HHCS2n9WI0V7/Mh6P7aYGeaif6
	TMIUKjkOW4QNYlvpXYSs1YPoDgWYizg44tx81DfOrSyd5yq698wy1FqI3SWFU4SZLdXSA+xtPaDyf
	lxmsBKXMbAHqieKVnULhDXHH7e1VsrRPLaFZnOjW8dCwVyMBZuYKCwB91RTNY99DdtU5QeTw0T2Cv
	l2PFsSBhz2DPiTJlaqHJYtN0n9Sz9rtgKrpVJEFWD4U6tAZy6O+Rp846u/NdGiV6eS9vlN7KrPgK0
	G46VmlFCegK4PuSiPIyXwqpBIO/Vi/q05Y5awlLfJjSQMimT7gP4sLlANkKmoCqCAIRzEGOeSvXIe
	Dk4xEisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2l5-0000000HadO-3Ueb;
	Thu, 20 Feb 2025 09:22:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2jb-0000000Ha99-2Xdl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:20:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abbda4349e9so116961366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043242; x=1740648042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=lIBI3bVahYaINDhtvAONBVTWb0K838w7VirCBWZeuLRsoN/KvFKvZ1FKYqCTeAQxv5
         WcLxCv6dAk9OHrGLYuKt/i4HQrqewCf7ErN6SgDupDtlNWPFaf4eB0oNVka173+IfQ2Z
         LlZ/EQvza07TfWzcWJoNivWPphM4qoeW2a+pJvayPtqg25YW0Xlx2poPHK67dHIuXxDf
         xo5Cdvsv9hPHsrDsu+ksCv0Xd2ZfcTklbpEYliFMnvwp/3fYlvJzbjL7v2E4t82fFQQX
         TbvauavKpx6+zeUBoIxA00SQ7MFaSqRKKEFqukEzJGthvSiod6urRTr5zI7iBtfZL3NA
         zAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043242; x=1740648042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=q+zIaWrWFSvUaJIVcYEbDWQQaBVEYgQMmOFUys2lwvZ/kFJopLUWR3+veI1z1hdvRj
         Aymls5NyQr+ZSN2c6uWGCVyABURR0WI6B8iGxDx2R8llNX8WRQ3RmKxNuLgZew/F/15T
         +hmupCPhg+dOhuYsBZsX3KnDRI8u+9Ac4Gz80jRTn5omQlSgUtfPIHweZNuSj+dE0U0N
         8Kd+f/rP2ZCklHg5YdPs5Eft61gVi449E9PYelZ0usf1CNs2bDBs651G10DmbKB1DZJ4
         VXBWZjBJdOb6M3In7Q2/QWgrgojAi8GzWFSvk9C5+FgRd69GmPOtDIaVY042SQB998j8
         X8JA==
X-Forwarded-Encrypted: i=1; AJvYcCW3OVqzush3c5XCIZ3k0nyyD4XhfjpW93LgqgjP0bOR4r6lOaU7XuiVFfkM5E56M+9B2m1BgdRcWEXicUsHTh9a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy73a+GQmYE7AwSLVJJTp+9M6PsnbDB8V1XlpaSrw6hEqtqW7qJ
	ZrtoTmLaSK4XEQx+r/uyi6PpPIrsFkUCVTtRuN1H9XUGlVb5hbgm
X-Gm-Gg: ASbGncv6RuVkAoLz4tf43tzl4IZ4iksRWLoi5i8UeIbtQXLBgHYoEGXNLSjPeGjBBWJ
	jqsvqpyOMnaSVMUj3zwN4vjyHKSVb7rEMon2XT952rXvbGTpq85Hgd/ova1nrfD3nRT7545XaBm
	OPESCIfhB+jXlpqCYy3acjHUfBj2WzakaIFR4yhSNXZeucj/gyAuY8BXhZ/6YHASBEMdu/xpZ1N
	cg2SJ4EzSrP1jwmJ/nEAqBd0+BVYPqqgu8M3wkAJwdnKeJwdtq3xhg0Cp2+WrQ+GXv7ehGGu130
	WNF7+jFk5lRgD88jIyD52zsiAoBi
X-Google-Smtp-Source: AGHT+IFH77Toh5BLoa/DoGQILLeWN9qsNu4stk384IN/rlsikDaMIRUYzdJmJUURfmK0ptNDuRXjEA==
X-Received: by 2002:a17:907:930a:b0:ab7:e7c5:b373 with SMTP id a640c23a62f3a-abb70e3b378mr2010338266b.55.1740043241671;
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
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
Subject: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:32 +0200
Message-ID: <20250220092036.6757-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012043_691584_2DA640AC 
X-CRM114-Status: GOOD (  10.39  )
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

V2:
  * Fix description of parameters

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
 include/media/v4l2-subdev.h                   | 10 ++++----
 8 files changed, 53 insertions(+), 47 deletions(-)

-- 
2.48.1


