Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92097E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ajv5kJXI+klsq4X+xfl1HHA/issB2qLSc3s/dFW3XlI=; b=4poimKO7mfBUAMU6WAaIawOfgm
	SpHDhX5TIYiWCDrC1atUwb3xrxTY8CJgVAZThlKJ0nWYkQCVdmm7SfEQ4ec99s2NqcYtHc0Fx1Wda
	H/gutq2es1Prl76n7Y8ozNVwoalqq+4Ao4DQxfSFR/+Z0Litz9zOjsg5OA6Nx14GA7fDPyjGSrv+6
	3JdmWVnwtYM6WoDMx76HQh9wvEl4UNHSdbhpHmliTNRdrO3DlyfhH6C3iTKnVyeV6eu/MyA3Qg3Rk
	QI10MreFWz0X+9YeojI8U9BrmRuDn5ILIG/+ZtVxXiDdkP2AP1qLNZD3b+8hZv8XnWCYsqn7Cpqmq
	8MQqCGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJU9C-00000000zy3-45JT;
	Fri, 06 Dec 2024 08:57:14 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJU7K-00000000zbd-0h9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:55:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so1533284a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 00:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475317; x=1734080117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajv5kJXI+klsq4X+xfl1HHA/issB2qLSc3s/dFW3XlI=;
        b=Cjk7X1TefKF+bORCg4h+T1pGvFo1G+I7HhpRTGQwt4Ll1ryl4OQdGXVAXIKtQmS6lW
         ABHg3q3EVET+EDRHGaLPTsZYqUzJcAegn68XAbl+iYkJLNjpsCcg1UtrvjxWe6KCRVcn
         BXCjdUxMzP9YKhXiROaDcYLNwZl0ksvEOi0QtN3AFZVbXJpEYG2uwqJxoAc+czs4fvQ6
         yfQUoRlPKejIVf4te7yIfpIBUZGEkGBRjhYux49Iz6rHWIpgUrMJcAeKFuGQOdqg6qZU
         4E31+edwcKty+laV/Df1eXGqkObfOtQwM0ubPw1C3qOin8naT9INrDa5AX3Ify72Z/1H
         DirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475317; x=1734080117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajv5kJXI+klsq4X+xfl1HHA/issB2qLSc3s/dFW3XlI=;
        b=C6A1P8taGBOIxKlImJ7TVYcR9QCKgdfzZ/gW+E9d8TChdz+kl9sKDoN0B8UODJNjSj
         d8YLUY/C1e07HQU1mNfhuOep+zaV+MUdTX5OT//1NrRlfF1d20gJKkrCIbsYFlCOxNMV
         +RCi8Y7feJ2Jh6ba5oMyK1T4uhMqA2lL8MTsY0Q8Ws/tdcWTFXs+knaMnbiti0NS/uPl
         vjuxZW6ZVGGOBJtFLWyjOsC5iFz/fL9Z+6f4ALcsN0rMtdUdH/0aOGsAobYOBqJPYnYy
         Kwc2PSYtltJtSJ0tTvET4C36LXV2Mi9UG25xnfuGUX96JXWq4AZOscGLcv0OPn1uzVyC
         W8Xw==
X-Gm-Message-State: AOJu0YzKwVTVXlduT/p+HeZyMVfcY150ZjTODeV0h3e7jUmhuU5K9LXu
	FpzQsxOP3T+kq1ufVh5e/NK6LtdRvOBs3k3rKBdnF/tTTuzvEhAl
X-Gm-Gg: ASbGncv+7I92G5X9JFBFzUqg1bc5yR+rvccLGO98FPBFNI5ThCqRZaJxe5KkADrRHlB
	QGlGaSOJ4BuxHTn+eqlSiVHwFCWCSzDH5wfptR0e+ZlaOyKpfBPUCsMLNcNo3irB7AbV5oGJXj8
	5/L2yP+x3oi6+PK3q83pRY0TFScMmEHx8IrknbbAqNR3ZOVVAYQn/p8FceeHGPKjm0H3Vd2J6Sh
	4WeKo5MY0hPrtpki+f896fFnhKWUyH/sQbfdvp1P9xjCZe5d928Xn1pHNtIADBPT/eJltKhz/a8
	tpo8l3HDvz4FqW69eROGZ/wPMhDSBB4AkbFbow==
X-Google-Smtp-Source: AGHT+IFa8txHUtjjo8nUX4k2xkRIIL1rht6CtobgvALv2SxBQTXryMkzj4snr/HcNMfwnajmLUZEWQ==
X-Received: by 2002:a17:90b:5384:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2ef6a2dd226mr3273315a91.16.1733475317237;
        Fri, 06 Dec 2024 00:55:17 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270795d6sm4548157a91.42.2024.12.06.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:55:16 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pwm: nuvoton: Add MA35D1 pwm
Date: Fri,  6 Dec 2024 16:55:00 +0800
Message-Id: <20241206085501.2623772-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206085501.2623772-1-cwweng.linux@gmail.com>
References: <20241206085501.2623772-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_005518_203677_C03F2818 
X-CRM114-Status: GOOD (  11.62  )
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

Add dt-bindings for Nuvoton MA35D1 SoC PWM controller.

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1


