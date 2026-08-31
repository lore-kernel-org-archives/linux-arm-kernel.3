Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0332BC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=; b=yWogpLsfVhf6NAIxxu79bco5/9
	U8k4i94iGSBimw4eOwwjdcH8D4oRjfzw7wjnwwRp58fkh1Vg5JfizP042UxTHCpteGmREoJjshhSu
	bK4ktbPHt1ZnGeG8xZgYxZTUzfeOr/yG/N3lyStn79dTeVnhPw1GTck5LHr60js75guXWnlT8iQiR
	0PIjoOOd5hHmnJjCumrcNb9HRz5KdMXxMLN39Yvo6QQxo6XRDj7CS/GBxhA9oV0PgflVpWTmH+ycr
	aJW4S/W9Zb8ZUNTyuURQUSkJnG2ZoDEwrLp7OBoL+c4L7iBDPd0uDzXEtHqtTtvI83+r0G1BVQ4ru
	tFHgwdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BYG-0000000AfjO-2XyK;
	Mon, 31 Aug 2026 23:36:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BYD-0000000AfiX-2AgH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:36:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d6efd73032so3392155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219389; x=1788824189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=pQ2cCUOwgM37/YEunYp5Sy0LtPxgFfRS7BwH2J5p6uO3Ue5McBnYjWHd9wBQTTxRPj
         f9saRgQploem/5m8PRYELAdmymcQR/m3sLmHLRIlmtRCprbBwhmME1BNPQwDCYNkMmGr
         PZ2rZevydQx2DsxQkQ42ku77izo36wNhcwIKUNGecKCJU44DbdsVFd8qTvI7lE5CRKgK
         WcRugJRxuu4RW5uchSz1Ty5KKMyGH4D2MHNtaJj0o1q26q9Fqhb2sRnsQ9rubbX2z0ld
         zipKKKAz9F4+0FjLljc3ikJqKkIxogQRCasgCeyzL4NErAKgZUWJ3B4o2AKkSywMDn07
         82yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219389; x=1788824189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=knpAcI1mmbMPLXNOlKrI1np5PCzFwIPAQYkqjyo5NsiETNszzXR2TzT9bxxseb37Sn
         bUcUASFej6/6pLdJ8+8hhLyis3PSSP+CqDqqho5H2G4ZnRaiOglkfM+nYdvkt+qsBhQX
         wHDaSglw4YSXgzpQ4rAYjkxSsi1C2HC6sMDzoemqNNqD30rySlXYkvIU6ldpO7A/pR6b
         c2593dABA2a+N6Z3TaUMbEbV+6DbcRablpOBpHI6tzDBtTlMyqeLa/EiN+fFAPeb5LJo
         bEtT5miGGqFnSwV7mT/qAXuyHdDL6FfYwQMJ2IrgZFdccmRd1OP2PpqslonxuhSQAOuA
         GDEA==
X-Forwarded-Encrypted: i=1; AKwUvBw2UxJg2E7BDF/q9n8La2oe9H/qTtvt3dQg/CTyuN0uoq3PcO5xHPvZPSQ4/Z6PDAZgJHDWM44duyKGCxCbC7AB@lists.infradead.org
X-Gm-Message-State: AFuF++kOJXI42B8Anle0W0LK+Fj+d0Mpcpe6QFo7MA2cI0V1biMkG7r1
	XcZ4U+XAHj8rbbVNBRwoGrZwB9NAy6AZlIIEI3pX9nuBcoSBc3i28jOk
X-Gm-Gg: AYBFou2pU1yRVBLLvV+uhmce1LexTjcHhaN+P8gmGEtfIGjqpZ5IE32dOp2G3LS8uYj
	hOlLOHR7c97GewWlHPesISvXyNOh5dyS5pQht61vJ5UvG5B2cqSdizs7Xc38WXM8pFsMSjk7nPm
	h4dmAnS7okBhQgFOTyHZFWF63E6SigrdpjdfBehTH5hgWhFHwLj1w50+3SP+vM+d0bIYGzIP1Dm
	RwL96X3W3qpLvK7yi3QI0VWDXtLlvRgra7He8rNx6JF70a0emctCFNvbZpBQ/k71d7TifrSCSxc
	yOeJT035KDjsAFX4zGpi8MFnC3XxuW4kvPKdPLGT1HBoax3YXKSkCKJ9XrhOOW5J/YIHGeBYWtn
	mlFdHVrQu/qx143rKpkzL33pI0PCpt0IEMnhc81VaLbXfcoVchi4azoohHMMD75ntVmQ7nGplL/
	Jx6BHEiE38Dgg5XIq0soskf6jgdFElFiQrlakOQIDjSQLZoOUIOE6YpwZlwWAtF4XMLI2gRofsX
	QT/ctmDeSwbwWZt9wh6eL/7UXUqDgD2SlaxnfhVls+jDUAAC9RZIDEfjZws+GuGw/OH6NJSZ82F
	AdLohWcxedjv4B7UY+kZS5S0XBpq2FqxRLTt7Q==
X-Received: by 2002:a17:903:1b08:b0:2d8:ff71:66ae with SMTP id d9443c01a7336-2d9526d32b3mr11811515ad.1.1788219388599;
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d951b52bfbsm3732835ad.17.2026.08.31.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: add #phy-cells to USB nop phys
Date: Mon, 31 Aug 2026 16:36:26 -0700
Message-ID: <20260831233626.13947-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163629_561812_F3E603FF 
X-CRM114-Status: UNSURE (   9.50  )
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

The usb-nop-xceiv binding requires a #phy-cells property; without it
dtbs_check reports:

  usb2-phy: '#phy-cells' is a required property (usb-nop-xceiv)
  usb3-phy: '#phy-cells' is a required property (usb-nop-xceiv)

Add #phy-cells = <0> to both nodes. No functional change.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index e63b8b5e632d..548fb92ca811 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -141,10 +141,12 @@ fan2: j17-pwm {
 	usb2_phy: usb2-phy {
 		compatible = "usb-nop-xceiv";
 		vbus-supply = <&reg_5p0v_usb>;
+		#phy-cells = <0>;
 	};
 
 	usb3_phy: usb3-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 
 	soc {
-- 
2.55.0


