Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203B5CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhHEBcXQu0dSPfZI7PKo5xY8SurnMGXO53mDLy+S/5A=; b=kbwHTsYYFZodci5MS8rdzbwURJ
	R7kPviOf3Rk0nXVfvw09T5Iymouk2AJ70ym0TKQyU8U+uDi/Y7QUT1fZn2EU8YeU7Bda/DPUrtP3z
	0/px2lwvz3jSmtceDHRJ4xAvfZSR8PTHwajxEd21WLEOB7Ekb9xEJ4D3200lOkOwZhwxOJCVLJScK
	u4RYlJDwvU0W9W+csKT3Ukm6WG7QmSAIk7Nuv94DtZhedaRf8D23EOQ6jkfpXVvyeF1QB5clzwWhB
	4uQwjIPNmLpYTXlnc7OolZdFD+uw0azY5+4v4X4QfBGs+zeubfQGmpjOPZZzRl7jjq+P9jjfiSHYm
	smwteQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9h-0000000FP8I-0Fev;
	Tue, 05 May 2026 07:25:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9f-0000000FP5o-0b3z;
	Tue, 05 May 2026 07:25:20 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777965915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jhHEBcXQu0dSPfZI7PKo5xY8SurnMGXO53mDLy+S/5A=;
	b=03wm87OJLojRX3pP+36IGJDqB71ElhKLRiA2oKfsGC4ekfacsmtTfQbnZ8978VD+pZ3oYn
	Fbm9/7TNKK3c4rZ7COtM0ge6PiGweiA9F+icjQocMDpWOBrbUjXAkI9cfkpfbbQUPtxS47
	zHqz2fgq8JQOFNh06CgHNYyWR81GeBhAucE53twElx2Y87P203OsDrQjRaY+1THU18thOb
	LVx3bV5FfX79tFVDHPtaj8zHDmUj9Nruo60a+x56k9V7lBMDPpalaBiNgvYH9F6KtQkM+A
	8JD5ne7KwhHMApjDswX8CWYfMHPr3bZthclf+O+flprN1FeQFwjOMVKZpfXkNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777965915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jhHEBcXQu0dSPfZI7PKo5xY8SurnMGXO53mDLy+S/5A=;
	b=CXKZrWQKrSMc4dIrCWKXlT1lQn+ZIzLnsFb+loGrqBB7t87J1PY6KWfggUlTNCBJ3NpG0I
	TRQQ88wke2L23DBw==
Date: Tue, 05 May 2026 09:25:09 +0200
Subject: [PATCH v2 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-rpi-otp-driver-v2-1-e9176ec72837@linutronix.de>
References: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
In-Reply-To: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777965913; l=903;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=ku25ZC7Xfr1mnVIoO/JCu5TSYP52wMnTpzpP3xJcXKg=;
 b=3MZiqMrb4EjsSOBa4aSVVciqxGDPpHH5NSiMS+fNLZ/Q9C0jn80z/Hn0vyPfw1pyXii8MSeE0
 Ws1D+hrYLFBArIYRqRDaYeqCXBIk3h2IW28+7ZPC2LdCeXR0KMw75vG
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_002519_345956_39077B8C 
X-CRM114-Status: UNSURE (   8.14  )
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

Add a compatible string for the bcm2712 firmware.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..eb6b556511d8 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -22,7 +22,9 @@ select:
 properties:
   compatible:
     items:
-      - const: raspberrypi,bcm2835-firmware
+      - enum:
+        - raspberrypi,bcm2712-firmware
+        - raspberrypi,bcm2835-firmware
       - const: simple-mfd
 
   mboxes:

-- 
2.47.3


