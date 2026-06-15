Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77284CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OTBv6R/3G1uCLiky+ruAoiaz4p72UU1rBx31/thiEMk=; b=arPhhEn2Lzo3bg2gKt5B0oxlGU
	HyUzr/qK6NT4XguIdBaKAuTUhXpf7BumHs85cUmuYCHvPU9vE5r0DGPO1G6JvA5khr9sYKxdZR7/m
	UVA1IZeSYZBrrFcu3roThVSMf9c3wolBbasfMpHF87gN4qwxKYC/9HAnUQd/544/nH9ejOBfYDpRf
	4LytM0jmppXtWkXMlAn+7X1MWPNYNssPAV0WV/tnmCg9WXoQ8fhf3zzvwSi7U3YSTwqo/9Di71R+F
	erLodyt/wo2eZuuVexWKdkzwfU2rWVDQ3QeGIv2harGtJd3HhJQxjfDn/KTwUxLJQgx2w4pm3mU6G
	GI+uJFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBNY-0000000EgAj-2feK;
	Mon, 15 Jun 2026 17:45:45 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBNW-0000000EgAA-2LsR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:45:43 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-91588056619so259805985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545541; x=1782150341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTBv6R/3G1uCLiky+ruAoiaz4p72UU1rBx31/thiEMk=;
        b=jiGiU1CL0Knpr2GaS2kmvbLxjK6zaHes3aRPqoWNUDtm+59W2t47uc/WrigmEk2M97
         0gquYC0YuszF7SBU+fZrwXgS6LAFH29/X3GndvL336VezvGz/Gtrs06akYWUmjjcqkgJ
         PbiVrDklfzeZTFArJRK6d9bOHqbRApFt4b6AV5ZwWXnPlmOM+XMuGuUg/0OEClDiAS9/
         n4Jj1nOaMEbIhsHDQjzpR+GMin3dfu1zg2xCII64FTVXCrS10CTgcb5GWB3H0pqfbC4l
         MfTlAETcuDvpNGVtATKPQgiYa1aiDm3ffSqtM565zWIfggU7W/LwaiFpkjLvp07u9rLf
         3Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545541; x=1782150341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTBv6R/3G1uCLiky+ruAoiaz4p72UU1rBx31/thiEMk=;
        b=raVfKNzoFhizrRGpltEYYO6D5UWtOvTHiJqxqyV1zXr4q1CWL9ziiB8nPAx9ydqcTs
         8AklI15Os9J6IvxBDovfOL0p2s7ABYbccM+wtMnRMDuF2ZSRuimshfZbIlcTnmjs7XEJ
         FyiWMSBw9qGMFNu/CUcrbNJJowZE92H5j/Vq09Pl8dvkEFV4XzLTU0TYiy8Vp2Rbiacr
         K/9vkygidPb98YCCWAON6LXe91cQMbLFYGENugvVKOAuTrficAjTP119q1l/4pNgC76S
         VhE8644jKmVY1eLzCBtaUJiKv6+90DSCV+/PlYLtmaFV2p5NgXTZ8CGUfchIXlksxVdi
         OZqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qdPOUE9VV2EBL6AtZQMzQRQhWFi2hN1BhCPLbUhXw30/Kx9saAm4qVJ7t4KOaNU5FKuJnAk9FcnNzea5mTlBl@lists.infradead.org
X-Gm-Message-State: AOJu0YzGy3Fu1vv9wmAy+/4hGIQ9h8ukUrUwS6hSDdD0B3m0VNWgnOi4
	FSFyTK+MZYMK7wrl/K8F0CQ0usqaGRaBoDWv6HY5HCTdliIajsgjjvNh
X-Gm-Gg: Acq92OHH4gUlHbn2G37DuAl48ztGD5NfoMDIrMgMgnhSAzKkux9C44qGOcIQyJwwHDL
	GYIVtqQRKF1BJqg/zLd8W1eNlJ1e67fmpFw18ewAcLfl9JkxZpqxVeIXt8lifaX2IP3CQPlEcMZ
	SIHor99wA8J3sdimOWThOAfAxCzieDHYxZQ3aQIdrT8G1Xol/O7SuBXuOeIf+64U25TigOXckI7
	Dr2aIvI5Zghvw83upto0XXWO0dRDGVej5HJIkpFb42G0HAi0joCH1zWjeLMrFSVz99Ef2gUKdn9
	ZkGMyVuQ7KrjXUgxE6MOMHLsKN2YvWxSaBeES7WcAYpVwzz4mLbPa+At7GZXwYUStHl8NwsMP5+
	856qncfvMc711oQUWZd3YXMGBaZ2NM4u551g1LEO0SL9pkpgtwud283NJtzRyDyYvCI7Javr6iE
	XDTAP1xC7iSR6qVdlib7mbNqQnSg5d/Wbz8xrkoQVureB2MtKluZI=
X-Received: by 2002:a05:620a:4688:b0:915:fad5:90a5 with SMTP id af79cd13be357-91c48a33205mr8247185a.54.1781545540422;
        Mon, 15 Jun 2026 10:45:40 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a035849sm1176338185a.33.2026.06.15.10.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:45:38 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx: avic: Fix OF node reference leaks
Date: Mon, 15 Jun 2026 13:45:35 -0400
Message-ID: <20260615174535.701013-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_104542_631178_37D77E51 
X-CRM114-Status: GOOD (  12.25  )
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

of_find_compatible_node() returns a device node with its reference count
incremented. mxc_init_irq() looks up the i.MX25 CCM node for of_iomap()
and the AVIC node for irq_domain_create_legacy(), but does not release
either temporary reference.

of_iomap() does not consume the node reference, and
irq_domain_create_legacy() takes its own fwnode reference for the domain.
Drop the temporary OF node references after each use.

Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/avic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
index 3067c06b4b8e..6873a50bbe2c 100644
--- a/arch/arm/mach-imx/avic.c
+++ b/arch/arm/mach-imx/avic.c
@@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
 	mx25_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (mx25_ccm_base) {
 		/*
@@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
 	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
 					  &irq_domain_simple_ops, NULL);
+	of_node_put(np);
 	WARN_ON(!domain);
 
 	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)
-- 
2.43.0


