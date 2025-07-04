Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7BBC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=; b=BZEOHRmqO0/OJ9ZNGMd5QoI7QW
	hNdDwK1WSVNlpUpoGflrpSPCcNGwrIIgiA7AOKRLmPAhhZdMfYgaY1ayTuwl4pPOBYhdbBqWPhGTq
	93EHdrFDOthml2C8c0qDKoPrSg3HnF0/ZC7PDOUHdBTwgVfCzP4kn9fYSOrsS9fgbXxKnji/on/WY
	MRtr5nzbHoYELVCp/c+abIAXqxxRz6ZdPELXZjUY+IMdws4Us8tx+mmFI8htrz2emULgZdP8YPXat
	Po5vMtMtMOX18+PYDTtG8acmPCPIlDSRDPqj6UYzAuMZewqcELmKaqRNaSzD9kipzqgBdJbMz2s+/
	Zt7iW3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjOj-0000000EyrQ-1vE7;
	Fri, 04 Jul 2025 16:36:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3i-0000000EvDP-1hAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:43 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so1652183a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645681; x=1752250481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=S2yX6LC+I4Nyo/j+dFKBjiuWu4Qbdh5hm077yvSY0Xmo4yCvSqschvI/Q3sQKu9GDL
         m18WxFO6FQsWGlAFOua+NJpvkv19QK9JbQe8oeRMxf6YI/JeubmrzuTbObQmnzf4n6JR
         OoP3jrRiOHZqexQjwaLuSld52B8AX21JcJTSQcHRV02oG3T+dFTa17392RWKjdTQ51Yi
         SWlhtcC0KyvaDkmrfge/tF0m+rSqu+ExuhTh/ev+ISh+tJiLvzAavgOQQqetAwF2YCFD
         mkFzlIPibYF2LSyzSZBq8FY0M2+UPBDH569KiE7tjApMcZ/rArBx2S+zSpS06aNnaVNi
         JZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645681; x=1752250481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=XF7jtUHld7bOKcATVN03IoO/AGzwvT5/abUJLd9imrXuHdgFbh0IvPGMq3w0PrcIDC
         5DRWMuUL1WGoMI8/LP57bDPmu+TbOxPdaABKMJe+YkYnYP0CYeakidqaOgCnmAtJxDj2
         d7MgAB2w/qKvr3LoVdqZKUTdqqbkCJDYla6IdrCw8peP7fPAxFOAgdXlc/8FO0J/9lCX
         uSeKczxHg5d3QFSXpaokiuCiXuyig9213HqT4BsE7X7dsYeqoOeuD9XtcauSU+yIxMIu
         zsMSc8q79YqOOgBXM4b8hj76nITwMoiI3Pd4OMQB16HJX++mPPZeTJNUjNfD6Osks+BN
         9keA==
X-Forwarded-Encrypted: i=1; AJvYcCVy36DGPK/jhMVAezs+VdNJ5xt0qDaS+sFJs4TDWVcu/xth3xuO5yAfF0SrDI+GAvHOWSblskRCHjzl9FFmYMM3@lists.infradead.org
X-Gm-Message-State: AOJu0YxdaYaWmxe2wfIluex8uMxOfuk9v6WHo5YZCFx2eIH50xXsvj2k
	mJNvdsxA+NrYL6kgNZxbo9Xy6uV/LfryXdS+rdmfwMA1lE6YYf82LsxNAuR9HcxBiBg=
X-Gm-Gg: ASbGncu+g4kcNKYSM+yg2ShPjiTSMw8q8FEO+BqP0xTpAEB1FNpfkoy0SYVt25K0jn8
	mJewzufgohShYudKoXB1dqsPkzcYUCNvBLikn7ysw8Ccv9e2QoMKrcOUCHoQF++asu4gx89a7xB
	wvIXU+c+W7aaFrSk0woZvUuxUepwQFvnsqZ7YwP5d13bSFEBLJ+AolY5zF71DU0SGeBCZCUynPQ
	j2w1rh/jyzIlDeh6IaNw2LoEOLxYNqxPQIew8kv/SNFLS+R7qe+1Wh/aUmq5EUcP1noNj3fNfUy
	jufQE+OdKAE866cakWWKA5EY4kDb1mJBLhfL2sEYFB/85/FQ8KUlOia0OwZ7i/4iyz8/We8YEfB
	3jO3YXVGkWZb8zgY=
X-Google-Smtp-Source: AGHT+IGL1FhLD4OaydMHDQRErBXQVTMo3OYnTq5XD1D0AoTOZG1fs0lJwUIPUfaPAE25gc/Ra0hNDQ==
X-Received: by 2002:a17:907:dab:b0:ae0:c0b3:5656 with SMTP id a640c23a62f3a-ae3fbc6509bmr348476466b.22.1751645680835;
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the next level parent
Date: Fri,  4 Jul 2025 19:14:03 +0300
Message-ID: <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091442_449419_8D6DA20F 
X-CRM114-Status: GOOD (  17.38  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
detects. The node name follows the format: pci_type@pci_slot,pci_func. If
such a node already exists in the current device tree, a new one is not
created.

When the node is created, its contents are populated with information from
the parent node. In the case of root complex nodes described in the device
tree, the created node duplicates the interrupt-map property. However, the
duplicated interrupt-map property does not correctly point to the next
interrupt controller.

For example, in the case of the Renesas RZ/G3S SoC, the resulting device
tree node is as follows (only relevant DT properties are shown):

pcie@11e40000 {

    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;

        // ...
    };
};

With this pci@0,0 node, the interrupt-map parsing code behaves as follows:

When a PCIe endpoint is enumerated and it requests to map a legacy
interrupt, of_irq_parse_raw() is called requesting the interrupt from
pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:

interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>

from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
parent, looking for a mapping for interrupt ID 0x00
(0x00 0x11e40000 0x00 0x00). However, the root complex node does not
provide this mapping in its interrupt-map property, causing the interrupt
request to fail.

To avoid this, in the interrupt-map property of the nodes generated by
of_pci_make_dev_node() map legacy interrupts to entries that are valid in
the next level interrupt controller in the interrupt mapping tree.

With this, the generated pci@0,0 node and its parent look as follows:

pcie@11e40000 {
    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;
    };
};

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/pci/of_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 506fcd507113..8dfed096326f 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 		}
 		of_property_read_u32(out_irq[i].np, "#address-cells",
 				     &addr_sz[i]);
+
+		/*
+		 * Restore the arguments of the next level parent if a map
+		 * was found.
+		 */
+		out_irq[i].np = pnode;
+		out_irq[i].args_count = 1;
+		out_irq[i].args[0] = pin;
 	}
 
 	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
-- 
2.43.0


