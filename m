Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33BDD3398E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW6kvc4ZbQp7jOxwPlUXi8bHuXjPpwn11nTKKI/C1qY=; b=lRPwxxgThwiK5/PsW/dyXFwij6
	UBVAAjrgaVP0g1+fAaIfUmrRrro6hbImvdq7OQLagqW/c94EWDVoL3tOmbwO+tgSaUvj3jlVn5phH
	JdPZ+FUZhC+vtiSSLAlg4Ws0iM5rixrKGPWUkC0kuO4nKJU3ukWPiwtDjVttoIoENxRVOsyvkEKo/
	v3bR1du4JppyjGa63USnKk1VORd4S/aDRKg1JErxv0EqD4/bMJvKqGtHUvLVIUSIBZGaPNiy3k/PC
	S8ONhfwUBDdq4Z3NNNYv9ouBKkG0Q6jg33G3fQji59l4SMm07i4qKhuLRv7BoMIhjyNospRcO3I4q
	x5flff7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qrk-0000000B96u-1YmW;
	Mon, 28 Oct 2024 14:37:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QOx-0000000B2jv-18TX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a86e9db75b9so651918866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124441; x=1730729241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW6kvc4ZbQp7jOxwPlUXi8bHuXjPpwn11nTKKI/C1qY=;
        b=FqHk9jssjLLnNRrFVAH2g0vReXaI4UABVsLFaJ5RnSJH1+0K27Bg1+tC2V7algar8C
         dVzq0DNz+8kpIb4vXRpzJVF3RsRZY0xrRso6aTokAl6KBjATqb2EGEApmRQDyC40bcyN
         7QaFT4peYivU5LXQ6qzC2130Sl0lbLCP2Tzp5I03/o2i6uhF1rSwDAUYPExjhxuubBGT
         NUgrNrU6hBgClXJjUmtYKLNn/5CT1hp6SyehHroOPflf+EgtQgBYfD6/GfUnG02CyyBH
         h+uvM7aF42uByMJy8lenr3drtkopUwo/32ZFmYgwzb2XvtwSkvj07l7TBqtktNVDkBMY
         B/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124441; x=1730729241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW6kvc4ZbQp7jOxwPlUXi8bHuXjPpwn11nTKKI/C1qY=;
        b=Xctcml2jkGY6eSDOv+hY5zp084r2nKMKwmZyzdVnQE8/8MVKhIGoOA2LQfm5v6BeT8
         sz5d9pQs+bTvCLtCYy51KH1V+8fcyVDMnTXXUR/ERzM4h/mUmQQt0jp9/JxiVGEH6gT5
         zF3ubU2QzQtRudc1ojAMZHZN5oggtMR5yI8hg416FFwL+rlrXcZo+WlsBxKAhzDmL7X8
         rzlENFg6WjL6z+6FQsRFSWCtDIUcKJ53nTas75NofJ69jZ9X/rng2sOdQjXyzqY/96nn
         9lkd0+1RWlPWroDOFwwrDOtV6v7+lerNxbj4I92/LDp2iDQ7Z6ZN+sx3EgLIB8m2FkKt
         4wbA==
X-Forwarded-Encrypted: i=1; AJvYcCWK093nr3tflKBzq/g6o9n9VsaROSKdWYBgdp0mfqasSUMks7nH3vpISCbQZ2uGFRDPk3eBxWGsvhyf+OcPSJX1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1h8utn/ZKIlgWWMjx4NJsg1ghgjDd42kkgfZHrU3r+DU6bAfk
	QLAunj/Ef2AHaKCNKw7KxJmEFlFen4sb17/W8b44LgLxajL9hWHePjbBisFci+k=
X-Google-Smtp-Source: AGHT+IE5csQvNeeQQV2TiEg3S3V6yZpGcfTplYGENkEB1u6HmkJa4la0HF/+Zf2tdkb6gQWZYObepQ==
X-Received: by 2002:a17:907:9452:b0:a99:fbfc:5ff3 with SMTP id a640c23a62f3a-a9de5ce1611mr802908466b.18.1730124441130;
        Mon, 28 Oct 2024 07:07:21 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2982ecsm376935166b.106.2024.10.28.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 06/12] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Mon, 28 Oct 2024 15:07:23 +0100
Message-ID: <3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070723_456929_90F00C2F 
X-CRM114-Status: GOOD (  15.06  )
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

A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
translations. In this specific case, the current behaviour is to zero out
the entire specifier so that the translation could be carried on as an
offset from zero.  This includes address specifier that has flags (e.g.
PCI ranges).
Once the flags portion has been zeroed, the translation chain is broken
since the mapping functions will check the upcoming address specifier
against mismatching flags, always failing the 1:1 mapping and its entire
purpose of always succeeding.
Set to zero only the address portion while passing the flags through.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/of/address.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 286f0c161e33..72b6accff21c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	}
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
-		memset(addr, 0, pna * 4);
+		/* copy the address while preserving the flags */
+		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
 		pr_debug("empty ranges; 1:1 translation\n");
 		goto finish;
 	}
-- 
2.35.3


