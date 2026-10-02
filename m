Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827BECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=; b=HUuLn38umR3YTXFawfX1M6763P
	DDQV+b6GGm+dtJyv1qxJRdXxCLNfUzQ4JhZSolsenbvIvzJHtmPnaN+x8upBuhVu4z9gL2+VvUU30
	SZlz6s0m9Lj5AuzuQm4FvAjtGzOXKSYnhfXKMHYNgBSK0pMcuYCwKOsNR+UU8Vj4JLSrIGxVApBtH
	2w3wbMS22NX7MqAMn1SL42Z/L2jhLGw5VNk0lz5SAZLVPNId+9llGScSStb1viMwEL63Q+L/u7uAA
	9R7kRaiqVRHwNf+4sKeaFsjGOKQonOdW+muLgMmxRycgpBrpyEBPyOGyN4kGTOUWuLo7Nwz9P6vgV
	3lcOZGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxz-0000000BDnC-3vwi;
	Fri, 02 Oct 2026 09:54:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxr-0000000BDZ9-1KUc;
	Fri, 02 Oct 2026 09:54:04 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=uFFEU1VcN4x4mayxaIqPd0/GKENbozNP+XrPM/Re+UIFTQCqqgSf6ruVxwP2Imq2dfOwiF
	tZpNxRIwnbO7dvBxCJqJYGpKn9SD3Ktk3pHZHpRolEcRLbBi/JTJu6U3TaIIaTZvh3z+Tr
	O8Q+qB7gU3zzqLohm5rdy3XU67aKYILX6FSp8aa3JIMeMKpOJllZtEDai/YpTWvmY95KXz
	PVI5pAQiuP3KKk+lWW8dEJ92mQdQrRrVmMP3D5o7tOg5K4Rt7anZEKrNF/jFM60ZFZ/61A
	8arKLx0URwIGho4OFLPs3a26A0nDXxxANeFgzOyyr0duu19NJKgBt/tku2ZoKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=AujxyfLuoCFKJIAcvIZgMKDAzVSFLRYZiTToBxeMKu/ncdyu/4D1aRZstrIQ9vCzLiyrtY
	fGSz4sUfiTOc5ZDQ==
Date: Fri, 02 Oct 2026 11:53:43 +0200
Subject: [PATCH v5 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rpi-tryboot-v5-4-6294c131e583@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=sU4r3cwQeiSUNQ6cOZ1Ry8jt3NbxXLDfmcVQ5uMvhJpSAi2ZgxEvPZzpiMezyJV3MrUCMc4/7
 O8Z3ia3n/dVC9JCfK6hyFOLr9aSvg0HyQYKTVVe4A8twY+RQ3DAosqz
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025403_501919_47AD118E 
X-CRM114-Status: UNSURE (   8.66  )
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


