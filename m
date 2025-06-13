Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26EC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=; b=4PKOcjgOk4l3ZZmGtmQMnGQl7Y
	P9Aa46WGIyNcYDMEmTVTs7+iBasFTKo3EOTFlHM/aMN2IQmHLq1eDaA6uqCukQHG9kDgIDbHyiSPV
	2M4upB/jeUSfFDJjjzkTsJIbkhMm7rBxv/1IBFudwOg1kQDyJDJzJAiwI45HCsOsql+nUHJD9FwNk
	Ky7SNqEb1eplQOonHAxavVM7ztvD749RvwCzYx3K8Et4PF3lDVjFzrxPq/OOVHS4h5tEg1XKJUX4r
	xakfDR18kYtRNJbu/pPB+aPf0sb+Fe9BdCSPfpKHgCPKdtiRxCkLsuO2hqbvs7nKODGSHEMQjzn37
	JElew4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6lB-0000000GyNV-33eF;
	Fri, 13 Jun 2025 15:56:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5i5-0000000Gl7o-0PiK;
	Fri, 13 Jun 2025 14:48:50 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74877ac9d42so1529420b3a.1;
        Fri, 13 Jun 2025 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826128; x=1750430928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=So7wehG3aujX/cNR4lELBLrB6aZnGQ+/8l19+sro4Bh9cxjWJPPew1ttcnnsqvhK9t
         hqC09u0SrNmJ7YIghf7Vu/0zuonanQWvlNgmCiWEIYG0f0rLobH5lik8zmzEI255LzZW
         DSIKb8JQLKY1DZjTBs4JIiCQhV6FsN2l8gDbYh+TtEf7jKNQkc55t85C9DeAAiG90DBO
         dgtitcI8Cq+jZMEOGY9mS4gz+GVtBdDtztNRKHpXIeVQgFEic2wR0foG2wdF5HWpjNX5
         5ucFIH9T1G3M7OpIXXk+HiDxU5a4B+gJIlSsstN99uj1+bctcSXnYcoMNRgJHfBtZJWn
         N82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826128; x=1750430928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=GhUqaU2WkX8dDV59iRjaC+LDNFzcPHDqIMXOcTlpNT0v3tqE512HewKbHx8hHmL7oK
         if+fqy//oair2391N0njDWSS4i4VOtapTKtX8XwLpWdmLxsD1vSi32hm8IO97ISnr2Si
         cKzbTeoklYPHSycDAKjjkSUiuk6WFmVRc0HAtfVhgrBI1C3vvr4pVmCKAwZMMWHV3JcK
         ZLSW7lprcRDhbXuF4/5cdwWZ+5wzjT5tGBQbhWqE9QT3bVQxVuT3C3Fg4aF+RDS+vGJr
         ilKbH0zEZCuby36NNwyKkSJ9OCrxQZkmGvqEC4B7zYL+4bLTa5KNfwsG//onQqa5Ibe/
         USCA==
X-Forwarded-Encrypted: i=1; AJvYcCUzgH3KuA4q8ReLmGWIBk6imynS8MAKmCqmqNbidBGMvWb6Ux8lrPINyAhcfr/VDKIcP4FJznBF/+Dp@lists.infradead.org, AJvYcCXWaKkiPd1ras3QHLTFco5duf02fj/qgYqcbPNVXb+G9psZo5vIxYYIVorlFnzLZF81L/L2BGbzfIUYvsWDQxwY@lists.infradead.org
X-Gm-Message-State: AOJu0YwCCDeXTz7oYm7EDr/BAonjZ/grCiYBqIay3Fi2eYbaNHUsFupv
	jTjogwfKAd94yf6C2NfkW25hJPbfJp1Lxwv45RICjvq6apTX7GUJJZxEQiO9Wzcn
X-Gm-Gg: ASbGncv8bi/jlwhXwc7KGQQiqrz8vt9kkGwJgpNVCr+jVBG8ckEWk6/3bFFT3+TOAT5
	CinOU7tg3F7rSnUBH8VUfD5rj7fyNjrO2aRt5vb1gc4mlTKjMN3VIOK9JMq4p8QGUGulkpKHq5A
	x6lzekr0vjTX0I25F7BtV9Tm4GOfiOIcnF4NjlzqbBQtznGTJRTkmoqPInCoggVBFDF88bKxn8n
	EbdzKcEZkQH2L07vABNwS/TB7pjc7xhQsmUbKjtZCj3PUFpnSxBeVSeZZ+s2f+f7/oNWIOh35Ez
	GuQdwyxWFZj/MZSbEem8Ct2by9K0aStgZ4jBIz4gv3bW3sFcww==
X-Google-Smtp-Source: AGHT+IFt4GR3YMTXjNMLs0lezTaz7ETEn/eRAqWAd2cNJwooWka4aI3k3Y5G9iM40lPJlQBBHOCxFg==
X-Received: by 2002:a05:6a00:2d8e:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7488f6e49f9mr4575274b3a.1.1749826128253;
        Fri, 13 Jun 2025 07:48:48 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083034sm1728624b3a.98.2025.06.13.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:48:47 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:48:42 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/4] PCI: rockchip: Drop unused custom registers and
 bitfields
Message-ID: <ed25d30f2761e963164efffcfbe35502feb3adc2.1749825317.git.geraldogabriel@gmail.com>
References: <cover.1749825317.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749825317.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074849_164013_2E871DE9 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Since we are now using standard PCIe defines, drop
unused custom-defined ones, which are now referenced
from offset at added Capabilities Register.

Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 5864a20323f2..f611599988d7 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -155,16 +155,7 @@
 #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
-#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
-#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
-#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
-#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
-#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
-#define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
-#define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
-#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
-#define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
-#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
-- 
2.49.0


