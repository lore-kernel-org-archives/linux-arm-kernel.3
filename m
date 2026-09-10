Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79193C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 00:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xbRjo5acd8UMrmfUyBjMrQSG2cF8chnXYW5XdzKdjdE=; b=FpTEo8eqOBkJJ7zb9XhEYE+SrF
	A9Q1dY2MWBjYJGhCJoha5M/YxhWmA0y+QEDiTJWswQgvizCEfLyDXy04GI/dm1ThJJFbUudR4yaCB
	9wxBUS9ZiquXGLaZqIXMsqXBu+lbFxA9Fb1PiXajCzMVfPGw3urZE3bzU569VX7HM9WAv4R6v81YT
	Pfi4agje+rt93CADKbiDvM3SNuWnYZSHb90c79zWt5SRkkOppPGH0WHYax5RY1orD+QSliJcVS8vf
	eeUhpSPe8+0xPKIYbxQiIYtue6+qM9yXhf95QiKEtC8CRlIfdXzIbNaMvS7rvPXPONN953Y1rEHFn
	zX1lYvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SPY-0000000D7m4-3meJ;
	Thu, 10 Sep 2026 00:13:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SPX-0000000D7lN-0IZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 00:13:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so8335385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999182; x=1789603982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbRjo5acd8UMrmfUyBjMrQSG2cF8chnXYW5XdzKdjdE=;
        b=U4ZblvkRxrfpY2gIb4Hvu+fiQvC9M9ZY5qD492L8VAgOfh/0cV0FJbxXuUVqT2WFK1
         CiMsStXck/9KR4ajjg4Dbd0PA0LfBoTFqI2RIq0AUFpUvQ84ZCiuJsWVXy0mcXFRpiAG
         2kbR90Bk4AH2bp5phNYOQkSbywWP+IrgWb6iZXrxIa227m8Jf66BMDNOk7l3WqxPQNSd
         esR2RbQfL9vjMOHz6x/IV/2LF4omdszoNTN2IIBaE9OIjWvPjckEj08CZ6IXRUT/x4bX
         +XdjJeW/LQuej2LRToJbLshxTkRQsHSAurgBjxKyICxDBZ498RWe6WxU7X43v3UsJilR
         l1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999182; x=1789603982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbRjo5acd8UMrmfUyBjMrQSG2cF8chnXYW5XdzKdjdE=;
        b=k7hNiUDyl3+naiBXNawtD2+hv8zXjyc9Lligba4n35GB+2C5/BjqsewIYdbI2coveb
         1An023wYZaCBOyeH7gtDTkhRvE40PymefT/B7i+63GuX1mQiGKcNCZArMz244XODe8tR
         EyRVFO1RB0nLIfazrC4i9Do6hTzM9mXHQdifSCyoUFEyUc7oulX7WOY00zIDztJe67Uy
         +WIonKSPn/dfxF5UgY6vktpN8QmOZJdiPQlVAlTkAgDxaqubt1WqK6dpmss+tbQjR2gO
         zBlmag5+VjR+UZZWWIYB4SORZHi+8dji7BhY2n9e7ltZcJJg9myjRCU0lYH9VPSIeG1z
         YvAg==
X-Forwarded-Encrypted: i=1; AKwUvBzsg/jbXoyJDC9q2G5bbSdUoQxML40Q0o8DffnmG8XEzT0sapNCl+Svl8BCjZ9VQ9d5EVas2/bz4XKNzyqU2i0a@lists.infradead.org
X-Gm-Message-State: AFuF++mFYJVjI0vqnn2r0AW3Er8aAIoVKLkomXBSIgf402EPVO/UHz0e
	q3ho5j9V78D5WOlNaChJkujzzKj3Do2d1ZsTbgbCTgy4azj8gYlBUhnk
X-Gm-Gg: AYBFou3OzcysUbQ7msw6Npue2haYXc8rHTE+TsFLGoEmrNsgoaKvj6ebuzzRLxDIIIg
	u1hFhK7XZZ4FRGJFO84SrXQxxHoBaxrOyxvW00CitL9gtKx3AC5tRcGL+wMOBvQImhEfVedY8Gj
	wXQt3M1IusEr6IlBGOVTFMLb8jgaY3Q78gLp1KIRn1aNDZ9QKyn+ZfNCp5cYXpPfD6BSYm9RisZ
	UDwEdcd/iX816L3Wqwg5x166BYjfDA/MApWFk6TUJp5Fo3PgGoziq/PXhwsainh+nMFatlKi08I
	IYXt/3DhmZanVTvkrxGmWS9EJh2aiKdE/pK8HM/cBStJX6lT4C50OwueOVNIrLQsraeM0OZ2ptr
	/KddO96a61cCFPNecKpknvVacXZO8hdf2Nni3EN3Be6dHGaINO8mBVeckEdC9694Hwo8Xh4tgz1
	enl+rDEB1u9lYEL5u6/mHxdQRtjj10muxcdC8JW3HrR5pjTL471TwJOzRjPFAl9f8XnUIuvQJqR
	vKTkODvmXeCy/B8yn61gohaLTS2TjzM1lPDwk+thSZ3Dm4mepwJBCIr14B3KH+ys1U+JDWeKhpU
	hkWjAZVRHeGhwD2yxYdniXi/q2kbu5A21kSBumG+ctrcQfJyXihRFjlSVY8=
X-Received: by 2002:a17:902:d58a:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2dd07b9c78cmr58953035ad.19.1788999182341;
        Wed, 09 Sep 2026 17:13:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499dad4sm80556405ad.55.2026.09.09.17.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:13:01 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: R7000: add nvram node
Date: Wed,  9 Sep 2026 17:13:00 -0700
Message-ID: <20260910001300.117062-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_171303_113292_003C75D0 
X-CRM114-Status: GOOD (  10.88  )
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

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..0f3a00bc38c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -104,3 +113,8 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


