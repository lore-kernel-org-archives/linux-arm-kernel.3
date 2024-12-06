Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=; b=4yP9VskaZVSpcXdPR2L0Y/JuFo
	AfKCfR+YnmOGCTQcL3Bj81G8KWPI8M1r0mK8neHUvnLOOweTb4QssaXVyullZ/v16PpIzxtl4vqa7
	3e++ExKldBLsf1kQiNYrbJxKmNjuDbvxTIutLC9HBh0S2j8slpHp/Tk43zLum+UrzX3tC9alsZZnn
	LyBIIzzalOlNzCWg0fOJBame9heIYb9/AaVH7/Q34PBQmx6gAMepXg3Laa41TPq/6epzYMA76SXNe
	DQlv3SwefuyiLDqEGJ2rp2RKdIVLv+C4Lof0qzL6Kbn7bZRuTwlxQ5cQLYVW81+qq7XeTufypp4uY
	JxGcwjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc8d-00000002LBq-1KXn;
	Fri, 06 Dec 2024 17:29:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc7a-00000002Kvz-1PUF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:28:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-723f37dd76cso2214654b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506085; x=1734110885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=dJkf2kZ1vClkjaxvEFQXXvAKau2oA60oFpVLtRCOyjP8jI/86UoJZt6jd2vFZ2acuQ
         En9l8S2THBSlkDhUoB5IpN7cE9A1288xZnu5qIdACB7MJgM+8PpE/rv0mlAe9nmBCsQe
         D7gBRqL5/YzbA5wQyLjMVZm+RBtB0koBBkpo/Uqn78kC/O47Jddt3/b0+4vrcdXpDk8a
         8QldJcVKw0NaDoDAcXX63hbB1FkHH2536d8nBHIz/LFKSd5gYy6rK4MDKv55MJdHpfxq
         +gVqBrIsy3t2ti64DvBxqXNnuRMdAN0TdLbXCJTIHCqAdXJUGYKOJvHsGsGzlYjlj7x0
         y8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506085; x=1734110885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=RstZHEImwzsp6DtCrdt5nvvW3dCzczclm0QYKk/oMzoPVtGPY8x03Kmd7q3yvN/Wtg
         8U3t53Fr3ThAR47rN2X+nezteTqb1/gQFsDfSeKnhWVVaWEO/dn/1PROkJXCBvsA1ao3
         rrTSSC51BLnn42brA04MjP3TirLdv9jphN4X/DY6TiN18EQr+HbdjRUX7QeKyqcnwhZe
         gIHv5+HXRHWCpewGyKuCO079xfHaT+iLqfFRMczM9FAueJliJ7pfLI82HV0mQHsX6pPF
         KcrCFknVCUfs80aW39PNYuUvO2xbH19BdASfsQrOJIceIe/LAhOzV2rHIQa+a7er5+uN
         xQyA==
X-Forwarded-Encrypted: i=1; AJvYcCUaF4P/hCQQPCip8O7QVXA3Quc55rU8nverNoDjUX7JPU7kCBDqYwN/A39BHoZfk0eYVsHmRyGvOJY2/w2husWd@lists.infradead.org
X-Gm-Message-State: AOJu0YwPHQMXKi1P7+aFbNEBacF0mFE3V9GqrkLqVre6zt/Ek6jVXpQG
	ddseZAUHfmU6KJS4zc/sUlvWGh9P/E8xnjesfIx3euzR6pWjbJTI2IQUhQ==
X-Gm-Gg: ASbGncvD1nClNvcoH6Z9SE0XzVmYCkbZfGMJrlbEwQjdSLR7SG3hFWd8MPgznyc3nyV
	w/A1w67S3UgJ+LwEDp6rNXxKYu7dHpPAXUBysQTdhlmbFAN371YNQRSvLqGYi13QgROxwITAP/p
	3uGMQgEfsZxeYZXwfL+JXeRmlRMOYjEAUlsbOaKUh/MwpIL7+p1JirlNaBqRTeJnaKOHqdbl/Fl
	KFVysKV4h5ewto1ipgFx2PzJYW54Zihcdy/uMdfgAm1T5OTo641THX6XrY8O9b2qNGN
X-Google-Smtp-Source: AGHT+IHXdwewDIPQOXtv1iEJ1h+wD3M9qyi9bwIoqyxS6+rfSqoJNur+gfxUq0L2I9fps7PZzh+XJQ==
X-Received: by 2002:a05:6a00:806:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-725b812aaabmr5813954b3a.15.1733506084740;
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:32 +0800
Message-ID: <20241206172735.4310-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_092806_369819_0D67625F 
X-CRM114-Status: GOOD (  11.08  )
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches 1-2 backlight controllers are attached via this interface.
Though, to software using this interface, there is effectively only one
controller to worry about since the registers changes the brightness
setting on all controllers at the same time. This series adds a backlight
driver for backlight controllers connected this way.

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  55 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 123 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


