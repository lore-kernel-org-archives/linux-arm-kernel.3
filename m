Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0776DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=; b=dPkN4Cw+rlSSCF5fdp50qqWh54
	oRsvsDy/fqkq3ZiME0D4Cmpbno0g63lIV8BkTFzyCSUF2wIIbJqsvAdNMYR3yOG/kGObXkVIIZ26b
	mXd6Vlr3taXsVgNCJAouYmeb62eo5r/QUGoIcWUY7wiExeC9l9J9hynA9tfOBPij+fy7YtxkJiv4t
	69UTkPjsyNNcMMVvRdVub+asHM3T9t9Pd5dYIrsxhelWOlz747s+AB/CFIQp/Ff21NY2RMlgEp4ND
	zu9JOJQljA4OKkTsOz5Od9/RneRsjDCVc24hgcGv0dJi+abjHtDIawKaGtaSEVc0r8YcLAvQSS90C
	+Gn892XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDqy-00000000gg5-1OSZ;
	Fri, 27 Dec 2024 17:10:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDef-00000000eVy-2MvB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaec111762bso914468666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318660; x=1735923460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=dTesJtmdH6O6ooNs9+0YO++RzVFb79FnNBgJJ03ShHkb2uGPVAvbBypMBes6rfz7IH
         QgbiHEhaMPz2ANmRt8HqIWwZdv8qdaMXeR3BZiul4FsF42KEbqwjbU7t34HKZzLksUGZ
         3waciBCsGJfzlD8FhGEXXGLUPFQpFctfMFB+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318660; x=1735923460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=MxfCZgEve8SaAAjASbwtQYEabaNh8z3Hx1Oez0UtigVqVWKApkE9iytPyUOqvVsoDj
         MTBNGN4DkyJeBcXoxlo5bkkh+AL3Mlxv4fFbgnZjKuk3eU7gbtkcbcgmDROTxECjqvEQ
         rNxiil82/m5pmDhFFw/X16Ofe8BO8Ubbrm8PjmbNmZIjwtE2L9W7TdlvtXWd/HcBj+s9
         d8EpsMMbfUvX4HZt87KdSGF+JV+3kzleok552emdkpCO3+DFJ/OwFolSZ0wbVjXwRtmn
         s5m+Ehlq/P5WPRLwoosTQo68PXn4MYGpBuPAYuEItWKZxkXNdVFqShGd9ktp8/9IQIYr
         x4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeGTcBGm1UvT3G88HrWaKbvxMEL66/Zm1ks5/2RBJmNt5UxYLZt1nsLVhpxTYmHUnLp0XSxHaMxTSYOxtLw76p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2zgKipcMgHbxh2Cn87Su0CXUdUlqcH+oaTQjuY4JwjApv6XK
	N+SLBIypUB5Lw/Y3NyIwFSQn8eyKvn6GT/6BwtojL0H44kO3IMpv5rOo/TminK0=
X-Gm-Gg: ASbGncv0H7CBYgpj0jyzJH/l8Kh7jOPgGSSahYrtl/keoIp5n/XUnAEBpXnVWmRZCBh
	QURM8G+jxw/u1UbSw4HH9kLELnhWULD1NXt7G7ew8MGWrUsw4xMqnEzENrSdsuklVHY0WyJEV4Z
	aAMQdJBh1gbhZ0FmXD3SeKFbhLdZbP2ELW1ghUDZ7gKcYeUDMzZeGs71ssLUzjX8GGqVut1RhKh
	9sVX/ruIRwzJIN+0Q1bT4QpyC0cySQWZWhtg1QV7b9IlIlojhZ9J6FeBQwIZL6ZmDHd0nNPchxD
	DCS9B4Y4A62nDhFday99KA==
X-Google-Smtp-Source: AGHT+IGCaJDO5HxA1JrQ3trYq1mZgAVJbVh/QmApzDwyIdyVJeYbHjoW+NICkcizlG/u5obfXBOTOg==
X-Received: by 2002:a17:907:3d86:b0:aa6:9eac:4b7e with SMTP id a640c23a62f3a-aac2d455458mr2795714566b.30.1735318659824;
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 10/23] dt-bindings: clock: imx8m-clock: add phandle to the anatop
Date: Fri, 27 Dec 2024 17:56:13 +0100
Message-ID: <20241227165719.3902388-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085741_603469_20A228F8 
X-CRM114-Status: GOOD (  13.70  )
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

Adding the phandle to the anatop node will break the ABI but will allow
for a better description of the clock generation hardware, making the
dependency of CCM on anatop explicit. Indeed, the CCM receives the PLLs
generated by anatop as inputs, which, together with the oscillators,
are used to generate the clocks for the on-chip peripherals.

By doing this, it will also be possible to generalize the CCM driver
code, which will no longer require the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 .../devicetree/bindings/clock/imx8m-clock.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..b23e639e6389 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,12 +43,20 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,anatop:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the anatop module that outputs the PLLs, which,
+      along with the oscillators, are used to generate the clocks for
+      the on-chip peripherals.
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - '#clock-cells'
+  - fsl,anatop
 
 allOf:
   - if:
@@ -109,6 +117,7 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
   - |
@@ -120,6 +129,7 @@ examples:
                  <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
         clock-names = "ckil", "osc_25m", "osc_27m", "clk_ext1",
                       "clk_ext2", "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
 ...
-- 
2.43.0


