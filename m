Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C9CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ssQbrVnKF7op2GL5R9NuBDcc9CEDLMmM16A9tAh/aJY=; b=eXfaoU18SzlLTD2N7GGe5lLLfU
	I8b6/4x4WcaTAjs6ZD89NraXfPBdw4QozlvEokRmzZBc1DBTE/OHxKzRpwIo8AzG988xrKPmUMpRy
	ILacv01ww/EVNEEqv6In5A+QFZ0p/t6NsNMuQftIHhdkE8SuObU1FTAqfip4/UQHdwS6Vqmf3OETI
	bUy0b5Ioe9+4T9URd4NA5aROZcFyyevIFCfcpe4PHrNUTIEdSNKlZOuzXsIYWbTZfZ9tsOOzZKq0Z
	UghhhN1DsoO07k1g+PdNS96itqnHEgCPNL10wDPYEYVonqMdoikydJZ54TI0LpjfSCUYI+dYeqxq5
	0ahL/yFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxlD-00000005p3H-12t4;
	Tue, 09 Jun 2026 14:48:59 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxlB-00000005p28-1U1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:48:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423efad617so3174009b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781016536; x=1781621336; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssQbrVnKF7op2GL5R9NuBDcc9CEDLMmM16A9tAh/aJY=;
        b=L87eaxGhg00wwJ3ExaJt7o+I78Qv0WdvlPWpmEoRgOqhemVz/v05d24+aqr0zXFf6z
         YgpANUEk0u4SLqpws563GVInHaFYIVxeuyrOOBbnkdUSl+xY0T9c9ZavYqQxm0+gyAfw
         PpD5J9062RHjcgrE5xW7YhhVWdkwLrD6ROIZTtaJeQdmE9LtTu+mnyP6bN67R6osmoR6
         saDrtlwaR++AjdwQjFvjNOzMRbRwptkpdsj8K+94pNZbkQO/1MVIY0aYNZpj/riUJcS4
         jMtcU8Eg1Y+9urtWvL8JWLBW9YM0CvFeWVf7J6X2v6S8HL7u2uqWbTedpup/O/1/4KvL
         ixeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016536; x=1781621336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssQbrVnKF7op2GL5R9NuBDcc9CEDLMmM16A9tAh/aJY=;
        b=sreAERFyPEaMOrpof3EhZDnMS/pGUWAVSDzzLWsM/0Fft3zRVwOi8BCbXmujoT119g
         l8D20kS0HSj4o9y3H8phtukPnTcFhEfZTbVLoN1dsYc4xF6BwW/F6+HHWEXl2h11tw/Y
         IpqYlNMbk1vrPYm3tEmyt1EqIlh+3T6IojZ3w9Gt5i3Pcl2FBc4/yID80Dftk+7PVCyJ
         9MHS8k39psbG2xiSONma+0b13w0U93txUCueRgWVvRx1/Qw0kmvDDM19kQUUEWHGbaVY
         xIEjNTToX3u3a9Q4uX+iBcH7nugDijQ39PukGcz6j/TFi1e5h1d5R/1Zrdq8HyCpCsdn
         4AVg==
X-Forwarded-Encrypted: i=1; AFNElJ/+u2vN8Cv0bFVC2d434JJRRCmAZCaHcp4GS52x2YPGlaSQgDfdfMnr/lVCfT5LfiSgLEESkgbwmn8Q5h9I/mZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ZMciYhSMy40gUwaJO6KQ7wdjsTbkR8srcsCaesVfA34j2uEj
	7Mseyyg9A2KprazmBUv8AYj4uImrTHBrf1OoeyxxOzUIfKdYHRm+lUMT
X-Gm-Gg: Acq92OGVQGpKHnVubSsVNPgpiA9jgGAgqlGGrkyltXD90ymIhazFX0+Xx6OWana6CKC
	7nyptOqt8atH3pUmHRe9q3JfvqbsNQkO02D4gkTUoFRZs8cD4VrJeJPBXS8KwNWUGxv2L6wAgww
	YUpfKKDbzBE1X+/jrRcMBFBgRToQMDLJIzzLlgBmlntnSXXas/xIr0B2RS62Xq4eFmMOkyBn2y7
	l/gZhV9L289jcrSi3EJDbgv35aI/sBu46YyKliCGT7tLoFAIZAXESYCx4pYBAE5gr0xvhH3kgZh
	oku9ev7E15Qu2PKwg/LXB340MFFEUysoDVQgcumOBUAg8QjC2s0niTzkHDPNMWT2jvGAqSCPIy+
	sgqD/NR2lWkso48l3YrtzOM2JUbcPKSo/8loTa7oWFVfHpxJuD+Z9Nfu0QAXhmeiNYgVIJfgxcL
	UzCCNdAKaktkQ9TzTTdZsCIL9OYHTbPtrXMSMcXMKcfnBX4xtwSVjy0+PhurBPNlA3YRiR0bJv5
	6x1eWtUiJpc/nsOFOuXw356fH0f
X-Received: by 2002:a05:6a00:b92:b0:842:5ad6:2d3 with SMTP id d2e1a72fcca58-842b0fbbe6emr22139626b3a.38.1781016536024;
        Tue, 09 Jun 2026 07:48:56 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm21143237b3a.0.2026.06.09.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:48:55 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 09 Jun 2026 22:48:50 +0800
Subject: [PATCH] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use synchronous
 PM runtime put in reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
X-B4-Tracking: v=1; b=H4sIANEnKGoC/yXM0QpAMBTG8VfRubaaqTVeRS7YDo6EdhAt7264/
 NX/+wIwekKGMgng8SCmZY7I0gTs0Mw9CnLRoKTSUstCTIdjsQ6X0LkyuSkaZbsMYr567Oj8rqr
 6N+/tiHZ793DfD4YB1ZZsAAAA
X-Change-ID: 20260609-lvds-phy-6328389a2cf1
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko <sashiko-bot@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781016533; l=1367;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qLlRgnDvVIOGIOwv8hJ8MxfIWNVhS2goiG/w1fmsMUw=;
 b=IqL5DMF0Ti3kRukr5DGbKVt8A7KSEHSGptH6E67EIOU4j0g9Yu1SDjO7QRbcHOnrcXqMeHBzU
 PQpAdcIsTQLCXQP6Uhk/S0u3Lyo+gHKLtuX1gKBcIq7tpfUcFXUei0V
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_074857_398794_AEB4731F 
X-CRM114-Status: GOOD (  12.11  )
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

The mixel_lvds_phy_reset() function pairs pm_runtime_resume_and_get()
with pm_runtime_put(). The asynchronous variant queues a work item
to handle the idle check and potential suspend, which can be cancelled
by a subsequent pm_runtime_disable() call if probe fails after the reset.

Switch to pm_runtime_put_sync() to run the idle check and suspend
synchronously.

Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
Reported-by: sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260605-lvds-v2-1-3ce7539d1104%40gmail.com
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..e2a1645000ae 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -286,7 +286,7 @@ static int mixel_lvds_phy_reset(struct device *dev)
 
 	regmap_write(priv->regmap, PHY_CTRL, CTRL_RESET_VAL);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 
 	return 0;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-lvds-phy-6328389a2cf1

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


