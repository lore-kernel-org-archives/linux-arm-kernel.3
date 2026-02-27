Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B755FD9E3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDesqVRO1Tim7+gISdrskbEX51kvM+tTCym0v98yq+w=; b=FbQHbMPF2HtokDBAA9J6nd0Aq+
	KSNaAbnaaIUDdWsvwJNutyc6+2+uyji9+UIR4aKuLabdioE2Tr5xJSpCe3/YL//I0LNX1K7Xz3GpN
	vJPbQtt2dfw3l+Fs+BlDj4LXzwpr2XBnOcUihYIs1K6iF7hYBO3Zhnc5UR31PpgjzYyn/hp7LiIPp
	lZqtIkgXbG+iirfaht/0CkNO30MfAWq9G35LmYwA2Go6NiqFa2vwgR49vQOZrB216kYgyksgIq/rl
	yvbXJApkDJUAu5ZxlXNyrFvGsKloKLuh0uVbjkmbeZXRRpueNw8vbWJSH+tv+vNoiKDy7p1kBm50G
	JGXr8TxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWG-00000007j4w-3qxj;
	Fri, 27 Feb 2026 05:36:08 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWC-00000007j3U-0SYn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:36:05 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-94dd05a4b44so934223241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170563; x=1772775363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDesqVRO1Tim7+gISdrskbEX51kvM+tTCym0v98yq+w=;
        b=Kp90cAWmf4QjVBTC7YWLnVsgmIYiYu47otop+8O+YZBfrfi6ACI8SZGoxbgBgRwys+
         KJ3QuW8QRDZXuAKLbGMPLdVhrQULybUsetxOtk97QewPvAqlGpc9V0Q0YsEwkbEIyyI1
         J0S4ED6Y7rlSmY547jOKhbQno0uYwp1cRrEbdee1AY0yWXNJLKB/q9IWkIXN19qkh/lO
         z/M1isR2XHL2AKy6MEWny4jPBoDu3Z/eYCl+fPbOyjoOyZx7R6po9znH8Y6rM/HIiqgo
         1otYCFqRlA3e43e2QaZv4p4SW1C+LYZJDlOHtAqW/zKK0/sBW3O/YRN3iWNcOtxDvID9
         Yt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170563; x=1772775363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDesqVRO1Tim7+gISdrskbEX51kvM+tTCym0v98yq+w=;
        b=vF8qvy/LHnsR71J+n3ABhe72772vKkRa0VJSotv+KUGy7N9kGcow0KIIN3NiKKWtP3
         lGaxUAq9hIU96tVQVPYegkmAOZKlFGXs1G9iMe1eUoBYFrxkUjghj+WzCm4Smyp30ros
         nGUxCL8z9WMgO9ISJfHPjSqowkfy5MAPjmtaQihwHZhOBl0KJoYTY0cMGd3+bU4eG+2a
         ie5AvZ8/IF1gjyKdV9hjFLIFwZdJqCBrfMmVxAgKupudv+Ckl7fB9bjDPaTyJ/ucseKT
         vFsDarThi/hHoaiVFlgQfTWkEfaKqfaOM21eCfmgFOhE3l8dPzKumlF2A+U9b+ZLvUHC
         6bxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeFOzJqWmJncyULdr/dQfWeV0Y2eU6+1Ssja4MTvVOiGHyCh/Tdc87VVvJ5XbkBVQSKXyoLfr3y1D5JI5xYZDF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo5szpFDSNnYPF3ccJ/nPG7B+BN6g9y81kfbYI0TdGF4qaIHhM
	ZEDbXqdAKgMNTHrwikdo9Sley8s+MCoSkQfpZtHD0Tn6RRVmx4FIayjDSvPlLIht
X-Gm-Gg: ATEYQzzRey6VXNf1ttQ+wM6Cu6uMQgv0hUL3VKOfjnCvNzZpMvMI2l6NGcTkfDfhhag
	GZECU6pBLJG2Rg4f40Frb452qEpNjuARNHbozBLZe2ZJ/ITyt8x0MrFC2mLSqpVIH4E/REVdbR3
	HHNI2uI1WnW6NPhq/Tug8AK6WuVTnnI0eegtQdi6NoW4vpb73/jmiaen51KWpbyGfMId4vJoLit
	RNxnBr/G8ddbBUwVX5UUM9dePafpcag0GgwQOomQNYwWexIOJIx/oKxt5E7M4c9VMhECBYIwInZ
	y06fy8gHGAtOt8ZuaAKrCA7kXsQ74wyIiSCOSeMID5GJgCuThY/JftGmbIblqTduGJeSXqe50yu
	bKYRtV6OJWg7h0hHLkhoazaqdj9CbhWA6XZLeUiS0oggaqDDVlkHx8DSVrDFIY5F/bp5AQFtFKY
	9AYBCRbbjGwg==
X-Received: by 2002:a05:6102:a48:b0:5ff:11dc:2ed7 with SMTP id ada2fe7eead31-5ff33712140mr755878137.16.1772170562643;
        Thu, 26 Feb 2026 21:36:02 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea1596asm4361324137.9.2026.02.26.21.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:36:01 -0800 (PST)
Date: Fri, 27 Feb 2026 02:35:54 -0300
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
Subject: [PATCH v4 1/4] PCI: rockchip: drop 2.5 GT/s defines
Message-ID: <5172389ba8d291fe05bc0887bc97fe73f110c5c0.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772169998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213604_146962_6539BCF9 
X-CRM114-Status: GOOD (  12.02  )
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

Drop the 2.5 GT/s Link Speed defines from Rockchip PCIe header
definitions. The reason is that Shawn Lin from Rockchip has
reiterated that there may be danger of "catastrophic failure"
in using their PCIe with 5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper
errata, and the particulars are thus unknown, this may cause
data loss or worse.

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
 drivers/pci/controller/pcie-rockchip.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 3e82a69b9c00..b5da15601b58 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -42,7 +42,6 @@
 #define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
 #define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
 #define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
-#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
 #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
 #define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
 #define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
@@ -197,8 +196,6 @@
 	(((x) & PCIE_CORE_PL_CONF_LS_MASK) == PCIE_CORE_PL_CONF_LS_READY)
 #define PCIE_LINK_UP(x) \
 	(((x) & PCIE_CLIENT_LINK_STATUS_MASK) == PCIE_CLIENT_LINK_STATUS_UP)
-#define PCIE_LINK_IS_GEN2(x) \
-	(((x) & PCIE_CORE_PL_CONF_SPEED_MASK) == PCIE_CORE_PL_CONF_SPEED_5G)
 
 #define RC_REGION_0_ADDR_TRANS_H		0x00000000
 #define RC_REGION_0_ADDR_TRANS_L		0x00000000
-- 
2.52.0


