Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A094C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=; b=tLF8ub78BzbMZlYHc8poGdMqVx
	UFujiVOy0Wihk0MnhMKgL/Ap3LpK/9EH40grd+bV7X48C606r4XSyXEVuk7SAOJgRDj6ntXPWKBsb
	zqjcKa7J0ZbhtBXB2ct1s2djzav+slfGcxK7vyq1zX3DEppa8apm10QLwwIgWVLkDe7yxYzl0OhMF
	Kn32py240KwNb1z1Sk5tGxwY7eITbbOL77OWN9YP7aFnwW2IlzUEUrdzWjfe1yH4ZhHaT2aCOrsum
	yadnsA97C2S+j3KSiRe/S+7TuTXoZIsrc3CHfjknk7MUs6G0K70EmQNLd5YJWkbuiIXVUso6P2pTM
	zB8AqXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeko-0000000G1ci-0Kc3;
	Thu, 29 May 2025 15:01:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddU-0000000Fu5W-1qmy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so165687866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526571; x=1749131371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=JMDe9SLkRzrofqjgFzrEoi69hFcvIDIffApIjPwv+x91v8SXEgYbKAyXGNjTm2Ealm
         9YUx2QwjbulbagsVIrL2iAVfvSawYZ9aEeMHB0krgxQo7lcGH7H1KpnXVgfRzHmf3O+Y
         npiQJVBCs9BlMZQdiJy4A2+XlJtwXd4Bf+DoLRjTdg5EBAhB/EIxdt8gnY+9kVTC0Gjt
         wPJ/vWZkpoNktaOBtgnHau1S90ckREtgUs/z8EIEa+1H409v90GyZwCuoE+XpqsnPtvc
         nORga/dp3FPlcTBDwY8m+paUKMQ9iShE3rAw0xpScR7h/srDbUMZ+g2p0uyWnxfr/aOR
         rTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526571; x=1749131371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=tCLgaQs5PYIiBvmAUP9jrUt1+/mKIMNtrmArCrr5V1JBhRBAPc9gUhEtsBI6jFKKVu
         OjWD7OxepPXkpHD2hlQeW0+esLP10OD5HFDHK4c2iEICKiRASeGNh84k7QQlpAL1uvn1
         lcwyPMw7Nb7eT9OTTJ1KvGwlkGiS+z6xx1+hP4184b0EZ/8FpWPGmgofC2UNwrU5ADIt
         Y9t7B5o+Nd0hoOF3xGZOk2iIvVt1Fl7TfqVBt2uoSZB2rRIEIKdreTNMvTKAba6+Azmp
         oLdwpP7aAR2Ltc1gf7owzIFPaggRp7wSFiSwnKuw9xfnzTQ4oOYNFaOzhONtlYL0ESTc
         T/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUoCJxl9d/88DaYDVlWaNT3nrnge1QAhBxwWuJEA+A8gNoBCkzsmlod19MzHMGBne1pCHOQXNgSZYZns/gCh0uz@lists.infradead.org
X-Gm-Message-State: AOJu0YyWl3EQylr7Zzr/zMjFki5nkx+vMkbWQEb1bVKtVakKFr1JlZ8r
	msWueD5NGNTgSd0e9ZAJJ6E8oL+Q8kVrrgnDRc1HZ+fQvxQs1F5cR9+gZETCHWH8jWM=
X-Gm-Gg: ASbGnctCW3YiFVda5CmDmJnMOijIrnN6bOkoLxzBOykLNFPtt4FtUka9lKtw3VjDTE8
	2pDb84Wxm5n/IBggAndtyKUjKc0nCc3onbcAbFj75WrmewqqBeM4bRqscARPBGaxTksbDWgj33f
	6ByATAStackSdfiBTe4XMKd2LVfksBSODr+rt6BuGy2fl/MfvDKJkLe6L7YjeipsY9Ns0mCaeg3
	ADCkDUZ7IRbjvg4n8M0FaNdPwQjd2k+0QN5aYTNnxF9vfMYGtgu0BMQzd9IgLNrq1+MMSNEgtlF
	u1qhxjzvqD3x9m/jjjKXPuscZb3D4Kngk1LV+/mq+soLUM2F07fcBTr2dJXPqiteYyyPbXE1SLn
	jWOC/28rH9J8uxFv4uybxlQ==
X-Google-Smtp-Source: AGHT+IGTIeG3mVlDM/pGEiWdSac6XNjdCnFnJho9+z4FTO/GHQp7LGbIzdlwn2yCN4YylKzaO3lweg==
X-Received: by 2002:a17:907:72cb:b0:ad5:6928:1492 with SMTP id a640c23a62f3a-ad8a1fcd804mr607783366b.45.1748526570900;
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm144764266b.183.2025.05.29.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
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
Subject: [PATCH v12 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 15:50:50 +0200
Message-ID: <20250529135052.28398-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064932_472646_31C82F6D 
X-CRM114-Status: GOOD (  11.70  )
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


