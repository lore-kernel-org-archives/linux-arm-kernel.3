Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QMb8JXvN1Gdvqc6Udpf9z7oyPReqbmlnrTlxo92lbAc=; b=3LXCQ9rR9Lg5rk8on62BjjcJZn
	y1aElNAEIpQC6rdqWRkO5oaEsn6vHNwkSeaBUo3SYVDfDp0270aMBv6eWp7pGLsk/2305UmDHksZY
	iFo+2+28/pySAjILW+iVHZ6/8p7JyY/xN/VHOFJpKZ44TN/ecPC+eLbxpftmqPfQBMIaVU5z+mJzH
	ibjpKO2F2HjlIm8i56bAysDn/IDJBEmXDQCCRtonnyn7egJ96aO5Yinx2eM+9/3WDN88tqg31jqPZ
	VSmWVhLsnzHDITEi/KwNZdEkSHxLl/m7aZzmWgdbfOZAjVGjQ4R4ctfcjBPW3NagNFAapiFZXsDni
	vZMkeObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOJc-0000000DFg1-44R2;
	Sun, 07 Sep 2025 22:56:56 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOGn-0000000DF6q-07ZP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:54:02 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cKlkV0Pbrz9tTZ;
	Mon,  8 Sep 2025 00:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757285634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMb8JXvN1Gdvqc6Udpf9z7oyPReqbmlnrTlxo92lbAc=;
	b=sUXEcb5lQuNABUnIkG1XebMhxPIwO55Gy9U35fDxkj5mUIG+V+N5AfX+lqUqEl0BZmO25y
	pE9A5WedcrqUCaw4KELsP92+b3oNDfiMir451+CiwAwLwkxqVmQgmBc/eCjgOk+oYOQN5G
	bcXFVcI49FMgqEmg68Tn/w92ELTNAGCWaTE+FC/0dXc3mGNS6f/FHtI3xD6IT9NWrRvoOu
	b7nbwmj2Oqm7p93O0K4pf+tcS71r7yHOAZVHN9tXW7JRNMlCw+uuHbXsakTWmASlvLXv5M
	u4KElgR3o8hA+/cop5x7Opx3xRh30saz/9m7e54670Nh1uso8NPEOQmLQs/diQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757285632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMb8JXvN1Gdvqc6Udpf9z7oyPReqbmlnrTlxo92lbAc=;
	b=exHdnhb8Ksnxr/SkYq+zVO52c07GOs38DWAwlpMFObJqIBNvo/YY2Qc9UAA+26TvSKp6nr
	81/x1Ck4vS8HnBX5qTcb+Vx1yb3HedmN4cxy/XVXoMxPovuB0aQ6GTqtq/LxvC90i3Oy6e
	2vuTuqEQYP281fyrfV6O/Sw53/YsqrkzsNp0cWYNYy8o164e/LxP0DmHoyoaqO7JQGgkOM
	1PcoP5tM5MvjvXHnWG/TNLwyHgzheOghWzIgz9QcfJLplPPfYA6E8Fg9TZwU1LJcfS76lD
	UUMJUMZSO5+I4dRJFYhKJ7eTa74bMO1YhpeWBz4C+/iKX+oyQ/9iNp4j77nsgw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment on Retronix R-Car V4H Sparrow Hawk fan DTO
Date: Mon,  8 Sep 2025 00:53:05 +0200
Message-ID: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 93710d2802da5fda573
X-MBO-RS-META: hdrs11rhq5j3stnthun7gy6t4ngnf6kq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_155401_211650_AB222383 
X-CRM114-Status: UNSURE (   8.53  )
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

Reword fan DT overlay hwmon comment to accurately locate the
fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso  | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
index 50d53c8d76c5b..022374c5c8d07 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
@@ -9,21 +9,16 @@
  *
  * # Localize hwmon sysfs directory that matches the PWM fan,
  * # enable the PWM fan, and configure the fan speed manually.
- * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
- * /sys/class/hwmon/hwmon0/name:sensor1_thermal
- * /sys/class/hwmon/hwmon1/name:sensor2_thermal
- * /sys/class/hwmon/hwmon2/name:sensor3_thermal
- * /sys/class/hwmon/hwmon3/name:sensor4_thermal
- * /sys/class/hwmon/hwmon4/name:pwmfan
- *                       ^      ^^^^^^
+ * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan/hwmon/hwmon?/pwm?_enable
+ * /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1_enable
  *
  * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
  * # For details, see Linux Documentation/hwmon/pwm-fan.rst
- * r8a779g3-sparrow-hawk$ echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1_enable
  *
  * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
  * # Fan speed 101 is about 2/5 of the PWM fan speed:
- * r8a779g3-sparrow-hawk$ echo 101 > /sys/class/hwmon/hwmon4/pwm1
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1
  */
 
 /dts-v1/;
-- 
2.51.0


