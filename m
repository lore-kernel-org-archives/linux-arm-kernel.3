Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96819FD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmPKR2Yyu/CowlCAVgHjCUwCb1vpQWAYSrI2qG/n3xg=; b=QXJdAcXDlbyfRVY0Ubqiq4N+qJ
	XENJBBmu9dJnY70Nf+1E10GAccCZCfH5KsLEiVqKHWEhdVIlX1kCAHMNZ1r3EORlbpMKDH/ePEyQC
	giiNBxYbiuS8kXY/oRIjJaz2GvdAL6X9fwSt+rzMNDMoqacfAunMOssKSJheXoaMZW48s/BuEkeKl
	ZbLvvAGGoVJSpU/f+OOQkvBU6OGR8s/mWE3DsBmlxkg0GChWP7rfOkGvL5RtR6g2eVpfKr6t61y4W
	rbPAyW1c3aFdAa4/43VUGKU7MvhQeDYbOiQ9Dfc3wIxHD8tU5apmBs6BR2J7qbf7mmiAZbMPaWyxe
	xtiurUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqX1-00000007jQP-2rIf;
	Fri, 27 Feb 2026 05:36:55 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWy-00000007jNs-3TrB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:36:54 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-56a87d7c5d7so1398608e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170611; x=1772775411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmPKR2Yyu/CowlCAVgHjCUwCb1vpQWAYSrI2qG/n3xg=;
        b=SufqiQniOnBMdLVMSGaWjsPGEW9StLfiyEaf0GpP5Pp2/bSE3Y/NxGlLkL/ErGwAT3
         E3DHGR4AIMxXANtSxbxqg3sIMmX4ZDB0eyjfCocCnzTQqs1LmZqlwVAA6InovpWLL7Ze
         mzaurMIeiKhqQ7Zhocjxf5LdWibh4JIBAinsAsf1iBPLlj79KDVn7Oi6uHgSDggOAnIz
         1Nw2vzwyo6BMjthWr+I/9lG+rWjZxuiTkr2ZTKFa4RQESBgJprI18678VCHFGaH6+kGi
         WOzSIwusYHEtLcJrAoi11ScV38y5urqRY9S7afTDh4RWLiqbqGgHBT7GweSVq+zdFoY/
         u8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170611; x=1772775411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmPKR2Yyu/CowlCAVgHjCUwCb1vpQWAYSrI2qG/n3xg=;
        b=Vw6bGJMOq0nVfa38RRLxHklZSQLOVbbmubnvnGJYYER6Wo4jdYhO6X3hvuplSG+yTV
         xo6+X5QRP1AYSnbagE7cXTzDyj8mxrgg/MNm59c7cgvkfvH1nlEaylptSI4YJzRXI6/j
         JEV05snlitRe6r55s0WjdEPrS/sQc7R8o6DStGkmt4UYPPk5luAvdeZk+4Wbf2Xqsvi0
         zkiw8r5QUcwaO/3rjR2GJ6Q3kb+OFoonNH8RA31enE1m+GFdJnLA5bnRLDgn9tliCjM6
         WEJ1m0L6UQMSMKNpKJ6kV7ZZzd37gqo74VQsZWScHPC1x5/D146vx334TQnmSuwZ+xXS
         nrCA==
X-Forwarded-Encrypted: i=1; AJvYcCUSgoIsG0VZ3SwxuVaqkCtgu9NAR9nF8oezHGf1WgN/EEoZQCUMIFLdTTMNmGjn34oFL3+KUG0mxJ6Fho3TgWqa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5O+hDfCaip3vTG1auB71gyHIgkpZaQmZziD+aNrY96Y9q9x3C
	3QtsbfBdtxJa/DlHKu8cQ2FHfBli0m3WfPUxCRFzcCAM8sAcv4GESgM4t9jb4K1b
X-Gm-Gg: ATEYQzz2OmmNUyZqiAGC5ZROszBKeNpMtF2eSCN2qbmGVK9Fnm+LO0dbtzI2UNHLBje
	TfCSaK9Sl3pKlZuAuMI0MJ10X5ZTJpzK4igZO2jzYCTEdbBKQ2GVVYe+mO3u3EtET4uG1AgU9wN
	7sLX73fshNG8EGzRukz66dRXJEI7g26QsU6nvaNfNFdTRwlNtyOurI0qJ+JqtpXtWd7Nz2/c+qw
	U6A3szbiTreRIPol5gishInsNFN2KmKfrPjWF5oYnZStIOeuwHTS9lmgrvg5IaGhlFCCOJYs+j2
	lkwL11OrVaZHOsJKMzx+fq2QRCbdMaPUonVzVClju98qXjALIK/hVmkvoo6DkXTxzXjQ4g4udrz
	lBEMY5gGEYwlEBaGX788y0fPSMYWlo6tnMQJGFw32YPg3xKXKXtdAy1ppenOhCpqtnlcFfl1Emu
	hzWOH5NIgsfLP84dbxvatF
X-Received: by 2002:a05:6102:32d1:b0:5ff:a1e:ee66 with SMTP id ada2fe7eead31-5ff32271334mr1111779137.2.1772170611497;
        Thu, 26 Feb 2026 21:36:51 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e3e6013sm4496101137.0.2026.02.26.21.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:36:51 -0800 (PST)
Date: Fri, 27 Feb 2026 02:36:44 -0300
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
Subject: [PATCH v4 4/4] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
Message-ID: <c51c804bea56d772a59fd29fcb080541b7a367d2.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772169998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213652_877530_88140485 
X-CRM114-Status: GOOD (  15.48  )
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

Drop the 5.0 GT/s Link Speed retraining code block from Rockchip PCIe
header definitions. The reason is that Shawn Lin from Rockchip has
reiterated that there may be danger of "catastrophic failure" in
using their PCIe with 5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper
errata, and the particulars are thus unknown, this may cause data
loss or worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 799461335762..9ebc227a1ef8 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -553,19 +553,6 @@ static void rockchip_pcie_ep_link_training(struct work_struct *work)
 	if (ret)
 		goto again;
 
-	/*
-	 * Check the current speed: if gen2 speed was requested and we are not
-	 * at gen2 speed yet, retrain again for gen2.
-	 */
-	val = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
-	if (!PCIE_LINK_IS_GEN2(val) && rockchip->link_gen == 2) {
-		/* Enable retrain for gen2 */
-		rockchip_pcie_ep_retrain_link(rockchip);
-		readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
-				   val, PCIE_LINK_IS_GEN2(val), 50,
-				   LINK_TRAIN_TIMEOUT);
-	}
-
 	/* Check again that the link is up */
 	if (!rockchip_pcie_ep_link_up(rockchip))
 		goto again;
-- 
2.52.0


