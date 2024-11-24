Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F2E66894
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk2GE1arbul51a1ynLU7Q9xhqGMt1ZdTPnPwO47t9KY=; b=ipOrAxHK+akbr+7hNoC2QbSoyR
	Pz+UaP/lAPrmhEh4MdBFHwUp4VIKa6DyXegaPIBMzHoP3XQK+Ny4S4rkbFMcDN8hfKBXJ+hbBYAwN
	v22EoHxQbth3DmC9spywUnMNCudUiGnwuQdS6NQP93dpeDaYo0y77vqwkHKkmkh2HXh9NILKBEPBp
	KE5GKn+BttSI+yi5lO7ZyZECPmkFLQIhMlZOLTxhYEJ7Ww37l/wZ+FS8Cv7nL63expJgGqQfRbiXf
	101xpML6jw+v2QyhRLkKkKn9aCeNJ3ndnfXH0DJqBqTlqEvuS1S4ZjZDHDaG51gxpoSSaxWcS509I
	qhGadWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9WH-00000005bU3-0831;
	Sun, 24 Nov 2024 10:07:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9UP-00000005bCa-2MxM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:05:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso260096766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442712; x=1733047512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk2GE1arbul51a1ynLU7Q9xhqGMt1ZdTPnPwO47t9KY=;
        b=YV58xd+FcAHySJfGDsuTodtxspGZuT4+UFkXRjCML+mTeb3iBbqVcCHA667mAfKJ5h
         PGtzMkL1PL05a+6BETS7yKDdXKHYuXJcEavYb3vJ2LOT8ECdXBSKsCMFcR73CfB2LpND
         +TZz3x+v/MONcKi+j+Mp7IkaZe0MCNLMulK0pNAOBuLT+7ZsmjT+Qad2zMTXq2SMl8hj
         SnR9JdcUs8ZBexPv3izTYQz0Zz9IkbVJshQoRJSdFh1ekGLbknqPdwbMoRxgBVgONlBM
         sLeVHA5KQIX5ATzg78cFp2L8xvb8tfKiiWjrhZ8b6kI29rtiCAS7FlyO4IYrtFh7bJY7
         uttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442712; x=1733047512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lk2GE1arbul51a1ynLU7Q9xhqGMt1ZdTPnPwO47t9KY=;
        b=p9rPfxVXgkfVxyaqZfdoY9HXgaWyHUivVE6P0/CVEWHI6ubOc89uAC1zT+TTWXTjtp
         XqedzIQ5+cT0xLq1zROFWrIcWjQHxq9oYJSvapwlveplSEDsZf217M0Kw5NgNEz4ygfL
         rL9rOcuf7Ao5p2fljlAbYg+v4StQyCN5CgPkIztNZFszBEGU27jcTK0pyklx2TCKrYTq
         4wplbXuP4SD9naqQe16xtyDtM5gTWzfCvCevFysYt1ywo7c1AyJfnwNsMCSd4TrUNXsc
         i5MFde02V36M1EM598OlAgGh9rfkosqDldupBi+KW1yL2tx8272ToPCrEhi0riOWk4HW
         4PNw==
X-Forwarded-Encrypted: i=1; AJvYcCWekLAwOEMvOM29m8wshy5EpOs5Tk4ZNCz70HlIbHhPXQeQE3r8prpPcEGp5j1vy8WmNNbp2RwhaktpXrlpzE4W@lists.infradead.org
X-Gm-Message-State: AOJu0YxwmZ4YIr/oZ4hRhGfISeX5ujGG/5/fT4qi0L48T1YBKhkHEkrW
	6RLZK8Vadbwy2/8FmGHekJE3Ku/cqti4XdK7P0oo/vCJmQ3OAo3wVpjFOxkMAks=
X-Gm-Gg: ASbGncsSUPVcpxBzy/qWGha8S6DZ89s+qrAvVTtjX30FL/SRkduIq7cPMNJ2B3Cyw2S
	5TjKW0OHNRhjF9SA9cw9eFJrxbIQ9b/QQLyIcf9GHxE/0u+hpxiqEg+sXNVqOw5z4RNdley18k0
	EWzOC3wPo/T0CSAXZRuI5RAUU4NQ+BDXG96FbeEqUaw9GEy25P1AvLA+vdB8KAoVUiWQJAKdFFa
	7fkxvH+CizfMlHMf1a4jnjvLQTnZIfel2grt6aSdOxNgc6Deqouzx/cgzMXMBDAbb3hS8+GMAH2
	d7Oq4hyL7F+j92O4EDlp
X-Google-Smtp-Source: AGHT+IHzhjRJgC4zyn46rADf4coPj01YWTVyf6AHNKqiCSQA366o1m7GZGOpC6OvPXD6QZ4IdkHEbQ==
X-Received: by 2002:a17:907:770d:b0:aa5:29ef:3aa6 with SMTP id a640c23a62f3a-aa529ef3b9fmr468828366b.23.1732442711875;
        Sun, 24 Nov 2024 02:05:11 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57bda2sm325822466b.146.2024.11.24.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:11 -0800 (PST)
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
Cc: stable@vger.kernel.org
Subject: [PATCH v2 2/2] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Sun, 24 Nov 2024 11:05:37 +0100
Message-ID: <e51ae57874e58a9b349c35e2e877425ebc075d7a.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732441813.git.andrea.porta@suse.com>
References: <cover.1732441813.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_020513_637776_AF2C60AB 
X-CRM114-Status: GOOD (  15.39  )
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
offset from zero. This includes address specifier that has flags (e.g.
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
index 286f0c161e33..b3479586bd4d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	}
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
-		memset(addr, 0, pna * 4);
+		/* set address to zero, pass flags through */
+		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
 		pr_debug("empty ranges; 1:1 translation\n");
 		goto finish;
 	}
-- 
2.35.3


