Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7228E92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=; b=I4VsHZPKyYOFfdrvMLV1cbhDX9
	YsqrMKCmh31MbGz5W6ysPqxLf/raXlNIjIiLVBmAQyqw0P5++GnlNlHCj/bHeay+Lj5cbOS985pbp
	X04tX3l1cmANjrnMnhiOTSZzG/ByU28AYqqDVoIGp02qWt8T0LxUJbDVJvnVU+AP6MJRrzu3B75Ze
	PKf9o5oo/4Hq8QtC6w817EqnJLbl6rKB8axr0mzofKluZ7AVxb83tagsORHVFpDDGzQmobjSl/cDH
	LNjsqFlN6Jl84A7mfUaOtA9HtIX9ltVslCOJkwbU0AeFtxepDOO+p02sykqUWLFJWDQBBRoWGhqE4
	jAOvcUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAX-00000003xcm-2CF7;
	Mon, 29 Dec 2025 18:40:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAQ-00000003xXT-27i9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso75498585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033628; x=1767638428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=hFLTuZsrdmBcaqvqBRx8xEtx1GA/Q/E/7/HbkLS1oQUER2BZ6K8UproBnVl/Vhrioq
         n91HJJnl1DruUqQEcK57gymR1BSHyscNtgdIimWxqVGsCc/af88OcTa8MZnmFdu5PRIQ
         4FZIjeV4qPlp+9Y+SGOuVP34OJy8I+HZo5XiM2TOXpzgD8UCeTQzbs/kiPRWq5txIZVM
         VGbKUfS1bN3KLrBQ6/S3F3DikaxKg04ZcJcS9p9CFvHvJ23bLtK1MGMPGCRkXsgwoqb1
         Z+kKHrK2b5COn1mVv9Ij0A4lXF+nHojW6ygGjJ5i9BC4E/FQcihQUVNuUIP1668ENJCr
         eaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033628; x=1767638428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=VYZwEaRVXdCWdEUrXLqz16Sd/L81YZs/Lh67qfZGMel/VpXsZZVi9cSrB6wwkIGi8k
         L5BPWgzqAXDr/w2zoCKRF3QNVPnRLazcTlRp8SU+uKmNOdsfZPPLtK+Z9EycmETp6fD5
         Ajoa2paTJonOdcGPpIgYLi2Em3Bnsjk4mT/vJpQc4n/ldXUC/mZ3dK2BpnIc8/qk9IQS
         mCXWmPpspyKK9e6UDh/PWbbUn8KcvXLQoluKMFkoGBI1tRUxci47oLdf2xBf891YwB68
         sWVirem3VDblMemsIJbZcrEEohniQpxugS1jbyuNnIH0fXi8swB4EaEPNHnvfzrwDgxn
         1ucA==
X-Forwarded-Encrypted: i=1; AJvYcCUqjemLxLXvHkns1fr6Bty/rmWagNoTegnVThmkJ9DmIktKV5PppXetzPo0v7945XP37Rk+3P6faTU0jPV5kla+@lists.infradead.org
X-Gm-Message-State: AOJu0YyejekQ0noZJHooii3uWWjhxjmeEMACVPMX+jdEPRYqfybRka6E
	kH/S5CmmU4pRQyqgaK4zy5HQthaC6j1RSuJS76/oHJAR8cN6KfrrvS+FM+ikIzf2HEg=
X-Gm-Gg: AY/fxX4pFE9/H8sDdMqOfPZ5pg2RYIwnsWcvuQU361C627eGgcDp2t5ihH8Hn4ksph/
	1YLNbs+GdV4+s110MY42+g8aEJ4jwAcjgTx8k03oKffi/InSCvf0vuvLO6TIoxq9MK9Z7OOlEJH
	cVp67COL9IoSC9jIgFpHAo1Syh33jtAVVuDjbbFjYQSvfbV/Tu4XCLObw5lUndcslVnBsd0VJ3H
	VafwxKHKgQmANAsvIPogy5YjZdsj1QtahK5JvYrlaGQRHw7+ngl9dBr5RKV4JLekTTINhqSNW08
	vXuXypx54eHvslaaIev+HMtolW/OY7yU07jmIWTAk6SqaC6GT9SlPHB/ujRNKy+mG+tf4hqUNy6
	Q2CrkoItN/LEx2IgEYXJeJvaFbx5av6yj+sSSUef7Gp3fMKg0xrG5IYytBQd5CjMxCHqqZoIkY5
	TUCpBOo7leAOJJQ0ODMPVH4f1lfLEe1LBaHmdUvumoXaEPEi0qqS0ghT4i28aA9PJcaB1zNsxgQ
	q/gbEfWk/AesfJK/ZhOTvnsIlnN
X-Google-Smtp-Source: AGHT+IFilbmrX7qgCmCad3pYK4YkE2820iFvJcnWl298VhAC/QPnRoMoqJ3XAnKO9WPGPH+NwyaEYQ==
X-Received: by 2002:a05:600c:468b:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-47d195670b9mr338260535e9.14.1767033628587;
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
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
Subject: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Mon, 29 Dec 2025 19:37:49 +0100
Message-ID: <20251229184004.571837-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104030_554514_8B0292C4 
X-CRM114-Status: UNSURE (   8.45  )
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0


