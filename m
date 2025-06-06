Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C4CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=; b=BUw14x5OOBhz9zZunTev+pszgv
	Jt9amopmZx0UM3LdRLXTUa866i44jVB6AssTvAYUlKkQQbcQL1ilSG00mreM9qQoDz/xLeuuV6bb6
	XC989ay3LqTIjCDu9jUM1zhHC/ZmZ52JDzjlWFPq0l1/LWfNxDTWeJg4zTtA+DhPoLBdrL9tgQSAY
	I8ByhzaHaM+zlfPBRBny/0wpoMoCvIgyIeknR81hwQJXPTxDqVxrcYKKHkDju6kLnKdwB3XbSB/Ha
	Nl/vmRCL7Dvbr7EiWR0DUPHUmEzBxnT8ww3bR4BkD3ng+xn5U3VDoCQLSbGtq63Uxe/WmQs0TflH8
	ZYHqFUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUNC-000000003JP-0f5E;
	Fri, 06 Jun 2025 10:32:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUJ2-000000002fz-1UOG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:28:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2353a2bc210so18498985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205691; x=1749810491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=aMxaBUhAwCt3iuMj26ZnoDvJQrPd0Kj3nuEh5UoACYAkytRHVr7qkx4m3aGS2FHGaN
         3EG/viyLylMV73PZCn7+XVKtAIjQHPAxvS6Rz0zWHseTWmUos0jTlW6c0yD8rN3obw0F
         dwOD1i+b44ximHKGuyu3jE9Ip+t8zcKlMoJrsF5lTL3xNW5dzzcJB5/7jcL4RRFWR0LP
         PZoGBBBsx32s73CRXdgYTZrnM11TP+Wy6vnIBsRKywkzf9EbsfItELJVrIrWcQX/cJsF
         njJLXE1LqrqCRQTDv6hJVEthc8Gtuzo33aQu3CBaVtoZxyGjr6WNZjzATDXnzkKA/nlg
         D2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205691; x=1749810491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=j+cOwrInZA/kI+TW4mryWSzIzEwCfrdY800+IDJ/C1sya4lHodoHsSrkJh/UnCbeLT
         gMY+JEE+MywGjaUx5gHsZKRpyzT3daEKeqnJDpKxc+Ukgal8O4dXVp2ohBQYm+hQLXay
         kvKnJXOiVvgoxWWKVqA29OETQVdpS0qFnTO+RR/2aEKh4lC4WLDGFlXiS9InmAzOiBB/
         D4fgGostnM/yodMfPwZZhKD7aZ1+3jBRUsAkAtIeDGcRLY8TEuvsKj/eOhm0J8lxSMF7
         aGpFKzFlE/W0IhQ1Z3vJLy65Oa1vC1JcHjETRx4k9+hKUIiRkBB4m/oIsFlfk9PLTzs1
         5G4A==
X-Forwarded-Encrypted: i=1; AJvYcCVLVNGPJKL8HDaZ7GdJu6nkOBp/z8YDvwtovEZ9UTMRTAb9qL4XqE9rBHZmN2whRzujslxu4+C7gum2pWe5trm2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9nk3ZDQS4UfAeFTMRcJu7Na8J93JrfOnP4+JxWUogUv4MbaEy
	ZPDRfQv9RBOAmIQ8FAN6BdSw0SAytUJA5nK/u8WZwQDwwxVdZGqsBPRR
X-Gm-Gg: ASbGncsIfgBmmRqPc48b7iwuxoFiTeXX91mWiJsyy6IgWNoyJA3n8PO31qw89yLJ4SZ
	witlD2ID+HGm5WhP+GtFdMe0BZTVVCFokkAakMaNgeGMN1STcFLVk7LkyO8ihtEdA+Lr5yLPm7V
	carRQFxXEqGQMKI1JKslWzWs3xL14OotRrdaBC8BgyxDyDAGqGT6scSyqQ1nN++6dwYTdPvPI4N
	+8oM+bufhBNG3A/PstQKb2HTlrVwEQXiB+bTUjmalyS2KybkD66vcDkyBj/7g5oRj4W/KYmnnr+
	uaFLAas8omyhwdgZk1gWxBXeYh1tzTgiKRfqs56tiXsItIbFy/8CGmUnWLYiunh1xQKMtYn8roO
	3JGstqeqZsC6Dv2OYl1SxEQmweZP7Ji/7x0EmqP9ZNWO76FdB9t0XLlBSX/2o6fdDX/UHlTHGyA
	ppD2HyRTUSvQ==
X-Google-Smtp-Source: AGHT+IHdkRnMxTdMkIPYO52HyIjgNRpDvU7O4+2NT2FszwjIZ6VSApJKtT1r2YkGVF9r+aJyzdfHBw==
X-Received: by 2002:a17:902:db10:b0:235:91a:2c with SMTP id d9443c01a7336-23601d82d3fmr34529105ad.42.1749205691572;
        Fri, 06 Jun 2025 03:28:11 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e35c-06eb-80f3-97a6-ae1b-00f8.emome-ip6.hinet.net. [2001:b400:e35c:6eb:80f3:97a6:ae1b:f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360307813bsm9632885ad.22.2025.06.06.03.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:11 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara board
Date: Fri,  6 Jun 2025 18:27:53 +0800
Message-ID: <20250606102802.1821638-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
References: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032812_391236_CD00D865 
X-CRM114-Status: UNSURE (   9.42  )
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

Document the new compatibles used on Facebook Santabarbara.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a965f1a03051 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.49.0


