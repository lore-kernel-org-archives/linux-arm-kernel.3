Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC071CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 05:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H18543Yidz2lPsEK6jrBMSNn1Pul8IVdhilZdGgU5k4=; b=YtLlG3IxaWhUALpJmSCWu0SDJ6
	bxsQeWXM2oJMnovqKgThTTGXyTbD1Ls8zZT55/HlVPChwsyDkS4g1Y7wQAFc6v0JR/O3eQUPyuMdW
	48/BPXefNCqRigJHuLzdD1/xiyGnyTVGK/UmV88bgDjzheT61C4zPfV2I41/Kxe8IYtRZsAlOyRzD
	joAE3tWcqggcc0QG+npsu6UiTGuigyfUGxUKaJnYzrHKbBL7SmH0TbtzCKTs9VW2Qx9FaBIO6+GV8
	YTxHdtdUCmLxjrHu12ZGftFfR5haJM2BVXkpZHOnNM4UxVeh3J3lF2D4LPVd9BBvqypSjjcsSQG91
	tMBA4jkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJlJ-00000004hof-1bCL;
	Thu, 30 Apr 2026 05:16:33 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJlH-00000004hoJ-1RrN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 05:16:32 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c7961d7bc09so180850a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777526190; x=1778130990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H18543Yidz2lPsEK6jrBMSNn1Pul8IVdhilZdGgU5k4=;
        b=ZftLuhdQmUm8bbYLA1jk8yoEQQE5e9Zo9zXWdFzOyILaaFJaJsD9DmjtTiZulPDZFR
         FpcmmdalDWyMSTmyyh4GGBZB2bWf38l6idJ/Tf4FrLFAKEKTCme6jfvJgCBWNGxQsuXf
         9ekzGgrDxGj5si4prWe7kBDQujMJppZFxyh2KK+oUgqTWJWSGduE4zkil+82MA1qMb2t
         /vHrHRzsj1PVDdqvzkE62E6grdiGd85+OLBuR+C1owI46f0NEJLA8tjeV8z+9QsQhquu
         sc+eCnGqP9z2muArykoRq+19AcXPiLLmk0GHvZ5ochwCnWIwV/VJ1nEKVmgJebuQs5M0
         oD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777526190; x=1778130990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H18543Yidz2lPsEK6jrBMSNn1Pul8IVdhilZdGgU5k4=;
        b=RUneMBgcxwNQnars0zIeW5YAkZbgdeAfAF2HIS5T0PE5uwS962YWiBnZlWvuby53ml
         /feHqFEsjl7BZ4p++d63MTAtevaEL35j/Ap4tBPP1B4JNIDFqLSdwNdk3Sa5A0vaOjsk
         wnsTJfZvEGM7h0ySBDnbUJyJYcCzD/En0DIGExYVVFpDt0l544HWi0EA80zyarJ3yemN
         W/AWJUylohKnGA0jR5NPt/LIwn55oQEfVr5hwLcxDnKoeOK/b3m5fKNuhupiVcTKWsk5
         ZRhq4z52FfYgGDgPpRmyETvHgMpOgdmgUbFI9Y8Ruo44bEJtvMKhF1xgLHd+RforQQww
         R2TA==
X-Forwarded-Encrypted: i=1; AFNElJ+A5Q078hUm23A9yAr8IIELLpEcbfIzWY1+F+hbRQuVVEXr7FXAqF4zQxi4or5scrvWdl4K7rLjrrq9U0iwKpXn@lists.infradead.org
X-Gm-Message-State: AOJu0YzkLrurJQMAHw9e00EdNdm2LYGkXBggYfU9E4wBGoaWNpVaHY7d
	f0DQJu5rpLWcx8ayU5+tOEuY6fy0hj3tvyFfVjl0wCsUt49wvbs3d8y0
X-Gm-Gg: AeBDies2S0Pr+q3ra2FU9mIqGg1blFOd75gue/LRx+yaUFSea/fchA53mAYIO9PWumu
	Nb2BJvX4XWa7xNDp8lvYVfhWJ3BEMp/U4HFqMKy0d0QrjwRYFwW8AlQqFxfqS88MDwmc5lxRG22
	xB19xB6rD3TzayaeqC8ZWMXdGC6ZMJJQtZsBqC2ZIBz+nOVCjd+3/Alnu1+lK24P8l6IbReRa2t
	3oOoVGysWrzcXzNBjPmKNS8/1yxw4fpZNBQWxNKFHg7eB9OuHeOZNEGDu+MDG4oRtOjEYmnBnaG
	pGw7+apDUUjaGaDkrnGXojCwZ6fTGg6t4mVY9j+dc5r4jR3icePreTnAJAFYl1n0FPX14oYsoMw
	U35WL+r9/v4GvQwlhb8lcrSIbyoI+TvSfPNneAX8L74DLZSeozCxCn4bLnSIy5oU6Lv98sjqtU1
	JIZkwwLbP72SueFFWhYazGCIJEXnQMpXwdbRalTliYZAxssFDkR/gZqfMfllpwRZEMZiiNml04Y
	cvqWjdMEuB3R6UjzRnXo3sltvFI1Vynjn2o
X-Received: by 2002:a05:6a20:a104:b0:3a2:fbf9:d823 with SMTP id adf61e73a8af0-3a3cf56f0ecmr1688019637.8.1777526189794;
        Wed, 29 Apr 2026 22:16:29 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6e830sm3848653a12.6.2026.04.29.22.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:16:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: bcm958625-meraki-mx6x: move pinctrl conkfig to pwm
Date: Wed, 29 Apr 2026 22:16:12 -0700
Message-ID: <20260430051612.700050-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_221631_387943_A862F006 
X-CRM114-Status: GOOD (  11.95  )
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

On boot there is this warning:

/axi@18000000/pinctrl@3f1c0: Fixed dependency cycle(s) with /axi@18000000/pinctrl@3f1c0/pwm_leds

Fix by moving the pinctrl configuration to pwm, which is the actual
consumer.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
index 7e71aecb7251..0ab2ed32be2a 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
@@ -121,9 +121,6 @@ &ohci0 {
 };
 
 &pinctrl {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pwm_leds>;
-
 	pwm_leds: pwm_leds {
 		function = "pwm";
 		groups = "pwm1_grp", "pwm2_grp", "pwm3_grp";
@@ -131,6 +128,9 @@ pwm_leds: pwm_leds {
 };
 
 &pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_leds>;
+
 	status = "okay";
 };
 
-- 
2.54.0


