Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6BCF94CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WBbGaO308OrKoNoLYMLOL+P4wfBfZBUd8DmimKDQOY=; b=fLtqgEpueMNeCJhuB7wpCm+EQb
	GPGqjZM8oUOEC8yku4zNoi49/oJucD8ZfsG17oOkiJ4fXtKkTAuPk5HfY1dPyFj5kc7lULcWOwJui
	WUhUCIk9Fch1RsoW687CPZXUtXitCbZ+0F+jCUqEQOqKGsIjdgmM+kGZi+epv5WfM1ZFjpQ7ZDkps
	MH1v64F9tunrFBgj/nC7BvxXbiY+NNB+t5lFmZkATXol4iyBj4OP3tn6u7xPFZq41rPqC6QOwFt8g
	Hsb9BzeWzdQdFpcZIbOuLrALoidUvFvr026eiEOM8fz23zX3Ahza9IMMMhrIchHDxcWaZ1+4D7YkU
	3Aimqp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdn-000000097p9-47aD;
	Tue, 21 Apr 2026 20:24:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdl-000000097nk-0JQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so59284985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803051; x=1777407851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WBbGaO308OrKoNoLYMLOL+P4wfBfZBUd8DmimKDQOY=;
        b=eH8d6XO0ccYz0fYoPT0G3Z+OlBygckTWO7bbDv3ZyaXHuw1A/ECFQSpB6fwRM70exD
         ItNm+Rdf9V1sJfqfHv87KwZ3y/+/OUnSs8R2UFDmpkUfPjjOeDRqwWFA7HCsgN4TF4IK
         Y2oMhJ5D2Ri9mWYqWgPuI4mEYaJk36gTmhVhQn6u/Kx9Vx88pjqWL2f+x2Rlx6vUu76Z
         VJTd+AhVbeR653g6IJyrarxqJ6rLHCTjbU0fDvv2eBYyM4YwMLGyxUnb58J6m3vB+Oyi
         1uG8WQ6sd9TA6Rv0praIALoqR3qZccy5elQ6lJrXZC6JwU6zrLC5zSQ+YpUgTnM2kZE7
         fKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803051; x=1777407851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+WBbGaO308OrKoNoLYMLOL+P4wfBfZBUd8DmimKDQOY=;
        b=Sk8T8ZXWlG7ceY8yw/8eJ/phk9VLXkSHNaMuW3Vszxx0z3zsLWVZmVh2SaAfKKf5hg
         d02dNo4Fq4qWWkaWRQ6hzW5btnh3F7L+Slki0fBS0F3GPqS0kVrRMhrGrKe8cnLsmNkR
         QaHtm9KFG5n4g3PCxAvDdpdsnF9QQxB2wH4QXhh+dtq7OUh9omeb3hSl1DJJISX5Y6BP
         V/UPX6odte7kJDmqZRTh3F2MrJywmq3cCiUvb0Tjc9qjD3G6Cp4V0y6jEzz3icKkGBEt
         VFw5ZtQf+fIr2W6A4M6XvHflwEbL5falMmz31cv5QszrRlNPwRM1FBnHwD3gVLLBQzoj
         pzuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NHq1WoCTidGUtkmBFw0JON/MneTAvB14qjlpnabEva9PO5rjetk4+LC3+I4zv7glm1w8y+dqAbUyo51zJRmCP@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+CPAitPyDhpuQBmz6PXLXq/WeCrOmh3nV4O1ctKeZcoWjgE6
	4FTwpF9TXhqbh2lYPlAyIxqskKvuqzdpd57OrUeP46KVuWsIo8+AW99v
X-Gm-Gg: AeBDievPDddvZU0Ru2BKbJd/Wj3+7UL/biIGSyiUEgStKLdta026eYm01tKdckdZgOD
	P7gm69pY/q8h4SJm5/3f7cmKDLBQYOk8mJaooPc4PQXt79Ts4FwpPzBzERTYbRc00ijcLY/oyRQ
	+KUicmcvuodYPlvVah26O93yqySbDmjsDBVjSg1t2M2HyfxGbUnmt5szbjLtIWGQfyY8GfsjpJz
	m6PF522aQMICUOdzdIOcARWS/uvf9NHbJDhyjqMd0WnC4A27TkCUeLP9c9uCr/sd2ba7SnzB9wL
	A2ioidmQ+dF6UGxaOibbe1FGYIGE7+xFHzCvftdaKoQPwvlxKaYv23V0v6DBBDCEVNTtNBWSYjh
	qku1XI7cL6XN2BfS8X6vob31NJ1K3NE5TeYh0VKN8Xfg8Kr4dCV2WsQhLcEiyVgXLID/os4R0XL
	C3sngW3j1gNMqZGVnqN+Fv4I5Y77b8f67Phxj/3OTT41GW
X-Received: by 2002:a05:600c:859a:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a53ea15bdmr65740525e9.5.1776803051393;
        Tue, 21 Apr 2026 13:24:11 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:11 +0300
Subject: [PATCH v5 3/8] ARM: dts: Add D-Link DWR-932M support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-3-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2yHUR7vf/4pTVAeDqwUY/lONvxGcKw5B3T7ZR8edG+4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXRVl1Sw1Ld+3Q+2fSkkr6eCrCMpkH3vrj5
 iws4Vy7k4SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIVcRAAqBZ6FU4uNLKpJxvNRTWai38+QRve6ja
 /MNGEnjPG52ccLMGiQ88XJrzrJYJtoXoXgSOK77PjcMnqB/KnoWmUjg3Gp38WcUJk2JeRzPoBrU
 Dll9uopylKWmzlgFOOpZ6OPaCyvUgVDUNIhpUM3/LMvaPaLgd5qGbwy0SEweSVDg4jv/IT7cfJE
 slHiX3IVB5ieysWX/ifNF2WJ9LaxOXA6/x6naitX85TDKvQ/sLn6R5Cux5PZU2tWWl9+cwoFRdr
 BtnjYpvG1mUpMNjX2aqZQvYpwh/VT2iSC5vdBdl9EG53KXjqA9vQhIqFO++IGcXTKo/CkjdfyV1
 GDotOQzrl+hZCVFQ16BLpIkNWPQ2aDnvfQd/iJtoEUnAS7UpPvOwBJy1qmkhdCndgXQcRlE3tEg
 2KRjKoI9OMrx/pQrqYAF4m+1GXena6atYZtd5ri+8CKMOFfzb9Gw/WyzEAaCOobzbnLdrYuCZ6P
 iO1eV9RvN1DhQdG4DVOPv+ttkx9WEjdEGQsB34vmLIKmhlvz/xO5SLUl1wgzgHvSpMdaCWUrIEY
 zb5LNNZMzqw5stF/rEHGBxWlUBCSzP5qtIf+ZN4JU3md9M1uAawrjLbH1jRi+/wD6CROuwGY8nJ
 buhQyLgbBJ8oUpFSrmLqlr+Usakph9Q79+TZ15Cn/B/6/mWjjcVY=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132413_152428_C198813E 
X-CRM114-Status: GOOD (  15.83  )
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

This adds base DT definition for zx297520v3 and one board that consumes it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes in v5:
Prepend the SoC name in the device specific DTS filename.
---
 MAINTAINERS                                        |  1 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/zte/Makefile                     |  3 ++
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts | 18 ++++++++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 40 ++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcade90ca14e..f7ca0d478e81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29203,6 +29203,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..f052cfbd636c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	zx297520v3-dlink-dwr932m.dtb
diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
new file mode 100644
index 000000000000..ac20215fddef
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..0fff00f910d6
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+	};
+};

-- 
2.53.0


