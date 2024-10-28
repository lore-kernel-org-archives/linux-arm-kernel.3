Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307DD33989
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqh56MHAf6NGyxNJb5XjKGyAFS1Pm7/dh/+rsUlSsqw=; b=odFI26lRRPIKQI6dI1rK/tip+o
	o12eMGvHkCbu0iAxuoirmiDD+x8qS8yTXVyWGhDjQt3xNt/iw7COETs8TK0awRbYe5avmAg9L5d+g
	yb0VjjvpWydyxnVMTKybQhiD7yRh8mUBcBL4EpL/iTfgQgFww7OY4I1zbifmqNJDk3c1UO3kXnYnm
	P63Nl6ARFJE6csgxtIiBkemzERewz9EQe9APfe72KVTrmZ/6pdpTVxjHAIDRvqGDFNZbt8w1Joggi
	6Ee3TXQF+wW5aQXn3LRQeBd2V3ChYxzsNjI4DPxeV0K+hNjLBZkJPA2VTdqytrn0g86dCA+RinDdH
	qFhHUa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QY8-0000000B5C7-1vOc;
	Mon, 28 Oct 2024 14:16:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QOx-0000000B2j5-0J7r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso5049340a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124440; x=1730729240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqh56MHAf6NGyxNJb5XjKGyAFS1Pm7/dh/+rsUlSsqw=;
        b=DLzMtwCAlUVIgf7ZV7wnY7Cd1uIgZJfKonHf8hQCvDR5T6iDh1KdJZk76pMepxkcZ3
         5lAYUL2/4pE9RPT8eaRXVnF7EcFpuFwl83r/QdlBwjiwTcZCP0KofsLcXjKtgE/0r5iA
         8XnxtnrG+NCezqfgz1AedU6VnS0g5yicwnWvZRaLNpzPRQzdCHu8q7Ostyb/7Diltlyl
         oZ/U9qrtRm2WfuBgjrDQC6qEIYtn/WPezNlj8P2iQjwZ6QitGk9B3wrlKwgPus1Ij9/I
         PPi3z+p9Rn5DVoJdgzhro17QoP1VIUuAE9TtJMs5helTP6b6WgRgVbx8GcvOeddjR7qG
         HYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124440; x=1730729240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqh56MHAf6NGyxNJb5XjKGyAFS1Pm7/dh/+rsUlSsqw=;
        b=kYS7DbGcTfwvo7RPhu3PTMUdFsre7+T3KWmhSuiOFmPTAB/T9JTeeRiN5wOfb++in2
         /skDTIiPLezDjwqtxjrB/84Sqv6RQLXH4R8MSO4pctRsgVy6/a3Cb989AOfaEcX2MmDr
         T3UkfaJEKZd6v+KH9s8T94iyXyYY0uCceuizUGxdL9P3lNsGzs8f2l2K/n/C8x6pX+Hb
         F6LobVMS56X6hWseUC3ezGJslqewrKZDZugtyQsvgH3FAD+T0Chizf1r2RGyPB0V6ICh
         3tJr1Bm4jAoFt16vzTNWJjERltCwVmEKEEdtbJQHxA6DDGOz92uvsnUAO4tj05kqUKlg
         aRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Sr/LwUpQLPdCxIfCIdwHXspyJZxBKdrJroT4Rk+zSIqel/yqW2/y5BojY90RbPvhDPsXfx03nlhV/HzvI1fd@lists.infradead.org
X-Gm-Message-State: AOJu0YwlamG7IWMxMj7t2VxLXZ0smDhNsG59BOJluifjt2Nt+HHoou9Y
	E7ZLWvdaP6oTgv/zCDk31AC4qmFE0X83mOsB1iHbx2mJYQG8lZBLSlDtti1n32g=
X-Google-Smtp-Source: AGHT+IEJsXz3JLUo8t8BMAbJDLTmQNDfk74M3MzGZPfukI0B32f64s3so2uEdukAd0Pl42XLPpmBkw==
X-Received: by 2002:a17:907:3e1a:b0:a99:f4be:7a6c with SMTP id a640c23a62f3a-a9de61669cdmr835551966b.52.1730124440047;
        Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b32455a14sm388970666b.178.2024.10.28.07.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
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
Subject: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus address to dynamic bridge nodes
Date: Mon, 28 Oct 2024 15:07:22 +0100
Message-ID: <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070723_161677_C61529B7 
X-CRM114-Status: GOOD (  13.70  )
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

When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
bridge, the window should instead be in PCI address space. Call
pci_bus_address() on the resource in order to obtain the PCI bus
address.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
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


