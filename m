Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwdo4qQeCKznPv9ebQBvPBmgu2DZRJWGaG2NfRNb44U=; b=Za5/dcv1wpNBe6GtuMS4UhOr6E
	XV8cIqINEWSk7qTxlJsWb/iI91xWQeoQ7Ll28dVMB/ZgsY1i0gxTCiq/91XMHgaoDJWoFhsgX10CS
	rQxzml6pWqq9TAd+iHD37YdhIf3waGNtLtM81IRLDjCXpZmxrsMKrjhLky25mjfZNPGLUbKOo+K1u
	NWcReCuLDBXTJdtWCL3KK98mH5B/ak+os3PC0Pxtlc8d4GkEo9LGPWzoCQKyjUXtcZXhRCdVGsHRG
	h0tn5E7vwsZOgtJYBsCSITME+w4aekpEYo5MxtTddrA3AAj1wGGPz060rFP1qWb1JdwnsV6NRb4qp
	oofZ2I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzvO-00000002yUJ-3JLx;
	Sun, 12 Jan 2025 15:30:50 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzsf-00000002xo3-0SLa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 15:28:02 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e17ab806bso1940053a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695680; x=1737300480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwdo4qQeCKznPv9ebQBvPBmgu2DZRJWGaG2NfRNb44U=;
        b=Qp7luOBfdr2vZ/YwG0OVQNgJDm+Eg4kn+ythMctGk0Xe8LfR0XzJk5SgUY80AQTwc3
         qQ59/fSTeAmnrizElPxAk1SY0BY36ZSZpP/TsyammDFpLLTQdNIOwT5w/7VaXGh9z5Am
         /Sb8JfogQDvupCwPI1DrVWPaz348CdgHFMy192TXKg/kQjXHMFTlrsqE19yy+R9wNzMz
         fCJ79Y9ROnTEvW9rhjZgFkRhBs++otYyEuKmArbmct1IXB5PGG3KVrrTRsF33IFBeciE
         BdHiGtSe+Iud8jLT9uPdI0eIvUIc+fPBHDzLgCb9KHrICG7zl2zRDIJyAdlV0ilVju2O
         qRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695680; x=1737300480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pwdo4qQeCKznPv9ebQBvPBmgu2DZRJWGaG2NfRNb44U=;
        b=Nn+Y2AyvzLrO1tEtVqJumLS1x5o+5oE9r33EMTqwMaq7cETeUCpTH9BFJ61MpAHz2x
         K4oeBuKeo4F2gchxSFVycqLyjXSxbPY6jMjOUcaClCX8ICNRPOsXVtQyXjQ1v8n/L4jW
         RthWcPZ7cLGo9xANL1xIG+LxDaSF90cpc2CTS69Z9Mc/PPTGeE5KU+EMS7Pnl9yGtMyg
         Qaj9uyqc0VcmHwVVj2iul8BZjH5jwJcs1gBStsnWdS2MM3KlWQQ1QdKBrdp0OQWx2dER
         1PfXtLH7V4EcQ8HiVU7pARzsQGwbTnKyv6gsgvQ37MyDYG95a7V3FL9wZlU8e4JKNAFZ
         7H9A==
X-Forwarded-Encrypted: i=1; AJvYcCUD+Q0w/2ONEW9fgWu/s5ildaeImPKFs71c81TFoqKZ3uggv1hF3nT94Q0TGoOJ8UYetUzCE6pei2Hf0djPaiwW@lists.infradead.org
X-Gm-Message-State: AOJu0YwhNdG8PP6WJFffqSmB63Jmydwd/ygbIP0ySZobod5MFVcVuqp2
	VH9jbKe27/5JAo0nMkdKeZy8jQf8USuegbwHi9NoSTgOc63eUnmp
X-Gm-Gg: ASbGncu6uPf6EJ0rOOI59vE+M5GT0f+omFQft7muxwXna6gqY+njAZ2LcNKszHpuSOS
	N6cXG3YBW0Cs/jTMJP7yMhE0x2OX5EPT+ToQF89pE15PVsPHfmrCYEMfPWj9c+OyTTqsgVb3YpY
	JSwekVfKcQNPxFBXEBOd62hNKI1I370vV5WWvS6d4ez+h7uYiH0prU23YEqa0bV4kAK2pjGOaFP
	AJzsCmXuglGwsB3EIIakRXeRD5lUB6AbRrEUISGbYkd+X3Qx0KP9T4TnlkS3RhWTfWcAA==
X-Google-Smtp-Source: AGHT+IHGgArEfN9u2RPH9RRrlk20P9prFqs8qFY9RW76sTAmV/urO4/B2SkzhIvQzXSVvGyn3gaIBQ==
X-Received: by 2002:a05:6870:7e8c:b0:29e:2d50:11aa with SMTP id 586e51a60fabf-2aa066b6229mr9191645fac.18.1736695680164;
        Sun, 12 Jan 2025 07:28:00 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80547c11sm2858083fac.18.2025.01.12.07.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:27:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 12:27:45 -0300
Message-Id: <20250112152745.1079880-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
References: <20250112152745.1079880-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_072801_147406_DC9F8AC1 
X-CRM114-Status: GOOD (  10.66  )
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

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

Make the CCM nodes to follow this format.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use interrupts = <71>, <72>;

 Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 423c0142c1d3..ad03c0a13e64 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -46,13 +46,11 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx5-clock.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     clock-controller@53fd4000{
         compatible = "fsl,imx53-ccm";
         reg = <0x53fd4000 0x4000>;
-        interrupts = <0 71 IRQ_TYPE_LEVEL_HIGH>,
-                     <0 72 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <71>, <72>;
         #clock-cells = <1>;
     };
 ...
-- 
2.34.1


