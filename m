Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30E9C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 12:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/WbteE2uE9evzP/bYrygew09XhuNjI4OrWKNDTxp60=; b=uEO+b7dAceElpK1Ig0+Ai3CuxI
	YIiUAZVTnVWPqvw7cobKGCvZTdt+26SBWlmVxshsdf3PU1iZBFVS067CFy5xkcGcBuwo854b/VeT7
	lSCLc7W7/lkp/ghjNs4eUctY3xYsEcmVUVnNrkncueL0zc0TA7g38Zk/mGkp85tvtgTc2sUNKyILc
	9vIpiPjYTSg/fmLlcdRaoBoU+wzcVw25kX7obzzikZYV9QvFSWjpZQyooM28voDfW5lNdE1n1SayD
	0FB1yfavamj1/NaEKvuoJXRvk05xQDWt+E0fCW4EIOs5W5cDyTA30QMbzyujEJHbTxokBPchIqSiA
	nMjsa+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGDH-00000000X9z-24gW;
	Sun, 09 Mar 2025 12:57:03 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trG6s-00000000Wgi-1OMU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 12:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524620; x=1742129420; i=wahrenst@gmx.net;
	bh=P/WbteE2uE9evzP/bYrygew09XhuNjI4OrWKNDTxp60=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fge2YdQSoLjP/g431yvO3mWevQXpMeIeik9KLizjXsh7eEFdDB8RD2CymzDQDju2
	 93ufimY5fust3LPCdmnUFGFLRAdOhSUXRjPRHiQFv/eWttTJ4ONECcFMXBCGUBZoF
	 LXvR5WHCF34nKWFBbyvGVhVgE9o+nv5ccdi2ImKTV7XsCkvi7v+mHaI+zBk7rzbjJ
	 MhMkLwWNdpvGN46Qdo3vToc1N4VE8Fc2U0P1ZTcxTB7SMsrwEZF+5eFKYxWYPC4hN
	 pd1I9Vsvh3xwwrbiNGsH8wa+dHiD0iqIAOTPRCPXRyWghYwF3XVp4mzhGksJXmHV5
	 yzjeNA62/y5XvJG/yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1t1Uu73WMW-00sfgE; Sun, 09
 Mar 2025 13:50:19 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/5] staging: vchiq_arm: Register debugfs after cdev
Date: Sun,  9 Mar 2025 13:50:10 +0100
Message-Id: <20250309125014.37166-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309125014.37166-1-wahrenst@gmx.net>
References: <20250309125014.37166-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kptK/+PtUtRYwf35RfcAu+TpPIIYdWRfjShOuBGBJc5b8NXFm95
 7OESYLU4OgTLjAOWWIcl2Q2dP307/5HHgP4np1ydmcehhYAFfBRJrVyMZhi7pdh6rsJD7pE
 NhFtvQdVnTl3HNM7gDeM3rj+Qg9MHJgbT2zzWAXK1zZEFAJMVNIUcQx5YsNpBccBn6CiPe/
 LmZ0u21+X8C/CISx1fCCw==
