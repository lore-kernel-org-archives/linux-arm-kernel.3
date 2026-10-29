Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67D606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CgDJc3SX;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=azqphpkT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=; b=CgDJc3SXWm32lN
	gaBBHvWKzzzHrxNSOExLRPjagUK4H508g8mdiTuJ/ewsGMb3HT6HWrVbvIfsgJSw5YzTf6Q+T00EZ
	9p39TY0ZA8tzc7NkFIZ8j0kVRTDija19r80WUuOVcCpJAFgstQWhDZVn0XXEqXCITG3xW+EJKFUj9
	Msf6MWG+8x2nqwf8U/ojDBBKOdacp7wqz7kfD0gbmjo36G7TsqYy9qvY5cnQcnZkALrYRP1m9ZCCQ
	KsfsYfAgWJ+AgJX9VAqowDbUcwDFi0tcMSrHbhViwlWWmiv7saCHH81w+zkNiwCWAxPaNlzp5Nl8P
	8Ni94vWCqvF8t3YyLMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXcw-0000000APXC-0WOa;
	Thu, 29 Oct 2026 21:25:38 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXco-0000000APTE-1lYt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:31 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so556110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309128; x=1793913928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=ILmJsCtlNynaYVJb20ryvRW8yEXrxGtgudfkndMXn0iEWN1aIj3YXVIzSkrJrTdmsc
         +LH6IQaedSxsfkFH7ykUPFh1z2i3+9qtPyiTIURakH+ATS/KeigXilH20fZ6QrwBEm8k
         Fk32JdQ+6gKymyF79ACGyTPD6ih+IJFnwLY46qC2Iq9OCTqRVgGwc53+lp/HUWE5tj2I
         9yjDGZfgR7NGzi0FKcPzyiU9KJXa2JVwmZo5s33RfgGtN3L4Btqh5NK3R/jAETjqPMep
         TQmHJRhSJ/tytpIcQ6/AqmOexT8OOQRk8Oe5KJBQHAaxfYq1pw+KUg5SZJpbXhpAoiDC
         qk3w==
X-Forwarded-Encrypted: i=1; AKwUvBxAdw+t5bZ80rUwSGdnvvf/e6U1PP026oJLcRSPtemexG2VgAfTRg16RfEbXAP/iHTIZRxZOWecoYilzniHPNVA@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2//k4ogK46KbaKBTc/K6Ne7qQClg5Hn7pXBFYTiKR3Wx2gH9v
	I20jRbAYkLVtUWlu3mmdlmnZAIWmeTrCttKSKK9cms5cT1FHZkDzq+rvsGHPosQpeRahh15MazM
	Cr6Yt6Mrs74a6Ouxz9gYjXKb+3z61hg3sQzjfNm1FJ6uvmzzHewNnyBAnaGhQbnR8U8f8oOi9Ot
	zmh51zToi7Rcj2insPXgmVyKBpQvOVgZ+OsMKkGoIFjszOYWu2txCnAahA8qemvpmOJA+mh61Zd
	HfMyY/el2D8RdrLrRawVf7ZFxfGWeKAPdLwFg==
X-Gm-Gg: AYBFou1ORi8vp38zE+QXlGcRTmFhwm+St91dNduzqPHn8lKE6OkAs5bHBhkXYUK0KIj
	DyKdkeyVrmG51E5lUxRNh65Xw4IbKb/Epq3i6rd7r3d0dFKG+IofLXUQV+zuk41e0MNNxfGPufM
	bSo14jnjlwT3mOw2jF4m6/tHUAPhZNQevrL/FKEsE0At1wgaKxWlr9nKl0gwLgSV6KSdZOAzgdX
	iX2HExWmgLwPRE7FSedkBgZ3J5jICOCH6UC2v/o63ZHSe1/LJ01CXMrWCDOxOfloYA9Azy9ROuJ
	o2ouAnuGU5J6v+DpV2zXzkfGrYnSQCMxcQxh/yJ1qAk1Bfhu+prN58ZKRHiDlamAcLo3tXTJBqW
	wSJ3gNwyxAXU7EnMXORwM+c3uD86MQBBiKnvPZD+GTlxVaUNrvt479tAzgNySc1v4RmNBUlBCE9
	cwxlPXG7dCb5U1W1DytwE1LkCT0oes3kcd67bdVBdx
X-Received: by 2002:a17:90b:4fc5:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae8979c4e1mr103917a91.33.1793309128118;
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e8b50f9sm2916057a91.8.2026.10.29.14.25.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c938148eeso2353406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309127; x=1793913927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=azqphpkT/pj4cNryL7IxJnBCiNZai02+7F8k7xmlIRtvPlqCsEWhIOvloxKXg/4Oxi
         hs9SUVsMDA1y7Qqs7SEcSGIjy5bv67XxwbkezeMIXOfaebjsk+xi5tcDOjs9E1DrD6xa
         H9Mpqg78xa/wYtD4hqNbnYpZSdqg1IHxj6TuE=
X-Forwarded-Encrypted: i=1; AKwUvBw1W+nYv4CWg3FMCXLSuhbkpExhhwgqNBzt1Fgj8hiGbqmOC7cMy34ddJCCGWOvJiLD7mHE07hrJq3v6QbGVuGv@lists.infradead.org
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500616d6.17.1793309126813;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500336d6.17.1793309126431;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Thu, 29 Oct 2026 14:25:08 -0700
Message-ID: <20261029212513.4126083-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142530_474832_A7BBB82D 
X-CRM114-Status: GOOD (  14.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Northstar Plus has one PCB register aperture for both SATA ports. Its
per-port OOB settings use separate banks, while the PLL registers are
shared.

The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
stride. NSP previously passed the shared base directly to the helpers.
For port 1, the new stride moves the bank selector from 0x1804033c to
0x1804133c in the AHCI register window, outside the PHY resource, and
prevents the second PHY from being initialized correctly.

Exclude NSP from the per-port aperture offset in both read and write
helpers, preserving its existing bank selection.

Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..b5fb9dff1ae9 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
 	void __iomem *pcb_base = priv->phy_base;
 	u32 tmp;
 
+	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
@@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
 
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
-- 
2.53.0


