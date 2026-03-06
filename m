Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF26FC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VobUaeJBoe8Z4cj0P2XVbgRCIOOqSBcsTFa8QlIWGPA=; b=jhn3JIw/E2VZZb6b7nlYetYBRI
	AI9O6b84Y/7UFSeZtV+2u2e4UFpFxD2emt7nOwObE9Xf/yhGlcJsmSq0M3V6EkUkNy1wpd1jA0ZeJ
	XIbtvrgwCpfTEgg1yZ5amaU5qlHMzUXDFBjnBySPCviYEvPCJs1m4FWYOqJs51bnNJDG0n/R/aBo9
	85ubwR6y0Mj65gQHYlri4wsxBFobTTwkCCZbirifvD74cXNW/u+7ltuLf1JTgoVRGowsyMj0VOuEP
	NLL+pmzn1flMyf/O6DbGLx4hEjQiUniFtax2ERetbIApC1X5Glafk+gHV32Mpy09BPAFk1aU06yqo
	WvhmJHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyekd-00000004elX-2nWj;
	Fri, 06 Mar 2026 23:38:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeka-00000004eir-3Shw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:38:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48374014a77so117210495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772840310; x=1773445110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VobUaeJBoe8Z4cj0P2XVbgRCIOOqSBcsTFa8QlIWGPA=;
        b=ZoWzbxBLamO9OoklV9Hg8xVGUpfFB8HfLsRs3cqP36f0XHjOpYZmXiCk/DQJi9nk8r
         CKHByzxt6Nkh7367/RD76wP5dEPwcWFDqdEAVJODV0ZyV2cm462dL82oKKRa02t5JpCV
         aqrrX+XApz3TtEaHrxncOqYZWQKcMiTLdkLs+78PZU16ySF+CHdZjWqhpVxDuQ+bBB9l
         0WPfJFKVwoOxG9USfX/TJTi4NKYO36eCK3AYQn8IV0bYGlkX5beub9qusx5cf5kCM33o
         ptjpX0QCObx6oHv0B3bidjJfdl0ljbRLtpcUuPCw9VZXEK+mmNfD8RtH1ff2qWOIuKtl
         tM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840310; x=1773445110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VobUaeJBoe8Z4cj0P2XVbgRCIOOqSBcsTFa8QlIWGPA=;
        b=RXUfY3kxi/U6Rwm/4xE1qKQiowQGS/xUlsHgcjRHlR2MJlUKRp0/Jmx0zfDUriMPeJ
         2xT4gpW0VDVPGGGvx1bWlyIHGmvRZoN2cUDYpnv1TrqQNN/ltE1DjWIFbP0dHR64mN7x
         rb+7z+ypGqYBxxBhB2cv4737ZrKrJq5knWlwPPffbtI025fB7uVbqczWT/zdHTixRf8n
         jeSp4cvZ1YgpOqs4nhBS6Y5HUk7klVH6XD9ITgm+zxbba4EnXrZYg+aXtbzbxmLz7iKE
         mLwwjHY5PxCdQrwy/RT7Uk7fevZkjZ5Bmh7N3p44l7szCH2eh+4KSXhUCTwX7LG+/YeP
         VVBg==
X-Forwarded-Encrypted: i=1; AJvYcCXC5gujX5N5KUPyDeNC4U4XirLd1E0XXSc2NaX/GEuKyrvdfe/PlfwlKzl19zg4rwMtB8lL1XsRb2cBBlzEWfZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwrD4zGxber4OaPbSklMcvu1sx6aM5jdgoQeQVNoK8zUIOG2sjt
	tCGfFUrHdayRaKtVPyN6ZG7WaflSuDnsVldRto7GKpY7A1+4XNzCkWwEDakEbI/dY54=
X-Gm-Gg: ATEYQzwyxqB7YNEmZcyRkwTrbHG0nCm3sz//HaIGLGKiUYNVv88F587PblppqPOQIFP
	Wzhp6N3j3+43lRysxdkPC8p1+bfGAFoBRU9sER4m31V89zCH/WAKXAoBPcYCxpaBZhf0gc8v3td
	brwrY/jHQcLZtKPVkTtspksK69u0JQ5mSTZW6m3r4fB7UNJ3cPLY8E9zuZAilZQHvYYrsqQuExw
	oPOvAYND0/jU2pYOprjvyc+CwIAYAD/GVsYmc17TWcM3I4ZXMYheySY6G21DCxsXavE9qOb8ux9
	uA6Q79L/Lvs95So6kCLjllsTGH/ZY04lG7/2F3xddjo3mrUmRAIUxO4YDhoMmzc8eVWIihgEheo
	ycWUtluFifGpUecjlJJD5yoy4CUeaLKjSRRkHwRZNDahdk9WHsZ2RUBYLdN0+7Z4p/35LcW7825
	OBPttzMnYRdZVl7a58S6B/TXYmUXqonicO7vIsdHamOCWk/RzbkaIi83a8ORLak/2luYUXRWMr6
	2Np
X-Received: by 2002:a05:600c:6387:b0:483:3380:ca0c with SMTP id 5b1f17b1804b1-48526979206mr65411795e9.35.1772840310303;
        Fri, 06 Mar 2026 15:38:30 -0800 (PST)
Received: from localhost (host-79-12-214-40.retail.telecomitalia.it. [79.12.214.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm7262891f8f.15.2026.03.06.15.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:38:29 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/2] Add Power Management support for BCM2712
Date: Sat,  7 Mar 2026 00:41:20 +0100
Message-ID: <cover.1772839224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153832_862214_2B8AEC67 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hi all,

This patchset adds support for the BCM2712 Power Management (PM) block,
which is necessary to power the domain of the V3D graphic block.

The implementation is done in two steps:
  - Patch 1: Adds the SoC identifier to distinguish between hardware
    variants.
  - Patch 2: Adds the specific PM support for the BCM2712.

Many thanks,
Andrea

Phil Elwell (2):
  mfd: bcm2835-pm: Introduce SoC-specific type identifier
  mfd: bcm2835-pm: Add BCM2712 PM device support

 drivers/mfd/bcm2835-pm.c       | 9 +++++----
 include/linux/mfd/bcm2835-pm.h | 7 +++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.35.3


