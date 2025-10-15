Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB2FCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThMWJU9Zn2zc8Ri8nC2rLeAQ6V0FQ+wbPN7aWmFwPkY=; b=CZAUJ9pGNdVy11O+NhIMCBJNc7
	JjkWzaGMMlXvz6PslBl+TWhdBbuGDbWT9y6MehkU3Ym4TLgkaBsBA31/R6Y0oOGIbXJz2g/27uOEY
	ZxVuEB4o9uuaVZ7IRbsx+zsCAcI1p+t2dKHi/k+zsVWv/w4SQ2x1fzCtHbMdGrM7HIxjFNKPPebY3
	3C6ng8bKm6rvIVWM3k5nu5WAu1EJ4u1aFpkBffEAjlumWMmuBhFW1U+KowiZqD+ue6+UWZZpzImUT
	EL1t8KJ7hNEoyT10JA2V2luc4BL0VYF6tP+ALcxpof/q+WxMUKhltVysf0nx7mdSfbDMYMznM5ipI
	RJtLOtnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fK-00000001vkw-0Ieb;
	Wed, 15 Oct 2025 14:39:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fC-00000001ve4-48uz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-271d1305ad7so104526655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539178; x=1761143978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThMWJU9Zn2zc8Ri8nC2rLeAQ6V0FQ+wbPN7aWmFwPkY=;
        b=WbvK0pYTynp94o5dogRD9Lq/RG/lqtVWU7gU5qZ7D8cc6S8Adnc24v8TAEiA+N+WSX
         jZ62yfoukzuovOZMX7PA5aokVqw2WQEApFmdlE4GPm2Jum78ql6rR/nDNE6+kDygWvjF
         krd2hHticLiuI0aqdXEKyWohJz7d3/Q23lpIpT2QP7iL1Isw/NZRauP6J4SFkXJ664Wl
         dd5EFjenc+TJt+HluXqDSoEoxIgRH3oH2IQktbCKm5sYZSRd3L9/fbwoRPQsMOVJHZsM
         mvVxMQKakXcYSrRGbZuxAh6VrpfLyB4F1xpH64G5jPvdoV8Txz3iAD5+7JYVaps7ASn2
         TEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539178; x=1761143978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThMWJU9Zn2zc8Ri8nC2rLeAQ6V0FQ+wbPN7aWmFwPkY=;
        b=BnN9Rb2JfXP5JatbpTZ9Q9dywFqI/ppKni9z9uqR1AekEn56ojNOcSknuNnd+JbxQr
         wtkEu/Q4vykHXh6fDAVe7L7Rvut5Sd9ZsqxNR3tMpEin6VPhC91rHRDFYjmJjcSrg1U3
         27tUyf4unXanWj/c8EGIAX98RTnL7cm3KVYqSlKI6oGslgjNFcOWUZsB9tOllZP22A/n
         On4lVf6ubeRztko2f33+x1ibiWIRHqG9fHsL+RaNYW3f4i1FlmV7jypXBRTKJJ8HCTNp
         AvJu5Or42Z8ENlzqusvxfVHb9g2lwxaojPPgsd5hmnLVlQ1hS8K5Co0PE2pjI+zOOH8x
         Gfbg==
X-Forwarded-Encrypted: i=1; AJvYcCW9nWE8K+jIAjco22HFc5l/uxZtZllLnYkmL4P8assguibruVwnQki5LXvMZbDvojTzAmzi9fquNd/LLUdYsUfv@lists.infradead.org
X-Gm-Message-State: AOJu0YzDxOJOhBBAmuOZvaQfQBAx2FwGPd7wDwMVWkmUmDOZsDQji6e0
	ph1f6IdfxPHXJgAWVmGDgrs9qYU4vRoHXF+ByBZM2cyGcBWcn/ljt+6p
