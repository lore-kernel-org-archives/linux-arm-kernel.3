Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD81D12D56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=; b=2qMOtvIhsk45V3lcOdCQ7B0Lb3
	tCKFpeMuSTEaM0ydtE9zKqR4nmuQo75f/yAvdZWhEwGpD2qFAVPGEzytT+2JQyZqZ+Fw0pPAiVRJh
	1MTpQlpLmK01qrNJMTlT2/CNpOEvyAwRm+dcwDruB+PjYj0fA8p+LyP8YQVncITDwX05hG7FRzgZs
	I5geiXq0/WHNKQ4+iqCZiyRQiNVvX2bfMsdiMkGll+kxdwrsLczv5nmHIQjcNcMI8NXye82D3419v
	3VKef0bYvgcMacOEoDhUR4t5uNkb1QvqZ0owfM3fNZQOetjlhdh7lodHv9GRZQnKHuNKp1F088m5n
	lVRTgt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltN-00000006YMG-3UZu;
	Wed, 03 Dec 2025 12:23:33 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltL-00000006YKo-1zbP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:23:32 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8823cde292eso62258226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764610; x=1765369410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=LzPk0Us7vm6e7tYFck5qIGccKLNreITgjUchbGQGxmrkjMmv2eKauxh1aNs6NgXa8F
         XQZb0nzhB1m8h0XvwIydriBncay9BmrHlglar32Gu85GuRPwEQIp98OM7T80ttSIq6mr
         I2IOSpfCvV+XHFrGHlwsxmZkzrF6arSFuYgqEexEDXcluekQh1C2mUfAyxHWxWsNnySd
         oYFoeT6sQOvlHCoyqIDQxUXK/SYKcjNXI9d7yh1Lh0+nYkN7gTRNDAEK3qAe/WHkNwmr
         xtgyyawpBRWXJeO2tTTTnTpxAkEDyOYZUbsPmYho/j46D9rTJPiPs37XG2Ci7jSw/oZ5
         upvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764610; x=1765369410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=K7ykNQaPz6ch03PtyHOH+mCf7YRYSMSubWsWHxP/01ZW2uYG0+0mU/I3Tru+eE/SeJ
         mj6iS7clbMupLlymfw2JjeSYfKa/y+/6pjQAMEFfh/rfU+Dq5TXBy9oA4D8ACLZROqEX
         MCoOPVGE4bMBIfIPfVG56ZFj3sCiORjlSSMqsRkVLB7taXr8CS8UzQS4KgY9376qYA9j
         3q1HiMEDON6+uH3hrWv5OJzJxaQzPuodHLOvfJ9Wrg9P/W28gQoCWpoLWVEQV5Gk6CVa
         kAZeWpRbMZ/efxcVYtKokL63pVhQ2Xc99INo6263qxas5q8iXXavMsHL1d+kXwQTtzDp
         fLow==
X-Forwarded-Encrypted: i=1; AJvYcCWd8qF+rM+8g9duW/7AdrggryjWUFPE38YmGTV15y4ZHYmT52hdEPpINEb2m5EuDrc4m4auOwNU5Es+TOC/PWS7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/0DToROacKK9SscJQld0F+yLoSgbJFl4ldfl/WRsoaSBvhjiU
	JHUHR3OFm3KmgWbD9ellXZLtvf+IYQqJke85I7YS+kHKjBdFnWmFXzVXj3v/bSIVtB0=
X-Gm-Gg: ASbGncvQ7zIObHRvRPRcmuWwRezjbcqqLiffYxKmpI5LFxvXkkKlEj3WmVnq9PFfaHB
	fFvBqJTeyYTE35NEW4HaIDzQ94CqKwfJLhAiGbZkZezXZ+D2SwDo2ZRZE4jSnzZ/qmeUXzcT2+q
	QUoepRtZw2+hrsW0uB/uNt6x0MVrVbdqjT9Ez01ZW4He/3WrcaFlexWnEU0Mp7KotS4QhoY4Sqd
	gm2ce2nyXPGLbIRQH6ICVL7xbmYacF968nK1PLRtktFZ6kmNtlYJTqoYSMWx+aUO0J1OhHr/opD
	/A2Wlr02i8I2pxcVa1nYCJuE7h4dtWdQ1DZtChoD72vxnhtCvu1i0hr7Oyt0rtuAo6Z8RfmlvBz
	MDJwmHYm6cQixWotQ2tXjNdA9Nd/gxd6uDv0NaZ7xiIFdSrRxcpNphxBFJdnU188x961h8BNZWR
	IMcva0+Oyyv8NfpmGa2Y7X/4blcbhHTgYnAx2oJymgvVho
X-Google-Smtp-Source: AGHT+IGsaXlqNMoWBqDJybU7SgFep9PuPbieD5S4OluHzHLsLb5SxcZWmzH1944iGtWvvNXqPDBk/A==
X-Received: by 2002:a05:6214:33c9:b0:886:3fd2:ea78 with SMTP id 6a1803df08f44-888194c597amr27028086d6.24.1764764610234;
        Wed, 03 Dec 2025 04:23:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Date: Wed,  3 Dec 2025 13:21:30 +0100
Message-ID: <20251203122313.1287950-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_042331_519887_62D4BB0F 
X-CRM114-Status: GOOD (  11.15  )
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

Microchip LAN969x is a series of multi-port, multi-gigabit switches based
on ARMv8 Cortex-A53 CPU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan969x.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
new file mode 100644
index 000000000000..3fa1d4ed40d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Boards
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |+
+   The Microchip LAN969x SoC is a ARMv8-based used in a family of
+   multi-port, multi-gigabit switches.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
+          Ethernet development system board.
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan969x
+
+required:
+  - compatible
+
+additionalProperties: true
+
+...
-- 
2.52.0


