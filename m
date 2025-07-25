Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94630C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwSC+xmVIES6nj+1a81sSHqaAHSEmrsC+d7iOGrRylo=; b=nOv6znWawxNyU9VDcFNAstGz+1
	+L3FQElhqQQeT7aHYkvK8IEj/Y/nSgyXLO3OrveaZsvC3Ezdat8trcr+dX2MFzT9G1QiVanVdojez
	CKtq4UkD1Rt0+i6AechUSFfmFe09G+nP1pmiyNh5rpKC+HNbiWdQGKsst+V/hMg2Qsjr/KiD6c4nK
	ybxR7V3/jBtH8GJbF4mr+q6g1zBo1zEbEaq4zpC3Sxh6m19mLJXlKa/BfCvYsNTY1LT/zJZgOTtoT
	5loIvo33+OlKqJHH2erilgy44ihu879Psx+dcHhmx1OHy51KuHxEC7+0rscJDQO809BjtMtHXw+IG
	rHkuU/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCc7-00000009ElC-2BA7;
	Fri, 25 Jul 2025 07:13:07 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCXG-00000009EBY-11mH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427286; x=1784963286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XwSC+xmVIES6nj+1a81sSHqaAHSEmrsC+d7iOGrRylo=;
  b=AgCi/4j1wMUZuI4CuJY+65gS2pWU0WbWnEJvePiiScKYEW7gwHueM+GF
   QQVj9INTqcJxYzZppZD2UT/12w2/iZTPY+Y35etDg0fbBofWADBhaLj9P
   ApOWVTIuML8QqDu4ISazhCGNf9YzcYy0ox6vnaVzjkGHCsCKiZUHklSKS
   aAdFf/n3CAyxq7sW9Q0Fk/m6qjY8W8tCfRjrIn6wgtx+TBH50KooEGzrn
   /QeMpzlMIFQE6ZwGgexOzpQRaZfqlNekE6BVnYvzGD1QQEtgnGXTB7NRU
   9fMjSM0rIii5qkAe8lXKFe9uQju0DcyQLzCSW7xALiZn52gQNTEkl3xuL
   A==;
X-CSE-ConnectionGUID: h+qPiIYfQ4qbBN9e7JX0tQ==
X-CSE-MsgGUID: AghS5NPgSGChX8c9uv8wDQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414668"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:05 +0200
X-CheckPoint: {68832D55-19-943DFC15-D71A48EE}
X-MAIL-CPID: 6648D9629072FCC338F99289EBC1854B_5
X-Control-Analysis: str=0001.0A002103.68832D75.0025,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3D4517365F;
	Fri, 25 Jul 2025 09:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwSC+xmVIES6nj+1a81sSHqaAHSEmrsC+d7iOGrRylo=;
	b=piZvWWy30WlbT9jMg31fqOmt4K1lc1f4DnhLnAmBKKqLgTKbSgCUKpJfDAkHS5BHjPSch6
	JxjYBqLjTDntiju9znT/pM1UpyBG+zFD2QmoIwBVlNdwZMmTs/v/NrffSguWnE5mS0iPsB
	2HsuUUGvD3fXWBPoiZTZJGyKXTQVek6FdpHGFMlur9EwNyUAvX23uhzozXvk8Ty3boXdGr
	tDQY7ho7ajsQwPK7H7esFaOwXz6mEOPOF1DPQAFIujtyKZeU5/4tgAjiwCGlJzj0UieTNY
	yx1y/LKmli0pSqMLNzgnNm9As6H73k/4S5QP5bxEaRmoZJSIPYhkciIQ5WlMAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mfd: stmpe-spi: Use module_spi_driver to remove boilerplate
Date: Fri, 25 Jul 2025 09:07:49 +0200
Message-ID: <20250725070752.338376-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
References: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000806_591073_54A56EDC 
X-CRM114-Status: UNSURE (   9.49  )
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

Driver implements feature of module_spi_driver() manually. Replace it by
that macro instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-spi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index b9cc85ea2c401..7fee64102cae7 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -141,18 +141,7 @@ static struct spi_driver stmpe_spi_driver = {
 	.remove		= stmpe_spi_remove,
 	.id_table	= stmpe_spi_id,
 };
-
-static int __init stmpe_init(void)
-{
-	return spi_register_driver(&stmpe_spi_driver);
-}
-subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	spi_unregister_driver(&stmpe_spi_driver);
-}
-module_exit(stmpe_exit);
+module_spi_driver(stmpe_spi_driver);
 
 MODULE_DESCRIPTION("STMPE MFD SPI Interface Driver");
 MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-- 
2.43.0


