Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4287FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUVRwWWJXllkfJL309Dx+vzW9jbLbqXBywSfAZo29NQ=; b=L9XBckw5F994YKq5vn8WsdPWtV
	sgbwq1cf4xGQBUqbpKJbE2tMnNKVJnO4EdUFYBjbbSfMcVZ22eOPrM5JPDRWHfosp87OJaM4Oz/CO
	1xTLkl/dFnk1MM9sS8CqxwQ/1uwvkbm/nKBfiZHGxhvH4zU2sWmFgKGbg+LkYCiLOv3GPBy3KADHi
	zlnKiNkgqb2S0mBRJ+5RR6C0Osrp8Lyaex7NuartvTNq+LcgWrS/foiiMnLze1AIO17/B6N53L6Gl
	1sz7G70kKbvt0ate80/4OI5tvXP7IsfSvkdMkEbbxs+Kk61SfYJPWM+xEudWxb7TsInPsHCJlEkLp
	xJcncMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrDE-00000008GQT-0uwO;
	Fri, 15 May 2026 12:00:16 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrD8-00000008GN8-0M9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:00:11 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-393d6025f99so7850051fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846408; x=1779451208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUVRwWWJXllkfJL309Dx+vzW9jbLbqXBywSfAZo29NQ=;
        b=dRqufXbIrmMo6fDptEPjvdr0eLrOWAQOP37FwH7X3z5gcYFzTYXylqxx2qwk2gMMKI
         a0pwkZNi9j5Y7D+GTkFi/JOp3NrgPrR8hMy47CjXsJ9zCKTq5BOLqyZLE2oe3Wuybg7W
         Lf7+BwRp2V+YTOWhcQDNOJsnM8NRAsvIZxr4HIzP7aiEzZ4VZt5xU3b145R8LqB60uP0
         5IQECAoNwsww2l1d4xGsXeN0nTYpGncnreFZoafAh0oHr4v/Ee16kXeRwdw7MtooiJmn
         eQFq8BPBj30jwrAWiCND/12WFEYtPKeLLsfdPnMa0fcTE+dH9vde3wWaGDMZYDio/nBh
         VC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846408; x=1779451208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUVRwWWJXllkfJL309Dx+vzW9jbLbqXBywSfAZo29NQ=;
        b=ixDA5ZqVlfOpEtBoyieowN7eX/MqlN/i6fxNpXt1uxDN4lBMGkNfYn6N9DLUZRLP2x
         2Oxtw3/xol3ybLe0QyVrI13QifPhziFSpY/sZ/OQVlzOC+qGmMi0vJSSpb7vjuuFqUFO
         08ji1MM+srm0+Q9eimYaxHpd8GW6UGn/oA+d0RuCABaJ/PBIuK8Axduyk15C76gMa9Ng
         U73jRUNQtAN1Myduxfu+977w+BoFqncc5osKYDgpl0yf8cjL7n1bCS1+x58fMnnxjbhq
         e7ljG+KpPbL+qipUMxSgeY4cgsyltjz6vcJDqNJXr38/gi3iX4Q/fFuussNlkGvGn4qz
         8pwA==
X-Forwarded-Encrypted: i=1; AFNElJ8BoVcYjan2WRmVFN+SRMD8cE2sQqvSmEUyfLj/ahnOp7tAEsO9AoX8gNnFLfNhSdsQbQXWLQAcoKeQnzpA384y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr1kI3R1biNKDAGVlvqaNbcYNfN76IGSfxKg8iWFcA4d32Rton
	CDLLX1WvHtj64pRPSfFX0TkQmvgkJIvcJS5SoS/Q4Ux5NpkSrNqVkL6Oonv+4LNt6iI=
X-Gm-Gg: Acq92OGIVztsQua2EfTNSStcbAHEvPlRoPZOy+x1ePazq1SA3xB/hKCCfGQYnFb3NYD
	badvFzR9RZ6mM/c1lppxmBOBZXeOpVxjNZUXn5fMovPEm12JhedokgGVAu7T0HWS5FiFh4VTpoL
	jvmGUhj4fM13U6nNVqZ6Pt+R8DcRqcEk63n3t13mZdMMZBXXu/wgmwoOpQG1jy1wyqt/qPYktJn
	WgstmuawRpWO1yz+kNGZ/jXpnrHLfGVkpYiYIx8yJ9WjbKnQWcLoDs1rx7QpfPidzD4k/Tyd8ik
	EsvgdFpo688JH7BA4CR7rtDhIGcBCkwRkqlgZ35FdX50GcXQVYa5AW95fGCrTMPma1v7ClFNq0j
	26sbI1SCqm+IDOmRbNmkJnCfF0lXPejxEu/6SXyzGAWUj/9c8EKiTFCO35nXJmj0wrmsZ21TTP+
	vdZdt3Aw45DVID5Jt1hly+mQJ71/5OtEyZ+DpKg54XV1LI7Ve5hf/asZDlT6f7x4cau6magMZ/4
	Xcj7rhRIfdUW4vSAA5t8Q==
X-Received: by 2002:a2e:9b86:0:b0:393:d582:b62a with SMTP id 38308e7fff4ca-3945b492590mr22094941fa.5.1778846408103;
        Fri, 15 May 2026 05:00:08 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:07 -0700 (PDT)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/3] arm64: dts: microchip: lan969x: add OTP node
Date: Fri, 15 May 2026 13:59:09 +0200
Message-ID: <20260515115954.701155-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_050010_135189_652C5B14 
X-CRM114-Status: UNSURE (   9.59  )
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

Add the required OTP on LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 235e56bebbdb..ed997d87dd09 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -100,6 +100,11 @@ usb: usb@300000 {
 			status = "disabled";
 		};
 
+		otp: otp@e0021000 {
+			compatible = "microchip,lan9691-otpc";
+			reg = <0xe0021000 0x1000>;
+		};
+
 		flx0: flexcom@e0040000 {
 			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xe0040000 0x100>;
-- 
2.54.0


