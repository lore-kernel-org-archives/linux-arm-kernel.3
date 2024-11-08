Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34376D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJXmxMV9Abc1uTINb2xUxHegsV2x5Sbl3192+49JM4w=; b=r1pzW5xWnmYzO02PF/Zm97wHM7
	fPi3JIeuuRf1SELk7a2XjLRVhtzwCo4rgDIlLo63i1FqHlDlWSb6nN3Exn2sN3ObXrD1AuKrukPIn
	0B+QJbO4MiP1nOkdOeNuMg70EzeRO7T77TkfY9XVKgi4mkANUbQbDQfhSd3MUGvMtaVFJo4TGNBW1
	dQB6O6dmjSA97BdSWt/uNBfnwe+RZ977b0ZQjxuvfz+9JBmkNG2zZxIUhnkhJLzwKsbOFaYwWhAZi
	qMptGRJsaR0ZrzEplKRpDwC8uEmilhr0Q4kLQqKnfJPqR2txA4m9m5D8JBQYXvyI9jfaCPFZrk+nl
	XqOSbIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NAu-0000000ALZ1-12e3;
	Fri, 08 Nov 2024 11:29:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MOL-0000000A9Or-0vQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:39:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so271437866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 02:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731062339; x=1731667139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJXmxMV9Abc1uTINb2xUxHegsV2x5Sbl3192+49JM4w=;
        b=AKW3sP9kDCY91XEKmiaHCGoo2jzM5W+i+FwIkX/tCD8OTS8rn5bIgbkshCCaKSpRBo
         uIMHOrXtCUV5z+KsPxu2ELn+iTuorenQ7XcZZ5ntlNeiuzu+ZpcTXrGIzCMV7w/hnNcZ
         8kqmdsB5NlUjC3wG9UeMJRIV91SmAGwFGngUNZ6R5rVuhMTV1Fg0EEot9GHEiZ1Nadnu
         7TgY6AazGjGTzzyA3mSy2ekD9ITu8wegnSJdq1dU+JCiRfAvgHP86ig3vBoLD9hQCXlY
         C83QHALEpZ64E+xds16pdq/Bk2lYSwA/KSyH6ZPptFFK1pXL4J5pddBYkyIzvmi1BPny
         SXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062339; x=1731667139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJXmxMV9Abc1uTINb2xUxHegsV2x5Sbl3192+49JM4w=;
        b=dUOhyPsZYQ2R99HgctMK1sCbEMgBq/yRce7OGkbvt2qcTMoufltyIaR35FMEHgBOJy
         5BgRePNis8J3P11VCo5s7cl3cFLg2MHAe/cYAY5EwIzABp3o7PiuQdt3YATtOQhOydkY
         ZuvXIONOqtWsupiUiCLWeIZ5IW9le7lQEzmbEzHT5Ao3Hs+LIwrF6PltAAQKliZoIUaF
         KnRBmWmhp9joB2QYxlgTymvOFtzdkZHY9A1K+Fockzl4gPeVe6bTD350b+PPLtp+VJIc
         TVd7z/WuKHCLj+SoEqeOVckHUAp9X/cpSZqnLhcHPIki2xrPv8Ab3DQpISfN6mb2NiKN
         VFyw==
X-Forwarded-Encrypted: i=1; AJvYcCWt2CItGZuevwbiTkhQE5Ogd6exutUQYsuLtkqDn89MlIv6nxPI+L12MXvw3df6ReE+u1PuH1FAnbuwulxHlo5y@lists.infradead.org
X-Gm-Message-State: AOJu0YxkmsjZNoa6Y5XAawfJwjlTiJh8sG+0mJuAnQnBo4DeSlRK7Sso
	9l/6Se+ufmmyfEPmVIG7bmzRJFznixJ9gS16ce8g8P9uMd5PzC+RR9AFqdAFFAY=
X-Google-Smtp-Source: AGHT+IHiQxW5gF9yi4X8bacvXjxGkk6fIrYEA4STUTYGNxpcC1/v9Tb+L2h7W5kVMF2aOK5bJYki5Q==
X-Received: by 2002:a17:906:eecb:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-a9eefeb4d57mr208775166b.5.1731062338980;
        Fri, 08 Nov 2024 02:38:58 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a188besm213593566b.8.2024.11.08.02.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:38:58 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
Cc: Andrea della Porta <andrea.porta@suse.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Fri,  8 Nov 2024 11:39:21 +0100
Message-ID: <ae3363eb212b356d526e9cfa7775c6dfea33e372.1731060031.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1731060031.git.andrea.porta@suse.com>
References: <cover.1731060031.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023901_338497_97365B89 
X-CRM114-Status: GOOD (  15.77  )
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

Fixes: dbbdee94734b ("of/address: Merge all of the bus translation code")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
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


