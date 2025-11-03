Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0367DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGQSi9N7yhCq+36qhzFLEOuP4uo/epjBJB4vjqFx0/0=; b=IJDrXwglU/NNNrIpkjqJRxe/jc
	tG7n5w8yODN5on1dQ4aEHK1s571JDSy2vKtCUotQ6SHzp/E7E/ANH0TApHDgwkQc/R2cn/vbNxLZC
	e8gwv1rCJjjTzX7OBOhmJygDb8mVftf2krf2FDGiMX4nrCqa40FbyFIpVVSWqrZkcxSt8xrYWxS+k
	p681qEM5LhCXCJAJTVVmmtZCpKY56SB9SIFrIDksjt8AuOOXHAcQSXo12SyYSNXI+9y/T2Y4rAonF
	I2DIhJqY868Vp8Q52twpit/eYIcefPeFBP8uDEyLQV4gPzFCCUnNmZLDlmc8ToZvzl6WhOOftSRkr
	4tLxEI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo2Q-00000009IQ7-23lK;
	Mon, 03 Nov 2025 06:27:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo2O-00000009IP4-1ALt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 06:27:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so2612023a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151252; x=1762756052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGQSi9N7yhCq+36qhzFLEOuP4uo/epjBJB4vjqFx0/0=;
        b=iF4CL2d/lDgTQ6lt5wOqQvYYQ2A5cu7h4c7DDWRDEha9eexD7/Hana814TaYJI98nu
         BcGS5f1XoOCTjgRWUzOtITFIPByq8y7gJrE5hrCRvJy+LNF9IWSiZCJLO1G1Q6ocxT9s
         Ay+GcZjsgYcUlWpzejd78WX+svIAoUb4gnmVbqR60ZkZJ4o7IqmGny4niNh99Xx/FQEG
         L7WGQusYqhfHblQC/WoAcczluirMS49j0R2FMOTotWcNF/MSUQ4PalXrt3EHRFZ8d+qH
         QK78LMbydjcS27aYWiV2/PS8vtkIJrMCVOwuaL7BcwJHgQHytSwb4UTcWhJcwcPF3g4n
         X9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151252; x=1762756052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGQSi9N7yhCq+36qhzFLEOuP4uo/epjBJB4vjqFx0/0=;
        b=py6HjeHWnWC6wWx79W85o6EuGsnE5oBY40t+wf01cj7BILX8K5NtTzrVDMvXifixaP
         6OxbWeQaSK1aR5r2TjNM+f0uNPkFxf92cLYhcvE6wtJDwsNwKhGPByXsSxnvOJHy2Tkj
         Ztx8bh3NZdGcIyKRBQf4DyZFIR7NzDAxi2hBq56M8MZ33ahGiDoA2hX+S9vIQyiDoMzV
         ATix70NnHjPqkeH8NcNCMfPK5iKis6OQSd+Ctu+xDBE9ule/Zy4WCi4rNk7OvPM/Ymjr
         o6Cld2Q/qK1HOc4fY3ZUey342xqjAvyRgYLHsgWG3ECTmLzhpZFBBx4KfkISUjFxATAs
         jIqA==
X-Forwarded-Encrypted: i=1; AJvYcCUNQeZrj1pELPrNOgAlbtybzmI3vNzkPWXWHup7jWzg7sni8X4dm7yjmuc9oHzZ4SBP+i0vH75PmHopYpo3b84U@lists.infradead.org
X-Gm-Message-State: AOJu0YxNdFgSLA3cS9G55tjy0//sb14eqNpembE++UeU/tdncu4UPSWb
	MMoglVtzivgtXB8eoaDVtEQOfKYDcWqYxaaJWLUBRRL1MvwVyYB9lUEk
X-Gm-Gg: ASbGncueS6YI7/Q9xdTNEAHyfcTH5vcv2B8apk2DCY/+YJajW97Lr9elmCMhreayeJG
	kU+vVZAzM3l7u65BkwhA9CroadbB6mJaoWZRExr9iAMFyrDRXYeAmQQXU645AlJ29Qe+9iiFWMP
	/BvdivySHe//l4USXNtzWZxnZgoP1Crz/dK+dBHRJmowC2UIwiogAaSFYg+zn60mHgmuwXWg/ax
	zvuhAJi8lulg0uCxYn+IHhaHob4c3tz2l0I9aZI7UymoCr/SfGJQhvzZOAGw6U2r72PCcMOEIcy
	7S2Jg4Z4tLFDxe3c/StO0fvQtG8akI0jC2m2ccqv69plb/7zOZNxUn3VsBYw3ywEv6Zvd34vq43
	k4RwS2sJjLxFXKBn+cDOI2+XX6mXl5aqdP7AiNTRWfR0ybyNh76W3ZvEGU/27NVYnTfhxUw5oLU
	CWIHTGBvv9
X-Google-Smtp-Source: AGHT+IHygtYx3odpw3ozCs9WNVhh+vHH36qWHi9VL4Po+sTq1elwFX207ryIat6ht5qVwQ7NnSvjZw==
X-Received: by 2002:a17:902:f709:b0:290:29ba:340f with SMTP id d9443c01a7336-2951a47798amr138513945ad.42.1762151251610;
        Sun, 02 Nov 2025 22:27:31 -0800 (PST)
Received: from geday ([2804:7f2:800b:fff9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29564fb5214sm63355205ad.11.2025.11.02.22.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:27:31 -0800 (PST)
Date: Mon, 3 Nov 2025 03:27:25 -0300
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
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
References: <cover.1762150971.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1762150971.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_222732_324719_8C927E32 
X-CRM114-Status: GOOD (  11.55  )
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

With this change PCIe will complete link-training with a known quirky
device - Samsung OEM PM981a SSD. This is completely against the PCIe
spec and yet it works as long as the power regulator for 3v3 PCIe
power is not defined as always-on or boot-on.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..6add0faf6dc9 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -314,7 +314,6 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
-- 
2.49.0


