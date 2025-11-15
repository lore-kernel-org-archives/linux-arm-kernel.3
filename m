Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2577BCEB2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucj2p+rgYAXgwVH9kYepl5CbaaWyr15G4v4y10s3RPA=; b=HwIX/orCoGGoRgUrTj+ncUsGUO
	2OUUjbM4tRXKaN8lWiHSnlE4sp9s7h+nGvHjqhvG7jHQltWKCcGfvsQ+KiaaH0h385yHEFD+wHbVY
	yZuU7xg7weKg2ne39x6hbcxozDr5NgqN1gm64z310HVvmAsAoFjuGKElntVb3wu3gg4ncQsx+iOW/
	OknM53wmCDNHZ6SavPPZ9wiRJ5WYqHaXLa/rd6DFvpp+5C3g2U5Z5xYbT0+X7O4+42fb4GD16nclZ
	YA8h/PM0pwZpk5GJeEQYyyHC7Ep0QE4pBLFwy8L4A0orRKZVPDfJPsw5DEZRawLYyZMgD8Ci0957X
	GGHV5BtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIg-0000000DdCO-24Z3;
	Sat, 15 Nov 2025 09:10:30 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIb-0000000DdAQ-0CJF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:10:27 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so1740720a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197824; x=1763802624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucj2p+rgYAXgwVH9kYepl5CbaaWyr15G4v4y10s3RPA=;
        b=AXWetfvpMLpUD58qZymDptEUnSxKacSUbuM+FjaXRzMkQgZr9OA06xzAEzTQfJIqZ4
         z/LLOxvAJvRAe1cMsvI9DRbp4ik4OmR2UkJol21RPO43Lbtqqv7nvHe+0owObU0BeFOT
         yX60MVFz/oHoQXA/mnbTPzGJnUM4+fE1IhsBRcQkrUMtVCD8uPWR2caY4t5lXF9RSe6C
         sb77NLf9KPpqUfZJ6G7UyleChZeArZmGAmgz83iTVuaR1fGRllTpe8bN8RMeroBFDsIO
         aMKp9OYRWnrLyUYK5/qJjxQ3h52nzgtSs87OK+iDsKroQRRDnPTdBlXKS45euQIPdhBq
         qFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197824; x=1763802624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucj2p+rgYAXgwVH9kYepl5CbaaWyr15G4v4y10s3RPA=;
        b=rhuegUPpC7Bq2GnJKxdlZ/91PBfVCPA0rp+VSjJcswHRwsmytyBx/uBnkmOtWxBS8p
         RWdFL5mkjTrR3kRjk487tYlX1W3xnDkEXT8Eg4kYm6ZDNnDttY3CbRpCQpjPndfTFQCx
         agHWa+betUvjHXqJiz9QmMONN3wgbGpnSUDUFJup+TLKu+OsOSkxDNZ40K7R9aeXGpQo
         RwOQjH7JxvlpvjbTOxzRHTKFqIGuYy87FeNa+bo0A6Rafx6WMKdYWdgfHzo78dos71yG
         xYzw9xZl1xyOlZK5KGC28chVk3JkKbbgkxUfRrcwYalNt2xFMu1irxLwAXn8jmPxf2uZ
         Ttuw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZw2mLLUZtvuWlecNWOQqr9B9iQJNc3TAUKFzptm1sHedqNlPKnQqGWsOF3IIhyTmNIXBu6uHTbYa3A/5OlN5@lists.infradead.org
X-Gm-Message-State: AOJu0YxqiNlNl08p79SgWXkoQHXK9LUvx1DmNMTS3mNab7Qst/c4yoep
	PoO73jRcIXm9xrD2rn3yyb6zhK6QpxoMamtAxzOvXgCJNwl656gRQKXg
X-Gm-Gg: ASbGncvJklvoAwU9MbeuNHqiU20c/Vd3NcHlgx2GjAd3yIrW3JVjppoUZYWbl8e9MUD
	JshWtKxiLpnV4gx+uexXpCJ21sH6OI2Mg0LEmFaZbRRQ/6DdhAmaheh/E3b3Ph5iKT5IqnXup+g
	jZvHHbjMvGA6fDeq8q/zKfbYlKx2U28GfCuNzndDmlz/7N5Je6tOSJbgPFhRpg4dHTrcBKLw/Nz
	RGz/Xt/HqSWaHgjKGhiFnZBMWW0OJitxKtgfCbN0gUAh/gJ/Obu8Etalg53j8NAMu/RGHLwNISd
	FOQdw7d7Xbk0T0pvM3rts3bY2e1Ljftp8qpwTxuojmayN+4AP7kwfsSpzF1wPHclTlPDaYUW9ei
	F2aCw+9yjACJ93fIf/n6m2wBulCE75Jn9sh5cz/YALjWnTDVVolpRUG85f9BeLSiDqPFfGZJcgg
	==
X-Google-Smtp-Source: AGHT+IFdOsYpOF/1IoUjLFcOg8Bhmt7xGXHygPshYo3UvTQSI65Ig5BIOny2NN8RVI+eyWKKQcuUNQ==
X-Received: by 2002:a05:7022:688a:b0:119:e56b:9899 with SMTP id a92af1059eb24-11b40b3420cmr2866205c88.0.1763197824064;
        Sat, 15 Nov 2025 01:10:24 -0800 (PST)
Received: from geday ([2804:7f2:800b:a07a::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885c0sm23408196c88.3.2025.11.15.01.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:10:23 -0800 (PST)
Date: Sat, 15 Nov 2025 06:10:17 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH 1/3] PCI: rockchip: warn of danger of 5.0 GT/s speeds
Message-ID: <d6593ae4f59468f294fdddfef83791e0db100e13.1763197368.git.geraldogabriel@gmail.com>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763197368.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_011025_384833_88E7106E 
X-CRM114-Status: GOOD (  14.47  )
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

Shawn Lin from Rockchip has reiterated that there may be danger in using
their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT change
from the default and at the same time, drive at 2.5 GT/s only, in case
the DT max-link-speed property is invalid or inexistent.

Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da378805..ed67886a6d43 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -66,8 +66,12 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip->link_gen = of_pci_get_max_link_speed(node);
-	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
-		rockchip->link_gen = 2;
+	if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
+		rockchip->link_gen = 1;
+		dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
+	}
+	else if (rockchip->link_gen == 2)
+		dev_warn(dev, "5.0 GT/s may lead to catastrophic failure\n");
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
-- 
2.49.0


