Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD3E92FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=; b=kn5fZzEywmTmFiaRnmSCYWCdos
	VI/HL2AsaK9CHmaGk1sMaU3+GcbAk5+JeF70SKXsmxzLM5aibBSuwXgEkBZqqUKShH7sxugKT3fEE
	PAWsinTa7wXMEy8Nhu2rH4mco9dVNmIealwzpKA0D8QPcdKGMK67D6/iLOlcpZC8NAksl0tT17A3x
	g8GX5U9o9HmAXq+IWrOJfb43za4uyrLWpnh4RWfEWKc1FhH3tKskYQ6zNGojB04gODMyz26F6MJWB
	Z9Jf3bhFM4qEaoplpa7xw5VJgQIUN5TXo/qV0gTNp+K5TEiNSIp7yQgWznM5DDSRlrGxRlmWAZW+Q
	IJ1UxeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAy-00000003y3v-3Oio;
	Mon, 29 Dec 2025 18:41:04 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAb-00000003xhG-2vL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47755de027eso55376255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033640; x=1767638440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=w3BWZXNP8jq/93+75P7pryysaGyye3cgMKozZNGpna0QclWD8IS+XP1YrDKGx40xRZ
         FE9CgqkvGPgigtOLIXeBixhPjQ0Pz/uvFAVJiO2uYNfJGo7iOrGJDl9HiPssQudWVfd3
         FkKyvapMG2UD/Vj8cgIH1eA7vc6QU+V3KsAXemzmlScysi/b4HPef9d7Z0uYAokixWrc
         C88FAZznycz4tO8tXO3mlz/Y27tkZ7E+6ppi71PjxD5+Ixux458gOIHTdDCjQLlc+Xt5
         tS42C5fhOjQUDk1UmYYAArYh+rIC2NYSIf2rH16xvwTSnGYZl1u2GFhah4e+WDTpAOf9
         tmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033640; x=1767638440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=YG1MA+ek542k19DDRlEQyQvYcaBWdwGEhHmVnX1be9xQEy4wAaZfq4dBXaJXs7Uvoe
         BcbZCgeCBmMgb0I4SJ/P/Lb03KY4auChx6BPBy6RMmtferzWl3u+uAUCtS7YqooZfz3d
         iQwLmKxWIunRKABfsCwZQlDB4yviA0toCUcpTEaaZgg+OZasu8dtbLId3onQn4mFWCQj
         YTwOFuoGJQlz9njiqL+wq7FXwtI4r95IvZBHeecputasJvRiZ05KrqoOhRMyVKXkxiE8
         dNjCmRSkq+C/FwCddFNR4ASGHZU9+hho2MFyRZ91TCwEyz5T8gNIiIVqZKDrzPeJ/z5T
         wzsA==
X-Forwarded-Encrypted: i=1; AJvYcCWlhOayGV7InxLRFlem2ljeUORH5R3xLdxIXiLjqEgW78khjsGJmuZYvEoGT+uRkBFOhdQuwQPvojjeP282IwiS@lists.infradead.org
X-Gm-Message-State: AOJu0YwGVIyW9l2u1Gu5oHyRNWsTJGSbTVEMBhlinjHCZQ2UBZKJdMKv
	wt6de5x6wIwKrocV2YJt7N3k6f8RrdwSMZrgR8pniHmK5xeH08OG9HDiw4lsOSfsaxA=
X-Gm-Gg: AY/fxX6txG7Xqj3FHpaKfwKE4JTqgjBdd95v5DN8utLJoJGL1Z1qlRpqT/ttHzqvGuZ
	PTUdWs3pig8TF2/TzG9B0IKqbrz4nIIB0BUJx0Z8HWk7kPC1VOUTw4g4tA+md3jnE5yVwAtZmZO
	cWpe2jfFejlj583euWPolRGqQnbpJ6QBzn5V0CBlw5B7XaHllHIcjnSyiANNunaKuqdp4IM5avZ
	fxZmI+Sf8tUMVyfELy8kOITLW//PiWkdjnYoaGlrlUvUYDAlTgODsCkIB3RSA5VoL0G0wkmN4sC
	cIO87DpK1vO22BgVbLoKSVmS13zWnbk2B8WyevqFh4RQfYGAhrkUZL+CD6wle+6mOj6J2320fk1
	3PAA0uxTbwfPkQ0kT++w3foIDHNK2eWEZCk+bSHjz8MBtorloH+1Wu2lnTkSgRfjtwv2qnENZcr
	WVURL5gND7M07Vsm8sq3hO3jCmC7a+yX3UXvdk8Csc9dqw+Cnp58fXw73OTYgoa7CJcyVhKuzIA
	3EfvRp1u0bwWQhSBrr9N/w3qzZv
X-Google-Smtp-Source: AGHT+IHW2rHrGjnHbMx7gSl8Rbl6YVS9e37XXYhb9JI7btIp7PDkapkLHawpn2EWrbvZF2/0cVQnBg==
X-Received: by 2002:a05:600c:8595:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-47d5d272cd4mr3349085e9.26.1767033640044;
        Mon, 29 Dec 2025 10:40:40 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:39 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Mon, 29 Dec 2025 19:37:55 +0100
Message-ID: <20251229184004.571837-15-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104041_749117_A1DF950A 
X-CRM114-Status: UNSURE (   7.99  )
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


