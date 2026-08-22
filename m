Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E87AC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+Gfsbw2LT91VcPxORecg8qTC2JGjipjq7k/HN1uFUI=; b=xueRkK6SPoJYihkxv0v/uF9y9r
	oGgpNjX39nCX2RIJ/6h9ao24mf/RSjHmlDQhtoyEf9iGOIeqR+4Xuta5ylbInaEGRYpqdYrqdZjvG
	KLQj6bMbhg+Kho5tmEMhC6Wnb7WZ+uSYISD303fmyufYmUG24VN89tg/R4BhcSvKmSmoPsAHBKYM8
	9Px0lPW8ujBZFxXhI8axgy7L57KQpL1RpMPpCf6fCZvao2K2fRwJTlrCuCb9eZtdy1k9lvFHOI4kv
	L4MKnvcjK4SkgHLJJ5rZF/jpIvt05tJUMXRGHttvE9sAASHWACglgyEldKPKMNMiUwSfcDG3uY2bO
	eMzGcQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKa-0000000EcbD-3msn;
	Sat, 22 Aug 2026 15:08:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKW-0000000EcYf-0KRh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 15:08:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84faf87d19dso1988729b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787411299; x=1788016099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+Gfsbw2LT91VcPxORecg8qTC2JGjipjq7k/HN1uFUI=;
        b=KkF0qrIRbQD17DcnINz9KPbjFpSC4Tlpg67GuRxrggjkCO7jeDbVHZjaUfSaTLtqgw
         iSaJmXlBVG6oDgr+hnpGwEo37WiE0UyN60nC5feoL6do9dkve1FWjpUbqu+6bZJfW0Dn
         GOll+WmGY6LXm7Y35TTYCjqnqNrIMOqdVq4yxUU33f2LlV3GmVNSc+yirAshPExaFD57
         LDPq2nED/m+rDEIkhtbvnwbgGECDljURc+7bTbqYIwOSCxL8oUlmjcfCt3+M8bwMXvoy
         Frl6dJB0kZBKzodayZEiGvZFsyaLKr5aBkoSv/u3bFcXI3EIam1eiPKBJxNPrPuaDHw7
         96KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787411299; x=1788016099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+Gfsbw2LT91VcPxORecg8qTC2JGjipjq7k/HN1uFUI=;
        b=mgIabX9CVXPv/WgWEHlRUAxp2Ss5Uu501wlaJwf1nAeALKUWrkHwKo9RTAavu2OVHM
         k21OqDLpT4HMcDZTh3gngG/o7BPTVr0H5lXh3TCNDCKSCw3RkdX57Ba6CX06pznyp8YN
         ULhO/JsSe4srUdsoTjq7Cql02DN2AC5c2y26j7O7rnUPFTCqHptyCeQBubIqBh5tzXzm
         P7iHkxCBt6ht3SWkHGktHOSc7D5NiQo8zQHHtX5nma+4OYQw6vJ4hNjxKUWsns4rt0MN
         QX8vsiNDsEtcAT3Ud6Ao/d2kk7eW+Zi0APbDr0twXKsS56x5JjsmIWpr38pTStVUKRkF
         1PWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0l+9HJ6ItTMG9upmxRvNiSZX2780+9LAWjUgCHlGqVPCRFJq9mmJ0Cwehd4qARQHuAKvUtuuj0lKPPJq+cWoi@lists.infradead.org
X-Gm-Message-State: AFuF++mx+g3sBL+R73yhkFaWcdjXBzm1RmaI8Nxy+JzcGqAmPf2DH1/6
	kMddGDXk7XmhuipQ37f4SpJtPgggeP5r2kaHOukuhlKQjIyho3KWgXJY
X-Gm-Gg: AR+sD10vPC84eA5Wll2SNcrTX0y9lESNjqWHJpePmosz6bXnUP5lYFe7jK0xKaq3TJj
	+xaAzMaF1AEcVjo5APR6nft6vP9kokmMsFaAT/sfC3oV6iCiPmpKlxR9S798iEq06jmAhx3th/w
	NmXUyUeRvj7Ln5RTV2KACyXK+TtkiO9QRrv53eHQZViBNs5g2Jq115ND3pJbCS2dg+coAbg8Vrn
	2xY7uxzMwoQvpLydSTdkdZW+YgjGxesA7Eq7fDbLJ5GNfDIvFCkYR8x/B73iJqMNUValO0itcRI
	54hwMyQTLozoR31w6sdOqS9MjruLERBsgdI3xIA2HcPAbCG5P37zBNEVyORzNIqiTG2h3aBRny/
	zqxjLvQ2Cngv58mmrc0motLI61U7I0kjhvDd5zpCNIHqmm/ctXrUWIL7Ag+s3ZEAR6f/uL3NLGG
	oo+MsRjS3vZ1Vv3DbxbcjjOtI33g9HikSaDd9Vruw21eqdDTrn5VHN9AoU1FU4YNmpIFP00XYaJ
	Mjfpva7ubkEH/HtTM4zDHT7cKlmc6s/QNTgVCKMYmkkf+pVJgSWuCYG
X-Received: by 2002:a05:6a00:1808:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-8520b984b8dmr9996781b3a.8.1787411299270;
        Sat, 22 Aug 2026 08:08:19 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b1ebsm628242b3a.30.2026.08.22.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 08:08:19 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 22 Aug 2026 23:07:49 +0800
Subject: [PATCH 3/3] PCI: dra7xx: Fix device links leak when
 dra7xx_pcie_enable_phy() fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-dra7xx-v1-3-23e204d5548b@gmail.com>
References: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
In-Reply-To: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787411275; l=954;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=MgRL359uSGGq2G+dbIIbcTFNFWELMsvNpKc3wpRExyk=;
 b=/wH7RY13/PmdaWC+y3rHEMhSz5gPR2a9yx18qu5QxBfXm8zCfDM7l7ShTSaTY6YWygwzHEBur
 iqgTLyLhnIBBzsUZogCfpqSjebU/34Pm6axVzTGhU5eDzfBT/Je8Qm5
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080820_130544_0F793E33 
X-CRM114-Status: GOOD (  12.40  )
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

When dra7xx_pcie_enable_phy() fails, the code returned immediately and
left the already created device links behind.

Jump to the existing err_link cleanup instead so those links are
deleted on failure.

Fixes: 7a4db656a635 ("PCI: dra7xx: Create functional dependency between PCIe and PHY")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index bf32b14436f9..5bd9d1df80ad 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -766,7 +766,7 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	ret = dra7xx_pcie_enable_phy(dra7xx);
 	if (ret) {
 		dev_err(dev, "failed to enable phy\n");
-		return ret;
+		goto err_link;
 	}
 
 	platform_set_drvdata(pdev, dra7xx);

-- 
2.43.0


