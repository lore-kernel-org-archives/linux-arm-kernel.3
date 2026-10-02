Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30EFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=; b=HpjtnC6g8eJq/44z6ozb1Ima6M
	n3FX60ZmqKJuMcsv8hh33TQi08Zk+Li/If9U840x2WV0XT9LUAglkcVty5br8ssm1UIlXMbi1WGCL
	mc2HLHQrVQjNNpJ82Mp5+lRYsHDQK3FAPZ2jtANf60YdI/Q3rE0o1UVg6ZrEWJfRAYFWadSz3OmiY
	8bCLXTjy6+lsvRyNqACOlC1DKPWpFW9b2ztoAeXdKV2luuB35oLVcsNScaKQpl3Lj22/2VYYtcQoN
	JVjsQ4XxK2F1H861PdaYUfFJvVtQUKGDqx8gMmCsSoYPBooAAyK86wRmEjG3jnuZ6cvpHqiHYaN1W
	i7MyDaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZy1-0000000BDpC-1lq7;
	Fri, 02 Oct 2026 09:54:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxt-0000000BDfx-072o;
	Fri, 02 Oct 2026 09:54:06 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=EvsHsEq9XUSkjFm4stZT2uh+iiUgMy/WOJLSfNTBZfwaNYuqMVQ0FjfiCoc2BvkgfzU3Mh
	RmIZrTGI4DXv5uxy/VWce06B4ggzgajk4QgApq4fQZR/MEPw5NmyDSH3VGf+6NwahJlkDC
	41DBYwxs98QEwkpU/FoWsV372t2jTuprCOX1vVkb3TBOumaw+vJsBYOzqwKNXhysYlTvhm
	ebSL8XzJPgosXvocZPQmkvcLwWxsYNaimwxp5LrELdjfYhbuWkWdP9pf3O4YpcQdfFvaOO
	gUdDEZyUS3y9Qd1hX5L9S0SUY1xEFpBQ82HDR8b6sLQ/yDq31QtdiBBdZmxTTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=Wg8tyNQncTxu0h+vVmHhN0EPWWR7elH3z/RekukHPzX0tam4OBhP4BllfMVCJ9rYkN9U79
	r9rwudAbBPwz3ADA==
Date: Fri, 02 Oct 2026 11:53:44 +0200
Subject: [PATCH v5 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to
 firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rpi-tryboot-v5-5-6294c131e583@linutronix.de>
References: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
In-Reply-To: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=821;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=iW92QJbYkT2c+9COJjq6j+FezNFEwORGgQahLMmFk7Y=;
 b=N7qN0q1+miZ9NzOF4jRW6TJREIdVWvBWce7XD2CCmx9GNUyAMZi8MQSCK2CblFE3V23SMmenc
 PegD78X8mMfDbolbE8uK80PoQ2CUZTAthksEO971aDUlt7y72At1YDt
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025405_214046_AD61EF28 
X-CRM114-Status: UNSURE (   8.62  )
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

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 46c91468f4c54..174b13b8facbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -5,6 +5,8 @@ firmware {
 		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3


