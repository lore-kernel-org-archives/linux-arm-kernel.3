Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49540CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=; b=WoBNPZTARjkBt/T9tj/13sHJO/
	Ri4KLjwv96uAkqmqYzE4eFMxu6AjAh3zKVBGJoalD9DbdHWbqC66q3TfrnZbFXkoe9PivmCW1bxTO
	k472HWXA7ngtaBJ7kYRRTnBKRi+NcCphNgX5m9Fm9xPAzj0lA91VVkJoaNSUcUrKl56v06tjpcNi4
	wAA2Wc0d+UVvn0SFKZnVzmAql5/BzKPSp9JHeCG2nY68PK7yQjlnp/06tdDRX5jyOCmC5HthdtQun
	23Pwj/qh7cODs9faBXBUDId9PmRLa5a9nHpaCCgjWIt7Icme6g3/2IdYhrJgWePAb+5ZUBBZXHb6y
	e0sdQN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCy-00000002ckP-0fIe;
	Fri, 16 Oct 2026 10:30:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCw-00000002ci6-29hF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=; b=gcTHf+Zbhx45BR9vh8V023Ieom
	meI7/WCkDnTYQgS75qX58BzUijgxl886kx0mUjRpO23Psv2dC32njDLD3DYTWg89YZdcTLKZClR87
	VGFGjtXBfXqoHgiKGF+nxy7pvYS2yuiQ3bB0m6X13zjo1pQWcun7GCrqwb5FoYdR5f0XmS04goriw
	Wa623exRwUZgmodiZkA9v8PeVNLjR0ha7zSwlvfi1XyHuV64KcCrlg6gaFgbA1XHOXU3MIyHMAGtE
	vES79wKgGoVfyG2EOEii31HoC5Yoxcas7HW0FcBkWYYcKLfYrMeFQ3W7AxXLwmvMMts9PB/9nNrCy
	iJqxVfmg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCt-00000002s7P-1sjL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c20ce3c118aso169933766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146633; x=1792751433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=;
        b=LJYqzQ92KWqyTTNDl0hkVts4MOv7tJ3OPwaQjOaCvJsj7ScYqOAlIM2ZswUuax83VT
         jNhmf2X5CBvTmMpzUSnSEwC9G2dmX+eQX56TqzfqZtyUYYqGG5WHl6mj31C23VFi04Ke
         zPXlbO9O7WKa0dpAXNXTqaHn2RDp91dPOm5cPD9baCQO61IhxAuZSlsq1wAqFw92UH3G
         p7JTl4TQoZ/52fuPPRU9gkKp9FUPOyEQ9HjfnR+MgbNxlCkzQFb5REIzQAdHHamnSbMP
         tk0qEAQJL1Vwm9jzOVt7SYGjZF4Esu8X7eWr0XnhYEB1crTNfBgnwG7tPgI5El/BzYc0
         ve8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146633; x=1792751433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=;
        b=xIxv9uC0A8UmOphPvBApCf9AmrkD8jLMYduwLZtASexMbpI3opAow7wEdfykON6zNy
         Mw0XvC70C9035JGcWo7IEmpO9x/JmiBnYMnGmdHfPSHWNVUIPWny93loC13+Fon6sSMJ
         ui5Mhdwe9ofbRqyTWO65o5J6PWzmyCq+JlSl9/R76akhQ9QXPDgCbtS8MNVoSkfhP12+
         oQ75/z2ji+1qlKZhV2z6orMIpVz6vHOT+5Rg6s/55lOLSNcOxuXLBlhPyVFR0TYFmuDt
         WUeZaSE67d1kXhBA/uZX+zQn9gF4pH2htK4u/RQXYGtsHpyIxJzOW+Y0p4WE2oBm2i2g
         ObDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd0k8ISYrxu3es+5lV5PMHFQKtuFy57ArO1d+Q6oebAnikanhTuQd+3mlU3/f69MPMAEEIl8pgGjnnNzlqKhgJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJTqzk2Bw0hCkf7deK62I1Ka3fVatZGvEmIuMndlZUKLWlMPXG5
	vPxfR5pqDExHbX2Lwpctk7RRQGoEYC3By3EC7vWyPj5zGirZuseLfZTb
X-Gm-Gg: AYBFou1wpZn1NqISutllkaEE0tOi98NyyakfhGC1fQOytdu3Jw0IRat+DWjM9BXQoxw
	QiiOLrazzB8E76aGEujiXer3VLluIG3dadhghfjQkilzNuRgFJ+bBuJLARHxlQ/Mk/1cGXS0ZhV
	kHbw5pYwYa8wt0sa2jc0t2xOpNWmLmprJFNbwYR2iDyfkc2q0Vm7evgzJEdIqnPkEvc3btEJ4mh
	vEGtoy189jHz9WTB8uk11GreTYEb79vGbCiYfov8WnSaHB2Fi2m9GSkANV5gyc6DKLVHk8dV+jJ
	2s0B1vFOz0J2NLHCPhdHrsEtFvnCMCBGK5bo939TZdnzRFQ++SLbYr3HqMfCwHbcIH0mmmD3IQj
	xbqfgGOUonNNU6iIFhMgjM+cw1mU75j2TwwUn+/1NRiLyBe33h7h923qseJ3iBFrTa4fcZ2lVps
	X1tz+782T/94833/gE7PAyUP6DG8gCcuqf4IFXYZVHvBGlyx556PfjipBiye6d6rnNKzFrs+S0D
	CN22XIH7nIp
X-Received: by 2002:a17:907:86a3:b0:c31:6fda:52b7 with SMTP id a640c23a62f3a-c4020eedba8mr234447766b.21.1792146632831;
        Fri, 16 Oct 2026 03:30:32 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:32 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:33 +0500
Subject: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document reset-gpios
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=1639;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=gxIq6ifytR/JAI05/Wxbb2mz24KshSEfWdEtAzkQt6Y=;
 b=VbqmIKE9xA/W/LJMZES0LcVcRSUOVVY2CefAm9neUM3UYLCdrjlwuk7AeZQMIAGrmt7q54X5W
 UzhAtJ28ZoIBby0Ort5ufWzrkitHUI6oxTUyh4O2Fn91/s2EoQEi5Y9
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113035_798853_F7687D46 
X-CRM114-Status: GOOD (  11.19  )
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

rfkill-gpio driver requiers at-least one of the gpios to be defined:
shutdown-gpios or reset-gpios. Document missing reset-gpios property.
Also add example for wwan with both gpios.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 .../devicetree/bindings/net/rfkill-gpio.yaml       | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
index 4a706a41ab38..66f6ad2872ff 100644
--- a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
@@ -29,7 +29,12 @@ properties:
       - wlan
       - wwan
 
+  reset-gpios:
+    description: GPIO connected to device's reset pin (RESET#)
+    maxItems: 1
+
   shutdown-gpios:
+    description: GPIO connected to device's shutdown pin (W_DISABLE1#, etc.)
     maxItems: 1
 
   default-blocked:
@@ -39,7 +44,12 @@ properties:
 required:
   - compatible
   - radio-type
-  - shutdown-gpios
+
+anyOf:
+  - required:
+      - reset-gpios
+  - required:
+      - shutdown-gpios
 
 additionalProperties: false
 
@@ -54,3 +64,14 @@ examples:
         shutdown-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
         default-blocked;
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    rfkill-wwan {
+        compatible = "rfkill-gpio";
+        label = "m2 usb wwan";
+        radio-type = "wwan";
+        reset-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+        shutdown-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.56.0


