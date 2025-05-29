Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C15BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=; b=F920Sf9UG8wfsgd+gzPmrZUPJg
	3Iu7jKQ8e/Kg1glJ/V/zGOIcKFPibJA/2ozIL+IBxNZdVtsChpaDwh9JPYRnPlCf/VhHFgegZE1YE
	fTDom52p+um+5zn9dy44sOOXIPxfU8FuksoWedyJzaYWHGAb6bDnC1tampgDYctLIs9Fa91aGuYui
	ETomEv4w1e/bsUzPurIJSLRG/HqhUHN9ZcV1467MtOJpnFXv+6KZMV7039u0vuGFlD+CdRX2sPss8
	jQCKwwklrGrinyu7BMy+sS3TWcTL/TIFlU0YEa6BgMtw45IbEVDX1fcuaOa0Xbh44VW9pJlvh7xrG
	AuxXdwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbsw-0000000Fgkp-0gmh;
	Thu, 29 May 2025 11:57:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbLC-0000000FbGX-3D4m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-604bde84d0fso1114002a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517749; x=1749122549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=Ls3Vx3lzKSHGE25uO4+q7xGNsfsUvoFBVAgebq779krps2lWrchXXzCC2ihsMNBCqg
         R9xiKy+TEXKq2zO1r/r8anGLlSUhZrnmUwWCYeo6jZqaX1oo2TtQFI1W5hAYZTDpj3ax
         DlsXm5JNJst/GIsRNJ3bAyvHUExXSY9+Sj8qNBml58kRh6lI0RaemRSnufuA3cdckglH
         1F1MW2wp6g49PQPF1SNYuwqIadKAfJaZd6p5zN5CFmFpJbdtZ2v218Edd8TwxU206G11
         NVZI4Ld5WGdAWUeCg1T9paisEQpDJJysigkzqfFsF+mrV14QGizZE+A/thYVtBCmV89e
         XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517749; x=1749122549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=UuNLGFs+mgIwoR2c1fIuQQ2U/oSsW0bQ6pFv+sDogN4yoOPFfYhoUgL8VvumSLV96v
         ui1O9pfSTO7S6e6S28BwWju5ZPmI/SlTtuwA0tj5luiRTJkyf+Jd/qq1JUDmpmND1Cgz
         sGYxm+vM+FBh2Lnjs87GLzEp01YB1mVZAMtbCYFQMBpSUnUbCObGJVZwcyarIQpPeaFt
         3l+Ur5p+X5xmtA4a68hjjhqXoOMp53U4DANIh5eqhpPdv8gRvueirpg/2iwUqFR4ZfU3
         T8T9/bDAL2IlbwWz2GR5U/UsYxX2LuWk+3MLKyI1gNF2PUVsWjOfydZXwOAbUYg1qESp
         mqFA==
X-Forwarded-Encrypted: i=1; AJvYcCXPtCM8rdergpxBODhi8iaxS5XHNApmzVUf38Vc/om/PN5QTWWpMN6sNtPmMzF7e0T9saDuDGC2PNnvqKXXL9VN@lists.infradead.org
X-Gm-Message-State: AOJu0YwskO2RTxUJa+FfnNqbQMmsI3Q/MXdbfcqMcWj1yTiTUZYTJaqN
	KnXN0bFjQ+xXxwdDig+q/Df37PGz1HgkjIFCWw1LgWDzbSlEjCnzn3R+0ee+FtrkMiw=
X-Gm-Gg: ASbGncuj8LpvIuIHGmOovcUSTROx6NcsrVqlmzjqm1o6q2za/Qa5BQP8r5H+OM+8OA2
	j6KDemRLLm247rK7W0DPnfQ5/nrZLTfLZa5hbOla/PoKFDjnjX5JoVQ0ZzfIu/xWx3XiXrPnZxr
	ulxV6R9CoMTgc2OPDHKU386Ef2EuhFsk8XiJnW1bre+fcbS/L6fJ9h+H8s8FiAVmPKmC6NlcZnm
	Br6qjZPVK33OPlgfM7DCbRBQF6VCnjSkJ2BjrQHR2ZclpQhf2CGcCGIgc5tNSY2S1foGG+9rv4L
	/w7g7huzmlqclLoChE1+WjCIXt8EVJhfCv/RoRXSHiD0iohxLbBaRBCg8wxylCtYyW7bDQ41HZ1
	XZWC7MAEG6eV7vqL8Rj2+bp7k+ZWh2yyd
X-Google-Smtp-Source: AGHT+IGIHEB4AcuERSFwVfLZXlxZybEzRkofnOTwqfs80hqrEJ33hE4h3yIsIdTYmxCJoTKFbmQFHA==
X-Received: by 2002:a05:6402:90e:b0:601:9531:68b8 with SMTP id 4fb4d7f45d1cf-605460f42f1mr1154010a12.18.1748517749396;
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d6091d9sm2291814a12.44.2025.05.29.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
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
Subject: [PATCH v10 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 13:23:47 +0200
Message-ID: <20250529112357.24182-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042230_804248_FE2D8872 
X-CRM114-Status: GOOD (  11.01  )
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


