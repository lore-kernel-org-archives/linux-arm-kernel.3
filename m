Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52256C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=; b=z1chu5B3HyJxVLl7YMbCMWs1aX
	aAF28r9oGhexR7ySE/5E+JLKV3PA0CHtcSlBXD5YuHy5SJKo0amWZXGaQ6u1XZMzdJdMMs+duuyPG
	aaT7BWaKcko2itz/o4arKSR6qElNnf9Rd63fwN38bN0OLkef1bMYqYHgScEI4RECKc+b1jR5GqEqW
	at6ipCto1gDRzdHEvQZTV6v8jCG/AhNptNIwdaqhyJT6lkKgDn7A6QT908QVFMBrtfNoe7k2CtTkH
	K6OVB+2rlJ1g+2xuE01/Z1bqP85PvGeJoAsiCI68vT7CgM4mgwA7MnXaW7rfHOAH8h2+zMVdKI8/u
	bTA6kiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Qj-00000001HR5-2yIz;
	Thu, 20 Feb 2025 14:21:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7N5-00000001GOs-00EI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so1435528a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061065; x=1740665865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=clK7JybeGTaUdFLbAjTsHZsSqur71b83nskrPWYvRvXzJTLkPY16rnCDdK/8KlxNv8
         lfZagFAsgEQf6kvvO2tGo/soqYQLhIapz0enY9Gb9ODxZS/jJDi/LGxS/xNx+vEmy7Cz
         UCngRkGSgZuV2oVURf4s4v3o5IMmFoNvvhI8qRrFhISndN7Zj4654WRxtRkAhD1QBhho
         ySHlV0GYFmJ0zZcqAnXtdk1ik1mPLyVJTbjp8ExeE2AhRrPBnKaKmNDyWkV1D2n2APxL
         PmSAebP6VpGYHebtZ/lNQQ7IF/GTgPrM+p9uCXWqHs6alehqKWvfXNsPsHU4OcuDO52t
         fnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061065; x=1740665865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=WGjuN91ISmt4lsWRfHIDlTzG89qshK86kYxNYzUnD3QiqYIs4prRpJoZ/362dNXUnV
         UsMcAs3y2Rdf/UypI/mMsq75/kgu2lUAPGCU+D7zwWEtZDCCsTwdMEbfPGDSgejY9+eb
         Pcjo5Inm5hYFCBz+U9gs0eer381TNupkMy5I9fdAghHDUYFfrboKHpiyDnmYX5p99hYw
         GGmz2D65Jv6u8RsUhv2gNL0vMSe/HqUzTslxE0y3kUGIPfyBycjhCqMT0qcv3xRiFVf1
         TKlkeZoQRcFkqcgWkwPsg/Te312wgOTPbkKN07OeB94pDcERbeUcr8WkXfRw6GKJp4h4
         1x4A==
X-Forwarded-Encrypted: i=1; AJvYcCWaHaOuEH7ST8SUvF7YBjJDQIOSSEZe47Av/jjL61W/CcTO1aSGsNsM9o/Kj+X5rHCLGiyavTFFw/V6as8580J6@lists.infradead.org
X-Gm-Message-State: AOJu0YzHsz4Z4Fw+ccjZHx2eT1jecYQjB9PstKYAuPOlfymU68Tpm3ZM
	8bZYir0iS/Cn9XZAzZJ53Txm7O9WHtBFN4Xou8ljCB+k4Q6k2jwr
X-Gm-Gg: ASbGncvCzTs9oD0FF9fbGQa2jKl9BP7urAgMQKrntXlK0QGYcperscJ3TrcBYqtuQn2
	Wy41xNZvdO1zOPO18m1WpaTfW470iqHMWqOSDNTGy6JeJ09lOBjX78nBwLCz+XVi2cIJ34uLKbO
	8aKrDqj86SrvE/6soXny8eHCHb2EueMjIDX5risiWEROVhG+PvLtxv8yDBLlSiHlgA6treQW3P5
	5i02guY+zZEC1McxDkOQnU2TSqq5rfUTN2cFIqotEbYENfYpsLP6e1nLc8XQAZ9OcSCEiuV4+F/
	F0v5xflhrVX0PcskT6hj525zs5Bt
X-Google-Smtp-Source: AGHT+IHwF/iEm5a3EKb+wf6y31mYTImtmkfKgViMWXtti2k6qyught+ricxhgsnrzaDiZKQpJ1Np8w==
X-Received: by 2002:a05:6402:348b:b0:5e0:8064:b42e with SMTP id 4fb4d7f45d1cf-5e08064b595mr8838593a12.25.1740061065289;
        Thu, 20 Feb 2025 06:17:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:44 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 0/6] media: v4l: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:22 +0200
Message-ID: <20250220141739.228714-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061747_036834_F84CE031 
X-CRM114-Status: GOOD (  14.88  )
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

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Add an example implementation for IMX219.

Cosmin Tanislav (5):
  dt-bindings: media: video-interfaces: add support for Virtual Channel
    IDs
  media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
  dt-bindings: media: imx219: add support for Virtual Channel IDs
  media: i2c: imx219: pass format's code to imx219_get_format_bpp()
  media: i2c: imx219: implement configurable VC ID

Laurent Pinchart (1):
  media: i2c: imx219: Report streams using frame descriptors

 .../devicetree/bindings/media/i2c/imx219.yaml |  2 +
 .../bindings/media/video-interfaces.yaml      | 11 ++++
 drivers/media/i2c/imx219.c                    | 54 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 ++++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 84 insertions(+), 3 deletions(-)

-- 
2.48.1


