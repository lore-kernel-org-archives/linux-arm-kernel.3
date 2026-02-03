Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91CE83071
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=; b=EsM+NAoX7AmSYKzAfiPl5ZwV5I
	QFg2HQm1fsPh1R4GVgq6yf9b6Aq9DYk7oZEed40Hl0juMfx56Tv1h9S6Vxcnz91CzU6053yynOgsy
	V4eWoMQoVd4fbIIzMQOZR5L/mqZc3xkFrEW7jrWiFAqOb4QF/LqGUOl9mdI088JCL5sE6tnpOb6sZ
	NwFDO5FYeAn/K4jenaYgTOPFMltXdmkiW6OZISgF52i7itoc2z5RleNzV6437+jiQFRk+yntaET5V
	H4NxxXwOI8DReAnHQFasC0suBL+A8iErgavcvmniSwLsnWGyioIkmJpqBfLw1K4ZfQCi9Kp4Kdm6z
	W6qPEwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3W-00000006Pek-0Q5b;
	Tue, 03 Feb 2026 09:50:46 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3T-00000006Pd7-3RL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:50:45 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c648bc907ebso3334127a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112243; x=1770717043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=;
        b=MSxYQWGs4VMxYKeQARxrOMg8Bc31xrtq3415bx/1GkZIqjdvqJG8KgbJIpMl05EwIN
         8ycXqh91/qTydMCPCI/R5lfCgFBAkeAQKxy8fBNbGy8kipmHQPyKFrwCY/720wyZlvrr
         qMey2qlh8kdcIFMZYJfWXVClrRvghXOaxIfnQDJd+jQziUNgH7B+unBp8S1WI1pd0Xwz
         FKD1VnlRbGOYEkBiFO7we8IilWSEBiKhwKUjqLlNoEYaZqUK0rrEL6JHeNYsAE1GXHHa
         cWU9sfBYzF37ud/C/WHhgn3+XnEQkQyf4yYabKv2hUm3X8o5uIaHFf+EV/wyK+MOXHGw
         bdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112243; x=1770717043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=;
        b=CinL9cwY2uDFU/icN1BMJOcLqt2pFGPieuuA42Evk9b5eE7eKWR8AFzSEldVN0gpG9
         Hah58CuGl+qxyQtQqEsy0MQYpU0hyvQ3kJyT1QrRX8JNHC6ZVMrjdFY5/zs6RkJzauBJ
         wgXzEiQou0Lx1w1TceHkfRr3WNg/oZIHJB+Lt+CEAg0bdqkF/YPYOGESbwMuTDscPRE5
         fFNzP2rmj+cICHf5tlqVlUu63dUCDC2b2V3UbEqw+cxRgU0BthVNrxbjNsk5DOEmtBLy
         xkhlnzCWClrR1pGJNicOwGbFviEzu5/cI1WuNsfqJzVMotqhS2K0W5tltpi48WdUCVSy
         LxBA==
X-Forwarded-Encrypted: i=1; AJvYcCUdSguXY+u4q+sEfLW+Df7AdhjGrf5WOM7sfAdxXNL2O7jMSjzpAFFvLlYLJ00xckF6P4x+PuW2TBn007xV0ekP@lists.infradead.org
X-Gm-Message-State: AOJu0YzgmUqQR8SKjaRJB9hGCeqebjMCdvHOj5QZ3j9iHLyj7gCRePuw
	L4D8hXtlpfMg2P6IKRRaJExWm/sT1ViZ6LeLqPYHuxWPVBbuUxtXAgZj
X-Gm-Gg: AZuq6aLQIAjv+r3+9nZPPBGy1MysOv7pILw/vpeqbmeOJ1JyIUW10rTCa6Wyk4T2U1e
	kM4wJiaVSC9L0mg1kJHM7/Y3qJHUiiYBlbSi3fkVAIbkIyiC99qXhSlT7ijNh1LDAUueZbrp8RS
	W4567TNabiWjPvq8zLVUJDor8P5LbKKytrnIU9gvN8/t1sDfJhJuPtrsfnLUM9KGLuqYDyr6BjF
	fBjYO2MeXGvmvFWiF8d+Ef8mX5yDJYw5hjCoIwshYo2TKGfI6S7RmdAeQc7FazIXzhquS5YlUy9
	q+1LJy24x4jTgaT0g6vH8aUZL+K8XNvfGOWpxU4x442DwgFsbwTbnXg7HINUFhXLBXlFnfdn8K1
	Bd700FjQU7loU4xTyXWH8XHRTn/nppqKbu/sMV07f3OLlhZtJe8Ksip1syCDq0t/sGeO5dns0Lw
	isxfrHXJWQxVPhGfsgrjk2VsRemRX8/+mj14pRUXJDQrefk6qzjozkdcJFwPGn3G0KtHkPFYlYO
	Q==
X-Received: by 2002:a05:6a21:7804:b0:393:8fc:5284 with SMTP id adf61e73a8af0-39308fc8453mr7414208637.70.1770112242816;
        Tue, 03 Feb 2026 01:50:42 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a336a1csm17535332a12.19.2026.02.03.01.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:50:42 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 03 Feb 2026 17:48:14 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-sanmiguel_init_dts-v2-1-6a5682c32b38@gmail.com>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
In-Reply-To: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770112237; l=841;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=awDe2howAZDyvltIFZvQ9S1Z3NdAcsc3EqMeuy1puZc=;
 b=6Btw6wU97hhwe3vFKaiSmnwtqfWoR5H5FeSRtHNAThM6D2qJ/ppeb7Nl+1bqScZU3xQ3yYFxs
 zv5FMUtvvQvDlQMXkVYE35LS2ReTJrYjkluEoxdLbqAdirSmUJXIhQc
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015043_884678_0EA768A8 
X-CRM114-Status: UNSURE (   9.12  )
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

Add Meta (Facebook) SanMiguel BMC board compatible.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1


