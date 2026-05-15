Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3t/HTiJglvdzsJ47aN9ASMLT/MJgYi+zd+v25Q1+h+E=; b=aHI5V9Gun4Ublj7g+UlIwFC4pd
	MbTwLvZXNMZJwdq0kH5UXbhuzZ6j6+Nyoad9IG6vm92Rb12K9O7JRWcSncfsWszHzv8JxEvLLVM6t
	cvzOWYy8yX57FDM3pibw4uoNtdhTRWkM9gHeh1jM54dQ/95ekfie5qPK4wpTAxt5YpITO2VdNLhCR
	pQb/YN2KXCstFTfJBTjlzdIwDzUnyitQViwymds8q0WkFqijIBiLUET7vMqHV4jIeprwYaQuddgMb
	fwHbgeBu0FFCtXbu5qjHS4hYb6Q2eLTOWmD1SWlqD7FRQ2Cu2vqFYhrfteVfHWPLHuufQ4JBV0OPe
	oMn8bVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrD8-00000008GO3-4C5i;
	Fri, 15 May 2026 12:00:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrD6-00000008GMh-0GgZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:00:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso90357111fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846405; x=1779451205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3t/HTiJglvdzsJ47aN9ASMLT/MJgYi+zd+v25Q1+h+E=;
        b=VRNFZsA+PmG8HwfMg9flUWqxV41bOy+ILqGhxeS8SR+sOdkT0Sr3LFHNHcox4B+aN+
         /yBEmV94/tT2byyOeK+iRzqyKUDZ5fVOK3kKoULUMGkzgxqyCR1GD6o6Ox2/dZlE60GN
         pnEZxluQZofiol/xqbldQLdZCLwSs7PBNxMW+8uuh/E3yZfdcGlTVIpLJ43Gb0yDUuzy
         uZF5AhW+UjW/tTXI2sgPPfCG+U/Goz/cQia2xcX/qG0hL2oNRYqu0eDjCVKkICAXqImc
         aFuv1mknPr0U0OYg9iImnkgL6/n++ZEt3co3BRhFLjT2kizDq/U2KbyAPZVmdL4Lm/RN
         CZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846405; x=1779451205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t/HTiJglvdzsJ47aN9ASMLT/MJgYi+zd+v25Q1+h+E=;
        b=p5yiG1XNpzXnRMF+zjFNLriRfAoD8UDHHR5VMWvi9ZTrCBdVWj5JqjohvpMky1h0g4
         nTCuqEoIhmXREc7PfPvrWz4ED41oPIRHjWBxQdbjm5205f2Pozyj5DUHqS62oI5Fgj58
         K1wnz92b/HJQJl2ICURfkQyawjeIbd5PE2usV8N6zZLDHl+aqIQQsqHZEogdVyWOtFur
         LhbEXpNbo/JLt7pZh4MdM7frfdXHoCYqnf5CVIvFpVNMPYo25SJq09LL448jYtl6Am/h
         xxvrbpNo40idIOplwshBVjJDsVes7pKXDKwMkiNx2zQHoUdIw0GcBaXHhakWfDW62b8X
         Ujrg==
X-Forwarded-Encrypted: i=1; AFNElJ8yXlP9denU3KYW11HLxGtt22Y3gtkusPA9i0aIDvfLDStQF8ML8n0nf029z5SUW9ZMC8Cf4w41KHXTHYYm0KPN@lists.infradead.org
X-Gm-Message-State: AOJu0YyUiA/xrE8nFHhxDmDT2CY9kTzAT99aKLUfvEeZGTpdqbX9e/s9
	/qUgm4CbcLVmW9r0Cndt/CNV0TapPMhyAEDSHlMbfKffOKPXb9SEgreosxhfqmICZho=
X-Gm-Gg: Acq92OEyat/OQWWIttafpz0dI/11rd4oXdd9lAXcq2svBJOWBCIQ2RSW6t5BnTU7dk5
	0LZuRDpxYoNib9D7rhkWayb0AIzKca+SIO2/Qn1iaJMzWOV1iHAtxvltuUnrPrmAhYOnBeFCm1y
	4B2iz3kh1u2mm0EwY/gfZGFZIh1n5ewkuQI1Qd9cUBB5aquXEtLer42NF0vrvrLU6HBW6fndpVp
	0Y9ufbR+0fDuXU/7zIlfKHasuYtL2bNO03wP+ng2fduE7dDwqwxqNqVY80aWwJTrV33zrZyTikk
	o6lnZ4JJ2dYHjSqpOtJwLjyB25XsAhruxhNqnmQhzr1Hb1AREH6kouG582BNq5z0d42/XWe+Lek
	F8FxpqchfCc2FO/eivMzC7biWdv3GIseInDIVvcyH9m7vA15ODx43lYt004CoirsFMfsvqr2sWq
	ax2FjXKliucrPumtHjCnirUkE0HTe3Jl2yXVsjIfcdYcDPLKhNo9Z+b3a5JiN7H178J6yaeEbLI
	9pJpCewa8KYx19GtwOJuzqiPvdvmVbs
X-Received: by 2002:a05:651c:3150:b0:38a:3ad8:6f32 with SMTP id 38308e7fff4ca-39561f26730mr7785271fa.30.1778846405389;
        Fri, 15 May 2026 05:00:05 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:05 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	horatiu.vultur@microchip.com,
	daniel.machon@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: nvmem: lan9662-otpc: Add LAN969x series
Date: Fri, 15 May 2026 13:59:07 +0200
Message-ID: <20260515115954.701155-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_050008_115297_4B17B461 
X-CRM114-Status: UNSURE (   8.12  )
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

From: Robert Marko <robert.marko@sartura.hr>

Unlike LAN966x series which has 8K of OTP space, LAN969x series has 16K of
OTP space, so document the compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
index f97c6beb4766..c03e96afe564 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
@@ -25,6 +25,7 @@ properties:
           - const: microchip,lan9662-otpc
       - enum:
           - microchip,lan9662-otpc
+          - microchip,lan9691-otpc
 
   reg:
     maxItems: 1
-- 
2.54.0


