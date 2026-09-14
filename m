Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBF5C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=; b=SGSfW/EaBvG9dpfLfmpjJlkqqF
	6ItNWtYVjb/iEbuQmwF91OUNzGFGT1Z34InUXBIuUCjyC5KORkshilAiBYYFrNrbFhd+OIdZHUCtO
	Y9apxe4bf8Rhmos0yj6AptICcTgxLJ7dBi+Uu9sWm1agK1899inyOOEfI6XziyG3XTWPUchRm4daI
	FplB3M3Z1nPsK7qaCx3mvogbbxoPv8L4lNHZNJudjq+QKrKBuTOhCHRPGf24oadt9iKybGx6gK37e
	7xyd01t7Ua+cmgRcKdmYgWqAlFjDqxToJxSnuaN5fAKQpmPHtBta7WaLCbd6RvGh9uW7ETODTyoXu
	nFRZ8GLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64XW-00000003Cnx-4BHZ;
	Mon, 14 Sep 2026 11:07:58 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64XQ-00000003CmA-03rV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:07:54 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso518473a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384071; x=1789988871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=kAugvIzVLndjaPSp9grn6Ex08gJbr35HhSq5hql8HFyIHaD/MttKEQDoDTjLVZxDkx
         p9ePsLBePkbNp1JDAeWDtfmpHoG/R31RD0r7gdsP1fCfuO19ZviJQYR2tmyoFY6lxpgh
         UuLi7Z6ypI2hOgAXqZMeZXLbBibyupmzW3MMLnh3vK45lK4vcdncqWpFyf1j7VvLz1Y0
         iWxA94Xjkz7EwiScbbv+a5ek9NO26SBPK50o5zy6GvMqHPD6cqO1D9yQWiGDmGOYjICn
         ycWv7b/F4AwZ4bvqZ04iDFUGrN6NbICV79orAJHIyCSBjhz5Tbtu3KMAbSimA/Z0To3l
         yUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384071; x=1789988871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=iY2ObZRR05vl4HbLxlanS/hLN4t69bQrVkkxFfSBVJkfGJJTpfSdo6/dLV9lx/HSqs
         HLNiGNeIavb36dST2oVv7EbGW+TuU/77TQkTVOIH1NJ3wxz+v48orIfXGl+AdiH7iIpJ
         AjH7pkOettGEdrUjHfYbaM044UQprT/UqnTVRoxr+ZWP0IWByXip17O0dnhiDlfgLJm5
         hxSx3z1tLJxVwjCE9wWOjoLagd7PsM8VGmfwPpVV+WgvnCVAZrfXqX2QUbaB2iBwrWCU
         SApr2eNfK79CmeP+eEVCENdyQ5bWyxWY1I6jmGF45CbtJiy/cgngz+7KQNzHzT7hKkrG
         zJpQ==
X-Gm-Message-State: AFuF++k/56t4BZa67tfRyi+ZatOYYcm7k0ce2i1ct/cB2dRXnfxeUZ/B
	Mi6fh8BScz85GxyDxdD5o52J8YWURNRuMM2jDlP6ry6gLcRWV99UUFgx
X-Gm-Gg: AYBFou3ve+uXM8Ebx5Dp68wes+fjuDBmYP2iF1FDTlhzH0cZEUBAogQ0vYSOEhDjm2Y
	SpR5PoZDV/h2zhoogn7KGndWa5226uo1BwG1puz61qfoNRj6Q855BBXH9UFJY7mKO+abdSilSUb
	NR9NP2xs7eSczDksFmXNWglNi1nks3vKIQ86X0LsfWeoLLoQWxltEsdH6MufnAvyOa3t/wuVLI6
	uDyOLQUIbMUJPCDoTh2LrEtDpUJ2m291m1Eb+Nt7m12F436aqKseq5rPzRFcl8eHyMrNFl91dlw
	aaiComZVGo48ytxaGqzM/Yal/UURd23Ig8h0MsbpZnZvVfv0nmwq+CGPlauoPEuk+vSmbdGVpVh
	0TYfhvC7k6Kncqmu8ZN0gZQpOXI2SZokywmy37V8P1IPP0ACzm4RLam/fNVrjF4s5XKFEQD/MDd
	jEnNE1uIuKN2qH+XuiOWkFkSeAiW48Lhx0Yq4uV/39HELkc5iCvs6gTR9cu8oQ6LmeXc6rWp654
	jeu+TFALS/NlaQz1L5/nDhlsavR1Imo5Wv2SV96NpMt2/+xrZv/Yf2+AMFS
X-Received: by 2002:a17:90a:e7c2:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39dec497e11mr2160746a91.10.1789384071050;
        Mon, 14 Sep 2026 04:07:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm22996627a91.9.2026.09.14.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:07:50 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Mon, 14 Sep 2026 19:07:38 +0800
Message-Id: <20260914110739.203479-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260914110739.203479-1-cwweng.linux@gmail.com>
References: <20260914110739.203479-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_040753_249219_7AB43C88 
X-CRM114-Status: GOOD (  13.97  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
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


