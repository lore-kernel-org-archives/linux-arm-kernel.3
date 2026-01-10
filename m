Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B98D277CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHejtqYvm8YviRK9PdOgnSYF+9KhP6ECTUIMq3qYprU=; b=Ml2UmfKfvYpfknz9tE+SO1Lfpw
	uVDuC01iYTwj+OUqS9I3amBeCNDr1Hu8nroGBAdOTDvOxjpHGN/Zzst31EXE17x9NhWzhAJJylOIW
	Se7E9kQZ3i491eYH1hqyIX1qqSxvBbr3SKrsMp3tB5o2e23wdyXKuKQTC9OmpzilooLAgfXQmEjhV
	sh918C+5oAZJmzvAmx9puHi8hLcyX1eNVW5k+GuPiCvqvDxHX9piABAef0TmYeDrEnewtPL6SYQnG
	VGSL7seCdjhCQ0sGxRhDcGIBvX78NCM4qQAWhePFCqLFZNIJU2hwoAKuCanMZQvLq/eUdtwVK5wEN
	UiTQ+vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO33-00000003ARw-13Ij;
	Sat, 10 Jan 2026 01:45:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO2y-00000003AQT-3D4l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009543; bh=qg7Pk8rockg88W3JqvhGHWcVwuZqkGR0+ZYRgz5obY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vl8Vo7aq+nOgj87EwVbk1ye617XCPDyvUD8hsuZKqhbFw1RnFrHg5GAar0M27rqFo
	 01hssqOfY4FecFCYY2qTPg6Pd9TAUayl7DU54DOdVdljS9PIcujdFRtf1TRGhYuNRR
	 WQyMeJWIZV8Pf66imYFI2zAEpLIFuUDQawW4zGJ/8jBdepylyDND6t/tyhYYb5yYt1
	 lvzPmqE+xRXbE3OmUrdu63l7M8jVSptfP4I3KuJe7LW/mcmge0IilnFOyetapNYRGY
	 c0jS6prFJmxvRw/7Fq8tKB2ZHEhpHjFDTPFvh3vNGAZZSVrMg4RGC+7fw20Ms+xCpF
	 /iKsRyGpKaB8w==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5419E3EB2D5;
	Sat, 10 Jan 2026 01:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009543; bh=qg7Pk8rockg88W3JqvhGHWcVwuZqkGR0+ZYRgz5obY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vl8Vo7aq+nOgj87EwVbk1ye617XCPDyvUD8hsuZKqhbFw1RnFrHg5GAar0M27rqFo
	 01hssqOfY4FecFCYY2qTPg6Pd9TAUayl7DU54DOdVdljS9PIcujdFRtf1TRGhYuNRR
	 WQyMeJWIZV8Pf66imYFI2zAEpLIFuUDQawW4zGJ/8jBdepylyDND6t/tyhYYb5yYt1
	 lvzPmqE+xRXbE3OmUrdu63l7M8jVSptfP4I3KuJe7LW/mcmge0IilnFOyetapNYRGY
	 c0jS6prFJmxvRw/7Fq8tKB2ZHEhpHjFDTPFvh3vNGAZZSVrMg4RGC+7fw20Ms+xCpF
	 /iKsRyGpKaB8w==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id A180A3EB80E;
	Sat, 10 Jan 2026 01:45:42 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Add optional Motor Control PWM interrupt
Date: Sat, 10 Jan 2026 03:45:23 +0200
Message-ID: <20260110014524.3379187-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110014524.3379187-1-vz@mleia.com>
References: <20260110014524.3379187-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260110_014543_361927_B6921BB8 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20260110_014543_361927_B6921BB8': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_014543_361927_B6921BB8 
X-CRM114-Status: GOOD (  10.14  )
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

NXP LPC32xx Motor Control PWM has an interrupt line shared with TIMER4,
and the interrupt may be used to report events from programmable counters
e.g. timer counter limit (period), match counter (pulse-width), or from
counters on input lines of PWM channels.

As a reference and for more details see NXP LPC32xx User Manual, table 595.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 .../devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
index cdd83ac29caf..53520f005acb 100644
--- a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
@@ -32,6 +32,16 @@ required:
 
 allOf:
   - $ref: pwm.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,lpc3220-motor-pwm
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.43.0


