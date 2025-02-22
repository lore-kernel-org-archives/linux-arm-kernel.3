Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BA9C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFQrLDTViZiWjjLwQVlNYwRn2uOyZ5VxY841DFPTids=; b=kejEJ9IhwbxUxyDIJnDtgbopLx
	sAWLjqtbLnCvNzyWWKZYZCZPHjo+9AcYRHWWrWLed11dF/UWrWPhX5Ni+p8ytG2/6aS13/OGBL7pr
	ueZ0dJXa9wmu/0NG4SflLi/5Q04iSRMg46L75BawBFBT3OwoFsTMiqnEiPtEeUeR3Zlgqcc0kc6J/
	RYpAEM152aM+SgSawe97Gv33DzkcB3imBPpYOwiFlbLfzuewjvYDA/BOS3YGjt+ljBcOZA0THuTkR
	MyoGV6GCl8MJIYLiEOLjJTM5cZ/PpWEIAn9MPT97ijD3RyaHR8AbA5Ch0SDqBbP7h/ss1Za7/zWLw
	iAxtdRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmBw-00000007mNZ-1PyS;
	Sat, 22 Feb 2025 09:53:00 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm9r-00000007lvH-3DcC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740217834; x=1740822634; i=wahrenst@gmx.net;
	bh=xFQrLDTViZiWjjLwQVlNYwRn2uOyZ5VxY841DFPTids=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V4dlGSCiHx6lxqM5+L+E49ZrYSKJDgUFVt8zBa/ZIj5KrPXTGEuePqZfQH5NwZxw
	 Q1b6s5huG8ATpsFlFsTFfZsPfJv4evY0rNSv68r39uzVGX8FuF+gFU1bLebeOW/5e
	 3BEgmKdz/1hJs6JLjoP2dEI3A87uDvTdhsMdLBG7BNMQb5EFfJxZ2cyPE2N8TfEfh
	 iLFWKwNxEFQ+w0m68R+NYCbD9F6qi/yQYnRUY/oY6VM5Oc6VtRAWFkOd+BoRIkKJM
	 ZHBzD10jEEzyXB9NI/4boY6svLi5iRNDfaJc5zzU7v8fTa4jT/WT7klbAQQbzZSMM
	 D4SWEJWdjJySCGWvWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6siz-1tG5Xp1lYF-011EEh; Sat, 22
 Feb 2025 10:50:34 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND] dmaengine: bcm2835-dma: fix warning when CONFIG_PM=n
Date: Sat, 22 Feb 2025 10:50:28 +0100
Message-Id: <20250222095028.48818-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3nPVxWJTvQffyVtEA2wGihuKdB2cuO9l/Jgj7+4Y8R4+SEPpuQb
 NTo0rq8b5vY3W+Xn6vqu1TCwnrf5CQ7A8powy1h42s+/Fdn7ASETs50IMBWb4u3YJWJ0jDs
 iJcEcpGYssIevUlMmR3VN6psFldM77JHSodwxNOXpjDZTjwqBpqlrIc7bx8DGUKxLUQbtoK
 MXhYCbgk/b46e+NGunl5A==
UI-OutboundReport: notjunk:1;M01:P0:anKeN2AApoU=;w8csw9M7KFpulkVVFwH/BpcDTR3
 TL3AEqayjijLMp8s2uHrStYw471nBYcr3yyoHkWUAVIrkVMIfeiqINIiwp3DN7+MggyK+K7YW
 6R4e3k3CwOrDn+yBZY6LDnR17nYnjYHcQxNKNtJbUibNcMbbY+Nt9pE9MyZI07HUT2Co+eXS3
 TkPLQEqgd2qPH+QW8qI7vz2Wrg+KPs18kxValuaQw+JFXvqqvCsGurstygLPiZ+P2u5o0UoZQ
 T2pIPmfRyPLWieAkbCnDNcI9gsJOPor2CEWpaM7jxGndeModOc7T/o1ByWCAKZAvJA/Zlx5/D
 MUzyZr9IfGTjvW46labcJVOYfN1xGDMldbhV6ql5bQH81OmJOMR5qpEwEPixc5WKBVuBbJugZ
 Hq/4vX7zuh2Frwc9OVzi3qHFp5+ktR8uRQy29Xd27CzPAJse3Hx55VpL/pXBpNvWeU+K086/o
 rNxmU8A/kP8jShEiSSyW/aoJ4f/IDDVEvZoV40lpTtxTDKAthmy8QEf/tbxRAZcIUSuO1vd3N
 /ECXGrjZXMocp0mT9X7jmE3aFx6+/Q1sjbr6rkG0AriVKFUZbz06s1UED5PIAgXqvN9tdMT32
 Isu51ORYhcODj6fYDZqFfoda/nhpJaxT2mWxscxu4xuYdcXkTbp+jr9dxueYZ3nSjWxg5FNf2
 HAtpLBE7FF0YQ7nONRgTEbkz+I+tsO4fhk9O6vFZuO5+u/gPCH2ml9wm/EQcBElv+JsDxG9pY
 jKP5DnGOEKnhJlO7ldIhNjSMGRAy7uixwuZf7ffBAjTczVBqKAlHqat21wJEs7hcxos22gP3K
 irnnl8H5eluvWG8sgO1I6Vh81bqVNCGs/7FYhOaDqLFMIFrIcxtGu3GVC6eqFSvH0HhPQfV+h
 RjXVMkEc6HE7DfeyT64/teMAblGk/q4yuHbCuZx9X8Sj3hV1wJCbXgIoGmsysP7XavqY1kHb6
 9vhsG6Hw5/oEmN2JYVFt4IJih4731bEI6G5y/OlV4SU77D88By5ScYYTiMLIQWVE8bXbxlBiK
 TfLX0wGF25ZLbuciG/ahdS934uzujc6kDUDFi2DGeMxO+tePpBEntL8aCfTm3/qtMD58WN+rc
 Au5PFPUCC24hUrrfKemkRbystFfFB7LrXUk9ZMcjmHM8znowe3+8MJ33sEohsQSvDz3YSdo3w
 irhczxtq5PwYiW9Tz1X8iR5ypAaFrlbo/ZoT+pgu+HCyuhcEOarJb5Y/ISF9orQzG7m5Q6KaP
 A1vFdLnAvCR5h4vc5Pup2zc66xjR8tXI7Oy3unU4hOnb+9LPFXOclsz83YQC8CMVSt8EZ2BoN
 ZhnvyrTE51dPBOWPwNKBZ6TrqbCnQheYehxQE9ASFF4OtJplStgNb7Zzb0y8uxGxY11RQJDoF
 3nA+45WDDnD+Vt64J/KUDwTM+ZjPnGP+RAwEelUeFMk8eAGJaueSLTR9QK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_015052_111040_92DFA7C8 
X-CRM114-Status: GOOD (  11.65  )
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

The old SET_LATE_SYSTEM_SLEEP_PM_OPS macro cause a build warning
when CONFIG_PM is disabled:

warning: 'bcm2835_dma_suspend_late' defined but not used [-Wunused-functio=
n]

Change this to the modern replacement.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501071533.yrFb156H-lkp@in=
tel.com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 20b10c15c696..0117bb2e8591 100644
=2D-- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -893,7 +893,7 @@ static int bcm2835_dma_suspend_late(struct device *dev=
)
 }

 static const struct dev_pm_ops bcm2835_dma_pm_ops =3D {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
 };

 static int bcm2835_dma_probe(struct platform_device *pdev)
=2D-
2.34.1


