Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F60606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ul569IzS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Gf6FjFaO;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UuhWwFNd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=; b=Ul569IzS+vSgTd
	Xnbn6jl8jdejgdXGxwpvkzFArK8JeTxO9F/4/4H9BSGTp8Rq2pEJTGUVVojUu8KzDNWwnpaiKM3BA
	Jx1f67zrEuSGmNqh9sgYFCPHKkHMe1riH4h6DYz6AZYXG5famNjoLlHA9L4picVDwgRTW5ooIfCej
	U7Sm6GpVo3PZFV6U5iH3EfPF5PFSw+z31JCRAkxcxp1uSGJohS8GIMmMHQQ6GEK9kjNLt8m/dKW2Y
	80BbRTssFbfohtReW4tKWY1HpAjV47doa8V6TiSqR6segVseXn7JEKTXwaQlQnSBC+bHDcUa4d/Qq
	Oo8xprnUJ24crxWLYqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRv-000000034YB-3ITQ;
	Mon, 26 Oct 2026 18:29:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRs-000000034Um-3N4J
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 26 Oct 2026 18:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=; b=Gf6FjFaOlzj+pnv/17SWtzA8Bh
	GhNQ39Q7ixJ0JNd6zoFOvlYZSB35TaEr2m91hFjLcmMRhyX/tanFB+qBhu4/OKxFkZ1Wd0V6QusT8
	vk7k3kx1f4tiy7/GLZLf5FBqp1dhrp2JRwVVFj6hjVxT0UWrGslvK5g4txSnN7XTcChOIz8tBZDx8
	RTpZfYcjwHa/Me0/EuIbL9XubXzuEWXcP+gU1QE8fHzRyYmynYUO/GqgztqKJIP9mqkfB8E/paPQ5
	8p8K5Da5VzO34ySkJGzgYzrZ16oy8CKzFfuFpcDackPII31EGlV3On2U/S3UwhJam/t4hjkFRUwv6
	J/GOTwIA==;
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRp-0000000E6os-2x6D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:31 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2222663a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039367; x=1793644167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=ZCxbFrEqXUddzGlryJ7Z+qSQbkJrqT4WVAdiyoWGSzEaGb6fmE1SiK0QNpsA5m2SiB
         ZEsOAB2jitFgQcBAVChSmAieqA25K5DocoIDbU22uyi8KwiBKnq92nysdGNFGmgXcCcA
         58hNaESD48rOKXMPKSUpLRaRNNxmdKnFVdhnaVQnKe9FVZrjtRO58LGR+clmBYzp/jap
         FZQ23jAl/1CubpH+1SuqmF5FyUPsFhczT5ixj4MMvYpBlGwh5byegZI76u1fX/7yGVdc
         pRbnkNl53OfLXYHtFXyaehjFelFibNtjpMzigt8dmHWXGkTOXImMO5wjOjqycGcC6cpz
         7lWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzylmoHRRLV+yXSDPl3Ga2ewdWOIwURFw7am3hI7cKiYqwkfj5ytsQJv+A3i7vjiiyQ7Txg4UdeO0DZjlAOIWML@lists.infradead.org
X-Gm-Message-State: AFq9FYJczgCmMc8xaAkjziey0vvoT+q0gtxezzL8DIkNk/lgG9ET0Juo
	ohR0pighQX7vXj4x1qphgKADscYs98llBe0XElqGQtOqsqNIyFiMnbRgRYFYy63U2PAwU7UUCmG
	ES9FHJDL2ZyVsz34BqtU24e18U1kOEVCimfUUtiO1wGaoQ5saNEd7uqc9NGvV4Par5Y6LJLOcwZ
	PYMmGrN86Q21khHIHmma9nOw4Y7Jk5SYxkplaj6Ssp6ku18ZYAABVTmbMilTtkJcyDsVd6BtDru
	eLsF7H79C1cM+4MbQQJ06gWOwx8SPFMxuU=
X-Gm-Gg: AYBFou3JkGPLukLvnBA4Q4YJ+3lbcArjiq1z+FUUH0zvGhwYQeYNB6t/WZ/+pF0Bx3Q
	vMExT8ZCOftyqA/Lbb2dM3id9CbLbkeiP1vv524hkCdCiF5cUx+KR8UB4+5EPYdL19cURa1Cp6S
	7mBPu/dMAanKyuYgx2d2jHQSRG/VsvVWqTIuYMfsDLA9U0CN6+EXIuO+kX7HG6LbdFjZspPyZcx
	3QHOL5fMqgg4KIPEG89GMdZMRH/UycdvTue2ve0JOSz63V81caIZSDAmAu4JaZtkes5ybiNgPaA
	4mkyLc1XGeuco4ds59iWRSjAhz6+t5L7g62zZcPmaYsrI6c141EMBP3f2FEjzKqssVVkPnAYtOn
	s3sAXn3Rc2R7sePdUaXTWcbq4ZSBGRm23Ckh4vQzzeUCvyG5FCgNHXc3pnz7qbJXO8MiIPlP8Fw
	PKEo0uI/sSPkCMI8LpXg1bTq6ebofUkzQoAt0abHuQ
X-Received: by 2002:a17:90b:57c4:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3adeabde85amr6161322a91.24.1793039367449;
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784dfasm231606a91.3.2026.10.26.11.29.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so9419348eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039366; x=1793644166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=UuhWwFNdgG3GOQdsGN5DMsVGIXEacim7PlpL9U7VckVjwSbtTbH8uv9qNv8ROJT3Ml
         aPZmGZ+FDG/67YhQY7eCCQwmW+oKBn+WvwUjfevErdhtfH72CfYbRlUpM2Ct05XXL6Bf
         Eo5mcRWBypVGD+9UISJ6ye1XRL135xeiAdydE=
X-Forwarded-Encrypted: i=1; AKwUvBxS3OaOmw4iTWa3k+fUr8CvjaPsuCHz5xh7WZPKxv6SBGc3gXUrhgcOF+GasvJWFIVj1dMNNL4liF+QXBQgurxX@lists.infradead.org
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303458eec.7.1793039365316;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303426eec.7.1793039364706;
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
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
Subject: [PATCH v2 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 11:28:51 -0700
Message-ID: <20261026182856.3168686-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_182929_891228_427AE210 
X-CRM114-Status: GOOD (  15.31  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


