Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AE4C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=; b=TPuekYX02MqOuhaV6OcuTOXe/6
	1yIH44oXmrv7txbdBb9oIUN5z87Hibk1x7icwH3ComVKqXv1svv+jicCjRYCLJdwSnZ5y08ok4jFJ
	FVuS0VrJ7cFy29LCFbNStG8sTpaD465xrqwzX9GamQRYfIEiRjQFtpOXZv4E3YDLZuQJAzZzPj+7l
	5J61cc4EbZUFlPsLE5vY7DYhVyTXYY1e6FF+n+mDob7nxuhX/x6BM5R9cMpnWUcOcDfKNS0Z4TfPN
	k+C571WoZB5CCmYO+ZofD88c7PV5pdPaIPB8UoXK5DpKUYdkJvpjEVeQfJ8jCSH3tsOoXSplfN1PA
	L7wrlvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCU-00000007G14-0EtR;
	Fri, 07 Aug 2026 07:41:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCR-00000007FyG-0Bed
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-480033bdcf4so108094f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088461; x=1786693261; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=QDPy9Zgacel6k0yZ8pbv7xZOV65AHjJb88gfgPLY6x+yNoYUanNhfBn07RYpKBkGwh
         qaqrPwNYGSfWc/MShrzW13dZwidC0UsRYPbVwYXoKTGOlo5MLJQWLzlkLGmoknFUySsj
         3V6bgblsMAZjYe9mXuah4b41t08x2MfFtRO9cfy/tvXjQsdlYafT0Om++VyEaN3zHgFE
         w/nDwYYiX1dBdggF8+C9P3xxUSYQy3ElllNQ1JdvtgbCKNlhDmICOXlqhtvjAgoMD43d
         5dHsIOHV8FJyBzHaowzQYMBPm84mtbGopQUz+eK1eag8bKqzfwoYP1cMCppgYRK/SIpM
         ++JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088461; x=1786693261;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=SFTUvxynGrwBaq5UUEZxNXJPEtlmt/gaundIlKMVvE2cFJfb0oqXwWv1inaj3r3qMu
         o7pomwYgxM1tgmkYswKm137JpTDKjJ0cbtOJt9RNwVcY3hyga9TLZ/tyPXZRYdG/eTe+
         T24Ov5Vg2ftkjwmS2M0oyopsGzl/LuI2Jeu9hiA8Bosk+Dwa5g7DPFi4Uw/XDkdpmpQa
         nloixz+0h4qQW1koijqWK+QGtMc63QamOCwm2AYItVgtfLdqkvj2e+izJuuyJNksC6q3
         sfdzJU6NCItTeNw/5g2+C1ExqPExdV/hTpsJUpbwC0QZhhWhpI1yHjOi4rgC6ufvpJvP
         4OXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTHppwpNLbyJ143vckulkAu96xyi7BC4eeTnyOZ5bINSyE9QDcs+H04bdwwCypGUmJnHBekb39y1ENhxpNke14@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5AxSsn5QOOWUOiN9bQ5WSge/w/JPrUAR8A4lUmkeqXPynqmTS
	0C4TBybzZ+fUAjh7HGjmQHCseTUUnBOAQtQgbFaBJUl7P8bxTQdfY/9QVdwskuQV9xvx
X-Gm-Gg: AR+sD10VUZlQxer4eKut77X3cKIxl1FM59Y+DJRj1qS56jwtQQ+1n7baayoaZPe7rcp
	KKHOtz+2l5Zw8LCHdGDudzLTipkvCnlp2uU7ix0Rw2QUo21wljHXc2q9hbB0cn6ZqxoaEypBT9t
	qNjVCSFLhMEYLKNlWwfdmVdPJYtJ/HSO7QesoNRGsBYueH6ZiSavGqDSJsHuyEKCKHbiNwIaeds
	73g/97ir2EQTOehttg0cgha8JzjDJJsi9MpFtyVsR9tilOlWETlofXkp+qz8gXbCfGQd8RPQzFy
	T+wmWWi9dEweKz0Bp+/P6cryzoSTbORwURfHpzfc8LQ7z+OVrabsPHfMUsZ2CVJxdiYaeT9TZLw
	fVDzMAfLYzas3Lh3sDWCPKJDg1mwaLDY/jm0aNXArEoMChcK7HuTZ3wDFLqcJzcDoIacY87K46s
	g+nmbZ3fRlQtlTuhPaIdvnhWqkJDfk17dFrPJ4GUgan0qra7rQzYF0KWINTAHyzEY=
X-Received: by 2002:a05:6000:2586:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47fec62e2b4mr28868834f8f.20.1786088461227;
        Fri, 07 Aug 2026 00:41:01 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:00 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 3/6] dt-bindings: bao: add I/O dispatcher device
Date: Fri,  7 Aug 2026 08:39:30 +0100
Message-ID: <41e65cbe88021964afe55d9e3884ebc199928264.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004103_415360_286FB5BA 
X-CRM114-Status: GOOD (  14.94  )
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

Add the device-tree binding for the Bao I/O dispatcher, present in
backend VMs that service paravirtualised (VirtIO) I/O on behalf of
frontend guests.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Model one node per backend device (single reg + single interrupt +
  "bao,id") instead of a single node describing many devices, following the
  gunyah and Mediatek Genio bindings (Krzysztof Kozlowski).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../bindings/bao/bao,io-dispatcher.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
new file mode 100644
index 000000000000..f118c6d486a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao Hypervisor I/O Dispatcher Device
+
+maintainers:
+  - João Peixoto <jpeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description:
+  Backend device exposed by the Bao hypervisor to a guest that services
+  paravirtualised (VirtIO) I/O on behalf of a frontend guest. Each device
+  owns one contiguous shared-memory region used to exchange I/O buffers
+  with its frontend, and one interrupt the hypervisor raises to signal a
+  pending I/O request. A backend guest that services several frontends
+  instantiates one node per backend device.
+
+properties:
+  compatible:
+    const: bao,io-dispatcher
+
+  reg:
+    maxItems: 1
+    description:
+      Shared-memory region used to exchange I/O buffers with the frontend.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt raised by the hypervisor to signal a pending I/O request.
+
+  bao,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Hypervisor-assigned identifier of the backend device model. It must
+      match the identifier configured for the device model in the
+      hypervisor.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - bao,id
+
+additionalProperties: false
+
+examples:
+  - |
+    shmem@50000000 {
+        compatible = "bao,io-dispatcher";
+        reg = <0x50000000 0x01000000>;
+        interrupts = <0x0 0x08 0x1>;
+        bao,id = <0>;
+    };
-- 
2.43.0


