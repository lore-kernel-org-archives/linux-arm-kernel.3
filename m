Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A4C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=; b=tLjShaeQzYbr1nDc10rS18jxJX
	az51UpH0fUfNuEPBsaqrpmZN9ufYO7mVrwaAab+ltxSTXW3qBvu6j/GdcDsevQ1BLfVPAsJ2TdRfM
	AxWjjWffVjEr2Y0o0FR4MvBWMagzPDsvMz0Z0c6UOsaipQTTMyLNVrY1TXoMVCs1Kp8jAIuYUEFEN
	boUqKL+OUKHZqG8htBWdOEUZNeGDO/AIXb2l4IlklBw3UcDWPazzoMonATvE64ssHQaVmkLd59WX9
	W0QB4bW0N8JPKK1U6lvoD3I9tBdOeCWfO73e6KiLdrGQuhug2o7CkQtXT1mD4+vEYmH7dHe5PhrzD
	ExlgFleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdEv-0000000Fqjn-1VsE;
	Thu, 29 May 2025 13:24:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcap-0000000Fkk4-2hQd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6045e69c9a8so1444210a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522562; x=1749127362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=eSMiZlqqdK5R73MY0uDpd1tmtWtnIZhxsOj61qW2KZsTs3rDniCN+fncA2xdr9LZ3n
         bQgjkGs5AATzQu+oUrtQK7zfh42bI6cp015SuqwHWy3DaeWFfRwm3PuaCz6EAiWhfBXm
         OLFXU1v/Zyhi4I/9pqlAVYplgSBYCp23WF8RAYPnReFmLe8Mq2HkF9v5YKgiinDbFec1
         rGx4QRU3uO0adAWQkIb2IWfWOiVXpKL5qqY6BE1GY+gLMJz2VTsNv9srLmiTVYQmAGQZ
         9KluZ0PeCwAckwWhu4AoWQrCH23d73pyiUOH67jnHj8HczwAnSgIXCV+bNovzMJXLSoU
         ghHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522562; x=1749127362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=ZGYpSoLRzfmt3tR6oczlGj8/427bymcw/5DnbE7amPdMTKzuGjFjm3HKgXqR/HdfW1
         fJ6qxXy6Rglze5nDY3f+rpJYwa9sIKKE97HuABmb7VTOzAuKVgjKDHLr1eX9q0VktD6L
         Um1kTQai54HlqOMnmdD6euqd/at/b1+vWBIIdu7/J5jTcHSpbyUhVGqds4LWjvYQY6et
         +5B+ssZCfVaw/wgBR1qFBMsg2lvZDLuTRn2H5twG70CK6dKzgCfJCtl+NvqxnwBSPi5R
         t36MBxUe7U74EHp8OYJ0Bc/4/XnhtnBpSymuUcj8vBNsoY0RzROMKRunB35JqLNA2dJU
         ZTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6TM/VcPg1Bw+wQWOAGt/vaeEe0tqnilL04Jxe03hegY/78xcCMGxRBW63cNvpOI+T3UzOmAH1ogswnjRUcdP+@lists.infradead.org
X-Gm-Message-State: AOJu0YzbIFoaWZEN/0YQUZlNQbC2sHlP4P/AWaIdip+qbqCHkvn6F+ax
	dhBiCF1OwDkaGvrIxAixa8G1ip4n97FsGvZ7NxiHGQ5j2hkJXessy+cuI0uvCqfnOEo=
X-Gm-Gg: ASbGncvXazG8yxc7nBKO0AxKnQZxVyM2cvpjj4iTVXcNR6+v//Jp697jmYytyCDlmwj
	LHl0CW//WQVCDf0pksyGuF+KDOOJyDLpnemYw6O2iZEzY56b8U+5SpX/PxOxbQl1i1mY7C3104c
	EH4PRQ/M11I80lphdS38mfUcy1XOHy+mxQRTMXSfPllcfnbZYrkxHz+DXs/qI/Vuwssa31KG3yQ
	+1KsDWxVHCiyT/fWlST47bxxgFoesexurqv/1/jR4X2CL5A3y4G5hK8bU5LERfi844KnEh077MD
	FadDZXGua1caWfvSitIA/x2aamgJWK/+RGOKj+L3t7norjxkMidvs56VjuF3V7iFcxpDper1E74
	fq+tLgHPTg0LP2LicF8iowSf277e88N/9
X-Google-Smtp-Source: AGHT+IGNiDnmL33gl89vnGs+/ABlMcodAbvG3T1PvC7+mWmEo5zj5kUpEb/gkX3S1G8x/gUNclU3eQ==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ad8a935c9b6mr486027666b.31.1748522561822;
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04579sm134495166b.87.2025.05.29.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
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
Subject: [PATCH v11 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 14:43:59 +0200
Message-ID: <20250529124412.26311-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054243_673212_A3462242 
X-CRM114-Status: GOOD (  15.18  )
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

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


