Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D43C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=; b=RZxv1dzJ0EO+nXuagvhMbHxU0y
	OKP3X0lHD76b0YvbPy86wVcsc25WugX1I26i2bKP2M5dcsulcWBqKe8rKBHSmdGjY8l2McwUb9l4k
	Zz8FfXEAMRbZ2Geg2Bgnf+wSd1Iimq0FE3+zWH0F8j/gpgRQBZCuW/6RkZ4RV9YSODZEbdwRUK9CO
	YskQd+dvIoKeVujON3msqNdk138X48xgYFmX5Ih/YoRriB2aQAQ4DHm66LsGRPULDQOOxY3lyv1F5
	oT7Vljq8RpYYvVmVgcR8SyIKEwrryeRE5IYH14fHw8hyNrwzllw9rXZEoaVNowieHAW/kqcFGnp37
	sOYJYMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw8-0000000CRLf-04iy;
	Sat, 27 Jun 2026 12:15:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw6-0000000CRK4-0Eqe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 12:15:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so8953345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562500; x=1783167300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=U5+brozu/R7P/ii+dXA7MPiWppj/jXr6s1R0vDAxbxbdHbVFVHiqGB+yN5IKcH2siN
         KiXUuOyo8s6RYVW+NRVIySZsFf8PWYmJzNKNz5pt35xJiCJ4iBjGpLAw7khdWkzMpbR0
         ScHv92aNbsVLIq/EeqbioJMQGxC2jlYsbajrwhGJ67VzrraYEMYtIMzwAZrUwQONaobj
         oPOTMEJqaluch8PveaEAiuja8six9L1rZSDGE7OfGPprfbdL9SUonjjFNDQiO0dGXDlW
         Yx0bwUxLF7gcPb+ej7BlmbPgkcwe+yUnmLCA30rKlv4vDXkh6sd3W3xe8LKtiNAR0EHm
         nrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562500; x=1783167300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=qm6/8dwOb3/gOeFiPdL7Iq2LoiVXodQBXVul/HiAJZ66PDShc+roKD5E61uBp3iNSx
         atckiVHw478mDF74DopvmKATm3BpcBmvhS39kwTLk89kCRUXMffQ6dOX9/cOAHv68Lx0
         x3pAe8beDN3psaXdEcWjqxERpbWpuwxLYTWU07x1ys34v8IK1mwXGpf0FohoBWSzG8SA
         zMoYEfhUv+w46+NR6UZ5+A9VrtNSqyqqewGmNA6kzFHkybiQvYJ97CLzEpa7YbVeC4q8
         UzhKXhb+DQvAUPXZqbxCITVitZXk+YzHJCGfRfh2dPkLrwVSdyyjXuPt0eANj/XXorGv
         cpfg==
X-Forwarded-Encrypted: i=1; AFNElJ/O1ayPhCM9rIy33dkGvEuz21d6P/5P90JYdcq0pvRLUAKlB6vnlFajVpa46ickwy4XLHmmnc/YzT1V2gfg1WHh@lists.infradead.org
X-Gm-Message-State: AOJu0YwJcyH+FvDDJ6olVaeOVn/p3huXciNBs4UzdEplWocXUmFUwM3f
	ZGApcP/sZv3jNad6NfkNF/Q/fQjHV4LCqXNOisD4HJnCAc6NkQ00jLVB
X-Gm-Gg: AfdE7cmFZCOVd+NguagI2YnCB4jf6lgqwkt6j2crGN9L70RnV6Jf1Bz47PXRHSvbDpc
	IMZr9XDZDhP5m//bWQfFz2N235bWt8bqIHVhJxU3az3kWM3o2E5juCozLNd++CwrHoxBDd9M0il
	NQT+5CyfcIET+q/hm3u2qlt7MyfSKl6b55I9YX0PMCVkF4wmxmjfGbOjuAdOHMvugspwRp11rN8
	nJvGg/TVBxV0n5L4zWHHNTeN1YAxFjEa2KiHq1q18cJ9XTt7bUwXlBOYf5/SJ9Hty4V+1q1zcjl
	15p255LllM7FbesuGzGUqkxtOO12mAUfqFDhgpElEBlyPGaMX4EGS1FJ2MS0jr4uSVNSjDwdEa/
	Bo8SV1VwqG6JAHDp4DtPQPLOhSC8EJFs7bEYs5Tja5AgqcQnwQpurZh5F4w31qUeaMR3wz92XVZ
	S9Xx6txoVZ7J9LKylGd1DymZyuhxX1K0RHYHu8J0Q8pBZgLrKPJSd++wPa2pfacg==
X-Received: by 2002:a05:600c:3f06:b0:492:33a8:5499 with SMTP id 5b1f17b1804b1-492668858a8mr160407315e9.17.1782562499407;
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] CI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Sat, 27 Jun 2026 14:14:41 +0200
Message-ID: <20260627121450.3529133-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_051502_104792_ACBDB5C3 
X-CRM114-Status: GOOD (  16.22  )
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

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 104 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 375 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