X-Gm-Gg: ASbGncuoO1IvvyhXKu0btfOoqiDw63c6uEW57/sItpNQTPvMOHfswELXMWyPmKMeFjG
	jEnbGNSMwoYeoDj9s1RzGAHkYtkJHvSMK1hMw1MbHepAaWYGPcGpqI38W0ePLHilgQafihxh5kZ
	EEuo6ySFMEAJCG7oE4A86yBZU5RqiMN/G+Q0HZL+gF419p3e+8GACisxnnvKj03hLjcxw9VhvEp
	bjQeIgnxJ8w2mF2dx+xthetUrgyoOykNwGqGKrVpsJ7XpvkHicKEV8YpCv6ZO5KZ1a7AKoGAnfy
	KLI+EmXPa3ZWtnLnjQkgab+ScVTN7vMYoNV+CHe/i6RuDl2FCNev4tP4NoRR/yLpHOa3IEtlqfR
	WgktbaziHqbMowMxnisI/M0IVvHj4SxBj194eaXVG3nEJGUqy/cN3QpJ5Jul14+PES6FKMSns93
	SIDftvHqFLjhtV9jjylKiXU+/gTtUNu+97OkBaXuT1
X-Google-Smtp-Source: AGHT+IHXFYBxv1duy+NgjILQXBh6DIAOFdCHnmkFRStqTE9SSRyR15DtFXzEoOln24REjJhH1gcaGg==
X-Received: by 2002:a17:902:ecc9:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-290273fff0dmr361423205ad.51.1760539178118;
        Wed, 15 Oct 2025 07:39:38 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:37 -0700 (PDT)
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
Subject: [PATCH v4 5/7] ARM: dts: aspeed: santabarbara: Add gpio line name
Date: Wed, 15 Oct 2025 22:39:01 +0800
Message-ID: <20251015143916.1850450-6-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073939_030229_D90B5BFF 
X-CRM114-Status: GOOD (  10.14  )
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

Add GPIO line name for userspace control or monitoring
- Add leak-related line names to report chassis leak event
- Add debug-card-mux to control debug card access
- Add FM_MAIN_PWREN_RMC_EN_ISO_R to receive RMC power control signal

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts       | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index c0334abf9cda..3f36c8e03f48 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -208,7 +208,7 @@ &gpio0 {
 			"led-postcode-2","led-postcode-3",
 			"led-postcode-4","led-postcode-5",
 			"led-postcode-6","led-postcode-7",
-	/*O0-O7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","debug-card-mux",
 	/*P0-P7*/	"power-button","","reset-button","",
 			"led-power","","","",
 	/*Q0-Q7*/	"","","","","","","","",
@@ -1744,7 +1744,9 @@ &sgpiom0 {
 	"FM_IOEXP_U541_INT_N","",
 	/*H4-H7 line 120-127*/
 	"FM_IOEXP_PDB2_U1003_INT_N","",
-	"","","","","","",
+	"","",
+	"","",
+	"FM_MAIN_PWREN_RMC_EN_ISO_R","",
 	/*I0-I3 line 128-135*/
 	"","","","",
 	"PDB_IRQ_PMBUS_ALERT_ISO_R_N","",
@@ -1804,11 +1806,17 @@ &sgpiom0 {
 	"PRSNT_LEAK_CABLE_1_R_N","",
 	"PRSNT_LEAK_CABLE_2_R_N","",
 	"PRSNT_HDT_N","",
-	"","",
+	"LEAK_SWB_COLDPLATE","",
 	/*P0-P3 line 240-247*/
-	"","","","","","","","",
+	"LEAK_R3_COLDPLATE","",
+	"LEAK_R2_COLDPLATE","",
+	"LEAK_R1_COLDPLATE","",
+	"LEAK_R0_COLDPLATE","",
 	/*P4-P7 line 248-255*/
-	"","","","","","","","";
+	"LEAK_MB_COLDPLATE","",
+	"LEAK_PDB1_RIGHT_MANIFOLD","",
+	"LEAK_PDB1_LEFT_MANIFOLD","",
+	"LEAK_MB_MANIFOLD","";
 	status = "okay";
 };
 
-- 
2.49.0


