Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B301C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=; b=Y3dKIu2u8Ph4NDbh2UC1TgiT54
	AgW9jgn9L7MQzInDI/8AlfMu9Oq47mzDGPVMnJGeHP0jod7cTpIqUY73xNkGRo9PhZezsqnlAi6Gx
	n41gy1SCOOesd0OIM2oOiFMvSLH8aCekQ2hK9nKJZNziHGRTEriNEJl+/MAWOAdh9OR/UE0jJSG1x
	hu562U6Icni9cYMwPu8mZZyF692H2U2FOzqOg+os9eYJg2aoM9+iR2hZcVmDZPYD9ulwAV2FgfZp/
	0xQotav4a+YFgRn3n2LbVbXw0bSCUWfK6/+UEt1QEYrUDJsyaDpkgzgeUuJR/XharEEjAdqF6sqhS
	7zU01iUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLyb-0000000Fw9L-0QWx;
	Fri, 11 Jul 2025 22:12:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwG-0000000Fw0s-0vBh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 22:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=; b=F+SjuaIT1wRfxNJYcBfuPWq/rF
	FyRApObCkd1QxAXx7MIlyI+i/C4G50dyrLjSFzykxOQIU1jNhXLb2iANzy2SmMFmlldsRXlVCvRl1
	Ewo4TczdX1+j3aG0hblfKSVzEf3YF61zl8aOY2VFHDNh0rxqcbJ3XcOqIrEZOiknxwntykao2H366
	kw91TdAyL3g6zZu1Kxv6xaUhogS+xcs3sX4nTkwdKO/LmLGQ0MrS0ywGevOrDL4ntWP/omBIH/ig8
	E9yXfp90x5BuOYQhtgt6qAX2yCqqODJJ1+cexkr21i/zBtN0Ax7hhzr5eWgtWfKift49Xn+GwGL9K
	JN7EkGVQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwD-00000009MsL-01AQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:09:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45348bff79fso31355915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271787; x=1752876587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=PXmqJE60YjY0FR50IfTgTOv3HSBEDb+8l6PXjhjPvytheoaHU9TY1LbAvyys4OEyzj
         rkIlxFgFUGESv5xrtGnFN5CAs1owdBWJAgXoUY9K+lsoKldtcgVpuNWMhJB+CUH1+2s/
         Z6mnbzehERhk6BsFRezptF3Ony3fZxq7tPs5oFmq2COvq1xbQskXL61xPo4wdnjo7SCb
         qTWgSmk/qFIqXg8R4h3UIdLiYuSGTDPbu6OOtmJZvCoRkb9DE2AoMf8wilO9ASyTli7H
         P1SWkj9/fYRVJc7M8oapsCoCHJt09gpKXDC1YnVdPQrRWc8tbc8r42BEUV+0qwM5sXLc
         jbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271787; x=1752876587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=WEEUDzy/f1dMpDe/GBY26Q1HTBR0SN7sJhjrDa9k7TBUfnogNCxGUmg3noCW7ZMcWE
         8sMZJ3sv9ngmDnps6IfzaUwg0e1UAk5e3ZSPrieI9NLRM3Vi0G5u7Rj7aIxP5wHOYufb
         JIdyRTeWr/valnq+uHu7rbLiknoFo5tbGhZ2IzUEPxXIlAD5iDlGyG9Ijjn0/ludE507
         64ijyEjcTkXXsckpN7AzgjONuxBUQEw2kr3Knww2gApdku5L+RB89UXe0v8gn5/mrDLZ
         l/rZj9h82+Afh/876lFs1ux8R1brZA1IIeMWdaY3IXaehZrZM1fvOaI4Pqy06pdDIc0v
         1CJA==
X-Forwarded-Encrypted: i=1; AJvYcCXSGemT8ozCLj5+dUsBnoMQj4P93cgLrGcvu+MBFk2SJFXrq9Qw72Wh3sUljHBPdvblcHPvkDcZxb7ogwCyB5Na@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0vSbT0+HYtHq9xtRKszjMpsjorLQ2cpRvGwFMyyLIPeBAmqDv
	Rvm8Om23poF5u3M5kVv5RCrAF/w0MFmC1hopMhOzsHAX0Tio0zmEOG3R
X-Gm-Gg: ASbGncvuCXM8OGEyqOs2FLCnQYrLnDkmJLWiu9qTihhoLZlkNzhYmfIvh3hcikorpzQ
	98fOPSBTnt7bvbd8qf3y2tCNStRQTJQWT8fvvYjU8DHuT+k7SGeODmtK4gB6PpjCDpxAWp6ZIHK
	PG/dgBJZck8y8Nit6GiLlDfixAP4vwqWpzf0m+YZpJxJpthnzpUiBAawuvD+wrK60klHRRw4xvb
	VNEUW8vn+P9JQWksG+dVdCctuGCK7XIIN56dxSG07/ZZdnGUBK3QhICbtpqqx5fAGXmy0/m2601
	qR6S/uyMbvlJ8VjnGHILFN4Mg3FvFerwFXYIU6uNb+Gke5kouvbOZJtHc/YqJV0K6v9tXEYQ0B6
	aa9jxPYEE+SlXY4omZh+tMydv9NPlukuP1uKMTxdcYfjXGnkUWZ+6PJFf3CvVpJIeYQ0agCCKwO
	6D5wclBhKcImH3WSJUvsSPdbdI
X-Google-Smtp-Source: AGHT+IHrGSJEVHvFUI6eRcGDZsY//Wte+nfUWJkxTasa3dS16xTpTNIVm+Sxvs8R3stSO6Lru3p9+Q==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-455bd87a4a2mr37140335e9.4.1752271786729;
        Fri, 11 Jul 2025 15:09:46 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd439051sm59230325e9.8.2025.07.11.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] soc/tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:34 +0200
Message-ID: <20250711220943.2389322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_230949_337383_6C5F3E68 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-soc

for you to fetch changes up to 84daa158bb5e72ec279ab168892df86a25d3c459:

  soc/tegra: cbb: Add support for CBB fabrics in Tegra254 (2025-07-09 14:29:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Updates for v6.17-rc1

The bulk of this is the addition of Tegra264 support for various low-
level components. This also adds fabric descriptors for the new Tegra254
and Tegra264 chips.

----------------------------------------------------------------
Sumit Gupta (7):
      soc/tegra: cbb: Clear ERR_FORCE register with ERR_STATUS
      soc/tegra: cbb: Change master/slave to initiator/target
      soc/tegra: cbb: Make error interrupt enable and status per SoC
      soc/tegra: cbb: Improve handling for per SoC fabric data
      soc/tegra: cbb: Support HW lookup to get timed out target address
      soc/tegra: cbb: Add support for CBB fabrics in Tegra264
      soc/tegra: cbb: Add support for CBB fabrics in Tegra254

Thierry Reding (3):
      soc/tegra: Enable support for Tegra264
      soc/tegra: pmc: Add Tegra264 support
      soc/tegra: Add Tegra264 APBMISC compatible string

 drivers/soc/tegra/Kconfig              |   8 +
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  34 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 758 +++++++++++++++++++++++++--------
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   1 +
 drivers/soc/tegra/pmc.c                | 121 ++++++
 5 files changed, 732 insertions(+), 190 deletions(-)

