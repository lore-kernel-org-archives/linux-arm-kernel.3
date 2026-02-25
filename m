Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37B9FD45F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uboqhfp40Aonx6VAcop9KiDSGvsRTqn5HTahIQ0GvEU=; b=uB05JgHgbZ57JXGg7GNh8M84dp
	ASu5ZSXWSxc+dJe5BR8gPwyuBjBJqJrLOK450eEPLFc+KLPez+pUYf+vQ0YaEldmw9m4nvcYDwSRb
	5S8Kt8iCp1da2Qlud/OfWwSmwbVZlcw32YI0otvhTQ41OyHVsg5V9tYe7OxLOaoqDAC5R6MjlOXfM
	yFCyvxDwfuuXaAIWT/LmQh81skCUa3LPMmAHDxlsEvF96V6Pj/D3ocablbbj2SAypeuyeMk33iYyl
	DJqhiYMZUh1qO3tFREDGiLWy8SdbdOFaOcLWLiR7zBuqVnq+rSCU1IjjVbBNU2sTmLHIreYJ7uK1o
	sXpAzYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNLq-00000005095-0CPI;
	Wed, 25 Feb 2026 22:27:26 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNLn-0000000507w-0xpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 22:27:24 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-5ff196450feso160484137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058442; x=1772663242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uboqhfp40Aonx6VAcop9KiDSGvsRTqn5HTahIQ0GvEU=;
        b=apwG6/souPRhSsyyhT2f517i9D7ZtpbxpacjpnB03LAFrR9RuRyZbOj+Ley+8C05Rb
         5IMxYK8A7Z7lJVkRGcpdMP+cAnvEJUQ8jK9VW74qcBZRjzw2ojwsc8rJVE8uXh6eAsgy
         IJrffeqFWts+h3Vil1xgsmadQwukYZpPk03B2HBJriXdWd3xETPafGZux0Kd4sTlDi2x
         FS47qstYGfPu/UMSr3wqEUcO2iSEfsMlm43spAPDQMRwiURrqHZyQ9OZisc1kUTQ8/UT
         r0hZja5DrgXF/CYD6+gGFhHZ9qZyDkRnbpKgHpUkShQRtNPhq+8uWIGzVkMOEjLg7dO7
         P/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058442; x=1772663242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uboqhfp40Aonx6VAcop9KiDSGvsRTqn5HTahIQ0GvEU=;
        b=Gg7Yz2x05smejumYchZjks++R9zOcGFjdzmnxzhuEsDuH9C+Hhu+4nfGa4ULA3R86q
         I6+iKyGflV8NI9/tY9blh6Z9nXA3FG4Ts+xJCADbutydrMMVNe6Tup6xFItXP4LZ6IwP
         LOlPPZCclXHBUqqWiKUP73CDjmlF40dhqseENbdpjZNiZqRLFWdPBk6AJDHWxwuQDpI6
         s+SzVR6GnGQW66nQjj1HqHeylhNrF/nbi0hbzozhezaBwmeAcX7pQTsNHdldaFIwqhyE
         u1E6KOX6RfevS7i6NABmvEI4tUCcLK1CaoYmNWtWX+KWUxgtw2TxcMD5PvaNRLo5jUlU
         5Lpg==
X-Forwarded-Encrypted: i=1; AJvYcCX5SyhhZ7e9/AcRgEOGmX2dpTSkyCn4KpHBTBrnYnPpMkI6DEFB5iSJd+88YVjE285KA1jTL9ZBuL19x9Y1t/5T@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyX3mwHaOGeyI9p6c7kYzuXTg8E+OWueM39B27CFIHWTmMpQ9
	XTbn7Icgx2bDljXICjsvPqZKtL4qhBlHmKgkzWIuGnx0C6dO4Ju95igl
X-Gm-Gg: ATEYQzyDUdATJFpJ114gN0A2LvGGKlGX/r7l8kPE2tjlxPEHXLaBbosYKWiN5N763Os
	7RJCOVEQGQ4kDpg2X4252BAQiqY9LCEQElWkeD1Uog1oXMhe4DOcfzZ5COoXIE9UnYyjBuHcFRg
	KaTr+o+Gx7C3wx5AOpzfRM+cBRjrlsVkgBWKxAJahswL9mGtJLMEBzVgc4fgtL90/BvHMVBJxnj
	2fK+i4cnhV5++hFttvloV5M9z4PqbntANOjewpVSfXungcBabvvHIyTnBPvRaKWVTvIWOo3zIkb
	N9CxqyLDWSezgVYW9B6eLUrN/ij62GI0I0xGGO6sof1n4ZrL4M+4jcaKHBALDe4xOqdWGirqjMR
	rA0Ut69AaX0RNNnxjovWEpugXlEvFrQEaw4Ww14txEEx3oi+tV7v9y2yVVNcxHiVDjOuYYfHHAU
	y7Ppj6lqoCeA==
X-Received: by 2002:a05:6102:c49:b0:5ef:a1ea:bd33 with SMTP id ada2fe7eead31-5ff1ce3253dmr369646137.9.1772058441734;
        Wed, 25 Feb 2026 14:27:21 -0800 (PST)
Received: from geday ([2804:7f2:800b:f14d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91659421sm593526e0c.0.2026.02.25.14.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:27:21 -0800 (PST)
Date: Wed, 25 Feb 2026 19:27:14 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] PCI: rockchip: limit RK3399 to 2.5 GT/s to avoid data
 loss
Message-ID: <6238f93890ede7726c342e81f2726c909dabbad7.1772057799.git.geraldogabriel@gmail.com>
References: <cover.1772057799.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772057799.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142723_272636_F466E4EB 
X-CRM114-Status: GOOD (  16.46  )
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

Shawn Lin from Rockchip has reiterated that there may be danger of
"catastrophic failure" in using their PCIe with 5.0 GT/s speeds.

This may cause data loss or worse. Warn the user if they make a DT
change from the default and drive at 2.5 GT/s only, even if the DT
max-link-speed property is invalid or inexistent.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da378805..25a6f67af839 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -66,8 +66,14 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip->link_gen = of_pci_get_max_link_speed(node);
-	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
-		rockchip->link_gen = 2;
+	if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
+		rockchip->link_gen = 1;
+		dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
+	}
+	else if (rockchip->link_gen == 2) {
+		rockchip->link_gen = 1;
+		dev_warn(dev, "5.0 GT/s may cause data loss, force 2.5 GT/s\n");
+	}
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
-- 
2.52.0


