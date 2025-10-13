Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5570DCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdEqLcBLcu0rrR/SWYch0sIhMvB4hwBcLPY53w3Zt94=; b=jpo7C+yYL6bitSr5ajoQ1Zk5Az
	WahxN+TGhYs5jNLj4gPKFhhhmi5QKVH+8l7S1OGY95qCEv0/hXdC9tswPeTuG0pK6Ej8l6MpsbeNq
	TOR9qMt8KQEgrYHXUrS5ML0PtkHwd0Wao0onOmzKNbDmUuiN4BepMjrQ96HIgM6XT6mBi42QAn6nE
	o8IRXr/9O/ZHDz0sc/no2I1J6DALukcPwROE2tDcAcqINavXoLgmDAW8k6tYNxg4rPswe2ExEv4w8
	8eWWQFhPHwyFTK9dDfVn7Y8vPEWo0QtwHUwPH9h122ASb/Qq/rp7K5U7MVeCf+ikSMR5BBDA+CsRp
	aG9MnJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2G-0000000Dnov-1C7H;
	Mon, 13 Oct 2025 16:04:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2D-0000000Dnn9-1w3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADC4F62096;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B83C4CEE7;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371438;
	bh=1msbnw19IZ4ZHbNE1uvoShSsPtMAyhJKh5i9EIHWbqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tcgrY57xbQJPNoedJMEgxY56xS2Dm6qFSuAVD6JQtugMah1NTOWGkBFet1tA7mYr2
	 hcFVE86nZuHst2FuW6t7Yiur7XYMbMYarRPG2mehUIn4l8SukgGmalv8lIOSmQDiic
	 vn2FKnp1A9CKQWew0xxh4fK2w+oUoEZserb0iyNf3eFj0D8jFczYucy8awUTW5kNAw
	 kx7tUerxkiwL8NlmG0vZiM9HwPJv08VneZ7+5PZYhM5FfMM3IabxhhzFacw8vTtU0S
	 iwolXKTNgV8Sxw4VxT4cMZ4Dg+ejuz5WkwmNkZXdxBAssICyV4iqQ7GqNwxmQZ2LR5
	 ef2JDTYXUrWcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC9CCCD18F;
	Mon, 13 Oct 2025 16:03:57 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Mon, 13 Oct 2025 16:03:26 +0000
Subject: [PATCH 2/5] usb: dwc3: dwc3_power_off_all_roothub_ports: Use
 ioremap_np when required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-b4-aplpe-dwc3-v1-2-12a78000c014@kernel.org>
References: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
In-Reply-To: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=1msbnw19IZ4ZHbNE1uvoShSsPtMAyhJKh5i9EIHWbqU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zbpae/bNrM77haON2MDD4TO4Xn+02Np08KvjaX/pDm6
 agtv8naUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIwT1Ghum8ydkWR9aZvDTb
 9XX+WrX7JyqTp57NK7yitn+aitrXts+MDM+2F5uJx3e9/p7rF3nX0ztgtapY7M2w75G+d1IeGLm
 6cQMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

On Apple Silicon machines we can't use ioremap() / Device-nGnRE to map most
regions but must use ioremap_np() / Device-nGnRnE whenever
IORESOURCE_MEM_NONPOSTED is set. Make sure this is also done inside
dwc3_power_off_all_roothub_ports to prevent SErrors.

Fixes: 2d2a3349521d ("usb: dwc3: Add workaround for host mode VBUS glitch when boot")
Cc: stable@kernel.org
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 1c513bf8002ec9ec91b41bfd096cbd0da1dd2d2e..e77fd86d09cf0a36161c20ad3c83f10e67099775 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -37,7 +37,10 @@ static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
 
 	/* xhci regs are not mapped yet, do it temporarily here */
 	if (dwc->xhci_resources[0].start) {
-		xhci_regs = ioremap(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
+		if (dwc->xhci_resources[0].flags & IORESOURCE_MEM_NONPOSTED)
+			xhci_regs = ioremap_np(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
+		else
+			xhci_regs = ioremap(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
 		if (!xhci_regs) {
 			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
 			return;

-- 
2.34.1



