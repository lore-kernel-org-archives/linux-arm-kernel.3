Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BAFB5164
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=; b=zeRXUWARY2W9uDe2Nh8+Qc9SMA
	qv1EXZv1k0YtFeEQvKtrby2IFvLCauHzGcwPRVYzt7k5FKGOWu3iNrI75hO1Z/WwVw53KFWy/6CbL
	FAmaG4bXRzJZVKuYWfZ3PmUVQ51AAE/b4uTbVGbEhtBLCp3DPCMwQpY2mBc9oTYnb9pQAC8sdEwex
	e/YxaSWS8B+7F6BS7xYfGCvnCdgoM5ZdoOOpq25ygrMo221VI/t53/d/ErM+oUinR8i/oRIg+cNmR
	7yIPe9zq3duNV9Hb6Iz9D8JYzS5O+SHHleC9cuDtvq8gI3D6VRLifdLtfv80B3Z1dczfKTMegPR8v
	YhiOcPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s4t-00000005YHX-1T23;
	Mon, 06 Apr 2026 22:05:51 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s4r-00000005YGz-0Ujl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 22:05:50 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8a08fa355a1so67935576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513148; x=1776117948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=pCpBaIi2lziKVkVtEE/VgT6NoCTcjV1qIWbQ6opmidJKRtqr/I9kOYKgRhC7RGE/jG
         B4Y6yp7q5eW/DrEIK//nGMJ+jZ3qVbqTCElATB0I6Zr09tZKcAZRoinFZPIKChaVBbx+
         holpS+sd3LGbus+zh12jPMN5D5RMhbVF8in11C2c+VxffsjXST3qWH7IjirJ4tjuj/WP
         850qfbD5zPrVOcSTR25qfV03GR/wNGKJhLI7fMC5au83Ilci8mYL72tAtXsMV6fS825J
         yUeG01+56XeRXRwHOAxpsF5G7hdHGnDfuafbxMDk1VrJ4hKBvIIUxG/rYicEtAtkGdI8
         sL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513148; x=1776117948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=DkB3+lKJTauNgQzxzrCC2jKp519Iq4Jjax8x0vvoq+vAoev7H5691yzxB0Oi7mT+Di
         FIlhhw3QS1nDJFEtbhUpaph0D/0Lkokv/Qrz2xNShaep84H+4DM4M4fTP+75B2+xEeD8
         61BunFdvlblRR7rxU2CzmhFj2InJ3QOckAiuDgRByJq5FcdRY3suno0GJrglEZuC2POq
         rKNWK9b9KGY/0RO99EkN93q/GB4EVElAplw0q6ZpUUDYgCSPaYTbM27Pqd9D09SB/K3b
         GCRsfqEUMdidFXqsrJU2crxoRim5SQkwXGNbDTorMofj73dqjbsTzAg5gYk2BIDmVqKt
         sc3g==
X-Forwarded-Encrypted: i=1; AJvYcCVdF3ILwrI5kN/3EP3r8j8j56SC1aXbTcd+0lLWsS5rsNhhFaa7BRvpIjTCqo2tCaTcujptzZU7HZg3RLhYBvhf@lists.infradead.org
X-Gm-Message-State: AOJu0YyuzxRg/AZMBnX4M/d3suCsN7LXL/9wZ4a+jY23+yPgkA6yrsDr
	m0qgDtrhoKibSubVGFJMrOsJUGgEBgfohAW2KFhBDaO6RgC0ymomYBbT
X-Gm-Gg: AeBDievZEkkT3aW/wunULKNHZjcv/kXo3sNzvw0zrH+wvOnY0xEwDK47zKEhOU+DOJe
	G0KijYcv41Q277rFEqx2bWPGWsNiTQjlOee8ogLLYI8kPQVAl4Pk3LLe2Z0VLfE6sFuBjqNQS5S
	XuKDe46mgL/DEPRCdvZ836wrx9qfuGbsrhvDUerEx5D7r3tf/Gt+04d6txReTT7fG9HtL/dJlmX
	gTzU7S/yI0JSPXUfOTa/yTmCJgW4KZuaudP6U/wxKPRbqztAPCVCJNJciUDVdB3dZTWyrqLn9lZ
	i/e5jmIh/cDgulCj1gEjNBYpC85k8RAy8d30TeL2Vi8i0voCCl+FXHBIym/UIpsfXRXrKCVgB46
	sWXC2bIWH7NLFUXEOZCvoa32x2NRIQahUVhUGO2w8YLJzUHRHNdoMZ8C5KSvHo2mRCbZDLaWp6g
	k0ZfUp16hvg3le1NRx+IDgPHSdozje+dHGJqZfeqVeQAaIH5yeckLgzcU=
X-Received: by 2002:a05:6214:5d8f:b0:8a7:3405:11fe with SMTP id 6a1803df08f44-8a734051359mr226337586d6.14.1775513147649;
        Mon, 06 Apr 2026 15:05:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5933333d0sm149981886d6.1.2026.04.06.15.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:05:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
Date: Mon,  6 Apr 2026 15:05:28 -0700
Message-ID: <20260406220528.101340-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_150549_161059_E7309501 
X-CRM114-Status: UNSURE (   9.41  )
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

USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
to do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index 0454423fe166..ad246f9a734a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -43,3 +43,7 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0


