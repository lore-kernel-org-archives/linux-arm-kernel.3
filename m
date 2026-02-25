Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1AFFD45F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4ksg5veTfH4UKOvTaNGiraW9Qxw+IwBSdFr+sesLCc=; b=ZbtQpbfq8qtPrne3UT7d42Ejk1
	zISmFw/Gr3arZ7VjyXk37GZPjGvibhiVX8Dtxr08u1oa0eW85STZof4zM5pHCUYcJCizLm6QVPEq+
	J+0Zt9sZlNBYbY5KXSOmTwUrAZJ84X/Gs1wwVlif3E+TX8O3aqO2wK+bDri4ReVoyNvizQxI2r3Ok
	qp6W9/sZZwHtRDrR+uZvCvA0Vh/wB0eEp29IutDBzo9ia/pIhpJTIpD0Th995tF/zJH+zsLySrJDs
	WnOvk7BRlcrKvCfocI7Qej9jUSCGIsLvpcTPpXrRpR9wmQ1El2/6ajHvwOJqSH10mGYQuieS7kzF2
	aclgcekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvO07-000000052Vf-3XHZ;
	Wed, 25 Feb 2026 23:09:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzx-000000052Ri-1mCe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 23:08:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ab232cc803so780625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772060933; x=1772665733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4ksg5veTfH4UKOvTaNGiraW9Qxw+IwBSdFr+sesLCc=;
        b=mHx2RBs3iyUFuv1sJ02Zh0vy5Ho5At3V2JXBc2VHlHH04aNnqaS/Na9qbIHx8BPjUM
         UP9jWO6Z4eUweAdtTxniwQ28EvIyQbe+/kBNRa5XO/g/6GwkO097HlgkwZQioun9cF/W
         +ERTXnk7S7Dri/rODiTsSD7amO4AygsTDbafq8yiOpyYq0hRCutWaKYEHMZ56aCT4e/m
         zUGg7LPW33BoQUVU5kexKUY8CsZtOztdKSCJJV1LvbKe4MopFP1vuGv62uNkc0Y7Gz2t
         TAnaxzNdeI7UbhngTKahuhbTes4o2nJL7Es8A2WSW7kX5+IYzlYAKlaIxJDHhj2TlOgx
         55Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060933; x=1772665733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4ksg5veTfH4UKOvTaNGiraW9Qxw+IwBSdFr+sesLCc=;
        b=KD0VvfpuiHXor2TJaM5w/BZ+xIhEvevhjIHwv4tQdAlP1mwTf6J6fjZ/fjcR4EoKow
         w1iC+BPdoiSG2uTdefh4oFcqBhL5V0UMiTyU/JpKNWsQhLe/cVaBPei/hvSMpvhybjH6
         zvXmMDAW90nSJawlBguUZULQdUt2joiR2yz0RQ4UjmSrALQroW9EBV9opXj78xMBTf8J
         y28m5QGkFVZZ0hg5/RL7BS1q4IEh9LyBKXhyZX+lwq1UwB+JW7Qgfpy433+g70Rw8xHQ
         O2nV8I8oHfzXhVcuK0H3Qetx2azrHlSK/UiSJm4s0p8mnRw8LZ7vRofI0ytpmqoy5pI/
         KYDA==
X-Forwarded-Encrypted: i=1; AJvYcCXXWxtFdrPLWEnEXkl4QtCcdIDU22I/LFmTLSqrRgHPmautTCEHpTzacjqY7pnwD6DGp32uRPUm0JsPqujSHmmI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy07JbElQtd+31HPkEqZ/8hWTMCqm1VMB7fWNR4VajHowi+LSN
	jRTCpYtYzm4A0+ObFg2Mgb5ZF93i6gq2R784b1nRaaorJX+6ljXfiA5t
X-Gm-Gg: ATEYQzwGBpHXUfrCCpRjuGumCDV4ZnsTZaarQdQa0joaA/kiQlL40VOb1WxKjE6orGQ
	7Y0rG08DENm4SCXPOpI9sS5OsUTrVvpm34hF1iNl4r/3OxXb7I26iZ7rEFO1dhBoy7fooaAQzZm
	TThxjpjLZwx8N3mNtiOLJ+mIZg/yODt2V5JgXpsy43cQi8cdR0mCIKHsiauzgmtIIelHT3bo9Ck
	pb8J00yG/+pg1+EIu5qc1vTB4HxOqNYQD75fP4rMURxnV6iMjSc8hR8Y8toKCUFJed7/JMTOhwr
	HR0gFdsrGPadBhFdD6eEjS3vCZ0rRLOGsENBI8PEH0a4rfEROUUxdNqnAGIiFTBmt6ZDDRyJPEN
	TKDkxex+3WVOLyS+vlwxIfiQNhYXszjypuFWsSY4lU0MH3CHZhrrFIBvPZ9VDjki1ONofSjPWd5
	Euq2pNa7GGMGUe0URKNBpU00n3/ZtucsNC73CT9D1n494b9ndUc2cs7A==
X-Received: by 2002:a17:902:f607:b0:2aa:d7fe:8603 with SMTP id d9443c01a7336-2ade99a2475mr12701885ad.8.1772060932773;
        Wed, 25 Feb 2026 15:08:52 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm3378285ad.19.2026.02.25.15.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:08:51 -0800 (PST)
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
Subject: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
Date: Wed, 25 Feb 2026 15:08:27 -0800
Message-ID: <20260225230827.21715-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225230827.21715-1-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150853_482737_2713793D 
X-CRM114-Status: UNSURE (   9.62  )
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

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 01ec8c03686a..f7da8e58b8a0 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -127,6 +127,9 @@ &srab {
 	ports {
 		port@0 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@1 {
-- 
2.53.0


