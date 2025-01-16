Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F20DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZrp7lu3ubP7SKqqGTTc2bgd5NE4OnqPzvBDDl400Q4=; b=r2l7ZBmfjsP8ql0hrgTfudz7cj
	j1T0bInqXwx2J1ddFnXSuLifcBa+SBT1wb/zUOt5sGXk6lviGK//BuIN0A1befBD4JjOko1umVw+D
	tCWYZTmXPu1z5fDweUXvb5W0fV0AnR/LL8csRwRPJNRcswb1hpf6ZNrizRC+fBKbwnFSIUJfSD3nD
	wICo6vDhiF3lvxnnfddWwOd80Zjad0V1C2G70z+7eqbqPE83JUCXFvr8iUuMepZntX232CbJMFWhV
	Swq8bjHzUO62Kx+SZ016MuTtrLFEKJNeu9CabNF6mynFcvL0R/ROt4LcpPc1cha+Vk9suJO3xYy7/
	81d0SVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSj3-0000000FWWH-2Ogd;
	Thu, 16 Jan 2025 16:28:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfI-0000000FVSB-341e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43634b570c1so7670635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044655; x=1737649455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZrp7lu3ubP7SKqqGTTc2bgd5NE4OnqPzvBDDl400Q4=;
        b=Jp+pTSAuR4AyzfzTvB3qIy2W00hE0gBprf26e1uFhLT2rezxrye7QCnp9njLNsUmVp
         GU9hj1R3lSUy9J33hCpczeYjnAB+AxZGul2SaXHwM0SnhR8LvSpNqHviZ1qWUBc0ZrMS
         3oXCM0InMvJUzOV6KN74FCi4kpQZOMfTf/nL+ytwuMs7WVclr4DPrs1ttmDJwiU6OPIB
         Djm11XSCYsCZvOWLCBJ5LzzW/SwLy9D8ROXrRc1b9mozovo3B1dxlmq+KwbMDeC75o//
         FgrCLGAHb8yAqa1MbQW2IK3VXg0QX6KlGJsljUznLY9PlyXSYkgHLpBVPvDVIOas2vaF
         rAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044655; x=1737649455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZrp7lu3ubP7SKqqGTTc2bgd5NE4OnqPzvBDDl400Q4=;
        b=OIa1MXWS2cMX3xV+pX20Hi1LvBSV3M8uCCf9HkSd2bH8zSTUUx6fg/VAWIsoosL+4w
         dwboQ/K7tqv32TbHnytYnQt2zKIIeg9V6v4SqZ/hbqw9A6HKjuni42T6GwjWbCVQ0Qu7
         UDlmP0H6goWlN/n7B6aTmDOJ0gDoqa3FN3MjCy2uclYOhWsWWobhpDV6tN8MB+lmeGhy
         o0mSruM774q5apm5ljIVMdc3QD++wveqAK2fSuc7ecsO5Sokwj5nxXH/KTysQtoVOAcm
         Joqwa6B1Vx6vNPfcNrg9fIaxUxUCfV/jSBbe3+OEenlnozBjaP/Vr6Z9QMXM89nNRhpX
         Jg9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/P9iF3YC8+4H1dJRvvYq1faxV505Qajg9OrHXEFk9vI8YfjIDmQAsdsszaCip2M7e+tp+u0b16jb/vh8IKTEC@lists.infradead.org
X-Gm-Message-State: AOJu0YxR+oeXRcvyBBNtU4tGYRlijmJD6tlMDYPdln2p+ci/XVKWJs5j
	ER8ZbiEETQ8+VlMRV8BGXb1NcJe7n/8CbgAhT5CKoSktPv5zgA1eZlhG0YSq8shSaKT7vLwknVQ
	9
X-Gm-Gg: ASbGnctbrdbj7kG0jDE8k5M2qY3SwdLxKaxSzeBoFpHMeAugGpU/mCWk3HxC0ZI48Ms
	9xBlEp4eh2Y5BmGjbtO1OjEixf+iLoXFM7mReOj2OL8JYo7kXV3nNnXcpLZYfEzEHRpUV2EJXtQ
	+1EcDHY0rzlF7oOqmZ473GKC8qmG/iMfxaK+DzFljnUA2XMGjbKg1rZu5OcFMJ8c5iN/uMUmgLp
	YAhz55Td3I2WgfH+5Bq/zN1tMndSD5g+WpKOzjWerAjef25
X-Google-Smtp-Source: AGHT+IFiO4THDwrkWPkgQut59S8Z05jEzJwPXhwEqlw3rbldrlTNRXl4E+qRkkCpAywZLqr8fVkHTg==
X-Received: by 2002:a05:600c:3584:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-436e26f47efmr243629215e9.23.1737044655043;
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:14 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:09 +0000
Subject: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust gpu
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082416_759754_8C470BD7 
X-CRM114-Status: GOOD (  11.30  )
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

From: Dom Cobley <popcornmix@gmail.com>

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..d374538e7108 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,6 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
 	};
 	int ret;
 

-- 
2.34.1


