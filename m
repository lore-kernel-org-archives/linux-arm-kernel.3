Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C150C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=; b=McGb3nGQyCVXsVOMPOsxEFRfmy
	bIYHdgKY5nSO+fSBDVFdasDopZnumpQDVj30V7eAwbdC3/YZ6HeSBH28FHA/DvaFWroGCtKqWVkJX
	yMURpHoWUKicFcDH8LVJqUohUd8Yo+wF1iXqpx60snaULSKgdZpVhZws62/R/2O1VLSrWPsZRRziY
	G1EyMMVaMFmZN0Dby09m8mUsrgpCjy6R/+nVkPOiPtngv+gHWmXBwkb7GX0y8g0cgNmu6A42+6Jme
	3k0+46RJCX8pgO6IDkNbOmMN+P+qVC38iS6UewMwdlqLNS/z7llcN9+5oAIETvDPKIQEfHqTrMlW0
	mdpz8HrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggh2-0000000GOry-44ba;
	Tue, 29 Jul 2025 09:32:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggPL-0000000GMLI-2qiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:14:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-749068b9b63so3618910b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780443; x=1754385243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=;
        b=MCLlx5CyaZJm++UhAjsxhHBUCoddtOIlWsSKiXeg9EmNi+wAQDTGq/UDcZF9QP6Vxc
         tRPJEd4B2rt10BGUhcGRylFQmKIKkEiTqu9yZNd03NKkyxsmILqhw2fH12cGrl3OB2lj
         dl42Z4/s2Kl27jyo77AT1ackottPi6+IR3ZpBEFqlxqtyLeE7I0LUHSOJG80LC8cojFC
         1Oi068zkHedz2evi+AJOs371T9GLFLe9j2CvEg+A4xBKnmdFuTeygZAzZIYIGbJGsFlb
         hA1PCkGGzRFFo7BGUDufGwTos1VwVTEKBO+K7uiZr9Wogt61cTBvEZ6daWyqkmKplFro
         MQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780443; x=1754385243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=;
        b=CSfkmGwj9yXdwOA3AYu0Gw7/Cj9WB/d1ayWS9xoKpWJOjzK7zri1qh1I8njsGU1aBr
         0sjatW9DkBK+cZnZQ5nINs6bSQlr4fDVthwfMCW3wwt08nAjlANNcaP9/V3CFkUxBGQF
         AFcVzVYpmT32GpKfHzQblAAF2B5Ty75RhbmHRPzzzBns+1sqtDh8RP0GmOTiTMgRvW+O
         3Iuk9i7mMeOnI8e2z68VLE94+K1vm5O221LX851t8WfP7IYj9d1nYwCHYTiyJj5gzSm1
         Ws79Y1UWiiXtp9DTn6kBu9Noiv7fW0LIpV1W9Bjl2S6drkN1o1hR8cnqc1zgFED2TiQc
         GaPg==
X-Forwarded-Encrypted: i=1; AJvYcCVn2ZZV8QSM2KlyJTftAiMUN+vLfAwVafeafibuj52AsbXfY1mqt8ryWgoCRNe+y95VNtvWwEDaoJJaZpxsgPxu@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9WIURvSx7qzVtX34uiOqxFCCZ9jOrMMJzICNoV2k0xrTY2qj
	gpCjbdzcWx9dQKatCRT/ejg++qoK1D9WkBWReMNhIq/ddaz2KD7hHIq7dMxc2Q==
X-Gm-Gg: ASbGnctNRG9OyW2yKBE035J7ewqdAgTjNUZz6jKKnTyl2GwYcFR7HIdPvs4/lGcfpqB
	b/rkIdjGStivCZYZQ1NZlZ5Fn1SA9jS6kDOLGYRfmkW9gfWHeIeiBVB0gGdXr/Bgemlsvq7c1+i
	nOIoyd5AvxVVWQCPQNR8joAMIQ5PQsVO6bEFAHasr1Rfo4qfaPSR2cUcQ+DzErQYQfeEfUMVP5M
	5eI3qUhDkb2Q7bfNouke4lStwGOq3rShL4+beXJhqlz5R1dKkCAnjE4IsOdXLxLjN+v7MVwq3OF
	E5E2+wutqFPgSf8dov22KLPQ5HW5EkTGt1MACi5q0Yc30sd45bEK7j7A2Jwo2Goqq9HqPgpoxng
	CDJhKcCvCx39COhIc7+7p2X4ItxymOGOu9ttbopX+hboH71j4VATyfGlZcYlY2aFb4gi84O0F6J
	UE+YeDaNj4z5UgMvBa9CHl4c7ovYn4/HOMXO0yP6VG9OjXITY=
X-Google-Smtp-Source: AGHT+IE5de0i6/0ajEO85aIFRHzPN7aXOAjUa8N7MjCYc6cFnhkPCLV7DX4sN98WfDkKcoDvsFP22w==
X-Received: by 2002:a05:6a00:a85:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-7633276c2b6mr21066948b3a.7.1753780442892;
        Tue, 29 Jul 2025 02:14:02 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e38d-c586-0429-5c72-053d-8858.emome-ip6.hinet.net. [2001:b400:e38d:c586:429:5c72:53d:8858])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b06ddsm7528612b3a.121.2025.07.29.02.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:14:02 -0700 (PDT)
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
Subject: [PATCH v1 2/3] ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
Date: Tue, 29 Jul 2025 17:13:44 +0800
Message-ID: <20250729091351.3964939-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
References: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_021403_716441_BCB539D6 
X-CRM114-Status: GOOD (  10.55  )
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
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 2f5712e9ba9f..ed30f3bf61a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1248,8 +1248,16 @@ temperature-sensor@49 {
 };
 
 &i2c11 {
+	multi-master;
+	mctp-controller;
 	status = "okay";
 
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		label = "mb_nic0_mctp";
+	};
+
 	// OCP NIC TEMP
 	temperature-sensor@1f {
 		compatible = "ti,tmp421";
-- 
2.49.0


