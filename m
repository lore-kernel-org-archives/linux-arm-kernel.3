Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E4B1048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3by8dItpKgMsvPGS2Pus1C94W5lhtexananCbnyqhcM=; b=IcmTQWCurrN835PVaOqTC0hNK2
	4pEtj92AU1eel6ITHrxHAvWEHdWwuGsQTSRLKsOMChTCCioO2VnUZh9AH1/78H+sNzR+XDcXvAKL+
	tOrCucBg5vmvHka57wPB9wMiSVGBEQFXfaLP27eRFU9PMEettAgA9DKLMiTcuUnj72XeBFr09Pej+
	1YMg/hhtu4zCOZR/c8H9tvigh00ExXn1U6DMG1GBzqS3+L+EYH0DF24t6Wk25w46shjAaq75ZeDc2
	GwpmFpPqulfGjxd/J3gkzolXp9C8u8GYA6Nv+nwNSDMYYsDxJHx88gvXgzBgW0uwAUGThefCkbc7a
	OLOLo68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8cE-00000009Lpy-35M0;
	Sat, 28 Feb 2026 00:55:30 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8cA-00000009Lmy-3PcT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:55:28 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5674cd243d9so2830472e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 16:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772240125; x=1772844925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3by8dItpKgMsvPGS2Pus1C94W5lhtexananCbnyqhcM=;
        b=SIwTgYm1SYlRA/1P0VhzYtySV1znIeRoBthhWlKr8NKDfzBCp8djX87bLpWZ/yKFHE
         NCXCUPDB8cdnZszXN5mCo2/ardKqmHD8vRA/NuGIPaNPMu96ZLtou+vKSqgyoftR4kMT
         mXHjMGSt5DcJ9fXh9p6GYEuh5q71GQ/f0p0ZGht1Req4AX0qw+SPYn/wLqqJNukpo5hl
         pDhL1bFs12YSzl8OoVR370Y0TACR0Hv6/PSzmBGQt4XjeS2cb+qb8M4okQwRNi06hik0
         i3FhJXqEke6UB0sFKWk5MTdbikJBVtWSTYXIWei/9fqWv80eKl3MlOiBeUwzgs2DunAL
         MbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772240125; x=1772844925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3by8dItpKgMsvPGS2Pus1C94W5lhtexananCbnyqhcM=;
        b=cjQstMI31As+gbKPJAf3B4u7Jv4Y1tq766moCHntXmUn0FeiNBBUGxSkru1tkTDnlh
         w3THAYsbG8P0NXUYvmOMi+t7QjMNlF3wFS/wd4oMgYVgB0dEwJ3sjJjixcMaoQzZA6Tr
         vLp6IVwsk0kpL9MCK9sTvrO2Xe+HFEZwXNHwrOb44hL++BS6KHQGIkHZl22ejCKcxgR3
         f5zYK6FA9ypcwdUV2hGcQk14GcOVtQ6OppRyuLjDjNCB7InvtuG/ehUl3G5H2gi+gAgZ
         3uEQvGZFmiUKtmeLsgLjKkZHEm13bBAkZzxSYqYBRnddBOPggpqPvUNgcCvXkiqBbgf/
         E05Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCURZEBm4jrc804XasdtCj8XaYVBKF/l5IGar1d53KUUw0nCRBRZIV+LFgCo0fvw8H9UjNhMg210pTCCjYy+UO@lists.infradead.org
X-Gm-Message-State: AOJu0YzoeXl15/MdFVARuwyAISNEpiU26Ixub+NWP6OAeUdReSvVaeCX
	l5BeweZjPU6ceeYx6bTC4GuhUXUOb0yrckhnB7Wn6frK7nl+ZZyvtyI2
X-Gm-Gg: ATEYQzzQ+Z17f70F7V5yzwwiRvrCSwS+JlB3Uk7zDgfawKvHzvyLyzphnf4uzPWppBL
	aNANH+kfV3tcNXH7MCK8gBquVKnypH/Ijj1F/+OATYCzjtnhgDBmowt2qjvN7+EHpIlYAUP1NmZ
	nO/NTlWCtVhl0x3ELB+vzRSS2BN2KYiDjCmWM4iw8zNSEXrTJaCEcDjdAzSgei3k9l+hROdUCHN
	HWaOByx/sFiWiLIW0DT/lYq+8iOBikgw18NEo91TDuuX4OulWKibEL+SQxcnDeZZPkOSLwTd12P
	0iytFnTeAO29EbB05oIMT5t2q3l49Nyi7/aZeGJveFU273N7JZg6jTBAMUUE98yS1mb4VzQ1vXm
	jxfmhE9zQK5Q5bCpXKIV8fmy83o3IAWNM8D9d1BXTCAHcW/3RhckAq/whnQJapLVUhMOTWpAzCj
	YkHXpnP+WfKg==
X-Received: by 2002:a05:6102:3047:b0:5fe:f592:1626 with SMTP id ada2fe7eead31-5ff1cda9994mr5177242137.3.1772240125413;
        Fri, 27 Feb 2026 16:55:25 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d6695sm6182090241.1.2026.02.27.16.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:55:25 -0800 (PST)
Date: Fri, 27 Feb 2026 21:55:19 -0300
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
Subject: [PATCH v5 2/4] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
Message-ID: <4fa2c439482725bb191a225a3966300cea253db1.1772239598.git.geraldogabriel@gmail.com>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772239598.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_165526_861613_A058A867 
X-CRM114-Status: GOOD (  13.01  )
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

Drop the 5.0 GT/s Link Speed retraining from Rockchip PCIe Root
Complex Mode Operation, so called host driver.

The reason is that Shawn Lin from Rockchip has reiterated that there
may be danger of "catastrophic failure" in using their PCIe with
5.0GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..1374a2c92b56 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -328,26 +328,6 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		goto err_power_off_phy;
 	}
 
-	if (rockchip->link_gen == 2) {
-		/*
-		 * Enable retrain for gen2. This should be configured only after
-		 * gen1 finished.
-		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status &= ~PCI_EXP_LNKCTL2_TLS;
-		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-
-		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
-					 status, PCIE_LINK_IS_GEN2(status), 20,
-					 500 * USEC_PER_MSEC);
-		if (err)
-			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
-	}
-
 	/* Check the final link width from negotiated lane counter from MGMT */
 	status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
 	status = 0x1 << ((status & PCIE_CORE_PL_CONF_LANE_MASK) >>
-- 
2.52.0


