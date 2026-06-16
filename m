Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031CCCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=; b=T59b6Bo9ur9KOGGYf8fhGskN1c
	yHrC0LzcnlkeKS+sYSJxo6prW5PNr5a+5wLXq7mMXIPE878JHEi73U/MAykklaZ8Wa6s7Nu7w2Aql
	gxB5n1Xk8Z5qeruglD4diJWYihs7KJTGpCz/GjK4fCmKXl/TaCpMXORJ2zOwiolOKYY1DH+PiTQEc
	ZeUMB8eQz47hZmhh1a2OV3NPxkbTFzE63M26M0F7PmhzxweWHBJ+ogdp7AODBRaGxAnaVJNmRI9po
	gJWU4v09kXHFcRENrPGrr+D8Njr/HJSADJrr3DEYeZGyLn5GRz5jqrEOf0k5bSRZd7zcc3wm0Tl8u
	SX1trxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVfX-0000000G0YQ-3H2c;
	Tue, 16 Jun 2026 15:25:39 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVfU-0000000G0We-0Dd0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:25:38 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-307263ad0cbso7352906eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623535; x=1782228335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=;
        b=ndp/KvumIBOPJUij1xkyZMnR+6KrH8BlXlcvXGBGPvJ07gJdeFLfaQ68ce/9o5Gr7J
         nTOQwo9BCFEbirndnQCXGMjERmI4OSOMKcO2GXNwyQ6/oh0hh83yF1RXU8r4Bjy8s2Qj
         yoVJTDTXQsuyD+/xVMjwIvBsxWbb0zhiG2AE/yCz7WkyAvghGdml2XmDMvMIgKBYDoNp
         hQmZ/9js/rZhjkYjWgZH+kXRzSelIMmC8l1HLNf27YPy74IaGy/ILWiV5gIJzf+J+KAi
         UQqimw6LjweKpEKAZIgd2uxEMjQiTz3iPOnMcVyiIpn6qlLRJYuhF00Zo+a1TXIiVNEC
         VLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623535; x=1782228335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=;
        b=koANRqjsywzXF2pWQxXZFrfffESxg/MURc18wtarUs5JSyEbyORypzUR60qwbPKMsi
         kZzGvn2dIgHjQEU55szpv4osWrbLrrs+n0OCsqJ6bRlG878TEjr7sLVyfSFGu5mzHr5Z
         b/jEmiuGj+Bh151SvhiPQvP/5BtQj5GAW8tQd2+jS3WWs/PC9eZtpjAGObLOrYtnLHRZ
         9QoIFSvLNLooYLyKWbeFkA2cP2w5gfSmLmyW5n+bws4FRtR0uKnYxLKyntXdlUMh/AX8
         LgCsMkzPxyyeWuZzgWxUdXYWivaJ3KISa0maiyKk65udB4i+fUwRZANVLwcUSZQfMDug
         x8XA==
X-Forwarded-Encrypted: i=1; AFNElJ+b6PZ8b+rpZZ+MJNpH55Q+ChBmf0bqA7trcz8+KRFVdAEmqyFUHDBY+NlnHkMuLEb8zV4r2jRaQLQOfCOiD4RO@lists.infradead.org
X-Gm-Message-State: AOJu0YzzCsjx4oFz0seJ8RyMd1Jv4iTnwv/yCcO2Ns6H5zDKM+oCy/Ex
	j5oss1x3dfXX+G2n2ehqjGn6tDyH7i4MLG4jVFyu6WUof0bXHJnnGuKvG1ShDrAC0vk=
X-Gm-Gg: Acq92OFvP5vDXqsuKANFT9WMdG/XRjnrVboNBggMljSjGcdcHWiz26MrVX2vzrfQ79p
	LZaeNeXY5YjXfP8D3138/XV0VUb3XWJ+90QXHnSAi1+uA7qGVQ+n0JMhL3n4rpkYbl9itsi/ypw
	SsdJKwc/CWuC/KXNBiNtOv66h620YxjiJ6Ql4zoUTPeAKNvPQCedUnciLJK4NzLZEQujOWahp4p
	tqyiglSGmqziit44aYiyleHBf0pTe7WyRuPBZXC+k/bjDKA1unX4r1TOrzvxPBVZ59SACKFGB0q
	C5OKp/fWgc/Qk9gISBE4DZpzKBuhpWRA5v9xztd6TNoIHONLegqPoo9ppaDHTy1w7Y3E5RhSdHJ
	mALQ9cioPCBNOoA31wSESUe2TcCpZmRrF0MctZaq1qWDVppVSM5gY21NxnFeuHUjmVX+DxFsi0F
	ChRTRT1odHihKLLsEEEwRf
X-Received: by 2002:a05:7300:a887:b0:305:179:4dde with SMTP id 5a478bee46e88-3094044cbeemr8636687eec.35.1781623534764;
        Tue, 16 Jun 2026 08:25:34 -0700 (PDT)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f88bsm19695217eec.16.2026.06.16.08.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:25:34 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:25:28 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH v7 1/3] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
Message-ID: <d994f8fb3481bbb8f3972f117334a6e8aea383fb.1781622998.git.geraldogabriel@gmail.com>
References: <cover.1781622998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_082536_095008_0C3E3E64 
X-CRM114-Status: GOOD (  14.73  )
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
EP driver. The reason is that Shawn Lin from Rockchip has reiterated
that there may be danger of "catastrophic failure" in using their PCIe
with 5.0 GT/s speeds.

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
 drivers/pci/controller/pcie-rockchip-ep.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 799461335762e..9ebc227a1ef84 100644
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
2.54.0


