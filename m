Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4A6CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oianJSkzTRF5G/SQIYeXjnYqhxQJXKeLJMnXmoruyyw=; b=BrjFQlcjkun2eEawZ0Dh9YX/4W
	ZATKtO2BDV4lhCP3X11n2cEU6yN/1yYYBlZ5uAfXo4sfi2cPtPBseTa47uUVJkVd+/tybLjwPUEdG
	dR3q27IRBbaTFp3FZFrAHzsCQ/CytUvrpKYTYvOmvh5MW85S1da7DUtFpBKCqjwCf5T8Vg+QjJg3A
	daCdn1zxnIisHUCHiW7gCZOiFr0hMZdTTEIBtxH4mGIpcKTkr8Iaqr37wxVUsGXORj6oK/5ImpFwy
	Nl+wIwoQdjeq3Kgz8/7F9jNp2ydfZ7NlSpVROYJbOpz1zn7wBhDeDqmtXfDOxoD6YlJbnpyKtoRnR
	05vjpZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fD-00000001veV-1VDv;
	Wed, 15 Oct 2025 14:39:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92f5-00000001vY0-3rbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:32 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so4335297a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539171; x=1761143971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oianJSkzTRF5G/SQIYeXjnYqhxQJXKeLJMnXmoruyyw=;
        b=TSlArEqsXmuvThO32CRU6ggYfI0bOYKjJTGJVIO2AvHG9aF0faITcAMyr38J9W1i30
         cULTbG4O9kMq9v/XJ6nM0BD7HPrHvxspGAj7xJLRSdq0lninm6w0pZip+NlVFrUsAIgI
         orBo7XGN8qjfeqVmxmyoZr6EndEEL++nVYuJQzdba8sBY6n+aIogUrQ4+PZs6pzosN0G
         S8StINjJoFWegFbXppdvYt2IOGQ3Drc2J/fX7PvTqE5njvimVZRODpyy2DDvENzGHLTn
         Rb5CRHsxmlLvK53Ty1hKW1wEM46zUyiJcVql238TbRohiIebmyWBt5DOjDaCKgpofGIO
         NSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539171; x=1761143971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oianJSkzTRF5G/SQIYeXjnYqhxQJXKeLJMnXmoruyyw=;
        b=BxH0+xarZsTkL3OmX/E7/u5IkubaeAmZ7smUTvLKDXE+CMB2rVsTOybTHUDqxHM1F1
         XwS0lvnXZC2LwbLzdREMNfYr9m1XUsOrvCj1AUuP0gI8PnSWfPzTUPoVHPMhD3vlzPFX
         nE6lbtlPgQgbD6sUckled+G8UBtwxShpLbJPLjjFS+VjBuG7tCZdzJIpkbBEn8tZwPMS
         +9UeinybqaxvLNZHH8Q8xBjFi4yHy7QemX8J0KbkdmVOT8KlxSL6lKw7NLJPy8czYKrb
         JKPKGsQRNVQWgnbBzIzRj/VV1OZlSTpzlwYQB9GHVzYQZZmuABbe6xOYc1aJqlz6iGyu
         wn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeYmfrU4vBpTLt8QIUNIEfscnB4O4B862gi/UnMzPo8/vpyYMmfwaFZSP6pB8IHGAj7cuQmUeAognx05Qz/X1F@lists.infradead.org
X-Gm-Message-State: AOJu0YyEV1jRb5+e3FYYcoaUBhWSj8ZXPoX0eRyXuv2B7QR5xTsRKzFs
	sp95g9Z9S+oDcyg/X88bDuRwlXm9u9XgmzxraFRGec+ckvnfzxHhTseI
X-Gm-Gg: ASbGncve1dsz5DRfwj8C1DETO3ZQVQM/+YVRjvbWnwL5uicb57EML1BaqIqFEDfj5z6
	IFVKByrio1raQ1bY1nsxNToSigmhL0AQY3RqAXZ9pHokagVLXI0bzo8AUzfW3bM6N2TIlpvml/R
	sFWn/3YPWiEvVJ8ZD2BCOi6IjHR6l7Lo1YwtWMNTtTsRDy0Ycpka/d00iySBZ3j3I+jnoL8URrM
	XdkYYHVdV1SiP3Ksa1qDJ3OFC3NwfNYbAqCrSTo0QKfuGUDGp/TxRky2Nrcr5EwQKK9miYO4ffw
	2H9P+1wWMazbDHRkIGGUbRks6jdfaQwLSL4JzBezJUEPLrMm6alPquTwAxvLcvqNPIgnB+pPhVf
	JtFwGKph5vcabFii5ROANxVjaywAyQIdE5Ilus8Hla3GQPhJwlx2fG9jndg5pGYm0WJ2l3zqK9/
	78p4F2Fa2J4FIzWGcx/PNha528ZvtD//JtoKTV6miENra0Z8EW9iB2q+H3FppyIh9F
X-Google-Smtp-Source: AGHT+IHQV5VLlGEJEx4nThpYETPXzWBCwzYZ1PXelEFJYlRZ0x4BxIFfLFgQXf99ujEGLB1D9HXqKQ==
X-Received: by 2002:a17:903:9cb:b0:266:702a:616b with SMTP id d9443c01a7336-290273799bdmr348708855ad.18.1760539171032;
        Wed, 15 Oct 2025 07:39:31 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:30 -0700 (PDT)
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
Subject: [PATCH v4 3/7] ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
Date: Wed, 15 Oct 2025 22:38:59 +0800
Message-ID: <20251015143916.1850450-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073931_960575_E3A70E53 
X-CRM114-Status: GOOD (  10.02  )
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

Add the mctp-controller property and MCTP node to enable frontend NIC
management via PLDM over MCTP.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 89b18afe2b00..b190ab344aa7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1279,8 +1279,15 @@ temperature-sensor@49 {
 };
 
 &i2c11 {
+	multi-master;
+	mctp-controller;
 	status = "okay";
 
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	// OCP NIC TEMP
 	temperature-sensor@1f {
 		compatible = "ti,tmp421";
-- 
2.49.0


