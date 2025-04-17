Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19854C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbgHw/Yv5Aq9gCeInFqbhIc3xJOL5Vf46M9l/Ku/zlI=; b=tN0x8eckBXwsRS2KdK5/3/+2DP
	+uUNrp5LquE1hQ/ltWREwwyQlQag6bZqY/EyBJil6MEJ2FgyVNeDgndCgVqOinYB7zcvTsFR5XlLh
	EYaIRnJoAdKUMcne47f0ncyBWmsQPt5LXn2Ggj7s+zpvXiApXls0n0zwKmB1v6iQ8ssfT2wsZR8+H
	HOPFsgwz1mh3lxLc8I7Wujj4pgrbzgL98gPfC6mbL6rDCYSL8aM5T9iNW9yOyN2n+24qzU5MfGWaN
	PuHw3XIRw46SIhX5bI3ICtgTpxUBaNatfhSpo9/r+9cA+XyvKQwey3Vazod+OjHInx2bQcWQlwc5u
	CNWKFQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KQq-0000000CFTz-2zla;
	Thu, 17 Apr 2025 08:17:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KNW-0000000CEy2-0Y9t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 883B049C8E;
	Thu, 17 Apr 2025 08:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56139C4CEEC;
	Thu, 17 Apr 2025 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744877625;
	bh=zyU+Avmsupi03n5Di+kk3CCOVSwpjgJNzIO0CDPpUu4=;
	h=From:To:Cc:Subject:Date:From;
	b=JMUsly6CkJBosudFvHyYQiPEAS77Sz/TzCUbyo3NPgAPy444unATlz2zFtmuFjd0E
	 GIJFNBF4NPTOeACGcAQINWkdlACY1DDuvm2J/OzclZ6D9Ii7NNTfEoee+Tn42CKUm4
	 rtRH8tQPuPpAKKwK14Er0QO0iCBCDotee6A8SdYN+z/t1iTZfPaTUZftaCTUk4S/Iv
	 93LWgZCuGzM07dviRIyK86w1ED9b7+qRmFG5vpV42WRw2u8jTsO5fPZZOkVtaThLaQ
	 k5fVV+Up9ZKHe9nbaysX8EOFL8IjJz54oNxG7GH0x0Lg1dqjgvh7Ebd3UQ1JQD9GlZ
	 cBFEhsfzpL0NQ==
From: Philipp Stanner <phasta@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] mxser: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 10:13:34 +0200
Message-ID: <20250417081333.20917-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_011346_186265_786A38B0 
X-CRM114-Status: GOOD (  10.91  )
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

mxser enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_region() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Replace the call to sometimes-managed pci_request_region() with one to
the always-managed pcim_request_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/tty/mxser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index 4d45eca4929a..2fc13cc02cc5 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -1812,7 +1812,7 @@ static int mxser_probe(struct pci_dev *pdev,
 
 	/* io address */
 	ioaddress = pci_resource_start(pdev, 2);
-	retval = pci_request_region(pdev, 2, "mxser(IO)");
+	retval = pcim_request_region(pdev, 2, "mxser(IO)");
 	if (retval)
 		goto err_zero;
 
@@ -1822,7 +1822,7 @@ static int mxser_probe(struct pci_dev *pdev,
 
 	/* vector */
 	ioaddress = pci_resource_start(pdev, 3);
-	retval = pci_request_region(pdev, 3, "mxser(vector)");
+	retval = pcim_request_region(pdev, 3, "mxser(vector)");
 	if (retval)
 		goto err_zero;
 	brd->vector = ioaddress;
-- 
2.48.1


