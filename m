Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB02C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=; b=owE8W3AQfSupODLL6L8jELNoIO
	G0tErGXBXgJF7sL7qphuWVdGAWM74Thilw7zekzBGmRaB9UWLvsb+jzrr3HEmuicis3mY1b3uQELp
	BVPk0CzJ29Q5qPlQsd7RNvT/5dlBFumPrCnQjQZAKzLDz2SRfpebVJlVsqGWSb4fLv0EgU/Ou9KK3
	Q8Ml8zgf4GLNfxJ+TwzADi2r9BwtOT1KieKhcZrmOAPUrzI9b/SzJZOghbikEVoP0ZT+silJKBFLS
	+CVtG0gHToO/Q2N2vdsCR/VnuZ5YVfzpPjRlxZKdVwmgoi6QCmW37EmehEIuzudOYo4i5EPGi95Ix
	cdGXgYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZQ-00000004FJO-0oRe;
	Tue, 24 Jun 2025 00:31:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlPi-00000003cgy-1CPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:57:03 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so6777678a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701421; x=1751306221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=D009UiulR1m90JuJiGshdCYMLvG1o2BkobA1j3SfYDC3jPgI1iTZd3+NKf/1zYQZQs
         J9rzVYnkp1ZBV37gOmvEIFthcj+T7W648eze1lOijJP+aGdi9SAspyCNOWVsOgvKFY2Y
         LsNTZAH45LctZVPs+aR7jhB7lnSJKnOtsbPzZ9BgM6+3H8JhOS5pDwywwifMnsLYMjj7
         Q/QHTDm3hVtYypXCvyUiZOQSz67b1HG0AfqH+aY2yL4agopjTgf/w47swost0yaqnFfb
         ofrJlnwpbEVfEDOXJtCfIxiPLdqLNcAn7CiODIaTaU42QmvazsbSwaLBR30pcKPeD6BL
         YTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701421; x=1751306221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=g2kfXGoxe8VQiX9BVcHTSUFivuJ4fg2pAS72WEZO3vTeaanu9JZ/+gtYnWlnnd/VhO
         ryLGazViodOWzHiqQpkvvKjJ/5v5z9RBJsrYdtTJrykWBX8EW5bUrj1ibWbHk9l6Y/h2
         k3dbBBOOgDR3a3Y4RJrvSSPaskgY0/k4fEjc1GQM/HStgDcC1dFLqqSZCsPO7SIrvEHn
         8Jl8CfvkhNXUBduJyeM/wM5Fml2rYYoqaXjCR4IruoIfDVvMY3C2jgRkVMl60rqmFO24
         zXmPPnF7In2gu6oVgRXXClJznVz8vWN5HTX1u3ghktzsM1VEM6934hzk5+/biBPJ4a9l
         V3aA==
X-Forwarded-Encrypted: i=1; AJvYcCWMwMay1Y/LeTzmvRnvMFa5MzCJ1dH4h9gvLy9xphFu52EwWu3FFjfyjJFFMQYr44M5EdEDvZzYOaxyDfC/Q+SO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/M97bR5JJrWU6/Sg8d2Dd5I0IyzhklOxhkDf3HtsN+ztgqdV3
	fw1FcFFumD4D/A+YH4FiMKA42tVxK+vziy4oOKIwGEVeMWNW7JFEs2XM
X-Gm-Gg: ASbGncvAO/2FkK0UVfMZNok/j+2XkAcdPAC0Y6gUEujpDvy50ZX9zpL4JFf4PxyrGmu
	je9DWL05LuXHMS0qCKc109PL1BRE8p6OhLdj7API6Ika34ZYTQIy8F+Lf/A/FeTrOjV50v9tK2Q
	8PctOZRSCEdSt85ChZ29Dvz2Iq2KGyXU7UphypOBzeKcpTTimqJLxB3iXQ+ud1SidaiRlqJoNC5
	tQpev8kmaLntktpzpIprNrvBLp7RVeSlyFDCMY9IZNJVsyD8wVmMcAXv+7Gl7HDhieighc4NN0N
	X+ZZVdD/F9PSf2dm6o2DRt/dt1SX5RTN9Zu/Lmkh0M3YcilG7/RRLFyzcnU6MeGqUw==
X-Google-Smtp-Source: AGHT+IHR5nn3u6Mv7ocbuLDN61MWU9EZWoqVXA0uTBbGSLbAMV2C/+qnL1ce0DHE5uebTg0oqAbKoQ==
X-Received: by 2002:a05:6402:1a4b:b0:602:f026:7cfa with SMTP id 4fb4d7f45d1cf-60a1cd30fcfmr11406465a12.13.1750701420638;
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Mon, 23 Jun 2025 19:56:50 +0200
Message-ID: <20250623175654.844281-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_105702_327611_3970D8F0 
X-CRM114-Status: GOOD (  10.99  )
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

The i.MX8MP-based Ultra-MACH SBC is supported by Ultratronik, and its
device tree has been added under arch/arm64/boot/dts/freescale/.

To ensure proper maintainer coverage and notification of relevant
changes, add the imx8mp-ultra-mach-sbc.dts file to the existing
ULTRATRONIK BOARD SUPPORT section.

This follows the established pattern already used for the STM32MP157C-
based Ultra-FLY SBC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67a..48af272eb62b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25411,6 +25411,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0


