Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6866E92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=; b=AuPS0qeUDQycrb0Zcpl4N+xAUy
	M0oy5cFfChzZCghf2gINz5Zm4Y/t0QVYnEmju8LePhK3TJRPIh/kGQ2aB3t4gYB/IBIEx8lptUaVu
	EOvC/ARLlfVpsq6+lAIX2gP0fb1/QlRIph/Z1ypDaqccuVJWLvE450upQMCNFpOry+X+FSyc8T6WA
	ijwAkrAapZhPGq8wBr5AZVHtgL3e6WLIQ4+IiSvJWpMUqjw33UXrpe6s8K1QiLTqOuiIzZ2oafx3c
	nEgKJIfPkRiT50ZNN8HRvOmK/7PWXPsiExUiTOOJSwC/bEiKjve7sB3Lkaty/RcUlViDhWqgBZ1iO
	TMywxXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAH-00000003xU0-2ayx;
	Mon, 29 Dec 2025 18:40:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAF-00000003xSb-071O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so71139615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033617; x=1767638417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=HERWWLZ2/LYkr9O25mZgfgkaKWUd+fxzBJcKb4hBSszZDLWQZAPPLQNuLS1Zi5UIu+
         9VN09DaN3elY6MX2miXAbZNw1/Cr2a1fodv8lelHA3YpWyfIs6egPAO0HaQMFMrJvthT
         WU4mtIgwV9XVeHZ9K359Bb7hc0j8wDVBLmSSCSsGpitE4SOgYpPrFS1eWNK26UGObH9A
         cr0lBSqL2umKsffrY0b+P0jWFOxPcrfrPaaC8q9InqH31vJEHIRDMkiZ4E7V3hmItsLH
         Ev2lbTJ4X6B94tsKTHksWmGZAyM/JjmlfbVVCqB0KUWbYZZPPcf9CzPQJa9uAP74SB1R
         aVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033617; x=1767638417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=BgQ9U8wkp0D2ORZ85Bh2l0AcybvcyZYYWpUpT3Cz+8D11fkJcje0iyH0YqnO4PQJa8
         frDMhOtahXKhsBnE8eObRG+AcstjjcpKMmkJmTNbo1PlLlEXqAhJ3zVPpUXUwwA62sCK
         Ocnq6CV5TH7tEzlsa+w2md/6/M3xJns1ZBR6jp7erIsTIGPw8JuCWx4zlKQqCbdeV6eS
         FdBjbT5FeOLeqPf0cCjsjoJKO5lb4DMD9HlzgqdLSn5Fs1V2eNLlNZwV43kjFeS1QuCw
         4oDl6mbvad8LcIqVOhM1PRTnKUWprOsEtlSSp0xmNqSIpanQUm1vtmwHwkpx2u2X8KRC
         sM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfNhx49VnOW85FH4SeuBGrbWpHTic4DcELaCix5HyOiBT0p722x9CXaSZd9KcALa+z6G50uffa7uY0p/bV3qyu@lists.infradead.org
X-Gm-Message-State: AOJu0YyVX58MoU1FUxxL+i5jM1BATDMMblRFsMffeIfshTir03phi9ji
	SWKU5r6omXnC/0l1QSGCkAk5rgOmXDSMEqxxgV4xo+9n8346NAMBZMSaClxUYzbcWrc=
X-Gm-Gg: AY/fxX4tQNj/x8yOTt0Kye0U+xnRIW+ZuGrVwNabKYqqRlzJT2Ogyrjn4DADiyLszzT
	iFc0Udp2K0KjDpwf0miTnyWewVHKfn39QO0NlkLwKdI+DnjUDVKHIwCwZl7gr4pZh/ema8RdpYM
	bNyh8rYitrSFuymxesTAwDdyAG99lIqlnBGQNj/Yvpzls6BXqq5V3A94qsaL17UG17OUWzwbjWq
	8svJz/MuTIMTUgXDIB5AaNtdAXEIcQwkb3NT4bowEf11fTTUsPW9+MPxyy4LFn71PC2mnHvCQ9m
	SLlLKjyCun14kZShwAQl3xwJfNDaCpUuKbm6d4BTZH7QVRUkSo3qBOnMuSWj4GQCgt2nJKTR+4q
	ZNkTQyazfC5V38UVJ2pLFThNQh3g5p2xmMKWQhBdGtijXvxUZacPilNcALV0mXzdIt4RL4mvtsO
	KX7t0U88WQT77xyIdK24u/dGgk5gCO71KSXvZKiLr8+TpsTA+ZLSrpFbTkpKhqiZ2ULkerdhCZG
	a5kWHyjm1WVsMESKq9XdkKXKEzjZEgqVyI3Ypg=
X-Google-Smtp-Source: AGHT+IGjzQS21rGuoSBITpTDpuhXFeVyR+ePrw+9us1bVyog91e0BDAjrgenQhgGZwBix2fL5K0wjw==
X-Received: by 2002:a05:600c:1d0a:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47d1959f72amr367970555e9.30.1767033617043;
        Mon, 29 Dec 2025 10:40:17 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:16 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 29 Dec 2025 19:37:43 +0100
Message-ID: <20251229184004.571837-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104019_098277_8BB3D12A 
X-CRM114-Status: UNSURE (   8.54  )
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


