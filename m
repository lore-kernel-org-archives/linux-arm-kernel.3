Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841ABC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=; b=WmDkK11PnRzK5QdU0oD6qe/iRU
	SvxX0zrGSAxjtQ2I/kW+gsMaNV8xPIXyTQDF//h3Qca11rjvn13e3micVtXMvgAhMmaEZQzEYyJEz
	a4JomY0sABo7G0QAMYhZCW37SnPMknvoHfkK6SUMFFuvz57OhdUyp/CwkfXwAv7OLqiyvzQf/Zp2g
	Mzvq3wB/ENYBdN/vvvVCYRNdtDka4aLPBf/+W9TZjnSui7x8ZT+LPVrXDgzSn8cHF0ICt0Lv8c9JZ
	bo2OxMQ1Weozjxe7JLddarEIrFn7FlP86sMTqkl365PDj9xw/JvL9sHas5snrlTwKtBUE50Kl9vMI
	s/J+5ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28k5-0000000HYHq-1Hnq;
	Thu, 03 Sep 2026 14:48:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28k3-0000000HYGC-1UYo;
	Thu, 03 Sep 2026 14:48:40 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=kLfVyQdqKaqWu7+ybKASS563UxQtYZQCXW+jvNUpiHVRuUSrmWEunpaZ8yN6rchzHe7WG/
	nZsi8XFEnpx1a8d2Xuc4ht01xZiUJuuttoiadvocAugLXdSTybNqJ3pYLsjPL+NTUbtTBk
	5CZyrL/L6CTrOY4jGZds135uSGEsBk1AOz4ra6EfdLSnKNSjyoUakbhWSRUNr7TShhkE2t
	PtawV84luBeYm+Zr5PQfL2rym1Z80ESMWugrhcXHh2F2zme3r1ep6HFzAb7IKfxxfvwET8
	5JtHKX18GmAIdhXO6mQBCv0JSyqUxpAtlmQNBGjKpi83HaANn5HSNDo+cWS4wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Ue6BL3zRXDnF5m1W78nftmClAV9ngCWDzm/IUGSdGRDPGMy72QlMr3yGb5wYwFK9dj5YEQ
	2VnMh8i+KmZPOjCA==
Date: Thu, 03 Sep 2026 16:48:28 +0200
Subject: [PATCH RESEND v3 4/4] arm64: dts: broadcom: bcm2712: Add reboot
 modes to firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rpi-tryboot-v3-4-ce94c347e932@linutronix.de>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
In-Reply-To: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=xbHsHiNURnjx5H8h6p0fX9G85TwP3cQqhi9Hqp8E1Q1j4HtVhpeOYMX9K0gQk1wSvQq/5bvr2
 86ibDgOwGqVAYWZJCqq+hvDKXmCr654G7E6uJNW37l2oN9zGNXm4v45
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_074839_542555_F46FD366 
X-CRM114-Status: UNSURE (   8.73  )
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
index b7a6bc34ae1ab..67095c7ff770d 100644
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


