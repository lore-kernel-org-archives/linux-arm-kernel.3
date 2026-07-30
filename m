Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8937C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v/3GxvojxoLKdyGvS8XxmLrfbIDxAyXo/GWEJwJDgc=; b=GwbXTaRQNFQf13Keke+jHo4f3P
	15qffCc9VSObXDYCHUDYAxI9K3sd0IA6z9CQLeGRVTAdylsnRkP/ZJwVUOplw/zbI15ipTt4AkCXG
	4lHvmhr6t4HTjdAUAlZQ7Zdjm8yZ3PPw+RZmPEhGUY+o1XPfmI3i1vsW4CXB59/x6A6O4C1qB0Blq
	fIfYUbejbwgEbzkXSr3F0mxvl27NpGiBhjKoYFqn3eJER/26UBVoeeCijPapxmWMFOELja9tB+Sx2
	N70OLxeFkK9Ik2pATyYudxUOGZFRflKbexPBuZhWoH+DqrZ7jClQAA2oi/1JaOirCw6JOzHEBGBWE
	D09CEO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOUT-0000000AI4C-190B;
	Thu, 30 Jul 2026 10:59:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOUI-0000000AHxe-2Ga1;
	Thu, 30 Jul 2026 10:59:45 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/3GxvojxoLKdyGvS8XxmLrfbIDxAyXo/GWEJwJDgc=;
	b=IaVDuVlKqYukNoAugXV6bw3EgoqbFMkMsKWqqarqcq7k9zR+Bqjnnquf6KuhtF1ZWUc+BR
	L7/yq6EedFe423ZqnbJQCggqb4VVeiQOfq3QPFfb6vmhKuY96A74+Hy7MOlH5/Ebmn+hEu
	fqTajvShTPDZtu3vBGOQXjq2BxWfMGEMX5//K6/41g26SVVPQgZyaypPnyVd5FhdPMaHmr
	d0Rd2MY0hCqyQ3WCMW8vdRYa4lTTBJQkm/95HGy/l4I7m+T1xhK1zi7KlmkXQg8pEjHZ5O
	dJeSMtFZnELw5kXC8aXwKU5OVP014h1COeFskLv2/Kj4jS5z2OYLi0baVW2xuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/3GxvojxoLKdyGvS8XxmLrfbIDxAyXo/GWEJwJDgc=;
	b=yPk/MFxpUyYK9iGY/mSrPOHB5GiH2MRvajgQo1yZkLiFc75pniQZgQTIkQBoKL4lfdFHAQ
	2wTntIY9e111E2CA==
Date: Thu, 30 Jul 2026 12:59:33 +0200
Subject: [PATCH RESEND v3 4/4] arm64: dts: broadcom: bcm2712: Add reboot
 modes to firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rpi-tryboot-v3-4-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
In-Reply-To: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409177; l=864;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XReJCbkSEq0T0EqNnZyVqtP6Nx9G9Ste8TwNoFswOt8=;
 b=09aPWQQjL8cXe+8pd09kc8Y16/GxOwFzWf2RPwUt4IFPu+STceGizMLgSFbyhYi17Lb8G+qc8
 EVrNfEZaUHuDY2HC/q45RhQmaPCk5wFTvdgaRNqmeDwFuqEb9dSStnD
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_035942_724063_8C2E4653 
X-CRM114-Status: UNSURE (   8.57  )
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
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..67095c7ff770 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -49,6 +49,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3