UI-OutboundReport: notjunk:1;M01:P0:PCguVzfA8w4=;VJ1hG7dTUxCcPbWzp8o42u+Uc69
 qEZLeEmgQxOUZZ9QdDriH9SIIUBrVXBTiS9Ls3JsOhY+3KynlMCvCRhK33gyKPjLM5DckUCxP
 6SqPzrjWgP/h4ygw0/wx0aRrFitiqX3ZauMGyAK+v0eoTU/WET8eK2Jc1vdrqcyHqhjuIT6nZ
 n8Gdpnhs/zt7XtyRdQhBPgAGoiviGJtZImHEzjEOe2fHt881/9If2wtT/q+LyEnKUacNdMHp7
 zJjHXAxzIq1hB59kxF/de6IhbL4fnMCHPJYaRLpAxv6C1tlxQ11MvI3pW7Zn5vymyR6RqFD4z
 FffrZEnZuta5bo6A1eKw4W/Rrk7tboP2EC8YFBw1bNPgIW5NlkSGU77lxvWLD9zDMPfJKEzWO
 fqvQfmDNp0GJzLeqkfRkPA6xqBtiHDdFfJ8SvnnmJpRBMHDlzTERuIYpz/Q+2zdvp9hNjReYZ
 gn6QX0L7lpUJViVWvnf2JwKwF49ofgAEpbhhFjjhNYxVwNPwQ6ZRoeCJvW4YBPOxMtgHrmt+d
 edmxAFWTtCVnEPdQSgqH+WYwYgwKBDnL/9puEAxcEHge5RbAut5fgcGHc22FOUx/WuVg+9mTM
 2KVeXtgge/9JTCXFt4waGALh1gJoqucfMKqZnkt3TeeHqgB90qWm99Tt32v0NN7Wrrq2aY44Q
 Xz3WPzhvlHIbQXD5l7B+7tjvPxhzI1VM7l5UfUX9jctq4DPpvmL5pf+1/lu66iMzDQ9Iu/WB0
 7ZPOkqoXqejFP+DoA4Ap28XT3g6HS7Tvsin/OCcXOw752ufOTvSMRX5cJ7m+zvIpd1ljO0On5
 ni6ZEAr4CLceEQovSRo1sm4zODlvrym1ia4TJCSjx85PkEJbcGLEYKs0D7Jnj5epBotMRgMsB
 2lSgYaehIqZb2Ygfn4IxhnWTQ10VWZ+7HQs79iQZjduOagHsJuBfftbC0QWAPQAc8zavrh4SD
 8/2pxNGuREzdvBaMBdiPzMewttr6OpS14Nh0d9CLeN+BWobULWKpqWWanz6JxMAFKW/2lzqD9
 k5JjBGD0CDxQ1yLyLMkkKL1JkTzUHRB69ZCzyTDCyWsBvcK5NaSPh6cHa4P1+tiFVM2uYFHoW
 KsEshW1z5Uu2BNulk7DmyBWtPd/YWGp/QWXJ5e0x+FP5ta2/+kS1G0CSwGwno+gctslavWpQQ
 Ikan3QlA13X/2oqGTEEYm8bKToX1rvE6s01jj6sYos8/VmlWog19ZTlDGE/bWW5Ojh6Xg23fy
 XFYgfj6oiriH2aJaNDvgk3vHtgzRY1r925Iw4S2IIusScCq7vI0yLL0tns56ev+Jo+yBmtfXG
 sHjkP6aFjJh5Gv9CqMcxR6hq71RzKZWQpsXx7aMHJ9uk3zYHCGjaD2RNoRAy8zVK4IC7gVUsq
 7dgzNDHTnDJ/jQy0OF/w458N2B8+O9JvKXiAMX1465wz5a7U36HLGPoi4k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_055026_667352_9F280058 
X-CRM114-Status: GOOD (  10.08  )
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

The commit 2a4d15a4ae98 ("staging: vchiq: Refactor vchiq cdev code")
moved the debugfs directory creation before vchiq character device
registration. In case the latter fails, the debugfs directory won't
be cleaned up.

Fixes: 2a4d15a4ae98 ("staging: vchiq: Refactor vchiq cdev code")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index a4e83e5d619b..e2e80e90b555 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1386,8 +1386,6 @@ static int vchiq_probe(struct platform_device *pdev)
 		return ret;
 	}

-	vchiq_debugfs_init(&mgmt->state);
-
 	dev_dbg(&pdev->dev, "arm: platform initialised - version %d (min %d)\n",
 		VCHIQ_VERSION, VCHIQ_VERSION_MIN);

@@ -1401,6 +1399,8 @@ static int vchiq_probe(struct platform_device *pdev)
 		return ret;
 	}

+	vchiq_debugfs_init(&mgmt->state);
+
 	bcm2835_audio =3D vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	bcm2835_camera =3D vchiq_device_register(&pdev->dev, "bcm2835-camera");

=2D-
2.34.1


