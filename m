Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62DFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=; b=wxTUKFgSvj3mvVjaP1szt6EVjO
	dSJWUcosWGvBVl8NO1Yf1j0Pr9HZcOkPaHXo6vKVn4doOuW0Ie8Zwf/VW+SbUAoiXZ741f5VAhmJT
	6qp7OVoK8rQ1cC3gxH0Mt1iVIJWdk19LcQhSq2qQSVm+Fgy2rVwLeWo7WRt63Ff3qvYxPtA5+dilX
	NvyQMeUSLmiccgAsFMbRGi9AwC8OBGalTRfH8aZ4KK6xOaO7c3zOjoWJwFgz1qPxNLBoAZx8z7Li5
	oOTJmu2HTF8p5hvXYe0Zr/a+rnazoN1KdmTBx/ogNiwMOs+1vc0WThV0v88sZpB+fPPYyPvvAZx0N
	cpD4JrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbHB-0000000Faql-2ipJ;
	Thu, 29 May 2025 11:18:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKao3-0000000FXfk-1OU7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-acb39c45b4eso106472566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515694; x=1749120494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=LLUNHJzp/1nKQPXmSIKea168ovIk5Gdn1zK9srQLx+GZJlbZ3W+7+AI3BsP/Q5VWgi
         DDEOkcHsVp6bd0mitNveMg+t8nq2xEkDYomp/899Ck9Qsp7ReGcAOXDwzZ1rzK9DpSCc
         Sm6rgq4Mn++/2/uSiepc5qnsPILt+KI5Kk0aEiRECAEylKcMqvm8Gi3OpM/GvGFOfPPh
         esrhUjs4GBLDjQ51832fmAlC9XUER7xHYPhXc35xTJbYHBjXDrJLhEZ8mVaA04DaZEdB
         6HddrdkXC0mAHUwgKOSEsquLz/iJPESfI9heLkxqmM8d+0P87AoEsOL3O74DgwH3iIAH
         pvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515694; x=1749120494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=X5qDwbJiAjrP/aF/Y6fRPjbQTrtEu40KugUvGLPa9FIJImFCYS8Bh4PAV39SqlKy7f
         C0p35te5BBvsB6kBhVPOe68N3foXHSsTWF/wJhCYRPW5NXptP4BOPobJNgOmXGGTbSLd
         ZI+O0YG1VcFavN2RFtSnv9dIVE9E/qRF+j8Xai7V6TsXntB+m9OpbemKyBADvb+fOiBt
         wm6nwsH06eikFm+/IbQBRMaHB9caFuZsuh/LHerq+1nvsWRDyjrSkX6KDYEeHy24oTs8
         9ikx+YLfs0tzf3mM0k4aGuZVa3JIXJfaB6OhteiUg7TBRvtUbe2/TI7EVSbaivqz3Woj
         4DCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8LaHRJd9BRP+QJIUkCIc5NE6ObkuhzKUjli77i/no55XTuY5blivYh+Cf1AUNqelzmjqnby7LVbwSDpm7CZ+r@lists.infradead.org
X-Gm-Message-State: AOJu0YycAg124ojjyJqoWad4VyC2bZ/RAaG7dmA8PVBc4Nra2P6Da6Vw
	60t9j/WqbzCcDbxWy9WvtQhp+NI1LyXXNcsrheAuRXpojilf9a8t9nfN8qVXacaCxYA=
X-Gm-Gg: ASbGncu/qrRsejg1W0RcsIvmryZGGuV5+95BdnfyHWWqnmE8eL+KJhU3gSOjTmKARG/
	/7DPUe2ZsISE1hlqIxSTJTD4YQ83Nfu1QyXayZ+dnJvktx1THIJdF8mcsoebUagXmCBPiBNzqQY
	UV/2y2NCrAKQ5pYiPtNtPf9dLIjr/K8mhl62Tk+Qh3n059yLaHTDTQ8x22UYmd45uSmyxzbtmZ/
	vNWfl6HTqkBoGLGw2VzSCUMEeOwwguyjk1KTEGnN6vlDQWaOBde/frZd3oUo5Yc0FYX3RlTr5Ay
	JXaO6MumoPU+nngYjt7G3Yy+QzaTK7/YB5ER6nU5ukY/Q4R7DcPiEeFKgkQHzsFCj18zqfgo4YG
	3wPDMyR8r3jrwkLM/obsj+g==
X-Google-Smtp-Source: AGHT+IFh2Bjt/nqjLOv5kZdMBtyzXg8Cp6AwiLw6gyh2kIz8WiLSbkCwXlnCYcseB95A5qV9519CkQ==
X-Received: by 2002:a17:906:c152:b0:aca:c38d:fef0 with SMTP id a640c23a62f3a-ad8a1da7029mr467304966b.0.1748515693881;
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aa17sm120147166b.175.2025.05.29.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 12:49:30 +0200
Message-ID: <20250529104940.23053-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034815_379413_BDB39F9C 
X-CRM114-Status: GOOD (  12.00  )
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

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3


