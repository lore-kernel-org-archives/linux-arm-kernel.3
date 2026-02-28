Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5491048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Cy6OANas5Ke7+g7WCbIZUx6sasEupi+10uNQ6dOOFA=; b=giZusMnSwattFW4e1NOXJCXNiV
	itUGONm9QJOusvKhFHjwBD+OB/8ZdQFMMKAbQoRWtwRQ0rTYzafQvrh3yknee4PQiyoUmWVc+k8ZL
	KsWs43YmjsMnXJIb5mmyZuThcNzH8TBJ71aTKeGCUNtYZGmQmNAi/fjUpNVZ0F2NrEkmkKGLugthr
	T4JMTt8plmjAubr7TpZbmoykDfLF8To+5cVoqf3BeGz9fOoSlGlHiy+7oM6/qfslB8X3QMGlJ/M8q
	KPU330pSXkzPYyDHe1wAs5S6gsrZcQgJvJbQM/472oG9LLdEayko+GD5XYMq2JIiNMkjgsmEIYzYg
	JGD2jBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8cR-00000009Lxp-0ADZ;
	Sat, 28 Feb 2026 00:55:43 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8cO-00000009Lvt-2VeM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:55:41 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-56a973a7bdfso2476865e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 16:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772240139; x=1772844939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Cy6OANas5Ke7+g7WCbIZUx6sasEupi+10uNQ6dOOFA=;
        b=Bcw/KZvFVl0ZgP2VwS0NjlKmWF9PNkLeZ0ozhCgvrfl5YyzFj6ObQH/8xeJ+lkW7Yj
         nrG0DPb9xDbWCc7PTKzg0jvILbFZP7x3gscdT61bAMhsemwtNIk/+w70WmkVfDkH+rAk
         s0x9kaIg4nVwlStKhk3QY264gZP1l8dmwOuqQ7t/W1g9VLyTSZIhj7eMzuCRMva2Axtw
         kGfH3/fwv/9BU0187HyOhDbPPUwkH22IVtbD/GhQvMvkKKlaHv8CxD4FyZBKMJwvevaE
         L0w+81Q63XKyA/rwJ965r5WbY91613oWdg/fiwEl5G7I0suKXCq8cN5qcre787DD+9kI
         tu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772240139; x=1772844939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Cy6OANas5Ke7+g7WCbIZUx6sasEupi+10uNQ6dOOFA=;
        b=pXl2MAVrQiSJ76fT3UxVl8bEUaRlc8boohM2X4bkgxJ90qnywB48oZPAM6jKs+nTZT
         mlz2bRST8EaRdyrPgS/tjcvRdCr3eTnbF5y4BtPVjcX2czg1X+lGtpjTz8t9mbr44OZ0
         OReGMwovrtLJNptPHlyPj3TWlsg9aDTvQmQgSDC5JpC6hettbeaoU6jsNRsgIiUCoYGM
         23jhU1v3rOENXEhN2FcgW4LUaRnSxSACfC7ZTST7LNsam0AHTd/NwM7oQCZjyeHkIuMG
         PUyy7+PQzVl9n1Yd4QfPxgzSJLdmA8VEpebn9GnS94ZSd4bA6TL063oKCdZq5e5YdGIn
         Ip2w==
X-Forwarded-Encrypted: i=1; AJvYcCWvlDC98OBjv8ePnt7uJeOOvn/jpv9ba9ZfOYYTr57l3unSot+oXDC0acQi5ivjzJncFo9I/UBeMbc244Yn/PZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yybqy44U7HShfGzAaotJnHd5EA41Fc23T0J+AVgcyK42dv9HE+Z
	lIE3vEsAqEEAo83VuWhAKpsk4EqCjnXj7JY+Lz0A0jjZdan6afYm47Vr
X-Gm-Gg: ATEYQzxdfG+VVHtm16RY2Hx4OlMhCRF7Wygt+ceWtMlJt06CdKsZqteO/U+z6snLx0H
	ku9IidXYS897d7UhTsmJDGMSVNArJvPl/K0HrtZ8FbcORLZxupG6ZbS7n0g/JRPhH1cAb/pf2s6
	hwhksaSir4k70250zz1qAn0RNMquSv4yaAWIk32BLr91sHGa0wmJJ0sdYYSjfqacFOF+tnZuL3Z
	pjpK+MDu5sMtdton/fFfux+aaDv06Ai8X8HAwl5kXtq0X0APpaj4Pl2vuhfZaGyCwKOKS1TYY3v
	E+Th27BR+dIK6nrSter7II28O6jLpvBqN5dArmQAfnzrOPoZQuw7Zzxixog/6tiv1+SDK2qpL6e
	TTyxVIjtzaX9XQi/wmSpua5lSS17RCliSWIbCrcecv7Jf9z+kJjU9rPA/XVdcolbP/+LgH4qf4f
	pj57q50pzOqw==
X-Received: by 2002:a05:6122:6992:b0:557:c6d3:5c0f with SMTP id 71dfb90a1353d-56aa0a941c7mr3144441e0c.13.1772240139485;
        Fri, 27 Feb 2026 16:55:39 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm8234832e0c.18.2026.02.27.16.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:55:39 -0800 (PST)
Date: Fri, 27 Feb 2026 21:55:33 -0300
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
Subject: [PATCH v5 3/4] PCI: rockchip: drive at 2.5 GT/s, error other speeds
Message-ID: <2a0a4aa97bb8b0cb511cb651c5d66c9ec8bab97a.1772239598.git.geraldogabriel@gmail.com>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772239598.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_165540_644338_BD7140AC 
X-CRM114-Status: GOOD (  15.84  )
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

Configure the core to be driven at 2.5 GT/s Link Speed and ignore
any other speed with a warning. The reason is that Shawn Lin from
Rockchip has reiterated that there may be danger of "catastrophic
failure" in using their PCIe with 5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da378805..2f211d1f4c7c 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -66,8 +66,10 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip->link_gen = of_pci_get_max_link_speed(node);
-	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
-		rockchip->link_gen = 2;
+	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2) {
+		rockchip->link_gen = 1;
+		dev_warn(dev, "invalid max-link-speed, fix your DT\n");
+	}
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
@@ -147,12 +149,13 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		goto err_exit_phy;
 	}
 
-	if (rockchip->link_gen == 2)
-		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
-				    PCIE_CLIENT_CONFIG);
-	else
+	if (rockchip->link_gen == 2) {
+		/* 5.0 GT/s may cause catastrophic failure for this core */
+		dev_warn(dev, "5.0 GT/s may cause data loss or worse\n");
+	} else {
 		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
 				    PCIE_CLIENT_CONFIG);
+	}
 
 	regs = PCIE_CLIENT_ARI_ENABLE |
 	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
-- 
2.52.0


