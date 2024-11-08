Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646E3D5E149
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edr4i5ZXuzi2MqMxkWzTe9XDLfbB9N2JCAr3MU/xkAQ=; b=kViRpBjnLDq03cZ7EfdHDKFp97
	bjd4RiuCR0G3qV+N/CYickPArTj7PaBOt/wu0bRaceru2wJM8ZBLFKMxnPJ+1817+2xEa5kRDm5AG
	7r9D1I/+S0k4D0V0jxJuNDVvNqa+R4pnzH5GTwc7OL6yfYB5WcOmMO8Ky7YD+yBoQDdcJ5IUcU9AG
	rTRLTsUBRx6LSxYlGUPmZYj5FHo8/zN1PYNXdoOeUeWx3pbLA+pwVcjYg3gryPOv/WX4dpMZPMB4K
	dMfmPAmIKbVIuTzz9SdNzAUOqGClxOnxtG+btJpf39BxSa9MS7K14f/+GRyZ3HsP2NAJOknexkCgQ
	YQ4nRgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LXc-0000000A082-0ITB;
	Fri, 08 Nov 2024 09:44:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LVq-00000009ztU-0IOi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 09:42:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99fa009adcso107601266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 01:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731058959; x=1731663759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edr4i5ZXuzi2MqMxkWzTe9XDLfbB9N2JCAr3MU/xkAQ=;
        b=EZ3ruLbVwA/nJehd4rSHo5rDvPPlZqPdfKnRGw490xdfY+UqzfKA4gPCI3N0QkHB6D
         JtNt/Fu+huKiKllQauwthtePMNbPwR8Ou+BPE+LR9sHR/wslQ/uqvsbXhMy+Mp99uimQ
         tlPG5X7e9zpdNAupYhhJhxvnD/4ICJyUP6caIjn2Hmg+zThdPLeHkQnkMA8u6zN00A+z
         zOWLaIAxSbQAdSBrw6aJ7PXzUiDw4LT74yK93Zbq7d4jZ3JyKNF57jV0ir6iypczYT9I
         9WWZdUH+nkrdueMHTgmzc124sPZU5aqeglzxcp+lGtJIcu/7vpxersntu2mfZgtUIps9
         5B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731058959; x=1731663759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edr4i5ZXuzi2MqMxkWzTe9XDLfbB9N2JCAr3MU/xkAQ=;
        b=AgEBx1gcByI6NcBkGcJ6zDJ0iQJjlH6ykLSvFkDV17Yub0gRYy3Dn72pAwepl4zRFJ
         gowg4BfqugH2Ytw32iHaYS3e7tn6zmG7zND+XR8OSCNw2ESb1ZcHwDQVdh/pcz7rYxxY
         gbYLUXmaYnmgw9woM17EIyoupRTOllANMYFkMaaoJfDHItp5Uhj7MzMxLP48gQjIrORt
         /XHEIoC8cQGkbJMkinYev56mPnjPzEimiD3571m9I8Sv9Pn4qW2shIb/VwYYxUt8yyH7
         n2hnF56o6eciI/ZXnoDsV6oVmXFf8aWleILjNSZa0Yo2LGYbBru4/DR1XTmVn/u3UB1y
         fydg==
X-Forwarded-Encrypted: i=1; AJvYcCU6d5L7x1+IWasD6Bc3WtLy8OqFxiKomFO5648hbKt8Nb3/Pa2Vuy9bQmaWj7cmZqAT1iS4i9WjA22DdKc31S3n@lists.infradead.org
X-Gm-Message-State: AOJu0YyejD0/DmhuQxaA8OfsXLUQagAJEx1bvIX9fMVYMi/3pYdFK/77
	bpjgweKZwdZKccUnj9++8b2nSFgpyl4H+21Uow3tVBeae7+6StJyWu5cv96502A=
X-Google-Smtp-Source: AGHT+IGmVFg6dGCdJ94MvP+GtpTJm4h6Vp+aWc3AX4E8KZIkMCx5imWZRQaFghSdUOFYkB1RH36WSQ==
X-Received: by 2002:a05:6402:3510:b0:5c9:34b4:69a8 with SMTP id 4fb4d7f45d1cf-5cf0a2fb6f9mr2077935a12.6.1731058959540;
        Fri, 08 Nov 2024 01:42:39 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ed68sm1765328a12.63.2024.11.08.01.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:42:39 -0800 (PST)
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
Subject: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address to dynamic PCI nodes
Date: Fri,  8 Nov 2024 10:42:56 +0100
Message-ID: <20241108094256.28933-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_014242_142411_FDA9C65D 
X-CRM114-Status: GOOD (  13.46  )
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

When populating "ranges" property for a PCI bridge or endpoint,
of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
In such PCI nodes, the window should instead be in PCI address space. Call
pci_bus_address() on the resource in order to obtain the PCI bus
address.

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
---
This patch, originally preparatory for a bigger patchset (see [1]), has
been splitted in a standalone one for better management and because it
contains a bugfix which is probably of interest to stable branch.

 drivers/pci/of_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 5a0b98e69795..886c236e5de6 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 		if (of_pci_get_addr_flags(&res[j], &flags))
 			continue;
 
-		val64 = res[j].start;
+		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
 		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
-- 
2.35.3


