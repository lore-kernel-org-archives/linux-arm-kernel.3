Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AF5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcPYXlqUwGtYWC7gObxdrCELcx0WWyaHPv/mohqNC1Y=; b=Rg4S5eRwumLVg9BBAlTxTaGz98
	2qDVwf8+/amD4hy/r8wPI/Xsp9+81s2DeAUWayF2+5xAv54u0R08bwOra4AhT79m5kJsgm8ZKI9a9
	0NvBpMVWKFRSDuM66vnwHt5btNCWdhCnqyIyZgG0kcssMMme8USyA6RzDv5w1d+TfaZ8kn667hDr6
	E6U016aPTCMfXNeQEmj2fH5WRf5F3fMLT2rXI5ajlMXjs1ouj10zfNP0UXOdOJqaScakaEhiVjNti
	f/JFnPomaakP5wtuMq8yJpAIR0N/nBLyjmVwC3+0BK79tMaKStyh2tq0stPhXCsJdp3B0uCT955An
	HF1EaPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNLd-0000000H0az-0DMR;
	Fri, 06 Jun 2025 03:02:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNEY-0000000GzyB-23gR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 02:55:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234b440afa7so17250585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749178505; x=1749783305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcPYXlqUwGtYWC7gObxdrCELcx0WWyaHPv/mohqNC1Y=;
        b=EEybwM8nROhPAXrfu5/gveT/IQ3weI/pQouUA++uYJc7vRAk5b/zWhjay/jYvtxPFS
         kawxV35zeN6y9+KSnYElIVfdMvy4w8EEtTMyFyW0arML0PI2mHtagjqLOzMyi4IW3puz
         Jv+/tT4kzoe8pZwUoycadsY9P2Xc2uQSu349hhMZr20JayN6p7Sdeg5VbbuD990+MT6n
         9vuJ6vTX47ahSBBQ2T5U8MT9TGSkiGEJEeAi0b00yqvRsfhS4iEhealnb13fmLjVpfoB
         hcDtXU0ZGp3mGV2zE69mb4GQ2CFCLKq+A9fEOJ4QOKLJAGcsCOz/fBMdUSTblJvNoXT6
         AeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749178505; x=1749783305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcPYXlqUwGtYWC7gObxdrCELcx0WWyaHPv/mohqNC1Y=;
        b=BGK1eLDGXld8BBrQEySwJj2Fi+GoIZBxTcUqn/TbzWYIlzjPld0CZ/ZXBfBAetoja3
         wBRHOjGMwwSUWqfLJtATHNHbGORYOh640OrV8Z1U/+eQvIFgZVkg4uMs/vW8cPCvbPjB
         rvKTlz0wfDg0ebtGSkK0ibNn/1OX9gAc7fNKseYl3W48or9U9wPhHKwHh3tO6Iv9oFnt
         FkmHaf/Fdvjxq2a+lOTT+wUf92ykKim+n71dhmntJRDpw33M8XUQUeoUyOx5DmethuxV
         A8cQJLnYF/KN52PTTdwG1vVK+2bEdDpA6elU8l9v/LoDkW6ykqNcTrhTZaKJOaZaratm
         FLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxajHyJyubaUUg2zL9d0Z00L5Q3QtPLKMoNM4mAuINnbXRfUqq+WOL+CvugoF/5kbvz1sPKVtcKIjJPXSjX0+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzAULva88pdQa/LV7nqhoD4YYRkcId8UkWh9xFi1DQVJXUK1lIg
	pkAcepWgdU2aWFMudveXYHvReKxfqwjnppYZ9cJs+HhiXrBQHt6bXM9oZ4t44C9z
X-Gm-Gg: ASbGnctlmA2pNI8tlrAqPXX4CKT8HBmbh0YVO7mdKbQIpinqH06gMh4GV4UpysWdFHQ
	6KqPDU44preI1a+zoG6w6lJ9DpKRRTL0LbwLFOvrbZI9QPKWrz3xQic3GDY5NTZlgHi4xrRenCh
	JOPJE8orxpmmGj1oEW/7oVc0tvdphRzVbtUwQMuJqvfEHMISv8MbrrrhjCrSna/oOMDmrRIgBjg
	FNkXpQvAWqgimLVWgTCg26I/3CLf5/dFRZgaAyCTlVgwi1rmsgVORtecFNvJ8aVDkZaTgBKjiqv
	lyKssMYgqpIPUP0rq0mFMsdFp9pgU3PGR9P/CAUb8td4aYn+thyhn6gxG6qO/BxO9Aym4/6361J
	ZgeaJ/oq1DOh2nskDgwK0Q7F/k6AbKD6/gp9zDfQ2RKrOiimYV8HDiO/DOSQiQBuTaErtgYDYdw
	M=
X-Google-Smtp-Source: AGHT+IE6tkKM5tzQQa92Y/8CBU+6+g1CrxllNqlHv1TLlVy7w57uqLtmBftjT1nfnG3gOSb2IzldOw==
X-Received: by 2002:a17:902:fc86:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-23601d18723mr24725515ad.27.1749178505588;
        Thu, 05 Jun 2025 19:55:05 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm2942185ad.39.2025.06.05.19.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:55:05 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v7 1/2] ARM: dts: aspeed: ventura: add Meta Ventura BMC
Date: Fri,  6 Jun 2025 10:52:50 +0800
Message-Id: <20250606025251.887953-2-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606025251.887953-1-jasonhell19@gmail.com>
References: <20250606025251.887953-1-jasonhell19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_195506_533370_71B1B7CD 
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

Add Linux device tree related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.Add subject prefix for the patch.

Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a86b411df9a5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
--
2.34.1


