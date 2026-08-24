Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB732C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8YaeJXoEsR+KIxdOfRdm9BJRSQRSpPIKEb03BqqpcM=; b=1gYbPx2t311OFLlnqUWpnpYIB5
	Hnw9EEd5AaRQAkXhq431HFRZzIafPXDtUij9NcvpVlSCQ6f339mBPAR0k1vSVnrG3qiQ/WeWvybeq
	ebJJiJg8zSGuS+oNEK//0A8nkJJzS3zFDpCRxitmpugU5hX+7h9tKmVE9MGZ03/MxEpCKeaKqwlWa
	LYY18wn+BDYbn4tmT02Frf5snlLIVPHVls3gGAduMVnnXBT4V4eHa1ysIjbTva4QeZlVq0+/+EELx
	oXQli7Pocft3kIw19qgm/wnRSUnVFARqKArAm55TJsdUxRPn1cCguJGKykUG6w7LKEXPm08J6SMph
	qZOVCZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRcF-0000000GMrE-2QRf;
	Mon, 24 Aug 2026 10:09:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRcD-0000000GMqZ-3WjM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:09:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ce7d2adef4so43292735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787566157; x=1788170957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8YaeJXoEsR+KIxdOfRdm9BJRSQRSpPIKEb03BqqpcM=;
        b=aSawtg8DUp019LJ2ubDZVm+GncsJZez/LS4bH3YSDebNZ1MRRgaIOWlAszQ3gyDpGD
         dJuGteO+Mfr+ASkZN/9U/7fRox82BgWll/6u9O9d09EWz+Cxm55mw9DGsJ0HgsfSzpG/
         Sv1f5ntDW0JpZs5MMvPMne24sby5AWXNmYc+FFEyJYg6FF+3RuvkdJWT58QIVMlbE7kH
         ub5ST3xRDK7r39jBovrFwp5aoiMJBP+9wN9GXiUkISU3jX1zTB/hOboLwi47t/ozFlwE
         +VaTFaq80OFjViMj7GmCamlvwmAobrULlzknlWl9fkUIbkTMiac963ko9fiBEqT7Ue95
         izwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566157; x=1788170957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8YaeJXoEsR+KIxdOfRdm9BJRSQRSpPIKEb03BqqpcM=;
        b=drHOwSaeMsVLaVEFA6HlIp3NODmFUX5VG2LfMhD8/EkB0OTgyJ+RgOPxDT0MvW2Lt5
         OATeIObcycQixeg1CWQ8fuGv7oERmeN6XaoPGqk5YqAgaUBuGOaN0AdD9hxiKB9GnSrc
         jkJ5kkEnKrYPEVsZUzPc7Pt+GoMPN1ZP9JrvTHChDAqlm5mPvdsA/JO1qSsUaPgOvavj
         tUGm43EeufYb5px72nlCe5GsU4WwDEHIZoQ7KvMVhtQFubTXBuPgK5T0oUw0fpS9QjNa
         uBs9nW827o+RLwoxXHqAWB0q5XxazXePR1/52Zf1f054Klzn6Ctm25HtUyJNSCtdeVHV
         I9jg==
X-Forwarded-Encrypted: i=1; AHgh+RqrLquONxejRcVvOCmkjA9RMYbaJzZ6Vh/haCdPHOnRtURt7mj0bJb/J/Augbw0GcdtrFDOFu0oNaNrUP24PEkO@lists.infradead.org
X-Gm-Message-State: AFuF++kVzBFlH0buG/jUYdgnUtJZDGGOgANRDQf8yGZv7Qr92smvKiHC
	3V16KSFSegDvuvDzSLXvCmkglYKSoVELNECpx66Vwf9zzQcxkZyRi9E/78joKA==
X-Gm-Gg: AR+sD12t8YQpWOCv96b51viUjU86usJoJo8yRviD4o/wyo224XnYc3C12AaoiaLLcUR
	8tbSd49nTjbEyk/7ZW+au+bHbFDoaqDsUcCoY9Bl5K/qvIXZAS5/Ioe3oMBt2m7mKg6bi+RouoQ
	wB+D8zDcyWaX3GTqZ3sOQ1zP/Shi5dxxES4bKV6t9nnKkqDf0WewkTY0gUYZJusjofWcslk2CKN
	S60nNusXg4ZMfFN7IRsKLtVQ6HqlTJsLLibQY1OzcH7bgbb8daQvvajqsGet/rHmgeFwENswNoO
	xvK06SI0okPYqWH4aRaEW0QXcYqNyJFF+bxfJnkFbo+ErEUkeIZhwMIA2TVcj8urYEayTEPwKh8
	JKuYKQ/LJ2IggaFm7WrG2E4TytBUFiLLHGiAjpnn/Nx9iK8AiLIY2KeO2r9YYwj+z2nlD0D24pl
	apA0SkIUi3bNi49f2q9u8kW4zzmTRyEvk1wYyb9Ph6QHCTjBQkzLNGt//Q2jsMgrbHYOOUhk35t
	rtAuZCmidcaj08Vf3GhFSBDkCt0IJThASBdlYCJB+xM9/0goIcI4LhLLXMNa7mZXxLnDHOJibXW
	mx6Z
X-Received: by 2002:a17:902:e802:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d64b0c8bb5mr447392395ad.10.1787566156947;
        Mon, 24 Aug 2026 03:09:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761beasm15666115ad.5.2026.08.24.03.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:09:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Roese <sr@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
Date: Mon, 24 Aug 2026 17:09:01 +0700
Message-ID: <20260824100901.31675-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_030917_881229_9E857C51 
X-CRM114-Status: GOOD (  13.49  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
The current code checks for -ENXIO and therefore does not detect the
failure.

Check for a zero return value and convert it to -ENXIO.

Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 42174249ef61..942454e29488 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -996,9 +996,9 @@ static int emac_probe(struct platform_device *pdev)
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->membase;
 	ndev->irq = irq_of_parse_and_map(np, 0);
-	if (ndev->irq == -ENXIO) {
+	if (!ndev->irq) {
 		netdev_err(ndev, "No irq resource\n");
-		ret = ndev->irq;
+		ret = -ENXIO;
 		goto out_iounmap;
 	}
 
-- 
2.43.0


