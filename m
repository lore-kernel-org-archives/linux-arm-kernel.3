Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139AE6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=; b=rt9MxQ+fFC5WaEXPZV6elIinOc
	hHDh9gSJ8EZLaUH3sRYHNNeQe6ycR3JCjaex0kieyHnaAftPgKv01lyPjGEEn/kM1OCjrGtv6SsUH
	CLK7k2TX1PJk30fKPVthVynFRFcC4h521tQ8rTHvGDULLspl+vn7eIUTlRYAD08D5Hu3zcfvClgoB
	/KCoi2MTQqzuplFPWRN6oV3Qr5MBu9i7jplO/xyS6UrFB+eXl5iY/nQAryaFeCXCj9yOs3yi14+7k
	wpVinc+Ab7uJL6jmhBy2TLpcF1rHXZBvLxm7n8nHIk2ePj8FQiD0LMbuR1jwVRrxDG7KNDYkYNiYR
	NiokgaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8s8-0000000G2wW-1EvH;
	Tue, 23 Dec 2025 20:20:44 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8s6-0000000G2vU-07v4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b80fed1505so5630137b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521241; x=1767126041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=ZmXhPMZTZEeCpb1VFPlkft3kloXrjOXgG6JXHsR0G8uEuMz83SbwlVO1E6geR+uKFa
         /X0vfGO75ICvuYLqfql5MKdu4PRo1llA88/Vvauk+QYyd0S31cbR9e20bIAFFmvStc5/
         ot3g4okOiQTVbzm5L6N+YZEKauTX+2EVhL3eAgD50pm+uEL1AlF3ohiyH1InUyfYPmW9
         5tYqb8nfJYQhTJRPFwfhr1QtMjHm/lrivZ06ne06CHq4JUCvddRfIzMiYNL4tj5AGECM
         q810hC+hHc+7yNRcNu7mE3MzX9lO+fHDbcpsJVdzbhj7/i8GJEJ6F+XF6R8MmQlZSGLr
         ac9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521241; x=1767126041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=uuYh8yz4cgQGFiX1nr4ryqgodrmRrYBiHCaleewaESUoN6YmMFtCSgvmKfO+RaFO8Y
         EAlgg4WT43aT4b12N0i23KXOBE8odHTAZvB5nQ6P/RPJTfvmFMPqZFtHDWTCH9qXvi9P
         lqNH92tOKdEQEPHVKT+J0Iqsi6PeBIAtsEupFwSJNAXyU4bU7sFIcv7caoTWzE9TvoIa
         Qy+IzNEAMX0IwRrwDBkRiOGa9mFDV/5qAeNmReJX+eLOllKk9/UqHpcmQFWN+inBHI2L
         OXykPQlLh/mHLh7UNh7kRRNwyW0lEMlJ7ADPxjTlyXoqKTG4e/8A9CETU546N/ASLs/f
         GYyw==
X-Forwarded-Encrypted: i=1; AJvYcCUIQur/4p7ES4AR/kVOJG6/rz46kchQFyOnuNzQ7FL82l5AO2k6y32xujSTZNkPCi/TWLtBiRfThrtPpn/BQgTa@lists.infradead.org
X-Gm-Message-State: AOJu0YwPG213aqPL42Hj+3Ewid5SRQX8ZG9iWCMVu8ajdn3frGspr5Z0
	OTvdG1ai2/Giy9R71Kmxm+72pcGWWpBVy6omyjrPPITyVrMSgVAIO6lgkz/N2JA8E74=
X-Gm-Gg: AY/fxX5RZ4C06nz0UaH69mOz0zn4D4UuozpONNotQM3ZsY5ZqzmvWB/yypVMhFNPc5b
	qUi5+10iFgd8i32JdpHFcYCVbc4BEUHXFG+QRYZ3SUlnN7YjYW80a9dslKknGQasn2Tx6Q6Frwh
	fQuwA1hvoar1iFGfgX29nfeBue5qaYeVVzey2PMzrX0tXymch/QRDzteXuxuLuk7onSaxGJ1TuF
	ufXI9dfC3jc38V8LI/TvTh4GJYwnPPS79mV85AEZHz3/KetVWrtg9IpIFlJJFwhkgx+If2bZRRZ
	07mx8wJEmALoNZ0riR8sNWLz02IDMYYOi2/MrECycKrvCLmtrZKXq7W9p0lJezHkN7yA3Pp0c5P
	csw7B2yEQfM52Kgu68om2i2Vz54PMuKsx9AFPZcm7s6++87U3oLmT6XYnLuRBCgfJwKIDz/Nt9O
	PSxcHtFRS/rxa5DcOc5f5+Yam+YnaF0jVLNS8ivEYuoS0/iNIeUfeKPedsR9X9/TFqV1I3WjcW+
	RHnltb5
X-Google-Smtp-Source: AGHT+IGuoAHYa6yGZT2xpCk4O6bUCM8poDOiYCaAoun2Nvyagb0buXaCaJOvoitd+kEUFeEHxHKv2w==
X-Received: by 2002:a05:6a20:9185:b0:343:af1:9a57 with SMTP id adf61e73a8af0-376aa8e98d6mr14530108637.56.1766521241361;
        Tue, 23 Dec 2025 12:20:41 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:40 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Tue, 23 Dec 2025 21:16:18 +0100
Message-ID: <20251223201921.1332786-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122042_072257_B84B8C94 
X-CRM114-Status: UNSURE (   8.29  )
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

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0


