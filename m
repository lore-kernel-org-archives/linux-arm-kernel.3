Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0776CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpVFnQJK85Q9Z+39jpO0lJZZc1Nu8KNAXStfs8r/sJo=; b=YA7GLIK8a6obu7Ov7FvFHeWetQ
	uboRKhow6xlHY7LLQt1qQhxiCS9TeXPU9hMs3YOzr/oh064Xoh0LwqOvouLoXMT9TdQPFQwiOxGR6
	rG/LEDVOKPuwgnI3P2kFvpIt2lMiLq/tszrekaZpmvyO4VtRc4sSwkYTqrnCZDNuBZzNRnOUleQPe
	DA2XraTAFM5Ogd//ca1Jpe4SWdNAk0e01F5FI0KGvQiWcYKJUHBn6n1bqTVUHnSEY2iF62KOzNdPg
	k1IvhBricykqyTV9MARNVtBv2irZoLwt2vk1aqntiWOETFq49GiZK+FaEkVDD4LrZNTxdjl+AtAQq
	PvcURqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyq6d-0000000B63W-2Taw;
	Wed, 17 Sep 2025 11:13:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyq6b-0000000B62S-07iu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:13:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24c8ef94e5dso7304055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758107624; x=1758712424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpVFnQJK85Q9Z+39jpO0lJZZc1Nu8KNAXStfs8r/sJo=;
        b=MCuY1DcQiQAbIu1nMlERR5yMSvhBATeOvjQFVJKxUQ7XDw5uxtn2nWGDUBDnXhOoOe
         hC1B2hQx7AHdR76p2FQ+JXVk218kteioAMiG9TOzdxBEUrsZoiI4YSv9bq1DCOoCZbuw
         L7mS6qhTDACxYQqwK8IA3HpkB5vylYCGmTDEyomnv1ucXukwHS1QCX7hzbxgKkjRGv7v
         yDJ8u+15peGDRi1eU3ow7NuyGd/wc5TvC2wF7IaN/63yMMqijA6edVOlyz2RLQOy9W7n
         d6OB9PWU+mRVgB3fYxhUJCiLG8he0b/q4GSh+PdvSyfoXbq834xh82cgrj+3VijVqoXh
         6GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758107624; x=1758712424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpVFnQJK85Q9Z+39jpO0lJZZc1Nu8KNAXStfs8r/sJo=;
        b=kKmWDIbNVmeLS0SNe/kL911Ul7DiQSWo+xRoDbdcd6zyK7+thMfMCeLkrb1Dqcc0Pq
         JNwLEWNKIUgMkl7bMbwP2DRZCJ0oOgfmzGU+fo2aE1IukQL5eZ4k7gkYiCTUuznVWjPM
         BTwvzASrx+RmYsi9ki7ORMr8B8H9aPZ0KmGjVKPCKAI/Fc9dzmT8tJ4mtdgGEVMeDF9z
         3S7lXaYkSXH1ab37O6Llz9AEcXKemOoLqO4wydkhRxi3AUGiDQaOiZ04qnMk8CPUqToR
         uH3qEvj8+fUkedYfdl7tymxSFLTqAcbjsmLKPrJH5+AWBT7eXwSd7akbIdTpdu0n+bht
         Y2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Uky4wRCxC8sf3Lz2B+Wj1wpVhfXnOUys/Td004Z7cYqGIU8MDhHSFu9Ga/hgcCBfRvOd4sSZXMzZ/5K2CUh4@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgZDDqAOT0ZLRPyi7HCBQyTTaXewL+MX3rwJhWNEr//IIfOvU
	0amQaG1HHj8fuDrW6T7ckbDLM5tB/qfzGt1YEijJdpOxitUDc9NLKbukipOTjk4yN6I=
X-Gm-Gg: ASbGncsL0LtxF8W490vclAw3EymutWWTsVGvNorXsz7nsuVIeIq0p7u1fv1INdUkjXF
	igAh7O7scGGghAMaXUtg86sfqPukOifcOOmYJxwUiEvn8n3JKQW+Ii5dTP53fJnKCrNi9mbTh3M
	zW9gRPktrey3UJTMNI3bUJzm5GW/4Dmgb2byTAu+VkQzQf3dY+3gbsuMUfsoA2fYItOEwmiplBm
	kQpfNj7gtccJsXWWthq2b9NrPzQfXGhwQBRVsuvrgFutcVsUyAhq/hVvQ5xGEdSQtoMYL6G/ikw
	TlofGEb87O7jYsSEXpxpf2h59z+MzHtBxcYcnuHUCOwJVTTwZ2fG1NUb9PFEsUJw2LqRWoxmwfg
	leiCSw+Lhqpbo1ZFT6k01UwNOhAyHGfF3oCXjB0Nn13U/+62WeFAbUrVJ
X-Google-Smtp-Source: AGHT+IGBK3w7KSmxjJxg5GKNR+TLS8twm6DWLFyjs5+Ei7BBZUVpj/ST7ilq6me4VOBB/aZBOm/Vbg==
X-Received: by 2002:a17:902:cec2:b0:24c:db7c:bc34 with SMTP id d9443c01a7336-2681097477fmr22668825ad.13.1758107624269;
        Wed, 17 Sep 2025 04:13:44 -0700 (PDT)
Received: from fedora (cpezg-94-253-146-122-cbl.xnet.hr. [94.253.146.122])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-267b4ae8808sm59079655ad.132.2025.09.17.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 04:13:43 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/2] reset: sparx5: add LAN969x support
Date: Wed, 17 Sep 2025 13:12:36 +0200
Message-ID: <20250917111323.60781-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917111323.60781-1-robert.marko@sartura.hr>
References: <20250917111323.60781-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_041345_078472_18B3120D 
X-CRM114-Status: GOOD (  13.95  )
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

LAN969x uses the same reset configuration as LAN966x so lets add support
for it as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/reset/Kconfig                  | 2 +-
 drivers/reset/reset-microchip-sparx5.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 78b7078478d4..35cb84d1de4e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -170,7 +170,7 @@ config RESET_LPC18XX
 
 config RESET_MCHP_SPARX5
 	tristate "Microchip Sparx5 reset driver"
-	depends on ARCH_SPARX5 || SOC_LAN966 || MCHP_LAN966X_PCI || COMPILE_TEST
+	depends on ARCH_SPARX5 || ARCH_LAN969X ||SOC_LAN966 || MCHP_LAN966X_PCI || COMPILE_TEST
 	default y if SPARX5_SWITCH
 	select MFD_SYSCON
 	help
diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index 6d3e75b33260..28ad8f1298a0 100644
--- a/drivers/reset/reset-microchip-sparx5.c
+++ b/drivers/reset/reset-microchip-sparx5.c
@@ -198,6 +198,9 @@ static const struct of_device_id mchp_sparx5_reset_of_match[] = {
 	}, {
 		.compatible = "microchip,lan966x-switch-reset",
 		.data = &reset_props_lan966x,
+	}, {
+		.compatible = "microchip,lan969x-switch-reset",
+		.data = &reset_props_lan966x,
 	},
 	{ }
 };
-- 
2.51.0


