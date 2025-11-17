Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0587CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLE4Tj3ESr9ube8E0SxlookVVEHtTNDbpqvD6AIIcXk=; b=aUjapfroiYPgQnBgZnWKVUksHq
	+jNiKeGWjcVloHaIjOt9eoCihAI7Lo3V8ji6E+IjkJAV99Fytp4GIAs6YUNk4G2XvPaeRKkRXvOVn
	LOU5fPYCFwgg3T0zt7n/6FwQnfpUHFCJJzCRkcOi6ulty6Zw0LGZlXR0XJnqbZ2NygiqNxpxPii9x
	wIeCjvj9n5q5NHQayEaw6Z9wrNWibLfYlVxcu4zNBPpn86T1m9tnamU5QCDf0P+SB+aiRNcaSirrK
	RRZs3aGH9wsPbay69sTOcDf+fogRp6XnoU8Gyr2QUAwyKcMCr3JUfz2ZWFjIa7sFEdikccMDOTQ4W
	I7eH3tWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74B-0000000GtdJ-0j7J;
	Mon, 17 Nov 2025 21:47:19 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL747-0000000Gtbb-1k03
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:47:18 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4507605e19aso2393907b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763416034; x=1764020834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLE4Tj3ESr9ube8E0SxlookVVEHtTNDbpqvD6AIIcXk=;
        b=FmXM8nFMpxASjH7ZDlirKr6f7BCZUNaUWx38NVLG5fCxWpkFt+DqtPFQMTGFh4MERQ
         +xUNL19/c5jiCJuDmr23s61B4EUP9VRou4K7nbdFYV2JZuLW5y7KBisWP8Yw8DJYyw2l
         cjxGyKRAVM2Qm6yKKcoji6WoEh4Dv+Bjnz3vNZ2UjnDB+KTp4C9EQa8F+ksVxBGI1iDD
         TizMeZBFuLOWOQVZ25hmxmcakU/Oc+hGV4H7Vs5sj5zkKp06McOy9iyk6WAIMhHtbx13
         tHfGcJWIVVsmBlmFxY7yC+o4HHwbp7ePW8352Q8Nt6lCgspaUVrAsS4Y6AZz7NTggJAg
         G14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416034; x=1764020834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLE4Tj3ESr9ube8E0SxlookVVEHtTNDbpqvD6AIIcXk=;
        b=tn5zWzm6H7vIKsanuTOr6l/PpxeiunOFPLXycb/rwKN6hlSMIltWsLFf+zutSRY3eP
         DJKSrbEmfkviU7cvmqLeqfAby5V5palWNYq8LKXSRsPSevJJOXTL5PbY0tmOuBr/3PP9
         QdAG1wyBHR3jznExUrIya+2pG5ESOKBUlweeBXzwEMMYbOZAhb+gbROe2466feFWAad5
         bdi2QfelhlAD8pH8F/5Waruo/QPRNoxc5265lLpVYDZqU6o1wcbmpfN5gAC8dBBckhBE
         zxQtBUiORbB36xhLlGW5a1S42gihoMBGt2VmtnYNrduibC1aKxhON+ac1R41l3Jarcf/
         fCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUv/qgcMERB+mWZQd/jsbcE2683QE5Q4CmCcWAA5xn2bqaJgUroQP0+asMssF/4IgL0HgtUFBlA1tWydqGD/moK@lists.infradead.org
X-Gm-Message-State: AOJu0YxzI6EU++4eLin1XqEcnfwx8QH6QKbZkk7dE1o5iKy8CMjCrJcI
	F/sJipn+vR0QuJhymZe3/seByYc+k769bYqD/xYzqf6YcC9dRrll8ShI
X-Gm-Gg: ASbGncv2rrhfXBwPeiilzEfIRXCpe+V15IODM/CWX97Bs43gxumhP3NOG1mydi4GkV8
	Cs3v27BTUgevLrrZuJUWG09q75IPBEi+lP9X5R+OzqJSsQlVWEoBev4AKSV+BTtGCWbzui7SYee
	ueyCFDJilXk6Z8bsbZ4SIB5OL3qBLB3MIb3V/VrZyEA6V0ODdKA1o9fAaxZM15lqPbRR4pfdJNb
	YEVx+J+kUBitTlomjr/nwRzmE3Wis0uHCnSpeF9+6q0YAUpwEfgWpe7XCTH6eDKTolzZIv394Sp
	srAYzzFabht04olyfmown+qIESi5Q8OM5z0l63eGE0NcWGAsay7eilRrt8tGWfbcYJ6gSUqBmXq
	1UTsQvh7dZiIEAjbFZVmbNnsUN/EJtwBL6YdKOjy+YYxw+AZJ1OMW+fRcNQvIITBMnEe/EB3ANv
	28fZuDbuWk
X-Google-Smtp-Source: AGHT+IFArlQ2cA5dLvmMgTWWlBYjPL1Kt7bZiu5SvNfPraKVrXfO2Bo2fAnkStrr+f9d2tNIoobFUg==
X-Received: by 2002:a05:6808:470b:b0:438:1c76:d40 with SMTP id 5614622812f47-450973e9467mr6858397b6e.4.1763416034208;
        Mon, 17 Nov 2025 13:47:14 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65724cfa332sm4779211eaf.7.2025.11.17.13.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:47:12 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent
 damage
Message-ID: <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134716_410113_DAE2029F 
X-CRM114-Status: GOOD (  15.83  )
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
from the default and drive at 2.5 GT/s only, even if the DT
max-link-speed property is invalid or inexistent.

This change is corroborated by RK3399 official datasheet [1], which
says maximum link speed for this platform is 2.5 GT/s.

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
index 0f88da378805..992ccf4b139e 100644
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
+		dev_warn(dev, "5.0 GT/s is dangerous, set to 2.5 GT/s\n");
+	}
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
-- 
2.49.0


