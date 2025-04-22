Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE81C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=; b=LsQXV2UHJ5T3lbzCfR31TEtKXb
	MyYdXpKaPwTdu4BxqizAbiFXqmpi4eHd0gJBBpcjnck4QybAI+VTQApOrrlpzPHxPWIVu+RNdV7yL
	2Qr+DlS1J8VsJbqWrwCDuV2C1FCKehacCrPSRP0jHqtdtCmOmRvl4tGx8a2mvZEWBqEAGVlWeJ4h+
	23XcWL04BEiYwQojOjbLEjvILtymbwZYkiCWf1iqt66bIBmScgjsiRjrTRDXL/bYUM7VI5P0plz6d
	wtxNQmqLSHbrmRpvvOXFqs+9PngTqtPJBcpoE8z6cwK9Mgtds6ZdnYizMsHsZwYdNKzEa70/WBMtj
	WvU19h9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbO-00000008VZs-0Es8;
	Tue, 22 Apr 2025 20:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IjF-00000008ELx-14iQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 18:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=; b=LULOvUlgno4htiaj39eaQBCr7l
	UDCePv5MjbQ5OeI4BE1W01+NTxYHOW5w3dLN+D37SshrdMhPSESKs0p1ZvdYu6jh/JiSulIaSyx1p
	JjYnBFUJF8FejdOKp3FMKbRRDsyopOKCv5egNQQmY1iG/f6g5f3Zds6ZI4zkyEIbz9iVrbrN/m0/p
	jNQuSGcyxYRtCM1/hmVS9Z9rSGllNvTbXuo5OhMCzzBBSjwjFe6aod13Ozgv8ux2y+Uot+qQ4U5E7
	801BwyAoM7OWQfrG2jK+kvt8mIEbEyj6oBfyggMHC9FFEFLokTHSVOv+vO6fPF5S1TIonV/VroJE4
	8M9IopFA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7IjC-0000000BHkv-0qz1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3716492f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347935; x=1745952735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=Es3BTKzQRKPQuAkEkRS6JImwbebqfWnM8va2snhBFPiKfo6LqC3mBNeqdHWe1WgqqP
         SxH+IyzLc5PwPMjySQaAfvpNBSZN6m2My/9LKiMOP269qWHlaiZqbZKJPDP7hdlQXeCp
         9pr0EF0CpH22B+XpoX1od5cGRWuSX3DYYGkI60gbWLbZ1YpOX7R2iH4raKYclBNIgrwg
         L2+RduZU0g8EVBUs/Rmw762M8pgU11LYS2lGxvbU6kq+X5+LG+MmicwOz8r2uWELL6sh
         rgfBUY8LKMnKrieL1rbU8AZGakolx3uh7C9D41TP0OPZpm6c+DvfdmKaBD0pqW0jB8pV
         Bx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347935; x=1745952735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=nJrCXqmn7Dcq0gW9faZz0sqZp8DivvDKy2oqra2g9poJiXDzgG3axuRIHwf5WF/z7E
         URzmB0Vpvu3nT2RpTH9b4c78mE4DdiyHDnDPEH8dFFskgjho7ZyKbO570tsrr+d550Zy
         lgv98FBEA3UgdObSgNT7lVnAymgUEZ/KhDsmpNj1f9AmP5+JDk5yYH2ChLqWHkYBnAZX
         YiHerlzNQgR4Xas2rS/gcK+eAM4bUhaqmZdq0ecjfAkfs8hbo/JoQ0sc31Ve8qQ7pm79
         031UiLoT7JmQiVQzVbhZOJkK7uHjjtdHKauw08Spa1endsiKUfNwY151RsP9iPdcHhPk
         I5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbvnMB8Z0nYiffElZUqUMqzWOSueAdTI//hu1qw1eW4TguF1fbWd4ew2IXxG9C76nivQVlMOYQSzhCQNNiDjpD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7QbmACaIP6rcOlSzInSzawAWYi8CLe5w8h9tTwEtNdTGaxKiO
	vshYkFVwyo0LLCXUtVLw62hUa4zErHhcUqehMbJg9Jzqt9o3rPlbYFf4iySkiVs=
X-Gm-Gg: ASbGnctczQ3WWjiCRB/N9Ryk5yEi3nptT9BDK6ShCT2qkIEJJQ8R1ERFGsgSTM1l0vW
	b7hWbSgndNwVzBUqZjEHrnROOzrbN3jTmUyu4SbaZc/yOtRQ7Z1djCdzuxWPcfyimGAtdiCvaMD
	t2EjiiF8wFTC3hfSYaQx/snGgVSiB9lPXz8GDxvGaxoyCbcORbVEoJlTXZ3Y4U7+MvlaXZ79JsG
	tyIvoPVTZKbxCnotyQ+cAS4Vl1LoeCHFq2pd4+kpVR4M5B1FpHNbK69dVdFBRnSntPgPLOr5THF
	qClSYwvpsm+Nzi3rgAwP7aBPZK0i31bGrvxbtqc6m170/4LA7HY7WhP0QVZetmxtybAEu/FBPsu
	PTdAAgg==
X-Google-Smtp-Source: AGHT+IHaQWcyIld8HmOWqZEWQ8mfScJy5XfhH5TexVF3JHDuC1C8WH0PzZCZR43OQba1F6XglJkm3Q==
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39efba2ca27mr13013041f8f.11.1745347935584;
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207afsm16278846f8f.12.2025.04.22.11.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
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
Subject: [PATCH v9 -next 12/12] arm64: defconfig: Enable OF_OVERLAY option
Date: Tue, 22 Apr 2025 20:53:21 +0200
Message-ID: <8baf7818aae1fe5be046015e4bd8121ccc9acb20.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_195218_364376_1C5B1D23 
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
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 53748ea4a5cb..23656b0bb7e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1640,6 +1640,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


