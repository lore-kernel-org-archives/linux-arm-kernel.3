Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDA5E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=; b=JbGUMH42W8xk6IOinBTH32ezi/
	phODOUWTbBhj/5GMa9VKF7etQ1whveaoNjt9kZagd7mD6zI7zpUPlf+Yix1OHRYnrNF7ZDPRFqrPG
	w4sm+F54FLBfM3VW4SCay/N1Pa1td6jh+Y6xWPzrrwDalac+2FEX1hjTVSHTrTFMiqv3gYsuYuVmH
	N50R4EFh1xCCQm3b/n2MHlIf2BFefyghTTr64XGPTfQhO3OXzDOqJjxLqPQqu0wtG+7qI+B16QRg8
	v+diF9/AqSxybGkiEWcpeJcCwfsPYMbKYzEIpWNKYqZOUXNYnovV89GI/xozFzRRz4b78YK5bWqZQ
	yuVXCPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rr-0000000G2nX-2jpj;
	Tue, 23 Dec 2025 20:20:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8ro-0000000G2lq-2iiP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso6122708b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521224; x=1767126024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=RyiIxKFQRh61Wmx1nNjkaEmtK7b6smqZGa8JC/qm5ScTRX8B6vfFtu19YHu5ctBqjW
         Og3NDBxc0RiTgd3llr9EMq2YzPhuBuqYeFsh29OrKBiYyGdrRplpcqpiWTGM6o1/bZTN
         QCxa+MZKVB50GRWFfthBZbSHt7262O13bxRul4ysF5KjFWx0mdU5JeIX216iVKUQ/858
         xTBUs0fo8ZAbUaUj2qj7lIiiS9GYJyZXDHCEWtg2Qe5Lafwahuk6Ib8IfTgDRloEJDvY
         uwnBpO9+x+NQL5/AL6SycqOfE7XV5ubKeDxdpw4V9zEt2wOnLqVOMNocGizFpblfCiNz
         LfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521224; x=1767126024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=h3w2gZW0L/NmC1j89d0GLCd4rcf5q8AyeyohS4+qfEpjigij7L9D9oHzZzglaiU1RZ
         tSB6zSFiSmuVS8L3y2zlRohX7sF4dogJShKdN9VaAexcZt8wAKyzaGF3SrBm3Vr3EHN0
         jLFhuFz7ekTktlGCxeBdoyd/VNAqZJAweRI/Ot4gf8BjMy9dLYx4G/rNgFTAidAnQSat
         phZ4sic9wZNdoYzOAUtSfRBSN7axBKgXLt9ruJ3PGv4UBQjaMKVRsDBNEouzHv0rX2Ui
         zGTId0TgTkIMt9JKrJegxWO+QDRikr89fdR3O5AlR/bNyFW50PWJpx1Qg9He+5WqVpIo
         CRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeUuhwJNANq+FUSPfm4MRwTAyT71s8UenJk+m2dxrqyCZUJp0E1gOWfjbRaSaR4GneSFV9/ZkzhyxD+rX8uh6S@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7HYisEHQT5kXgKwk2cAe1hjFBg5uU4x5ozNuEHrF5hHCt3G8
	vdk9IjraLI/hZ5CZme0u91kcsFWouLXnlYEH6sTCN+LzxWNO19YD2djGMGjwmYJHkSk=
X-Gm-Gg: AY/fxX78rh8HDPpbFm7Jj83j/8J5Am4EdOFwoZgRZIHC/LR89EymHG80BXSZZTRl5oX
	NzsLXikJ27c4d7kpyBKFazIxMhMjz1xoJVFOyGcjwspMEEqqpCcA9VvmTPgrf+nQX8KPKCNVMDH
	wAVCXwTEgkwy+Zfl3d62wBhx/rlwmGVzxZpJY0iXCvpng3QDPX9l05g5i0FLoV/7Mal0i1WXo4T
	nmD0U9Hu99HY2QjAipQehi4hkHrRVAQGxzaJ23FGeCmYBBwC5994qOP3TgZFK8rQAuKvlPlzIMx
	E1dZ67VYng8JmPq2yGb4/Tj/9n5UgBjfVVPK2xvqNQA2qdWFuhLh9UgQu9E3iyAjNHRMGi6QcWT
	YeIYnXDEN28/78ACEIFQxZQc+x0nQIprYuwtvQoNTU8k3g3E0Ou4vCZXuMb4UyvjZ2qq9q8b/pj
	AOyhKZnbnWs5Vq1rE1rcxtSRqp2/sfnqSLQy21ATZxwGxkz0H1kuIYkUcfqjNYuGxemQmqjAtUX
	qwVGArs
X-Google-Smtp-Source: AGHT+IHEkRqkF3+ulFb7YQxPiXmGF+AIEzrSLTHIV/1Chrc5EC4Qv4EqGmxiVXP6kKzXYBSaNsC5Ow==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id adf61e73a8af0-376aa8f3946mr15876623637.58.1766521223699;
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
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
Subject: [PATCH v3 05/15] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Tue, 23 Dec 2025 21:16:16 +0100
Message-ID: <20251223201921.1332786-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122024_696282_857D2C8A 
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0


