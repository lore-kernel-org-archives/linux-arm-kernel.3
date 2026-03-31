Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5701061B39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJsN9xOorEStaNzhqVyskGIBPrVNwL+4GmqbmijKTAk=; b=jJiUxcSXMlwisx7Bzdqo7DLDU8
	m0KhX/e3IgqBXz61VCTlmW8jDtC1itToYExsgmR4vxlDTd4LO119OPAANRs6/2s3u/pNGaUgwsRK3
	Zeih3nVkg4orRfOBkWNm2kV+8ylfz6vPVem7a/e5QSL109c3l/Ibkei8WwfRtJFxW8tss9mXqhCLJ
	sldg0rYEFOQnF4EulwCrPvrJvWaAoIEH/+h5qh/96P6/NuBoJhncL1HLY83I+nW4ej+E5PyLW/7Ue
	GrMiR6Du9n6nw4tYpZcMaiISZmM0cZM3qjQRb/Ftyfhd2CL+RWKTlxt3TXeWc0BBwklgsnl8z9kHg
	83fhAzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Xuq-0000000CuyT-3nre;
	Tue, 31 Mar 2026 12:09:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Xuo-0000000Cuxg-2JSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:09:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2addb31945aso41827555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774958989; x=1775563789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJsN9xOorEStaNzhqVyskGIBPrVNwL+4GmqbmijKTAk=;
        b=UdyqDZi0U0XgvwCOeF/Go5aiJJtDRN1kI550NzDldJXrVqYOngK3oVzpk44fuTgt3L
         TtNn8CqItfk8dAbNcTYIzaPVCqR80b41bGm7G0UcB8QRi8uyDM0Oz6GGtcy0Bba6DOXM
         X0EzmpMYW0bTu0ptNz+NdevOTVQVIQekW9BO7Bz3aDq343r3CC8YGaRS2fybhbBevWjk
         G7mvaPKD5QkewKkEuRda/dg8xhewEDawHvMn1iWZgWJ67wdRchOpax3rrXM//L0xk2Gc
         K3EQD8C/QTQhnYqC4LTtXC6IQHyRZRzW23p9znp1F4sC1l7bcK8Aamc1Z1IX9ZOnSE2c
         2tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958989; x=1775563789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJsN9xOorEStaNzhqVyskGIBPrVNwL+4GmqbmijKTAk=;
        b=iQTKGWtxI4wUvl4sZg9pcJBXkIEigs5B5Nps70YoyLM0YGsGhy+NLJFrzwyRSx7K/N
         240d0D/FGK4aYKYb9j+XMQb1olGj4CRHkGoITHjy/z/gHSPoscmAxmSdB8wEqY0+as79
         wUv0609f+LSwED9rRNN5f+Q8e877k3MogtijWilUrYULHCER3zAV1GEqTfofECM9pGZm
         Z23FI31u9eFQP3WZIBxirDKb8GmOBM2JK4TujKOHh68A+GEyK+y0MVD9pBEOsSeuhr0v
         hShhN2ZYnGTu6x5/9tlTh1MB6YeuLS16HJWpGwcmWDSUuovez62GBxs+ln2JBTxbcSxe
         PL1A==
X-Forwarded-Encrypted: i=1; AJvYcCXs8QnPg3/NYw79rp4CE/I349znVkeNF3I6kRhpu0jt7m+bxhZBteuXFwyPF6bFotEAskTFOwHuQDuoyRhlWrUZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyOdQyMVmK5EGXDuNxm10Vk45GHx1NBaDipuvW4iY6HRhlW23x+
	9Q2TOtFBZis8Ijejh6KhddcGAkZ9a2ESvlNi2xCZR1I+Azoh8BWjp5tB5iWbrHUv
X-Gm-Gg: ATEYQzzD6R7hiVOiQN531TrYKnLkwiDl/iG5tBSfsbMY+etFuEyo+lyJ8w7mnY1uoBV
	YMKnTaUiOd8Ecqu0SjQtH+LLW0keQTqCTflO982JUjt0XSgTKpUneC++I2F8KNnyVzQbOfvmwO2
	ItoMHoXRARVc+FW4kcI0NtDntvE/l6H8dzkDvt6ShnWWGw7fMnobJ80NPFSnlz36mPhylGff3tJ
	n+gVRmgn5OvWKwo60CgDpQCHGTI62JvXA+qBRdhBTaqhfxwKvibzslBc2hrV8dCjwTldQDbtzgT
	oepOZpNdiZ/gOz6L1cIMowxc0F29AtKs3yPTLh7kXqv9JDv++wqknaBW+XKJanOjxbrM/wQeaCX
	jahy85pJokJqVNOGnwX2s4ohLyGRX6BNAz68OVEotbugyHe7Q4mePmVPp6RPuPfQT+W+Py1q/BC
	zLPZhtFWClB9b9EsZzA6noeKeS+MFvPdRWSDny7+xCkGFKJO+H/fQM5ZiUjalDPLi645vD71YrC
	VU+loOh0OFbUK9+hbLAfQ==
X-Received: by 2002:a17:902:e846:b0:2b2:490c:411e with SMTP id d9443c01a7336-2b2490c53c4mr108364095ad.6.1774958989240;
        Tue, 31 Mar 2026 05:09:49 -0700 (PDT)
Received: from bu9-daniel.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642c5asm109350915ad.7.2026.03.31.05.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:09:48 -0700 (PDT)
From: Daniel Hsu <d486250@gmail.com>
X-Google-Original-From: Daniel Hsu <Daniel-Hsu@quantatw.com>
To: andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Subject: [PATCH v2] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
Date: Tue, 31 Mar 2026 20:07:34 +0800
Message-ID: <20260331120734.39260-1-Daniel-Hsu@quantatw.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_050950_589166_B0731316 
X-CRM114-Status: UNSURE (   9.96  )
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

Add an MP5998 power monitor used to monitor the power consumption
of the Paddle_P12V_HSC rail on the Yosemite5 paddle board.

[v2]
- Describe the purpose of the power monitor
- Remove software/driver related description

Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6b..6287f80d70d9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -422,6 +422,11 @@ power-sensor@45 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@46 {
+		compatible = "mps,mp5998";
+		reg = <0x46>;
+	};
+
 	power-monitor@47 {
 		compatible = "ti,tps25990";
 		reg = <0x47>;
-- 
2.53.0


