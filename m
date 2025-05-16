Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A34C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LjIRRc3m/VAxY73bP0A+3mCsvKJgmOnqJyXLSLT8exU=; b=MnCAM0vGov5EUTVHlpcmnlobKF
	Z5bXwq5lj/C7EBbJxl++35iw8HtUhmluQauqp3Y+Vzh3yinY3T9F2FmfoHUKlZvGYIZ2vuEW60iID
	Wkc26ypWK9916fw1thonSOXXE8srGzz2uwjxdLRCl1N/OX3HVWRJlJFA+7pQsAy6smkS0f8AqfoD7
	bHOvo2qtaV46Lz1Lr8Lk0Mc9LSWXaBJTmKIyquI6S3CWeQPx1w9oquBCt+8/KMx8VV304R09yuFpG
	huR4Wf2pOj7wUbj2WjgEBQP0u/FTrkIuD6Yir7xWJH8kguHoKhXgS7g+3r39o1SYBKL9eTD8/PKt2
	VmNmvjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01t-00000004MKf-0TPb;
	Fri, 16 May 2025 18:43:33 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzpm-00000004K86-1hyx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 18:31:03 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4e1477fbfc7so223791137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747420261; x=1748025061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjIRRc3m/VAxY73bP0A+3mCsvKJgmOnqJyXLSLT8exU=;
        b=QrUZJhizwF9CzTQrRChCyCRgVfg+zx4p8gu0KURLQ6rs3zTqvxwoO/VcHD3yisUprF
         hcoKEWYEoo8TlIVpV0QxP6IrLYP00GF4Z+hIvO0FTVlm+fcZazCj1T7ZQpeBu6hm34n6
         EcLypM3V/y97FyJPYAR4lqTGKZaN5+uxzrXw1gRGQSKaK/HK4qlkUUph1jUEH5hYm99W
         enYbvdY3wUtEc7YXI1rFJpM/bxTCbmyF89ocAp62CSPl3xVOicqjoPJuD9EW15BTircS
         6ewQ1CrhAci7yxRhXdUZQqbn+3AHJ+BsfxFDlSpnzuu0OAKG8THS6PreivC2o9BRgI1X
         JOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420261; x=1748025061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjIRRc3m/VAxY73bP0A+3mCsvKJgmOnqJyXLSLT8exU=;
        b=VEOYDlhyi/g4xeZzgiIYpDj0sbKw57LybpWbXIuJLW+LvxKs+jWVvP7GyRDrXTHg41
         /WNODCrCcp99EYRVj0e0H7Vala2ufvJH1KQwjfarVHU0O/imq2p3vpaURoUZgJFmUjyt
         jXUfRO32t1oKR27tmF06DFIWTZxgAgODRSHl0Rzo4C4ng5NSssh3u6BaLMe4sRMUkuIT
         GNDCPRnihalotwdBMaBUR5X0FAjujJ0YQ7ymOOMZdpG2tvjowfJnwsFgCVjMKShSFx8S
         vDrOrcy7i4LkjesjbpXKvwAiamGuV5QhJ1KkLVJ1LbxdZSsA/JN+7a2MPMYCOdG8330m
         5/xg==
X-Forwarded-Encrypted: i=1; AJvYcCUD+cP/Pq224ArtXZiobZSjM5tCbrmUXQuon7IpeEfBx+4B347pnS0/IXCVtDw/nRiTazcJk3YWOK7yXCW+lJsj@lists.infradead.org
X-Gm-Message-State: AOJu0YyL8QEca8E0cjliiKvIid/gHxqzvOnjbFXAiS/yXBXNYh0Y0Ixc
	+PTjeqiBPcYbXFi3cao3ZICn4Q2Vx6QprgcPAQkG/fjYXnD4Ixui1g//
X-Gm-Gg: ASbGncu4RHvDO368ioDveNu44GEKnYFEKtr7k81MP+V7LjeFSdDkL5oj8nXD/opcCKt
	fLgkdPXfu0v3uSjLiFAD9I5cYLjQcMwTKKbFruJQMXiF2knbHvmiBIs8+RGw6Ccxuyg54amRYqp
	drQbp8RUwM9kUkcuNFflX7K8C7QvTy50aXeJTTcK4p+IFTCSknFoixTBlNrsjtxwHkQpeJOu5un
	xUE/vG11sb2iAy/gLE/bWrFgETapWiwZDIV12gqrX58WTfOSZ46uXO5kPMxLxflP//FFBqVrf6Z
	6j4BT/jGIO+olLG6AiYC4xyhMAUgF8z04CdZwyigG/zrJPwazO+7PyTL1c8biAC3EA==
X-Google-Smtp-Source: AGHT+IGP2sbYwMDlV+BPtSVT09uB94OWwAidwDuga4z6Yn2RSTFy2x8+4ClJoDXh6bPPZjOSVZIjSg==
X-Received: by 2002:a05:6102:6c2:b0:4da:e719:e7f8 with SMTP id ada2fe7eead31-4e053d6333fmr5003602137.24.1747420260003;
        Fri, 16 May 2025 11:31:00 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:93a1:94a9:517a:f69c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec225c3bsm2119351241.29.2025.05.16.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:30:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] MAINTAINERS: Add ARM64 defconfig to its section
Date: Fri, 16 May 2025 15:30:35 -0300
Message-Id: <20250516183035.685914-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_113102_444374_D8ECC63D 
X-CRM114-Status: GOOD (  10.48  )
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

From: Fabio Estevam <festevam@denx.de>

Add arch/arm64/configs/defconfig to the ARM64 MAINTAINERS section so that
changes to this file are automatically sent to the appropriate maintainers
and mailing lists.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..82bd864b1972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1937,6 +1937,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
+F:	arch/arm64/configs/defconfig
 
 ARM ARCHITECTED TIMER DRIVER
 M:	Mark Rutland <mark.rutland@arm.com>
-- 
2.34.1


