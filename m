Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4BEC54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgA266d6mN0wLbwU4K4/xF9ifPb7dX3urcchZvPMovs=; b=3dooyLeovUXfMpTJMdi/51SIJs
	I+niqfNuAKpbYZIDsx7HduwPQTh6qFuTKhQgfs/Xvg4UVeZ1fdi/5w3pYXtvSoIPBIWzQtwiHecq/
	porff36lKHe/L12kHzPi4e/2x4w4c4gHgrqDRTSHK0VhGcXzNP1xLzor6HxpEnpVCh1Lu89MWe6jb
	Aw2iGcL9CE7av1jjPOItxSsqLPIZy//tLGhyDdO2ATHemj5dUFsqrubKlyfbjTeSELK3FIwRqioQO
	BIgmXZabVMluLAOx9g5lSHqkAfDSCMUmPt28M5iBpDKoQIwl7xttdWP2ZyWQkJ+8aSntdrPPS9CkZ
	4OVaWxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH88T-0000000AZqe-2Tu8;
	Mon, 19 May 2025 21:35:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7wv-0000000AWMT-0I5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E049629E3;
	Mon, 19 May 2025 21:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150CFC4CEE4;
	Mon, 19 May 2025 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689784;
	bh=2y+Ih0YzpsawfkOfFrpKV58vdTkM+6PUkQz/ckM/Q3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGCHFKr5uayY8oleaIQ6wihs5suNKChFgPF6NGVLrCmR/tj5vTrzo2aW0MLOokJow
	 RZSTrZLjaAbDHJw0UuSdEMXgCaKg8OpYKSJVYVGvqR0Pwadt9GEqMUUmKQkZS3L/uR
	 OjSXnCW7vql+SdR236MJU/HwhQ1+VLC/auYjY7o/JhbSt+HtsZwWNkeGUCakSN04Zg
	 XrIbKv8sw0wKSfEL+Yu5ITmJGNH7kApRRC20s7FFN5+RqNlnMnBJUfbPOaT5DeTyRG
	 Zkwg8HMAP6/b/7889pmzbNEbVXXRwkWl3RC/k2ef/Ds+xpy5Pqzl+O4zxmjzroO1Sb
	 fMRhmICadWBKQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/8] spi: spi-sun4i: fix early activation
Date: Mon, 19 May 2025 17:22:52 -0400
Message-Id: <20250519212255.1986527-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212255.1986527-1-sashal@kernel.org>
References: <20250519212255.1986527-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.139
Content-Transfer-Encoding: 8bit
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

From: Alessandro Grassi <alessandro.grassi@mailbox.org>

[ Upstream commit fb98bd0a13de2c9d96cb5c00c81b5ca118ac9d71 ]

The SPI interface is activated before the CPOL setting is applied. In
that moment, the clock idles high and CS goes low. After a short delay,
CPOL and other settings are applied, which may cause the clock to change
state and idle low. This transition is not part of a clock cycle, and it
can confuse the receiving device.

To prevent this unexpected transition, activate the interface while CPOL
and the other settings are being applied.

Signed-off-by: Alessandro Grassi <alessandro.grassi@mailbox.org>
Link: https://patch.msgid.link/20250502095520.13825-1-alessandro.grassi@mailbox.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-sun4i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 6000d0761206c..6937f5c4d868f 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -263,6 +263,9 @@ static int sun4i_spi_transfer_one(struct spi_master *master,
 	else
 		reg |= SUN4I_CTL_DHB;
 
+	/* Now that the settings are correct, enable the interface */
+	reg |= SUN4I_CTL_ENABLE;
+
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
@@ -403,7 +406,7 @@ static int sun4i_spi_runtime_resume(struct device *dev)
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CTL_REG,
-			SUN4I_CTL_ENABLE | SUN4I_CTL_MASTER | SUN4I_CTL_TP);
+			SUN4I_CTL_MASTER | SUN4I_CTL_TP);
 
 	return 0;
 
-- 
2.39.5


