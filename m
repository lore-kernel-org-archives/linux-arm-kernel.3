Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B7EC79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=; b=BSI0wbILIKN4srz5OqlJpCan1p
	mls3YeUsKtKNuBUxbIK+SoSPcDR++qLN9cipsi9zugg2t9MfaS8YMaU3am10igKFdHEjBc7Lw2Llt
	yxLB70lguOV/mue+KQS0+m82xND0IX+FvViNhr9apL9Kxd1blUD9n2ng+p2sSTFJGWhNWiFPj7F7k
	jzZ5WN+jam8yIzR09lhaVIgkGirLo2Y+XudfMmBf+fAJgh9GSJaXcJQV1DhxEG621RlkyeglSpTfp
	tDn0CVBtzhnbcHK+LKwMgM11EHmRVm2kmoX7Ax0rx7nS/gowf+6J+gJAJBSDHLL8G+0pNN21MQBK+
	hNJvBIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ode-00000001Gga-1bXT;
	Fri, 04 Sep 2026 07:47:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OdU-00000001GXU-0IrB;
	Fri, 04 Sep 2026 07:46:59 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Ou7KYloFVfQeXOYjs6icOcO0toqKh4tb2sQ5odwXHVOTwX0ANZ1w+cy3jK1J43zOSlVWPE
	TADjKYOCz9fBujFYOOTnLvbGbycGhmkNqsILmWSUk3/swvmvSLabubbgdG1xz6drH4MQfG
	RJBqmnkESJR7Ehab8xEeeld3SFCt6JSZ/+e8FTfcU6nP9qdOTHD2mg0DzYcfJKHnP3voPF
	Zceser/FEoKcNOMKUmEBCTAh/YaOZ5yNGpmj5ZQe5eBN+oCGsgnBjZmSfc86pdJAoCTevq
	683mAaE1G4Hw1r7XELAC6fdnfVNhIHL0TusJ8r5WAh2sQJlJ4qu4VFHWoDKGXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Oli/DLLTChQOzEKX+fc9+x90BNQKTKC6oGTFHIhIYW3mksystGx1zRRJ8OHifiAzXvnItd
	y/3GJMSmp9tHQVDA==
Date: Fri, 04 Sep 2026 09:46:52 +0200
Subject: [PATCH v4 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-4-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=9OHiFAcRLrbVcJZzqxiwULkiLJzATYx1es2N7u29eEKBKhMKvQyU31E4wctPOOGLn+ajDrn7n
 tG42W1UFI9vDi4tqcsiGlslqMktTkAGruvyhdfLm6uDdAQ/iC8PxQWf
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_004656_248116_5E99F6EA 
X-CRM114-Status: UNSURE (   8.72  )
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


