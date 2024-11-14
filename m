Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C2D68B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3JMdSgtq+Ttm3L6LRQ+ruGkVxLt0T6TxcM+79MWVPjE=; b=d81Xi4lERjY4Oq
	QlHTAV5iY7vp5nOA5kkixxvyhComf/dV98Ap8HBGo+/MN7SAWUiTlMVRmBDjcGgDTottsXzQvfRXy
	/6+AX8tjUf6AAShby7qEphFo9lB69CCl301VKZeDdNa74ecHUo0zTmWt96VDq6rq/BsnvVA/b6qm3
	nO4GHhqsghfrrmlrBF5rbt0alt8VevRXFCjx75eawVa5LTc9CnptcXOGSdCX+PzgMDcvRAda7svrn
	dMjMWdTrviVG3BS6DfUy5o86XejtUK/g8wn1MhEXwemh1ScraPyFCI35E7GOG2FAiafb0voMvTG1f
	8a9Rs4nE5aLINUhNkyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcIz-0000000011x-0F5c;
	Thu, 14 Nov 2024 16:02:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcHx-000000000h0-43ws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:01:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d533b5412so585918f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 08:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600103; x=1732204903; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JMdSgtq+Ttm3L6LRQ+ruGkVxLt0T6TxcM+79MWVPjE=;
        b=jgR4MrNZYZqPRPGkPEkpCg7kQnbeSXeyOSK3bnJ050zxP40bLvtVxR2YWNJD6lonrT
         UBFbo3iX9k3UwFAKwd1LOLLHahPKETUqCjYFUzGjyFN7Hux/h1DGlH12sKdUPShrrr6y
         r/SmMctg4RCSg94fOXpg2Doc+tO0H5t4muC5F9twrgK3CjLA875F4m3130Jd1TPg2M2e
         wchqAgJkD9MFBDIqi+PfFoMy7JwDCGtVKndYcdDHZR8VrkJK+DpIISP7kqiJAQfUTMtb
         Ygm46BgzD0/J50ZpblEzI2cTGpgM3qIv80xb5rhq9aZqJnB8rQy37y+lbsqMAbogYM9G
         rHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600103; x=1732204903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JMdSgtq+Ttm3L6LRQ+ruGkVxLt0T6TxcM+79MWVPjE=;
        b=WXPUuFoh+ZATCozWtZy4YX8mJUu2yZEqWuzi2qgFBxyPjBhPlnhwt9Q+uzRP67Zh6t
         eRL7utOfUFzgC21rvXcAF1MDPiqBWyBWLhpCdYCJF3vKiyJdN6Nrcphpe9Rmh4USYeFY
         wU7HrzHfhmeGw5Fl/js7R6jZEmStrX4oU5t/wd87rwPAJ4XZ40zlNOQwnHxvOF2NLj/g
         8WH+Ge2oM3UwlUhdSs8UADe4ZpREjhRKsSLbzJGmCxnUeLM89DnY+LT/VgnMNnSNtQMf
         JSar5P4R14P4DYoR2X4l5rEceUgILEZdymndCLsbxlpUwSsFSnBpdiqSeGs66SO7CqER
         1MiA==
X-Forwarded-Encrypted: i=1; AJvYcCWEFdSzLvmlEXcszAmdyPy0/JZYtPdijP0TCysr/YPlSp6xBb3XT2QZmipBC56m5HKdP2iHXP4z7eXwXJTyVFKz@lists.infradead.org
X-Gm-Message-State: AOJu0YzIxdty9RiDOHYCDL0JiVGiUVOkQlklkXpCkd1btm0kI7XupyiV
	wsNDgXshZ/DuYxOUcwzvUaHZNzRRvSOE30kMEWm/GKjMjqN6coL8VT616H8/t6Y=
X-Google-Smtp-Source: AGHT+IHU3640S++GiWHY22g8DyZvC0xVaN2q6y5oxKROmxj3Ujh55YAboEOHGvnPvVceKb9fEiHwew==
X-Received: by 2002:a05:6000:784:b0:382:5af:e993 with SMTP id ffacd0b85a97d-38205afeb31mr11196763f8f.54.1731600102718;
        Thu, 14 Nov 2024 08:01:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:42 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] media: i2c: imx290: Add support for imx462
Date: Thu, 14 Nov 2024 16:01:12 +0000
Message-Id: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgeNmcC/x2MQQqAIBAAvxJ7TmgXS+or0UFzqz1YoRBB+Pes0
 zCHmQcSR+EEQ/VA5EuSHHsRrCuYN7uvrMQXB2pII6JWgb1YJeGmvvmgO1Ku8ziTdsa4Fkp5Rl7
 k/q/jlPMLm8rouWUAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_080146_204456_D09C84BA 
X-CRM114-Status: UNSURE (   9.33  )
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

imx462 is the successor to imx290 (and imx327 before that), and only
requires a few very minor register tweaks.

Whilst at it I also fixed the todo over imx327 and imx290 having very
slightly different maximum analog gains (29.4dB vs 30.0dB) and added
that to the variant structure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (3):
      media: i2c: imx290: Limit analogue gain according to module
      media: dt-bindings: media: i2c: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462

 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  2 +
 drivers/media/i2c/imx290.c                         | 78 ++++++++++++++++++++--
 2 files changed, 74 insertions(+), 6 deletions(-)
---
base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
change-id: 20241114-media-imx290-imx462-b6d1c24b77b5

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


