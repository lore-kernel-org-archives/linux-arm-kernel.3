Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DFE67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=; b=odYDq9jeTZHLgc7qbSB2QjztPK
	z1zBh9Ku/vFuxys1qA8MXa27jnZJFj1bsEkil35/MxZIxsAjB8GFykeDFGOegfzOesctKVq5oClpj
	M5sdw4O6vmDPJAOVg01XTO+U8FEbZYEuRcfCd3Bol67RxDOthCuMn8n/VKv5bGV1TR72IEnP0Hx0s
	uMXuCSi5Z1yr8M9wTpaHefN99i+Es5wCpOrC8wDDdkDGrDxaTOJf282piXt7f/Noqp7J3PnUH7h8L
	QRQRb1damES4BrxdiLWUmy2dkiZqoR034JIL/KLqUZ5PesLEDzXt4mzSu/t19uBOLikMnr1hMA3G8
	dy1clc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXacL-0000000DMbl-0tVl;
	Mon, 22 Dec 2025 07:46:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXacH-0000000DMbH-2yTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 07:46:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f102b013fso45714145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 23:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766389565; x=1766994365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=;
        b=ceOX9FIlFfr01wiYrz8XUEiSz5JKnPtB7S5aHOjWoyTEe3mfbAcnlFfHDrjl3r2/Kc
         Fo/XQT49sl10bYwfFmQMJOVOEiCPUl9FWKp6TOygZ3is/Ubud8JYkT9LeElV8cHrstpz
         AjD0o9+E01wycJ9fE3v4dA7UwuzxXrWlK8IR1NR7S8VZxsIoAa7wjzS44c2C4UDmB0wg
         R0MJT7wAsyq4eus+40CRd5rR3L5VRdAvIHQrZtIASGDIRqew+kBfvbe23bFEz00lFgZz
         ZVeMmZbRH8gGc6biZVOSzH1/z1wvq3y8xggE1PclGCkUYOmnS3P6sF71cRomVUjIbT9z
         kauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389565; x=1766994365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=;
        b=WLmk2T0lBuD3YrJd/Nc5vMSxMkEqbSnQ3IZ3xcNRTPwsxdbm/I8o7NPg5wBxhf3B22
         a06dhmgxImcVVma8mU9KAJ7nnKQOXk7/rXm/kQJvmOpXQasez70m8ERxyCHcip0tewUe
         wF7b9WCC/HO17KKNLiTv/nDkuXAIMhyE3YWh/HblxwSvGqh5YbPeYDxQgwSOIBY7ftIu
         nUEkLW4RIhBDIEP1h7DgRCBjTtxfu1rWbIwzMvr+2ZdrE0G/kjZ8+4adZr8O2EW0kwCF
         yb4qvyNzOuu59tmQocCpZKTupCr4HmP1Lf7yu5710QZQbqQrup00L7lphrYyz1RhJZDt
         xnPg==
X-Forwarded-Encrypted: i=1; AJvYcCU7xLevN3tOBilz9wvIiaqx7yVA3TX0LbTfOqVFmtFtI1djSTqAJMNpiegckvSx+xN8P6u7pVjByJCnpz56Fxxe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3is6ExSq04yxC4VNeEbBUvO0tbMYAizbd08xQ/qrXuA4+s7LU
	AiXqhu7v+Lm/HuHExAfUOr7IN0Cz1akJWH1NVG9dmMalIlAgeZ+fXXnK
X-Gm-Gg: AY/fxX7PRae2EHjNQ+ISzLOMGt5p7Tu+dnI8hfFOIPl/pC1vOiFqlploqKDDk9Z1mlu
	gU+Of6nZrvd7KU+XloAVeN7d1Z6Dzds25aWjcn1Vo7hFAowkOfaAejLgw3jf2kPBiNmSia0Uh/c
	+O3SR/hyh6W6p41WrBRJrdKnyRj7Oq/oOMGRnN+uMtzFOXC02icSytTYy+1xCFlAyNqyK9KzAp5
	NQ+gGyTdo48Qoc7iVwnyNkP7CfvC+psggIuMohtG61B9T6GFGXqV9w8hI54O+oYpWgpDBbrYhol
	ABiv7/gRvaBhWgHJ68Vv84/UxX8xIyAhMtKvZcvKAkPzJNbJ/Qb9awqKPX0+MCYNByYrd/+RKB7
	/aD5vmsIBuKl8+EyYzwL6/Km1n+G0SALwYn5BVxf9aYFe46ZRPLcGjc5Dj26tapJs4UZ3hozGAN
	LQOJXr5nfGRJVWPzlYnBS/Mwz+gPJCWq6oRM3sbbCrSrAKzmlUgL5xkwy5OfICEH3FlBtqU+fD9
	u6RtFxZZxJf/wbE
X-Google-Smtp-Source: AGHT+IGhqnlFI6apowaKrJQSUtx5Uo4lIBRTl0LtnZmF1bt+yilUxHMwYLSA8kTDgE5JJmMxhl6Q8Q==
X-Received: by 2002:a17:903:32c3:b0:298:616a:ba93 with SMTP id d9443c01a7336-2a2f220cc86mr83489825ad.9.1766389564695;
        Sun, 21 Dec 2025 23:46:04 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e3a0-2ead-fb96-4f50-681a-bce4.emome-ip6.hinet.net. [2001:b400:e3a0:2ead:fb96:4f50:681a:bce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm89605105ad.59.2025.12.21.23.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 23:46:04 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 22 Dec 2025 15:45:43 +0800
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-ventura2_initial_dts-v1-1-1f06166c78a3@gmail.com>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
In-Reply-To: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=6cfmAXzuvyWCriW+9K5ER4DTlYWIvpG7m38YclJ5GzI=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpSPc25eqwxQH4wWyUJKBjJILcziSHssSo8q/H+
 3afSzty0vuJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaUj3NgAKCRClg0K3CVbE
 gUTcB/9THA8dYDR325r29fI/xAe4YjAOYulMOMSzWKqhT8wmQoP3GO2VZ1yoyPxLUg4w3f5YSpW
 9T4pKSUq7CoInDyDV23/BZ6z/27l/O358C4Q4Vnz4xIOTOqhXETyLAxAViA9OKDC26T39y3fYKL
 XI827vGlVlVwZkVWypMOQSUpx2HTUAgTKpt7cwcAHHs/oYaIgc543Qn7dX/UvOFVzcB/nTDQADw
 PLdVHv8ySkrc6x5IlC+romxV+9DWyclGtiSz6SxZR9+JnAK/gLzP+1O2PGqCzVqk06GViCnrhhj
 7PTd9vbIeyyur7sw2e0MlNrA5nIHc6rHQUzY9ttNMKLlNIhK
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_234605_867975_AD24A7FA 
X-CRM114-Status: UNSURE (   9.00  )
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

Document the new compatibles used on Facebook ventura2.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..24e19b8d108a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


